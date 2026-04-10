Return-Path: <linux-arm-msm+bounces-102671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKDiEhPQ2GngiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:25:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5C23D5A3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D11FA3039833
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D2235E55D;
	Fri, 10 Apr 2026 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWzGM3WQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4pby/NM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132ED34F48A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816209; cv=none; b=eA8D7kd3DXkp9JjEw8l+0elJSU5tj3r/vJjA2H7aRM8X2U6Z4LD/cGtxNmA0IhPxMQ6KQsoqYLJqViXokObi6KJuzc8oRh+FoIXLPVOSqc5Y7lE1L12luJcLLmRKl1s87oFSAVX+cvKhdHhKY9lnDzJexmHac8GrHA6XoqNJucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816209; c=relaxed/simple;
	bh=tK+6dhkESyt0FrN38dVAeRjm5dFErjPyTdH2KYDm+Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpjJ74TQVCkFUFytmyCJBBL1UfFwhMLqQhFFUjp2set/QqikteMTcGJBVrt1Zr9TciKF3HPjZKR+sdVIOp756eQSni/BUk6fKsKcE+zrgMMdmGDtqErKRbiQr+A3ehNeaAIiCTfhukpDM0oDKLFfsJdhXq7+cEsv8obXlKJeTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWzGM3WQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4pby/NM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4qhGA2698249
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWLLA9vRgMxLzH+R7T6INqv0GkwFLsTjR10pSbI4x0k=; b=LWzGM3WQFiAU6RJR
	tY+utxEjkSbrUkh+oCfMPUEip3mr5IU5MUs9rvy+Q0Sweo8DjNPzls4lw5jA0vMe
	AV/mfjWUPxuvkuSKqCu1n4NV9f2wWLcABtvwqc8uGeqbmxht7jsb2V3M5QQglWHD
	oiKk8oTKd5hNQLNzL02ZNHytIfs5TF3uzjTGpp3anltCrvaGhbXDH59ofMADu/0D
	wykL2rzD/2ucsx4sGjEsIE69Bv1nDK20oaNRsJ1Tw/nhapoBSmwLkSnhnV7E7IDd
	6ZgwC7caIvvorbU8qrlp/rkjfdh6VFkCsoaHZuvHrsUMOFfe3UN83C+KG2Y+bu9l
	CWw8yQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9tqw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:16:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d92f8408cso2327489a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775816205; x=1776421005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWLLA9vRgMxLzH+R7T6INqv0GkwFLsTjR10pSbI4x0k=;
        b=a4pby/NMK5z5KUm77pb1zWdxoZkpsWNPg9TciaMl0qK2KHt+lNnIpKvr5cEEEUMIAF
         6rSq8M55aAEqOMqrRJ5gvX/Qyk8jqP3AmVMwQ6R+ozIxt7aIkXls1YRceWsJFYsbV/jt
         hfUFWgH+PPQjJ/jtVf3FSWLaZN0QJSd7DSDqJyMEcWXflitokc9qhlDleGPFkWkSgVUv
         VBp/KuaVE3t7YX0SpY3Pq8zAvyplnCeVA1nK8fa8SctoaY/Ay/sjITslifmpwfq/JY33
         O9hFtTV+gebGi4btoYB5q+iinXdEmsiN+A20ME0XNvWlL6UlCp7PEXvvWLj8fW2fAr1n
         JOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816205; x=1776421005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWLLA9vRgMxLzH+R7T6INqv0GkwFLsTjR10pSbI4x0k=;
        b=PEs6VqFS3bG/IBWjeoJRfjU6hTvkzgS6s5xYU8q9jj/XNLirTfFSgYAMIcYNLc8ZW3
         rOHlSWc6TXy7KW9JxI6Vh2HUg9eDEXS2TYZ3NAYIUt4kYGNBSt/rjSRYkV917ttQxaHB
         5W8FaeRe6X2UhZfG53/lyy4wqnJrlNMZky7UcZ5tunIBp4nf2HAg/B4TvrxuMG/vhlSy
         utIYmUSHLNkmF5sFivaNDcwX3R3eqavg4zSIr6Vv4gkmhnwj78YBbuxircod3YP08PFV
         V6k+WPYsPWwVrF0ZXRs83p24d3TcGso5OmuBy8OLVWYUTLpYx0JfLipmZgciZ45UanJ0
         murg==
X-Forwarded-Encrypted: i=1; AJvYcCWCKnKsSiFiRrVT6zpSSm/HTMIpqcRS7YdQWK0Z3g0Ng8Oh2KQR8DezL4sRUR+yi4ASN7+t8CW/ceDHeOO1@vger.kernel.org
X-Gm-Message-State: AOJu0YzopubF2PcgkVjrEdzWd84xGi+dsU2cMcClAUCK+VcIDNUqZTZN
	/63DkLEWCxUoqepI9xpU3oboDaPOI/ghUHRyxDzADW+GS16FoDpVxNNPVMjet4AMYyQVrIo4NNm
	6hs6YCvQ4Lt4V1HY54JCnQ5zOtL6yikBv9hhhgCYPIKBl9VwQqh2gFqsn0tRH+7o1yKaT
X-Gm-Gg: AeBDievdrmBAxBlIV2QhvLgtXhHLnJDXca9HAV33D2gQbSiiJzf1IXIKYiNg4Hn9jC5
	qfWndLHVLjpVNSVaC4lF4FCAHCE8krF9kj6qboICsLtvqQ1mWx8oJMmanyk3aTmQe/pzPWIyQSI
	1EWgaKtgmWPUJ5nUdXnC14watOwVXHURFnYxJ1/orI4CS0v8tEjDAbim8imlF+fn3BQBC7YgkwD
	v6CYs+HQuKBeGVhEi094I64dJW42HAZOLpMEVC2CQJLV8drmQg9laNGERmbWJ9h4dbozd+WL4bw
	xCcJW3xOWI3JSvthRwFamvSkj8UUx4lVbWa0lezRLOpI/+jJ2g37BCYzHb+0i4Yzdt3IsLN9476
	YEd5aty+TMItiumbLPEqgiTRL2qNkGGuHS8MvmtgLiX9isJzV7CcJZlI=
X-Received: by 2002:a17:90b:4fc9:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-35e42815bccmr2699512a91.15.1775816205341;
        Fri, 10 Apr 2026 03:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc9:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-35e42815bccmr2699460a91.15.1775816204836;
        Fri, 10 Apr 2026 03:16:44 -0700 (PDT)
Received: from [10.217.218.160] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e4517fsm984703a91.4.2026.04.10.03.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:16:44 -0700 (PDT)
Message-ID: <587ea315-9cc2-4ac8-919d-fe34b076f63f@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:46:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] i2c: qcom-geni: Avoid extra TX DMA TRE for single read
 message in GPI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
 <818da0cf-06e8-4a26-955b-67a3d5392e91@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <818da0cf-06e8-4a26-955b-67a3d5392e91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NSBTYWx0ZWRfX2mSRueDwCmNR
 FLS+qUUqY4hsLfL04+zmXXqkgSR/5cM6DLEvjwfrpKDhUW+xMauCHNqeyTyvGvswRWByL3LgVvi
 byDi0u2i8QvOkA/178hf+7MiN3d6SF5K5AkbYTZURczY6NOsMXlP0r1I3PJu60JVdEsEpBoHnW/
 M2derZxxVLFPx9uMfKORDmyUphctrSrRSRK9LQk8+toqvwkvu/I/N1ok5AJOiqbg99M/uc4E7Qu
 uIPoesCixjZrk5mZ7iaCkSoyK1mZnqpE2qe56/7zDXxH9DiWdMV4NyLCCqAnVe9cOorm4fCVOzL
 OI8EGRszOKgfmjVg2Lx8xEUq9oJMVmQF0pp2Opcl9SMytwETGUTzYRyxJrnITIpQ3uU5TvuZtnp
 k6uKQBqOcYzm3/3JTvIKotCftcMpM49NK5qeXGTH67qBVFvC740mx6LQAO3vGlEhw3clszsLtCn
 sZqWi4pjAaKPCdzhRjg==
X-Proofpoint-ORIG-GUID: bkz5C5EnzrpyV97sv9bBT4Pva7E8JtVW
X-Proofpoint-GUID: bkz5C5EnzrpyV97sv9bBT4Pva7E8JtVW
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8ce0e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=v7GTtkQuv75T_6NhELgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102671-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E5C23D5A3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 10:08 AM, Mukesh Savaliya wrote:
> 
> 
> On 4/3/2026 2:11 PM, Aniket Randive wrote:
>> In GPI mode, the I2C GENI driver programs an extra TX DMA transfer
>> descriptor (TRE) on the TX channel when handling a single read message.
>> This results in an unintended write phase being issued on the I2C bus,
>> even though a read transaction does not require any TX data.
>>
>> For a single-byte read, the correct hardware sequence consists of the
>> CONFIG and GO commands followed by a single RX DMA TRE. Programming an
>> additional TX DMA TRE is redundant, causes unnecessary DMA buffer
>> mapping on the TX channel, and may lead to incorrect bus behavior.
>>
>> Update the transfer logic to avoid programming a TX DMA TRE for single
>> read messages in GPI mode.
>>
>> Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>> Changes in v3:
>>    - Added comment in the driver for better readability and changed the
>>      position of 'skip_dma' label to allow dma engine configuration.
>>
>> Changes in v2:
>>    - Updated the commit message.
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 20 +++++++++++++++-----
>>   1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index a4acb78fafb6..78b92db7c7fd 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg msgs[],
>>   {
>>       struct gpi_i2c_config *peripheral;
>>       unsigned int flags;
>> -    void *dma_buf;
>> -    dma_addr_t addr;
>> +    void *dma_buf = NULL;
>> +    dma_addr_t addr = 0;
>>       enum dma_data_direction map_dirn;
>>       enum dma_transfer_direction dma_dirn;
>>       struct dma_async_tx_descriptor *desc;
>> @@ -639,6 +639,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>       gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>>       msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>> +    /* Skip TX DMA map for I2C_WRITE operation to avoid unintended 
>> write cycle */
> Seems you are missing writing important point - For read message ?
> Important is to clarity what's the condition we are handling, Skipping 
> something is anyway clear from goto skip_dma.

Sure, will add more description in comment for better understanding.
-Aniket

>> +    if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
>> +        peripheral->multi_msg = true;
>> +        goto skip_dma;
>> +    }
>> +
>>       dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>>       if (!dma_buf) {
>>           ret = -ENOMEM;
>> @@ -658,6 +664,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg msgs[],
>>           goto out;
>>       }
>> +skip_dma:
> Better name - skip_tx_dma_map ?

Sure. I will change it.
-Aniket

>>       if (gi2c->is_tx_multi_desc_xfer) {
>>           flags = DMA_CTRL_ACK;
>> @@ -740,9 +747,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>       return 0;
>>   err_config:
>> -    dma_unmap_single(gi2c->se.dev->parent, addr,
>> -             msgs[msg_idx].len, map_dirn);
>> -    i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +    /* Avoid DMA unmap as the write operation skipped DMA mapping */
>> +    if (dma_buf) {
>> +        dma_unmap_single(gi2c->se.dev->parent, addr,
>> +                 msgs[msg_idx].len, map_dirn);
>> +        i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +    }
>>   out:
>>       gi2c->err = ret;
> 



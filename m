Return-Path: <linux-arm-msm+bounces-90627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB0sCSkOeGmzngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:00:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFD8E997
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 353403008312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 01:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3839204583;
	Tue, 27 Jan 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVGt4FFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCPwugi6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8539FD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769475622; cv=none; b=cEPaIh4FQoJy2CrWq795uHL4x2zF3Zh/FmGPfVEXuBcj4/L3sFyoAT/0s2R9ShcalHplIOqviC8Kd/pqD5aDpUplhqWjvvJWopy4O4WJIzbOHx5zY/g97jas1SrKPUYcsrxa3GSlHwEb+UFIIIDvqisO/LSt1u+2TICSHTm4pUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769475622; c=relaxed/simple;
	bh=WxwTfFXAsuih+PQRXliaSsQl5lTmDSjf2LiJtBhYEXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcp2zarEVrHHpTE5pGpvMaYo8wFhXlZPN4gEEFyloXjn9Ko7PIP/hwcMk5q47gADcg0g4P6wLoqxJ4GVHd7JASoEPgzAqNmrC+J5Edt2aa8JAUgbd8ezPATasEY/Znwvinj0pYyfrLa63hSftDOBRpFQsYl937UfvkMUQI3YrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVGt4FFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCPwugi6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJxi3912689
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=; b=HVGt4FFjbj/3VHu4
	xzK73t2cgsX5J4O2BpmRLKYiR751UJpO1Oh6hjO3KHz3/+CIRYP1VfdkExKqHea3
	g7Kgr52yaYsLxAuL4QUhuSYUzwyzYJ2mXBE8ix1JFHQ5epijG2Zoz6x+zl6ucO73
	XpJkv7J6QVftp5PejLwp36dl1dMyo/a65ivsdo4Q1ogvgKb4BJCw09x8XWvcd6uk
	NYlce73KGvvUAaoIiTicA6KEJ3laOg3YO+ewoovXVm5GSHvVCCh7DDg2tOOhGIw1
	QXaKsdyC+4Ouih1zQ5mOu3598bUAHwYp1IcCNei7wB7pwKUn58O+Vu150qNyGU8H
	qIoTLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3rpcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:00:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a78c094ad6so48594955ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769475620; x=1770080420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=;
        b=hCPwugi6jTcndUASTrXGKw4Ful+epmrL2ySsMcv6TlSsNSbNWi0GS/Zw2DaMsU6kuB
         vcC30pJkcrisPsVmtYzRH6rZGv1w3PXb3kKk7SKaxMB6hq9vjSlzKsDN+bHXKB3+rnyJ
         vrf0V/tN3yBEeqnkoNRWTkfxcuDbAg1vUT7gTdRUneEC+T+JAYXN9fRrpDbq+ZEIu7kH
         QaUA9vTbSIjodXqwzGDYKVFmO6S5Ye+R5zc6Fs75fRpxRNWy4XHIWgXtIwhyYyxQcsl5
         Re/rSEixgH5eUP3UPvK8wl1aaxxAMtjiKk7uzdXTPtxpzhinkgftb8ObxjYT4NjhYp/0
         ybHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769475620; x=1770080420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=;
        b=fOAaIa950Tz8e8iUbUAHqAtTPZC4t+p9bKsT7fLpXGfmftup9Uys+tOl3o1yqidAYE
         inu5ikFJBnC3G+B4ntqrOV7f63S/AeGrSUR+YLBSqreocLK8YkLXRIVsNQIdyRWPCJga
         AmYgf1B4gK+wI58T5zLU35xMOtQ3v66pPOFKYC5F7VWicMFKRIw5L+sfrjvoSK7BuQw0
         FQ3JoOC8EXiNPlf0RTbuf2dJLGz9P6z0u7ySH+yf47WlTyiaKGCOPMGRUFjVKZDDa4i+
         ldV5wresOqO2OsCWoPNiboUxwuem9dhsUF9QsXN86ifrsSjZ8kpsEA3h1hkMbwp/cuEC
         ZqqA==
X-Forwarded-Encrypted: i=1; AJvYcCULme/RE6Evg9nXJHdxzmEJJkxG84zAez/CAPBi2PThqqvpp3NpZadsNRnoL3ROlSyds7YORSkQGpI9Wd9D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oAPdtgVJcrbihhBIRwfIgZjp9kl7GJYJULPnR3bZ0p09Beej
	rxOtqwC6zF7x1b/lxTV2TLslY/XfhJiM5lJ5dHKAsR8Eufgwc+5b9bkIKiSBneb8Zy9RPS7fMXz
	b1y2+K1Ir5eUUhdHdT5/u4J7rAiFTTQSb0nGN5eFmM170ywVTP3lYqEhIAgNaqJYZlxou
X-Gm-Gg: AZuq6aKKY0Sw5KWk+H+sfN+xKGcy97YifqatYK8ujxfdkysrU2BcfgrmJGAd87Ss5LH
	7Usiaf9f4Tf5TMtvGewffZncSjvRdkjYngtgkwQX6erF1o6z9rTC8RbqYvP+BD5jw0wTHGqr49a
	g4X4R2aGqMywrvu2EWOO+l+yn82L93G4nhXU0Gi4T61ZPFXhrCnuQ6QL1udqCxwt6+L3brpoa5D
	5JQvZu/M9tQBzjGqLSI41EQKZy0n98wGNZHp5GAoxso33DCrpWmxrK43PmZsHEZ/ZcR6SGsCwuy
	fnX4zJ5JcqemkFy1ETnV8NyZgEf3QvYfCm6TtJj1BX0dNcbsFjhxhk4TzxcKgNs2IjrBo8lrHPf
	PI2yx9ws+9H7LyD1wZL6sPcvrptgyFMuJVMZ8aRXQHhwT9oVQEAh1MAPSwU0Xl+dXfT8yYRPpbI
	E=
X-Received: by 2002:a17:902:dad2:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a870ddde7emr100405ad.47.1769475618961;
        Mon, 26 Jan 2026 17:00:18 -0800 (PST)
X-Received: by 2002:a17:902:dad2:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a870ddde7emr99805ad.47.1769475618168;
        Mon, 26 Jan 2026 17:00:18 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd781sm98605985ad.24.2026.01.26.17.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 17:00:17 -0800 (PST)
Message-ID: <bb391648-c7ab-4c43-8bea-c0fe1b6c3e13@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 09:00:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
 <c046085f-82e8-4a77-93be-c2a8d59db97e@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c046085f-82e8-4a77-93be-c2a8d59db97e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3DHVKFlu2RRIXXsOOFBbrYA0_WKhZna-
X-Proofpoint-GUID: 3DHVKFlu2RRIXXsOOFBbrYA0_WKhZna-
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=69780e24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JWV3lzYn8tzaYNbzfnMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAwNiBTYWx0ZWRfXx3GXen6f5EJl
 gqtPw+itF/N98PxvVcxihwf72QUsHSKe/+GDIrHD7s382B9tfD4OHgs3Xb4XUv4OpvcbFVJddZC
 Bi4IJ0slrN7XuePXydZnnSChQ+7g6zbdelXGFtF0J+gMcGJ9Fkh05/ozG/8Cx+pfO0u7mvUJMa+
 S96k+oN7SHmmHtRh8/N5RqvgYMu5P0L81+XSIxws90sWDCX5RfVNJmsjEe26IeqLELrLffauzQc
 Y+D+xKl6tC2scVRWrw5WY6p6bwdnhZtQG8Zl4shqMG2ViNu7/vYV/P4QMn7KTiGv1tRPfZs1nIO
 LJgsYYh5AjMzawLe/cjYZwsaBJ88cZ1FiQAnRy5U7Y8ATItv8wPX5bEDGi61vc2FTqC7J9S7f7q
 FmozGzsoQvOzKYoP/iABRBtmM/dg3VxIpZ3VOnrdSURtSLrVriyE6S00T2XyUuskFBP6nyIDDUw
 YE0RXCZhrB99jAQyd5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90627-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBDFD8E997
X-Rspamd-Action: no action



On 1/27/2026 12:10 AM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Refactor tmc_etr_get_catu_device to retrieve the helper device connected
>> to the TMC ETR based on helper_subtype.
> 
> Please could you leave this as it is and add :
> 
> tmc_etr_get_ctcu_device() ?
> 
> It doesn't make much sense to refactor something that is a wrapper for
> a generic function. Please avoid un-necessary abstraction

Well noted. Will fix it in the next version.

Thanks,
Jie

> 
> Suzuki
> 
> 
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 +++++++++++++++ 
>> +---------
>>   drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
>>   3 files changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/ 
>> hwtracing/coresight/coresight-catu.c
>> index 69b36bae97ab..d3972619cc96 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata 
>> *tmc_drvdata,
>>       struct tmc_sg_table *catu_table;
>>       struct catu_etr_buf *catu_buf;
>> -    csdev = tmc_etr_get_catu_device(tmc_drvdata);
>> +    csdev = tmc_etr_get_helper_device(tmc_drvdata,
>> +            CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>>       if (!csdev)
>>           return -ENODEV;
>>       catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index cbbb15648fb7..16a4562533d5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -844,28 +844,37 @@ static const struct etr_buf_operations 
>> etr_sg_buf_ops = {
>>   };
>>   /*
>> - * TMC ETR could be connected to a CATU device, which can provide 
>> address
>> - * translation service. This is represented by the Output port of the 
>> TMC
>> - * (ETR) connected to the input port of the CATU.
>> + * TMC ETR could be connected to the helper device, which can provide 
>> address
>> + * translation service(CATU) or data filter function(CTCU). This is 
>> represented
>> + * by the Output port of the TMC (ETR) connected to the input port of 
>> the helper.
>>    *
>> - * Returns    : coresight_device ptr for the CATU device if a CATU is 
>> found.
>> + * @drvdata    : drvdata of the TMC device
>> + * @subtype    : helper_subtype of the helper device
>> + *
>> + * Returns    : coresight_device ptr for the helper device if a 
>> helper is found.
>>    *        : NULL otherwise.
>>    */
>>   struct coresight_device *
>> -tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
>> +tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
>> +              enum coresight_dev_subtype_helper subtype)
>>   {
>>       struct coresight_device *etr = drvdata->csdev;
>> -    union coresight_dev_subtype catu_subtype = {
>> -        .helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
>> +    union coresight_dev_subtype helper_subtype = {
>> +        .helper_subtype = subtype
>>       };
>> -    if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
>> +
>> +    if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
>> +        !IS_ENABLED(CONFIG_CORESIGHT_CATU))
>> +        return NULL;
>> +    else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
>> +         !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
>>           return NULL;
>>       return coresight_find_output_type(etr->pdata, 
>> CORESIGHT_DEV_TYPE_HELPER,
>> -                      catu_subtype);
>> +                      helper_subtype);
>>   }
>> -EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
>> +EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
>>   static const struct etr_buf_operations *etr_buf_ops[] = {
>>       [ETR_MODE_FLAT] = &etr_flat_buf_ops,
>> @@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, 
>> struct etr_buf_hw *buf_hw)
>>       buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
>>       buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
>> -    buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
>> +    buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
>> +            CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>>       buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index c9a82ff6cd00..7690a70069da 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -471,7 +471,8 @@ static inline uint32_t 
>> find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
>>       return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
>>   }
>> -struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata 
>> *drvdata);
>> +struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata 
>> *drvdata,
>> +                           enum coresight_dev_subtype_helper subtype);
>>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>>   void tmc_etr_remove_catu_ops(void);
>>
> 



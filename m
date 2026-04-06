Return-Path: <linux-arm-msm+bounces-101916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIGUFfI402kwgAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 06:39:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E143A1734
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 06:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DA313003725
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 04:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8D930EF6F;
	Mon,  6 Apr 2026 04:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDX/karK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxNpd9NI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F202FE075
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 04:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450349; cv=none; b=sJyfMQhynhTOWK4LSYAKH6MdqU/GRLI+P8F/v6WCH/mgkTm11Wi/4gNdDUC9uEaMEujNrFefO/oZRxIXilTwBkV4tIh3Q2LnSDc3FD/itkDGYai4uuHHynoe1BihLDnp3wghqEzZAk6nPpMwGQBIHDiP+eS8rzaNM3u7lEu1MWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450349; c=relaxed/simple;
	bh=hYzlhM/t+dDRTUfbfx6zAk8nn50uMAuvgykUfLAEznw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j698jTg56Ta4wCF1ZzqjmaRYSY5mwokcN/mfgF6CSNAZekvJuG2BHltGlbkloR/ble6bunRxdzuX1TVLXFQs5o68oaprF/GeLbD45cVeoCyL9+CMWbo5Jfmmx1M+0uINGbVn98vUUEXW6PFAfiSVvXo3VqHEm3lCFqT41ynE178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDX/karK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxNpd9NI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635JaNuR3450012
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 04:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErGZ9VGt485klsK/g/5Yj2oyGp2dAuXoJriTQiswEyQ=; b=aDX/karKvYmPtB5E
	ZFzkJ4/tawXZhF55uWZwsPOFHXAirMRJk4eEple/+0j2HijDm9BCh2aithOdvobR
	zBqot8XcvpYSnhWCiNfRyMLbZpOK8r5NAuS3rkZ+iUDsOnA6EpQuKbz+EoIXrNLR
	p45gI5vvbbdKDPNW81FIL5SfBswQV8ELidtvugTxbDlPG4RbCA8zLtXfi/lFk9tl
	d+JgZX5/h4krD1m7uakjeutr6xSEn8xqMRDpuztTyvkMGFQvMyRcyzhqHarmT/w7
	r66Nwi3RujeDn8f7iOFL5UISgbIb7190ZbCUiWeoI6XOhDucZA7lQoPSRoaN3+wr
	G39PHQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthbpvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 04:39:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so3838402a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 21:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775450346; x=1776055146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErGZ9VGt485klsK/g/5Yj2oyGp2dAuXoJriTQiswEyQ=;
        b=AxNpd9NIj/lrjoffepMv7JI4iTlDDPS/pSa7Och58+vOHW+2drPdIUpMws1CJDKA+p
         mCQZQzcmFjGjZZ4YkY/HACvdgwHJbT+rZzilOMsOO9z5asDv5ne7kjGYHykstIW+2LhS
         AmiQVBFtAUpFuTB3eI1/BsF8gAGLTt4R0cR4SpLDKFcQZmQ1CQXuiU1VyimVlGfwpJn9
         bB39mYrWSohAmzTAFa3bCKy66hv1kkWhmHu49gA2L9PFyQcYmDCxCF2JlkDol8Er3sdG
         QhtO3TmIk0kp4z59PbEYIS3PBh9zYY3CNh+xePR1+orJxt134La5weWqQS8uNtybNYk5
         TcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450346; x=1776055146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErGZ9VGt485klsK/g/5Yj2oyGp2dAuXoJriTQiswEyQ=;
        b=R3EIzSWT+84RZEkS9qt93FDmSVgb+N49Z1jFLEn8zqRZrG4ERSBryfZxLyT2MTbay6
         b78Sn6sNv3acpYO8O5W5MRdW4JvUhzuzQonnWxeKddSbWHuNsmTUmm0zjJeCnp2r5UDv
         XI/YdjHW3V+lJFE1p/OPbjSTLFrRl3sUhds5jZqttPlMTyIRr3Qjgr4+c7WY/ZWzQdTu
         T+drjGnK2u2tJLAa/aFZD44xKork+vLlP1o3fhVgpDcwM9xXC8/JMa/oDz0D8zxgAdYg
         Y4n7r0K7PStwrI1yoZ334e6ynJA3hqVetj7YlM5hLxZkeobgMVeqswE6M+vSoZ72+NcI
         T2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWfmIdtalrCWbc2X2I0ePCpZ4P8rzWRDLaxhsJtSE7rmHIcJ3v/rwQ6BtdM9+ONzp4sjTbBtf8V8tjmQVC@vger.kernel.org
X-Gm-Message-State: AOJu0YzhW/PfmLmH68E7Wur9Ri6QB9zx5Xw6/+Nru3hlfBAaXU1yxwr0
	HLz+am2q6ETGbtQDYt3RVfjK2sokvjyk6L4P35twwgcgDQ4ehG0Pwi2SO3bmcKmjnDEHB2Q+Gff
	WiNlmV90iVFX1l8wnU6/qAt17uGh+NIcmiRd7lGmPztrYghOk5498oIGQVnwNZZLxvZ9J
X-Gm-Gg: AeBDieue6ifH6m3YqWkHxUE0GHRl9M6U/O/hm27DN4D+dzUiXuaRkSJHS+mrpMjFoth
	qFVLMi0q8fgIgQswD1YBCRxh7qAhBWDSwpfn4ikwdqoGf+SudJG2XY5YRSutkJzkb7KtVv9Ft1V
	7ghOL8HgrJ504ST+VFdrG5I7uH/PZ0TeB8Tvox0WvJgXYmj/9CwKYcxnCWK4UVOD+O5kUPfsBW1
	SS1bxUPqCcIbKB/xRqH0ucK4NIx0S3mycBh6mvb0mLfWDy8tckcnikvTlRk6aF/yr+2cyFy50BT
	lBAYdG9xKqeSswXSxnm+63CKDXGJfNxj12/TvctjpoH4b6tvdtIuVHWqOR7xX10/tYp2ujlnYXK
	nUgAvj1oLBrVRcBf6w+IOnxtxZ8JXl6QqZlD+TyOwBzvKk58aHg0M0jaL
X-Received: by 2002:a17:902:d2c6:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2b277e566a8mr124146685ad.25.1775450346414;
        Sun, 05 Apr 2026 21:39:06 -0700 (PDT)
X-Received: by 2002:a17:902:d2c6:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2b277e566a8mr124146525ad.25.1775450345888;
        Sun, 05 Apr 2026 21:39:05 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm162456115ad.28.2026.04.05.21.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 21:39:05 -0700 (PDT)
Message-ID: <818da0cf-06e8-4a26-955b-67a3d5392e91@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 10:08:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] i2c: qcom-geni: Avoid extra TX DMA TRE for single read
 message in GPI mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA0MSBTYWx0ZWRfXz3ZbAov20Ax9
 jSEE5knFw/3zOoLq4KmIbIPCbytVViB7pAQTmdv9OGHGfS8DA7Z6vuexwS3MwrjDbfxqTy1mHVG
 NU+BT35kuT/Ag9nbpQyjPce6F9sfZP3AdRLHbLIq1T8wbcub6XwLE0W5RwNCWG1i7G5qdLSdjHX
 r3hNdcxYrSNEMeI3k9MAnGbX24jgwMz1YphN0xM3tzNaYpuBCWsp2JweybcJuls1yIaaybYuo+9
 If5ejKUPPqXSKfYgXNz4WCkDvxcxRKkfvkY0MG86vT3NPTvI6S0SyIUDX+OiTnk3H/YWAfY+A+R
 u1Lv0aHNAKTanhV1UOukxV/DAEyHgA1G93GgGGPbxhkogV3LNVSbaWWENSaPJcmhZOSeULQ2wHS
 e8ca0r7FQZKSPvZ8yVcJF71r6aZqhL+4vDHQYwrPSLAFCjyblzWL7bzbQQ1q6hZiXi64QEWkGoz
 GHsVvDQZm8pFQaqOsNg==
X-Proofpoint-GUID: 6MtkPiSMFVAtoe6cym4Z4pZQxvVh-rag
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d338eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TIcjmxIkOcpZypuolxMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6MtkPiSMFVAtoe6cym4Z4pZQxvVh-rag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101916-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54E143A1734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/3/2026 2:11 PM, Aniket Randive wrote:
> In GPI mode, the I2C GENI driver programs an extra TX DMA transfer
> descriptor (TRE) on the TX channel when handling a single read message.
> This results in an unintended write phase being issued on the I2C bus,
> even though a read transaction does not require any TX data.
> 
> For a single-byte read, the correct hardware sequence consists of the
> CONFIG and GO commands followed by a single RX DMA TRE. Programming an
> additional TX DMA TRE is redundant, causes unnecessary DMA buffer
> mapping on the TX channel, and may lead to incorrect bus behavior.
> 
> Update the transfer logic to avoid programming a TX DMA TRE for single
> read messages in GPI mode.
> 
> Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
> Changes in v3:
>    - Added comment in the driver for better readability and changed the
>      position of 'skip_dma' label to allow dma engine configuration.
> 
> Changes in v2:
>    - Updated the commit message.
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a4acb78fafb6..78b92db7c7fd 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   {
>   	struct gpi_i2c_config *peripheral;
>   	unsigned int flags;
> -	void *dma_buf;
> -	dma_addr_t addr;
> +	void *dma_buf = NULL;
> +	dma_addr_t addr = 0;
>   	enum dma_data_direction map_dirn;
>   	enum dma_transfer_direction dma_dirn;
>   	struct dma_async_tx_descriptor *desc;
> @@ -639,6 +639,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>   	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>   
> +	/* Skip TX DMA map for I2C_WRITE operation to avoid unintended write cycle */
Seems you are missing writing important point - For read message ?
Important is to clarity what's the condition we are handling, Skipping 
something is anyway clear from goto skip_dma.
> +	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
> +		peripheral->multi_msg = true;
> +		goto skip_dma;
> +	}
> +
>   	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>   	if (!dma_buf) {
>   		ret = -ENOMEM;
> @@ -658,6 +664,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		goto out;
>   	}
>   
> +skip_dma:
Better name - skip_tx_dma_map ?
>   	if (gi2c->is_tx_multi_desc_xfer) {
>   		flags = DMA_CTRL_ACK;
>   
> @@ -740,9 +747,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   	return 0;
>   
>   err_config:
> -	dma_unmap_single(gi2c->se.dev->parent, addr,
> -			 msgs[msg_idx].len, map_dirn);
> -	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	/* Avoid DMA unmap as the write operation skipped DMA mapping */
> +	if (dma_buf) {
> +		dma_unmap_single(gi2c->se.dev->parent, addr,
> +				 msgs[msg_idx].len, map_dirn);
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +	}
>   
>   out:
>   	gi2c->err = ret;



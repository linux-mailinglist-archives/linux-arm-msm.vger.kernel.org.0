Return-Path: <linux-arm-msm+bounces-90777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECeYOvO7eGm0sgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:21:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FC94D30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00E383006158
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D132652B2;
	Tue, 27 Jan 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8nn6Qtk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctzc8Kln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BAB3559D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520113; cv=none; b=S5Lt1jgtTKqcR4QEPefJtvilVNujQn2eYNCEvMAFJkl/VdcyY4UQmubMTGCGLx4eyMSihdmAQkpLlS/xiCTJX8tZiPA5mEMPhwarTwVzgQTpbE3/C1s2wGRbtP+pQfAJHHTk+VK+ICDZLwYpK4gXbjEvDfWlKIf9J7xVNDRrcLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520113; c=relaxed/simple;
	bh=hxE8DgeXBHRE1gGLEQJUpLHZc2gKWvTHb81dLyry0kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4ckaaqoPxHOHk4APMaAXw8gtx5WhH0kyCRhOFybS1Z72eBNUdjxplxMeUMrep+j66gAr0u7heZpb+A1OTczY+oxWBOF/a0ebSu2tNsvFwrfy4hdIh30dgsLnl6mXr6NBjrT2VpablMi8MWrh7mAnYmImL0yRGBhZQKD+uVGap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8nn6Qtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctzc8Kln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBx032520936
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXdYhC+4OLkMnLH64qCoEJNjy817DN2szJ1t4wD7K0c=; b=Q8nn6QtkTqTxIPKP
	eXgnw1l1BeLaq5566gR6OzICQ2LMYWtYGus8/tJEqoj8BNJAywomNB3rt1VWj3/6
	nVb7aUQ96XeGNZOw3WvtaWDesCullWIUOFqgDCn7vZ2q70JZ3CDztocu/fOYqjfC
	Ql94wx1AfdHNhAkaWshHVunUFiGh2uBfaonS7Q9b2BYO0OTKrcUJWSvUtU3k0xe+
	XNhCYtn0i/gV63muq6nvekHzC4raTVSf6iNjYjHN16u4dsYsFDqavtGngcp7UP+A
	qn67p1JVPWrDbQ+jj0FqN4gF2jDbqbrAhyDDZFvMst7TFGtSv4a1EF/Lpppz4BL5
	D+kLIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0b3jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:21:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c709a3a56dso27914485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769520111; x=1770124911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXdYhC+4OLkMnLH64qCoEJNjy817DN2szJ1t4wD7K0c=;
        b=ctzc8KlnP2yOyTh50cvDDBrDx9ImpR9koent64tjMpSTQvw//C8Sd1nqEjLy50sUYF
         EM65Ns7RXqjNCS7cOfyBVIYbxfbe0UQzhgXTE0JOBVhxJ0wOdS7ziLlUrViWao0YM72X
         U2hzoaiPNYkX5wMOwoA6AP7AySez4Os2MScVxoU2VDbfPxGAbGeQSRbGl++g/2mzEbWc
         KgxTAgvd4nE6Ui2pRxLQKI8Vh2w3WGPaT7cp8iFcPBegOrwiH5kjcDokCq6aprEXmuxp
         I/+MjBpiNE9gnXLh4pvmJbdxrqjoPBME4RPVGUKKuzV+Y6kiEU/vetD/emQ0ALeEOa8W
         cnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520111; x=1770124911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXdYhC+4OLkMnLH64qCoEJNjy817DN2szJ1t4wD7K0c=;
        b=kHNLtCh0TPtgf4RVLWhVOsWc9dpLLz7wS9ODz/ocSbXojeQeDOs3VcKgjt0dR+8Im8
         SD2KQ7zymTqdjzTj8BLE+lSTHCncdzgcjLlwTYSBlF7ZoI8WtXkW8l0Fjz0S0AjEKhdg
         pOec48hQOPBrmSNKNTW9xa1SHWM1U7V6Z1effAnEGWSbo6I0mavAOYHIoMAgct1xlqrK
         qfYDyHlROf9Mo11Uf3dBLC3RkdgagrkxF6j1IkIjS/u9qPlQ3U5RUYjfn1v9Ej/MNO4q
         0Phsy3CAQoZtV9aUqy9HGZe1nnyOWUXvMsKL9YcpBMZN28+wfkYDUanUD/BBMwTD5uAh
         LRuA==
X-Forwarded-Encrypted: i=1; AJvYcCUbm7OMqxBqVQomFT1FHWqHfDCwAblt0EzI0lOLbknKqnZyFBbAqiSlBxwTWFWCcxh1qPKnhAERXXeQaS2v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3wg+lLtAgzC8triAyv6PXcUOqtIFiUHdxT1nQ+vgHAreUdut
	W3fjfjw0CMu/Qv79dX4a1ypxXYzV1iaWW7jF+7LBuMSmIIDm3FE0LxU03bsFMswJn9WGwzTRJRW
	qEgVWLm814e3KEDmU3L1g4tOWGrMOSrXRF+GaHU8Rm/mGpYfE7m2pTNuNTrMEkp6Pitex
X-Gm-Gg: AZuq6aKh5s+xrM5XiPVZsB/Yui5oZLGnhm6M4SUsF4uj3jcVn6/LEwGOflGpk975fF/
	+goB4PIjpyf278OyVUI5FhucqFQ0tzE90apnS2qreuLlqKqcUyGqP5JyMxHz1cZU/Z9xICRgtZp
	R/pIFK3Txayu6s4GHsM9xlgYoey9gmAr29FN3nu+mLYXYRp8NYHnedwwZPOe5t1B30tGgSfbJwR
	57JNN3lIIj8YMwaWzo+H8ilp8xWINnNZ4++WdpyMZuVhgpBuaNQjP5m0Gu7hEimF2Z1eWxS1Uf+
	V9+KEjBWSXFyQUSvb8MSZyESrICvY+S103UqoqrNrwcgpi44t50cKlmDKsUtXW/P6FoJP47ggxu
	5D0rS+YZdJ7J0sMwZuO/xh2R0I6/0h1SvsndGykLDI+mgfbc8Ax+gQN2a4Wos7ym5DBU=
X-Received: by 2002:a05:620a:2802:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c70b73f90cmr157677785a.0.1769520110861;
        Tue, 27 Jan 2026 05:21:50 -0800 (PST)
X-Received: by 2002:a05:620a:2802:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c70b73f90cmr157674885a.0.1769520110413;
        Tue, 27 Jan 2026 05:21:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dad3asm807868666b.12.2026.01.27.05.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:21:49 -0800 (PST)
Message-ID: <64961e27-e316-47d1-8ab4-c4868754adb6@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:21:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] spi: geni-qcom: Add target abort support
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-4-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122151008.2149252-4-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i6Hq_R9x7gNuTdrfvROsZRz4HLr7Pd5C
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978bbef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KiRDxWFFE5j6wAypeYgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: i6Hq_R9x7gNuTdrfvROsZRz4HLr7Pd5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfXxazNXddTo16j
 cbxlPurdRCnhgLm0Z9vYvxdVtNDoXH8PWa1qiny5HqPiYsG2tnQTx9DEs3t3uQL3KKx3WZJBHAh
 EJB2QypI2CFvDJRNfbzru61fZ7nJa21I6l+7VNBn2ByCfQc5UG9fS0Mj2CtI4UddjDDn59IJI1L
 LoK6czoUHMDYNurBVQbsVLww55DLW6bueclIT940MGvnECoPXFRCyXdyh/w8Zr2v8CbX5EMEmCr
 iTbA7BDehXrmxR28sVA5UcGr0HaeWIAGqwcm3KZhxsPKcufkk2dG2ULoch2w4c1H8+zWV5YsHLs
 bhgVW4iQgpzc9fr1LIqFlWX/N1+LCvMRfT+PuuC4ef1COW8v/Z7wqBpkO5K32kwDgr/t1PalO6s
 SV0Klu81YPCsWNCbI6trjBcPmXlxyPiTOBDIp7zahMMrLiFDpmH363vHKWa4x2H1CEbc5vKZzJF
 ftr2YuDyYsL90YdTBLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-90777-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 941FC94D30
X-Rspamd-Action: no action

On 1/22/26 4:10 PM, Praveen Talari wrote:
> SPI target mode currently lacks a mechanism to gracefully abort ongoing
> transfers when the client or core needs to cancel active transactions.
> 
> Implement spi_geni_target_abort() to handle aborting SPI target
> operations when the client and core want to cancel ongoing transfers.
> This provides a mechanism for graceful termination of active SPI
> transactions in target mode.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index e5320e2fb834..231fd31de048 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1009,6 +1009,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int spi_geni_target_abort(struct spi_controller *spi)
> +{
> +	if (!spi->cur_msg)
> +		return 0;
> +
> +	handle_se_timeout(spi, spi->cur_msg);

I can't help but notice this function never even dereferences this
argument

Konrad


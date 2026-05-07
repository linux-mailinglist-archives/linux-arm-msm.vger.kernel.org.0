Return-Path: <linux-arm-msm+bounces-106457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICaUIM6p/GkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:03:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2954EABEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6DC13074BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279A43ECBD2;
	Thu,  7 May 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKvZO0E0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aj2uiZff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C415ECCC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165833; cv=none; b=mxtiNxq+LMSHKY7KzLhkgUnOCfaabKnOLEPFdI3BcQm0cKLaof0am6ThlJw5ykKeg6U1y2DgjdXoi1EXXdXfhWbvWTGKUcKDV02vG81DWNIQChb6SLC2QBAFnpClWWCgZMIiMHuLokJXFTvKNgTilD7PBjmOlQ/8uFEGD7KfZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165833; c=relaxed/simple;
	bh=DayezZOFHOXdCArrfetArsHplkxt+a71ssRuUgTFiAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTX9t1XV5xgHuTZrx8z5Oh8tV8ppSd3REq3DlT6iXq7XHmfFCKq59gl6sGZngB5Q6vM5RR/FJ+YKizSBlHL8aMizbAmhhk0uYPx0OQeaBWlp+uOg60yhpy3tSV5X7u7A358oxfnRlcs8Sg2xZgfYVeaymFckkA/wTfSzF8rhods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKvZO0E0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aj2uiZff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647ECaKO1424447
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4npxAss+cBkEEkowA0VPvewqjM3l+sBKHX3dTsvFTvA=; b=IKvZO0E0r2pupgEl
	87XJIk8uojF4AcTI1foHZax3+hTAnQAzOH19HwAJsU/VmHevm8oE4Tn3vmJ2RSgq
	fYxRzW1JHA/c44O3gK0nrJc6/3iwygll9fXpsSqqiN8aKHFwfbE5kO3DbxfW4ifi
	sV2r/XhPWEC+HNdPzT692Ih+lxEhEHmVDK2SRRyHVL4I6UOm5XrY9E3UQcC0EWEk
	n/ATea9ikR94ynTW8DvwQN5+bzNECxwpcmFmxa87EsgHDYQPLMIK+2nTjsMxiYeh
	kLpIJfBl7RrrFfUQWC/niCOhnVMxozvM+IsQuRwFW/ZbeBJHhcMxdX176R0car2C
	7RwnTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfskvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:57:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso9669975ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778165830; x=1778770630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4npxAss+cBkEEkowA0VPvewqjM3l+sBKHX3dTsvFTvA=;
        b=aj2uiZffi0bcNBYEf/1wcSfHbd1MSCVTaQpnmPC/OWSfUpOLF9P9Y/xYYMbfMoe4Hx
         QHO6Md3+0Qg4HnPHC/8EiYLI140WiZSP20GCntIimPmAN0uRD1QIlEOpJlCT1vzTtRzB
         xl+47rN/6s0cgInMVwIvVVM3amYLOBY7pPwAur6v+dOqNpUSKzFbPcmX/qFPGoWrNl/T
         cs3+8J4N/11egAfmc1ZGB+NAQxMvyPxx/cmQ93tuYDK08oBfEi06/ac+KiXDw6Yz2T3A
         l2k4dZ2UnPAs1t53YMpKvw17PON31q4qCQb/pcaxHg27ju4Dvo38PMLC3eIhO1uuGDqU
         xnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165830; x=1778770630;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4npxAss+cBkEEkowA0VPvewqjM3l+sBKHX3dTsvFTvA=;
        b=kN8bzuWGvVQLwf9LGuqA2Oafe6Sf0xPY+Ots33PKhQsBa/FK5VWUGoigCKzy8/cive
         xkBPLG29q+TDdzpscZiouc0BElWFTrHzNP0ymJ77vq0+B1nC9AYu8Qu37OOAa3c1bhTn
         zsDxS6OLCibK+CbPDWnb1I/03SQFJWE1Fl7lU+zoDEYn1ggDIknAfI/n5MBp95IITPRw
         UkKvgxGg9lUCVZPY3Kkbijn+RgOml1yzCm+664if2No7YIVzMsw8zhnHiHP6QPv5Z906
         hvKTjMUy1Hyrewj45dJyY0oziCsgldBvU1jKiUK99RXLcaQhhBTN02jYYuvJOfN3ajCj
         3bGA==
X-Gm-Message-State: AOJu0YwUtA523YegNGKk83+OcZ4p/3M5wMo3UBbTDEfPcxDGR21/kZvK
	qA9yXH8rLop5Z684FTLMaFYuCepNyhKR2DvPgg4p3FbmhNHp51MMN4ams25t7beMyR/uB44WoeG
	ARP9oSPeLuBQEXsZ0F5VcHxZ+aPdmRfq7FYCOIpeJ3vSla6jw1+HRpwJ51eKhKqjMCysU
X-Gm-Gg: AeBDiesCO2LS7pppAyXMF1vLDp8Io/rBuMmoYm+t9sps3h0WPgxDjPe41H+wUxO84+i
	J8z4ERbPZ45RGkBjS4kHVLh2vE1BGm7kev4BCVtsb1A+3hOS6XDdq9OZERwryanT7RPSJP5txbv
	AjCP6hw/IndVph0WW9E6uLuj5zguiJ0+xghDK5RJHImteKOx6n/O5Uq2WpWffQ9q6l/9EWd3043
	gGVbYuPMVbrKDHy3X8bca21sAwMHa4ocrCsADNRV6dHM6e9lwiK3q4wEhM2MSFp8Uqk3DYhjphK
	Ubs3tUadIG7TMnG6CeHLSvkYMLXIVV5Eh/JNe2E8lKi6Jz64rFDIwuzkf6paluyMZWIo5E8lNLg
	INGDvVrUkbqGF5NOa4ScdOYLM2+kmfbfp0LtHrfAh9G0vJLmFtwC2L3A=
X-Received: by 2002:a17:903:3201:b0:2b2:9f9f:fe6b with SMTP id d9443c01a7336-2ba79bda3e7mr81185525ad.40.1778165829776;
        Thu, 07 May 2026 07:57:09 -0700 (PDT)
X-Received: by 2002:a17:903:3201:b0:2b2:9f9f:fe6b with SMTP id d9443c01a7336-2ba79bda3e7mr81185225ad.40.1778165829268;
        Thu, 07 May 2026 07:57:09 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadee7c8sm27872465ad.57.2026.05.07.07.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:57:08 -0700 (PDT)
Message-ID: <581743f9-6385-4803-a91e-0b7d38fa6a17@oss.qualcomm.com>
Date: Thu, 7 May 2026 20:27:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/29] drm/msm/adreno: use version ranges in A8xx UBWC
 code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-19-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-19-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fca846 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F66dyu4Cpv24ktMMw0UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1MCBTYWx0ZWRfX4pM739QmVOpm
 eq/3B7ku0vlx31rqp4GxNP1dspm3qpy4kbrc3C4Fn4TclSou9eSu0Yo+nV2Is4kAYm9b5ZMSJom
 9FlfJeGeATgvX6r1TF0w+pjtTBeuGwVmPGdlJmZM1mAjIlTABhRTuzt3XrqYyJ5r2q7cfVsswm0
 m0CQVnHD7kR6bLir4zgepIW75JANsIHalZdIdy1bELmV6yTJeji9hPqeGVqeQCsVzz3vvErdBrN
 No7fNTMuin9PJwgZdcKFqY3xsmlabHtnsNg7dj/zBgEKpGei8eSdW4lv4sZyD3/TFhGCR2eBAWk
 oL7jc78iBBhs092ZgWmohkovd6Yhr5OBMdav/+4Gm+XCB3claPsz7l1KPfEhaQtKQQSOoBl4owE
 BrSZPVSbarTnJvm/gVSrtIbvyzJO6/RWXG7D1vBuAGisaeriwO0um/EZaDJXKYICNeKRo7dWunL
 AVNLARR/8T7EUCSP1ew==
X-Proofpoint-GUID: 1IC39P8DYlT7s3r3EJUwBv3lVRJuPdYD
X-Proofpoint-ORIG-GUID: 1IC39P8DYlT7s3r3EJUwBv3lVRJuPdYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070150
X-Rspamd-Queue-Id: CE2954EABEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> In order to simplify handling of UBWC minor revisions (like 3.1 or 4.3)
> use version ranges instead of a case switch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 5c73a9ebb22b..29d559fe4683 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -286,26 +286,24 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u32 hbb, hbb_hi, hbb_lo, mode;
>  	u8 uavflagprd_inv = 2;
>  
> -	switch (ubwc_version) {
> -	case UBWC_6_0:
> +	if (ubwc_version > UBWC_6_0)
> +		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
> +
> +	if (ubwc_version == UBWC_6_0)
>  		yuvnotcomptofc = true;
> -		rgb565_predicator = true;
> -		break;
> -	case UBWC_5_0:
> -		rgb565_predicator = true;
> -		break;
> -	case UBWC_4_0:
> -		rgb565_predicator = true;
> -		fp16compoptdis = true;
> +
> +	if (ubwc_version < UBWC_5_0 &&
> +	    ubwc_version >= UBWC_4_0)
>  		rgba8888_lossless = true;
> -		break;
> -	case UBWC_3_0:
> +
> +	if (ubwc_version < UBWC_4_3)
>  		fp16compoptdis = true;
> -		break;
> -	default:
> -		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
> -		break;
> -	}
> +
> +	if (cfg->ubwc_enc_version >= UBWC_4_0)
> +		rgb565_predicator = true;
> +
> +	if (ubwc_version < UBWC_3_0)
> +		dev_err(&gpu->pdev->dev, "Unsupported UBWC version: 0x%x\n", ubwc_version);
>  
>  	mode = qcom_ubwc_version_tag(cfg);
>  
> 



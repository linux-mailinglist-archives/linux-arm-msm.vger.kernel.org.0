Return-Path: <linux-arm-msm+bounces-106451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T5HUOWio/GkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:57:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B54EAAF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64338309AB66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4740429824;
	Thu,  7 May 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBvYNpit";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8cTX+4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0673A9D93
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165263; cv=none; b=ARJyv4tEQy6rX9IaYiHDv9Ce/rTaBdTHKueLwAFboxUWOdva1uvVrBob16fa7MXWFKda3Q9r14BKBOu3fnoR7IjbzZGD/gP3i0SFeSubf5/1r7p9ehkzGQug9M6qSOd80ufngTyqq9E4lt2DNR1UDNuMqTwuQEEKYhJrKTny34U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165263; c=relaxed/simple;
	bh=kAerF4ACCgUQKgQRum9APW18B6TtSIfrqCbwyrJUnWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwxP63rtwXwRT7rEqsob+m9bNowOzZrTg35az2aHfGpNxHCa52Kog7V9NHsNTrQZPFRjrhSWH54PeAjo4sXdgLzIQ9reeHJ16/CcvXNIFN6ffdK/0CwQHOwoMv77ur8a8WMK05Kew30DjVWG2r+VHFeHmZ6LHsxaZwy+6owMBo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBvYNpit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8cTX+4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5VXL1971617
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3JgrC7UvTp4naNvuXkki49ri1BHchLSl7wHWcJmTuM=; b=WBvYNpitYEcOz4On
	ewod5PR5zejdMaJnoxj6Sle1QDC/RM7QzQsga2phfCRCgSCYSymVwqix4rIjK6vk
	o1mbdTtv++XF2mIy+mMonTmkwyC5Ea+CiNX6WdDlvk0d+0KHrbWkK6ncHqHBxUjZ
	6wDrUyZH2c+fg5ivjREOdW03IThkLQM9Y0s+4oB9RqvbmoeOZALjp66O2bO4vUVk
	IDyJb2RfzwzQ2c4bUOuoEaRIguj1ppzgbZ6L0L/rCVRmm2BM1bL+iDTRMfnUtyiX
	BCEdBUzeR47l/R3bwPnBfm1iIbdRx9stflqxVCP1m07dTFYRNSQ/Ahzqcz/XPF48
	0wrxjw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej8mnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:47:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so11632675ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778165256; x=1778770056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3JgrC7UvTp4naNvuXkki49ri1BHchLSl7wHWcJmTuM=;
        b=d8cTX+4kwUYTe0bnTTY4UdVoZmnNCZTTv45LHW/CqLu5DyeK8DLM+u4sB1Mu7Q+Xoz
         XhUbgFIRasQ3pUCDFze3hKEuLJ60z+BBI/Y6rPSRtKx7QSdyV7pShhWci0b0soQbxcHM
         G78cEEGesZCgGhfOsWJ7bO1XznChGSQVk2q3gO33wZSbhNJKqGAKXiO1iCbmAW8sFXFH
         8x4Xn2+I+i7GwPLnbsd1x9E0+0K0GutSx9Psc9SureJFtFxHtM7P9jKxyz065wphWUWr
         Rwe0Oln6svChxZ8aByHZ6hQ+Kpvh7Sj7FQakVCXSkpQZnhwGiPNwJaQY4GcWMYpKnotA
         Um9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165256; x=1778770056;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3JgrC7UvTp4naNvuXkki49ri1BHchLSl7wHWcJmTuM=;
        b=PDb813ZLxWzGtTkSJcuTowJHeEY/3sTWazNvPQwqM9sPZEJJuJU9gFgiQUbvZxplEZ
         XipQCE4zT+VG2PtsdTP3FafFnTcVNJqqlfljX/PsJQQcoSXfwZBud+huS7/BG5iTvckZ
         InInSm5OEjjAj5SVDyKXd26Zhq4sFz5Ug2+Q8FV8Zy4JkA6Zn7/Lk5tsqX3TZJyrBPRm
         Oy5TySedXlDky5Gt5lvYe8vghBylaVKssi6zxcF5dq5XpGuGFJ9J5pXpWuT1eHGdsqek
         kr6pyKtkAJLmVPqJJVV/FQWfaOwTQeMYbowprSpodGoP0dvF1oHbP9pDa/IQOWit61LI
         sYpA==
X-Gm-Message-State: AOJu0YwOasmiBuHILqFTrbw8ZygoCvYHT+VwVUMyClA1tzDC/IJDDni8
	k2cApl+XjVD2oHN6jO9G9AUB6CfZt41PlSdZ9xtXIeDzOyDu6CDz85H08LMyB6pSEZVBSenfpIs
	wCKkAUaxVDjHa88yeKdOgBkR8lKLHPTVUZd6t1JB8c8uETzyrD1Z+e99eDbdPB9Wahqi1
X-Gm-Gg: AeBDiesaJv5IR9Xt8Kp5QWeN2wlW8eS/7pmvSLLiFQ5DOexeBk+gey74psxeedZmDLn
	uM+H4Gf2+d0dxFBZX/7MscOcrQUczYYMtCHnl9nuti/j3FV46QD77/AnoVQCzDAhAug0SHJRD9c
	OLQK2Q3k0n/wm04qgsiCMF+CLbUZlVTA4qz1VShxZ0MnsioWaU9Ci1NKlJRzmg51Id2+4jL6BA1
	DND1ObF4dOn8/S34/CfBUO9mws53N8dRbmdI8eWtrPk5SOfBuzDleohfCw1aoxDRTvev6I5HmZb
	fQMtIEog5iMM62uv9ZS5tmZZAn6i8lgkUUkLXJTB+qb0H4woE1dwZc74iNF1jTPHZ6qMlzrrrN0
	N5PEswlt9tyDQPR08ufKp5/Ps8hdbd2XfJsNoCtC94U94sg8CTX2bpcE=
X-Received: by 2002:a17:903:2f4e:b0:2b9:ff02:a154 with SMTP id d9443c01a7336-2ba798c2792mr86545275ad.15.1778165256355;
        Thu, 07 May 2026 07:47:36 -0700 (PDT)
X-Received: by 2002:a17:903:2f4e:b0:2b9:ff02:a154 with SMTP id d9443c01a7336-2ba798c2792mr86544885ad.15.1778165255667;
        Thu, 07 May 2026 07:47:35 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaac34a4sm31666325ad.16.2026.05.07.07.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:47:35 -0700 (PDT)
Message-ID: <bc52edd4-86b3-4521-9ea4-4fbd30fb4247@oss.qualcomm.com>
Date: Thu, 7 May 2026 20:17:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/29] drm/msm/adreno: set fp16compoptdis for UBWC 3.0
 formats
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
 <20260507-ubwc-rework-v4-17-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-17-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0OCBTYWx0ZWRfXzz0OWJH5I0Gi
 spJd+OyvtvrCE8ck1aYJQzt6qm4WJin7f7e96fgc3t9t0iVEC3PaPeQ/9fxQmhDB8mF+qOojMOn
 nD1wh6tp6N41eAaRCyCn+4gBQAnuvV1KNGxYWtUJt7uiwRcKwYcLGFBRi5USCG1R4dDdJeOzaAi
 dcTc6DCBeTZSTJEGi3t+a8S+e+yrva2rAyVx1rEiUBjWQLGj90m3ORLinjwFUdcDDaH1XG324LG
 Ic0Cs6RbHFmyFhxSrJxsrCewaj4tcLIdDFVdWsx99/Bynzio+iRUpiEkPu0fSyOmjXEryGSlCgn
 lI3pojI7DVBFvxiF2y+0VN4O+Znu2HjoUqw4MIaR8R9H6q4R3NEq4Ux3Vct0liFwYMafdZcRBrb
 5lVjMAn5hOh4wu22yKVRhuF0QTFAzj2pCw+KNfuMKLCmzv9pD+i4nyc9DXDVGGnWQ6A5ehdSVBp
 fNj/aUpNJb6voKwKMHQ==
X-Proofpoint-GUID: kR_owLWSORztjHxjVyCpmJ2kywfvtrFw
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fca609 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4tzv1H2Sf9v1fZNdEqgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: kR_owLWSORztjHxjVyCpmJ2kywfvtrFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070148
X-Rspamd-Queue-Id: 537B54EAAF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106451-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> The fp16compoptdis bit should be set if the system targets UBWC 3.0
> format in addition to UBWC 4.0.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 7a6223ddd8cf..867c7d05f670 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -303,6 +303,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  		break;
>  	case UBWC_3_0:
>  		amsbc = true;
> +		fp16compoptdis = true;
>  		break;
>  	default:
>  		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
> 



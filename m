Return-Path: <linux-arm-msm+bounces-78484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BEBFFE47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71DFE3ADA36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CFD2F3C11;
	Thu, 23 Oct 2025 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwXrVfJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE342FCC1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207766; cv=none; b=d4GT7DSfsOQmaYls6gpLFwsgLP30kfajnS6+CXcigsyrApIS2ywWDA+x3yjtS+KIfQnLxR2vL3OwGtMsV5dX65xX0nx7fnLdcNtONVZx2+3mX8MWmM3gqnpuqPglJbgXRmDZCGnWx7z2rFoBInpoOCO+bq4+OhL1m2dsW3PF6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207766; c=relaxed/simple;
	bh=t24w4DPMahHtB47lcvbqPKJBhuDoe/WR/qA9AK/CzCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njWLwMr0GjUsXcgKaSKXqH/QqdNvwMxUnDQ/lk4mVt+KHdIGNoLILzuw9OivqhbKEYwkMqq7fZGs0J2eFYUyxq19+uJ4jRJBLjJnBqlPDIkbTToXnv5vLbvUbb99/nDkKnsFJtsawZiRe3aUm8ZtWpG+cgfmlI0lYKtBLZu+DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwXrVfJn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7GdOh025827
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4NgzGTqEzB8dTS+vj4Q5OscJECbKhME9FM05+rA3pQ=; b=JwXrVfJnC5SxNroT
	GVflMBI3RAKRv0NmMCdJaWepOjMtALVL9U44IHHQeuH5eWAIDka1Dgcynx5pHyzE
	WllOeefifpEOemyV6kf1p9JYfyD64jX003N7sphlbqzsgU7N/RSMmCnmSYWg4MQS
	OrgxmNPg6zrQOLn6MMSgEyrwtWEfqjaKwGLfGP+1i97SD1uYEtxeD4pypUk6xnn5
	vnZnvC4j70Q0fuQBYXT2ac3I5QywqtnfY36RLNneIv7myopRelXimm7uoV64tvSo
	IcoMVpQSWSqmtlJCOSMKtpmol3quSrgUTvX69Q8SODTVWTwryzRwmdVpKj+ZhePx
	n6JP3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfe4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:22:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b86d977fso1460151cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207762; x=1761812562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4NgzGTqEzB8dTS+vj4Q5OscJECbKhME9FM05+rA3pQ=;
        b=C0ENyu5TLm85UQCrXt3w/LdUE/cfdHm6cZ9ihhDcRmlsAmL52BCgwiAINEwHXKwtSX
         wlCdcaL0xsPvPiXav+KgI8y/KUjr3i9jS6w9RcUJcVE0TfX8fmEcB0hWTDtaX/snCedB
         pGvAl5NSKSDiFg0xy/qzDqRrkZRPrzZ08Iwit7azosULeYfAljESHzqN9lVeS4zAnfss
         BocTp6NDTZznoI6VAUDqs21gZLX7VQFS46M2Gt7K3FaLbuOXWR9lwLxKc+rYAS1UtuxA
         VFXWgvIq9o+KLBfW16MZrmlSXjof99X3Db7msn2uwMzAYhsv0m1nk63SUbhF+C7UQ7Dx
         XVog==
X-Gm-Message-State: AOJu0Yz3GJF5XsEgPVfXYs3YljXaxHiJ+gGEyy3J0tzVs0q0Kx/D4p/9
	ODGlz73xyrhoKQnH9uyJrDLKkQZImjf7Zyi+P9m5EvcqCyV4iq0XMWAF4EbvrelETNR0MiedKMR
	VhlnOCZGuDVdBa9onD3+LFu/ipZoR96UKcADIfUVYl0ocb0aTSF7SQkfqpqAWIA3s1uod
X-Gm-Gg: ASbGnctbaQyBDt1SBR6nUV1uSFxKGEgeU7R5ntdZxnne1qB1cbJSki4NCp0GINIc+kY
	pi/RkS4AlTuHg4aK9br7NMyiHcmEhTeECt5Ymjr+ZuG6ZwcmymgYdEmuWAHF121tr9nSfek+l6v
	QrqE0mAajPDJbFjsv16h2kYM6II+eaQM7Qx5xyZl3nOq+7wIogsJ+kU+Ai0lGsRn/ptmdZrtqNu
	zfQKJaFA+fUD9vl2KrC0Iw6PXzcPafz5BQT7yI0K40PWmK0RO39PIAtVJh2Q3Nei7jiA95PGNfg
	Vhc3ilooOkj/vCT204KxDSFgQVgVEm+HrOWyF3e5e4yfRVelHBI0Go8pgAS5GBVPw9qz+XuhOKK
	B6XcI6vKLgFLG2Y7qbQXoPUh60RjYlDv9yrg0snh/MJqkOg0KWK0caMtZ
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e89d1f94eamr202274501cf.2.1761207761130;
        Thu, 23 Oct 2025 01:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEoh9odwgEcJ5K/DIdlUh+JcVJr4l9Z1HO2TW/KV5jjqHxmPJPsVObSKYBvA63wzdqXFK5BA==
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e89d1f94eamr202274191cf.2.1761207760689;
        Thu, 23 Oct 2025 01:22:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f3348cfsm1093740a12.35.2025.10.23.01.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:22:40 -0700 (PDT)
Message-ID: <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pPw7OMfqxlc3ySaitly9vDKfq4QcV1Kl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXxk09BEzo3E0Q
 LUjMUk9H7d/07NpxmTQrS6oQzk1gQj2NBQ+kVLasqnqQ1LGsK+/iB1Rqp2mRVbycHyZi/ZD78h2
 r/cGyyGnbFkSlE7AzFYdbgK6A87CcLqt4LMioj302zXsUv+53oFnTzIuKxMluqqkjrhTS0C1T8k
 jcIN2lJ8V5CkRMhW5iqvzRwryQ6vZsMABG7u0q/yGE6hPG5BfW0uLRagqBh5EfeuemxeH1zPzgE
 ExUPWWjnKHN2D2YREGGuaz+kdaiLOKE3v92UT5GTo29BqglV3UAw2moRYKrhWOiE20RmGBQYrcr
 JTvZ8BGbqc99aQcyAYa26uVrQGIUnxV5MOu5HVxa2xZrOOHCO/tq3pRkFj0JXnp0iQpWJ1bxy4U
 WiYE0pyFBUq7mfB7xOJLfOrLdNWSGg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9e5d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=91DCyrf_GaaWAzlYtecA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pPw7OMfqxlc3ySaitly9vDKfq4QcV1Kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/23/25 10:06 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Build the NT37801 DSI panel driver as module.

Yes, we can see that's what happens in the diff below.

You failed to state the "why"

Konrad

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8cfb5000fa8e..537a065db11c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m


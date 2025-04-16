Return-Path: <linux-arm-msm+bounces-54556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B9A90EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 00:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADBB14475F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 22:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECB820299D;
	Wed, 16 Apr 2025 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsPJL/4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB999478
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842800; cv=none; b=h5OsnMeOAIJhYQbOsQm7HuzZk0v09EQSlpA5EzqNcxQNY1vcaydbEE0VzZWmpJtV+5y9ZX93g03nTDqhtM5T3p8g7MKNFdopDaEV5WzpSgLC8OcIfcafZxGl2QJ8FywrdylbJhWMXQw4AWFICrScpv5FqgrTYYIy/QyBG02KNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842800; c=relaxed/simple;
	bh=WqH48F8YcdolMh0zLLnCiqwJuthifJNiCaxV2+++7Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJAzM7bFQIA4k+qcKJoU6MWjmkMHkFdpGrdxQkjFfcL93ONg0X035qznruUpdFYlSf8YcByMBYMRO3sKEMkwcw+UeNphbbdkblzQfJP/QvqM5O74dWaY4f4POCWYTZVVjKc/zOPFqvUdbFh84+mffFaZ9YCK00QY1XkLc6adoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsPJL/4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mGLT026243
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 22:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqAGRugCVeuCMNmiDbvkSP9E
	lATQzmpVN/G9d2BTZ8o=; b=DsPJL/4xTqZv2G8MTZFPRDMCMP1kQNrGq++h4rDA
	WNwFL9xeyiP/in5USr+KfqjTosL6pMRInJI33nBJhBibUDx75zar1OXhFfkddEIV
	IWLgTG7+MwElKcVqggeIG4abv0tVtS70qEIbkv9kCONXg+1s83utNsambL96p2nG
	WhO/dXXB6QqezE50GOueSN/iLU3C32tIs0x7LeNgNeHYKqtH70sDbY48d6A5uybs
	Ry2Cvk73psO7vD8l4WznY2MXVaCIUv1u/sZuryyz3cFCLjCN0t2T2+e3CBTYvUc8
	XShUyi6buVm8gg9H1VNr2CY72As91IlDoEEvjz2lsKeZVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1cvhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 22:33:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so12802385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744842794; x=1745447594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqAGRugCVeuCMNmiDbvkSP9ElATQzmpVN/G9d2BTZ8o=;
        b=svlD7Zu8r5mhXwCq8NHleBfZeZ5hWOy/1OS6nmvWmbCgd3hyLPk1Ps35hQGxyjVEky
         TDuidQGSf6Vssy36P7QJlx9eG1iumnPyBwgjPLVa/rkpXiyUR5flePPmcZqxtnLPSUsG
         +Vn4P2RHdibFItU8OPIC+ntyTyCny1cbm78PJVAdiWDGrusoIDPQ4aI9WbCVMf3VdK3t
         vzcKFLxnKngcaWhevC70hoPUOwC3ZB/gw+Efl4ct9Kq8AjQOns9YRLCL/dak4fl6JYcT
         Fk42UlhllJGalq+1XkozbIQxco2X6QD3qlCx1kQauR3QM4OeLGFejkO9HW7D3YYvL0TY
         yYaA==
X-Forwarded-Encrypted: i=1; AJvYcCXnKVjuCE0vrfldnxHn0jvcW5UmT+EtdXC+EMMBPbPPs4BbVmhf99X/J6xRNt2WyQMmqEH+SizSijF2AVrn@vger.kernel.org
X-Gm-Message-State: AOJu0YxSINrENBuW106LVnIUWVvRkTvLVApD0eBMsKlAS+kpK+mDLB4a
	WtrA9TTejQ3PWFfkYRzkbyVXqxgupdX0umPPW4eb1eSecfMVOBhmpIrwgX9jG+YBF9xK1EmVpSW
	Sp8+WfJ8MDDSPThmk+tePdnCw3atBqHdwhbSfeNDIiciBCjXypW3eA9qbAL8rMGbK
X-Gm-Gg: ASbGncuBzE9qlhw+B/Nx7zbSDjAzilXBTSt7ai9tAWAlxfJFODUH77b7z++mPxotplb
	ii6ByFUgnHlFAiv+cXTvw1ZUhLo8pF0ad22YTDSz860bYFYj7iIbQqnkUKKmQnk8n4YPGlMywxA
	+Attst+ia8rhYIemGPnMRyXO8PXMAkIjlpCCMiciw8ZTyHI9eWqJvHnfhzlLjiyj9QN+c8t3b1D
	3t6ui1lcxWlI+0bFiQalWeqo2T1RJKdCs8rL3FtPPTvujDAIAnIsQRLfDIIOJzhZxEz7v/uj3Nl
	VYp8aiUX2+DDmaMeLpcEkV4XfE6ow4SBJ5d0Rx8yy1WsCIk+acLDxFdnfw0z2DFXi09OHXQ6iGc
	=
X-Received: by 2002:a05:620a:4153:b0:7c5:460d:45de with SMTP id af79cd13be357-7c918fcf8d2mr510612985a.8.1744842793711;
        Wed, 16 Apr 2025 15:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiMAJfn9WbdbUz3M6lgFaz235RBZLLYHrTwSETB2UTdTqQMJK7O8E8xGkhg7KD5d5ucZCPQ==
X-Received: by 2002:a05:620a:4153:b0:7c5:460d:45de with SMTP id af79cd13be357-7c918fcf8d2mr510609185a.8.1744842793335;
        Wed, 16 Apr 2025 15:33:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm25367541fa.62.2025.04.16.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:33:12 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:33:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
Message-ID: <qwl4vy4ioui5ebqp2u2uyrvlpqvb3uxun5wkvf4attsjcp7hrx@socnkyyg3akj>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6800302a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=C1iuyIOyw383eEmvdYgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ye-iAhZB1GYT12-6HDvT4u1roLGWn0nG
X-Proofpoint-ORIG-GUID: ye-iAhZB1GYT12-6HDvT4u1roLGWn0nG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160180

On Wed, Apr 16, 2025 at 02:09:03PM +0200, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../media/platform/qcom/camss/camss-vfe-340.c | 281 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
> 
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,

No need to use inline here, it is a callback that will be called by the
pointer.

> +					enum vfe_line_id line_id)
> +{
> +	vfe->reg_update &= ~BIT(__regupdate_iface(line_id));
> +}
> +
> +const struct vfe_hw_ops vfe_ops_340 = {
> +	.global_reset = vfe_global_reset,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be753..9b138849caca 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -242,6 +242,7 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
>  extern const struct vfe_hw_ops vfe_ops_4_7;
>  extern const struct vfe_hw_ops vfe_ops_4_8;
>  extern const struct vfe_hw_ops vfe_ops_170;
> +extern const struct vfe_hw_ops vfe_ops_340;
>  extern const struct vfe_hw_ops vfe_ops_480;
>  extern const struct vfe_hw_ops vfe_ops_680;
>  extern const struct vfe_hw_ops vfe_ops_780;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


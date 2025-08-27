Return-Path: <linux-arm-msm+bounces-71030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D094B38799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 18:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987D81B26657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 16:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB436366;
	Wed, 27 Aug 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgVXKxWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874F30100E
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756311303; cv=none; b=RXyGno8D7r2XoPGuGIlaGSkr/cnUOkfpKcELe38stPnUYRlhar6aJFHwca8BHoOyMNTm5SKV+kzRM6b+MX0167Th52zGl7xS/lb0D43uNVYt7GK77kSLf4lwwbedrZTwdo2nVNFAQTtfZpmyuNHUXH3g5yMsLetpHVFtM3B4L8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756311303; c=relaxed/simple;
	bh=gpUlzt4Na+WwKgd1hRi5gsdeAaG9Ll65uQiPj5/AZiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buW9geChitdnjdyZmGMLrXS6dtTimo2WP3VmWKNjZfe9jd+fGtNqWgxfHnp71OOdgngqcgN2Ld1ouaLQwUDW5DugpDxaR8ISEepHMudEl8dbumRh3nRGkVwZ4rCusBuYJ2im/mzKuRRbwwyxT/arsfvEnjGgNJeuiWb6Ee9zqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgVXKxWV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kOVB031340
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 16:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72Snl19eM9SG13obf5lnpG+wAP1deg4gz5g3WQbmbnU=; b=WgVXKxWVJuRBsVz9
	XHDVQMH89DBN52LZM0i6JeZ4HCO9BuZ+WqFlW+VLMi/eo3WJWoTOFmZ9dqk7WD9n
	gexfdNriIyYI+ZBpsbjCX4VcJO5mNo7yVDWfCqBgY56v6EMaaU5mFcaXO4gXKKYt
	5kr87RDxfNTDSA28KzPnSE9m32vauXAfpsRUCw8xgtrmcVg30I815WVOQI9ZKNVh
	4MeJ0ttIpcouCf9Z659WXuzLiGmyIfWFPZgmr4piBzXGSGSMWEsFvc3FWa/70htd
	AXv3ABUIQ9tWJTgnkg+GQtG6wS6Zoc5CqDYoAOVFPLieKtbT710xZQVDaqWZ5eEv
	ZjXmDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615n51h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 16:15:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b10993f679so326741cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756311300; x=1756916100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72Snl19eM9SG13obf5lnpG+wAP1deg4gz5g3WQbmbnU=;
        b=qD/x6CXk/MxNY/plj+mIIWjsjjogw5avH7I6Q+j+IOldVvdabKvAahkxMcULOqQXeL
         +S1crih29BmcMUdUkyfYMCBvNYaHgJLoE/QV4owCG3hM7EylnCL2wTBHF55hFM1kGNsA
         9/JQj5cemWIWTcmDa0dkfXsxnfqXmOOVyCedQVQqHexZHCXwIJ5kBzfXf/t4qL+4DCgP
         KYuNGv/WMtQjkDB3B1Te3gwTANPHWckGslWoMH0yuxpAUEH5R5RMef5+f0NOVxb0lm9D
         PImCGAa7Fqy45/lQVkmQJNjaC49qg5m+iafJQ9zrDMKwPwjgAmwF7n1f1DOkq8AqfvYF
         aNHw==
X-Forwarded-Encrypted: i=1; AJvYcCXZc9yXEhtajL+LG7vf8vVF1nSRoUua1qHj7ggpT4msHf86d5Q8zDPjA7/NBqwC921iRoG+GJpBmHzv1XI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJzSxz6S0nofEHR0Gl3wQSoezYrxK203QiYS1C1tBidvil0xB
	dXYdVuD8mdilZf8xwIpSkqi5HxkvV17RyCoznNFKWX5SGqzfNWWbjoOI7yZeXtUONqWOhTDcMVE
	rEgLWbff5FF9rFPr/NBMVThnAUm/WvcOZM8kUjc5DqbxKFpdO4e71msbdlL2RWgoL9eNT
X-Gm-Gg: ASbGncuhbjz+aRbxErFF+ztLpEOt3QUJ+oQWnfniu+yRgQdjw+kxvhUk+W1BDiB8Z5h
	DX+0AH7oERbwWzY+BFwKxABgR5UguH3WCmipGlsMdj21wSvaibU1RscCPsTHOxviEUu3eQ2SRLw
	0v1yIc1Sqzh0q0W0yYZDz80HbBIzVe8iNfe3E35fDqQiRoSwBO9a1HXZ/83vBpU52Ean9CZanyh
	JCu476PhDL//i4MHEI6ifS9rivmoXZLCyY/P70WoexuNJ5/uDADLBSIbxBDkswvviYjvtllPJQw
	eqihim3H00gKUQbfcNVc3+lFoErc5/c6AksuKezaEjC03EADOS6enrY8zwohMLN72HeZcxnfBbG
	31+ChjHjeRQsFq+uT8cfiH2Ku5+n7rVhtwCUyANMQlUp7zJ1mtCOI
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id d75a77b69052e-4b2e0ac6451mr82573181cf.77.1756311299631;
        Wed, 27 Aug 2025 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPzGcbfBYbuRl3Du92a0zsaKioL4MbDCRH7YFgTAKCluORsEyl5ZX6nTkAvEBJ0xy1YynMxA==
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id d75a77b69052e-4b2e0ac6451mr82572361cf.77.1756311298937;
        Wed, 27 Aug 2025 09:14:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c02020sm2863442e87.29.2025.08.27.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 09:14:57 -0700 (PDT)
Date: Wed, 27 Aug 2025 19:14:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
Message-ID: <inxoswyre3qalrb3dj3lz3b5vmnpnkyy3hh4oum3z6p7yqlo2v@7g67yvvb25tc>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
 <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
 <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXyZ1JRTRg3yGF
 Fg/MPrHCNSIayWBcHEkji5k4dlHRx5e+bHYnDk5Jk0sOVB0dM2WeJYS+ou2xDF8/qbH5N9lCbks
 QpXtrLiNM+AUsnCIXjqWbfN+Oa/C5UzejqOQPKdyMbZY9gYlNNtkBZdlpFz6co9NSZ1PZFc6Hoz
 JOEA2rq5zHWeh9NjfXC4r/+vMG1EH0xVsPXWHIBv2zRZ07Kpt4lZ0WV0B7k5EygYGHmYgaYik6I
 KchcaWnq/ATr4K9g1VxsiFbrFh9me5bksizWCnKbWYNTvqEioxzB1xI+IawPQBpeR8Ry4uEdUDt
 l/neuEjNe9snB0aAFr9f64tVh9F7Gtta1T3bfL+2RSKxyvKz2LsTkyqFNoEc4BtvYzfwAfmyuPO
 d2HbWDPV
X-Proofpoint-GUID: 8ppkG1hr3zCmFBmc0fj_tqlz3TfO4nyv
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68af2f04 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M2k1YX_etJ5cuwz7zUoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8ppkG1hr3zCmFBmc0fj_tqlz3TfO4nyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Wed, Aug 27, 2025 at 08:34:39PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:42 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
> >> Complete USB/DP switchable PHY integration by adding DP clock
> >> registration, aux bridge setup, and DT parsing. Implement clock
> >> provider logic for USB and DP branches, and extend PHY translation
> >> to support both USB and DP instances.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
> >>  1 file changed, 299 insertions(+), 32 deletions(-)
> >>
> >>  static int qmp_usbc_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	/* Check for legacy binding with child node. */
> >> -	np = of_get_child_by_name(dev->of_node, "phy");
> >> -	if (np) {
> >> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> >> -	} else {
> >> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
> > Should not be necessary.
> 
> 
> Got it. I’ll merge the parsing logic into a single qmp_usbc_parse_dt function.
> 
> Also, I checked the compatible strings in the dtsi files for this PHY series
> looks like no current product uses the legacy binding. 
> I’ll drop qmp_usbc_parse_usb_dt_legacy in the next version.


No. It's _legacy_, it has been implemented in order to support old DTs,
which existed at some point but then were refactored into the current
state. You can't randomly drop DT support.

> 
> 
> >>  		np = of_node_get(dev->of_node);
> >> -		ret = qmp_usbc_parse_usb_dt(qmp);
> >> +
> >> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
> >> +		if (ret) {
> >> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
> >> +			goto err_node_put;
> >> +		}
> >> +
> >> +		ret = drm_aux_bridge_register(dev);
> >> +		if (ret) {
> >> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
> >> +			goto err_node_put;
> >> +		}

-- 
With best wishes
Dmitry


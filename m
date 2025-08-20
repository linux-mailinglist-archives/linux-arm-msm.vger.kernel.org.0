Return-Path: <linux-arm-msm+bounces-69952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAEB2DAD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7295C3473
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E452E3702;
	Wed, 20 Aug 2025 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pkTjb6l/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682B72E542F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755689048; cv=none; b=URgtoJGqjgMdec3dNvW5cowFwMCG3aZAfsN2HjXDEFbL+m8EHOp6vHjwRRHwpe0WXz8THNHci9k+IyL/YzxHp/ZqsbhKRwUapYH4tfrhcoLR6DFbeHxJX707JuirPPSqwQNEtHOxVDsZ79Nni9ujYahG+vHkJ/dydPe9rq7znxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755689048; c=relaxed/simple;
	bh=6G9KmzeLf5YVqaYxwfq4CAXn/TU0rLwA084iscdmPho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qk/iF1Y2vgi4L2GkY8EyJ0ZpypBQEhDK0tQk+SZOCveo0Xb0t/XJd3y8h+VulkA2LJKG+TRpGuF/L5IWCNoZht9DHGIRXdvblhRgLXEL0I845tAJyeU4boW8KfnBq/FdPMS+b7IpgovD3Rtdkvi7nDWMYH/icreX6nfqQ/Anafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pkTjb6l/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA8Fk9031297
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EuD+Bc6KdiQI4X6+HM5Q47sW
	/v3v69hO/DD7lycWQNc=; b=pkTjb6l/5sHY7Nta+gekct4ANscCgigVpoFzyGwV
	u3kPDnBbdIq0RT9odv2wBpXPPRUVzxAMOSsBFcqFqBr3OVi/JmwA/5ncHJGcWsgw
	d13ZJ3Wbpl7ApBJbNhfe0/EK+TgcS/7WzIUAUEvMTdCcfAPLVk0+NmQMtqx3Oy5T
	0hRGw1uvPRIApF0F1z/uwKJtyRAwCdb8Plr/ZN1K3RZElolv5TGU1Bc1SB+kVEgz
	cUcpEz3A1jOCkH1oMZFdJFoDa8hqMrYu2gB9RJDIx0r6q3hjiATsoduRUZIBd3uc
	ixHKOOg/ulWMVBMsuY88qHjlYnYVOUzHHwwd4Vnk3nqryQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dhfr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:24:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88dd0193so142557966d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755689043; x=1756293843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuD+Bc6KdiQI4X6+HM5Q47sW/v3v69hO/DD7lycWQNc=;
        b=N5bNNQ4deQsCx8tGBxH2ZlNPIDoip0ISvjRkCYoEZfgpmkRiMxuOKfMByDQoEbxzPr
         WBSgpJsMbPXg+xFdFxo0N/2ht1fiusoZplVLXGo+vTRRsOuhL3FHfjrv4H39zDQvEPq0
         3b/VtA3t3iFnKsiabAR8UYl5WqDCwgLKSdmI+r7oP7RlmpzoPaV/biRhyrGCsgEuaY48
         J5I+iBNLead+D8gpdjXQ7CAoKMQMZshaH8W8NMU25ZB24mrhFaN7NlbMoZKOsG1eLbkW
         FqW09itPX6I4uSDqrY2ixnoPNpw47UY90NHP+mTqwCUKuKQyf1zzV6RRgkSqcwDlcEzt
         bSZg==
X-Forwarded-Encrypted: i=1; AJvYcCWne1Nd8HkXW8CNvzzv57kJu5ZC0vtn4Hog9rx0Qj24d+Aoj9W/3ZwUFeammTe2TgMxM1kOL7dCOGWvHpdh@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdueL3gmUo7FPlhl/eUA5fzzSLyhzcHLHxEBH2yUumh/r+7wj
	soNwANGZW72kAWTi/WLkuN+6mGLmUbaWvMLqfjaRCH0DUYfqO92F1zXze/r5ExmZzNzv96lzrr9
	9/7fDe6fk0c6Ab7Yigqst890cx2hs4+0gWXstY7Q8M0A/MlbMxAJCwLPDwKUFlIrXvSbm
X-Gm-Gg: ASbGncsY5/lsNhABXCSaP1Os920Do6QMNA7aPn3mVrRtSf9Obm/HyV6kFZP8HZidRVE
	BIvNjeI3JE113BrZZ86TQIvsdt4un+AAR6rc6X+n7vNfmIt1rZsj968XmEdfnAc/+7pLfIh+biV
	ggubXLlEBYIO1zfPPvYWOsXxoiIknNWXMp0Sfak1xpBEEH7U2MGgWOyO95/CSUY93AQ9K04jZcO
	IZXpiQQ2ocr9RpXSsUl/j5RDpdXhnfejiRYVf2w/a9wl5psXkPS/8R1LMQ3G6CHaxjmS31RhnYn
	8wtTkg1RmCZ6hc9KI3uRw+WkNHZ6eAd+ScLJFarfWTaE3PtE2ibo2/hJdedlbbQMKJHgyS55ikZ
	jki6+tUE4i4QKTtLi56d0iSPUq6MA+TCoxt5Rbad0V0bRVesVWYkz
X-Received: by 2002:ad4:5e85:0:b0:707:5c72:c5bc with SMTP id 6a1803df08f44-70d770c81dbmr22798126d6.35.1755689043184;
        Wed, 20 Aug 2025 04:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSZE8hAQdMQJuBZplbqJNg6TajC1+Oy2DlFMUSP4YrC9/AQfNI69mKEaoGj7BYpityTg8m9Q==
X-Received: by 2002:ad4:5e85:0:b0:707:5c72:c5bc with SMTP id 6a1803df08f44-70d770c81dbmr22797566d6.35.1755689042574;
        Wed, 20 Aug 2025 04:24:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e033fc2e8sm623386e87.59.2025.08.20.04.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:24:01 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:24:00 +0300
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
Subject: Re: [PATCH v3 10/14] phy: qcom: qmp-usbc: Add TCSR parsing and
 USB/DP mode mutex handling
Message-ID: <i4rc5siu4q2o4sjk3j4bex7b7qdrs26y6lxsfnike7e7kqdva3@xddrd7vowtlb>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX36QdIPCDqGVQ
 wO/8Cw0cn2waVIMhgS137pjacsbJCAVN8jyrwo0ULTOIrIZsoOyXuARTj4NSYGdezoDrMWxmZUe
 ZoUVCn5+HNMaWhLQcfi25iCwJ5rQBvb6AZOVkXwLz9EYngVPiOQDiStxgq5CEe1S9s/yEGNl4/c
 fbwdrWhnzbR13XRxCtsi/sUx0w+TE8COsTC15o4Qkp7jRjsC+W0SMvFRtTV/0y6VyMg190LHeTH
 MiHS/rNa0kexn4YVdUussfBOoBuNGNpyjI5YKCkwyM9nRmkA6DiZcsMKJR3VHwgRce51ZsTnSnY
 rcau6oQC0Rl5c0LFgnxoZBGMqEZtX+0SUL1VERsVcd9BgKHTNYmfSM07wZxBQQEP47IISiMyA2U
 pbe89WRrG5P2HpD/Ka5S+hImjJZ6eA==
X-Proofpoint-ORIG-GUID: hz81AthH16XGUoB7_NWUc8vexuEENaYm
X-Proofpoint-GUID: hz81AthH16XGUoB7_NWUc8vexuEENaYm
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a5b054 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=zOceuAXpaMaZHB4uI4oA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:52PM +0800, Xiangxu Yin wrote:
> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
> Introduce mutual exclusion between USB and DP PHY modes to prevent
> simultaneous activation. Also update com_init/com_exit to reflect DP
> mode initialization and cleanup.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 60 +++++++++++++++++++++++++-------
>  1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index a1495a2029cf038bb65c36e42d0a4f633e544558..821398653bef23e1915d9d3a3a2950b0bfbefb9a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -674,7 +674,7 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>  	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>  };
>  
> -static int qmp_usbc_com_init(struct phy *phy)
> +static int qmp_usbc_com_init(struct phy *phy, bool is_dp)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -704,15 +704,20 @@ static int qmp_usbc_com_init(struct phy *phy)
>  	if (ret)
>  		goto err_assert_reset;
>  
> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> +	if (!is_dp) {
> +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);

Why? Don't we need to program those bits for DP PHY too?

If not, move them to USB init call.

>  
>  #define SW_PORTSELECT_VAL			BIT(0)
>  #define SW_PORTSELECT_MUX			BIT(1)
> -	/* Use software based port select and switch on typec orientation */
> -	val = SW_PORTSELECT_MUX;
> -	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
> -		val |= SW_PORTSELECT_VAL;
> -	writel(val, qmp->pcs_misc);
> +		/* Use software based port select and switch on typec orientation */
> +		val = SW_PORTSELECT_MUX;
> +		if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
> +			val |= SW_PORTSELECT_VAL;
> +		writel(val, qmp->pcs_misc);
> +	}
> +
> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);

Write this reg directly from USB / DP init.

>  
>  	return 0;
>  
> @@ -733,6 +738,9 @@ static int qmp_usbc_com_exit(struct phy *phy)
>  
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>  
> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);

Why?

> +
>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  
>  	return 0;
> @@ -1045,6 +1053,17 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
> +{
> +	if ((is_dp && qmp->usb_init_count) ||
> +	    (!is_dp && qmp->dp_init_count)) {
> +		dev_err(qmp->dev, "%s PHY busy\n", is_dp ? "USB" : "DP");

"PHY is configured for %s, can not enable %s\n"

> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
>  static int qmp_usbc_usb_enable(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> @@ -1052,7 +1071,11 @@ static int qmp_usbc_usb_enable(struct phy *phy)
>  
>  	mutex_lock(&qmp->phy_mutex);
>  
> -	ret = qmp_usbc_com_init(phy);
> +	ret = qmp_check_mutex_phy(qmp, false);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = qmp_usbc_com_init(phy, false);
>  	if (ret)
>  		goto out_unlock;
>  
> @@ -1103,7 +1126,11 @@ static int qmp_usbc_dp_enable(struct phy *phy)
>  
>  	mutex_lock(&qmp->phy_mutex);
>  
> -	ret = qmp_usbc_com_init(phy);
> +	ret = qmp_check_mutex_phy(qmp, true);
> +	if (ret)
> +		goto dp_init_unlock;
> +
> +	ret = qmp_usbc_com_init(phy, true);
>  	if (ret)
>  		goto dp_init_unlock;
>  
> @@ -1467,7 +1494,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>  		qmp_usbc_usb_power_off(qmp->usb_phy);
>  		qmp_usbc_com_exit(qmp->usb_phy);
>  
> -		qmp_usbc_com_init(qmp->usb_phy);
> +		qmp_usbc_com_init(qmp->usb_phy, false);
>  		qmp_usbc_usb_power_on(qmp->usb_phy);
>  	}
>  
> @@ -1602,13 +1629,13 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>  	return 0;
>  }
>  
> -static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
> +static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>  {
>  	struct of_phandle_args tcsr_args;
>  	struct device *dev = qmp->dev;
>  	int ret;
>  
> -	/*  for backwards compatibility ignore if there is no property */
> +	/*  for backwards compatibility ignore if there is 1 or no property */
>  	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
>  					       &tcsr_args);
>  	if (ret == -ENOENT)
> @@ -1623,6 +1650,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
>  
>  	qmp->vls_clamp_reg = tcsr_args.args[0];
>  
> +	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
> +					       &tcsr_args);
> +	if (ret == -ENOENT)
> +		return 0;
> +
> +	qmp->dp_phy_mode_reg = tcsr_args.args[0];
> +
>  	return 0;
>  }
>  
> @@ -1665,7 +1699,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_usbc_parse_vls_clamp(qmp);
> +	ret = qmp_usbc_parse_tcsr(qmp);
>  	if (ret)
>  		return ret;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


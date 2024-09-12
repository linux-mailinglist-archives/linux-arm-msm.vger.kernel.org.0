Return-Path: <linux-arm-msm+bounces-31538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582E975E9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 03:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00B9B1C20AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 01:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB35414293;
	Thu, 12 Sep 2024 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M42jQbQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3244C257D;
	Thu, 12 Sep 2024 01:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726105548; cv=none; b=VbY36j+pMfnj1hZzNN5faDW57KHXBDAliQ6wdRwj0ZHHC5+r/KM4RNH5ixNjNOU4/BshKWnJshy1mzBe7vsixxnZoWnsql99V6JPluHLnTKzbwhU5vuYFDOInhmx6DF/1c9BYtlss5LqrIEQGNKnsrlTH9OLjpEcI/1EpncDUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726105548; c=relaxed/simple;
	bh=lfvtYEj3jwrj3h+3pR0gH6CzXkbtsT9PXXj0v022+dc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu9vcm9JiBXEkvkRngiYs86Dmxw9jyYE+yrIzetNhEb1EzwSIwOfhuVEOz5l+lWKLSMTzoodNH0IHNkHHrRou4ZGykLE9y2q/qFS099qXj3p5RtxVFXuIHxSGuW8hth59l+7NNEju13sjLM2J+j0U+/M6j2hceX/ZwDMENMA018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M42jQbQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BEm5Tj019815;
	Thu, 12 Sep 2024 01:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WscEjiD9hzzpsqZveTR3VhIR
	Mm9+9juNOelysgcOnVI=; b=M42jQbQdi0MeOEB+4DwDxloLVQr+avuBfq9h3sgW
	sbIP9dz6dBtclyOscqiKpQBPRjkPetYRxPoc8pvnxQZZDrFr8jSUCLy1wFTZIgpw
	c4nCxPwctH7UhGtDwqSJQ8ep8S3PrXo1qhpEXObAMd8JFW2+yyrrJ2N+v3D6Y712
	anYqOt/oISr3BDnd2SrB1Luy3CxHhmTl/V/vt6KTs7TyZY423rNs8ebwBqaRs01o
	z0imjUCbHdAEXYaPrXPYC99V1pIA1AiVSF1U7vVLArK3/ntN/BpyF4C//vTjqcZq
	sg+FnIl7iQAHBCLqFFAeGDIEAfnp1yJXSkG6OqAlJHnVPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpuf60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 01:45:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C1jQDP007857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 01:45:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 18:45:26 -0700
Date: Wed, 11 Sep 2024 18:45:25 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <simona@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
        <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <quic_riteshk@quicinc.com>, <quic_vproddut@quicinc.com>
Subject: Re: [PATCH 2/5] phy: qcom: edp: Introduce aux_cfg array for version
 specific aux settings
Message-ID: <ZuJHtXrZIRDd7Kyg@hu-bjorande-lv.qualcomm.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-3-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240911100813.338-3-quic_mukhopad@quicinc.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -f8-IAEYCXekWPLFcgq1cRigKHN0bHZD
X-Proofpoint-GUID: -f8-IAEYCXekWPLFcgq1cRigKHN0bHZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120012

On Wed, Sep 11, 2024 at 03:38:10PM +0530, Soutrik Mukhopadhyay wrote:
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 34 +++++++++++++++++------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index da2b32fb5b45..0f860a807d1b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>  
>  struct qcom_edp_phy_cfg {
>  	bool is_edp;
> +	u8 *aux_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
>  };
> @@ -186,11 +187,14 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>  	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>  
> +static u8 edp_phy_aux_cfg_v4[10] = {
> +	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> +};
> +
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>  	struct qcom_edp *edp = phy_get_drvdata(phy);
>  	int ret;
> -	u8 cfg8;
>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>  	if (ret)
> @@ -222,22 +226,20 @@ static int qcom_edp_phy_init(struct phy *phy)
>  	 * even needed.
>  	 */
>  	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
> -		cfg8 = 0xb7;
> -	else
> -		cfg8 = 0x37;
> +		edp->cfg->aux_cfg[8] = 0xb7;

If you have multiple instances of the eDP PHY they will all point to the
same edp_phy_aux_cfg_v4[], so making instance-specific modifications
to that array will not be okay.


Make edp_phy_aux_cfg_v4[] const to reduce the likelihood for someone
else to make this mistake in the future and make a local copy of the
array on the stack so that you can modify it.

Regards,
Bjorn

>  
>  	writel(0xfc, edp->edp + DP_PHY_MODE);
>  
> -	writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
> -	writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
> -	writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
> -	writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
> -	writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
> -	writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
> -	writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
> -	writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
> -	writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
> -	writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
> +	writel(edp->cfg->aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
> +	writel(edp->cfg->aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
> +	writel(edp->cfg->aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
> +	writel(edp->cfg->aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
> +	writel(edp->cfg->aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
> +	writel(edp->cfg->aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
> +	writel(edp->cfg->aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
> +	writel(edp->cfg->aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
> +	writel(edp->cfg->aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
> +	writel(edp->cfg->aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
>  
>  	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>  	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> @@ -519,16 +521,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  };
>  
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> +	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> +	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>  	.is_edp = true,
> +	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
>  };
> @@ -707,6 +712,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>  };
>  
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
> +	.aux_cfg = edp_phy_aux_cfg_v4,
>  	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v6,
>  };
> -- 
> 2.17.1
> 


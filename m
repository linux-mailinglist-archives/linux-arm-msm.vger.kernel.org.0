Return-Path: <linux-arm-msm+bounces-53916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC8A84DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 22:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D3E43B4DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 20:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD5528FFCD;
	Thu, 10 Apr 2025 20:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDQ17p6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164EC19DF99
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315711; cv=none; b=kQfPncUx2vSnSfH0rO9vhmtPxICxej5nWo1RHsNVGRcsdVh+hXBOwzo+P60RypbFm+mI1Q7N/Lv016jyDsqly8iaRwNI6K6a9GWGc9+O0RA867OsNQeEyLFzvVTY3bN4RFT0i74QqkhOhXVlCWh+aXRyRNfh4qv+jYvp3y5ZqSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315711; c=relaxed/simple;
	bh=z+2H0fLYSNNQx5CwPDTUTE2xlFfXKUpOhR5z/ZpzANM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaRMrmYcTUhfDhWxxoCvf39hK2vQeOpKvc3ToeJfT4+tZjCMmeqNN8YYm7UX0mh20YpB4L7z1d68oRAkZkWuQLYsNIDICJWqaMqG9pDGQqT2zZ7+K8DUe1xe0fGJ1WM1ZwXoPyITk9OIQ2CAigE8XuGNRkH+ABqZrkgkFx7hHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDQ17p6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFpHgE019725
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rnGlStlfXd8+F8N9n11TDxWz
	pGUxxvJfzZwKuHYkqC4=; b=HDQ17p6dPh+RGUJog5z2ezlPMw3e6dQX/ufTuDhK
	iT6eM+mz/c3wtHRFZmR8nOw0F7oz7BivV5y5fQRcafPQvh14/rbilU03x/4o+l6s
	1UTGV3Tz3kzJeHCkv2vfcLKDVh4K2EQtaV2aLIkzkXUOqoRY32ebJZ2jZofIvDW3
	7BiqYlyXFHqPbjYluTH8rZkV/xgQGdgKYmGihFef3nwGWM+RQY3KheXsmlsImXmj
	53GEvqKUCwQISMtW5sthrqgLU2A3SI42IoKVidXRy8E6fJwh1QarQv4z1czP/xRe
	MNLbPLAvIxlpNL6oD5YBLXc/Om0Txl5rw+onAWqg3+f5lQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrrcc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:08:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so232314885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315708; x=1744920508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnGlStlfXd8+F8N9n11TDxWzpGUxxvJfzZwKuHYkqC4=;
        b=U3twnRWBM5NAbeP+zTraGx6te5Mjx1EsQ4vfR5yAS+mgyVfjR7t5Dxnetm1Hzda1W4
         gck2GHZ67zOPmmaiPBDT5QHKZVxMSHXtzgaqkIMl4hgXJVD6A3JW3myD7W2Y0UgLJ+ai
         2E5DRD/xXi9sRqsUSskjDl2sVBkWx96DeeO8AxfB4nxXCSySB5kG6/GAL7cppIthML9d
         mxTem5NIEJ/dpW329Xfm0SPJgR6S6Z4VEk25JVg1fWvG5Uf46nw+k9u/UTrtay7kzAjQ
         0zEN592FaDxFEhVQqHTkJVxTpspovvcWkKtfgW3w91Udn+Bcc8I0EupT5LMQ6PBxnWJs
         F1nw==
X-Forwarded-Encrypted: i=1; AJvYcCVKDcS7EV3L0//vqge9jD8qQYY37ww7EYs6NJnGcZP2wvS0BY89uhC6eUbgHhivyoMOsYzdRduUV/r5kPxK@vger.kernel.org
X-Gm-Message-State: AOJu0YyccfEVaVUsnTYVzxSr3v6PoFHCUC8KtfMt6VlZi7TJEMfgOWJF
	RnAmxCTbg4F12KM4zXdbCZAy+2mgtAP7IXZqIw7BLv9ECXwOx1VcfYSd1CQ7Telz2cNTrii4821
	oT/EPre34piwNk7LygSHj5F9mAlE4i/sZu2KWajCIKDvaBgpJZry94QciYSjLh8x6
X-Gm-Gg: ASbGncu/g5a9fhLJqqZPh9L7SmdtPToo/jFyg2XhvX3R47KQBZSz8wJZser6maDUj2p
	Uljg/XbsB0wyNrOapUpQ06sUTQnjADsyESShAG4sXUmLb7UPskq2luT5oFExodzttBiOgifGmMo
	BRZx70Ja4sOkeoVHcQIxu+J+sNbFXi3IWGwjvD71qto2YiusNEpGh9TKM1t5TVhkUg5yoO/cnm8
	seO3N1YtyBJx+Exddicg1aiASM63Xbxcveo+V+FMm+wtef6rbRTIdy4gW30iW7Nsc3aM0Qr0v1k
	UhsE3C+Vbfg0fJPQkF/YlHY+BX/4uCFM0d7apRpj1STnPI7WCBhFeqwngo+uaNLxhkGsjIsBtKc
	=
X-Received: by 2002:a05:620a:f15:b0:7c5:a5e9:63ee with SMTP id af79cd13be357-7c7af14de9bmr41797785a.31.1744315708172;
        Thu, 10 Apr 2025 13:08:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEogGejWVoedJ9yFHidpv0nMlyCBe0gS1l1J0WLSKR9V4AItbcj45d1D87AUWKvzSSlKxT6fg==
X-Received: by 2002:a05:620a:f15:b0:7c5:a5e9:63ee with SMTP id af79cd13be357-7c7af14de9bmr41794385a.31.1744315707854;
        Thu, 10 Apr 2025 13:08:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239866sm234239e87.83.2025.04.10.13.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:08:27 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:08:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Message-ID: <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090102.20781-5-quic_nitirawa@quicinc.com>
X-Proofpoint-ORIG-GUID: SswjN6cHiygW9IVrdLGGrQ-ebPxRXgpC
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8253d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Y7cAtwDMOKh--fb0GM0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SswjN6cHiygW9IVrdLGGrQ-ebPxRXgpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
> Refactor the UFS PHY reset handling to parse the reset logic only once
> during probe, instead of every resume.
> 
> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
> qmp_ufs_probe to avoid unnecessary parsing during resume.

How did you solve the circular dependency issue being noted below?

> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++------------
>  1 file changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 636dc3dc3ea8..12dad28cc1bd 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1799,38 +1799,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>  static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	int ret;
>  	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> 
> -	if (cfg->no_pcs_sw_reset) {
> -		/*
> -		 * Get UFS reset, which is delayed until now to avoid a
> -		 * circular dependency where UFS needs its PHY, but the PHY
> -		 * needs this UFS reset.
> -		 */
> -		if (!qmp->ufs_reset) {
> -			qmp->ufs_reset =
> -				devm_reset_control_get_exclusive(qmp->dev,
> -								 "ufsphy");
> -
> -			if (IS_ERR(qmp->ufs_reset)) {
> -				ret = PTR_ERR(qmp->ufs_reset);
> -				dev_err(qmp->dev,
> -					"failed to get UFS reset: %d\n",
> -					ret);
> -
> -				qmp->ufs_reset = NULL;
> -				return ret;
> -			}
> -		}
> -	}
> -
>  	ret = qmp_ufs_com_init(qmp);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return ret;
>  }
> 
>  static int qmp_ufs_phy_calibrate(struct phy *phy)
> @@ -2088,6 +2061,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
>  	return 0;
>  }
> 
> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int ret;
> +
> +	if (!cfg->no_pcs_sw_reset)
> +		return 0;
> +
> +	/*
> +	 * Get UFS reset, which is delayed until now to avoid a
> +	 * circular dependency where UFS needs its PHY, but the PHY
> +	 * needs this UFS reset.
> +	 */
> +	if (!qmp->ufs_reset) {
> +		qmp->ufs_reset =
> +		devm_reset_control_get_exclusive(qmp->dev, "ufsphy");

Strange indentation.

> +
> +		if (IS_ERR(qmp->ufs_reset)) {
> +			ret = PTR_ERR(qmp->ufs_reset);
> +			dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
> +			qmp->ufs_reset = NULL;
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int qmp_ufs_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -2114,6 +2115,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> 
> +	ret = qmp_ufs_get_phy_reset(qmp);
> +	if (ret)
> +		return ret;
> +
>  	/* Check for legacy binding with child node. */
>  	np = of_get_next_available_child(dev->of_node, NULL);
>  	if (np) {
> --
> 2.48.1
> 

-- 
With best wishes
Dmitry


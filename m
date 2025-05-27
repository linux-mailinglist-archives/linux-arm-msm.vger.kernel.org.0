Return-Path: <linux-arm-msm+bounces-59636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F360AC5C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947303A4309
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F16A20E6E6;
	Tue, 27 May 2025 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiN1Q+zx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EB51DE3CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382909; cv=none; b=q/sm7VvGqDC7AcSlijleaatQbdInoXAOSpNAiHilPvndgiOpdKFCwecnxrA9HJ1RDKdh6HTKfv1JXKXcDYO6oPHNbb+i2tpgb1Z6HjC2Qgk4Oo7HNbMmGtGfZAhk/F9EhrecDrzZ/Mr7+hdl2fYGr7+awb2kfW/rkMq+nXyXR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382909; c=relaxed/simple;
	bh=nXe1Icil4NeLuKAWL16jSsRo21UwSmmjNwPMHL3MN2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdSMBsxtKXBW8GqXKPuDs940mUIvBogsPtTY1qPXMaZEdsL3uzCAUGnXopZ9p+PDM+BrnV5P1Ti71K0tM5RutEiECCLg1z8ZgC0hSWfE8OIzS5beq6ce8E0ShyNL1FODCKZKg5i4Pe7KVh63h1XBUodmgbCwPA7M9Nn4k2f+Cto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiN1Q+zx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKhnUX013744
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ne0gIQPeeXA6jgzWvpGK1bbR
	cxhFrzGXDtK9BlZZ+0M=; b=NiN1Q+zxSFX1HVMJWUPBbHM1fj+PQogE32B9s9rh
	fZGbO7tmuoSg1WWTh+X/wNeIxzv0byXz2o5MpeZ5EJEYngFXnJmyuxsj+pZaqL+x
	OwjeiHW4Osj5N2T807P3WR+ThjkQXlskCiqSrb6Ft4NU/hgNelJnFnDEVmh+YUUd
	XLdVQ2Dr/jbokc+ZoGPJquor1Dv2Utws+QGCAAmbn3qdrWrTXFxlM1fW0ffpjDCF
	KHS/QV+HAvQa74q+uDrL55uZmLw4WGB011gvLeLYAH6SG1XT9/k2a1nMdG9gbliK
	NPMXo7u3nSwd7VKo7XkLPp7n2FOhS9PFLPr3mPr6Okajhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691at1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:55:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d0bdd023so109147376d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748382905; x=1748987705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne0gIQPeeXA6jgzWvpGK1bbRcxhFrzGXDtK9BlZZ+0M=;
        b=fS0enkndZBWbUNBJ2+qmjEm/BKLUbdAB4FHgya/5jkb98/IoQBF7DRIY3EHchWbp+C
         gilvKjwIyuUzJjYusbMggQYColjgFYmpf/DmRWTp2hOyYUdzN0NX3wk7JsSAaBkruddL
         ZyNW9s+R1wlYxgKYAmthBnKFfldAjoUbORv7/aqE3aYjNm38DSAjtYXpZEdwNZClskSp
         K2q2gX2LT0mR+l37mRsXMX66gJLF5ECBhdUOx2sHkZUI/VI5er3pndkxj7ZYcBKLCQI9
         7hC+P1qeEHl0Ot6jyE41/RgPhLClG4cyZSv94ygZ1Eg7vVrsBX1Iv+v1F3T4ZM+LTKy2
         TjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9HOr0fPJYxjfP3+W3O/zgsCtLsnpgYJP0NG0A/xmrMwvhxBgLgH4XXPGgdZzHMZ8FHVwp91rioIGq7MWv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/q+0VqumhVP0VuF7KOZn6h6am/0iwymJ9RSJV8+cG7w6M+G0T
	fbwocILV2fcdsLsT2cRc3ekU6ZzyTZEECJejBatgbrfvKLj1lhmeJwSQRG3SalD9GOv3JECrfV4
	WC5KfboB/pEE0V3CoNFpKG5jDcamNYkFRB3fDg/ZlRPMdNQH2xSg38HhmnLlgeg9AZ4Ac
X-Gm-Gg: ASbGncs5lJbs1reQePfu+1zAcveM68CpBloqbROWmysR/M+V1qNPU2xLIHXopQ8qx8o
	Bayu3ewWFR9jplR9034hNnZRTQj4jNzsziCU49zFvcCMsigCuf1+o3eKGv5ULSvzKtqKaYUXVGU
	Uy1nq6Z8QzSBUQFMZALkd+QmCXMhiCEL1tQOI7E4I+vMRv9byvile/CeYbDgkVNHSHtHM8HdiUp
	kmItjw0SIGtOOhRv+LpDVvu0zcnvQUQaFWYI8Is1ej//Xc1BET39WgTpMIX0DAOGPRJlTWru9Wd
	AgN/ujZuFR1PQyBymh99Nwwu1Ce+hYjYz9JSitpUZGgHME27sH44Eug0oEqQrPYeMymlwGSGZlc
	=
X-Received: by 2002:a05:6214:5095:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6fa9d2aea48mr243069996d6.22.1748382905553;
        Tue, 27 May 2025 14:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcBAog/0QNelbBSobBObHpDOHFG6hBJ6xtUMTJD3tXlDyIcI+Swq6mULnQ7WDRT6XsVldWdA==
X-Received: by 2002:a05:6214:5095:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6fa9d2aea48mr243069596d6.22.1748382905125;
        Tue, 27 May 2025 14:55:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532edde019sm45678e87.49.2025.05.27.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:55:03 -0700 (PDT)
Date: Wed, 28 May 2025 00:55:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
Message-ID: <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=683634ba cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RX03QJoVYHKw4zbBXYoA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KYFDYtqrm5CprZQEGNrqcBgOR9Cm9Tsn
X-Proofpoint-ORIG-GUID: KYFDYtqrm5CprZQEGNrqcBgOR9Cm9Tsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4NSBTYWx0ZWRfX3kffSm1/8P0i
 L9yjhzEfxWIbfX6pKO9vDN2IPQkU/XUawt9zzprfKRJGnSroW1nVMBnhRnZl7xaiFGvQw5DFjaF
 6LQ19137YaZVyEd/2YQn3EDdBMMz5fyIzaAIvro5qbRcVVeX1Yfaq5BGqAZtIUJwMl/0wmFJNCm
 J36A4BorLKkinlviLtN2CRl3yM+gZ/F+aPIjMUlPyCzPUJUCyoIzmwlBqvIfPkofMJo56ZnUF3F
 GPl8jI1J916yY/tXgHlZFTOhY8c8c4LbQTqvJQcgaW5MP5fWZoXwpptBbuC9XSA91zlSXyy/Upm
 vdZCHRckMpv0MYwPmZKQh7fiWeDxxiIaQDh1jp0etPAtY4Y5T9fkmcsJzo1Px6pk/Gg5/vDrTcc
 KEaBLWt7DidWBifaupcu35vqQDCS8M5t9I4d8mpuRuy+iBruahTwNVKXk0d2n7v3S63unRtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270185

On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> [konrad: renaming, rewording, bug fixes]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 121 ++++++++++++++++++++++++++++--
>  1 file changed, 116 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index b34ad92021a656b39562e2685a1e7a0a93660a35..4c9d92d6e0b8508191d052bd85dd135e4b8d7cc7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -19,6 +19,7 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
> +#include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  
>  #include <drm/bridge/aux-bridge.h>
> @@ -1709,6 +1710,8 @@ struct qmp_combo {
>  
>  	struct typec_switch_dev *sw;
>  	enum typec_orientation orientation;
> +
> +	struct typec_mux_dev *mux;
>  };
>  
>  static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
> @@ -3582,17 +3585,112 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
>  	return 0;
>  }
>  
> -static void qmp_combo_typec_unregister(void *data)
> +static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct qmp_combo *qmp = typec_mux_get_drvdata(mux);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	enum qmpphy_mode new_mode;
> +	unsigned int svid;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	if (state->alt)
> +		svid = state->alt->svid;
> +	else
> +		svid = 0;
> +
> +	if (svid == USB_TYPEC_DP_SID) {
> +		switch (state->mode) {
> +		/* DP Only */
> +		case TYPEC_DP_STATE_C:
> +		case TYPEC_DP_STATE_E:
> +			new_mode = QMPPHY_MODE_DP_ONLY;
> +			break;
> +
> +		/* DP + USB */
> +		case TYPEC_DP_STATE_D:
> +		case TYPEC_DP_STATE_F:
> +
> +		/* Safe fallback...*/
> +		default:
> +			new_mode = QMPPHY_MODE_USB3DP;
> +			break;
> +		}
> +	} else {
> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */

Why? if the SID is not DP, then there can't be a DP stream.

> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
> +			new_mode = QMPPHY_MODE_USB3_ONLY;
> +		else
> +			new_mode = QMPPHY_MODE_USB3DP;
> +	}
> +
> +	if (new_mode == qmp->qmpphy_mode) {
> +		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
> +		return 0;
> +	}
> +
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> +		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
> +		return 0;
> +	}

Consider the following scenario: connect DP dongle, use modetest to
setup DP stream, disconnect dongle, connect USB3 device. What would be
the actual state of the PHY? Modetest is still running, so DP stream is
not going to be shut down from the driver.

I think we might need a generic notifier from the PHY to the user,
telling that the PHY is going away (or just that the PHY is changing the
state). Then it would be usable by both the DP and USB drivers to let
them know that they should toggle the state.

> +
> +	dev_dbg(qmp->dev, "typec_mux_set: switching from qmpphy mode %d to %d\n",
> +		qmp->qmpphy_mode, new_mode);
> +
> +	qmp->qmpphy_mode = new_mode;
> +
> +	if (qmp->init_count) {
> +		if (qmp->usb_init_count)
> +			qmp_combo_usb_power_off(qmp->usb_phy);
> +
> +		if (qmp->dp_init_count)
> +			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +		qmp_combo_com_exit(qmp, true);
> +
> +		/* Now everything's powered down, power up the right PHYs */
> +		qmp_combo_com_init(qmp, true);
> +
> +		if (new_mode == QMPPHY_MODE_DP_ONLY) {
> +			if (qmp->usb_init_count)
> +				qmp->usb_init_count--;
> +		}
> +
> +		if (new_mode == QMPPHY_MODE_USB3DP || new_mode == QMPPHY_MODE_USB3_ONLY) {
> +			qmp_combo_usb_power_on(qmp->usb_phy);
> +			if (!qmp->usb_init_count)
> +				qmp->usb_init_count++;
> +		}
> +
> +		if (new_mode == QMPPHY_MODE_DP_ONLY || new_mode == QMPPHY_MODE_USB3DP) {
> +			if (qmp->dp_init_count)
> +				cfg->dp_aux_init(qmp);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void qmp_combo_typec_switch_unregister(void *data)
>  {
>  	struct qmp_combo *qmp = data;
>  
>  	typec_switch_unregister(qmp->sw);
>  }
>  
> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
> +static void qmp_combo_typec_mux_unregister(void *data)
> +{
> +	struct qmp_combo *qmp = data;
> +
> +	typec_mux_unregister(qmp->mux);
> +}
> +
> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>  {
>  	struct typec_switch_desc sw_desc = {};
> +	struct typec_mux_desc mux_desc = { };
>  	struct device *dev = qmp->dev;
> +	int ret;
>  
>  	sw_desc.drvdata = qmp;
>  	sw_desc.fwnode = dev->fwnode;
> @@ -3603,10 +3701,23 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
>  		return PTR_ERR(qmp->sw);
>  	}
>  
> -	return devm_add_action_or_reset(dev, qmp_combo_typec_unregister, qmp);
> +	ret = devm_add_action_or_reset(dev, qmp_combo_typec_switch_unregister, qmp);
> +	if (ret)
> +		return ret;
> +
> +	mux_desc.drvdata = qmp;
> +	mux_desc.fwnode = dev->fwnode;
> +	mux_desc.set = qmp_combo_typec_mux_set;
> +	qmp->mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(qmp->mux)) {
> +		dev_err(dev, "Unable to register typec mux: %pe\n", qmp->mux);
> +		return PTR_ERR(qmp->mux);
> +	}
> +
> +	return devm_add_action_or_reset(dev, qmp_combo_typec_mux_unregister, qmp);
>  }
>  #else
> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>  {
>  	return 0;
>  }
> @@ -3839,7 +3950,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	ret = qmp_combo_typec_switch_register(qmp);
> +	ret = qmp_combo_typec_register(qmp);
>  	if (ret)
>  		goto err_node_put;
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry


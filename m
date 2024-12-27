Return-Path: <linux-arm-msm+bounces-43467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E29FD0BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 08:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7714A3A0539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 07:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9011E13DDD3;
	Fri, 27 Dec 2024 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QgwkHFtO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E87524B4;
	Fri, 27 Dec 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283320; cv=none; b=FNkp3AipzDor7TFu2jW27Xyd4is7bKp6H6Ke1uFrpEFrXIL5wZVBmCrfy3F58guqp8Ir8HDbOQtLydbCPdtoMN2yQFSn+aGKfy2uKUoxumLXLzpQu/QjWnvmjwFnnti/pX5CYZldfP48Vw+h0wXda0AWdGVesOmfPwSVDtSFIWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283320; c=relaxed/simple;
	bh=MQcacsZO5FO6BC6h0EheCbYld6V5niN6BJk+49MWmf4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvaybtZsjrBdFzAAkmD/gmJSxKPfI61bQcJgWQJY3UEuNsf0B+1aldWsfceyqfbKmRRuNiJJLP62lZwFPBr256qEOTjsYVuKvS6a6N9Gk27oLphf+wxW1drQKhg6EiWh3IB/g+JeVjMzVXV7NT3+MAoLxgLhh1x07bJuACDBa3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QgwkHFtO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6KVJo023393;
	Fri, 27 Dec 2024 07:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EX6mOOuBmyvUqoSGZ+ot2xwfZv24embIQvJx2/xCURY=; b=QgwkHFtO/rvlDk6n
	fWVFxLjk6oJXUxM1NRpwBGxBld6WoLtf7NE96u8BDb4pHtiS59cJlnW3rjoC6Uxx
	YDZiH6x1PHIjDG/KNXDWZUTOMP05HQdzaaZoW62b0SfTeYKt1D5TEGaOC3/U+neL
	QkYfPGCH/yr+9/8etWb7qRoU2YcM2zzZN6AwG84xC28lp+ZOGphRCtEQvMauu08R
	OTBbZ5sw88jVnup6lyEgkcs/IW/Q99NUc05kb1ohReH5aPjVSToGfE+uenn6HP2j
	ppfyyjf96rmKT4AuQEIFdfVK5gh4AlPSIz6l4EduJ/TrimrjNeQbWuylGxrMom+K
	Z4sEvA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43spvug598-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:08:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR78LlQ005467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:08:21 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:08:17 -0800
Date: Fri, 27 Dec 2024 15:08:13 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_zhgao@quicinc.com>,
        <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v3] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <Z25SXZxetbeyXA9t@cse-cd02-lnx.ap.qualcomm.com>
References: <20241226031845.2574669-1-quic_yuanjiey@quicinc.com>
 <5q4wxz52mq6b73chi3o3xtspqbczycboeqiqsqnse6qg3vvbya@ih5rac2jqsrb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5q4wxz52mq6b73chi3o3xtspqbczycboeqiqsqnse6qg3vvbya@ih5rac2jqsrb>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xf5fMMwu91Z-SHUkwVNcU5q0EUxb9gYQ
X-Proofpoint-ORIG-GUID: xf5fMMwu91Z-SHUkwVNcU5q0EUxb9gYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270060

On Thu, Dec 26, 2024 at 11:04:11PM +0200, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 11:18:45AM +0800, Yuanjie Yang wrote:
> > Qualcomm regulator supports two power supply modes: HPM and LPM.
> > Currently, the sdhci-msm.c driver does not set the load to adjust
> > the current for eMMC and SD. If the regulator dont't set correct
> > load in LPM state, it will lead to the inability to properly
> > initialize eMMC and SD.
> > 
> > Set the correct regulator current for eMMC and SD to ensure that the
> > device can work normally even when the regulator is in LPM.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> > Changes in v3:
> > - Optimize the code logic and separate code for regulator vmmc and vqmmc
> > - Rebase on tag: next-20241217
> 
> 10 days old branch
> 
OK I will rebase on the latest tag in next patch.

> > - Link to v2: https://lore.kernel.org/all/20241127095029.3918290-1-quic_yuanjiey@quicinc.com/
> > 
> > Changes in v2:
> > - Add enum msm_reg_type to optimize the code
> > - Delete redundant emmc type judgment
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/
> > 
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 64 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 62 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index e00208535bd1..22811964ba61 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -134,9 +134,18 @@
> >  /* Timeout value to avoid infinite waiting for pwr_irq */
> >  #define MSM_PWR_IRQ_TIMEOUT_MS 5000
> >  
> > +/* Max load for eMMC Vdd supply */
> > +#define MMC_VMMC_MAX_LOAD_UA	570000
> > +
> >  /* Max load for eMMC Vdd-io supply */
> >  #define MMC_VQMMC_MAX_LOAD_UA	325000
> >  
> > +/* Max load for SD Vdd supply */
> > +#define SD_VMMC_MAX_LOAD_UA	800000
> > +
> > +/* Max load for SD Vdd-io supply */
> > +#define SD_VQMMC_MAX_LOAD_UA	22000
> > +
> >  #define msm_host_readl(msm_host, host, offset) \
> >  	msm_host->var_ops->msm_readl_relaxed(host, offset)
> >  
> > @@ -1403,11 +1412,59 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
> >  	return ret;
> >  }
> >  
> > -static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> > +static void msm_config_vmmc_regulator(struct mmc_host *mmc, bool hpm)
> > +{
> > +	int load;
> > +
> > +	if (!mmc->card) {
> > +		regulator_set_mode(mmc->supply.vmmc,
> > +				   hpm ? REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE);
> 
> Can there be other users of the regulator or is it an exclusive one?
> Because if there can be other users, you could have pulled the power
> from them.

1.Yes there may be others users of the regulator.

I searched all the DTS files using the “qcom,sdhci-msm-v5”
driver and found that the following four DTS files have
instances where the SDHCI device and other devices share a
regulator.

qcm2290.dtsi
qrb2210-rb1.dts SDHC2(sd) and usb share pm4125_l21
		pm4125_l21: l21 {
			/* SDHCI2 VMMC */
			regulator-min-microvolt = <2960000>;
			regulator-max-microvolt = <3300000>;
			regulator-allow-set-load;
			regulator-boot-on;
		};

sc7280.dtsi
qcm6490-idp.dts
	SDHC_1(eMMC) and ufs share vreg_l7b_2p952
		vreg_l7b_2p952: ldo7 {
			regulator-name = "vreg_l7b_2p952";
			regulator-min-microvolt = <2400000>;
			regulator-max-microvolt = <3544000>;
			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
		};

sc7280.dtsi
sc7280-idp.dtsi
	SDHC_1(eMMC) and ufs share vreg_l7b_2p9
		vreg_l7b_2p9: ldo7 {
			regulator-min-microvolt = <2960000>;
			regulator-max-microvolt = <2960000>;
		};

qcs615.dtsi
qcs615-ride.dts
	SDHC_1(eMMC) and ufs
		vreg_l17a: ldo17 {
			regulator-name = "vreg_l17a";
			regulator-min-microvolt = <2950000>;
			regulator-max-microvolt = <3312000>;
			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
		};

We can see When SDHC device and other device share a regulator,
the regulator doesn't have regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM>
property.
So even if the code here uses the regulator_set_mode(REGULATOR_MODE_IDLE),
it will have no effect to other device.

2. code (!mmc->card) means SDHC device first intialize.

When the SDHC device initialization does not recognize the
device type, call mmc_power_up will reach condition
(!mmc->card) && hpm == 1. Usually this situation is in SDHC
initialization, and need to power up.
This patch aim to set correct current to let SDHC can properly
initialize even regulator-init-mode is LPM, but in first time
initialization, We don't konw this device type. So we change
regulator mode to HPM.

When the SDHC device initialization does not recognize
the device type, and call mmc_power_off will reach condition
(!mmc->card) && hpm == 0. Usually this situation means SDHC
device initialize fail.
This scenario is rare, and most of the time the code cannot
reach this point.

> > +		return;
> > +	}
> > +
> > +	if (!mmc_card_mmc(mmc->card) &&
> > +	    !mmc_card_sd(mmc->card))
> > +		return;
> > +
> > +	if (mmc_card_mmc(mmc->card))
> > +		load = MMC_VMMC_MAX_LOAD_UA;
> > +	else if (mmc_card_sd(mmc->card))
> > +		load =  SD_VMMC_MAX_LOAD_UA;
> 
> if (mmc_card_mmc(mmc->card) ||
>     mmc_card_sd(mmc->card))

Here, I want to filter out other types of devices,
just select the corrsponding current only for eMMC
and SD card.

"
if (!mmc_card_mmc(mmc->card) &&
    !mmc_card_sd(mmc->card))
    return;
"     filter out

"
if (mmc_card_mmc(mmc->card))
    load = MMC_VMMC_MAX_LOAD_UA;
else if (mmc_card_sd(mmc->card))
    load =  SD_VMMC_MAX_LOAD_UA;
"      select current


> > +	load = hpm ? load : 0;
> > +
> > +	regulator_set_load(mmc->supply.vmmc, load);
> > +
> > +	return;
> > +}
> > +
> > +static void msm_config_vqmmc_regulator(struct mmc_host *mmc, bool hpm)
> > +{
> > +	int load;
> > +
> > +	if (!mmc->card) {
> > +		regulator_set_mode(mmc->supply.vqmmc,
> > +				   hpm ? REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE);
> > +		return;
> > +	}
> > +
> > +	if (!mmc_card_sd(mmc->card))
> > +		return;
> > +
> > +	load =  hpm ? SD_VQMMC_MAX_LOAD_UA : 0;
> > +
> > +	regulator_set_load(mmc->supply.vqmmc, load);
> > +
> > +	return;
> > +}
> > +
> > +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
> > +			      struct mmc_host *mmc, bool hpm)
> >  {
> >  	if (IS_ERR(mmc->supply.vmmc))
> >  		return 0;
> >  
> > +	msm_config_vmmc_regulator(mmc, hpm);
> > +
> >  	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> >  }
> >  
> > @@ -1420,6 +1477,8 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
> >  	if (msm_host->vqmmc_enabled == level)
> >  		return 0;
> >  
> > +	msm_config_vqmmc_regulator(mmc, level);
> > +
> >  	if (level) {
> >  		/* Set the IO voltage regulator to default voltage level */
> >  		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
> > @@ -1642,7 +1701,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
> >  	}
> >  
> >  	if (pwr_state) {
> > -		ret = sdhci_msm_set_vmmc(mmc);
> > +		ret = sdhci_msm_set_vmmc(msm_host, mmc,
> > +					 pwr_state & REQ_BUS_ON);
> >  		if (!ret)
> >  			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
> >  					pwr_state & REQ_BUS_ON);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie




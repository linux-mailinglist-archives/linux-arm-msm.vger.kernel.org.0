Return-Path: <linux-arm-msm+bounces-44706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4BFA08844
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 07:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2FE1648A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 06:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E0E2063D9;
	Fri, 10 Jan 2025 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dmdsNE7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644C21AB6C8;
	Fri, 10 Jan 2025 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736490141; cv=none; b=MdreQ51hsqsXCdtnHROcPEGWphnPA07m+vbraCOxZlDScs+1EhCykYTBcQbWkkabJ4pG1W/gDEk9q+m9GB1d6YUkqTw25MySM1eo6z2O6rmtmIyd/tW0KEMT75MZKMDC0c48pCZFjiE4z2DUuo79cUyaDUxPHGyKCEaoJ24V3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736490141; c=relaxed/simple;
	bh=7Wm59bKtuL2J2wpxs1oRSDwiHMCJRGhkJ4GG3pLTRIc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuYHolusXtJ4C+8TSQVtUJ8psdNOnejyN5EOtU22DHq147VihX+Um7XaVL/0g7A1uij6A+9nzZlyr3DULV1XZhL5x25m+EIJrqItbldrZmTRKN+SYIN22BoteqJmx6ZfaNnTfwrYl7CDauOrDHzjL0+ZWLhaBAVIj1UB7VRAJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dmdsNE7g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A2ZW9Y027909;
	Fri, 10 Jan 2025 06:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+CGeGUkFGCUVRql8ZgIA9bDy
	tqu5LIY7ZqKvBY9pHVI=; b=dmdsNE7g44DUbSbzsxKBSBZZV5cSAGM5vu/auSui
	3ecZu+9rV2u9UJPo+myn3eBRgFuSdJb7JD1U5dG32UWHcHPP8ysB7OCgz+itIYo0
	gdCEwNBEhSPK/oqze1KKQ+j2SA7oI5Hq0dYIMocO7uPSA7DC0yN0moMdqBCTswVR
	6/8rkdQWrnbvVIxa2Xcd4x0x8TuggD8xgsjwNhUzgPIGYip5ctFcOt8AhV5shS0W
	19ve3KX0YPs6xoDYi7Bdo0Km3T53iUT56zUftVAgvSC8wNw+ke0rEYcH0NlqzN6J
	bJgpvfamQgBf7jlBMg8lwatTwe/516E9Qo8UaI/5Lu4aag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442twbge5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:22:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A6MDJb032385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:22:13 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 22:22:09 -0800
Date: Fri, 10 Jan 2025 14:22:03 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>
CC: <dmitry.baryshkov@linaro.org>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_zhgao@quicinc.com>,
        <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v3] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <Z4C8i2daxeH0lOCf@cse-cd02-lnx.ap.qualcomm.com>
References: <20241226031845.2574669-1-quic_yuanjiey@quicinc.com>
 <23b9c309-fe92-4d53-94f7-348bacaa52cb@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <23b9c309-fe92-4d53-94f7-348bacaa52cb@intel.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mAxR16ZoK9HIUS2R_bzEALUJzchVJ39J
X-Proofpoint-ORIG-GUID: mAxR16ZoK9HIUS2R_bzEALUJzchVJ39J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100051

On Thu, Jan 09, 2025 at 10:00:49AM +0200, Adrian Hunter wrote:
> On 26/12/24 05:18, Yuanjie Yang wrote:
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
> Why use regulator_set_mode() in this case but use regulator_set_load()
> otherwise?
> 
> Previous patches used the maximum 'max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA)'
> for the '!mmc->card' bus-on case, so why not:
> 
> static void msm_config_vmmc_regulator(struct mmc_host *mmc, bool hpm)
> {
> 	int load;
> 
> 	if (!hpm)
> 		load = 0;
> 	else if (!mmc->card)
> 		load = max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA);
> 	else if (mmc_card_mmc(mmc->card))
> 		load = MMC_VMMC_MAX_LOAD_UA;
> 	else if (mmc_card_sd(mmc->card))
> 		load =  SD_VMMC_MAX_LOAD_UA;
> 	else
> 		return;
> 
> 	regulator_set_load(mmc->supply.vmmc, load);
> }
Thanks, my purpose for using regulator_set_mode() in this case is just
to simplify the code logic.
And I readlize that using regulator_set_mode() here might cause side
effect.

Thanks for your code suggestion, I will use your suggestion to modify
this part of code in next version.

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
> > +	load = hpm ? load : 0;
> > +
> > +	regulator_set_load(mmc->supply.vmmc, load);
> > +
> > +	return;
> 
> 'return' at the end of a function returning 'void' is not needed.
OK, I will delete return in next version.

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
> 
> 'return' at the end of a function returning 'void' is not needed.
OK , I will delete return in next version.

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
> 

Thanks,
Yuanjie


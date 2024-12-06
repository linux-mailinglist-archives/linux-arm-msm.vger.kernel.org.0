Return-Path: <linux-arm-msm+bounces-40657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9859E64E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8F018833F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98DD194AEB;
	Fri,  6 Dec 2024 03:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N5WNdaP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7919340C;
	Fri,  6 Dec 2024 03:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733455555; cv=none; b=KnyDmCANiNPRpnMwBMQZ7ytAfcerhDsYXzMfojMO39gj4gLoQRhqIeFtgG01WKXSYjyhU8Z2cw2dRNHWlq7DvxHB3PqM4q3wrVw73W13bcBb+fERyJ/gzUYSLUzMdR7EfQBP2jH49P0tSfOcJi7emgt308XDSOAsLpbaV23f5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733455555; c=relaxed/simple;
	bh=xMirmCHVS0lrRZ4cTLNGba8hedkBy/2Prr2PwxDJeVc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC2Qtuc42jEGrrpqYpwTq4rmU2Foh/Sz3EZdvBISL8FTyVLLFd4gyoqsrj5/mgkIWpBMpMur3zafrPHSLsXhyzDgiKh5KMpbVdclO2CHp46XhLEGCmeHTpZI/e8wOPuvng3v6Kz69OVPaGICeZMXk1sxLOfLRmKixv2QWxvbTe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N5WNdaP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaMpM020793;
	Fri, 6 Dec 2024 03:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SnltfcSCBo4D4mhycStlIBBn
	/z7ImSFBCKeEvs5Nhm8=; b=N5WNdaP44+KqYxfrsXBN+ofnrM8EyvCP3MfBOsFq
	WGsIix25pS81nuQ+cUBWGD8BUpwrVllKB+3mt8qiqUNjc75RjtKV9t9jJg05EB/J
	aBJVu9pNqFeTr8llxoWEJgrWcSAkNazxYOMpd+2app60REAirdmagmPEexZC+y0N
	BZxksk4BiTq9G6Mh/F5Rkhua11z2eSHI2Dq5imUVXeSnwhm9zXH1D7Ccy3zbk9/H
	3YyKvyr7iJWMLbyexZjj2C5WQEY0htSoAQVVGxf3bK+5bRdj82CzJVvGGpvxeNwt
	EdG3obNDDF3F2du0zwgFWdhfwlx8Gs87bB3L1ShWBvVytQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v801rn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 03:25:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B63PknD020353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 03:25:46 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 19:25:43 -0800
Date: Fri, 6 Dec 2024 11:25:38 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_zhgao@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v2] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <Z1JusoQc0dFdPoNv@cse-cd02-lnx.ap.qualcomm.com>
References: <20241127095029.3918290-1-quic_yuanjiey@quicinc.com>
 <lza5dbabt2eoipyrbgo47ftpsftcwggb4v6d53lqvsh7w7vp3n@f2ld34a53a2z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lza5dbabt2eoipyrbgo47ftpsftcwggb4v6d53lqvsh7w7vp3n@f2ld34a53a2z>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: REQgGjyFLtKTFBsgiA4tIK-ue4Fuu7XH
X-Proofpoint-GUID: REQgGjyFLtKTFBsgiA4tIK-ue4Fuu7XH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060023

On Thu, Nov 28, 2024 at 11:15:54AM -0600, Bjorn Andersson wrote:
> On Wed, Nov 27, 2024 at 05:50:29PM +0800, Yuanjie Yang wrote:
> > Qualcomm regulator supports two power supply modes: HPM and LPM.
> > Currently, the sdhci-msm.c driver does not set the load to adjust
> > the current for eMMC and SD. Therefore, if the regulator set load
> > in LPM state, it will lead to the inability to properly initialize
> > eMMC and SD.
> > 
> > Set the correct regulator current for eMMC and SD to ensure that the
> > device can work normally even when the regulator is in LPM.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> > Changes in v2:
> > - Add enum msm_reg_type to optimize the code
> 
> Please re-optimize the code to make it easy to read and understand.
Thanks, I will re-optimize my code.

> > - Delete redundant emmc type judgment
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/
> > 
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 92 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 90 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index e00208535bd1..fc13ef60ab61 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -134,9 +134,22 @@
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
> > +#define MAX_MMC_SD_VMMC_LOAD_UA  max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA)
> > +
> > +#define MAX_MMC_SD_VQMMC_LOAD_UA max(MMC_VQMMC_MAX_LOAD_UA, SD_VQMMC_MAX_LOAD_UA)
> > +
> >  #define msm_host_readl(msm_host, host, offset) \
> >  	msm_host->var_ops->msm_readl_relaxed(host, offset)
> >  
> > @@ -147,6 +160,11 @@
> >  #define CQHCI_VENDOR_CFG1	0xA00
> >  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
> >  
> > +enum msm_reg_type {
> > +	VMMC_REGULATOR,
> > +	VQMMC_REGULATOR,
> > +};
> > +
> >  struct sdhci_msm_offset {
> >  	u32 core_hc_mode;
> >  	u32 core_mci_data_cnt;
> > @@ -1403,11 +1421,71 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
> >  	return ret;
> >  }
> >  
> > -static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> > +static int sdhci_msm_get_regulator_load(struct mmc_host *mmc, int max_current,
> > +					enum msm_reg_type type)
> > +{
> > +	int load = 0;
> > +
> > +	/*
> > +	 * When eMMC and SD are powered on for the first time, select a higher
> > +	 * current value from the corresponding current for eMMC and SD to
> > +	 * ensure that the eMMC and SD cards start up properly and complete
> > +	 * initialization. After the initialization process is finished, use
> > +	 * the corresponding current to set the eMMC and SD to ensure the
> > +	 * normal work of the device.
> > +	 */
> > +
> > +	if (!mmc->card)
> > +		return max_current;
> 
> max_current is type == VMMC_REGULATOR ? MAX_MMC_SD_VMMC_LOAD_UA :
> MAX_MMC_SD_VQMMC_LOAD_UA;
> 
> Try to rewrite the patch so that you don't have the decisions spread
> across multiple levels in the callstack.
Thanks, I will optimzie this funcition in next version.

> > +
> > +	if (mmc_card_mmc(mmc->card))
> > +		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
> > +	else if (mmc_card_sd(mmc->card))
> > +		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;
> > +
> > +	return load;
> > +}
> > +
> > +static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
> > +				     bool hpm, int max_current, enum msm_reg_type type)
> > +{
> > +	int ret;
> > +	int load = 0;
> > +
> > +	/*
> > +	 * After the initialization process is finished, Once the type of card
> > +	 * is determined, only set the corresponding current for SD and eMMC.
> > +	 */
> > +
> > +	if (mmc->card && !(mmc_card_mmc(mmc->card) || mmc_card_sd(mmc->card)))
> > +		return 0;
> > +
> > +	if (hpm)
> > +		load = sdhci_msm_get_regulator_load(mmc, max_current, type);
> 
> Does !hpm happen when regulators are enabled or always together with a
> regulator_disable? (The regulator framework skips the load of disabled
> regulators when aggregating)
> 
Thanks.
When two or more consumer use the same regulator as eMMC/SD.
When !hpm happen, the regulator state can be enabled or disabled.

When the regulotor only used by eMMC/SD.
When !hpm happen, the regulator state is enabled, set load 0 means to
set let regulator enter LPM state.

Recently our team are discussing this issue, when two or more consumer
use the same regulator, one consumer set load can affect other consumer.

We are trying to do some fix on DTS, just to delete "regulator-allow-set-load"
and set regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>.
We are doing some experiment.

> > +
> > +	if (type == VMMC_REGULATOR)
> > +		ret = regulator_set_load(mmc->supply.vmmc, load);
> > +	else
> > +		ret = regulator_set_load(mmc->supply.vqmmc, load);
> > +	if (ret)
> > +		dev_err(mmc_dev(mmc), "%s: set load failed: %d\n",
> > +			mmc_hostname(mmc), ret);
> > +	return ret;
> > +}
> > +
> > +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
> > +			      struct mmc_host *mmc, bool hpm)
> >  {
> > +	int ret;
> > +
> >  	if (IS_ERR(mmc->supply.vmmc))
> >  		return 0;
> >  
> > +	ret = msm_config_regulator_load(msm_host, mmc, hpm,
> > +					MAX_MMC_SD_VMMC_LOAD_UA, VMMC_REGULATOR);
> 
> msm_config_regulator_load() is mostly 2 different functions with
> multiple levels of conditional code paths depending on this last
> parameter. Please try to refactor this to avoid overloading the
> functions like that.
Thanks, I will optimize my code in next version.

> 
> Regards,
> Bjorn
> 
> > +	if (ret)
> > +		return ret;
> > +
> >  	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> >  }
> >  
> > @@ -1435,6 +1513,15 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
> >  				goto out;
> >  			}
> >  		}
> > +
> > +		ret = msm_config_regulator_load(msm_host, mmc, level,
> > +						MAX_MMC_SD_VQMMC_LOAD_UA, VQMMC_REGULATOR);
> > +		if (ret < 0) {
> > +			dev_err(mmc_dev(mmc), "%s: vqmmc set regulator load failed: %d\n",
> > +				mmc_hostname(mmc), ret);
> > +			goto out;
> > +		}
> > +
> >  		ret = regulator_enable(mmc->supply.vqmmc);
> >  	} else {
> >  		ret = regulator_disable(mmc->supply.vqmmc);
> > @@ -1642,7 +1729,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
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
> >

Thanks,
Yuanjie


Return-Path: <linux-arm-msm+bounces-39240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E059DA0AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 03:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CE50168AA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 02:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75344288B5;
	Wed, 27 Nov 2024 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O4auedZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E49208C4;
	Wed, 27 Nov 2024 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732675169; cv=none; b=THHR6POOSLtFZ6uRqHdx3B48NoyksXMqQXwqYzNWujh1VBMb+gA9Lkpaf0n8SRQMaJ2bpLbZUSmherFyB7goMzd/zQmHdyIO+NMVH2/Zb8QNnQekqxhwVvN81UIllRpZIYrTHbSLXOZMRLV9SclmzeC69Bde10wz5Sf5K1L2QcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732675169; c=relaxed/simple;
	bh=nDVMp7oZ1MfEFQGe8BmgFuzjQzJ3q9e84tSp9XATVzI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPx/lF7Gq6XZJNWWkFnQ+NEsmZ3dvXYANgbiiv4ohnCeVDb1xPSPIqYc5an4VPHX1QSVFX/qk/4s5Um7Z1k/sMLpWkJtZ3iijHjkcSWczhxSoM+f4UrN5AfiYz6DVARJXj7vUIDDN8f9alN4xKlTmrPes2lalPVIsR9E5a90tqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O4auedZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLFrh011465;
	Wed, 27 Nov 2024 02:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKR4CyFsKZY1WikosxBOiyo7kYRZRY7WKvX8Ka9wIIE=; b=O4auedZFXJptF81M
	hNNOy/e0hX3V7ERiOsvqPkfkbws0aJIMWub4g2QrIKZlyTNcZy+RUhq98SkzWVcu
	RMweXTiRjj6koJaS8TsNL2WO/Q1H2Qv3SNw+weaJij/g1c7xIq0vhPs81YUwTjlg
	oP4eLHZhb7l88j07kDb6GAyvD/vT3v/zXyAn6hcGeuDKwMCKio/iFOHZXX/17JQD
	Z0qtH3aBi0W4WRECUJANEkitv7F6A5I0lVSQxyxRoXYOpHqng9rECKRlOBvr0F9Z
	eL+vi61FYdiw5hk2Vn1Cu1QQDXnVbVmCtZUhCnOExtYnWx9UraFQcWlhXDEQ/r8f
	DiJIQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435bf5jjb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 02:39:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR2dOuG026584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 02:39:24 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 18:39:20 -0800
Date: Wed, 27 Nov 2024 10:39:16 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_tengfan@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_zhgao@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v1] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <Z0aGVA4xtIa2G8Ei@cse-cd02-lnx.ap.qualcomm.com>
References: <20241122075048.2006894-1-quic_yuanjiey@quicinc.com>
 <10836ece-7ea9-47d6-ad0c-25ae36e5051b@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10836ece-7ea9-47d6-ad0c-25ae36e5051b@intel.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 23l1SoBfR03C2S3S_JwAhg9C63vCiOcW
X-Proofpoint-GUID: 23l1SoBfR03C2S3S_JwAhg9C63vCiOcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270021

On Tue, Nov 26, 2024 at 12:43:12PM +0200, Adrian Hunter wrote:
> On 22/11/24 09:50, Yuanjie Yang wrote:
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
> >  drivers/mmc/host/sdhci-msm.c | 91 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 89 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index e00208535bd1..f2a2260d54c6 100644
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
> > +enum {
> 
> This could be a named type and used instead of 'int'
> e.g.
> 
> enum msm_reg_type {
Thanks , I will fix it in next version.

> > +	VMMC_REGULATOR,
> > +	VQMMC_REGULATOR,
> > +};
> > +
> >  struct sdhci_msm_offset {
> >  	u32 core_hc_mode;
> >  	u32 core_mci_data_cnt;
> > @@ -1403,11 +1421,70 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
> >  	return ret;
> >  }
> >  
> > -static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> > +static int sdhci_msm_get_regulator_load(struct mmc_host *mmc, int max_current, int type)
> 
> Then 'int type' could be 'enum msm_reg_type type'
Thanks, I will fix it in next version.

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
> > +
> > +	if (mmc_card_is_removable(mmc) && mmc_card_mmc(mmc->card))
> 
> The comment mentions eMMC but here there is 'mmc_card_is_removable()'
> whereas eMMC's are not removable.  If this is right it needs some
> clarification.
Thanks, I also realize that mmc_card_is_removable(mmc) is an unnecessary
judgment. I will delete this judgment in next version.

> > +		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
> > +	else if (mmc_card_sd(mmc->card))
> > +		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;
> > +
> > +	return load;
> > +}
> > +
> > +static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
> > +				     bool hpm, int max_current, int type)
> 
> Again 'int type' could be 'enum msm_reg_type type'
Thanks, I will fix it in next version.

> > +{
> > +	int ret;
> > +	int load = 0;
> > +
> > +	/*
> > +	 * After the initialization process is finished, Once the type of card
> > +	 * is determined，only set the corresponding current for SD and eMMC.
> > +	 */
> > +
> > +	if (mmc->card && !(mmc_card_mmc(mmc->card) || mmc_card_sd(mmc->card)))
> > +		return 0;
> > +
> > +	if (hpm)
> > +		load = sdhci_msm_get_regulator_load(mmc, max_current, type);
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
> > +	if (ret)
> > +		return ret;
> > +
> >  	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> >  }
> >  
> > @@ -1435,6 +1512,15 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
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
> > @@ -1642,7 +1728,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
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


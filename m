Return-Path: <linux-arm-msm+bounces-23240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9D90F42F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0515828332C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA311155386;
	Wed, 19 Jun 2024 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O88b1a5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA631552E4;
	Wed, 19 Jun 2024 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718815111; cv=none; b=OgxzUFA35rq0AXg/UFbYxQLCSHXQsUr/x4F9T/DFQGkomi2PNcxIoPTQKPfR9VYHrAUpD3ztRyk79sfSJUK2gcNxbg9zNyNFc0tUZuvYrxulbosHrunLjGZ0Ku2tOuHbUekuIRc0dAu+cjquIv5y+WHz/bEPRe9lapKzYqEV838=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718815111; c=relaxed/simple;
	bh=UdbBJxTG5H/XAmGhWxdvKGiRkX0+K9lYkkTsjudCe9Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ0GtiMjzC7i+j8H4s+757zfLYUUURWZY6owAfUaoQ6U6EkJ9BIeIFTSGIb1v5fN4XKIddGXMy7xUVf2v05Q/SV0gLhCpTRz2H8Y6/jBOUH8Fy+pPy7RPxOnpIZhzTnEQYV8VrqTThtLolbKv4joGRjcIkcAi5hQh9Ixn0XegAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O88b1a5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9ZNlk005181;
	Wed, 19 Jun 2024 16:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=epno3NC8+/SM/GBEpeEQJDuT
	59p4r0Qdcc1jjNTyCDA=; b=O88b1a5pnmBJ34udW2LbvMZxXmEDsovM6SXODRaN
	47OLWwShcYIwnIRU8k3hnF42FDHl58mnnLpR8Jd/n34rjY+hPw49te7Unq55QTQy
	f087TLhGQ17LhPmv2T4xppZWObQRN5ch9x3Q4t0hhHLEXPDZ9b7SFl8K5Yww3IeI
	a+x91csjWFJJUNMNB2/DJla+sSkBqlwmwZX1pHfaxO7FkGcv81vOyXerk3VVyEJQ
	wcrKOrB+vAKEG2PzjyISkJPqZaYCAufI3Ic5tHcLYBMrjoXwutM9nkbEWAMl0VIk
	wh9Yb+Q98b6yTjd4ZIVj8h1hpkOSyLgPR4Pzbmq6j580wg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja7a88s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 16:38:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JGcHnS001798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 16:38:17 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 09:38:14 -0700
Date: Wed, 19 Jun 2024 22:08:10 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Komal Bajaj
	<quic_kbajaj@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Message-ID: <ZnMJcuJ0DvDHaY4S@hu-mojha-hyd.qualcomm.com>
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
 <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
 <rx4kwsdzprnblczndf4t4ditxl64dztkzooqljpvz6eehuqqgy@rv745qkxmxmq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rx4kwsdzprnblczndf4t4ditxl64dztkzooqljpvz6eehuqqgy@rv745qkxmxmq>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TJP7JMBMUE4giihkU3MUl2wJhqV3pyCg
X-Proofpoint-GUID: TJP7JMBMUE4giihkU3MUl2wJhqV3pyCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190125

On Wed, Jun 19, 2024 at 04:14:50PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 19, 2024 at 05:40:42PM GMT, Mukesh Ojha wrote:
> > On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
> > > On 19/06/2024 12:56, Komal Bajaj wrote:
> > > > Enable the secure QFPROM driver which is used by QDU1000
> > > 
> > > Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
> > > Qualcomm downstream stuff.
> > > 
> > > > platform for reading the secure qfprom region to get the
> > > > DDR channel configuration.
> > > > 
> > > > Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> > > > ---
> > > >  arch/arm64/configs/defconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index 838b4466d6f6..c940437ae1b3 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
> > > >  CONFIG_NVMEM_MESON_EFUSE=m
> > > >  CONFIG_NVMEM_MTK_EFUSE=y
> > > >  CONFIG_NVMEM_QCOM_QFPROM=y
> > > > +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
> > > 
> > > Module
> > 
> > Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
> > Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
> > should be m or both y
> 
> Looking back in time, CONFIG_NVMEM_QCOM_QFPROM was enabled as built-in
> to get TSENS to work (which makes sense, we don't want the CPUs to
> burn). What the actual users for NVMEM_QCOM_SEC_QFPROM?


CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM are similar driver
for same device and only difference is register region lies in secure space
for the latter;

Currently, LLCC is the only client for CONFIG_NVMEM_QCOM_SEC_QFPROM, however
if someday if the region lies in non-secure space in that case, client
started depending on CONFIG_NVMEM_QCOM_QFPROM.

It reminds me, we have not yet put depends on for LLCC on NVMEM_QCOM_SEC_QFPROM
doing which is resulting in recursive dependency[1].

It looks we need to select NVMEM_QCOM_SEC_QFPROM from QCOM_LLCC config and that
may not need config enablement here.

[1]
fs/sysfs/Kconfig:2:error: recursive dependency detected!
fs/sysfs/Kconfig:2:     symbol SYSFS is selected by CONFIGFS_FS
fs/configfs/Kconfig:2:  symbol CONFIGFS_FS is selected by GPIO_SIM
drivers/gpio/Kconfig:1884:      symbol GPIO_SIM depends on GPIOLIB
drivers/gpio/Kconfig:6: symbol GPIOLIB is selected by I2C_MUX_LTC4306
drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C_MUX
drivers/i2c/Kconfig:62: symbol I2C_MUX is selected by DRM_SII902X
drivers/gpu/drm/bridge/Kconfig:270:     symbol DRM_SII902X depends on DRM_BRIDGE
drivers/gpu/drm/bridge/Kconfig:2:       symbol DRM_BRIDGE is selected by DRM_MSM
drivers/gpu/drm/msm/Kconfig:3:  symbol DRM_MSM depends on QCOM_LLCC
drivers/soc/qcom/Kconfig:47:    symbol QCOM_LLCC depends on NVMEM_QCOM_SEC_QFPROM
drivers/nvmem/Kconfig:230:      symbol NVMEM_QCOM_SEC_QFPROM depends on NVMEM
drivers/nvmem/Kconfig:2:        symbol NVMEM is selected by EEPROM_AT24
drivers/misc/eeprom/Kconfig:4:  symbol EEPROM_AT24 depends on SYSFS
For a resolution refer to Documentation/kbuild/kconfig-language.rst

-Mukesh

> 
> > 
> > -Mukesh
> > > 
> > > >  CONFIG_NVMEM_RMEM=m
> > > >  CONFIG_NVMEM_ROCKCHIP_EFUSE=y
> > > >  CONFIG_NVMEM_ROCKCHIP_OTP=y
> > > > --
> > > > 2.42.0
> > > > 
> > > 
> > > Best regards,
> > > Krzysztof
> > > 
> 
> -- 
> With best wishes
> Dmitry


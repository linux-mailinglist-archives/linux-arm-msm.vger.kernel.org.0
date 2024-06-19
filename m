Return-Path: <linux-arm-msm+bounces-23243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5B90F47A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41DA01C212EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F29115442F;
	Wed, 19 Jun 2024 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ieg0eJR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1669137747;
	Wed, 19 Jun 2024 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718815923; cv=none; b=SD9pksHw08QHiVvlhTdt36mlemtdLreS0E5NY9davrBW4QVnQ6Uim8dmEGqWrXA49WhMMGC6nDSM5/204Kat97HheCz9IgK+7jQUhGIiAg9z33IasBdz9LwHtok0LfK3tI11y6jj2QkpWG4rYdLOglz+aSTRqPb5HCiMQ/Nvmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718815923; c=relaxed/simple;
	bh=Sj+WBa+DSBjxuBfeKQcqoGagHK49RQ07mDG02pVwJAg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BflphDAyBOJlJNV2vPFPwCd5Rvbtg/jxQGtE/YHMBpGQ7sekm33axpsOm+M2NMnZ2uepyZZ+ggI1cSrcRfX0evcfM/eLrwENNSIBrYmfgqKcpqc4XBosUGWHNNAdxx+R2iyx0QwqBYmbcFWukpMw3mPkpmDA70HppQCvCLpEluY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ieg0eJR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JCd8Jt015762;
	Wed, 19 Jun 2024 16:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZtSpn6SyjwwlYrXD4q1FEaQe
	iqwSqwW0keBRiBZEKiM=; b=Ieg0eJR65kS8XOhYgxf1jJBXXaLpiZGD5AQuoNf9
	cHdEgWnSr2n78KTW4OeZmDmZVVgROeYtNYgUX8Kkcfgx6kZj+N2ldzmkqwSIKUdB
	d7vrtXklWZLd4to2FX7QpzW8mvgEA10NyWOOSEvF50S4DkIneJAL3nEZtAPyT5JS
	GdmPUCrdlISmcFv4AQehR4digo/NbO2S7VoYLF2vzVr2A6P53znkGHSzBD5tYYa5
	tPTk4mta1bAmtkBp495ySuQnOvLe/nVez8HZy0po9wk6FkzshNqQDIsEsgxFIE0O
	6YudOiU+zsFbiBqgt6jeEVgrvq3xKJ86Y+ZmCRjOc3pnDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja528hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 16:51:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JGpone013566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 16:51:50 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 09:51:49 -0700
Date: Wed, 19 Jun 2024 09:51:48 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Komal Bajaj <quic_kbajaj@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Message-ID: <ZnMMpKdsGURdgAaM@hu-bjorande-lv.qualcomm.com>
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
 <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
 <rx4kwsdzprnblczndf4t4ditxl64dztkzooqljpvz6eehuqqgy@rv745qkxmxmq>
 <ZnMJcuJ0DvDHaY4S@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnMJcuJ0DvDHaY4S@hu-mojha-hyd.qualcomm.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C4yrpiKk4IbeQd86rHYIvzacyxOj0FSz
X-Proofpoint-GUID: C4yrpiKk4IbeQd86rHYIvzacyxOj0FSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190127

On Wed, Jun 19, 2024 at 10:08:10PM +0530, Mukesh Ojha wrote:
> On Wed, Jun 19, 2024 at 04:14:50PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Jun 19, 2024 at 05:40:42PM GMT, Mukesh Ojha wrote:
> > > On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
> > > > On 19/06/2024 12:56, Komal Bajaj wrote:
> > > > > Enable the secure QFPROM driver which is used by QDU1000
> > > > 
> > > > Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
> > > > Qualcomm downstream stuff.
> > > > 
> > > > > platform for reading the secure qfprom region to get the
> > > > > DDR channel configuration.
> > > > > 
> > > > > Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> > > > > ---
> > > > >  arch/arm64/configs/defconfig | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > > index 838b4466d6f6..c940437ae1b3 100644
> > > > > --- a/arch/arm64/configs/defconfig
> > > > > +++ b/arch/arm64/configs/defconfig
> > > > > @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
> > > > >  CONFIG_NVMEM_MESON_EFUSE=m
> > > > >  CONFIG_NVMEM_MTK_EFUSE=y
> > > > >  CONFIG_NVMEM_QCOM_QFPROM=y
> > > > > +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
> > > > 
> > > > Module
> > > 
> > > Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
> > > Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
> > > should be m or both y
> > 
> > Looking back in time, CONFIG_NVMEM_QCOM_QFPROM was enabled as built-in
> > to get TSENS to work (which makes sense, we don't want the CPUs to
> > burn). What the actual users for NVMEM_QCOM_SEC_QFPROM?
> 
> 
> CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM are similar driver
> for same device and only difference is register region lies in secure space
> for the latter;
> 
> Currently, LLCC is the only client for CONFIG_NVMEM_QCOM_SEC_QFPROM, however
> if someday if the region lies in non-secure space in that case, client
> started depending on CONFIG_NVMEM_QCOM_QFPROM.
> 
> It reminds me, we have not yet put depends on for LLCC on NVMEM_QCOM_SEC_QFPROM
> doing which is resulting in recursive dependency[1].
> 

Kconfig "depends on" describes build time dependencies and LLCC doesn't
depend on NVMEM_QCOM_SEC_QFPROM.

It does depend on nvmem_cell_read_u8() being defined, but as
CONFIG_NVMEM is bool there will either be a proper implementation (=y)
or a static inline stub (=n) of this function, so we don't need to
describe this dependency.

> It looks we need to select NVMEM_QCOM_SEC_QFPROM from QCOM_LLCC config and that
> may not need config enablement here.
> 

This is a runtime dependency, created through the nvmem framework by the
relationship defined in DeviceTree. We don't describe those.

Regards,
Bjorn

> [1]
> fs/sysfs/Kconfig:2:error: recursive dependency detected!
> fs/sysfs/Kconfig:2:     symbol SYSFS is selected by CONFIGFS_FS
> fs/configfs/Kconfig:2:  symbol CONFIGFS_FS is selected by GPIO_SIM
> drivers/gpio/Kconfig:1884:      symbol GPIO_SIM depends on GPIOLIB
> drivers/gpio/Kconfig:6: symbol GPIOLIB is selected by I2C_MUX_LTC4306
> drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C_MUX
> drivers/i2c/Kconfig:62: symbol I2C_MUX is selected by DRM_SII902X
> drivers/gpu/drm/bridge/Kconfig:270:     symbol DRM_SII902X depends on DRM_BRIDGE
> drivers/gpu/drm/bridge/Kconfig:2:       symbol DRM_BRIDGE is selected by DRM_MSM
> drivers/gpu/drm/msm/Kconfig:3:  symbol DRM_MSM depends on QCOM_LLCC
> drivers/soc/qcom/Kconfig:47:    symbol QCOM_LLCC depends on NVMEM_QCOM_SEC_QFPROM
> drivers/nvmem/Kconfig:230:      symbol NVMEM_QCOM_SEC_QFPROM depends on NVMEM
> drivers/nvmem/Kconfig:2:        symbol NVMEM is selected by EEPROM_AT24
> drivers/misc/eeprom/Kconfig:4:  symbol EEPROM_AT24 depends on SYSFS
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> 
> -Mukesh
> 
> > 
> > > 
> > > -Mukesh
> > > > 
> > > > >  CONFIG_NVMEM_RMEM=m
> > > > >  CONFIG_NVMEM_ROCKCHIP_EFUSE=y
> > > > >  CONFIG_NVMEM_ROCKCHIP_OTP=y
> > > > > --
> > > > > 2.42.0
> > > > > 
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > > 
> > 
> > -- 
> > With best wishes
> > Dmitry


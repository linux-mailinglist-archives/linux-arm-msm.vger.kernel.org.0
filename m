Return-Path: <linux-arm-msm+bounces-23241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3E90F45A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577D81C20FD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DF2153561;
	Wed, 19 Jun 2024 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZPXWmsbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B36152E03;
	Wed, 19 Jun 2024 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718815381; cv=none; b=ljAjIfZNYa+13JYs1+jLtxaF/HT1LNQnIAQ3el993s6ZIM3x5b85z+8dCIc/SZASVomTiZH7D1TbB0uVb1JE4W5YjaxEb1f6IRp6AYKBy9IMP9G6gLtCu5hYBcbbxmf7LqHPmkLmRKdud8Nqa15cCIVXZVX46MqnpBEGKzq9Cw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718815381; c=relaxed/simple;
	bh=HeFWIql8WvfKUjhc39BHLfpmBN+1hNgfOVuC7JkBEao=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8hpHH/bDzboOyp89pUFt3j0ZVMV46XkGfVKX6GOCVb99n6FNpZ60V7QVat/GemqC5UMQqhpK0zQwoYMHklIlU/Hq6GzfMXxJNoXrkONIL0gdY4nSP33O40FTghSwwMqbibRKyky18e28GSsTbJWbdun/0PvHHt05dUzE3DzxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZPXWmsbw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9iYT8006366;
	Wed, 19 Jun 2024 16:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BlarIrnp0GcxUr7gIYgWhp8w
	dHKf+CCuGDcT7t8HYcM=; b=ZPXWmsbwJCncOzhDFXiCZOE1EJiFss2LeJCBqbv7
	q1PseBdsbKXkMZqe5wZF4GIcS81FBZgFLeMpePSQpkREJRnoeu3DXInSWfUaEtj0
	ZAKnk7E9nsskESEm0rv6JAw246UBvkejZJsmIV+rlTVN7qr/trxMD5PC6sSxxKAi
	2s9uNZ3nfRcBHBwzCGIJlClzA0ASED5GYyfssOin54BdHNPvEzMjSDEatZL5hj0z
	nNwHkOgv4NcXKNx1YRyKl2C4D0VVTEn8QGXaHY5iNhENQvH77SnYZX+YjYAIDwOZ
	qvE+QnKfbsjxIQtaAWlhBtEBCIFavYyx6KqbAFdYneCbxQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9u2a6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 16:42:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JGgnAv008085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 16:42:50 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 09:42:49 -0700
Date: Wed, 19 Jun 2024 09:42:47 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Komal Bajaj
	<quic_kbajaj@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Message-ID: <ZnMKh5X+Bm11L/T4@hu-bjorande-lv.qualcomm.com>
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
 <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BlaNvEd8EWQquUAqknmpzG3imDrNALh9
X-Proofpoint-ORIG-GUID: BlaNvEd8EWQquUAqknmpzG3imDrNALh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=604 clxscore=1011 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190125

On Wed, Jun 19, 2024 at 05:40:42PM +0530, Mukesh Ojha wrote:
> On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
> > On 19/06/2024 12:56, Komal Bajaj wrote:
> > > Enable the secure QFPROM driver which is used by QDU1000
> > 
> > Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
> > Qualcomm downstream stuff.
> > 
> > > platform for reading the secure qfprom region to get the
> > > DDR channel configuration.
> > > 
> > > Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 838b4466d6f6..c940437ae1b3 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
> > >  CONFIG_NVMEM_MESON_EFUSE=m
> > >  CONFIG_NVMEM_MTK_EFUSE=y
> > >  CONFIG_NVMEM_QCOM_QFPROM=y
> > > +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
> > 
> > Module
> 
> Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
> Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
> should be m or both y
> 

While that would be a convenient guideline, you're adding runtime
overhead to all other targets (Qualcomm and non-Qualcomm) so the desire
to keep anything that can module outweigh such convenience.

Based on the recent addition of llcc and qfprom nodes I'm _guessing_
that LLCC is the one user of this today, and it is =m, so therefore
SEC_QFPROM can be =m as well.


By expanding the commit message slightly, we could have avoided the
"why?" questions and the need for me to "guess" the actual dependency.

Regards,
Bjorn

> -Mukesh
> > 
> > >  CONFIG_NVMEM_RMEM=m
> > >  CONFIG_NVMEM_ROCKCHIP_EFUSE=y
> > >  CONFIG_NVMEM_ROCKCHIP_OTP=y
> > > --
> > > 2.42.0
> > > 
> > 
> > Best regards,
> > Krzysztof
> > 


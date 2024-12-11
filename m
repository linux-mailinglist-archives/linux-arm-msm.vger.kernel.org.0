Return-Path: <linux-arm-msm+bounces-41384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C487A9EC0FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3C718891CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 00:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4291B29D05;
	Wed, 11 Dec 2024 00:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cwx5Gojo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F1259C;
	Wed, 11 Dec 2024 00:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877479; cv=none; b=gTzlia0WNaeg4pgkll0NqM2uosEYDeOFxovJlRShR3KpQrl0p2CTYsSFy2UCI1SBbXd1Fpy2kt4yPKHpp6HOJcAxjaNID3YKr6hZraSh61RljiLW3EM3PJeZz8Kzzki2JtRq5KApvU9wVGDzXzn2gWQcWsytQcqeujTuBEocS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877479; c=relaxed/simple;
	bh=v811ZU3sV6/EG8JxkRZnks9X9x8zSBV7bWxRiUI0HsY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br5HDGcI5lmSv+qeMW+DfvDqQhl8q9ZYSHCG6UmHLxlQLxHTik3nGAHLqQE0z6HisGbMtltZlMUlDeinmxh52AinPJfwxkcX3HBhMSrkLx3YjjHFNm9Nl3LpkGyxmm6bqu8EIRIx3IMTDQm174POhkd8ZJJ3dV/8CjivMYB/lW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cwx5Gojo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAGa3Uh024768;
	Wed, 11 Dec 2024 00:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmIRd3iGai9B8GwQnitcTjV6
	mPEycuUXQCqAtqWaspI=; b=cwx5GojoORS34usLwO6coUU47gO6SMjRDwh+Gz0Q
	7xzGgYSS22GTCw0bCquQtxw6NunQm/Cudm5yjax4Cvcgit3494QMcWMac89qE0sv
	MUmFU+3hvVHIWDao1AnK/b9v/4TVaGqs8x+sGoXL9uWH7fmKsTdYGnsIvPZqXbO+
	DBBR09U0cAmS14/2+l6Hogn8wNtSxsUQ14kuLpvXC5QUCz9EBfui1p5dosR3i1jn
	W5Wzgy47NK0Y8X7GfkNegIxG95AgIemN7Hmg2GQUNspvaRo8DYr6Fw2zYCplJxyd
	fE83H/3y5cfYHAm4Qf9Wkelfxgt3KYeAgkZ2VjJsPUju3g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceettc8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:37:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB0bgdg009896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:37:42 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 16:37:37 -0800
Date: Wed, 11 Dec 2024 06:07:34 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Marc Zyngier <maz@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        "Pavan
 Kondeti" <quic_pkondeti@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ed2fs03w.wl-maz@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZVxb1h32_u863zORd3fXSAbJrr3RcbYa
X-Proofpoint-ORIG-GUID: ZVxb1h32_u863zORd3fXSAbJrr3RcbYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0 mlxlogscore=839
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110002

On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > +{
> > +	int ret;
> > +
> > +#ifdef CONFIG_ARM64
> > +	/*
> > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > +	 */
> > +	if (is_kernel_in_hyp_mode())
> > +		goto direct_switch;
> 
> No, please. To check whether you are *booted* at EL2, you need to
> check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> none of the driver's business, really. This is still absolutely
> disgusting from an abstraction perspective, but I guess we don't have
> much choice here.
> 

Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
available for modules? Do you prefer exporting
kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
try something like [1]?

[1]
https://lore.kernel.org/lkml/1443649252-10702-1-git-send-email-ralf@ramses-pyramidenbau.de/#t

Thanks,
Pavan


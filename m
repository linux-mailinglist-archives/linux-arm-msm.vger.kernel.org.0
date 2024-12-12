Return-Path: <linux-arm-msm+bounces-41653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A77169EDEEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 06:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB0A283AAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 05:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78A126BFF;
	Thu, 12 Dec 2024 05:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nPNTCbkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8E748A;
	Thu, 12 Dec 2024 05:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733981500; cv=none; b=iFEO7MIkeIjeXNpxxzBGcIobous7o+/aUrbYD4ry3dlUcTbDnufqsaXcfOAaXbwJ082/ukfm+mKCHyHtAqfa2cy710ZINd4RzV/pyt9U4L1t8n2Q6DwGrcs8n/GtE9QL5QtIkQ5GZs59bS37S8U68uozAxBWt7UR3dafdoqczLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733981500; c=relaxed/simple;
	bh=sUQo9dfMpH+GFJaGCl09MLqV25NWmWPoDt0EvN3xI2o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMv96dOf8YCVuJQxEwqJyw4KC74MqHd3UhTyUqUejc8EqG1rj8w7iO/Qth0ZhzOgO9GJrohjntBPox8OWEiWKiUlZzuSXzG/SBgUezCKg5islNXoDKbQJtHlMS5WYuJ3aEZLQTjTO/1CSCmjau5/DZhlHCDePrLufW1ZNa/kyNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nPNTCbkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD59G002087;
	Thu, 12 Dec 2024 05:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9+wJ+4THMZ6aKAeDHGQEFe1
	hJ+XvdzKUMLTnVrjnRQ=; b=nPNTCbkfWfCu1Te64iYQgIXGCFr8bTR33PE4GjrL
	9kVDhksvM8ujfIKTSZFleSwdeavUPq7cAvuAdyFGTD6UianYJ2zMVCK+dkESgpHn
	Ej5e9dBFYyr3EZCwTnh1fHJa9iaKen0r3icOq5f27zqDZhlekAKrZfUrIVWpHd0u
	ynf2kx7+zX/u0q+0Xw+suOzNnbHmotFLP0X9hLw2NmHGA1ACCZ2kuZfoUWbKhFL2
	0R7d/tdlT/nO7hjpuZz5+q2F8gmrv9mXFqjmbn3DHKmZzy4pqg4P+L1wo8rIsJSR
	63si0/SyuyHETlHcmZqV5BjP0xLY1rqB8CkCvaTL2+rFHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9v76c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 05:31:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC5V804029685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 05:31:08 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 21:31:03 -0800
Date: Thu, 12 Dec 2024 11:01:00 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Marc Zyngier <maz@kernel.org>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Akhil P Oommen
	<quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Elliot Berman
	<quic_eberman@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <c197264b-3791-493a-b717-3dfd844de922@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
 <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
 <86sequsdtp.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86sequsdtp.wl-maz@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tyQb_xK72c8u2XdN2OgQP_4VMJmSutu8
X-Proofpoint-GUID: tyQb_xK72c8u2XdN2OgQP_4VMJmSutu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=968
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120037

On Wed, Dec 11, 2024 at 10:40:02AM +0000, Marc Zyngier wrote:
> On Wed, 11 Dec 2024 00:37:34 +0000,
> Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > 
> > On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > > > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +#ifdef CONFIG_ARM64
> > > > +	/*
> > > > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > > > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > > > +	 */
> > > > +	if (is_kernel_in_hyp_mode())
> > > > +		goto direct_switch;
> > > 
> > > No, please. To check whether you are *booted* at EL2, you need to
> > > check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> > > none of the driver's business, really. This is still absolutely
> > > disgusting from an abstraction perspective, but I guess we don't have
> > > much choice here.
> > > 
> > 
> > Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
> > available for modules? Do you prefer exporting
> > kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
> > try something like [1]?
> 
> Ideally, neither. These were bad ideas nine years ago, and they still
> are. The least ugly hack I can come up with is the patch below, and
> you'd write something like:
> 
> 	if (cpus_have_cap(ARM64_HAS_EL2_OWNERSHIP))
> 		blah();
> 
> This is obviously completely untested.
> 

I have tested your patch. It works as intended. Thanks Marc.

> It also doesn't solve the problem of the kernel booted on bare-metal
> at EL1, or with a hypervisor that doesn't change the programming
> interface of the device under the guest's feet. Eventually, someone
> will have to address these cases.
> 

Noted, Thanks.

~Pavan


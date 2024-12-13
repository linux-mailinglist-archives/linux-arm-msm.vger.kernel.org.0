Return-Path: <linux-arm-msm+bounces-41878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33C9F02E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 04:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1307281539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 03:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D7D13D246;
	Fri, 13 Dec 2024 03:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D00ONeSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70022AD14;
	Fri, 13 Dec 2024 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734059154; cv=none; b=fn/1lI80JXwNJkTuQJiot3r7hgk/46YG5ojZ51ldnULSc+5ir5tbUz5XFpkKwY5AOdh81sW0y6h31TbWgF+4goL6ul3aYmE5bs7y3xHRIg2XsxVA/lRXc/2rI/1YKNqVFnJgWHWRiN/7bhSnFJBVBaPHpvB2bHler5m3qo3gmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734059154; c=relaxed/simple;
	bh=OLQG4WLA6+0h312mnxc/bRrFpXFgP1B1ifPDM/gfcKI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMH8ELidlbzvob252nQ9N+oAsFX2q/aHXTX/JZiHQvy2jLHjIQMd7MidlGkvkdirbYhITA53V+1AYrbPQISJtxaTiRQqZ3JGb3uWfEuomRTiTTwnTA0oWWadqqwbkvpPDKKRgH7AO9dkAIWda+Fty+M6HD5Kd2VgIn7eX/b+P/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D00ONeSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCKpm2l030100;
	Fri, 13 Dec 2024 03:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xb6eCXHuesyabFIl/WlILqji
	0wRnUDU75m+XOpTvLxw=; b=D00ONeSXSFaCFljGXmK+LJBTFuaHOMIGifYyc7te
	+unwx1c5w4YGNom07met5f/QA3NTDRc+GlMt0K1i+dEPr7zJ9Oj/TNrmxgeLY2wL
	SbOzNehc7ldtgipGJKJixnNcazczbAQ/wtPgPlWGuKOeaIY+NLP7l0ntR0e4zllt
	qhR5nfkf/3kWu8UTVx4LsKYnt2CJxZu1Arv+U9ZV5t73cLIzUhSW9VjOE/gHrWHj
	PB2GgQ/ZTW13gfLza+Yo5I4JGQQmeHIR8Svik8appvaKJkAnEPes26z1tF8TWIvm
	2rzVFvpb0jJLu2BpggydN1G1Cq1awVIdCjpElC4WapiKcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgejcvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:05:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD35aJ3007215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:05:36 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 19:05:30 -0800
Date: Fri, 13 Dec 2024 08:35:27 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: Marc Zyngier <maz@kernel.org>, Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <b71d89f9-fb72-405a-b5bf-a09a796561bb@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
 <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
 <86sequsdtp.wl-maz@kernel.org>
 <c197264b-3791-493a-b717-3dfd844de922@quicinc.com>
 <87bjxhs2t7.wl-maz@kernel.org>
 <Z1q9rnzOlB9J5dXb@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z1q9rnzOlB9J5dXb@J2N7QTR9R3>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dOH1GB_cEQesfUdqXmPeq8eFmXp0QQAP
X-Proofpoint-ORIG-GUID: dOH1GB_cEQesfUdqXmPeq8eFmXp0QQAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130022

On Thu, Dec 12, 2024 at 10:40:46AM +0000, Mark Rutland wrote:
> On Thu, Dec 12, 2024 at 08:50:12AM +0000, Marc Zyngier wrote:
> > On Thu, 12 Dec 2024 05:31:00 +0000,
> > Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > > 
> > > On Wed, Dec 11, 2024 at 10:40:02AM +0000, Marc Zyngier wrote:
> > > > On Wed, 11 Dec 2024 00:37:34 +0000,
> > > > Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > > > > 
> > > > > On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > > > > > > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > > > > > > +{
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +#ifdef CONFIG_ARM64
> > > > > > > +	/*
> > > > > > > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > > > > > > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > > > > > > +	 */
> > > > > > > +	if (is_kernel_in_hyp_mode())
> > > > > > > +		goto direct_switch;
> > > > > > 
> > > > > > No, please. To check whether you are *booted* at EL2, you need to
> > > > > > check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> > > > > > none of the driver's business, really. This is still absolutely
> > > > > > disgusting from an abstraction perspective, but I guess we don't have
> > > > > > much choice here.
> > > > > > 
> > > > > 
> > > > > Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
> > > > > available for modules? Do you prefer exporting
> > > > > kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
> > > > > try something like [1]?
> > > > 
> > > > Ideally, neither. These were bad ideas nine years ago, and they still
> > > > are. The least ugly hack I can come up with is the patch below, and
> > > > you'd write something like:
> > > > 
> > > > 	if (cpus_have_cap(ARM64_HAS_EL2_OWNERSHIP))
> > > > 		blah();
> > > > 
> > > > This is obviously completely untested.
> > > > 
> > > 
> > > I have tested your patch. It works as intended. Thanks Marc.
> > 
> > Note that you will probably get some push-back from the arm64
> > maintainers on this front, because this is a fairly incomplete (and
> > fragile) solution.
> > 
> > It would be much better if the discriminant came from the device tree.
> > After all, the hypervisor is fscking-up^W^Wchanging the programming
> > model of the GPU, and that should be reflected in the DT. Because for
> > all intent and purposes, this is not the same hardware anymore.
> 
> FWIW I agree 100%, this should be described in DT.
> 
> The cpucap doesn't describe the actual property we care about, and it
> cannot in general (e.g. for nested virt). I would strongly prefer to not
> have that as it's setting ourselves up for failure.
> 
Thanks for the feedback. I understand that EL2 detection in kernel is
not going to cover cases like bare metal EL1, nested virtualization. We
plan to take the DT approach. 

Thanks,
Pavan


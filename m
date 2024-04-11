Return-Path: <linux-arm-msm+bounces-17294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A28A20E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE9D1F22073
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FB429437;
	Thu, 11 Apr 2024 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V0jcqVA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC9F199AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870875; cv=none; b=QCxHF9l8yJZRkV6chT7gkuw5+sqZOhZmxW1/2UjtUnEY0ETtjo4ySu+NcXk0kEjFWZBxUachRwLKJ9PhPl9jeIIjaKUf8HrqxyEwcxcY7pV+hQ+8eJj2ZvJtKcsVLwhUVhCWzCbvb3pcMcFtVunegNXmGaswsn4xOdqpLgC52AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870875; c=relaxed/simple;
	bh=kwRhZMwXXUcifkPLC0mODAxwyi2u5R303y08rmbakh8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=We56oAHEiS+bDGmJBNYrj8esTozha2jF2KQoTOXi24czpcZxBk5LJ5z4wkRBrpRPzMoRbas9aiAh6ljWsGsDGHt2t5MLm9ymsRDpuvMDyK43SoRm+BXKmd96UUSN5Hd4t5R7niTiTwKI8MxBlksFm7N83whPXKWgS/Hs8MPOIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V0jcqVA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BJg6IZ025150;
	Thu, 11 Apr 2024 21:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=Zs72AbQbBGqPIGWWe9BGZ
	BqxacLpJknp2H5m/YVTmgc=; b=V0jcqVA3jYqIbPjUABYwBr1wUxBfdboyGpVEv
	xnp/q8nneNK/+8k4YkJPVwefGpEaOBGyvnpsduhdZkT3q9Oz+Myya8ZmAim5Xs35
	/4eY+HXq6GrmODTXZcqI7NLBev2SP040UEgxaK3OcyvHLHNw8ycx4lUe0RqaHI9w
	PDMBmKzwl6LbVcCA+5cRuJoPPywICO6SLXKShSK9iSgrMzZ97XnMQnfglCKFy14U
	mOmhRQN9QNfoybNqFq60t188oGObyaM99o0D4wQZgdzdC6nQ57Sq55p9zyt7kYd0
	gKlCjofy4NttrrCg0WtYKebeqpg4iQ5tHOIBW2ZhYQCafgT1A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeb62ahsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:27:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BLRhue004775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:27:43 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 14:27:43 -0700
Date: Thu, 11 Apr 2024 14:27:41 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mike Tipton <quic_mdtipton@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
Message-ID: <ZhhVzepBYQLRPGtj@hu-bjorande-lv.qualcomm.com>
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
 <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
 <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
 <CAA8EJppAw9F8OnSW35xmYv_abzYaHp_EKtDgo7hgtE00-UmAFg@mail.gmail.com>
 <ZhgD77bEoSiOmO3X@hu-bjorande-lv.qualcomm.com>
 <20240411165528.GA14853@hu-mdtipton-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240411165528.GA14853@hu-mdtipton-lv.qualcomm.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fxNk6iaaEoi6JiesEdBIPILk3qh6sbae
X-Proofpoint-GUID: fxNk6iaaEoi6JiesEdBIPILk3qh6sbae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110154

On Thu, Apr 11, 2024 at 09:55:28AM -0700, Mike Tipton wrote:
> On Thu, Apr 11, 2024 at 08:38:23AM -0700, Bjorn Andersson wrote:
> > On Thu, Apr 11, 2024 at 06:31:08AM +0300, Dmitry Baryshkov wrote:
> > > On Thu, 11 Apr 2024 at 06:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > >
> > > > On Wed, Apr 10, 2024 at 01:12:15AM +0300, Dmitry Baryshkov wrote:
> > > > > On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > > > > On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > > > > > > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > > > > > > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > > > > > >
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > ---
> > > > > >
> > > > > > =y for console?
> > > > >
> > > > > I think with pinctrl being set to m it won't reach the console anyway.
> > > > > And earlycon should work w/o ICC driver if I'm not mistaken.
> > > > >
> > > > > Several other Qualcomm platforms also have interconnects built as
> > > > > modules in defconfig. I really suppose that we should move all such
> > > > > drivers to =m and force using initrd. But this sounds like a topic for
> > > > > plumbers.
> > > > >
> > > >
> > > > That currently does not work very well, because if you probe defer the
> > > > UART into the future e.g. systemd will open /dev/console before it
> > > > exist - with no interest in reopening that later.
> > > >
> > > > So, if you care about UART, that is suboptimal.
> > > >
> > > > Resolve this, and I'd be happy to see them all go =m.
> > > 
> > > Doesn't /dev/console handle switching between earlycon and actual
> > > console? I'll take a look at some point in the future.
> > > 
> > 
> > It does not, selection happens at open(). So user space need to reopen
> > /dev/console once the console has been updated.
> > 
> > > But I can't help but notice that currently we have 5 ICC drivers built
> > > as modules (out of 21 mentioned in the defconfig). Should we fix them
> > > too?
> > 
> > I reviewed this a while back, at which time none of these had
> > interconnects specified for their UART device.
> > 
> > The lack of icc is likely a problem at some point, in which case this
> > would need to be updated. But at this time (at the time I looked at it),
> > there was no problem to motivate such change with.
> 
> Note that on Android we have no choice but to build the interconnect
> drivers as modules. Vendor support is added as modules loaded on the
> vendor-agnostic GKI kernel. We don't have issues with earlycon there.
> That being said, I'm not really an expert in how the earlycon or serial
> drivers work.
> 
> From a HW perspective, all the busses required for the serial UART are
> enabled by default from bootloaders. So, no explicit voting for them
> should be necessary for early serial logs.

You're entirely correct.

The problem here is that we get the earlycon driver during kernel boot,
but the full fledged serial driver is unable to come up due to lacking
the specified interconnect provider. Userspace starts running and opens
/dev/console (which isn't our proper UART), it then assists in loading
the necessary modules, at which time the interconnect driver and then
the serial driver probes - but it doesn't necessarily know to reopen
/dev/console when this is done.

So this is solely a software problem caused by early (standard Linux)
userspace expecting /dev/console to be functional and remain functional.

As Dmitry says, in many such configurations the system will indeed open
/dev/console again later, hiding this problem - or in a typical end-user
product you probably don't have a UART.

Regards,
Bjorn


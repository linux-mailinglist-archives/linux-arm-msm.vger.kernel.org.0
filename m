Return-Path: <linux-arm-msm+bounces-19469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F588BF69C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9839A282BF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 06:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D73120DCC;
	Wed,  8 May 2024 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OVspw190"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041D17C72;
	Wed,  8 May 2024 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715151193; cv=none; b=dypME+Ql6dDdpHngtOjNH4xC32MZDmDLAPOea/ZIZAMEVw7i4v9n38R+lxJOFwApIMgS4xFZUv8suC3ofW2ssz40IEM8mZD4/0F7JZaucYFISfeQ70R/nyFvamTsopRdb8AO84awp8W92xJgRhVynswhrq3HB0Lpm3U1UHTF+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715151193; c=relaxed/simple;
	bh=6hcroISyFhrY5z6OUlcpC0KTAGJmPoThBV1xlDBEOgY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzddWdJ+IVI30+Y/bD+BuGO11lQgcjXHvyZhbCKd6oTRKtKFplJvLXxnXbclEGUGd6si79muOIFVE3K+jhLRowpRltfvtiZIV0W8lh5kxhY8fqjaUtmxcoGysB8CM6hF8HhB2KSaB8Y5/eAZMRNRCCK+3ZRmvdB+oW4JLgcHzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OVspw190; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4483xZMg001744;
	Wed, 8 May 2024 06:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=CMIb3mnZht042ZKPAgIPv
	i9Alg+UKDVnNGUn7pxrH5A=; b=OVspw190yjd+VPGz6Z0K6rD64eoXw7R1gHZK6
	0F8t89VeqoD0lk6+gM0osW1iKZp8YYoiz78ZCVk6/vJ5sZYk8wNqiUFczTQr7RGa
	BXV1V9H1lBjf56jjsf3d8OeyLqMM1gSHHCxjNC75fWMzsZWuJsEA1lTstfbBz8Z0
	gzA1VEDOV6c08FfqrUA7KQSvvT8wdje9zbsnFJGWjlfiT7VJZT26HKJFBT20uwyv
	12sjTrcbi0zTWTSAc42Gq7pCAdttNXb1duUbgHkaBgHh8/AcTdWcxB7Upbq3Pq/D
	49TF1snC4B3M4a8Odl0RE0mXbkg2haRAllRloj62P2exVa8YA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysprs4j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 06:53:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4486r4aa008748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 06:53:04 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 23:52:59 -0700
Date: Wed, 8 May 2024 12:22:55 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Georgi Djakov <djakov@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
Message-ID: <ZjshR0ekcn0gxwOa@hu-varada-blr.qualcomm.com>
References: <20240418092305.2337429-1-quic_varada@quicinc.com>
 <20240418092305.2337429-7-quic_varada@quicinc.com>
 <a7194edd-a2c8-46fc-bea1-f26b0960e535@linaro.org>
 <Ziov6bWBXYXJ4Zp8@hu-varada-blr.qualcomm.com>
 <27f4f3dd-9375-40cf-8c8f-1c4edf66e31b@linaro.org>
 <ZjNdTmmXucjtRxJt@hu-varada-blr.qualcomm.com>
 <c015b3a5-2213-4ebd-b960-d97ed1fe7062@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c015b3a5-2213-4ebd-b960-d97ed1fe7062@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uDotsT3VWJ9kUlRHCoUvxauA1wQgYS0l
X-Proofpoint-ORIG-GUID: uDotsT3VWJ9kUlRHCoUvxauA1wQgYS0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080049

On Fri, May 03, 2024 at 04:51:04PM +0300, Georgi Djakov wrote:
> Hi Varada,
>
> Thank you for your work on this!
>
> On 2.05.24 12:30, Varadarajan Narayanan wrote:
> > On Tue, Apr 30, 2024 at 12:05:29PM +0200, Konrad Dybcio wrote:
> > > On 25.04.2024 12:26 PM, Varadarajan Narayanan wrote:
> > > > On Tue, Apr 23, 2024 at 02:58:41PM +0200, Konrad Dybcio wrote:
> > > > >
> > > > >
> > > > > On 4/18/24 11:23, Varadarajan Narayanan wrote:
> > > > > > IPQ SoCs dont involve RPM in managing NoC related clocks and
> > > > > > there is no NoC scaling. Linux itself handles these clocks.
> > > > > > However, these should not be exposed as just clocks and align
> > > > > > with other Qualcomm SoCs that handle these clocks from a
> > > > > > interconnect provider.
> > > > > >
> > > > > > Hence include icc provider capability to the gcc node so that
> > > > > > peripherals can use the interconnect facility to enable these
> > > > > > clocks.
> > > > > >
> > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > > > ---
> > > > >
> > > > > If this is all you do to enable interconnect (which is not the case,
> > > > > as this patch only satisfies the bindings checker, the meaningful
> > > > > change happens in the previous patch) and nothing explodes, this is
> > > > > an apparent sign of your driver doing nothing.
> > > >
> > > > It appears to do nothing because, we are just enabling the clock
> > > > provider to also act as interconnect provider. Only when the
> > > > consumers are enabled with interconnect usage, this will create
> > > > paths and turn on the relevant NOC clocks.
> > >
> > > No, with sync_state it actually does "something" (sets the interconnect
> > > path bandwidths to zero). And *this* patch does nothing functionally,
> > > it only makes the dt checker happy.
> >
> > I understand.
> >
> > > > This interconnect will be used by the PCIe and NSS blocks. When
> > > > those patches were posted earlier, they were put on hold until
> > > > interconnect driver is available.
> > > >
> > > > Once this patch gets in, PCIe for example will make use of icc.
> > > > Please refer to https://lore.kernel.org/linux-arm-msm/20230519090219.15925-5-quic_devipriy@quicinc.com/.
> > > >
> > > > The 'pcieX' nodes will include the following entries.
> > > >
> > > > 	interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
> > > > 			<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> > > > 	interconnect-names = "pcie-mem", "cpu-pcie";
> > >
> > > Okay. What about USB that's already enabled? And BIMC/MEMNOC?
> >
> > For USB, the GCC_ANOC_USB_AXI_CLK is enabled as part of the iface
> > clock. Hence, interconnect is not specified there.
> >
> > MEMNOC to System NOC interfaces seem to be enabled automatically.
> > Software doesn't have to turn on or program specific clocks.
> >
> > > > > The expected reaction to "enabling interconnect" without defining the
> > > > > required paths for your hardware would be a crash-on-sync_state, as all
> > > > > unused (from Linux's POV) resources ought to be shut down.
> > > > >
> > > > > Because you lack sync_state, the interconnects silently retain the state
> > > > > that they were left in (which is not deterministic), and that's precisely
> > > > > what we want to avoid.
> > > >
> > > > I tried to set 'sync_state' to icc_sync_state to be invoked and
> > > > didn't see any crash.
> > >
> > > Have you confirmed that the registers are actually written to, and with
> > > correct values?
> >
> > I tried the following combinations:-
> >
> > 1. Top of tree linux-next + This patch set
> >
> > 	* icc_sync_state called
> > 	* No crash or hang observed
> > 	* From /sys/kernel/debug/clk/clk_summary can see the
> > 	  relevant clocks are set to the expected rates (compared
> > 	  with downstream kernel)
> >
> > 2. Top of tree linux-next + This patch set + PCIe enablement
> >
> > 	* icc_sync_state NOT called
>
> If sync_state() is not being called, that usually means that there
> are interconnect consumers that haven't probed successfully (PCIe?)
> or their dependencies. That can be checked in /sys/class/devlink/.../status
> But i am not sure how this works for PCI devices however.
>
> You can also manually force a call to sync_state by writing "1" to
> the interconnect provider's /sys/devices/.../state_synced
>
> Anyway, the question is if PCIe and NSS work without this driver?

No.

> If they work, is this because the clocks are turned on by default
> or by the boot loader?

Initially, the PCIe/NSS driver enabled these clocks directly
by having them in their DT nodes itself. Based on community
feedback this was removed and after that PCIe/NSS did not work.

> Then if an interconnect path (clock) gets disabled either when we
> reach a sync_state (with no bandwidth requests) or we explicitly
> call icc_set_bw() with 0 bandwidth values, i would expect that
> these PCIe and NSS devices would not function anymore (it might
> save some power etc) and if this is unexpected we should see a
> a crash or hang...
>
> Can you confirm this?

With ICC enabled, icc_set_bw (with non-zero values) is called by
PCIe and NSS drivers. Haven't checked with icc_set_bw with zero
values.

PCIe:	qcom_pcie_probe -> qcom_pcie_icc_init -> icc_set_bw
NSS:	ppe_icc_init -> icc_set_bw

I believe sync_state is not getting called since there is a
non-zero set bandwidth request. Which seems to be aligned with
your explanation.

Thanks
Varada

>
> Thanks,
> Georgi
>
> > 	* No crash or hang observed
> > 	* From /sys/kernel/debug/clk/clk_summary can see the
> > 	  relevant clocks are set to the expected rates (compared
> > 	  with downstream kernel)
> >
> > Does this answer your question? Please let me know if you were
> > looking for some other information.
> >
> > Thanks
> > Varada
> >
>


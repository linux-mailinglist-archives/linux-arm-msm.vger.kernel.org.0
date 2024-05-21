Return-Path: <linux-arm-msm+bounces-20152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913428CB41B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1E22B223A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7C11482ED;
	Tue, 21 May 2024 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dF+KerWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4871865C;
	Tue, 21 May 2024 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319099; cv=none; b=kZ4dX8MXOWyZVZX3tyNSGu7rX5DeGtqDXFytKk8OLI9yNA+qiMMRkD16ASO1ecDDyyaEIJXScnWzudOPViNzaWEYToUsBSDHZnRkqNVu4BRzzymwTt0sGJdsuBhVjirr8PTgaNBcujrefTRPeQhL/aUduHZAz8bHC3an8UXETGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319099; c=relaxed/simple;
	bh=QcvjddLO5V4At528MX8mQheZ5hvqyxqkL2NEO03yCHc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULDHOef8Vq0C5xgWKTAiidr19wvlOFjniDAlgy4z99EOuDKn7cjxbaKJHPCerFdJ/Icpms27gXNa6Cyx0R2GsoxDTfkVcbmc++gjOjrMmNsnyjja9CEcQSrunnVwnKiXIq6IsWZB5E4B+5YILDPMYrW4SkodiFXnCfKqaEuxHBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dF+KerWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LB0dU3026034;
	Tue, 21 May 2024 19:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=I3p/C816+U4MU703Y26jR
	xZT+omVzAMG1Hh9XxhT77I=; b=dF+KerWM6KS5a6gzufI8KcoqqcfdvVGPMRFgO
	ZuWMjdP77xRs+My+0BvgBd0LKdfDTNpkL4GaBbzXA4ItIOmwMJgdCUE+ZQkBszBS
	YwCBUBPtYcTMsR5ioAH9VKl/lb3GsFzzflAoJriB6fG2fHayNzTHnBtZS1167mol
	p0vP1gICHGTyJh5PSVsHyODVOfO7J46D1eSFuoRHFfombv7+S+FVloBsPlUdsZde
	JYgJBF20go57ddNeK8+L+eUFiZNHEpmm6XxV5rLEpyaeW6SU4Q2GZsPwOlF2triN
	fM1ewTxbbDbweaw4BnIDV6JaNO7ZpJY8O1J2zpdhyeuApv4Ew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tfj8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:17:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LJHveS032752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:17:57 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 12:17:56 -0700
Date: Tue, 21 May 2024 12:17:55 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/7] dt-bindings: remoteproc: qcom,pas: Add hwlocks
Message-ID: <ZkzzY311XiRigJPt@hu-bjorande-lv.qualcomm.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-5-47a90a859238@quicinc.com>
 <3521519f-34b8-472d-be37-f0e64bba24fc@kernel.org>
 <a944418a-1699-44fa-bdfc-2e57129adea1@quicinc.com>
 <c9882ba0-bbbf-44ec-9606-ebe68bcb8866@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c9882ba0-bbbf-44ec-9606-ebe68bcb8866@kernel.org>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vTf-zT4pgHoIyXF-_mYpHXXUul_8TYCw
X-Proofpoint-ORIG-GUID: vTf-zT4pgHoIyXF-_mYpHXXUul_8TYCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=927
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210143

On Tue, May 21, 2024 at 09:36:03AM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2024 06:08, Chris Lew wrote:
> > 
> > 
> > On 5/19/2024 10:36 AM, Krzysztof Kozlowski wrote:
> >> On 17/05/2024 00:58, Chris Lew wrote:
> >>> Add hwlocks property to describe the hwspinlock that remoteproc can try
> >>> to bust on behalf of the remoteproc's smem.
> >>
> >> Sorry, as you wrote, the lock is part of smem, not here. Drivers do not
> >> crash, so if your crashes as you imply in the cover letter, then first
> >> fix the driver.
> >>
> > 
> > Hi Krzysztof,
> > 
> > Sorry for the confusion, I dont think I meant that the smem driver will 
> > ever crash. The referred to crash in the cover letter is a crash in the 
> > firmware running on the remoteproc. The remoteproc could crash for any 
> > unexpected reason, related or unrelated to smem, while holding the tcsr 
> > mutex. I want to ensure that all resources that a remoteproc might be 
> > using are released as part of remoteproc stop.
> > 
> > The SMEM driver manages the lock/unlock operations on the tcsr mutex 
> > from the Linux CPU's perspective. This case is for cleaning up from the 
> > remote side's perspective.
> > 
> > In this case it's the hwspinlock used to synchronize SMEM, but it's 
> > conceivable that firmware running on the remoteproc has additional locks 
> > that need to be busted in order for the system to continue executing 
> > until the firmware is reinitialized.
> > 
> > We did consider tying this to the SMEM instance, but the entitiy 
> > relating to firmware is the remoteproc instance.
> 
> I still do not understand why you have to add hwlock to remoteproc, even
> though it is not directly used. Your driver problem looks like lack of
> proper driver architecture - you want to control the locks not from the
> layer took the lock, but one layer up. Sorry, no, fix the driver
> architecture.
> 

No, it is the firmware's reference to the lock that is represented in
the remoteproc node, while SMEM deals with Linux's reference to the lock.

This reference would be used to release the lock - on behalf of the
firmware - in the event that the firmware held it when it
stopped/crashed.

Regards,
Bjorn


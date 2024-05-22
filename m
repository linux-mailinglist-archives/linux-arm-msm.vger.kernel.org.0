Return-Path: <linux-arm-msm+bounces-20253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972A8CC5D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 19:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0FDF1F21FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 17:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EEB145A1E;
	Wed, 22 May 2024 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QiNp8bC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FCB57C8E;
	Wed, 22 May 2024 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716400256; cv=none; b=GvHuNmTZVHX6owJUSwyIgcvoCGEyfF7DdqBKDPkPs0Il2x95zrxn71gZnFI4cZIApCLMJXVJqNIiCMofzjCpvgHyhLHTdB1ppOdBFTzlqXJnJgky2/4eaeFq8nCa1QDKD1g4xALo8GJm1qyl5Z4ZeHs8Q5tfAppxB/aHAvcu6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716400256; c=relaxed/simple;
	bh=rdlS6Bl/NsyyZHtG8bRZtuv2aoBtKSU8wYB8K69FCWc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDrR/A9c+t3cP21unpsWRKTzpUOlNYQIcdRZ+r6UxVVF0bd2xN+HyTvs3GH2FysZi3o3+LDfXkRqiDup7pllYK1cnc7BCAt1fg6qkM2zz/X/0A/Fru6X5T47VY4hVKG1/XFiuencrVJ/d0epsMipc+dl8VNXnEmTzQwhGbpT88k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QiNp8bC0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M8YL0Q028982;
	Wed, 22 May 2024 17:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=URsuJ3vMIRkU0PQCaBDLB
	YAF1vgwPDvxzqhZxmlJtKE=; b=QiNp8bC0ls/d12WaHougCYjsNmwrSm6hB3uha
	JEeJoBKm5xvko6b10nTVw3gFuzKIFg2U+tvKXEmS1Qqc0E71CvXP4GJJmIpNfdFi
	Dfm6qNcqpYI6MjSiCXgZQkaoUp4Liu+hzqrOHt/7SKDfK50yeKrcJUKmjS93p/gl
	cKZjxz3xfke5Z3pTOiEd629izf1huDWkPyl1yii6D7civK2ot+f/mECglWpOnkcp
	QAvK8wkVtEfAkfpCyHDciqhCi6L8nWqwWQPedoEejEPMQL7ve1hwO2fWC8yffZK0
	Ap+RSwsCT+8ypph4MKIsS/+VYXIzwc1MdZTbKWAHdfOWuijtQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5hngm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 17:50:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MHoZCm001835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 17:50:35 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 10:50:34 -0700
Date: Wed, 22 May 2024 10:50:33 -0700
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
Message-ID: <Zk4wab/NZOOZ3hA6@hu-bjorande-lv.qualcomm.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-5-47a90a859238@quicinc.com>
 <3521519f-34b8-472d-be37-f0e64bba24fc@kernel.org>
 <a944418a-1699-44fa-bdfc-2e57129adea1@quicinc.com>
 <c9882ba0-bbbf-44ec-9606-ebe68bcb8866@kernel.org>
 <ZkzzY311XiRigJPt@hu-bjorande-lv.qualcomm.com>
 <92dcd555-69b1-4111-92dd-debe5107d526@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <92dcd555-69b1-4111-92dd-debe5107d526@kernel.org>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zsl8S3cjs8utIq0VXwL6N2aXD5T4KUdS
X-Proofpoint-ORIG-GUID: zsl8S3cjs8utIq0VXwL6N2aXD5T4KUdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220123

On Wed, May 22, 2024 at 09:26:00AM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2024 21:17, Bjorn Andersson wrote:
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> Sorry for the confusion, I dont think I meant that the smem driver will 
> >>> ever crash. The referred to crash in the cover letter is a crash in the 
> >>> firmware running on the remoteproc. The remoteproc could crash for any 
> >>> unexpected reason, related or unrelated to smem, while holding the tcsr 
> >>> mutex. I want to ensure that all resources that a remoteproc might be 
> >>> using are released as part of remoteproc stop.
> >>>
> >>> The SMEM driver manages the lock/unlock operations on the tcsr mutex 
> >>> from the Linux CPU's perspective. This case is for cleaning up from the 
> >>> remote side's perspective.
> >>>
> >>> In this case it's the hwspinlock used to synchronize SMEM, but it's 
> >>> conceivable that firmware running on the remoteproc has additional locks 
> >>> that need to be busted in order for the system to continue executing 
> >>> until the firmware is reinitialized.
> >>>
> >>> We did consider tying this to the SMEM instance, but the entitiy 
> >>> relating to firmware is the remoteproc instance.
> >>
> >> I still do not understand why you have to add hwlock to remoteproc, even
> >> though it is not directly used. Your driver problem looks like lack of
> >> proper driver architecture - you want to control the locks not from the
> >> layer took the lock, but one layer up. Sorry, no, fix the driver
> >> architecture.
> >>
> > 
> > No, it is the firmware's reference to the lock that is represented in
> > the remoteproc node, while SMEM deals with Linux's reference to the lock.
> > 
> > This reference would be used to release the lock - on behalf of the
> > firmware - in the event that the firmware held it when it
> > stopped/crashed.
> 
> I understood, but the remoteproc driver did not acquire the hardware
> lock. It was taken by smem, if I got it correctly, so you should poke
> smem to bust the spinlock.
> 

The remoteproc instance is the closest representation of the entity that
took the lock (i.e. the firmware). SMEM here is just another consumer of
the same lock.

> The hwlock is not a property of remote proc, because remote proc does
> not care, right? Other device cares... and now for every smem user you
> will add new binding property?
> 

Right, the issue seen relates to SMEM, because the remote processor (not
the remoteproc driver) took the lock.

> No, you are adding a binding based on your driver solution.

Similar to how hwspinlocks are used in other platforms (e.g. TI) the
firmware could take multiple locks, e.g. to synchronize access to other
shared memory mechanism (i.e. not SMEM). While I am not aware of such
use case today, my expectation was that in such case we just list all
the hwlocks related to the firmware and bust those from the remoteproc
instance.

Having to export APIs from each one of such drivers and make the
remoteproc identify the relevant instances and call those APIs does
indeed seem inconvenient.
SMEM is special here because it's singleton, but this would not
necessarily be true for other cases.

Regards,
Bjorn





Return-Path: <linux-arm-msm+bounces-20421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E7C8CEA3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 21:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22A5A1F21206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 19:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28F556B79;
	Fri, 24 May 2024 19:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dkaR7NBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC5950263;
	Fri, 24 May 2024 19:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716578605; cv=none; b=cowQklS2LLVZ2PSaWeuxr5JI/GgfBNKRIN1HBiL5+jXZf0NVxOkJKAuag1t6ch/YoYhpA2D51fF/KsuTfByP/xp4N/o4X3ji3nC4crEuaeryzPm32dX8AsWd8lvWQARNphUqyP8qfOTQgS1J8GSZKU9DINLurw3DTkQBLRad5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716578605; c=relaxed/simple;
	bh=4HdjJxDS632Jutci0KWaPaUjAgNj8gcwwbCZhlcby+w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfIOHyXqlCBs9CZElHnm6J7ho92+czdA1wDpTKWObf8w3FsWCNNNW1hRB/LtV2mhzTdOBd6fh55gAHYwtRZMn32umRIpmZynrIQQfDNl7eCy8qyvnF+4pOSBnt0Q+1vHP2Agd7D2e8JXSKAshYNdzs23E0vlxXNc8PSDIELgLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dkaR7NBw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44OICRXI004145;
	Fri, 24 May 2024 19:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yo4szzBQzp8Ht3GJEpO+uw2J
	dr21qqXRV9Tz5vrPbEw=; b=dkaR7NBwRI62SSCMagMr+Qksuzyyce7VTJAFA8I6
	f9tOv6DS3orkIwI/Er/memBGaxQDgJfJW34uNXy2xuHYNNzV1pJAc6LM9GJrnXxe
	qkN74tqH5JlbvZIFLWDwtv9V4I0/+1UPsu6QKWEVcBbxKoBxtfKhAr/mBH7U4e/R
	JoeJQsU8S3bmM1D7SP3e5adjTjEVXuZQrR7k4m4JO5D+tNLb4ET9D129Cuh/+of8
	ZDsFaX6z2LFmLmHSxKIOi/LKUKQ8CaUEYyxzMa8ZgA1p1lr6VfI5ydsY2pxXJ/TD
	t7tMv3BnnaisIkfAd4WKeHRQuOsYyeIl8lQ1kp0BQzcb5Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8j3ay3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 19:23:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44OJN2v1007873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 19:23:02 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 12:23:02 -0700
Date: Fri, 24 May 2024 12:23:01 -0700
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
Message-ID: <ZlDpFV8bL8/lwGOP@hu-bjorande-lv.qualcomm.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-5-47a90a859238@quicinc.com>
 <3521519f-34b8-472d-be37-f0e64bba24fc@kernel.org>
 <a944418a-1699-44fa-bdfc-2e57129adea1@quicinc.com>
 <c9882ba0-bbbf-44ec-9606-ebe68bcb8866@kernel.org>
 <ZkzzY311XiRigJPt@hu-bjorande-lv.qualcomm.com>
 <92dcd555-69b1-4111-92dd-debe5107d526@kernel.org>
 <Zk4wab/NZOOZ3hA6@hu-bjorande-lv.qualcomm.com>
 <aed37430-7e87-4516-86da-3997c01a8aa8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aed37430-7e87-4516-86da-3997c01a8aa8@kernel.org>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: baizeiFtqEWoMIhvTHs3ZxbMP0M6bg0r
X-Proofpoint-ORIG-GUID: baizeiFtqEWoMIhvTHs3ZxbMP0M6bg0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_06,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405240137

On Thu, May 23, 2024 at 08:15:54AM +0200, Krzysztof Kozlowski wrote:
> On 22/05/2024 19:50, Bjorn Andersson wrote:
> >>>>>
> >>>>> We did consider tying this to the SMEM instance, but the entitiy 
> >>>>> relating to firmware is the remoteproc instance.
> >>>>
> >>>> I still do not understand why you have to add hwlock to remoteproc, even
> >>>> though it is not directly used. Your driver problem looks like lack of
> >>>> proper driver architecture - you want to control the locks not from the
> >>>> layer took the lock, but one layer up. Sorry, no, fix the driver
> >>>> architecture.
> >>>>
> >>>
> >>> No, it is the firmware's reference to the lock that is represented in
> >>> the remoteproc node, while SMEM deals with Linux's reference to the lock.
> >>>
> >>> This reference would be used to release the lock - on behalf of the
> >>> firmware - in the event that the firmware held it when it
> >>> stopped/crashed.
> >>
> >> I understood, but the remoteproc driver did not acquire the hardware
> >> lock. It was taken by smem, if I got it correctly, so you should poke
> >> smem to bust the spinlock.
> >>
> > 
> > The remoteproc instance is the closest representation of the entity that
> > took the lock (i.e. the firmware). SMEM here is just another consumer of
> > the same lock.
> > 
> >> The hwlock is not a property of remote proc, because remote proc does
> >> not care, right? Other device cares... and now for every smem user you
> >> will add new binding property?
> >>
> > 
> > Right, the issue seen relates to SMEM, because the remote processor (not
> > the remoteproc driver) took the lock.
> > 
> >> No, you are adding a binding based on your driver solution.
> > 
> > Similar to how hwspinlocks are used in other platforms (e.g. TI) the
> > firmware could take multiple locks, e.g. to synchronize access to other
> > shared memory mechanism (i.e. not SMEM). While I am not aware of such
> > use case today, my expectation was that in such case we just list all
> > the hwlocks related to the firmware and bust those from the remoteproc
> > instance.
> > 
> > Having to export APIs from each one of such drivers and make the
> > remoteproc identify the relevant instances and call those APIs does
> > indeed seem inconvenient.
> > SMEM is special here because it's singleton, but this would not
> > necessarily be true for other cases.
> 
> I don't think that exporting such API is unreasonable, but quite
> opposite - expected. The remote processor crashed, so the remoteproc
> driver is supposed to call some sort of smem_cleanup() or
> smem_cleanup_on_crash() and call would bust/release the lock. That way
> lock handling is encapsulated entirely in one driver which already takes
> and releases the lock.
> 

I don't agree.

SMEM does indeed acquire and release the same, shared, lock. But the
SMEM driver instance on our side is not involved in taking the lock for
the firmware.

There exist an equivalent SMEM driver instance in the firmware that
crashed and that's the thing that needs to be released.


We're also not tearing down, or cleaning up anything in our SMEM
instance. It is simply "when remoteproc id N died, check if N is holding
the lock and if so force a release of the lock - so that others can grab
it".

> Just like freeing any memory. remoteproc driver does not free other
> driver's memory only because processor crashed.
> 

That's a good comparison. Because when the firmware running on the
remote processor crashes, it is indeed the job of the remoteproc driver
to clean up the memory allocated to run the remote processor.

Regards,
Bjorn


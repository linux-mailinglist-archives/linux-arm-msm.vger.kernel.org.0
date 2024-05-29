Return-Path: <linux-arm-msm+bounces-20966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAFB8D3B0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 17:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5459CB24ACB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 15:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481401591EC;
	Wed, 29 May 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="muQKxFSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5EE1B947;
	Wed, 29 May 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996786; cv=none; b=HlsNO8yN+p9ZT0ftIC9h5IdmnLgGeTiSe3hwl07NvKDXcVZR+mrTcO2ELaq9mCbHkNjY4g84c6rzsMM2N4WlWnxjc9NCbMpWJpfe2nAPrwJYpwedICp/kX/6hwxhyttZotaePQsB/XywYNbD5CJneGjJkAF+4mC4v6+8xnSyEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996786; c=relaxed/simple;
	bh=31gYhh0DP3xBm58SESSWJWwlOOk7V9/wLPhAnvyfqUg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naW6dIbZ62X2pkiC4r6Irk3cH9lrwvlwRNwC9CttGAppwZHuIyhQ8JnCxZlQgTd8RRz7ey2k/9Fg+NC58kCfwr1myzILjc7igk//d8PeJ5SvtE5Yav/w+lcY56w+Dgga6u/uAFFfF1k2rEgJFC9S+bm15Ssxng9fj35z7e0MIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=muQKxFSt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9RE3b021150;
	Wed, 29 May 2024 15:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iVjnvCp4zHIiLbJrA45aZ3Lw
	I4StXxCd9lV2xHYJZtY=; b=muQKxFSts+F8CDI2u2zPzA6HLrKM9/Wv12E4zsZu
	+hDQeZKRWFrWd9RKWfMPFnETVcaapZ0MTcYkRNFV05oCHLhDVUvS92YEQsFsLlWC
	RZ91nqcrYYtMX7zYozM34UfzZDaLw4LfT8+cByAegi93hASRZBqDR5ZVQ0KDTP0a
	1qQ6DRDfZq+DaKbocK2oMt1wgLgG26ZdI3DgzwyEVWN45yt2EpgYDSJeyuh8wbnI
	BX7qfU0AiPYAoYDeHUKmJG8Zp/qcNYME1OOwmwfk5ky+JqDZ2oFIXnn3JKnA4Hnk
	RBhW/iEw+NzD3jA1aLTHxkxRAOfMjhA4RDwGojL7/M4tmw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2nhchh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:32:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TFWmoL008069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:32:48 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 08:32:47 -0700
Date: Wed, 29 May 2024 08:32:46 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Michal Simek <michal.simek@amd.com>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand
	<frowand.list@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Amrit Anand
	<quic_amrianan@quicinc.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        "Caleb
 Connolly" <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Skeffington, Wesley"
	<wesley.skeffington@amd.com>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
Message-ID: <20240529081032499-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAA8EJppYmVMmhgLSiSEGA_r4hFbQYriOLjNK9b6VXUYEYiZ6Zg@mail.gmail.com>
 <c875cd34-d09f-401a-8c57-45deddf65c9a@linaro.org>
 <218c63fa-5582-4f1b-8a02-da7ec66a45f9@amd.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <218c63fa-5582-4f1b-8a02-da7ec66a45f9@amd.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4jra5r6bQKKegguwQkh_WtD7McVzRcyv
X-Proofpoint-GUID: 4jra5r6bQKKegguwQkh_WtD7McVzRcyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290107

On Mon, May 27, 2024 at 09:19:59AM +0200, Michal Simek wrote:
> Hi,
> 
> thanks for CCing me.
> 
> On 5/24/24 17:51, Konrad Dybcio wrote:
> > On 21.05.2024 9:00 PM, Dmitry Baryshkov wrote:
> > > Hi Elliot,
> > > 
> > > On Tue, 21 May 2024 at 21:41, Elliot Berman <quic_eberman@quicinc.com> wrote:
> > > > 
> > > > Device manufacturers frequently ship multiple boards or SKUs under a
> > > > single software package. These software packages will ship multiple
> > > > devicetree blobs and require some mechanism to pick the correct DTB for
> > > > the board the software package was deployed. Introduce a common
> > > > definition for adding board identifiers to device trees. board-id
> > > > provides a mechanism for bootloaders to select the appropriate DTB which
> > > > is vendor/OEM-agnostic.
> > > 
> > > This is a v3 of the RFC, however it is still a qcom-only series. Might
> > > I suggest gaining an actual interest from any other hardware vendor
> > > (in the form of the patches) before posting v4? Otherwise it might
> > > still end up being a Qualcomm solution which is not supported and/or
> > > used by other hardware vendors.
> > 
> > AMD should be onboard [1].
> > 
> > Konrad
> > 
> > [1] https://resources.linaro.org/en/resource/q7U3Rr7m3ZbZmXzYK7A9u3
> 
> I am trying to wrap my head around this and I have also looked at that EOSS
> presentation.
> I don't think I fully understand your case.
> There are multiple components which you need to detect. SOC - I expect
> reading by some regs, board - I expect you have any eeprom, OTP, adc, gpio,
> etc way how to detect board ID and revision.
> And then you mentioned displays - how do you detect them?

We have a similar mechanism to what you mention below: we have a ROM
which encodes information about the platform and that can be read by
firmware/bootloader/OS.

> 
> In our Kria platform we have eeproms on SOM and CC cards (or FMC/extension
> cards) which we read and decode and based on information from it we are
> composing "unique" string. And then we are having DTBs in FIT image where
> description of configuration it taken as regular expression. That's why it
> is up to you how you want to combine them.

I don't think this is a fundamentally different approach from my
proposal. Instead of composing a "unique" string and using regex to
match, I'm proposing that the information (bytes) that are in your
eeprom can be matched without going through regex/string conversion.
Instead of firmware/bootloader doing a conversion to the strings, it
provides the values via board-id. I have concerns about having
bootloaders to contain a regex library -- probably easily addressed by
standardizing what terms the regex processor needs to support. I'm also
not sure if regex strings are an appropriate use of compatible strings.
Using strings limits the usefulness of comaptible strings to the
consumers of DTB, since the compatible string has to describe only the
boards the DTB is applicable to, you can't mention compatible strings
"this board is like" such as some generic SoC compatible.

> Currently we are merging them offline and we are not applying any DT overlay
> at run time but can be done (we are missing one missing piece in U-Boot for
> it).
> 
> In presentation you mentioned also that applying overlay can fail  but not
> sure how you can reach it. Because Linux kernel has the whole infrastructure
> to cover all combinations with base DT + overlays. It means if you cover all
> working combinations there you should see if they don't apply properly.

Mostly, I was referring to a situation where firmware provides an
overlay. Firmware doesn't know the DTB that OS has and I don't see any
way to gaurantee that firmware knows how to fix up the OS DTB.

> 
> Also do you really need to detect everything from firmware side? Or isn't it
> enough to have just "some" devices and then load the rest where you are in
> OS?
> I think that's pretty much another way to go to have bare minimum
> functionality provided by firmware and deal with the rest in OS.

Agreed, although not all devices can be loaded once you are in the OS.
All nondiscoverable devices would need to be desribed in the DT.

Thanks,
Elliot



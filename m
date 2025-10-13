Return-Path: <linux-arm-msm+bounces-77003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67ABD2F87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19C63B0E86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FA2263F4E;
	Mon, 13 Oct 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRGkeqnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA57080D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358678; cv=none; b=sFqg6AY+Dh6+eTYlMHWNd5fSS50bEq7lcJsc5Z8y/WO0TTIYahJbYnZMbQ5LmHhkGC+FYoSaP9Vg9JyqP6mhtYzBWEvBw/2X0kw9MRbZXLPWkbOwCviIH2LLcHH/4I14xB6swHUnc4MBwCah+ZZR0tEb4y/3XtFLYarpZmV5DF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358678; c=relaxed/simple;
	bh=uoTIS15MH8nY66zuIG6Cb/OhBybk23RAtlaq7Vr7FlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7RpfQZ4KvghCyDXwSLXHCPSwKntDlzOlp+Qfpq7HCtaQKAhNvoz8drSy69ONOXVziTR18d/aOKC1LPEzYjhnRq8lJYlkG8bRjxPYxi+sQ21hYqKa93qRNNlLqqYvY/MqZn4KK9a8+278cXILcIH8xvgDUN/pr94IPUqY6EvxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRGkeqnU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAgJhL024739
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5zCwVcNtc4FphT3xLZL9GNyV
	sIOnupN3QcblUxzzUZA=; b=oRGkeqnUKIBDmnnMrkJfo7jFYyes3mWLDq0rikzw
	xqSZ7grGWwFUlIVZ3qYOsug/cXgTzlqtg17ZF20GSfYpn0myy64dQdkaryZeRSwz
	IwkBz2qChHb0oM8c/Z+m8jyc6ftWTFUYctM/PzOGp9sWG959XflFiFjORSg7d1ZQ
	JQTVR9jWmCK6WS+8Tlc68g9GkLJFyYSP5UJ/DK1nb5n3KoS3DxJi2DI7hxSd3M40
	ZOJM+0jkhzAqY4WGaYH+7+yn3b+NMA8ah4tdpcMASgb0opt/cXllGVT4/gBrdk/W
	SowgJCngBWAE3jftS56Z4Hu/HNn4WYMiLjSzPnm3ReEisg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa84hsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:31:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-827061b4ca9so2053499385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358674; x=1760963474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zCwVcNtc4FphT3xLZL9GNyVsIOnupN3QcblUxzzUZA=;
        b=IJlPfso2dU6YzRmPtWqm/WQuyXDl9yp3bm+nyzBc3LRJE+87NqcM/PVUbg3HfjDyGB
         /KmPEYLa8Ba5G3eGrCILAWZLCz2GUBCfGIJe6aXSPRxJbK7/5ULQg65tHDZA7TtlNSeK
         tedNYshrypw9TucaNJJtaM0VplGNMpDlCJB9N5wZ6eYzJFXY6qeKcXVmb89DBZxF7s43
         Loi7XwYjGgizHRpHHMu5zLyUI0CCAfQoqkvfTF7hQumJPWSSkjDhoGIRh4HYcUTlWSLi
         lW+sCBKlmDu4xtsbkrnczqesfZ8S1QLqwRGXHnhZjS1kUKY328MyZdM/1U0PNBvMHuPu
         bz/A==
X-Forwarded-Encrypted: i=1; AJvYcCWHE1gQdldsuTunYi6Vr9dbYMAcX4MRNzylPL10I15NHeTHPg8kFhavzdP6bZR2Bwf0HQ0IADPu7WoASGBG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MjBl7YW97wE3TQyr8H22CZRysOfnwe5evH/IJlMA/35Usv81
	oS8hHLBfRrivEUqAJHPg6K9Dr10mcHAbG+HDnGhIu0AFQSDMJVWybZE/xsTWeku6ABR/ToNokqm
	YL8gIIoVDzBJl8Z4xd60mPCULQhPnsrfK6EwJ+J/0HWBPxoG4oCQD/GedKKkks9jYPv5u
X-Gm-Gg: ASbGncuiGF294MnQOhpE/apGZt9ijygN3/+xoozIw6oEYPb8EB71zt9Bu/f1t5Ly932
	Ly7b2d/M9avzLPwE1hZSLNSIjRFBTjKLxDCvgjSg8G29VZxO/qJ8EotADEtbQesPudS7hdkutLJ
	qTglzjH8/saZJ5dVJbbCSK8LISF8CWO3HoxAJcvMeD6qma+j7+ZxHW4g5eHcThkgBjHLy0mYriw
	dnm9jvh9WC2y5gu22AarEOO6eFHKpoPDJ/UjSaC3MPmkqMgNAbnELwK2yBhJ+ClxZFfBQczFMOk
	Az/mAh2hCl9ckZFI5tB/Qs9QoZeThALmnx3VUgiKTBKiT8M17E3MQKwwY2Pc4IODPjAfS7Y44eS
	yK+PI7An7LJWsLMsgku0nGKu1xGnTcF70IDAeQ7rrW1TPjqPjY6g5
X-Received: by 2002:a05:620a:2590:b0:829:1528:721a with SMTP id af79cd13be357-8835088edbdmr2950638785a.27.1760358674196;
        Mon, 13 Oct 2025 05:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1nSkwDzlu6z+r9dEsjnMTj3G8obGwPaEPkbut/N88CeJLY+od62fAKykMgjMzXgMHhwvaTg==
X-Received: by 2002:a05:620a:2590:b0:829:1528:721a with SMTP id af79cd13be357-8835088edbdmr2950629085a.27.1760358673497;
        Mon, 13 Oct 2025 05:31:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea115fcsm29958491fa.40.2025.10.13.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:31:12 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:31:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
        will@kernel.org, saravanak@google.com, conor+dt@kernel.org,
        robh@kernel.org, mchehab@kernel.org, bod@kernel.org,
        krzk+dt@kernel.org, abhinav.kumar@linux.dev,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
X-Proofpoint-GUID: 4YD_2oY_2EhFnNcG5eEQYpygP3-0Td_F
X-Proofpoint-ORIG-GUID: 4YD_2oY_2EhFnNcG5eEQYpygP3-0Td_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX9msWyNV1XFPv
 IwSdWdj0nIEKvxqr4SbG4ltErOfzco87mCmZu12PljFsYVbYxwJZ7QVXmaFuXeX91u2LXv1qnGg
 CSfhipifiy5Avcqo+03tukuUZHlOtL/Dm0ZaIPhXw5Uj7NMyUoHTKM8qvRRjG2RejAxSgenlDLE
 4elAuGrO6P79A4fAQqBtWW1Ad2poxoRPvzS0zyXOtpnIrjSAcaahUmdYmBX3keuZuZ5J9J4WsOq
 Z5+2mDbgtBOUQD5lhEs6GHEQLFhdU0iIbtCvdTcCAoB8xh2Qd93ZjLuoE6xSyVYeiXoC0/mA9lS
 Pwrhx9otW8S+C3ES8qV5RQBY17Ilez5pXUAMeVIw5Cx2qH/scu58/Evs5wcdGdRMzeipd2RRsn7
 FPywHZvrvNnvkZ/PhDLQgBokdF0yCg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecf113 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=A-iAV8OxTwgq9s7Eiz8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Mon, Oct 13, 2025 at 12:20:54PM +0100, Robin Murphy wrote:
> On 2025-10-09 7:25 pm, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 06:03:29PM +0100, Robin Murphy wrote:
> > > On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
> > > > > On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
> > > > > > 
> > > > > > On 9/29/2025 3:50 PM, Robin Murphy wrote:
> > > > > > > > USECASE [1]:
> > > > > > > > -----------
> > > > > > > > Video IP, 32bit, have 2 hardware sub blocks(or can be called as
> > > > > > > > functions) called as pixel and nonpixel blocks, that does decode and
> > > > > > > > encode of the video stream. These sub blocks are __configured__ to
> > > > > > > > generate different stream IDs.
> > > > > > > 
> > > > > > > So please clarify why you can't:
> > > > > > > 
> > > > > > > a) Describe the sub-blocks as individual child nodes each with their own
> > > > > > > distinct "iommus" property
> > > > > > > 
> > > > > > 
> > > > > > Thanks Robin for your time. Sorry for late reply as I really didn't have
> > > > > > concrete answer for this question.
> > > > > > 
> > > > > > First let me clarify the word "sub blocks" -- This is just the logical
> > > > > > separation with no separate address space to really able to define them
> > > > > > as sub devices. Think of it like a single video IP with 2 dma
> > > > > > engines(used for pixel and non-pixel purpose).
> > > > > > 
> > > > > > I should agree that the child-nodes in the device tree is the easy one
> > > > > > and infact, it is how being used in downstream.
> > > > > > 
> > > > > > For upstream -- Since there is no real address space to interact with
> > > > > > these sub-blocks(or logical blocks), does it really qualify to define as
> > > > > > child nodes in the device tree? I see there is some push back[1].
> > > > > 
> > > > > Who says you need an address space? Child nodes without "reg" properties,
> > > > > referenced by name, compatible or phandle, exist all over the place for all
> > > > > manner of reasons. If there are distinct logical functions with their own
> > > > > distinct hardware properties, then I would say having child nodes to
> > > > > describe and associate those properties with their respective functions is
> > > > > entirely natural and appropriate. The first example that comes to mind of
> > > > > where this is a well-established practice is PMICs - to pick one at random:
> > > > > Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > > 
> > > > Logical function, that's correct. And also note, for PMICs that practice
> > > > has bitten us back. For PM8008 we switched back to a non-subdevice
> > > > representation.
> > > > 
> > > > > For bonus irony, you can't take the other approaches without inherently
> > > > > *introducing* a notional address space in the form of your logical function
> > > > > IDs anyway.
> > > > > 
> > > > > >      > or:
> > > > > > > 
> > > > > > > b) Use standard "iommu-map" which already supports mapping a masked
> > > > > > > input ID to an arbitrary IOMMU specifier
> > > > > > > 
> > > > > > 
> > > > > > I think clients is also required to program non-zero smr mask, where as
> > > > > > iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
> > > > > > am unable to catch your thought here.
> > > > > An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says it
> > > > > is. The fact that Linux's parsing code only works properly for #iommu-cells
> > > > > = 1 is not really a DT binding problem (other than it stemming from a loose
> > > > > assumption stated in the PCI binding's use of the property).
> > > > 
> > > > I really don't like the idea of extending the #iommu-cells. The ARM SMMU
> > > > has only one cell, which is correct even for our platforms. The fact
> > > > that we need to identify different IOMMU SIDs (and handle them in a
> > > > differnt ways) is internal to the video device (and several other
> > > > devices). There is nothing to be handled on the ARM SMMU side.
> > > 
> > > Huh? So if you prefer not to change anything, are you suggesting this series
> > > doesn't need to exist at all? Now I'm thoroughly confused...
> > 
> > Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
> > #iommu-cells is the best idea.
> 
> What? No, any function ID would be an *input* to a map, not part of the
> output specifier; indeed it should never go anywhere near the IOMMU, I don't
> think anyone suggested that.

It was Bryan, https://lore.kernel.org/linux-arm-msm/9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org

> 
> > > If you want to use SMR masks, then you absolutely need #iommu-cells = 2,
> > > because that is the SMMU binding for using SMR masks. It would definitely
> > 
> > I'm sorry. Yes, we have #iommu-cells = <2>.
> > 
> > > not be OK to have some magic property trying to smuggle
> > > IOMMU-driver-specific data contrary to what the IOMMU node itself says. As
> > > for iommu-map, I don't see what would be objectionable about improving the
> > > parsing to respect a real #iommu-cells value rather than hard-coding an
> > > assumption. Yes, we'd probably need to forbid entries with length > 1
> > > targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
> > 
> > This will break e.g. PCIe on Qualcomm platforms:
> > 
> >                          iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> >                                      <0x100 &apps_smmu 0x1401 0x1>;
> > 
> > 
> > But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
> > <2>. It depends on ARM SMMU ignoring the second cell when it's not
> > present.
> 
> Urgh, yes, that's just broken already :(
> 
> At least they all seem to be a sufficiently consistent pattern that a
> targeted workaround to detect old DTBs looks feasible (I'm thinking, if
> iommu-map size % 4 == 0 and cells n*4 + 3 are all 1 and cells n*4 + 1 are
> all the same phandle to an IOMMU with #iommu-cells == 2, then parse as if
> #iommu-cells == 1)

How do we handle the case of #iommu-cells = <2>? I.e. what should be the
"fixed" representation of the map above? Should we have usual cells and
one extra "length" just for the sake of it?

               iommu-map = <0x0   &apps_smmu 0x1400 0x0 0x1>,
                           <0x100 &apps_smmu 0x1401 0x0 0x1>;


I really like the idea of fixing iommu-map as that would remove the need
for other properties, but 

> 
> > > relationship between the input ID and the output specifier falls apart when
> > > the specifier is complex, but that seems simple enough to implement and
> > > document (even if it's too fiddly to describe in the schema itself), and
> > > still certainly no worse than having another property that *is* just
> > > iommu-map with implicit length = 1.
> > > 
> > > And if you want individual StreamIDs for logical functions to be attachable
> > > to distinct contexts then those functions absolutely must be visible to the
> > > IOMMU layer and the SMMU driver as independent devices with their own unique
> > > properties, which means either they come that way from the DT as of_platform
> > > devices in the first place, or you implement a full bus_type abstraction
> > 
> > Not necessarily. Tegra display driver creates a device for each context
> > on its own.
> No, the *display* driver does not; the host1x bus driver does, which is the
> point I was making - that has a proper bus abstraction tied into the IOMMU
> layer, such that the devices are correctly configured long before the actual
> DRM driver(s) get anywhere near them.

Ack. I agree. it's drivers/gpu/host1x/context, not drivers/gpu/drm/

> 
> > In fact, using OF to create context devices is _less_
> > robust, because now the driver needs to sync, checking that there is a
> > subdevice, that it has probed, etc. Using manually created devices seems
> > better from my POV.
> 
> Huh? A simple call to of_platform_populate() is somehow less robust than
> open-coding much of the same logic that of_platform_populate() does plus a
> bunch of hackery to try to fake up an of_node to make the new device appear
> to own the appropriate properties?
> 
> Having entire sub-*drivers* for child devices or not is an orthogonal issue
> regardless of whichever way they are created.

I was (again) looking at host1x. It doesn't fake of_node (nor does it
have actual OF nodes). Instead it just mapps IOMMUs directly to the
context devices. Compare this to misc/fastrpc.c, which has subdevices
and drivers to map contexts. The latter one looks less robust.

And from DT perspective compare:

		fastrpc {
			compatible = "qcom,fastrpc";
			#address-cells = <1>;
			#size-cells = <0>;

			compute-cb@3 {
				compatible = "qcom,fastrpc-compute-cb";
				reg = <3>;
				iommus = <&apps_smmu 0x1803 0x0>;
			};

			compute-cb@4 {
				compatible = "qcom,fastrpc-compute-cb";
				reg = <4>;
				iommus = <&apps_smmu 0x1804 0x0>;
			};

			compute-cb@5 {
				compatible = "qcom,fastrpc-compute-cb";
				reg = <5>;
				iommus = <&apps_smmu 0x1805 0x0>;
			};
		};

VS (note, it doesn't have 'length', it can be added back with no issues):

		fastrpc {
			compatible = "qcom,fastrpc";
			#address-cells = <1>;
			#size-cells = <0>;

			iommu-map = <3 &apps_smmu 0x1803 0x0>,
				    <4 &apps_smmu 0x1804 0x0>,
				    <5 &apps_smmu 0x1805 0x0>;
		};


I think the latter is more compact, and more robust.

Note, to make a complete example, it should be probably something like
(sc7280, cdsp, note duplicate IDs in the map, again, I omitted length):

	       fastrpc {
			compatible = "qcom,fastrpc";

			iommu-map = <1 &apps_smmu 0x11a1 0x0420>,
				    <1 &apps_smmu 0x1181 0x0420>,
				    <2 &apps_smmu 0x11a2 0x0420>,
				    <2 &apps_smmu 0x1182 0x0420>,
				    <3 &apps_smmu 0x11a3 0x0420>,
				    <3 &apps_smmu 0x1183 0x0420>;
			dma-coherent;
		};


> > > which will have to be hooked up to the IOMMU layer. You cannot make IOMMU
> > > configuration "internal" to the actual client driver which is only allowed
> > > to bind *after* said IOMMU configuration has already been made.
> > 
> > I'm not sure I follow this, I'm sorry.
> I mean IOMMU configuration is designed to happen at device_add() time, and
> client drivers must not assume otherwise (the mechanisms for handling IOMMU
> drivers registering "late" from modules are internal details that can and
> will change). If you're under the impression that a straightforward platform
> driver for the video codec itself would be able to invoke IOMMU
> configuration for the video codec platform device (without unacceptable
> levels of hackery) then you are mistaken, sorry.
> 
> Again, to be able to assign StreamIDs to different contexts, those StreamIDs
> must uniquely belong to different struct devices. Thus in terms of how you
> get to those struct devices from a DT representation, either they come from
> distinct DT nodes with standard "iommus" properties that the generic
> of_platform code can create and configure accordingly, or you're doing a
> non-trivial amount of work to implement your own bus layer like
> host1x_context_bus to manage your own type of sub-device. There is no valid
> middle ground of trying to stuff driver-specific knowledge of arbitrarily
> made-up function IDs into the generic platform bus code.


I'd totally prefer something like:

	video-codec@foobar {
		compatible = "qcom,video";

		iommus = <&apps_smmu 0x1234 0xca>;
		iommu-maps = <PIXEL &apps_smmu 0xabcdef 0xac>,
			     <SECURE_PIXEL &apps_smmu 0x898989 0xac>,
			     <SECURE_BITSTREAM &apps_smmu 0x898998 0xac>;
	};

-- 
With best wishes
Dmitry


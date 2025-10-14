Return-Path: <linux-arm-msm+bounces-77247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEABBBDAF36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 20:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3631A34E3B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56529C338;
	Tue, 14 Oct 2025 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTWHEoHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA35627FB2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760466841; cv=none; b=UfJxwqpQn0XCCQIhtA3fgQOTRBVqrUK4nhMTlJVLrT/bvBtF41dOQ2tB/X4D+gJ/FDA2aQvONUqCgrun5jiYOJtXFR1adYy0jSjTiRiA6UhJav5VLA4fUwYnVi/4kRalLUEHit+ThrBL2f3qSaxp9SYiS88sPO2dNEnrBVJM23U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760466841; c=relaxed/simple;
	bh=VPb4jhWdUsjgAn2px62oEl5C7GEb4JvRcNYCUrdj/dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ppnow+aN5DJZZtvbXUMDQ/knlaHZ97IPE9e5qxitwS3wtFKNl4AVNuJEtLnuU6vuqO9cSSI3DZv4lW12Ne3DPtpJpA6c78apGWSb1aSBVa4fwogOe2aoWhea7Vx0vBwksw1zp46WUdVbfaUVGywu60gT7h2n/hii7UN6K/0mK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTWHEoHV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFMJKp001480
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1A6wPKIcstG5MZBVsykhlDwR
	KCkKZmzzDnH9VANIpgA=; b=NTWHEoHVh/oNpIIyZxmVlRYEBcWRTVCM4QIzEa1O
	YzQgMkXqEyCJfXDvLY6awaehd36NaOZnQpGKr5t4YZ9vrzNQWWJuLVcWUTQJ2SVn
	MwqcgpdVMa7VGVKUjUfqCNGTDH7RYwGvpjq0yQIRneYq+Ct51rzw4VsveHHXchzh
	01IFdYLg3q0tm+zX6XawMWqLawL5ckc+7DVCsksxZLNNdukaAzwHCJpgmTY+jDPG
	9x9jv0qYl+o3SYVXJlUhlyptvcUBuXn6nE1WbdybJAXDJPa3G012sr0Lasxr7+eW
	DGBfQhHAZtT39jb04qT5oicrHfr4Ha5LVov+B7rwb8/UnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa89m42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:33:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-827061b4ca9so2569871085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760466837; x=1761071637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A6wPKIcstG5MZBVsykhlDwRKCkKZmzzDnH9VANIpgA=;
        b=ppQbaQWcFZ5RnNDwElPTy1zEekdYy1yHA1VGpahQNBis9MDkXKhZmg1pxgYEKRBksi
         Vm3Yih8dHh3aT+AB16qOxadcZYpbqUoBzd6sZvD57nW4S5Vr5cIgXUvcG4P/INgbNxxx
         sTl1pD/QqmpJ+stH9XDfLeXZKzbIxO0Ssz9ZpsRZnsNjm2Yu00Vtwyv8sdzA2ta7C9+1
         Vj61MqnmCE8XApPqTckOkWnMXZXkhqP70PuBkBwSwck5wAoCRNGGulZAOEfwS3IWK1Yq
         3T9TyW/+OggbMMHkbZZLQK3MR9Skz5sSyXUFjoyPYh+xsbHx3ERQVMUi6Tzd76DYTLzY
         IoJg==
X-Forwarded-Encrypted: i=1; AJvYcCUM+VTyR3OCjZm0nIZ+rprZ2f7OCMJ9es42D28Y6HcJk+iFTi5YVGcknvKDOUxhsyoFfHSiRpkfPt8vC4b1@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCIkpzPFICkq8IVXJlykiZMeEnhh8Cs1ICK8XgdVgJHG9Pjw/
	74BZu0AyyiSz3//GNf7L58JNyk5j7cst00fouKQZ6cC21It3LhD9p0QEnSSEuvTAhgH/Klna1+3
	NDb+b8+ijQ5v+qdiucyos+CMR7Gq5HFXs1Gh+wWYRZfX7zDIwFjasNkm1fYCojv7U0zIG
X-Gm-Gg: ASbGncutdQcMpfoCQYu3T3do2PkA8lAOUdUOtxh0p3a2XRA4Tfk/8sRYAGFJA3239C1
	No/gPR0lRAxCjt6xNYEOVu+W9IAngfjwpHjcdM9SL7xQ7F8tuGuUHzqIfTFrRplGA2JyIrtgIwd
	qKFIZapYZAxQOBuP3a5l+tJdoNz4DgxvBSAZ/vQO7qTRBmawPJCL9xhrn0FkQ4BasplVM91GH6M
	ksfP8tk+1v0KeeZD/pc+XkvX/Kqr9NxVKxUQtiYIh9FMwacpDKRRPucx3OKSd5Ry5EF0x6dOvrR
	rgIdxPWshWjt7Q4F1t+XoswhQevisz8Am2W5bcSfXzEJnZSojN3m5qyMQa5Qi5PNCsPSCJDexpS
	Le1M09tP8ewyVjBIYfrqaVM3kNVmtOVzJ5Go7JPCGze0w7VRMIJnC
X-Received: by 2002:ac8:5793:0:b0:4dd:b403:5cb8 with SMTP id d75a77b69052e-4e6ead03341mr311351111cf.33.1760466836308;
        Tue, 14 Oct 2025 11:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0L7l4pYPETAECPQ7U63ptt6QJpQY7jQFdIZXPliVyVBmaye0w893KiwSDK7I6piXi5/Ugbw==
X-Received: by 2002:ac8:5793:0:b0:4dd:b403:5cb8 with SMTP id d75a77b69052e-4e6ead03341mr311350561cf.33.1760466835574;
        Tue, 14 Oct 2025 11:33:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98c1sm4680478e87.26.2025.10.14.11.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 11:33:54 -0700 (PDT)
Date: Tue, 14 Oct 2025 21:33:52 +0300
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
Message-ID: <lsrbnqupfdrsz43o6wnaarkppzozo5cqfeswlw43ep4itefoxo@cazplkms254h>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <58790287-4787-4763-a979-69df60de9263@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58790287-4787-4763-a979-69df60de9263@arm.com>
X-Proofpoint-GUID: txcLEQQzUNtDNnoZNHIoGbRc7Jqyb-kp
X-Proofpoint-ORIG-GUID: txcLEQQzUNtDNnoZNHIoGbRc7Jqyb-kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX0cZkZr4c3GHC
 iadTyK7LoR2pI5E0L603wYuvSF49QExcPt3iNJiJ1qVLeCzC1mfNh3Nt8VuaW4SMW1xFZR9eaYZ
 kmsXtfZlgmmKP+s3grI/y6cf+x+zVOFs0Q51SzqK+HtFNi5rS9PekDw+xhddmZ8+TIetEmciIVT
 Xn1lNbbfF9Pb0qYRJmgWz44DLFL4Cvz2nnCrqIG7p/USh09N5awgFZ3viq//9/YB1j1Fn38f6GR
 P9izEdxT+78SQ6CdCPtoy7ymi5E2nYmqFiY6fxntXj+gd0+yfJ9dEQTdV0CBDYhl7RXqKHYnx1l
 45Er3ZMl2r3G3Dfwxw/7rBa80kzcqYtEbRvL/kNEisZEXdbbbo07xh9Tbm0oFO5YgGicXdl9IdI
 VrVqd7k0pyFOK0qgU6HIrbA2I3nCKg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee9795 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=LtjjJm7YYzXlsFV477YA:9 a=zR5ucCl2ZVXPAKKm:21
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Tue, Oct 14, 2025 at 03:07:34PM +0100, Robin Murphy wrote:
> On 2025-10-13 1:31 pm, Dmitry Baryshkov wrote:
> > On Mon, Oct 13, 2025 at 12:20:54PM +0100, Robin Murphy wrote:
> > > On 2025-10-09 7:25 pm, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 09, 2025 at 06:03:29PM +0100, Robin Murphy wrote:
> > > > > On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
> > > > > > On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
> > > > > > > On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
> > > > > > > > 
> > > > > > > > On 9/29/2025 3:50 PM, Robin Murphy wrote:
> > > > > > > > > > USECASE [1]:
> > > > > > > > > > -----------
> > > > > > > > > > Video IP, 32bit, have 2 hardware sub blocks(or can be called as
> > > > > > > > > > functions) called as pixel and nonpixel blocks, that does decode and
> > > > > > > > > > encode of the video stream. These sub blocks are __configured__ to
> > > > > > > > > > generate different stream IDs.
> > > > > > > > > 
> > > > > > > > > So please clarify why you can't:
> > > > > > > > > 
> > > > > > > > > a) Describe the sub-blocks as individual child nodes each with their own
> > > > > > > > > distinct "iommus" property
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Thanks Robin for your time. Sorry for late reply as I really didn't have
> > > > > > > > concrete answer for this question.
> > > > > > > > 
> > > > > > > > First let me clarify the word "sub blocks" -- This is just the logical
> > > > > > > > separation with no separate address space to really able to define them
> > > > > > > > as sub devices. Think of it like a single video IP with 2 dma
> > > > > > > > engines(used for pixel and non-pixel purpose).
> > > > > > > > 
> > > > > > > > I should agree that the child-nodes in the device tree is the easy one
> > > > > > > > and infact, it is how being used in downstream.
> > > > > > > > 
> > > > > > > > For upstream -- Since there is no real address space to interact with
> > > > > > > > these sub-blocks(or logical blocks), does it really qualify to define as
> > > > > > > > child nodes in the device tree? I see there is some push back[1].
> > > > > > > 
> > > > > > > Who says you need an address space? Child nodes without "reg" properties,
> > > > > > > referenced by name, compatible or phandle, exist all over the place for all
> > > > > > > manner of reasons. If there are distinct logical functions with their own
> > > > > > > distinct hardware properties, then I would say having child nodes to
> > > > > > > describe and associate those properties with their respective functions is
> > > > > > > entirely natural and appropriate. The first example that comes to mind of
> > > > > > > where this is a well-established practice is PMICs - to pick one at random:
> > > > > > > Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > > > > 
> > > > > > Logical function, that's correct. And also note, for PMICs that practice
> > > > > > has bitten us back. For PM8008 we switched back to a non-subdevice
> > > > > > representation.
> > > > > > 
> > > > > > > For bonus irony, you can't take the other approaches without inherently
> > > > > > > *introducing* a notional address space in the form of your logical function
> > > > > > > IDs anyway.
> > > > > > > 
> > > > > > > >       > or:
> > > > > > > > > 
> > > > > > > > > b) Use standard "iommu-map" which already supports mapping a masked
> > > > > > > > > input ID to an arbitrary IOMMU specifier
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > I think clients is also required to program non-zero smr mask, where as
> > > > > > > > iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
> > > > > > > > am unable to catch your thought here.
> > > > > > > An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says it
> > > > > > > is. The fact that Linux's parsing code only works properly for #iommu-cells
> > > > > > > = 1 is not really a DT binding problem (other than it stemming from a loose
> > > > > > > assumption stated in the PCI binding's use of the property).
> > > > > > 
> > > > > > I really don't like the idea of extending the #iommu-cells. The ARM SMMU
> > > > > > has only one cell, which is correct even for our platforms. The fact
> > > > > > that we need to identify different IOMMU SIDs (and handle them in a
> > > > > > differnt ways) is internal to the video device (and several other
> > > > > > devices). There is nothing to be handled on the ARM SMMU side.
> > > > > 
> > > > > Huh? So if you prefer not to change anything, are you suggesting this series
> > > > > doesn't need to exist at all? Now I'm thoroughly confused...
> > > > 
> > > > Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
> > > > #iommu-cells is the best idea.
> > > 
> > > What? No, any function ID would be an *input* to a map, not part of the
> > > output specifier; indeed it should never go anywhere near the IOMMU, I don't
> > > think anyone suggested that.
> > 
> > It was Bryan, https://lore.kernel.org/linux-arm-msm/9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org
> 
> Ah, I wasn't on that thread. But indeed, as I hopefully explained before,
> that whole idea is a non-starter anyway due to who the consumers of "iommus"
> actually are.
> 
> > > > > If you want to use SMR masks, then you absolutely need #iommu-cells = 2,
> > > > > because that is the SMMU binding for using SMR masks. It would definitely
> > > > 
> > > > I'm sorry. Yes, we have #iommu-cells = <2>.
> > > > 
> > > > > not be OK to have some magic property trying to smuggle
> > > > > IOMMU-driver-specific data contrary to what the IOMMU node itself says. As
> > > > > for iommu-map, I don't see what would be objectionable about improving the
> > > > > parsing to respect a real #iommu-cells value rather than hard-coding an
> > > > > assumption. Yes, we'd probably need to forbid entries with length > 1
> > > > > targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
> > > > 
> > > > This will break e.g. PCIe on Qualcomm platforms:
> > > > 
> > > >                           iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> > > >                                       <0x100 &apps_smmu 0x1401 0x1>;
> > > > 
> > > > 
> > > > But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
> > > > <2>. It depends on ARM SMMU ignoring the second cell when it's not
> > > > present.
> > > 
> > > Urgh, yes, that's just broken already :(
> > > 
> > > At least they all seem to be a sufficiently consistent pattern that a
> > > targeted workaround to detect old DTBs looks feasible (I'm thinking, if
> > > iommu-map size % 4 == 0 and cells n*4 + 3 are all 1 and cells n*4 + 1 are
> > > all the same phandle to an IOMMU with #iommu-cells == 2, then parse as if
> > > #iommu-cells == 1)
> > 
> > How do we handle the case of #iommu-cells = <2>? I.e. what should be the
> > "fixed" representation of the map above? Should we have usual cells and
> > one extra "length" just for the sake of it?
> 
> It's not really "for the sake of it", it is the defined format of the
> "iommu-map" binding - IMO it would be far more horrible if each entry did or
> didn't include a length cell depending on the size of the preceding IOMMU
> specifier. It's also far from infeasible to have *some* well-defined
> relationship between a non-singular input ID range and a multi-cell base
> IOMMU specifier, it just needs more IOMMU-specific interpretation in the
> consumer than Linux cares to bother with. Thus it is appropriate for the
> binding to be able to describe that even though Linux as a consumer
> continues to refuse to support it. The binding does not describe Linux, or
> the property would be named "linux,iommu-map".

Ack.

> 
> >                 iommu-map = <0x0   &apps_smmu 0x1400 0x0 0x1>,
> >                             <0x100 &apps_smmu 0x1401 0x0 0x1>;
> > 
> > 
> > I really like the idea of fixing iommu-map as that would remove the need
> > for other properties, but
> > 
> > > 
> > > > > relationship between the input ID and the output specifier falls apart when
> > > > > the specifier is complex, but that seems simple enough to implement and
> > > > > document (even if it's too fiddly to describe in the schema itself), and
> > > > > still certainly no worse than having another property that *is* just
> > > > > iommu-map with implicit length = 1.
> > > > > 
> > > > > And if you want individual StreamIDs for logical functions to be attachable
> > > > > to distinct contexts then those functions absolutely must be visible to the
> > > > > IOMMU layer and the SMMU driver as independent devices with their own unique
> > > > > properties, which means either they come that way from the DT as of_platform
> > > > > devices in the first place, or you implement a full bus_type abstraction
> > > > 
> > > > Not necessarily. Tegra display driver creates a device for each context
> > > > on its own.
> > > No, the *display* driver does not; the host1x bus driver does, which is the
> > > point I was making - that has a proper bus abstraction tied into the IOMMU
> > > layer, such that the devices are correctly configured long before the actual
> > > DRM driver(s) get anywhere near them.
> > 
> > Ack. I agree. it's drivers/gpu/host1x/context, not drivers/gpu/drm/
> > 
> > > 
> > > > In fact, using OF to create context devices is _less_
> > > > robust, because now the driver needs to sync, checking that there is a
> > > > subdevice, that it has probed, etc. Using manually created devices seems
> > > > better from my POV.
> > > 
> > > Huh? A simple call to of_platform_populate() is somehow less robust than
> > > open-coding much of the same logic that of_platform_populate() does plus a
> > > bunch of hackery to try to fake up an of_node to make the new device appear
> > > to own the appropriate properties?
> > > 
> > > Having entire sub-*drivers* for child devices or not is an orthogonal issue
> > > regardless of whichever way they are created.
> > 
> > I was (again) looking at host1x. It doesn't fake of_node (nor does it
> > have actual OF nodes). Instead it just mapps IOMMUs directly to the
> > context devices. Compare this to misc/fastrpc.c, which has subdevices
> > and drivers to map contexts. The latter one looks less robust.
> > 
> > And from DT perspective compare:
> > 
> > 		fastrpc {
> > 			compatible = "qcom,fastrpc";
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			compute-cb@3 {
> > 				compatible = "qcom,fastrpc-compute-cb";
> > 				reg = <3>;
> > 				iommus = <&apps_smmu 0x1803 0x0>;
> > 			};
> > 
> > 			compute-cb@4 {
> > 				compatible = "qcom,fastrpc-compute-cb";
> > 				reg = <4>;
> > 				iommus = <&apps_smmu 0x1804 0x0>;
> > 			};
> > 
> > 			compute-cb@5 {
> > 				compatible = "qcom,fastrpc-compute-cb";
> > 				reg = <5>;
> > 				iommus = <&apps_smmu 0x1805 0x0>;
> > 			};
> > 		};
> > 
> > VS (note, it doesn't have 'length', it can be added back with no issues):
> > 
> > 		fastrpc {
> > 			compatible = "qcom,fastrpc";
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			iommu-map = <3 &apps_smmu 0x1803 0x0>,
> > 				    <4 &apps_smmu 0x1804 0x0>,
> > 				    <5 &apps_smmu 0x1805 0x0>;
> > 		};
> > 
> > 
> > I think the latter is more compact, and more robust.
> 
> For that particular case I concur that iommu-map might fit just as well,
> since it appears similar to the Tegra one - essentially just a pool of
> identical hardware contexts with no special individual properties, whose
> purpose is defined by the software using them (be that the driver itself, or
> the firmware on the other end). IOW, the DT really isn't describing anything
> more than a mapping between a context ID and an IOMMU specifier either way.

Yep. Subdevices look like an overkill to me.

> 
> That said I also see nothing immediately wrong with the fastrpc driver as-is
> either; if anything it looks like a pretty ideal example of the
> "self-contained" non-bus approach I was alluding to. The "fake of_node"
> notion only applies to the idea of trying to keep that same driver structure
> but just replace of_platform_populate() with conjuring platform_devices out
> of thin air.

This creates a bit of race conditions: there might be a time when the
main device has probed (and thus is available in /dev for the userspace
to ping), but the context driver haven't yet probed (or not probed
enough of them), causing weird heisenbugs to userspace.

> > Note, to make a complete example, it should be probably something like
> > (sc7280, cdsp, note duplicate IDs in the map, again, I omitted length):
> > 
> > 	       fastrpc {
> > 			compatible = "qcom,fastrpc";
> > 
> > 			iommu-map = <1 &apps_smmu 0x11a1 0x0420>,
> > 				    <1 &apps_smmu 0x1181 0x0420>,
> > 				    <2 &apps_smmu 0x11a2 0x0420>,
> > 				    <2 &apps_smmu 0x1182 0x0420>,
> > 				    <3 &apps_smmu 0x11a3 0x0420>,
> > 				    <3 &apps_smmu 0x1183 0x0420>;
> 
> Note that as another orthogonal issue, Linux also doesn't support 1:many
> maps like that - we'll only parse the first matching entry. However this
> specific example (and the current DTs) doesn't make sense anyway, since each
> pair of SMRs encodes the same set of matches (0x118x, 0x11ax, 0x158x,
> 0x15ax), so at best it's redundant while at worst it's a stream match
> conflict fault waiting to happen?

In this case they seem superflux (although that remodelled from the
existing platform). I wanted to point out 1:many, as you guessed. But
anyway, that can be handled in software.

> 
> > 			dma-coherent;
> > 		};
> > 
> > 
> > > > > which will have to be hooked up to the IOMMU layer. You cannot make IOMMU
> > > > > configuration "internal" to the actual client driver which is only allowed
> > > > > to bind *after* said IOMMU configuration has already been made.
> > > > 
> > > > I'm not sure I follow this, I'm sorry.
> > > I mean IOMMU configuration is designed to happen at device_add() time, and
> > > client drivers must not assume otherwise (the mechanisms for handling IOMMU
> > > drivers registering "late" from modules are internal details that can and
> > > will change). If you're under the impression that a straightforward platform
> > > driver for the video codec itself would be able to invoke IOMMU
> > > configuration for the video codec platform device (without unacceptable
> > > levels of hackery) then you are mistaken, sorry.
> > > 
> > > Again, to be able to assign StreamIDs to different contexts, those StreamIDs
> > > must uniquely belong to different struct devices. Thus in terms of how you
> > > get to those struct devices from a DT representation, either they come from
> > > distinct DT nodes with standard "iommus" properties that the generic
> > > of_platform code can create and configure accordingly, or you're doing a
> > > non-trivial amount of work to implement your own bus layer like
> > > host1x_context_bus to manage your own type of sub-device. There is no valid
> > > middle ground of trying to stuff driver-specific knowledge of arbitrarily
> > > made-up function IDs into the generic platform bus code.
> > 
> > 
> > I'd totally prefer something like:
> > 
> > 	video-codec@foobar {
> > 		compatible = "qcom,video";
> > 
> > 		iommus = <&apps_smmu 0x1234 0xca>;
> > 		iommu-maps = <PIXEL &apps_smmu 0xabcdef 0xac>,
> > 			     <SECURE_PIXEL &apps_smmu 0x898989 0xac>,
> > 			     <SECURE_BITSTREAM &apps_smmu 0x898998 0xac>;
> > 	};
> This is where I maintain a differing opinion - if it's *not* a "pool of
> identical contexts" case, but a single nominal hardware block with a small
> number of distinct DMA streams for fundamentally different purposes defined
> by the hardware design, then I would usually consider it more natural,
> honest and useful to make those differences explicit by name/compatible with
> child nodes, rather than hide them behind an opaque arbitrary integer. If by
> nature of being functionally different they also might require individual
> properties - such as memory-regions - then child nodes are the only option
> anyway.
> 
> However, if there is actually some meaningful hardware notion of "function
> ID", the design/usage model is such that it would generally be logical for a
> consumer driver to be structured as managing a set of fixed-function
> sub-devices on an internal bus, and you're absolutely definite that those
> sub-devices will never ever need any DT properties of their own in future
> revisions/integrations, then maybe an "iommu-map"-based binding is OK. All I
> can say for sure is that describing complex hardware well is very nuanced
> and there is no one universal right answer.

Vikash has tried this initially ([1]) and got a rejection from Krzysztof
([2]).

[1] https://lore.kernel.org/linux-arm-msm/20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com/

[2] https://lore.kernel.org/linux-arm-msm/24dd3e64-958a-41d5-8032-1da91063eaeb@kernel.org/

-- 
With best wishes
Dmitry


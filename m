Return-Path: <linux-arm-msm+bounces-87621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB5CF6A45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 05:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C122D3000360
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 04:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8E7275AE1;
	Tue,  6 Jan 2026 04:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmG7278m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE21A9F9D;
	Tue,  6 Jan 2026 04:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767672705; cv=none; b=LpzUc4wGen4EfmUbRXS713TD9pxubCImWWMVNYsiH17kmDtClOwwR/QyOIF0fYyVopzEGEnxW/rJ0Ez8JsMQoKwawkc+VsumgfZ0uXkZs628raPRzZgIySBOjgHl7WMDpeAYwc47qGWNwlZ+HV2ya//togZxLcnR2fywjnaBp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767672705; c=relaxed/simple;
	bh=lzljBcxZBefBonMPO/EuppMBdNmIGz89+oq0/wOV6Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjFsCjQbRTmMYSvlJrn1BUdVi5MDNHubCk+BvgRAdmTV++jhLj9Or9Cheicoe4LOBUbbwaZA3PWGytpd8rlmcinXy2Cczkeo6kBjD7U++kBvXNqd/jrr3umpNYHnM8F+k7y6Vq9zHjBlkKQonzNcJMpRKa5EmkwUxbSSPlqggrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmG7278m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C2CC116C6;
	Tue,  6 Jan 2026 04:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767672704;
	bh=lzljBcxZBefBonMPO/EuppMBdNmIGz89+oq0/wOV6Pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmG7278maJR+/G9uPeuVz/In/AhDWhyKHyAV6jx+apTXVAqi8gAp5s3pJtGziG74i
	 4e0HTf3w1hhBSnmCOCRVG5NxA6Bqvp8utt96S+KIg50O7wMiJKH6ZvRF/at7ISmK26
	 NBTUFztBllmfoy4Im0nj+RKbjScpem9V4kL3elj0jtfMwsK9JjDuf7yRpyMOghFXk+
	 0sZqb9rqod+2+x77OtV7kwCXvo+M4fqjyCe+Dlbgi61+0rXDF5vDpmwHzu3esyui2l
	 rcv1iAozAeag++tn+X0dPk/WGL7F/D3T5K+s3d3IKBxhD4dzUqINqJF1G4supETSJN
	 dR+gTfe3DHpSQ==
Date: Mon, 5 Jan 2026 22:11:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Yijie Yang <yijie.yang@oss.qualcomm.com>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
Message-ID: <s5uorc5bqxvrghi6emhstrjoyqx2fkkbm7kcgrob52k4wfbtlv@bqfukhdutd4s>
References: <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
 <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
 <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
 <bab3794d-d7f8-492a-82a2-6a8a6f80a708@oss.qualcomm.com>
 <6qvzhyjrxctrrdvhktxkusyhdcohr43muung5paan2i35suxwg@kfl5kkmpv4fw>
 <3f3dfd39-2cd1-4b03-8632-2c9d15b0bc2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f3dfd39-2cd1-4b03-8632-2c9d15b0bc2e@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 11:05:30AM +0800, Tingwei Zhang wrote:
> 
> 
> On 1/6/2026 9:47 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 06, 2026 at 09:24:38AM +0800, Tingwei Zhang wrote:
> >>
> >> On 1/5/2026 11:09 PM, Krzysztof Kozlowski wrote:
> >>> On 05/01/2026 06:36, Tingwei Zhang wrote:
> >>>> On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
> >>>>> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
> >>>>>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
> >>>>>>> On 29/12/2025 08:38, Yijie Yang wrote:
> >>>>>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
> >>>>>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
> >>>>>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
> >>>>>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
> >>> If this was the same SoM, just with different SoC soldered, it would
> >>> have the same PMICs. Different PMICs means different SoM...
> >> I agree. It's not same SoM, but they are very similar with same circuit board.
> >>> Anyway, I shared my opinion and I am not going to spend more time on
> >>> this. It should not be my task to go through schematics and prove that
> >>> PMICs differ. Authors should.
> >> We will make it more clear in the description about PMIC difference.
> >> Since we have the agreement that Hamoa/Purwa modules are very similar,
> >> we will use common dtsi in next version. Please let me know if you think
> >> that's not correct thing to do.
> > I think, you have been clearly told _not_ _to_. You have agreed that
> > they are not the same module. So, please stop.
> >
> From hardware side, I think we are on same page. Hamoa and Purwa modules
> are not same SoM, but they are very similar.

"They are very similar."

> The only difference is different SoC, PCI, APC supply and one PMIC.

"They are not the same."

> The circuit boards are same.

"They are exactly the same".

> We have exactly same case on Hamoa/Purwa CRD which uses a common
> dtsi.
> Can we use common dtsi for the hardware boards which are very similar?
> Is that very strict that the hardware boards have to be exactly same?
> 

How about doing what we did for Hamoa and Purwa CRD? Just introduce
both, then let the diff between the files and the refactoring of the
files prove your point that there's good leverage.

It might be a detour on the path to reach exactly what you propose here,
but you're going to do it using data, rather than trying to argue that
they are not only similar, but also not the same and exactly the same,
at once. And none of this will impact the .dtb files, so we can shuffle
things around with limited impact.

Once we have some concrete cases of scale, we'll reach some precedence
and this exercise can be avoided for future targets.


PS. We transitioned away from using marketing names to simplify things,
so I am not keen on accepting something called "iq-x-iot" as an "alias"
for hamoa-* and purwa-*. I can only assume that right around the corner
we would have both "q-8-iot" and "iq-8-iot"?

And yes, it's it perfectly reasonable to reach the conclusion that
calling something x1-crd.dtsi was the wrong thing to do, and if so we'll
fix it. But that at least have similar filename prefix to x1e80100 etc.

Regards,
Bjorn


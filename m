Return-Path: <linux-arm-msm+bounces-85693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B48CCBF99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14AE63081B6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CEE336ED1;
	Thu, 18 Dec 2025 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQSAzzvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1CB3358C0;
	Thu, 18 Dec 2025 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766063883; cv=none; b=Qtw8dqO0xOzb/U7iJedcAuS9a385/o+uZTkZet6M4/nTBzAymvdUrfvAl2trkTeN+xjIewvUErka2vnSYXR1p4xtqYNRzt9+W/Vpa3uDxW+0Wmh/VY4Vvd8/AYirIc/qO1+1uXlxC1xkngCNHP44dxcWChaQhFCiLS1i1HH0JhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766063883; c=relaxed/simple;
	bh=AoQPu05olk3ygib1gu9r2V5ATg3RUbWbYIZtlXl/KPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AszO23MuB4szWRREkdm1kHLttbJO/cuOIhY1+oNuuh6XusyiqOAGGnDZhdiz/cDAc3kLSxacqyB47oZqBB5on3RKmheacIauhHI9L6tZTZ8jsfOu+DlaiuZviYJXwtkDyATxQYFG/PRnkipZa1W/lPv4+dW25A3T8YDdpNGlzu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQSAzzvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99AAC4CEFB;
	Thu, 18 Dec 2025 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766063883;
	bh=AoQPu05olk3ygib1gu9r2V5ATg3RUbWbYIZtlXl/KPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQSAzzvHx5SMryDljSCGut6ADdJSOINLpJSn/Lo0/AxChV8AYgKDnhpo5a2W6Ldcw
	 LRmMl2zhal9qaV4U1gtlASq4aI/eNr17nZepdY8Bd3SszVjKfJ7qMUXbhsjStANPVO
	 jHGxjUCnckIQORzha0pMM4XZmEfwXuK/yBrirWXFmmERu7Fsi9HEAdJuvtZzac+ukx
	 TAfwY1IOgblhKQAshf+mfuNSz5IawyWXapJahI5tE8dbUrCWg9e9EWZpCppQHTmpu6
	 2o+S66QZGjOET7QTeIurk29a4dfJbNfvnOBtrc+BjOAg9APQYxlqCfdf7gwxEub6sE
	 4aQDki9ukj+iQ==
Date: Thu, 18 Dec 2025 07:18:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <hiamkja7wmhhwnx4jxuzq35gmwgiak5ekbijs5etex3zz6ijra@oravyeywzg5n>
References: <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
 <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
 <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
 <aUP1TOq09gzmUGai@hu-qianyu-lv.qualcomm.com>
 <u5scdkfwygizo4rsuuciwsygkgl5danzsobbpytz7recuekfz4@yclft32plmoc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <u5scdkfwygizo4rsuuciwsygkgl5danzsobbpytz7recuekfz4@yclft32plmoc>

On Thu, Dec 18, 2025 at 06:12:37PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 18, 2025 at 04:36:28AM -0800, Qiang Yu wrote:
> > On Thu, Dec 18, 2025 at 04:51:18PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Dec 18, 2025 at 05:21:54PM +0800, Baochen Qiang wrote:
> > > > 
> > > > 
> > > > On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> > > > > 
> > > > > 
> > > > > On 12/18/2025 4:04 PM, Qiang Yu wrote:
> > > > >> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> > > > >>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > > > >>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > > >>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > >>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > >>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > >>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > >>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > >>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
> > > > >>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > >>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > >>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > >>>>>>>>>>>>>>> authentication requirement.
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
> > > > >>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
> > > > >>>>>>>>>>>>>>> - Remaining: WLAN FW segments
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
> > > > >>>>>>>>>>>>>>> headers in a single binary:
> > > > >>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
> > > > >>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Download behavior:
> > > > >>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > >>>>>>>>>>>>>>>           2. Full image via BHIe
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > >>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > >>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > >>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
> > > > >>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>> What is standard about it?
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
> > > > >>>>>>>>>>>>> header and WLAN FW segment.
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
> > > > >>>>>>>>>>>>> required for TME-L image authentication, how about using 
> > > > >>>>>>>>>>>>> tme_supported_image?
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> Just elf_image?
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> Is it too generic for this specific use case. Current image format also
> > > > >>>>>>>>>>> contains elf header.
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> upload_elf_image?
> > > > >>>>>>>>>>
> > > > >>>>>>>>>
> > > > >>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > >>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > >>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > >>>>>>>>> used previously.
> > > > >>>>>>>>
> > > > >>>>>>>> What kind of ELF image was used previously? Could you please explain
> > > > >>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > >>>>>>>>
> > > > >>>>>>>
> > > > >>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > >>>>>>> that was a non-standard ELF image and the new one is going to be spec
> > > > >>>>>>> conformant.
> > > > >>>>>>>
> > > > >>>>>> Previous image format:
> > > > >>>>>> ELF header + SBL segments + WLAN FW segments
> > > > >>>>>>
> > > > >>>>>> The TME-L supported image format:
> > > > >>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > > > >>>>>
> > > > >>>>> What is the Second ELF header in this context? ELF files usually have
> > > > >>>>> only one header. Are we repeating the same ELF header or is some kind of
> > > > >>>>> an embedded ELF-in-ELF.
> > > > >>>>
> > > > >>>> The "Second ELF header" refers to a separate, complete ELF file embedded
> > > > >>>> within the FBC image, not a duplicate header. The TME-L supported format
> > > > >>>> contains:
> > > > >>>>
> > > > >>>> FBC Image Structure:
> > > > >>>> ┌─────────────────────────────────────┐
> > > > >>>> │  Complete ELF File #1 (SBL)        │
> > > > >>>> │  ┌─────────────────────────────┐   │
> > > > >>>> │  │ ELF Header                  │   │ ← First ELF header
> > > > >>>> │  │ Program Headers             │   │
> > > > >>>> │  │ SBL Segments                │   │
> > > > >>>> │  └─────────────────────────────┘   │
> > > > >>>> ├─────────────────────────────────────┤
> > > > >>>> │  Complete ELF File #2 (WLAN FW)    │
> > > > >>>> │  ┌─────────────────────────────┐   │
> > > > >>>> │  │ ELF Header                  │   │ ← Second ELF header
> > > > >>>> │  │ Program Headers             │   │
> > > > >>>> │  │ WLAN FW Segments            │   │
> > > > >>>> │  └─────────────────────────────┘   │
> > > > >>>> └─────────────────────────────────────┘
> > > > >>>>>
> > > > >>>>>>
> > > > >>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > > > >>>>>
> > > > >>>>> pointer?
> > > > >>>>
> > > > >>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > > > >>>> ELF excutable file, I can not point out a specfic sentence or phase that
> > > > >>>> tell us the previous image format is standard. But at least there is an
> > > > >>>> example we can refer to: Figure A-4. Executable File Example. And I can
> > > > >>>> also use readelf cmd to parse the image.
> > > > >>>>
> > > > >>>>>
> > > > >>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
> > > > >>>>>> because we need separate elf header for SBL and WL FW for TME-L
> > > > >>>>>> authentication.
> > > > >>>>>>
> > > > >>>>>> So the commit message stating "Currently, the FBC image is a non-standard
> > > > >>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
> > > > >>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > > >>>>>>
> > > > >>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
> > > > >>>>>> separate_elf_header and tme_supported_image are more accurate.
> > > > >>>>>
> > > > >>>>> Please define, what is the supported image.
> > > > >>>>
> > > > >>>> The supported image refers to an image format that TME-L can authenticate.
> > > > >>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > > > >>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > > > >>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > > > >>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > > > >>>> TME-L.
> > > > >>>>
> > > > >>>
> > > > >>> So what makes it different here is that you are now sending the two FWs
> > > > >>> separately as standalone ELF image to the device for authentication by TME-L,
> > > > >>> but those are combined in a single image file in the host. But what makes you to
> > > > >>> combine two images in the first place? Why can't they be separate ELF files?
> > > > >>>
> > > > >>> I think you can avoid the hassle if you could just have separate ELF images for
> > > > >>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
> > > > >>>
> > > > >> Yes, they are two separate images combined into a single file. I'm not
> > > > >> sure of the specific reasons for this design choice, so I can't comment
> > > > >> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
> > > > >> I don't know whether they're willing to change.
> > > > >>
> > > > >> Baochen, do you have any comment on this?
> > > > > 
> > > > > Hmm, sorry, no idea :(
> > > > 
> > > > I mean I don't know the reason behind the design choice.
> > > > 
> > > 
> > > Ok, then I guess we should try to get rid of the flag and just check for the
> > > WLAN FW ELF header during runtime:
> > > 
> > > 	/*
> > > 	 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> > > 	 * file. Hence, check for the existence of the second ELF header after
> > > 	 * SBL. If present, load the second image separately.
> > > 	 */
> > > 	if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> > > 		fw_data += mhi_cntrl->sbl_size
> > > 		fw_sz -= mhi_cntrl->sbl_size;
> > > 	}
> > >
> > Hmmm, for the old format image, since the data at `fw_data + mhi_cntrl->sbl_size`
> > is raw WLAN FW data, there's a possibility that the raw binary data could
> > accidentally contain the ELF magic number at that offset, even though it's
> > not actually an ELF file. This could lead to false positive detection and
> > incorrect parsing.
> > 
> 
> Really? How can the WLAN FW segment have the ELF magic at the start of the
> segment? Then it becomes a separate ELF file.
> 

But isn't this new format 2 concatenated ELF files? If so there
shouldn't be any data at this position? It should be the end of the
"file"?

The only way I can see that there would accidentally be a ELF header
here would be if we're still in the middle of the first ELF - but that
doesn't seem like the place to look for the second ELF.

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 


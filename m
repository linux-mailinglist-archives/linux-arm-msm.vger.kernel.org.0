Return-Path: <linux-arm-msm+bounces-85677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFACCB959
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7985B3009779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8656C1C5D6A;
	Thu, 18 Dec 2025 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqgjvUol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC51E4AF;
	Thu, 18 Dec 2025 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056891; cv=none; b=muEP9H/s76UD1ZRycH6Khq50ug8ywv4bzGh48JZbdZR4VMbdZTzFaSvV8eGfZx/OX3+iOV5HrwHY/zhMuxpxk1jBdH6dbqgsi4gjc8xyZqW3AEz/slqBqBcO/QxrTZ0TX5ED9WY4qaBmo00cp+bPz+HzoaAqDWlazrq1yt2gSwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056891; c=relaxed/simple;
	bh=WSuZiH14Fb7LFDruRIJNxEtdiCIv4NaXGh8dSIxEhLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKclUtJtTfRZIHYFdLtLWMdRl7Ko6qWordx08XJXjcYJK8xDzyVlkErM+pE1kulBBVnIiN6vmlvmiy5fGCgLRbySMDC1F0xakqZdXGNyQq1VDhgOSu8vMNuFX6P+B++Lh7/3f/f4kTemVfWsMGtFNDc3jWAJqXCOgz5kHkfg8WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqgjvUol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BC8C4CEFB;
	Thu, 18 Dec 2025 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766056890;
	bh=WSuZiH14Fb7LFDruRIJNxEtdiCIv4NaXGh8dSIxEhLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqgjvUollLJjnXuwHmIkgGwXce8C6IdhZBhWUQkGSpxjVzCLz8H4rbG5iaCs/cfE6
	 IgvVMD5Y89a4Q9rpGwnPBytrdhYdAum0Qh4dxwD20OFYIxgsNCbQO7eLcphpzDWGku
	 NLnyeeUbCdfi9WwSeUpoPRdOPWFrrydfynX2cTBO125PB4h9Z7mGVmVxyvdVjXxTN0
	 xRG1LcLQyraTcVfCEpusg16A4HvzwL9FHuO3z0Z7+SWe7SRYPnl7t2pK/zNK9TgrVk
	 g4jyrQmbqftgpPU60yB8m4yPGuPvKUM8LNymJu21JsTJReJu1M8Hkubnmd+N4QwT80
	 yLe9qe0G03juQ==
Date: Thu, 18 Dec 2025 16:51:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
References: <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
 <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>

On Thu, Dec 18, 2025 at 05:21:54PM +0800, Baochen Qiang wrote:
> 
> 
> On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> > 
> > 
> > On 12/18/2025 4:04 PM, Qiang Yu wrote:
> >> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> >>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> >>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> >>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> >>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> >>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> >>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> >>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> >>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> >>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
> >>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> >>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> >>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> >>>>>>>>>>>>>>> authentication requirement.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
> >>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
> >>>>>>>>>>>>>>> - Remaining: WLAN FW segments
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
> >>>>>>>>>>>>>>> headers in a single binary:
> >>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
> >>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Download behavior:
> >>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> >>>>>>>>>>>>>>>           2. Full image via BHIe
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> >>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> >>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
> >>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> What is standard about it?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
> >>>>>>>>>>>>> header and WLAN FW segment.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
> >>>>>>>>>>>>> required for TME-L image authentication, how about using 
> >>>>>>>>>>>>> tme_supported_image?
> >>>>>>>>>>>>
> >>>>>>>>>>>> Just elf_image?
> >>>>>>>>>>>
> >>>>>>>>>>> Is it too generic for this specific use case. Current image format also
> >>>>>>>>>>> contains elf header.
> >>>>>>>>>>
> >>>>>>>>>> upload_elf_image?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> >>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
> >>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> >>>>>>>>> used previously.
> >>>>>>>>
> >>>>>>>> What kind of ELF image was used previously? Could you please explain
> >>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
> >>>>>>>>
> >>>>>>>
> >>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> >>>>>>> that was a non-standard ELF image and the new one is going to be spec
> >>>>>>> conformant.
> >>>>>>>
> >>>>>> Previous image format:
> >>>>>> ELF header + SBL segments + WLAN FW segments
> >>>>>>
> >>>>>> The TME-L supported image format:
> >>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
> >>>>>
> >>>>> What is the Second ELF header in this context? ELF files usually have
> >>>>> only one header. Are we repeating the same ELF header or is some kind of
> >>>>> an embedded ELF-in-ELF.
> >>>>
> >>>> The "Second ELF header" refers to a separate, complete ELF file embedded
> >>>> within the FBC image, not a duplicate header. The TME-L supported format
> >>>> contains:
> >>>>
> >>>> FBC Image Structure:
> >>>> ┌─────────────────────────────────────┐
> >>>> │  Complete ELF File #1 (SBL)        │
> >>>> │  ┌─────────────────────────────┐   │
> >>>> │  │ ELF Header                  │   │ ← First ELF header
> >>>> │  │ Program Headers             │   │
> >>>> │  │ SBL Segments                │   │
> >>>> │  └─────────────────────────────┘   │
> >>>> ├─────────────────────────────────────┤
> >>>> │  Complete ELF File #2 (WLAN FW)    │
> >>>> │  ┌─────────────────────────────┐   │
> >>>> │  │ ELF Header                  │   │ ← Second ELF header
> >>>> │  │ Program Headers             │   │
> >>>> │  │ WLAN FW Segments            │   │
> >>>> │  └─────────────────────────────┘   │
> >>>> └─────────────────────────────────────┘
> >>>>>
> >>>>>>
> >>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> >>>>>
> >>>>> pointer?
> >>>>
> >>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> >>>> ELF excutable file, I can not point out a specfic sentence or phase that
> >>>> tell us the previous image format is standard. But at least there is an
> >>>> example we can refer to: Figure A-4. Executable File Example. And I can
> >>>> also use readelf cmd to parse the image.
> >>>>
> >>>>>
> >>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
> >>>>>> because we need separate elf header for SBL and WL FW for TME-L
> >>>>>> authentication.
> >>>>>>
> >>>>>> So the commit message stating "Currently, the FBC image is a non-standard
> >>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
> >>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
> >>>>>>
> >>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
> >>>>>> separate_elf_header and tme_supported_image are more accurate.
> >>>>>
> >>>>> Please define, what is the supported image.
> >>>>
> >>>> The supported image refers to an image format that TME-L can authenticate.
> >>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> >>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> >>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> >>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> >>>> TME-L.
> >>>>
> >>>
> >>> So what makes it different here is that you are now sending the two FWs
> >>> separately as standalone ELF image to the device for authentication by TME-L,
> >>> but those are combined in a single image file in the host. But what makes you to
> >>> combine two images in the first place? Why can't they be separate ELF files?
> >>>
> >>> I think you can avoid the hassle if you could just have separate ELF images for
> >>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
> >>>
> >> Yes, they are two separate images combined into a single file. I'm not
> >> sure of the specific reasons for this design choice, so I can't comment
> >> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
> >> I don't know whether they're willing to change.
> >>
> >> Baochen, do you have any comment on this?
> > 
> > Hmm, sorry, no idea :(
> 
> I mean I don't know the reason behind the design choice.
> 

Ok, then I guess we should try to get rid of the flag and just check for the
WLAN FW ELF header during runtime:

	/*
	 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
	 * file. Hence, check for the existence of the second ELF header after
	 * SBL. If present, load the second image separately.
	 */
	if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
		fw_data += mhi_cntrl->sbl_size
		fw_sz -= mhi_cntrl->sbl_size;
	}

- Mani

-- 
மணிவண்ணன் சதாசிவம்


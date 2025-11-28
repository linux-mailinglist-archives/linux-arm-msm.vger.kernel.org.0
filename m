Return-Path: <linux-arm-msm+bounces-83807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB2EC933C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 23:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 637E94E27F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 22:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19B32E370E;
	Fri, 28 Nov 2025 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IT16xfEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A222E266E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764367828; cv=none; b=TCwCavVV21T0wUQ69HLqd0lJK+YUADhJDJYMGfsuIi4pWTbCqGP3jwQmSXmc0tf4XQAccjzven0t6o1aUSf+gQMtp/rGerXERJJPnHd9Ka4MsTTbpIoby8Y6DGGx4W5GP4/4ZAKPBbjHRM4tzxrFYilNt9lk+lDLeDVRyUcuHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764367828; c=relaxed/simple;
	bh=3JnUxTFqvd2KTODtt1gzQT9xC6ENBY6FPjaEH91L+8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFIS0n18C6Eag26/FEIPBs1EnNmFhhdDUH0czHW0Y19IHl++y28AIFvy34u1npFKTxWD9bD/S+dv3UtpxG+c6nIaYtJZibBUmNZ/UtMQP9dy9ybgLwP5zugheWFIeWO5NZuDRI8J4fLC/7LGKKyyrDjWhZRPg0iFvFsHe/x1nqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IT16xfEK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477770019e4so18035405e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 14:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764367825; x=1764972625; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TtryFy/Jnn1lu6emaHIQgv0be1BBuqd7mtOuBSPgxH4=;
        b=IT16xfEKjr97xOW0MisRL09JvkY9JfTdsWEUP28BYoNKNVFAW2qg9DdR5ZKcT3SRFn
         KFOCxGAGcwop/rXiq1evrIxp31e4/3E6zNXCre9S5gijvRou8lPlLRgPLQuE6IYa6B7p
         Rr5kLhUomikblDUYiAs79hqQBXo2KL62v966X/dRMj1GoT8p0Akk0CeyHXPt95Uz7V6V
         pW0zC2FnPoo7r6nMi8wGupb6E0mW/phojzNj/uQ+xH1XGef5greTjzQaIh72IuzPns7y
         yupjrhURyOnXk76PqJMxp8NR70QIpFKQsjFCDhltJEEYDbY77pSQsYJZocAC1l1xakOn
         913A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764367825; x=1764972625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtryFy/Jnn1lu6emaHIQgv0be1BBuqd7mtOuBSPgxH4=;
        b=vmp+oTxS37w31+HNoM7xkF05MUpEj0Zoa2IeE7FG3HvP9DJ8Ox6ANuMWJOYg6WO26E
         Cpb0ZQ551HBCdad2YG6mTCJT7c3Gk6PzitVrXwE20KVbFC9Ksmb5KDo9QRBLKG9EAm7r
         IPkU454tx3kPEe9L7/mbFqD99A4Yhfn3ogiqVBrBqSqe6MGKZKep/krwQwQgOWUVLbUf
         Yx/vA8WXVwMbCtrla20/+hG4VNUpGNV4Bp6JYO0GgBrB0Tfyo9Up56nq+4qCCZ+ONzig
         0fxUhI5FNrUdWxNZE2K7a0rl1aYmDJG8Wus/iSO/ulidvfYZj7NO4QxZEzXIWP2SBrSa
         B5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiCXqKrojM0XnOI4a0WFJ9VfZX7WIWfhQnpW+u7hzh2UQnUbcl3ZbzCDimtGkASclcGpI2d+QqezurdLKd@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7lxvwK1LHnPPAFAxWEC1U8SFuQ67d/UdhcKXuH7BLMvt+nbf
	KuyNsRcb7zNf4PO1vQfaLq33IrDU8TCUJoEPUWeFXmUL2wvtaWsYnb7IwkNquKh7YOslTRtYXZ8
	1DPjIQvjpWnrb8OrzsNXw3pxOn68D6SzCbM5T9c9vQQ==
X-Gm-Gg: ASbGncva2m4QWebsz6O2j4bsSJb38PDjvrGxy9eDI6abFlxdgO3uiopxwsbJ2HHP8Li
	R5sdRyDmis1Wu16Xneim5SYKs4PYmSwVMEWDbF2ipum628/2zqIsPtveY+sWxMzlwRnGKO9Zs23
	M1TE+8+sd01vL6jfHfpKUf+YGHxDRvTO9gwy9NAzU3dDeyfqyzsUFN9NG8x9JypGwfAIvBbUWms
	2u1Ts0AeJI341SN57rOB38ZV0d17GFIaJask/hMRFj3WqUcW85FXaHKk5w997lW188Tl+OmnxYb
	T81zjw==
X-Google-Smtp-Source: AGHT+IF6uxs1MOaBwYS98Bn0GzrW1q1f1zZrvVB4FXm2OpQgyMwELD0Ap/9eb3cd8DdR7+aYEeGYiDaYLG+JtqKO+og=
X-Received: by 2002:a05:600c:3541:b0:477:7991:5d1e with SMTP id
 5b1f17b1804b1-47904b24871mr180614205e9.25.1764367824947; Fri, 28 Nov 2025
 14:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127212943.24480-1-jonathan@marek.ca> <aSl48gV9laFb-MR1@linaro.org>
 <d969b3e6-a6e1-6dd3-45b9-539ba7a9f42d@marek.ca> <aSnH3C8s5xVSk_ti@linaro.org> <1aa75dd2-6fb4-e9ca-ca27-c0bd910246fe@marek.ca>
In-Reply-To: <1aa75dd2-6fb4-e9ca-ca27-c0bd910246fe@marek.ca>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 28 Nov 2025 22:10:14 +0000
X-Gm-Features: AWmQ_bmdJ03bV1nSh2BOH8_pHW0yfc-GdIlZ-CyzYJDmHBPZ0i6Mx6j9iK0lNgw
Message-ID: <CACr-zFBLC+dhM1Unv6iWaqg2H8DC2UbHQ_aQ9-am++MPUgg8ow@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Jonathan Marek <jonathan@marek.ca>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry to hijack this thread, but I've been carrying this patch to
workaround the buggy firmware from Stephan for my Lenovo T14s with
64gb RAM which seems to make Linux boot & work just fine with
systemd-boot.
Of course, it's a hack and not ready for upstream.

On another topic, perhaps we need to add this to
https://gitlab.com/Linaro/arm64-laptops/linux , what do you think
Stephan ?

Chris


commit 16e21600c6a65ace0c75b5a722e27ced8e1bfc48
Author: Stephan Gerhold <stephan.gerhold@linaro.org>
Date:   Thu Mar 6 17:41:15 2025 +0000

    HACK: efi-stub: Exclude 40-bit memory

diff --git a/drivers/firmware/efi/libstub/efi-stub.c
b/drivers/firmware/efi/libstub/efi-stub.c
index 874f63b4a383..355a9b2c0818 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -106,6 +106,17 @@ efi_status_t
efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 {
        char *cmdline __free(efi_pool) = NULL;
        efi_status_t status;
+       efi_physical_addr_t addr;
+       unsigned long pages;
+
+       addr = 0x0000008800000000;
+       pages = 0x800000000 / EFI_PAGE_SIZE;
+       status = efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
+                                                EFI_RESERVED_TYPE,
pages, &addr);
+       if (status != EFI_SUCCESS) {
+               efi_err("failed to reserve upper 32 GiB (40-bit memory)\n");
+               return EFI_OUT_OF_RESOURCES;
+       }

        /*
         * Get the command line from EFI, using the LOADED_IMAGE




Cheers!

Chris


On Fri, 28 Nov 2025 at 16:36, Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 11/28/25 11:03 AM, Stephan Gerhold wrote:
> > On Fri, Nov 28, 2025 at 09:39:52AM -0500, Jonathan Marek wrote:
> >> On 11/28/25 5:26 AM, Stephan Gerhold wrote:
>
> ...
>
> >>
> >> I am using EL2.
> >>
> >> Without this patch, DMA buffers allocated in the upper 36-bit physical range
> >> will try to use bounce buffers. The dma range from the dts is compared
> >> against the physical address, not the virtual address.
> >
> > I don't think this is the case for the dma-iommu layer. I debugged a
> > crash caused by USB in EL1 on a 64 GiB device earlier this year and it
> > was happily using buffers above the 36-bit physical range without using
> > bounce buffers. There is some code inside dma-iommu for using swiotlb,
> > but it's used only for "untrusted" PCI devices and some edge cases with
> > unaligned/small buffers.
> >
> >>
> >> The crash I see is display driver crashes/freezes once a buffer is allocated
> >> in the upper 36-bit range and it tries to use bounce buffers. This can
> >> happens very quickly under load.
> >>
> >
> > You could be right about the MSM display driver though, since that
> > bypasses dma-iommu and manages the IOMMU itself. I stared at the code a
> > bit and I'm not immediately seeing where it would end up calling into
> > swiotlb, but it might be hidden somewhere in the endless nesting.
> >
>
> Looks like you are right about this, MSM driver ends up going through
> dma_direct_map_phys(), which decides to use bounce buffers. I didn't try
> to see if other drivers end up using bounce buffers, but it would make
> sense that only MSM driver is affected.
>
> >> The same crash would happen for EL1 as well. I wasn't aware of the EL1
> >> broken firmware when I sent this patch, but instead of display freezing I
> >> guess the behavior would a hard reset now, which is a bit worse but still
> >> unusable unles display/gpu driver is disabled.
> >>
> >> This patch is correct and should be applied regardless of broken-firmware
> >> EL1 cases (where 64GB isn't usable anyway), but I guess the Fixes tag
> >> can/should be dropped.
> >>
> >
> > Please clarify the commit message a bit and mention the two separate use
> > cases (EL1 and EL2). I'll leave it up to Bjorn/Konrad to decide whether
> > to merge it. At the end you are right and using 64 GiB RAM in EL1 is
> > kind of a lost cause anyway.
> >
> > Thanks,
> > Stephan
> >
>


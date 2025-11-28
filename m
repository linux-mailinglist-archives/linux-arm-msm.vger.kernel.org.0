Return-Path: <linux-arm-msm+bounces-83808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A732C93449
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 23:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D55F14E1916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 22:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2062E718B;
	Fri, 28 Nov 2025 22:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bfv5DShB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363F2D4B68
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764369612; cv=none; b=PcwOhglOpao/AOe3+rueEqRy8vMhYVG+SspuZX5SFaf5pUcp2v4GEhrTPpQ9fAAZbnDF11qYi8HNisfURZyGL9OgbrU3UYl8qf6xriNt+sBTPRnGkx4/t1qmgqHl3l8g5G+/eI2cL91AcMrHKA/bJiV5RPPJOQmvNt4pKsXsE2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764369612; c=relaxed/simple;
	bh=lLMaAALAwokkRNzb+QxQNpkwxUSAaOwAx2Nki5+O79g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPX27KG/uueyISjIYqD2JrjoMvziKcxn+GkG2dbudUh85Ti7Czr2/w8zQ9kJxLkF59W/+z93NNYKh1vLVJdVnqqIIw0SGsEzG8ccq/022XI+X1vxaWuSHk5Im+T2pgoGXDwpS0lQv4BqItGcLcm5CKzj+YF5m5FBr+H8cdLrJ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bfv5DShB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1513393f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 14:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764369608; x=1764974408; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6L1rxnT1lGFdK5OtL+/z3juOthrXVF/aVpD3IHPNHSE=;
        b=bfv5DShBJI4ChLuHJ9fVcCYQnNcvgYsZ+TvGh+dQsPSPFo/EnG1T21XE/yMAeyqeuf
         ULxZOLZeB1JAp0phOpIGCRGsPVRPfvyTRMigIcbaN8uYH3B6voOjodj9bl6GZVSS6Wx+
         nUdQvZNaRSaSdCDsjebTg7pZCsUq5XM3mubxHFbbUbwDtASLUS+S0eoFgmMe+pAhex90
         C6y+wyZ2zuXBPam+gQoq13KkAeSZgAOv9dRFoMQ4QdZbU304aFbFDuWRl0M9irxtZTXR
         KCaFp7QD/c50defmwHVPDzxPvzEX3+8KrbpNaMsT/NiH1Z9LNCMY04E9fbHi+k2nF5hf
         nAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764369608; x=1764974408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L1rxnT1lGFdK5OtL+/z3juOthrXVF/aVpD3IHPNHSE=;
        b=tnxZNYIwKbFyr13ZpSMoqcOuvKPhdkd9j9lglDsAAfYVSLizmbSyLEdHTSaGkN2Bwg
         29acXNoyHVgyxcORVk+pEGb6AJilJQhaA38kb8ypmmQaroKrJOW2oSe+tyDSAZyN9ctZ
         gNQqy7wyz/yHBcLqebqVaiftyzgoynDnETbGpMQTBh8z7eoV7tvOa8/CfsG7Htu762DW
         P4sn+IePseEU/5Dq0U/yH/F0kXsPqAD2yGUSLl8HCc5qPdYqFDKMuuBdkto3kS1NRLTU
         89rXmYm0cYi7dU2fivOLggbjx+d/rL74f3Y4LFGoFdIUGctoPMiFuFSt2qn1bD+d5faH
         OtMg==
X-Forwarded-Encrypted: i=1; AJvYcCUI7/M9fGLEfGlENfO/l6JfCqYRYsJUjO7ZLPORMGjAI6M3t3025NT9zK/fUZP5W2DTwyitEoTqf84CKqHl@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXlGN31CTeZcrBzIg54T8Rxtd0x67uTPVUbHyoC2YAVG6++6q
	IMUZczvRTIOUxKj4aSYZgYYbWLYCIuiP1+M+fXFXR4cwKne6bFo0YZNqTIqXCPog7D9M0LGXbQQ
	6hxLI6FGHC5RDoF9XLpZr8lTx8TRBpgOzwe3cfAGfZw==
X-Gm-Gg: ASbGnctfQqLOScmkfBreTEViaK2odZO8sAfCOh2WUCqee9UUCV8LmWHUd8lrq3UyMqP
	eqhGVCmH/INSDTUvSLW9/Lzs3/m7s4xV2dkUK+A5yMQ9cT/4mm9Aipp2zWdsuqsqL8ix2gHkirG
	rHs4Q3x9h49sIkOiVEQ3bz9o0e5IX0JMd8vaGkva2JCBxr77Ox5VffcNT8AZk3iPAbQyy5XjTq9
	gqjuPEoTM71CiD7hhB1l6eq7R5HR+mRKWQGoOe5H67knvqx4gURLU1qkEbQYBV9khgeBr0daOR3
	ty+Ljw==
X-Google-Smtp-Source: AGHT+IEt+ksmw7El3aJXtR5LDjDzcr3X9xZfHkFA0jCLf4Ye0BQUNbwh5Tr084ShY2BtI34iw0CdwOjxeol9fHkyrTg=
X-Received: by 2002:a05:6000:2210:b0:42b:4961:eb4c with SMTP id
 ffacd0b85a97d-42e0f1d57f9mr18790748f8f.1.1764369608264; Fri, 28 Nov 2025
 14:40:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127212943.24480-1-jonathan@marek.ca> <aSl48gV9laFb-MR1@linaro.org>
 <d969b3e6-a6e1-6dd3-45b9-539ba7a9f42d@marek.ca> <aSnH3C8s5xVSk_ti@linaro.org>
 <1aa75dd2-6fb4-e9ca-ca27-c0bd910246fe@marek.ca> <CACr-zFBLC+dhM1Unv6iWaqg2H8DC2UbHQ_aQ9-am++MPUgg8ow@mail.gmail.com>
In-Reply-To: <CACr-zFBLC+dhM1Unv6iWaqg2H8DC2UbHQ_aQ9-am++MPUgg8ow@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 28 Nov 2025 22:39:57 +0000
X-Gm-Features: AWmQ_bmrhYkYqWFC9bLjLw5XfK2LqoBrgdnKpo0boaHhSDUFvFqYBSibwlwECkU
Message-ID: <CACr-zFAKSiMehGzQg3Teyw7eLdGz4_sCopj2_pGnKNO96z71uQ@mail.gmail.com>
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

On Fri, 28 Nov 2025 at 22:10, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi,
>
> Sorry to hijack this thread, but I've been carrying this patch to
> workaround the buggy firmware from Stephan for my Lenovo T14s with
> 64gb RAM which seems to make Linux boot & work just fine with
> systemd-boot.
> Of course, it's a hack and not ready for upstream.
>
> On another topic, perhaps we need to add this to
> https://gitlab.com/Linaro/arm64-laptops/linux , what do you think
> Stephan ?

Small update, I create an issue to track this bug:
https://gitlab.com/Linaro/arm64-laptops/linux/-/issues/23
and opened a merge request with Stephan's patch:
https://gitlab.com/Linaro/arm64-laptops/linux/-/merge_requests/1


Cheers!

Chris

>
> Chris
>
>
> commit 16e21600c6a65ace0c75b5a722e27ced8e1bfc48
> Author: Stephan Gerhold <stephan.gerhold@linaro.org>
> Date:   Thu Mar 6 17:41:15 2025 +0000
>
>     HACK: efi-stub: Exclude 40-bit memory
>
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c
> b/drivers/firmware/efi/libstub/efi-stub.c
> index 874f63b4a383..355a9b2c0818 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -106,6 +106,17 @@ efi_status_t
> efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
>  {
>         char *cmdline __free(efi_pool) = NULL;
>         efi_status_t status;
> +       efi_physical_addr_t addr;
> +       unsigned long pages;
> +
> +       addr = 0x0000008800000000;
> +       pages = 0x800000000 / EFI_PAGE_SIZE;
> +       status = efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
> +                                                EFI_RESERVED_TYPE,
> pages, &addr);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("failed to reserve upper 32 GiB (40-bit memory)\n");
> +               return EFI_OUT_OF_RESOURCES;
> +       }
>
>         /*
>          * Get the command line from EFI, using the LOADED_IMAGE
>
>
>
>
> Cheers!
>
> Chris
>
>
> On Fri, 28 Nov 2025 at 16:36, Jonathan Marek <jonathan@marek.ca> wrote:
> >
> > On 11/28/25 11:03 AM, Stephan Gerhold wrote:
> > > On Fri, Nov 28, 2025 at 09:39:52AM -0500, Jonathan Marek wrote:
> > >> On 11/28/25 5:26 AM, Stephan Gerhold wrote:
> >
> > ...
> >
> > >>
> > >> I am using EL2.
> > >>
> > >> Without this patch, DMA buffers allocated in the upper 36-bit physical range
> > >> will try to use bounce buffers. The dma range from the dts is compared
> > >> against the physical address, not the virtual address.
> > >
> > > I don't think this is the case for the dma-iommu layer. I debugged a
> > > crash caused by USB in EL1 on a 64 GiB device earlier this year and it
> > > was happily using buffers above the 36-bit physical range without using
> > > bounce buffers. There is some code inside dma-iommu for using swiotlb,
> > > but it's used only for "untrusted" PCI devices and some edge cases with
> > > unaligned/small buffers.
> > >
> > >>
> > >> The crash I see is display driver crashes/freezes once a buffer is allocated
> > >> in the upper 36-bit range and it tries to use bounce buffers. This can
> > >> happens very quickly under load.
> > >>
> > >
> > > You could be right about the MSM display driver though, since that
> > > bypasses dma-iommu and manages the IOMMU itself. I stared at the code a
> > > bit and I'm not immediately seeing where it would end up calling into
> > > swiotlb, but it might be hidden somewhere in the endless nesting.
> > >
> >
> > Looks like you are right about this, MSM driver ends up going through
> > dma_direct_map_phys(), which decides to use bounce buffers. I didn't try
> > to see if other drivers end up using bounce buffers, but it would make
> > sense that only MSM driver is affected.
> >
> > >> The same crash would happen for EL1 as well. I wasn't aware of the EL1
> > >> broken firmware when I sent this patch, but instead of display freezing I
> > >> guess the behavior would a hard reset now, which is a bit worse but still
> > >> unusable unles display/gpu driver is disabled.
> > >>
> > >> This patch is correct and should be applied regardless of broken-firmware
> > >> EL1 cases (where 64GB isn't usable anyway), but I guess the Fixes tag
> > >> can/should be dropped.
> > >>
> > >
> > > Please clarify the commit message a bit and mention the two separate use
> > > cases (EL1 and EL2). I'll leave it up to Bjorn/Konrad to decide whether
> > > to merge it. At the end you are right and using 64 GiB RAM in EL1 is
> > > kind of a lost cause anyway.
> > >
> > > Thanks,
> > > Stephan
> > >
> >


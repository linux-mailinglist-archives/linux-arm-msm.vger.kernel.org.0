Return-Path: <linux-arm-msm+bounces-51167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53959A5E05A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 16:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B08A189972E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 15:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902A12512C5;
	Wed, 12 Mar 2025 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/StN/63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367223E33F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793345; cv=none; b=BRIQRKbT2+bgoO0iv11A1QJMato9M4hegfLbctzo+rg3jBIjc5BgerGJEZwF3Au7cZUgUtjyeb3IVt7/kH7wj/9sJnPdKkGMIX17IWuB5B2eW96EF4RA1SrSRclkA8pB0oJb/uMdTBTiJzh7mv21qADQGjdkuDSSMV2CIzyD5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793345; c=relaxed/simple;
	bh=GoJGCdF3oDbA7eULlsGOHzFmKcP6ZxsGi3iStEDY0S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcBz/7ergBdYyhdHkifCWGIbcD0jFXqS5Vc2AJPXyzquI77ABWtXS8+ZPteortQIjzOkMDWKN5ggSw+2RVKeHtNuGqLogj1xFYwBUgXd6rLxzUpahAIjGRzpKQw4X15/Tw8ZeUqMh05qHSu4UKb7ftPB+2Gw0IVw588sI5pa5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/StN/63; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d129c1aso24569f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741793341; x=1742398141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GoJGCdF3oDbA7eULlsGOHzFmKcP6ZxsGi3iStEDY0S0=;
        b=n/StN/63iRmLBmt9TbIsWaswPCegG/w0wJsN0EH50oUQRfa5L12cs5lqX5Ti+Y/4d2
         elnTSIKV/RJQztLF4Bb+sv+Jlwyvi3EU9GDPdjqIzPqL2GFRZi/y8xb8UZmjpXSrZjtC
         d5tcZSKnqsCmHanudsGD3Pv4YJF36H58lW12rpdGTIICPWWH5u6/f5YZuPhtvR3XWnLE
         tvu/o4SpCm9zYZru4lbdNLwotI6CxLLUYuxAnEu6IcUy5GDazlpNvMW4x8UCnRrawE76
         oR1lq5DzDwvKNLAwQ+vaxRDNB2O2JR6TFz4xk2WPpbG/NM479WREe8VTCJ7GE6wrG3Eu
         OUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793341; x=1742398141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoJGCdF3oDbA7eULlsGOHzFmKcP6ZxsGi3iStEDY0S0=;
        b=wy/YCNHBowmohhsUvkr9O7hgT/7Vbosdle4PxLZzJCenbmGhn7IR2TbYS6VWb1IkSk
         VKs2bWhBSDiqGL0f0p0Eu1KaVqznQDD/V528db9o0JmSznqAo8IeZKKjKBtezgAPdg1N
         4p+63NYOMI55XnW3TWs+nnLnJJCsYyrB1rHYTCu8gVxpqgXE1amPD8WbupATxux0Q/8e
         /RTdTOQ90d1FQ3qVSwNsjIzGNsncVmJRJqxocF7P+osfS7PapVY6Fs+fkm8zNqhTqMw7
         Z3IoVCneX/4gdc2qadbOQzn+3XwBB+5hPeBUrmoUb4FzrNntZNQqa3o7YJ84I0eNhVxj
         dodQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+P9dhoLIaQD9avBsKbmfc3rGRZixqvnxPToQaEpkMXMhA6RxyG0XHWwCOCC0d9b7qU48GudXST9KDvFBg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47wTjfxU10KYQxJEsDVEGHzUGXBqMuhNAUH+HD4pxYNtQ3RL0
	gNQ3jmtigZBqbeNYKoNS7zE5xdBOmjlnc4OYvPtAAvCS4PW07sli0G1SW1WlF44LrFcLTnMh/x6
	XTNdtLttj4Zqoi7SSdJVFJo0iiAJrn1legtbnOHTZiqTXw9wUP/aaUfTc
X-Gm-Gg: ASbGncu03Jq3XZdNI1FTakRhmjgnynVIwbYgAfegi5WEkVMBEXSmBLNZOC49x/oB7zY
	c6aqE0EvEl+nx39Y0OcR/CNCte3AD3weIt5zxVxJm5Y0+3BTtlwBiQCJLPbmbOCzJ7/XtNUznEG
	WBSwWF7Bhg8CNcZI9UeTToPXqKl0E=
X-Google-Smtp-Source: AGHT+IGw4bTsCNZeyHyE2bBo2kT2RvE7wgPFf4FL+k+G4SRUq7UKiAhEDf/H5m1+yHQGeBMie4MSyvCDJCGtPn4RUIg=
X-Received: by 2002:a05:6000:1448:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-395633b59e0mr126422f8f.0.1741793340830; Wed, 12 Mar 2025
 08:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
 <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org> <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
 <5ecb69c9-c877-4c91-a1ae-0ef59d0ee3d6@kernel.org>
In-Reply-To: <5ecb69c9-c877-4c91-a1ae-0ef59d0ee3d6@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 12 Mar 2025 16:28:49 +0100
X-Gm-Features: AQ5f1JrsTOrUVQk8MQpv1Smb_EIlMCLrXov_OVBk2xwC6hUgiuoRDMUNqMw387s
Message-ID: <CACr-zFAMa3Awx16avbXNMRhkELFkEZedZfHVCFuFc4fitWFL4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Mar 2025 at 12:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/03/2025 12:10, Christopher Obbard wrote:
> > Hi Krzysztof,
> >
> > On Wed, 12 Mar 2025 at 09:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 11/03/2025 20:15, Christopher Obbard wrote:
> >>> Hi Dmitry,
> >>>
> >>> On Tue, 11 Mar 2025 at 19:58, Dmitry Baryshkov <lumag@kernel.org> wrote:
> >>>>
> >>>> On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> >>>>> I sent this patch to start the discussion, some things I found:
> >>>>>
> >>>>> 1) Some interconnects are missing from arm defconfig. Should they be =y too ?
> >>>>
> >>>> No, unless those are required for the UART console.
> >>>
> >>> OK, that makes sense. FWIW the cryptic (to me, at least) commit log on
> >>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eee808134ecf1c1093ff1ddfc056dc5e469d0c3
> >>> made me think that the interconnects should be built-in on all devices.
> >>>
> >>> Of course, the real problem here is RB3gen2 not actually finding the
> >>> UFS/eMMC device due to no interconnect driver.
> >>> Until now, I have been building that into the kernel. I will
> >>> investigate instead shoving into the initrd (in both debian and
> >>> fedora) which should solve my issue and render this patchset useless.
> >>
> >> For Qualcomm platforms you are expected to always have initramfs, thus
> >> you will have the modules for UFS/eMMC mounts. I don't understand the
> >> problem which you were trying to solve.
> >>
> >> The interconnects were built in *only* because of need for serial
> >> console. Only.
> >
> > Thanks for confirming. It is all clear now.
> >
> > Consider this patch dropped from my side.
> >
> > For reference, I am working on updating initramfs generation tools in
> > Debian/Fedora to include the required interconnect modules. Currently
> > the interconnect drivers are built as modules in these distros, but
> > are not included in the initrd. That is where my confusion initially
> > stemmed from.
>
> Sure. This defconfig is anyway for us - developers, not for the distros
> to use directly. Distros have much bigger configs and use almost
> everything as module.

Completely agree - my usual workflow is to build with the kernel's
defconfig (disto config is generally huge) and install the resulting
kernel into my Debian image.

Installing a kernel built with `make bindeb-pkg` then calls
update-initramfs to create the initrd - which then should pack the
RIGHT modules needed for loading storage/network boot/etc into the
initrd. In this case it simply didn't yet copy that module into the
initrd in Debian, so I will sort it out in the distro space ;-).

We can likely stop this discussion now as it's clear to everyone
what's going on I think.

Thanks,

Chris


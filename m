Return-Path: <linux-arm-msm+bounces-51132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E0A5DB17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69487174E89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032F91E3DDE;
	Wed, 12 Mar 2025 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJA813z+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B223E352
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777871; cv=none; b=uCuQR0uHiglJsmEz+u1dR5qrWwcPhodYRYgGXl0N+PdtOfF49OMzGnB4qpiw4MoDO+5QNfBEVcTXbPK6Mm9yxwQ0Dyr5kMdngUszPz7E9xnX+yn5pR9daOJMAgWuiz6TBWNvllODJNkFqGgFsy/xomuOBRH31ev0j7QPhFsDDNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777871; c=relaxed/simple;
	bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyBU1BLaA8zWz0sA15Zh6Zm9XSEYdZbU/O1LhXjqCMMYz15B1BIf7jRFtDDAWvqo0r0kPFPjVjEMa9tsgNd5cjiXTToqAYvneDweQM3MEjjltTlu/56L7tUNeM0KdNCx/oGqbUiALsJzgc4hRrcz+ZTI+sraxD9tzm2JWYopCes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJA813z+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1775501f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741777868; x=1742382668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=;
        b=LJA813z+bVLQWkxXLlPCR61YB+rKoq5/GfVXTPgpofVgh1OF9WsEDxsxDcooXCH5JL
         UBaZsH7P5eG8PIUaqVae30fG9hv0q+VDHXw2VC8Hm7RaYsoSizbDdp1qEO3+GgVbOS4W
         V8VYTPOX1D/YDce/x/8SKl9uGCER2LimsFq0Z7Gcf+q3j9T+jdSc9EyMnZVoKY65v9Cz
         dbG1cfjs5+Hg6Pjrnz01IwXLsnBATCGCLgXIjMorE/dRCW4w3TP+O7IGk1taR0pGiBMB
         iEwMdpa3EABWYezZ/UNOBohCkx8kcqiGz+jxypkOjJ7TJ0iXuhf3duoMvf22PQ8Vzc4O
         2rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741777868; x=1742382668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=;
        b=XuHoYVPty9rN85BO88z1aNEKz0tbxasqgoDiV47FWybVfxc0qyashMe1hX54j3Wz7/
         xH9WVZ1sVHSM3+5GKdWNdw9cA8ZZXebKH6rnwFkWUsw10tonIXzMxWc83FavdAgJcogR
         65e/8QnSc8kdScZ+nR0b2nJWnZM2WBSvABHR74UPiUjAQstElD0IBSYu91mrfY/wpqs/
         KULdF3gZXt1JshUH1U9/bYFWuWv4GEeBWWbiY5Tm5VrAMLCgWXk0JnaO7AqvpkZkSdLT
         8O3OcKOpTqUvs1sp/zw3Dt2uRlgcF53LzuMG51H1xAKa8qaZsK7zOF11ymPOyZzSW1WA
         BKIA==
X-Forwarded-Encrypted: i=1; AJvYcCWGF+lq19L0YcAVJpO7ignHb3FOalwM5mK1iYk+OR/x0cnBHEH7P8Vfm63xoQWjaDiKNXWkDR0f7KoVv/7w@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhd3yoC/cObNZndWNlwYlkQSys9PxMm6+VgCVPiK2yTj2XTiz8
	/z5BTmMTTp2zAZk5Gl+SIJxrvvl3bkgCPj7GrWYbSery2F5YfYi6zDqym/An4zzvkXAZgfQY97u
	GAdKEmC3puZR0phoiA7SdyPvhSh8BHsDSxREvwQ==
X-Gm-Gg: ASbGncszgv8XOE80nJtbdcxN0U6quVXVhDswBxYeEF6dpsCEseeFNXqFtCENbslDJl/
	TvKaBdmew4V1itGLZAoPeO0WxT9hg0iQhtryLoEJY9AKZ5slGtwlcEGlC/he7W5cMtvf4bCYcvN
	fOZmGfWVEroOyKVipdWlg4Ght5nkA=
X-Google-Smtp-Source: AGHT+IGQqsMzLL1SkIH3EVJhaanHHGJ9uStzi43oBMlQa1DqbbQl8c3C+QW090TXdgpNQcCnk5YClrhuASylQsAX/Pk=
X-Received: by 2002:a05:6000:1867:b0:391:253b:405d with SMTP id
 ffacd0b85a97d-39132d98a1emr17304676f8f.41.1741777868403; Wed, 12 Mar 2025
 04:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com> <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org>
In-Reply-To: <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 12 Mar 2025 12:10:56 +0100
X-Gm-Features: AQ5f1Jr_LcQ_zc_s53yVw1h2DAzbGYxZX7Ayfg2dMTJBpBQw3CievHU4tKHPOpw
Message-ID: <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Mar 2025 at 09:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/03/2025 20:15, Christopher Obbard wrote:
> > Hi Dmitry,
> >
> > On Tue, 11 Mar 2025 at 19:58, Dmitry Baryshkov <lumag@kernel.org> wrote:
> >>
> >> On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> >>> I sent this patch to start the discussion, some things I found:
> >>>
> >>> 1) Some interconnects are missing from arm defconfig. Should they be =y too ?
> >>
> >> No, unless those are required for the UART console.
> >
> > OK, that makes sense. FWIW the cryptic (to me, at least) commit log on
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eee808134ecf1c1093ff1ddfc056dc5e469d0c3
> > made me think that the interconnects should be built-in on all devices.
> >
> > Of course, the real problem here is RB3gen2 not actually finding the
> > UFS/eMMC device due to no interconnect driver.
> > Until now, I have been building that into the kernel. I will
> > investigate instead shoving into the initrd (in both debian and
> > fedora) which should solve my issue and render this patchset useless.
>
> For Qualcomm platforms you are expected to always have initramfs, thus
> you will have the modules for UFS/eMMC mounts. I don't understand the
> problem which you were trying to solve.
>
> The interconnects were built in *only* because of need for serial
> console. Only.

Thanks for confirming. It is all clear now.

Consider this patch dropped from my side.

For reference, I am working on updating initramfs generation tools in
Debian/Fedora to include the required interconnect modules. Currently
the interconnect drivers are built as modules in these distros, but
are not included in the initrd. That is where my confusion initially
stemmed from.

Thanks,

Chris


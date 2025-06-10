Return-Path: <linux-arm-msm+bounces-60706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1142AD2C53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 05:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648431892C2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 03:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAAA25D204;
	Tue, 10 Jun 2025 03:53:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB811712;
	Tue, 10 Jun 2025 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527585; cv=none; b=hvluul7jwDipk1VuLXeadU/QIAuMxvSRukCZ9N8piIGG9aAiHaoqdvoMhPSige8LPmIn87uh3gBRqwBfn296EfqB5vSR+mgO+VBhOUKYdBSTICAGm/dmdWp4ZrdlTDqxYSmTg2nuCbqPj+HNJ0zCEnptdfyH9k1wy7LIcgU4THc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527585; c=relaxed/simple;
	bh=SuVp9AFmt8gLD64j4a+SRLxEwyPAPmST5oVeKyyVGVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dr+17gViv/G3wrJCZeqh9AV9Xk5h1zZ9drqhlzuFey/seFcpT3+MkFNIu6O5oui2pWUHAwB7ZPG7jYXbsWfT017/Zj2rOPxREYQnlpGpxU3q5/wkUDJgpNdanFSUlu1pPxM6WmN+4WFl7F+FPu0y3ZI35gZALur86Ic3U3ir0hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5208945e87.2;
        Mon, 09 Jun 2025 20:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527581; x=1750132381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZk/7/4MvcJfckdyvA+r+JfqYVWkeTH5dDDkcVRzYjI=;
        b=KhhcGJSgZ5PvBScI9Ax7F48s/ybhfF6fvS3bqrzPZIfjD2jlT25mfIRFJguj1ea57r
         BpCHH7wJ4BVRD3wrCfN0IlcmrZ6pTX3XIy5FMgkXJjXkvBXMRnV2NNlYKMJnPjHCtpMA
         o0Et7UbgXc6pxENvjOOh8dku+B5AR605THKkY49sd8XiTkzBMQOycS+Z+rJp3Y6xHt3L
         6jovsTxbaksrNBUMcaA9FG++WFG8fRd4xd/Mb0U75xEiEEWg0sN2EhSkKjPiEE2EMBTQ
         X52Ya4NhXFPcmHtKO5gIbPrvokRcfrnr0UF/wJchxIAhpIgfr2EwHOizANJTyLmRXQNp
         qp4g==
X-Forwarded-Encrypted: i=1; AJvYcCU9/FJZuFGLfbbkg2vIw/reXkvkPO3h/aVc/2KrGu1birjDnxfXqyWueS4YKM5JvSKLtCSZ1i3fxo8Miw==@vger.kernel.org, AJvYcCW+HqwT+OTsKkEaAbslDnRJlz+bI1nYph23aDy2We5ct8VE7uRDFoQ8LoluDNoM+uOFBsoW+10WF9OltUex@vger.kernel.org, AJvYcCWi4iwzU36BvEhRSLupeTZIoEbdT3vFrOYqmalnuhnayrajAi4VSApwpjzKEXpDwq+aLj4/RnU3M7nfJPk=@vger.kernel.org, AJvYcCX0CGgMmXMNb+LMul6MbVbHRd0HjuSJtZsbVq3/NodqAYA0oIJ0l+F4QPg/XcAI9w1TKIVIEUl6ud0ZRh6rSB/6Yoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiTg3S2Tv/ybAu+aUHISgZT2q8gboVBjzpA652HqMd1DUO2//
	clugsNf8vljHdgnOP1JLko4xnwSzIJ35JGf+dKsSUaUswXVKFlZlVeHdCtEbe8a0rPQRxQ==
X-Gm-Gg: ASbGncsCsD9uxztsGJe732e3OLpJgthnZLEjJlUclnNs6jheoe/ubbz3IEq3PALu11Q
	mt/7dwjHU7NvEgPf+3bqVn0rb8wG+tPHbGoyYq4vUPHIgqJHb9oeLUKkkALyidBDW4sLkF28U8N
	qva5arm79zRaiKIr6pFr7/84fgw+4aJH3suIErADceo6HN+s6xdfjmwprVuceqm7NBtV0ojCHWq
	d77XguqkppbonIZhbBgd9G18rufdjMsnmsTcHlIHIZQPmZjkkbCV1mUxlOxDjc0GfugV1oWc3Rq
	AirPOC6UyeFJG0qfsuVc9ilWjqKlC8a/mcqCARydXEjk3J8Qp2DaMrBl9Tz6j9kZnNtfkgd9RXz
	8BpQq/B92y1UDPr2tjc3XDRx+9g==
X-Google-Smtp-Source: AGHT+IEjqIl/G//+0L2PG04SCS4x7CxnAtsVII5K2shRbeMMFO+P5s1IyWnobe6Hdd+bWTuBmFu+IA==
X-Received: by 2002:a05:651c:1508:b0:32a:7a12:9286 with SMTP id 38308e7fff4ca-32adfd366d6mr36284881fa.31.1749527581287;
        Mon, 09 Jun 2025 20:53:01 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d03507sm13378511fa.113.2025.06.09.20.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 20:53:01 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e98f73850so5370718e87.1;
        Mon, 09 Jun 2025 20:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOTsd/Kq0p5rPpjxHBGg3JsQ/kWwn6lIfNotPtyxU7ZshUtqLLmXmJIeRPEr17cIomF0meIkrPHVt1GA==@vger.kernel.org, AJvYcCUrr+gkm9kJ7C3W1pcMkrqFUjJuzlNGbPvXRg4Q9t1BVMpG4x3Wwv70gDO4YvPfaRo6iilKddHd31m62FuQ@vger.kernel.org, AJvYcCVeTQhlzr0mPNb4h7V4eHKQBbWVmeBKCncIyPwK666cavh0e0zMFoCWLWcqawY8JXKvYXIOPtkUXM70yDeIY7gno6M=@vger.kernel.org, AJvYcCVnxFLxzQUkwzcHO0uyFV7YzNcnccwzaz835xx5W7FnOPPPS/RQSRZhzDaPmyAcgO4dFZ6GLEPHurVaTY4=@vger.kernel.org
X-Received: by 2002:a2e:b693:0:b0:32a:ddd2:208e with SMTP id
 38308e7fff4ca-32adfc06f41mr30364041fa.9.1749527274652; Mon, 09 Jun 2025
 20:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com> <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Jun 2025 11:47:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v672aLfjX2_+=gnYEt09Z2m+sDoUi-weN2VsgtqnrK_fDw@mail.gmail.com>
X-Gm-Features: AX0GCFvT3cfnNTYictCtJSVKUrXJH3fCgSrvu85ggYc6KyathRV-zklZHWwYSnM
Message-ID: <CAGb2v672aLfjX2_+=gnYEt09Z2m+sDoUi-weN2VsgtqnrK_fDw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple drivers
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Woodhouse <dwmw2@infradead.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, Janne Grunau <j@jannau.net>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, 
	Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:41=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> These drivers just have a constant value for their page size, move it
> into their domain_alloc_paging function before setting up the geometry.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c   | 3 ++-
>  drivers/iommu/ipmmu-vmsa.c     | 4 ++--
>  drivers/iommu/mtk_iommu_v1.c   | 3 ++-
>  drivers/iommu/omap-iommu.c     | 3 ++-
>  drivers/iommu/rockchip-iommu.c | 3 ++-
>  drivers/iommu/s390-iommu.c     | 2 +-
>  drivers/iommu/sprd-iommu.c     | 3 ++-
>  drivers/iommu/sun50i-iommu.c   | 3 ++-

Acked-by: Chen-Yu Tsai <wens@csie.org> # sun50i-iommu.c


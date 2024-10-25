Return-Path: <linux-arm-msm+bounces-35794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E59AF98B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AE382834CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1766218DF97;
	Fri, 25 Oct 2024 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJtZYu3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6118A6DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836469; cv=none; b=DKPKoe0PzKWcBifNnUw9DOJlfgHVnG6l9g6U8Bns9n27kO8EagnALTT9ct+PcJNmzxrRV/5qNDEAaFUNpPTh9wMBs63a8oIF5l91QcY1bWGTeDmEe6gR9GIJ+nAGytLZUIKk0fY42tTwGB9RA68FD1DrecuM5IwUSxU5WmVwslE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836469; c=relaxed/simple;
	bh=7523xMi56jFn2BFaJmqh9zJ8aNB35qcZ1U+TUU/Ixxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7jKoqN8MItaaTEfnmdYoebwBLM5D7GzcjytEN9mAnoDO1iltCFoNfQwz+dGFsOKlZYYAJdvNj3fQal5Lr2nyP6DPAk0rnq1qXxADPPoxf8bB4xxyrriwX70d1SQVIzSXlKDmEJXuDpjCyYONJcbLVDBfz/x4vh/q3JvVpPdMa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJtZYu3j; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2003124e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836464; x=1730441264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TTCFyQf3Xe7NvImgZ2XWniLlI9X6CvRNK0VpqeIrXvg=;
        b=jJtZYu3jj/oad2hwXSmcWsrKwwBB6If832uqiDdvFZvhlXQYOrake/qY5nYLp4OIz8
         FlfnPXCpoWNGe0uZGMbmPqn++sXqTlS+Fap1EgkyqHeZSSleXah3iNKwXVho8bTv1g9b
         q6lOGlhqUnNDuT+i6DdlrEsXWGuWdBYhr/bdcWuHdM7jjvoNUijZJ3WTu8SFSoKU+8RN
         4q/Y6cqdbwU+wUQoCkFFpmjBKC6Gc+DeD3V/Kko0lZRvExOmC+QosQDtaOHE4CTTHQF9
         LFdyVbf26g/V+S5NhimcY+6IjTqyuLCe5iHcnq7nvSSgUoKZaYdxSf6q1LqWK+sGLjYd
         mZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836464; x=1730441264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTCFyQf3Xe7NvImgZ2XWniLlI9X6CvRNK0VpqeIrXvg=;
        b=YCpxMnQfUKUG0DLejEJE9fBQ0Pcriwbvahh67sKUCTzi1uuGsZquoi9HPHvnRqYqOw
         Y53dFdY7QDkJBQ/X5B0o96ys7r1v9laVpguY294hNa+1pJqDSzHrRIb3SyMR41sb7fQY
         09Kt8DrTykHLZy/QOPGZTo53nX3OXBXyU+drXliHnRHIagdedwispNaEzQMk7+O4wC4K
         dFzTy+BcqGwgJeNtywGCMGW949A/TMIx5pm1DpU/gZDHYAM0ErU5CMA2LIMnT4bq3yzD
         ogoWYUkJubt2AHjyHp2X9I4TGNIMgfm8p3Vj1mvJcWJlIymsavRriTykEJYRfkCTzxEi
         H6qA==
X-Forwarded-Encrypted: i=1; AJvYcCV80DLFqczdiYXE1+re/hmHSg0yP1vtSpEI4/d37+/oa31y9KJjDGzIqLQQfZ1b1L75x+ye0Rt3mcQZpeg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/VRBywvugG7VIvfs0CJZBbpyXGxdjjAmCy1iwtjS1Np0ewFB
	Kx9mOg6xjIrkoGywSOOUYGJslv9UJ9LwBaYa5RcGiMj5/aL6E8eYZBqZk7aj6LQ=
X-Google-Smtp-Source: AGHT+IGoSzH+71TKq9OlvnAlJbA6h7i+EdllRvot6u7Yic8iRLuolkjIdgdyHtVtXSMJzI4PruXv0w==
X-Received: by 2002:a05:6512:1083:b0:539:de03:d7a7 with SMTP id 2adb3069b0e04-53b1a3030fdmr5293565e87.22.1729836464479;
        Thu, 24 Oct 2024 23:07:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10c177sm64695e87.58.2024.10.24.23.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:07:43 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:07:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com, 
	kernel@quicinc.com
Subject: Re: [PATCH 1/1] mmc: sdhci-msm: Toggle the FIFO write clock after
 ungate
Message-ID: <v5lym7auj74tpsa75qsfpl2i6sq4xkqeapi4vu5i47ytw6mrek@ktvw6kpxnxwv>
References: <20241022111025.25157-1-quic_rampraka@quicinc.com>
 <CAPDyKFr8EhLU8EhydypLwL_PZH0+KMTqAU_D7AFdNmRac5R=vg@mail.gmail.com>
 <ec15e7d2-ed18-b2fe-37a1-9609c5c91d1a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec15e7d2-ed18-b2fe-37a1-9609c5c91d1a@quicinc.com>

On Fri, Oct 25, 2024 at 07:04:37AM +0530, Ram Prakash Gupta wrote:
> 
> 
> On 10/22/2024 6:15 PM, Ulf Hansson wrote:
> > On Tue, 22 Oct 2024 at 13:10, Ram Prakash Gupta
> > <quic_rampraka@quicinc.com> wrote:
> > > 
> > > For Qualcomm SoCs with sdcc minor version 6B and more, command path
> > > state machine is getting corrupted post clock ungate which is leading
> > > to software timeout.

Affected platforms are ...

> > > 
> > > Toggle the write fifo clock to reset the async fifo to fix this issue.
> > > 
> > > Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > 
> > Seems like we should add a stable tag, but do we have a fixes tag that
> > we can use too?
> > 
> > Kind regards
> > Uffe
> > 
> 
> No, we don't have fixes tag for this as this is not dependent on any
> software version. And there is no way to map minor version with stable
> tag also here, I guess. But I agree this needs stable tag, if you have
> any suggestion to find right stable tag, we can add.

In the least case you can add Fixes tag pointing to the first affected
hardware being added to the DT schema. As for the stable tag, I think,
Uffe has been asking for Cc:stable in adddition to Fixes.

> 
> Thanks
> Ram
> 
> > > ---
> > >   drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 41 insertions(+)
> > > 
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index e113b99a3eab..c2ccdac21232 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -146,6 +146,7 @@
> > >   /* CQHCI vendor specific registers */
> > >   #define CQHCI_VENDOR_CFG1      0xA00
> > >   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
> > > +#define RCLK_TOGGLE BIT(1)
> > > 
> > >   struct sdhci_msm_offset {
> > >          u32 core_hc_mode;
> > > @@ -290,6 +291,7 @@ struct sdhci_msm_host {
> > >          u32 dll_config;
> > >          u32 ddr_config;
> > >          bool vqmmc_enabled;
> > > +       bool toggle_fifo_clk;
> > >   };
> > > 
> > >   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> > > @@ -1162,6 +1164,39 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
> > >          return ret;
> > >   }
> > > 
> > > +/*
> > > + * After MCLK ugating, toggle the FIFO write clock to get
> > > + * the FIFO pointers and flags to valid state.
> > > + */
> > > +static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
> > > +{
> > > +       u32 config;
> > > +       struct mmc_ios ios = host->mmc->ios;
> > > +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +       const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > > +
> > > +       if ((msm_host->tuning_done || ios.enhanced_strobe) &&
> > > +               host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
> > > +               /*
> > > +                * Select MCLK as DLL input clock.
> > > +                */
> > > +               config = readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3);
> > > +               config |= RCLK_TOGGLE;
> > > +               writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
> > > +
> > > +               /* ensure above write as toggling same bit quickly */
> > > +               wmb();
> > > +               udelay(2);
> > > +
> > > +               /*
> > > +                * Select RCLK as DLL input clock
> > > +                */
> > > +               config &= ~RCLK_TOGGLE;
> > > +               writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
> > > +       }
> > > +}
> > > +
> > >   static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
> > >   {
> > >          const struct sdhci_msm_offset *msm_offset = sdhci_priv_msm_offset(host);
> > > @@ -2587,6 +2622,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >          if (core_major == 1 && core_minor >= 0x71)
> > >                  msm_host->uses_tassadar_dll = true;
> > > 
> > > +       if (core_major == 1 && core_minor >= 0x6B)

lowercase hex, please.

> > > +               msm_host->toggle_fifo_clk = true;
> > > +
> > >          ret = sdhci_msm_register_vreg(msm_host);
> > >          if (ret)
> > >                  goto clk_disable;
> > > @@ -2720,6 +2758,9 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
> > >                                         msm_host->bulk_clks);
> > >          if (ret)
> > >                  return ret;
> > > +
> > > +       if (msm_host->toggle_fifo_clk)
> > > +               sdhci_msm_toggle_fifo_write_clk(host);
> > >          /*
> > >           * Whenever core-clock is gated dynamically, it's needed to
> > >           * restore the SDR DLL settings when the clock is ungated.
> > > --
> > > 2.17.1
> > > 

-- 
With best wishes
Dmitry


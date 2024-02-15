Return-Path: <linux-arm-msm+bounces-11189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D971F856473
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 14:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09B2E1C22CBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 13:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C3A130E3E;
	Thu, 15 Feb 2024 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e2nnmTpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8AD130AEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708003933; cv=none; b=QPNTtijywoE7XRlzgfDfMi4e1D6eCL77X025wAUgaxOzZ2DMr+xCMOblcyEn009twmPUHO6kOLhpxXEbwWbTjceH079FPv4EuPjMD2ZLz3hZdVcyBwczYNCtTko0gb0GeyCiETX18dFVBVChZmcw37sirFYfl7UwHUjXq5XEBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708003933; c=relaxed/simple;
	bh=m8hYdh+/UVrqtVPhk6AGLID+nWtFtpRf/uvN+uMW/6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW2bASTxF5Y3t1rGia+JQzbe+PYsXLzHQ7htrlrNYQfnM0fO2A7Nm8iQuBFDwCLLdABaK1e4uTD+4AC4Knzg07oeYO4IRuKJ7enagiaHirbXhLhX80ILpzPbBZQP66NJPXCYCDsSzopSwEPUl6inD0pEg8HITOgAARFBIc47cB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e2nnmTpY; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5610cc8cc1aso959120a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708003930; x=1708608730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itPC4yjw+MZTTzalNg7Ob1FeA2iLjpKFIQ9B9VJV75g=;
        b=e2nnmTpYpaMea6mnpaWIiXu5yIg1UrDGSKXkeRzKMDt4SsnMlgMgaDWhNt9bIq77m5
         OC32/A6KKguXvLbuatMyWRD3CSyImw7RGsxYiVKuK/w/H1Ffs4pXdKdEEFxx8PDTCTuo
         624Y6m9uGHmwfBxfMe45Bz1K+VoakhATvQjg6RlkebMZH2XSp680OyYpqNCwBcECd9BB
         LK2noxnvwLyH7SSupf3YvVZaCT5fwmMEFYmftZT5R7LNhzd9YbpqmV4gtsoukchq6z5E
         c3oZw2xU0johSl178KKpnmqdj6zUvBMyfatigK97RAsPV4RpVSFGUjHT5GOgBk2yoWzX
         HJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708003930; x=1708608730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itPC4yjw+MZTTzalNg7Ob1FeA2iLjpKFIQ9B9VJV75g=;
        b=E7ySw1u8ptWb51Qgycyc3rvwce3plnPbHc2xnnNSZb+KZK6IeQIKNY9P/QyxeJfjc9
         Ejsa3SlA42TEUT/6wdS/0P7n/Osi3ejVY/91gPR+f1r8Tus2JgsQxbuEiQPOOgYJ9a4V
         Zj07LYyu3ddX4idaLBfb6t6qoQkZ8/qSeRB+RKm/nvueNrw0KWA+H8KCjB/zE212w0x7
         Ip6xt7B37AF5YghcaeSaI10OxausuQq79pVuzxunoe3KFK32zJlF7P5rLjIm0KyXx782
         5iOjv/XZIcr+/nbXD2MzjsPUGOeHq713aE+8WZgXPO0Zh3oScPbeEn2cisifObFXTUg3
         RfLw==
X-Forwarded-Encrypted: i=1; AJvYcCWk5pDJHx0amEGtkwNbAamMs0LXG0dVFXpNWHiMDSySfOm9XfSp8Z00PrUAxfLS1LpvmS5/5bcn/jpBb5MTqAmMk/PSE7filSAUaaZ4ng==
X-Gm-Message-State: AOJu0Yz0RH/zN+QB/b2zR3iH8l24FTlrx2C5+V+fc00GC7meBiGKnhRu
	7AT+0JSDzmQakk7WvH3XrjSfvNMJSy7/FkSnbQ7dcigFhplvmpL10pOv/6IK+YY=
X-Google-Smtp-Source: AGHT+IE7pGrmIuos0u7FslcOP5vVFjySkiA6nt4+X/E67cQyceQ3AtGt6cC5RO+cNGVYo8uyVRvA8w==
X-Received: by 2002:a05:6402:287:b0:561:4238:e6d3 with SMTP id l7-20020a056402028700b005614238e6d3mr1513003edv.2.1708003930158;
        Thu, 15 Feb 2024 05:32:10 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id p3-20020a05640243c300b00563c22abac2sm228295edc.61.2024.02.15.05.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 05:32:09 -0800 (PST)
Date: Thu, 15 Feb 2024 15:32:08 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
Message-ID: <Zc4SWIViTS0uf952@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
 <Zc0yXR/fC2OcObLB@linaro.org>
 <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com>

On 24-02-15 11:30:23, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 23:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-02-14 22:18:33, Konrad Dybcio wrote:
> > > On 14.02.2024 22:13, Abel Vesa wrote:
> > > > Rather than setting up the core, obsrv and chnls in probe by using
> > > > version specific conditionals, add a dedicated "get_core_resources"
> > > > version specific op and move the acquiring in there.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> > > >  1 file changed, 78 insertions(+), 33 deletions(-)
> > > >
> > > > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > > > index 23939c0d225f..489556467a4c 100644
> > > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> > > >   */
> > > >  struct pmic_arb_ver_ops {
> > > >     const char *ver_str;
> > > > +   int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> > > >     int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> > > >     int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> > > >     /* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > > > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > > >     return 0;
> > > >  }
> > > >
> > > > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > > > +                                     void __iomem *core)
> > > > +{
> > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > +
> > > > +   pmic_arb->wr_base = core;
> > > > +   pmic_arb->rd_base = core;
> > > > +
> > > > +   pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > > >  {
> > > >     u32 *mapping_table;
> > > > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> > > >     return apid;
> > > >  }
> > > >
> > > > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > > > +{
> > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > +   struct device *dev = &pdev->dev;
> > > > +   struct resource *res;
> > > > +
> > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > >
> > > It's no longer indented to deep, no need to keep such aggressive wrapping
> > >
> >
> > The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> > pmic_arb_get_core_resources_v2
> > pmic_arb_get_core_resources_v7
> >
> > > > +                                      "obsrvr");
> > > > +   pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > > > +                                    resource_size(res));
> > > > +   if (IS_ERR(pmic_arb->rd_base))
> > > > +           return PTR_ERR(pmic_arb->rd_base);
> > > > +
> > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > +                                      "chnls");
> > > > +   pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > > > +                                    resource_size(res));
> > > > +   if (IS_ERR(pmic_arb->wr_base))
> > > > +           return PTR_ERR(pmic_arb->wr_base);
> > >
> > > Could probably make it "devm_platform_get_and_ioremap_resource "
> >
> > The reason this needs to stay as is is because of reason explained by
> > the following comment found in probe:
> >
> > /*
> >  * Please don't replace this with devm_platform_ioremap_resource() or
> >  * devm_ioremap_resource().  These both result in a call to
> >  * devm_request_mem_region() which prevents multiple mappings of this
> >  * register address range.  SoCs with PMIC arbiter v7 may define two
> >  * arbiter devices, for the two physical SPMI interfaces, which  share
> >  * some register address ranges (i.e. "core", "obsrvr", and "chnls").
> >  * Ensure that both devices probe successfully by calling devm_ioremap()
> >  * which does not result in a devm_request_mem_region() call.
> >  */
> >
> > Even though, AFAICT, there is no platform that adds a second node for
> > the second bus, currently, in mainline, we should probably allow the
> > "legacy" approach to still work.
> 
> If there were no DT files which used two SPMI devices, I think we
> should drop this comment and use existing helpers. We must keep
> compatibility with the existing DTs, not with the _possible_ device
> trees.

Sure.

Should I drop the qcom,bus-id from the driver as well? It is optional
after all.

> 
> >
> > >
> > > Konrad
> 
> 
> 
> -- 
> With best wishes
> Dmitry


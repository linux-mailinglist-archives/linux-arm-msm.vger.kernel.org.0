Return-Path: <linux-arm-msm+bounces-11163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C5855E25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5D481C21157
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343E91B807;
	Thu, 15 Feb 2024 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDcjdr+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868661B7EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989437; cv=none; b=AINO0nxuBb/IJyQktojCrjbhUmQmoTgL/9WtOLYMtwiJWLqbrsUyo3t0a9hd2reXn3/+ByN+qUmuC9/uA2NzEMyrkFZwtvJ0FwjFKGXYDcnM/WYogb94O9r4jWOPsbrzX6iE1bFK2RZ4iIx7ZjXvqenjD4lf62rK2J9vjc+8HzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989437; c=relaxed/simple;
	bh=YaSJ7gazrtN6SokXNtrsQiLpcqC0xCghqf5npFEhCJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0h2prul6bhObaGPfRUzaX+3PoUixuMAk2TlEP3+NtbxUGbTn+9zQw9RJSv6gcJRhd3fTacDzTxPSLNH5iUkmrBRIOmmurJRK0s9p5369BHdcQRfRhHq+chzyxhuvUwkmoAJmjW8n4hNh3cMMPi2NkkG/LgDpaixG3ulOA28IMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDcjdr+Q; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607d9c4fa90so2402567b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989434; x=1708594234; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SqzXrRkWgTenwMOEsO3xos6cCOi/pxIviEw1f9bRtNs=;
        b=vDcjdr+QsMbJ8cR52cNmWS9pVVVAfQrwRkFGR/4UjIj6124G65VHE2dT90yi/LipWu
         ERCQgMvTVX1RA3eFkmtmFYVsmt0WGVdNeqv3RNxP7xNLtoOvb4q4rk2wp6i78nvDAiX/
         7mK8mma8EET6B78aaYxOENanIF11Dx83j+MPPY+f2FM9VGw+APi4Gh0es3vRu6KLWBYQ
         dH40bNUdWnseEQWFMsdDlCVnIye+Z5BlzRXH0WRcpjZ/2fdzaCsKfm/+XZG05J2ytn7k
         Qwj3/EvD8/MerQgv1lAgqvRcLO5s1pW6XxmW0Qa3Tyyj/5Wsa1ob7SiDTEs1kcT7q6ZU
         oyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989434; x=1708594234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqzXrRkWgTenwMOEsO3xos6cCOi/pxIviEw1f9bRtNs=;
        b=kM+tumoiL9rJLURgk/dFmpxnUc3v2FzZIbl5s6jgXV3zWt3eplwRrOgEC2A8fOv5CO
         AvHoByEsxwNERVwrerXb3n2M9HhJSMb6qpHCj6kLNxS2UsS4Y/BWwKQbqIJeI8ofJpUR
         UiJHkZptTauoIS0Wha7uFl3vpZlxtJF39HNXynXFoMPQ/4nddc9MSbqK30m5IG8ifo4W
         bqgZCXEBiN7N+tJYFaQns2etWhK0ZXPOAtU1N83X0WI/h3jls2dw3KiBotkDkHxKKpvb
         GPP/e+H6SID6tJ9XfUR7tDm7G69b/ZCbkTrQ+vUUpzH0M1chxWbrMg3FiF3OsOmmM5h5
         4hbA==
X-Forwarded-Encrypted: i=1; AJvYcCUgk3P/KYuYbR9Xy16fSIuCdRr+zJfCGTUQjN1BuaL/ArCnJkY88zod4V8DWMHaB61oqLHUfmBhWlYnqSg0Isg7yxJ5soRFHyFH9Y1paA==
X-Gm-Message-State: AOJu0YxhAIAykuc9Wg5Kg9P4RZNPzs+UgD91M8n3gbuiYDAoMWCvN9o/
	+LXV0E+DlFs8Hd712nojfr5YI5WfWdoEGrngN2ScwEqL1HCzxoEQuzO8mms1OKd8V1Hh22Pv4OA
	xOBWCf3OfiiXRgQpFySEx0g8Z3QJUDFKuzs3s8Q==
X-Google-Smtp-Source: AGHT+IFCpiGyFmAYq77owcb6CfOtY6i9AJSPN7K0e2ui4hRlz5Hyb+j3XZz9qufOIFUkGQ5wkd8xiF0VwRNodSu/ZjQ=
X-Received: by 2002:a81:7184:0:b0:604:230a:a823 with SMTP id
 m126-20020a817184000000b00604230aa823mr1117501ywc.50.1707989434409; Thu, 15
 Feb 2024 01:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org> <Zc0yXR/fC2OcObLB@linaro.org>
In-Reply-To: <Zc0yXR/fC2OcObLB@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 11:30:23 +0200
Message-ID: <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 23:36, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-14 22:18:33, Konrad Dybcio wrote:
> > On 14.02.2024 22:13, Abel Vesa wrote:
> > > Rather than setting up the core, obsrv and chnls in probe by using
> > > version specific conditionals, add a dedicated "get_core_resources"
> > > version specific op and move the acquiring in there.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> > >  1 file changed, 78 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > > index 23939c0d225f..489556467a4c 100644
> > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> > >   */
> > >  struct pmic_arb_ver_ops {
> > >     const char *ver_str;
> > > +   int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> > >     int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> > >     int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> > >     /* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > >     return 0;
> > >  }
> > >
> > > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > > +                                     void __iomem *core)
> > > +{
> > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > +
> > > +   pmic_arb->wr_base = core;
> > > +   pmic_arb->rd_base = core;
> > > +
> > > +   pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > >  {
> > >     u32 *mapping_table;
> > > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> > >     return apid;
> > >  }
> > >
> > > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > > +{
> > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > +   struct device *dev = &pdev->dev;
> > > +   struct resource *res;
> > > +
> > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >
> > It's no longer indented to deep, no need to keep such aggressive wrapping
> >
>
> The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> pmic_arb_get_core_resources_v2
> pmic_arb_get_core_resources_v7
>
> > > +                                      "obsrvr");
> > > +   pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > > +                                    resource_size(res));
> > > +   if (IS_ERR(pmic_arb->rd_base))
> > > +           return PTR_ERR(pmic_arb->rd_base);
> > > +
> > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > +                                      "chnls");
> > > +   pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > > +                                    resource_size(res));
> > > +   if (IS_ERR(pmic_arb->wr_base))
> > > +           return PTR_ERR(pmic_arb->wr_base);
> >
> > Could probably make it "devm_platform_get_and_ioremap_resource "
>
> The reason this needs to stay as is is because of reason explained by
> the following comment found in probe:
>
> /*
>  * Please don't replace this with devm_platform_ioremap_resource() or
>  * devm_ioremap_resource().  These both result in a call to
>  * devm_request_mem_region() which prevents multiple mappings of this
>  * register address range.  SoCs with PMIC arbiter v7 may define two
>  * arbiter devices, for the two physical SPMI interfaces, which  share
>  * some register address ranges (i.e. "core", "obsrvr", and "chnls").
>  * Ensure that both devices probe successfully by calling devm_ioremap()
>  * which does not result in a devm_request_mem_region() call.
>  */
>
> Even though, AFAICT, there is no platform that adds a second node for
> the second bus, currently, in mainline, we should probably allow the
> "legacy" approach to still work.

If there were no DT files which used two SPMI devices, I think we
should drop this comment and use existing helpers. We must keep
compatibility with the existing DTs, not with the _possible_ device
trees.

>
> >
> > Konrad



-- 
With best wishes
Dmitry


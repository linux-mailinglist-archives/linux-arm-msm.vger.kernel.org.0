Return-Path: <linux-arm-msm+bounces-11201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46949856625
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 15:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F8F1C227D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 14:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154F313249B;
	Thu, 15 Feb 2024 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNcjrIxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDEE132497
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708008135; cv=none; b=sYOYOPK4zrWaM3hW1QojB8SlPMwBljAlunSaQnPylEdij/19DHjJPJYFgJEsxkI+yMafsBAFxyOAkbBDB8TkO2jGxWpbPbS6A1j98gofUSiafZP0YvY8HCo7p6HIDLr2ShKpx7JCyjR9bsToHs7eDcI1S71ZBK2L6zOcwcli1vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708008135; c=relaxed/simple;
	bh=dS27jGD0fKVGB7XlaqNnfwFAlFDq82S6W3A7kwltT3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyjJM7NKI0PXy1HT0pyJYjhbV0yA6jitUAL9yBYPt6s+87qbOjM4DVcueB4vKohWigPCnj5KIYhZy1BOw1lU3HRJZ+endf26+IdzbqKsNh+GTOG9v7mUwZXJO76m2K7ZdbZpDloDbRDYQhtVoKVuQmQlGO2CAhD9i0hQIPkI+yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNcjrIxJ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso898251276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708008132; x=1708612932; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dAC16XHzjVY3XukbmOyTYofThyOnRxBkJl2MJq0kU/g=;
        b=iNcjrIxJ2xjPQk92cQBpUDREps7BpgVcGVshe0obIHnneQXtVx/00A2ag83axItwM3
         P1y9dqqf2RkWgAOsaFM9vuqQHbxIR2/c1ATQKL7l9FIAC5ZTnCPqZexjGatoZVUunb/x
         z6X3SoOiXd0w2ePkxQSFCJGkBqneWWiS1cTHt8999yLh6wkVhZuzsePiGMJFl6BjEm9A
         5aP2Wr24RvqTxdDcUomEh+/taRMW5QsYZ8y7llz0gPzWL3a069SsXncCHbnfT3kg+7MB
         nCagWrFEaanxoYg7knRsIqyL1mz4uqjDoavT/97iu6D2vhd70LGThnCenmVfbqqNxAu0
         MOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708008132; x=1708612932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAC16XHzjVY3XukbmOyTYofThyOnRxBkJl2MJq0kU/g=;
        b=hcP53Wbr0CQo4BNbxEuNympkHBnnwP5PS9d2BcTndtvod9zSG2YNstBQhkYOqbxCXR
         MaoCImMu/aSoTwuAtmxYuJVAdtGZmDLOe4aZe7qqMvT/Vjd6cEsXbxWc5zPdImMFRNjJ
         dOe+5MCO0+6pUev41EzidYqf6C9sBj+kYDq82k56A5FO2NRLRFrvj03SX20isqplzDv3
         OpZCxKFd7KqCvSuTjBqVEMU9DVLIf9on/MOg50+e7h/ReLT/MuYWsX6ZlvL/P54CNpAt
         NbUZ9lswt28XeidP3a3KmihhnzNVWzTHpUNDL4uSS5MTGnCGewMSj0enQzgu8fI2pl5t
         bdhA==
X-Forwarded-Encrypted: i=1; AJvYcCVPlAaW6jftCvksrH3CHoSemjstCfvm8h+Nn7jCfL4REtYtsxfXgWBZoa4m23nJDMe1RPDpRVK0SsMadGp7F/LWBQEXHWn2otI1MvQkKw==
X-Gm-Message-State: AOJu0YxIlca/aT0+9uPvWx45oz7VRjZX7XMTxSIH4GNDSmwG5Px6NrlU
	AmQvLLo2NjyOzIbN/9xCeAjvnOvWhnQCuwQwv28tkhilYmdEVCuqXOVNt6zoIzT/FpVZ6rOhSpI
	hIqxgIweHUbdo6gh38ZWxejGLbRNqhW/IBlzABw==
X-Google-Smtp-Source: AGHT+IFRJcoqJupsoaQ1qFV0tFqhF7c08tDk4aD3Ff1yyUny9nMO7+GZqCkuvRwWEVUHQhtBkS1fIY9p/4h0S7hvHQg=
X-Received: by 2002:a25:b282:0:b0:dc7:46ef:8b9e with SMTP id
 k2-20020a25b282000000b00dc746ef8b9emr1827807ybj.29.1708008131861; Thu, 15 Feb
 2024 06:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org> <Zc0yXR/fC2OcObLB@linaro.org>
 <CAA8EJpq=kYeZfNbFtfQ_oLS0Xi4imyEGV+dDNO+h6LZfqmpxZg@mail.gmail.com> <Zc4SWIViTS0uf952@linaro.org>
In-Reply-To: <Zc4SWIViTS0uf952@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 16:42:00 +0200
Message-ID: <CAA8EJpqOd1Sz_538ZwhPh+AesVRBRmzMiQ0ntsvm4i5erKM-jA@mail.gmail.com>
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

On Thu, 15 Feb 2024 at 15:32, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-15 11:30:23, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 23:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > On 24-02-14 22:18:33, Konrad Dybcio wrote:
> > > > On 14.02.2024 22:13, Abel Vesa wrote:
> > > > > Rather than setting up the core, obsrv and chnls in probe by using
> > > > > version specific conditionals, add a dedicated "get_core_resources"
> > > > > version specific op and move the acquiring in there.
> > > > >
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> > > > >  1 file changed, 78 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > > > > index 23939c0d225f..489556467a4c 100644
> > > > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > > > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> > > > >   */
> > > > >  struct pmic_arb_ver_ops {
> > > > >     const char *ver_str;
> > > > > +   int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> > > > >     int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> > > > >     int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> > > > >     /* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > > > > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > > > >     return 0;
> > > > >  }
> > > > >
> > > > > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > > > > +                                     void __iomem *core)
> > > > > +{
> > > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > > +
> > > > > +   pmic_arb->wr_base = core;
> > > > > +   pmic_arb->rd_base = core;
> > > > > +
> > > > > +   pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > > > >  {
> > > > >     u32 *mapping_table;
> > > > > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> > > > >     return apid;
> > > > >  }
> > > > >
> > > > > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > > > > +{
> > > > > +   struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > > > > +   struct device *dev = &pdev->dev;
> > > > > +   struct resource *res;
> > > > > +
> > > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > >
> > > > It's no longer indented to deep, no need to keep such aggressive wrapping
> > > >
> > >
> > > The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> > > pmic_arb_get_core_resources_v2
> > > pmic_arb_get_core_resources_v7
> > >
> > > > > +                                      "obsrvr");
> > > > > +   pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > > > > +                                    resource_size(res));
> > > > > +   if (IS_ERR(pmic_arb->rd_base))
> > > > > +           return PTR_ERR(pmic_arb->rd_base);
> > > > > +
> > > > > +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > +                                      "chnls");
> > > > > +   pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > > > > +                                    resource_size(res));
> > > > > +   if (IS_ERR(pmic_arb->wr_base))
> > > > > +           return PTR_ERR(pmic_arb->wr_base);
> > > >
> > > > Could probably make it "devm_platform_get_and_ioremap_resource "
> > >
> > > The reason this needs to stay as is is because of reason explained by
> > > the following comment found in probe:
> > >
> > > /*
> > >  * Please don't replace this with devm_platform_ioremap_resource() or
> > >  * devm_ioremap_resource().  These both result in a call to
> > >  * devm_request_mem_region() which prevents multiple mappings of this
> > >  * register address range.  SoCs with PMIC arbiter v7 may define two
> > >  * arbiter devices, for the two physical SPMI interfaces, which  share
> > >  * some register address ranges (i.e. "core", "obsrvr", and "chnls").
> > >  * Ensure that both devices probe successfully by calling devm_ioremap()
> > >  * which does not result in a devm_request_mem_region() call.
> > >  */
> > >
> > > Even though, AFAICT, there is no platform that adds a second node for
> > > the second bus, currently, in mainline, we should probably allow the
> > > "legacy" approach to still work.
> >
> > If there were no DT files which used two SPMI devices, I think we
> > should drop this comment and use existing helpers. We must keep
> > compatibility with the existing DTs, not with the _possible_ device
> > trees.
>
> Sure.
>
> Should I drop the qcom,bus-id from the driver as well? It is optional
> after all.

I think so. Let's drop it completely. And for the new sub-devices you
perfectly know the bus ID.

-- 
With best wishes
Dmitry


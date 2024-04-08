Return-Path: <linux-arm-msm+bounces-16827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BC89C9F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 18:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD44F1C20EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEB4142652;
	Mon,  8 Apr 2024 16:43:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672FD1E4AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594621; cv=none; b=QTaKUfpXI4R/B8xt1/77OrPTu9YjYsuuXnBPBnTw01FRByt+waTnLshp+gOPa5jmKUWwGjqMgIIEpzHzmbHFFDc9L6BJ8z4h/CCZQ8cmYXfoIEqrBkfxbNgIFGTeBks54Bwq170j40y90hwR4qvfW4g0d63zvrNdrqAfRuWTC2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594621; c=relaxed/simple;
	bh=IDfPctw9xCwHUVhCUkJDAHkZrpFZqENjHsNEdq9ezYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udFFUzc9zM4cDCckI3YzqEiWjoQUdE+LZ/ozqEOGYwqoyvluw3+jAs3ZczxSg9KByZttjm7TZ5YsIV1Bu96FEl3BAOzbdiFpG+/TQCQ+mbg0o/LzhIGd78TiNdbgSecaK7yAqDAxYk0B+CTkdTBj0B3/Zs96DIGRidRqN/wFgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (2a02-a420-6-f162-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:6:f162:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 03B744042A;
	Mon,  8 Apr 2024 18:34:21 +0200 (CEST)
Date: Mon, 8 Apr 2024 18:34:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
Message-ID: <b2vdqzx3g7s4ihn6i3nkmao6m4wgpd4ivw3rcbsw6qzmby7wub@trq3c23ezt76>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
 <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
 <CABymUCODHQ=bobQNhttY-RqLDjEGf75yAm2YD--ZnfXjAtzNMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCODHQ=bobQNhttY-RqLDjEGf75yAm2YD--ZnfXjAtzNMw@mail.gmail.com>

On 2024-04-08 17:58:29, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年4月3日周三 17:41写道：
> >
> > On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Add variable for slice number of a DSC compression bit stream packet.
> > > Its value shall be specified in panel driver, or default value can be set
> > > in display controller driver if panel driver does not set it.
> >
> > This is not a part of the standard. Please justify it.
> 
> Right, I read the standard but did not find any details of packet description.
> Looks like msm silicon support tuning of number of slice packing per downstream
> code.
> The slice_per_pkt can be set in the downstream msm device tree. And I test the
> values 1 and 2 on vtdr6130 panel and both work. So I guess this is related to
> performance or something like that. I will have more test with different panel
> to check the impact.
> drivers/gpu/drm/panel/panel-raydium-rm692e5.c also mentions to pass new value
> to slice_per_pkt.
> 
> Hi Konrad,
> Do you remember why value 2 is TODO for slice_per_pkt for panel rm692e5?

Hi Jun,

I think I should indirectly answer that question, as I indirectly via "the"
MDSS panel generator place that comment there based on the suggested downstream
value:

https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator/commit/5c82e613d987d05feca423412f6de625f9c99bae#diff-dba3766d7cec900b8de500f888c64a392cd9780f9baf00aae7e3f87a7d3fefc4R458

So I don't think Konrad's answer will be any different than "that's what
downstream does, and that's what the generator put there".

---

I was fairly certain that it used for performance reasons, but panels were found
(e.g. on the FairPhone 5) that don't seem to function without combining multiple
(2) slices in one packet at all?

- Marijn

> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/display/drm_dsc.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> > > index bc90273d06a6..4fac0a2746ae 100644
> > > --- a/include/drm/display/drm_dsc.h
> > > +++ b/include/drm/display/drm_dsc.h
> > > @@ -82,6 +82,10 @@ struct drm_dsc_config {
> > >          * @bits_per_component: Bits per component to code (8/10/12)
> > >          */
> > >         u8 bits_per_component;
> > > +       /**
> > > +        * @slice_per_pkt: slice number per DSC bit stream packet
> > > +        */
> > > +       u8 slice_per_pkt;
> > >         /**
> > >          * @convert_rgb:
> > >          * Flag to indicate if RGB - YCoCg conversion is needed
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry


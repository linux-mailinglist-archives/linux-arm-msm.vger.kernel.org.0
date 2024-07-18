Return-Path: <linux-arm-msm+bounces-26568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A775E934F51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F49281A11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000E57828B;
	Thu, 18 Jul 2024 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iW1RlZB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B713AD32
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721313979; cv=none; b=o80z+aztHC2GYXHDEcs8NTbOmi7kBKmcdMhMpmBVQ7K+liCChEJbPhin8Eq67341tmbGvURwLqeUL2zBBp659d5143DZK2JP6wVYdO+WoUVJjS7gof3TUO2MOGsUBniAadVFMqnXJRH4TDaTxYmc6gF3wc+tQQkP6coy+vBvshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721313979; c=relaxed/simple;
	bh=ItEYfyU78HUDQ4/9fhXGu8NLyqmW1vdphw7TfYOCTU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCvN5Sfh/thWf0JLpb/UjWYVAKOzr2q86waSgBSQ0db8V5jbyRd+lk1QgyO1frjyEZ2fhFyX65Bx/B448vp7p45wV7MwthK4vs3oQj10WDxEc/G4jRdycIXHNvxg0g2UE6iQjIUByCNSbany5X6T+CLSKO+CU/eV9m2n92/hBEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iW1RlZB6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-44acdd30c3fso1905541cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721313975; x=1721918775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItEYfyU78HUDQ4/9fhXGu8NLyqmW1vdphw7TfYOCTU0=;
        b=iW1RlZB6E4R8CHisAXCGIyocGXZTD5+1CGoYmrPO3VK7m/rBBrys3L/BXKKR1k4Biy
         rj35ewsWUUKoAKCwEVE8nA+/7XkbU+wVuqNXbsXTjoiWXAN/GJrMbiI6CAXb9WboUub/
         Oh2bzwObOA4xRcwMA9Nr0zGdihUGAAJFfZzfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721313975; x=1721918775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItEYfyU78HUDQ4/9fhXGu8NLyqmW1vdphw7TfYOCTU0=;
        b=FXhTnEGnl1V7FoAvvUvt7a4aE6xeJEnq3eRuGefHwmgg1lr8zKSjnEsbzTqsopdZts
         jtrgRcEOtS6Ek6qvlymoLzI/xB6fD2rUZsMre9gxJux9K/nbRU2MgRgMvEFFR1qdYXnO
         CNCqYjawsA1IyR5DEZ2xyaH6IISDg/rqDP0o1qXv2Jjt05pMoKZcjz8N3kIr+FiD1OTa
         Ccw5qY8evcVylANwQ9mXBiVEQI2uoFYtGxJ92Ocl4bArkQtcVcSunuUFsRwCCNsGWUWA
         JruwV1rTT9sUKrOFDdtOFDLQIuodXOVYnR7Eva3QaEVzcmkRMFrvG6dxRZUBwHKbV9ey
         sEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX39PdoPOJDXq0kftIgr+i30vIoTb/0g+52DfAlCAt7wt8D1CCCOCe6PD4RIT708SYgy35/gin5ZOPDN/lfr9ggNnIzrtAqe2h7zYtqaA==
X-Gm-Message-State: AOJu0YyXhwdR8hdMBvLN37ZWgedUnYwJEKnc5kbUuMliW5WVgXGsWFzQ
	BGpXhqCxi7A8xK5jmkoKmEqYeDmUMTHDHlpxS7/EASK0kjKtT92xBeOXKCeAEwgwUsWjiUEJrTA
	=
X-Google-Smtp-Source: AGHT+IGrGyC/YJE1fG0JJAdbK0JvzSrZOjSdN7OtUoWSw2uB03bGPe/IG3R4VS1btpyxRAp2+anwmg==
X-Received: by 2002:a05:622a:292:b0:447:f105:e6dc with SMTP id d75a77b69052e-44f9696ad9cmr14072541cf.4.1721313975331;
        Thu, 18 Jul 2024 07:46:15 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f96a29b94sm3030571cf.57.2024.07.18.07.46.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 07:46:14 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-447f8aa87bfso156641cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 07:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWamnKQzoegizRqLCgn1ADRVPAvaVH04j8r3ipwQyneCUTUq0uu2eCdjTTHCqUJMHDcoIeim3g1gxdr0sjRq1zhPxYNx1TNSROjFi4v7Q==
X-Received: by 2002:ac8:6d08:0:b0:447:e792:c797 with SMTP id
 d75a77b69052e-44f96af537emr962911cf.29.1721313973898; Thu, 18 Jul 2024
 07:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud> <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
In-Reply-To: <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 07:45:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
Message-ID: <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/07/2024 02:21, Doug Anderson wrote:
> > Conor (and/or) Krzysztof and Rob,
> >
> > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> >>
> >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backligh=
t
> >>> control over the DP AUX channel. While it works almost correctly with=
 the
> >>> generic "edp-panel" compatible, the backlight needs special handling =
to
> >>> work correctly. It is similar to the existing ATNA33XC20 panel, just =
with
> >>> a larger resolution and size.
> >>>
> >>> Add a new "samsung,atna45af01" compatible to describe this panel in t=
he DT.
> >>> Use the existing "samsung,atna33xc20" as fallback compatible since ex=
isting
> >>> drivers should work as-is, given that resolution and size are discove=
rable
> >>> through the eDP link.
> >>>
> >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Can you comment on whether you would consider this bindings a "Fix"
> > since it's a dependency for later patches in this series (which are
> > "Fix"es) to pass dtbs_check? See:
> >
> > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.o=
rg
>
> The patch itself is not a fix, for sure, but it might be a dependency of
> a fix (which you wrote above), thus could be pulled to stable as a
> dependency.
>
> I do not care about dtbs_check warnings in stable kernels, mostly
> because dtbs_check warnings depend heavily on dtschema and dtschema
> follows mainline kernel. Basically if you had warnings-free v6.8 but try
> to run dtbs_check now with latest dtschema, your results will differ.
>
> At some point in the future, I could imagine "no new dtbs_check warnings
> in stable kernels" requirement or at least preference, but so far I
> don't think there is any benefit.

In this case it's not about whether it makes it to the stable kernel
but about which main kernel it goes through.

If we land the bindings in drm-misc-next right now then it'll be a
long time before it makes it into Linus's tree because of the way that
drm-misc-next merges. It will make it to Linus's tree at 6.12. You can
see the drm-misc merging strategy at:

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

If we land the dts change (a fix) through the Qualcomm tree as a fix
then it should target 6.11.

This means that the 6.11 tree will have a dtbs_check error because it
has the dts change (a fix) but not the bindings change (not a fix).

One way to resolve this would be to treat this bindings as a "fix" and
land it through "drm-misc-fixes". That would make the bindings and
device tree change meet up in Linux 6.11.

Did I get that all correct?

-Doug


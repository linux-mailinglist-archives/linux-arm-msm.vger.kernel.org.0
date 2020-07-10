Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF56E21AF2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 08:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGJGMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 02:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgGJGMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 02:12:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C1DC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 23:12:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cv18so4159127pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MDOqx8vxa/30A8XhY3uCkxkxCTIbX1UKL3i9UssXhro=;
        b=YQN3wyrUqnoKyW6LkEnOAXbo1yEYXD4zeVsZah3jneZODo1vRwD80P1/DO3vAgKpo4
         4q8jvKxSP8roPZPEXCfRBPzFVAixIeBB1c06dFtSgvQWiC4i1sfPaCzF76ziNbXao2h1
         AXjyXvLz3UKJ8luQEI2qPMVB2HLJzTpYO79yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MDOqx8vxa/30A8XhY3uCkxkxCTIbX1UKL3i9UssXhro=;
        b=I++sp/THioklspPKDToaIS2rBJIRTZ59UCkjEmWttygAjtnfWhMsCX6VvcseMLZPm/
         XKXQrx438GgvJgOo4jg98iBxcW8JsKRrf4b3PV9sKs+OTy0+xXW/QV6IB5VH6PQgYOJu
         bzfwudG3ZCg7aihYdRYlwQ4PMjy5bJ1gwb3adYHEa+/Hmu9zl7/u805/k3JwaAieG7+L
         BC09F+RqlXHoMGpW1WrZvMzfB3cTYN8TvBFm8gCaVnQfyZT8HgJpiyECfPowz7RyawAd
         IsSIDLVYI7mSWPxiMxxanhSL6PPyIz3MdncGiR7VAvb2uPAsYaJWd6l5NsVQTKAbNbEB
         JL/Q==
X-Gm-Message-State: AOAM531ux2luvLV70k9jhS4lKbFc3EpMXBGLm7EAZApoqsNEHtwjBVt2
        20E2Ym0X+a9CQhcaGcRs0wNAVzs061E=
X-Google-Smtp-Source: ABdhPJwPvKjchWKFqAIbyd/TdHITo1hj1fnDIECweruqTh33U9CzcEdR1JMeCauMakY0xW7tmhE7Hg==
X-Received: by 2002:a17:90a:1b4a:: with SMTP id q68mr3871837pjq.1.1594361549533;
        Thu, 09 Jul 2020 23:12:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z26sm4709566pfr.187.2020.07.09.23.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:12:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594235417-23066-3-git-send-email-sanm@codeaurora.org>
References: <1594235417-23066-1-git-send-email-sanm@codeaurora.org> <1594235417-23066-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v2 2/3] usb: dwc3: qcom: Configure wakeup interrupts and set genpd active wakeup flag
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Thu, 09 Jul 2020 23:12:27 -0700
Message-ID: <159436154779.1987609.882978770178758503@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-07-08 12:10:16)
> configure interrupts based on hs_phy_flag. Set genpd active wakeup flag

Please capitalize the start of a sentence. What is 'hs_phy_flag'?

> for usb gdsc if wakeup capable devices are connected.

This tells us what is happening in the code but doesn't tell us the
important part, i.e. _why_ this patch is important. Why do we need to
set the genpd active wakeup flag? Why configure interrupt based on
hs_phy_flag, whatever that is.

>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 73 ++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 57 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..8902670 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -192,21 +194,34 @@ static int dwc3_qcom_register_extcon(struct dwc3_qc=
om *qcom)
> =20
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> +       struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +
>         if (qcom->hs_phy_irq) {
>                 disable_irq_wake(qcom->hs_phy_irq);
>                 disable_irq_nosync(qcom->hs_phy_irq);
>         }
> +       if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
> +               if (qcom->dp_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dp_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dp_hs_phy_irq);
> +               }
> +       } else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
> +               if (qcom->dm_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dm_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dm_hs_phy_irq);
> +               }
> +       } else {
> =20
> -       if (qcom->dp_hs_phy_irq) {
> -               disable_irq_wake(qcom->dp_hs_phy_irq);
> -               disable_irq_nosync(qcom->dp_hs_phy_irq);
> -       }
> +               if (qcom->dp_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dp_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dp_hs_phy_irq);
> +               }
> =20
> -       if (qcom->dm_hs_phy_irq) {
> -               disable_irq_wake(qcom->dm_hs_phy_irq);
> -               disable_irq_nosync(qcom->dm_hs_phy_irq);
> +               if (qcom->dm_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dm_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dm_hs_phy_irq);
> +               }
>         }
> -

I liked the newline. Please keep it.

>         if (qcom->ss_phy_irq) {
>                 disable_irq_wake(qcom->ss_phy_irq);
>                 disable_irq_nosync(qcom->ss_phy_irq);
> @@ -215,21 +230,34 @@ static void dwc3_qcom_disable_interrupts(struct dwc=
3_qcom *qcom)
> =20
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> +       struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +
>         if (qcom->hs_phy_irq) {
>                 enable_irq(qcom->hs_phy_irq);
>                 enable_irq_wake(qcom->hs_phy_irq);
>         }
> +       if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
> +               if (qcom->dp_hs_phy_irq) {
> +                       enable_irq(qcom->dp_hs_phy_irq);
> +                       enable_irq_wake(qcom->dp_hs_phy_irq);
> +               }
> +       } else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
> +               if (qcom->dm_hs_phy_irq) {
> +                       enable_irq(qcom->dm_hs_phy_irq);
> +                       enable_irq_wake(qcom->dm_hs_phy_irq);
> +               }
> +       } else {
> =20
> -       if (qcom->dp_hs_phy_irq) {
> -               enable_irq(qcom->dp_hs_phy_irq);
> -               enable_irq_wake(qcom->dp_hs_phy_irq);
> -       }
> +               if (qcom->dp_hs_phy_irq) {
> +                       enable_irq(qcom->dp_hs_phy_irq);
> +                       enable_irq_wake(qcom->dp_hs_phy_irq);
> +               }
> =20
> -       if (qcom->dm_hs_phy_irq) {
> -               enable_irq(qcom->dm_hs_phy_irq);
> -               enable_irq_wake(qcom->dm_hs_phy_irq);
> +               if (qcom->dm_hs_phy_irq) {
> +                       enable_irq(qcom->dm_hs_phy_irq);
> +                       enable_irq_wake(qcom->dm_hs_phy_irq);
> +               }
>         }
> -
>         if (qcom->ss_phy_irq) {
>                 enable_irq(qcom->ss_phy_irq);
>                 enable_irq_wake(qcom->ss_phy_irq);

Can we use the wakeup irq support code in the kernel here? That would be
preferred to having the driver enable and disable irq wake at various
times when the irq is enabled and disabled (which is also odd by the
way). Why can't we request the irqs and leave them enabled all the time?
Also it seems like the binding should have 'wakeup-source' in it (see
Documentation/devicetree/bindings/power/wakeup-source.txt for more
info).

> @@ -240,6 +268,14 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>         u32 val;
>         int i;
> +       struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +       struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);
> +       struct generic_pm_domain *genpd;
> +
> +       genpd =3D pd_to_genpd(qcom->dev->pm_domain);
> +
> +       if (genpd && usb_wakeup_enabled_descendants(hcd->self.root_hub))

Feels like a comment would be good to explain why wakeup enabled
descendants matters here.

> +               genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> =20
>         if (qcom->is_suspended)
>                 return 0;
> @@ -261,6 +297,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  {
>         int ret;
>         int i;
> +       struct generic_pm_domain *genpd;
> +
> +       genpd =3D pd_to_genpd(qcom->dev->pm_domain);

This does container_of() so it can't return NULL.

> +       if (genpd)

So this check is wrong?

> +               genpd->flags &=3D !GENPD_FLAG_ACTIVE_WAKEUP;

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15D42D381C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 02:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgLIBJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 20:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLIBJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 20:09:12 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0460C061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 17:08:31 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id v22so207230edt.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 17:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruGd4q6KZWpDS78RJXrsrDqLWluPTOTGxDVaHIvkab0=;
        b=ELpsixt222Vh6on/xzaMrMmCvM0mHYZmtUKJkTcHWLdV9vedreDoKtyOarP46BodW7
         0ZfxImwRCmIIqyrx88p/RTINm/JUTaqCdm4FTpQsT+UXA49s0jJWwnMQvkL8EppzbohB
         ZVOUagGdN9Ehk3H8UrYPpznh+OLwT6tjnCqEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruGd4q6KZWpDS78RJXrsrDqLWluPTOTGxDVaHIvkab0=;
        b=dkMgNLcay05FpJBxwRFIVFwp7lMFqXBSGcaqGFC01xKmNJFaWzcaXOJhVRHgV4aelX
         PpnkPg1gaaSL3OgllXpuPJo6qThPywSNTaIa8e3k85QY7DJIU4g7wDx3BsTu5QmEVEgU
         KIzPZFJ+hye5+9NSenBWUhRpeSOckwBqnu4kN95I/Bp8r9IIPuc0D1gqcjWr9JxXWZX2
         z7NjlB2omr/MVERh1wkXQGBvNLEGbhsLpPcuAVzr+VGqbQEnR4z5x3vLauWqM4unRdd9
         tjZ4iy3dUWZ7yoabV0Y/BepEQzuJPlqHBGK0YxfuW3TtDgwPINIXBam0Kaa87vC9CgAB
         xFeA==
X-Gm-Message-State: AOAM532JsM8rN3yjh8ZBuwOXNflXUEvTyrohQaY+5Xuf+okgD+xqlS1Y
        RgLYPH/7zAJmmkbZt7QoD1JmR1ct3bPJtw==
X-Google-Smtp-Source: ABdhPJxvOAyZHKm0G5eiuduotEo2wbspVpNGpY63I+NpeXVNB2oOszNEJfi0UQuEdoJQQloKCqDdhw==
X-Received: by 2002:a50:d5c4:: with SMTP id g4mr575576edj.334.1607476109898;
        Tue, 08 Dec 2020 17:08:29 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id dx7sm272711ejb.120.2020.12.08.17.08.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 17:08:28 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id x16so579760ejj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 17:08:28 -0800 (PST)
X-Received: by 2002:a17:906:4304:: with SMTP id j4mr60872ejm.304.1607476108105;
 Tue, 08 Dec 2020 17:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20201207143255.1.Ib92ec35163682dec4b2fbb4bde0785cb6e6dde27@changeid>
In-Reply-To: <20201207143255.1.Ib92ec35163682dec4b2fbb4bde0785cb6e6dde27@changeid>
From:   Alexandru M Stan <amstan@chromium.org>
Date:   Tue, 8 Dec 2020 17:07:51 -0800
X-Gmail-Original-Message-ID: <CAHNYxRxNHtRL9XjHu=cyrn75YvMH5-BYWR6CLPKa1X+azFckeQ@mail.gmail.com>
Message-ID: <CAHNYxRxNHtRL9XjHu=cyrn75YvMH5-BYWR6CLPKa1X+azFckeQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Clean up sc7180-trogdor voltage rails
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>, kgunda@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 7, 2020 at 2:33 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> For a bunch of rails we really don't do anything with them in Linux.
> These are things like modem voltage rails that the modem manages these
> itself and core rails (like IO rails) that are setup to just
> automagically do the right thing by the firmware.
>
> Let's stop even listing those rails in our device tree.
>
> The net result of this is that some of these rails might be able to go
> down to a lower voltage or perhaps transition to LPM (low power mode)
> sometimes.
>
> Here's a list of what we're doing and why:
>
> * L1A - only goes to SoC and doesn't seem associated with any
>   particular peripheral. Kernel isn't doing anything with
>   this. Removing from dts. NET IMPACT: rail might drop from 1.2V to
>   1.178V and switch to LPM in some cases depending on firmware.
> * L2A - only goes to SoC and doesn't seem associated with any
>   particular peripheral. Kernel isn't doing anything with
>   this. Removing from dts. NET IMPACT: rail might switch to LPM in
>   some cases depending on firmware.
> * L3A - only goes to SoC and doesn't seem associated with any
>   particular peripheral. Kernel isn't doing anything with
>   this. Removing from dts. NET IMPACT: rail might switch to LPM in
>   some cases depending on firmware.
> * L5A - seems to be totally unused as far as I can tell and doesn't
>   even come off QSIP. Removing from dts.
> * L6A - only goes to SoC and doesn't seem associated with any
>   particular peripheral (I think?). Kernel isn't doing anything with
>   this. Removing from dts. NET IMPACT: rail might switch to LPM in
>   some cases depending on firmware.
> * L16A - Looks like this is only used for internal RF stuff. Removing
>   from dts. NET IMPACT: rail might switch to LPM in some cases
>   depending on firmware.
> * L1C - Just goes to WiFi / Bluetooth. Trust how IDP has this set and
>   put this back at 1.616V min.
> * L4C - This goes out to the eSIM among other places. This looks like
>   it's intended to be for SIM card and modem manages. NET IMPACT:
>   rail might switch to LPM in some cases depending on firmware.
> * L5C - This goes to the physical SIM.  This looks like it's intended
>   to be for SIM card and modem manages. NET IMPACT: rail might drop
>   from 1.8V to 1.648V and switch to LPM in some cases depending on
>   firmware.
>
> NOTE: in general for anything which is supposed to be managed by Linux
> I still left it all forced to HPM since I'm not 100% sure that all the
> needed calls to regulator_set_load() are in place and HPM is safer.
> Switching more things to LPM can happen in a future patch.
>
> ALSO NOTE: Power measurements showed no measurable difference after
> applying this patch, so perhaps it should be viewed more as a cleanup
> than any power savings.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 82 ++------------------
>  1 file changed, 7 insertions(+), 75 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 8ed7dd39f6e3..43dfe7833ad9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -298,40 +298,6 @@ pp1125_s1a: smps1 {
>                         regulator-max-microvolt = <1128000>;
>                 };
>
> -               /*
> -                * pp2040_s5a (smps5) and pp1056_s4a (smps4) are just
> -                * inputs to other rails on AOP-managed PMICs on trogdor.
> -                * The system is already configured to manage these rails
> -                * automatically (enable when needed, adjust voltage for
> -                * headroom) so we won't specify anything here.
> -                *
> -                * NOTE: though the rails have a voltage implied by their
> -                * name, the automatic headroom calculation might not result
> -                * in them being that voltage.  ...and that's OK.
> -                * Specifically the only point of these rails is to provide
> -                * an input source for other rails and if we can satisify the
> -                * needs of those other rails with a lower source voltage then
> -                * we save power.
> -                */
> -
> -               pp1200_l1a: ldo1 {
> -                       regulator-min-microvolt = <1200000>;
> -                       regulator-max-microvolt = <1200000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
> -               pp1000_l2a: ldo2 {
> -                       regulator-min-microvolt = <944000>;
> -                       regulator-max-microvolt = <1056000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
> -               pp1000_l3a: ldo3 {
> -                       regulator-min-microvolt = <968000>;
> -                       regulator-max-microvolt = <1064000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
>                 vdd_qlink_lv:
>                 vdd_qlink_lv_ck:
>                 vdd_qusb_hs0_core:
> @@ -350,24 +316,6 @@ pp900_l4a: ldo4 {
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> -               pp2700_l5a: ldo5 {
> -                       regulator-min-microvolt = <2704000>;
> -                       regulator-max-microvolt = <2704000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
> -               ebi0_cal:
> -               ebi1_cal:
> -               vddio_ck_ebi0:
> -               vddio_ck_ebi1:
> -               vddio_ebi0:
> -               vddq:
> -               pp600_l6a: ldo6 {
> -                       regulator-min-microvolt = <568000>;
> -                       regulator-max-microvolt = <648000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
>                 vdd_cx_wlan:
>                 pp800_l9a: ldo9 {
>                         regulator-min-microvolt = <488000>;
> @@ -404,6 +352,11 @@ pp1800_l12a_r: ldo12 {
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> +               /*
> +                * On trogdor this needs to match l10a since we use it to
> +                * give power to things like SPI flash which communicate back
> +                * on lines powered by l10a.  Thus we force to 1.8V.
> +                */
>                 pp1800_l13a: ldo13 {
>                         regulator-min-microvolt = <1800000>;
>                         regulator-max-microvolt = <1800000>;
> @@ -424,12 +377,6 @@ pp1800_l15a: ldo15 {
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> -               pp2700_l16a: ldo16 {
> -                       regulator-min-microvolt = <2496000>;
> -                       regulator-max-microvolt = <3304000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
>                 vdda_qusb_hs0_3p1:
>                 vdd_pdphy:
>                 pp3100_l17a: ldo17 {
> @@ -463,8 +410,8 @@ pp1300_s8c: smps8 {
>                 };
>
>                 pp1800_l1c: ldo1 {
> -                       regulator-min-microvolt = <1800000>;
> -                       regulator-max-microvolt = <1800000>;
> +                       regulator-min-microvolt = <1616000>;
> +                       regulator-max-microvolt = <1984000>;
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> @@ -491,21 +438,6 @@ pp1200_l3c: ldo3 {
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> -               ld_pp1800_esim_l4c:
> -               vddpx_5:
> -               pp1800_l4c: ldo4 {
> -                       regulator-min-microvolt = <1648000>;
> -                       regulator-max-microvolt = <3304000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
> -               vddpx_6:
> -               pp1800_l5c: ldo5 {
> -                       regulator-min-microvolt = <1800000>;
> -                       regulator-max-microvolt = <1800000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -               };
> -
>                 vddpx_2:
>                 ppvar_l6c: ldo6 {
>                         regulator-min-microvolt = <1800000>;
> --
> 2.29.2.576.ga3fc446d84-goog
>

Reviewed-by: Alexandru M Stan <amstan@google.com>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0F24BBB7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 15:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbiBRO5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 09:57:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236546AbiBRO4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 09:56:53 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B6E580C4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 06:56:19 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hw13so15598179ejc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HEDVsJdoBlriKRiWsMiaPibDlLRBSHkQp8aBEXdrRPg=;
        b=fqRe4zP7YJl0es1coqEkQ+IA42hkW52O3II+Mzuv6ExVlmG3hQ9BH55+U9/QlFyisp
         0usnUkaPANy2IpTeSlyrZXG5nwU5PJx+kftwW3x7K85HTPrWGf5JoMKVsOXl8czZudNt
         kgmk68cPq+KhxefMKldnyo24+ONhbjWcEPftQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HEDVsJdoBlriKRiWsMiaPibDlLRBSHkQp8aBEXdrRPg=;
        b=DQNDzd89Zoc8kcAnpqRKW8LHiF4HBKGk9yEZb//YioAPn62HhuSAMPicitjk+GzN/6
         sjHqVCRA6PZ85Dpeydw9ST+mUT4o6Xk3lFlcAQRTHLJJkL1h5SUpwweLmWWc4w68oVPl
         rWFmr5TcrLOj5GKFJG8CQ9LUTn0E+jcg+Z7MJKjjTmuCX3llAfw6VYSMuJEE68RBNkK3
         MRwGNysKahh0NLFP8ROHKjhwvalTxi9EpC/vneafqDqCyuBRxcbwjcfCCM+71ZrSXHE2
         J/ZdX7ESyvifDJDNuH1Yv9f0I7H1f7VtwDXONOSh0/7YnveTX08OTB8LH39coHN5yqE7
         gMcg==
X-Gm-Message-State: AOAM530TIvPdu58WvqrvN2S0B5dAOuV29gmfHocNKFve2ZXZ9WVDwKog
        dtHyb5cYL78z4ChFqVFbThLKKb+0HzZDKLP81nI=
X-Google-Smtp-Source: ABdhPJxg1NCxMWpYMuUiXoA9pCrF5Xw8Ebx0Mr1hGnlghlYqBBIxU+1vvu17DTY7fIlrgDSlWtK/+w==
X-Received: by 2002:a17:907:334c:b0:6cd:76b7:3948 with SMTP id yr12-20020a170907334c00b006cd76b73948mr7162393ejb.55.1645196177842;
        Fri, 18 Feb 2022 06:56:17 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id s1sm2539878edd.100.2022.02.18.06.56.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 06:56:15 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id u2so13887825wrw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 06:56:15 -0800 (PST)
X-Received: by 2002:a5d:4c48:0:b0:1e4:aeab:c77e with SMTP id
 n8-20020a5d4c48000000b001e4aeabc77emr6335194wrt.342.1645196174604; Fri, 18
 Feb 2022 06:56:14 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com> <YgWoAwdH/AqJUshh@builder.lan>
In-Reply-To: <YgWoAwdH/AqJUshh@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Feb 2022 06:56:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XHsgg-cPVRr8jEUTGm3rf_BO5P+jQawDPq9Hju-O4uwQ@mail.gmail.com>
Message-ID: <CAD=FV=XHsgg-cPVRr8jEUTGm3rf_BO5P+jQawDPq9Hju-O4uwQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com, quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 10, 2022 at 4:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > +&mdss_edp {
> > +     status = "okay";
> > +
> > +     vdda-1p2-supply = <&vreg_l6b_1p2>;
> > +     vdda-0p9-supply = <&vreg_l10c_0p8>;
> > +     /delete-property/ pinctrl-names;
> > +     /delete-property/ pinctrl-0;
>
> If the first device to enable &mdss_edp overwrites pinctrl-{names,0} in
> &mdss_dp and removes the properties in &mdss_edp, I think that's a sign
> that they should not be in the .dtsi in the first place.

Actually, I just looked more carefully here. I think the
"/delete-property" for edp_hpd here is just wrong. I'm pretty sure
that the HPD signal is hooked up on CRD and we actually need it. If
somehow deleting the property helps you then it's probably just
hacking around a bug and relying on the panel to be always powered on,
or something.

I think this gets into some of the stuff in your final patch in this
series. I found that, on my hardware, the panel doesn't come up at all
with that final patch. When I go back to how things were working in an
earlier version of your series, though, I can get things working a
little better (though still not perfect).

-Doug

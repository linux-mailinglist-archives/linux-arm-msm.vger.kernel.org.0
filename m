Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FC77CA295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 10:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbjJPIvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 04:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbjJPIvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 04:51:47 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96A7E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:51:45 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a84204e7aeso22417737b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697446304; x=1698051104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXGsc0Da4hN/PIZizg8vgj/+4wq2DaVxoawz9xj9Tyo=;
        b=m81bMpI+2R07e9xkaoyJ+dxONpUhKBglFjlVhxyHo+boqhFXUpRpwODeDi5bkmyNoE
         xkgrTXq78GfXDRgjo+UUwa1qke8o4cZJIY9HchmDb6Yodq+zLVPmzTrVBh2qp8BW5N1E
         WlcU6Q3zEr+c92g1KJfTCoVwj5XgMOIQqT4P+HVqi60Cy6tplEjurwOGYRmzwO7UUeiP
         /cSlf6PfnN9i7GfToWXHTX2feH6HyZluAWFBnUTfIKFYilSL78q+pkSlP32iuVKmCJ0Z
         Y0W1hIwm5wR3jJuaKuLqa/0buuHGDz45+TBVceRvKbQjdacpbt4QrOHGMjYysTVvXliy
         PVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697446304; x=1698051104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXGsc0Da4hN/PIZizg8vgj/+4wq2DaVxoawz9xj9Tyo=;
        b=FQxcmK8OZKa3KdVRvivsoeaao6f7DnloJ+bN8oGFtGXWQo7GpTPUqpQcr6zSyOxezv
         eeILN0aYun7/4YVz4oguwHLwbYnfIUw4VyrxNZITkcfLwyKrlbfnIZ5Rj6x0LiaYjakq
         A76CX4JIor0SXeSdN6dlJOg+axA6QG4P26VqVlR7euWcPUXNlGt1H61eelyM0Dyr9Dma
         GQ/atkD0uzluOasfVdYRiX5HKaVWJGcAObamP0tt4F5YI2agFnI/FOlLgLo56qJBYwy9
         oVla/8ViwahmG2eLCalURWkXV90JLR3PS7eI2n5ySLKtJ+T12XTfrQ6oatwuwYZmDuIL
         Rllw==
X-Gm-Message-State: AOJu0YxW7+IR+LrIMg3CGh5eI9rjoEHoyXQn+M3VRveCJNQBlxWaSxSU
        tsAdPcBuGYO0JLQG0esFuAqXl+6Iahlzehdn9YK4tg==
X-Google-Smtp-Source: AGHT+IF0GpgqPc7n9XdLnHCL9z0TU9/c8LFokbztpOKfofS1TAHe3iHJo+xA70QmWdRBqyMEWBk1SOc2WIvgf119tMQ=
X-Received: by 2002:a0d:f985:0:b0:59f:21c1:30b6 with SMTP id
 j127-20020a0df985000000b0059f21c130b6mr37856143ywf.51.1697446304502; Mon, 16
 Oct 2023 01:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-topic-x13s_edpphy-v1-1-ce59f9eb4226@linaro.org>
In-Reply-To: <20230929-topic-x13s_edpphy-v1-1-ce59f9eb4226@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Oct 2023 11:51:33 +0300
Message-ID: <CAA8EJprXCzVyaU49qgVcVfF0-FJ3QqAfTMZj5CEZm187hoi4=g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: Use the correct DP PHY compatible
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Sept 2023 at 19:03, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> The DP PHY needs different settings when an eDP display is used.
> Make sure these apply on the X13s.

Could you please clarify, is it the same PHY type, just being
repurposed for eDP or is it a different PHY type?

If the former is the case (and the same PHY can be used for both DP
and eDP), it should carry the same compatible string and use software
mechanisms (e.g. phy_set_mode_ext()) to be programmed for the correct
operation mode.

>
> FWIW
> I could not notice any user-facing change stemming from this commit.
>
> Fixes: f48c70b111b4 ("arm64: dts: qcom: sc8280xp-x13s: enable eDP display")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> I have no idea whether DP3 is hardwired to be eDP, like it
> seems to be on the last DP controller of SC7280. In that
> case this would be moved to the SoC DTSI.
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 38edaf51aa34..6a4c6cc19c09 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -601,6 +601,7 @@ mdss0_dp3_out: endpoint {
>  };
>
>  &mdss0_dp3_phy {
> +       compatible = "qcom,sc8280xp-edp-phy";
>         vdda-phy-supply = <&vreg_l6b>;
>         vdda-pll-supply = <&vreg_l3b>;
>
>
> ---
> base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
> change-id: 20230929-topic-x13s_edpphy-0e172498c432
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>


-- 
With best wishes
Dmitry

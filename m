Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852F6691186
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 20:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjBITpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 14:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjBITpe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 14:45:34 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131AE6569A
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 11:45:33 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id bl9so1101305iob.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 11:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tx7x78jzB/5TcK335na29BDCwW6N/hAYlq6Sp4YpsiI=;
        b=RZ3yuuESZOagfSBmS5EF9BxQF8Z6uzBibqMujT1Q2VYT/kbeqhgat8wvBSUaQmrsS5
         3LSQUloXf4nb2orTPziz8csXjYZbzsXrxwEShXVmj4GWoW/P0DQKs1Pp3xW3W6s9Fo8y
         i6goArMbCCbMAE7lhk59fFsiLBp5EtgqZJIzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx7x78jzB/5TcK335na29BDCwW6N/hAYlq6Sp4YpsiI=;
        b=AT6/r0qy8dQjbNshs4oxbuoWidaR2QypGdEoYlm1N2dw+9dLN6Sb18dnTfQZeo7xkX
         LgymknMuKZ8T1wD3nAwjUJXtIStsLNQHgTavvSSoTcSagRDtpWVtyiuefDXUhvX6Y8FW
         uguR8HMD2Q7V4hM19OprsIUa1lKj401cEG79EdH6lNoxDQAJeTa2n75i5zJfA7aUBASF
         5G877Sj6vOVa7bD9lT80hOBKurnHKYMJ5H96wnQ34CKZNmqbSvVDfq5c5s+qeCOhvIsr
         vIazWu99fRaQyG0TY7LAWlaNAyIkHzlb/4eNVjz5U2IYLlJdGeItbWzcNir6O37xOho7
         NniQ==
X-Gm-Message-State: AO0yUKUrKCDH/sNJ6tG/qt3u3jT/GLTvpmCo+8aUWjWqV3TRW4Ob/wsP
        hgkbXK5v5dfTNDGVpjQAchxhvg==
X-Google-Smtp-Source: AK7set8G93lun+KOXmMrPTB4I5i7w/4YIym7oI6fbFcw1C8vh2FLRyL91TcDy9MjGF5dHvdNY1Su1g==
X-Received: by 2002:a5e:a908:0:b0:734:8f86:b78d with SMTP id c8-20020a5ea908000000b007348f86b78dmr8497317iod.11.1675971932453;
        Thu, 09 Feb 2023 11:45:32 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id s26-20020a056602241a00b0071f4551300csm671672ioa.2.2023.02.09.11.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 11:45:32 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
X-Google-Original-From: Matthias Kaehlcke <mka@google.com>
Date:   Thu, 9 Feb 2023 19:45:31 +0000
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Doug Anderson <dianders@chromium.org>,
        Harvey <hunge@google.com>, Abner Yen <abner.yen@ecs.com.tw>,
        Stephen Boyd <swboyd@chromium.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Adjust zombie PWM frequency
Message-ID: <Y+VNW3ikQVgXK4VV@google.com>
References: <20230209102807.1.I3e1463cd0fb66311a269f2698d0767a2acfaac3f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230209102807.1.I3e1463cd0fb66311a269f2698d0767a2acfaac3f@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 09, 2023 at 10:28:16AM +0800, Owen Yang wrote:
> Tune the PWM to solve screen flashing issue and high frequency noise.
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
> index 64deaaabac0f..000f64d27ab9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
> @@ -61,8 +61,8 @@ ap_tp_i2c: &i2c0 {
>  };
>  
>  &pm8350c_pwm_backlight {
> -	/* Set the PWM period to 200 microseconds (5kHz duty cycle) */
> -	pwms = <&pm8350c_pwm 3 200000>;
> +	/* Set the PWM period to 320 microseconds (8kHz duty cycle) */
> +	pwms = <&pm8350c_pwm 3 320000>;

Is 'duty cycle' really correct here? The unit of the duty cycle is
percent, not kHz and it shouldn't be impacted by this change. I guess
you mean frequency.

And how does this change result in a frequency of 8kHz? Wouldn't it be
3.125 kHz with a peridod of 320us?

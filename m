Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B453B63E291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 22:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiK3VTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 16:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiK3VTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 16:19:47 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530478B1B1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 13:19:47 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id l11so25768643edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 13:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2ciZKFGb7wlsZU3hBpWnnJGAjRhKB6ThoGOD1MmZTg=;
        b=YyZZAgg9GfGJYeUSWxMKVAdtaJSDhQL1d0UyJ2GUUWo0DD14x70Nc2Uk4aNpZzQKcc
         epjbVSjkck3DvE5ruS0hdnw/PGmLapHLMTt5y14EOPPqfyZD46SlJPlF9qP7ZWtm52eI
         LLRgt3s20ISsVQSpIIW22HolxZonGZgCkYIrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2ciZKFGb7wlsZU3hBpWnnJGAjRhKB6ThoGOD1MmZTg=;
        b=tJEKGxd0vE3bMkJfPm8Z3+L2Q+vQpAzrhdmfYV8ASTSGwYV49h0qPiqmk/hzsqeR0r
         /GM6LWECDoDHD6+D8Z5VFh9//JzhKd6aMzlRNOmrgWiBtQKqNNLkoi45N+/IJsyFbVYx
         CacqM1AtqnZmnMtGUc70Xw6undgrG8WHXujuZ7m013xqd5nuoYkONbi7XobS+4GyIhfl
         YFn1LyLWSxtRcBNaW1couk8YCrxsq61Ffsk2lgw/nR+Y9zQt+l3RG4aqOkenxTmpg1A9
         oXbap4gzR9HsXCXsscVGxGAccNeIh1gKRkFbBNnQZPUQvlumkpzsFTMWNh2pdfDxRxxL
         +Q7A==
X-Gm-Message-State: ANoB5pkUQ9gxvRQsgHlDa9j4jWbC5ClyP9SYL5FauaIp5yS10XBLAWpM
        hkUvgM61H7MNPvEnY/F9IXHUI1/hm6hdS6uB
X-Google-Smtp-Source: AA0mqf44F6X/DM2og0NbOEFZ04JdYYmVp+OWVoQl7hOYcaYvJfv1I5W//n59r3G+144Lnq+a2PFn5A==
X-Received: by 2002:a05:6402:f27:b0:46b:d117:e5 with SMTP id i39-20020a0564020f2700b0046bd11700e5mr2363674eda.411.1669843185664;
        Wed, 30 Nov 2022 13:19:45 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id q21-20020a1709066ad500b007b6ed81deecsm1062298ejs.96.2022.11.30.13.19.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 13:19:44 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id w15so15975952wrl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 13:19:43 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr38939604wrj.583.1669843183080; Wed, 30
 Nov 2022 13:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20221130142829.v10.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <20221130142829.v10.2.I80aa32497bfd67bc8a372c1418ccc443ccf193e4@changeid>
In-Reply-To: <20221130142829.v10.2.I80aa32497bfd67bc8a372c1418ccc443ccf193e4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Nov 2022 13:19:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSLz6TLgdvzqdqi04C48gmqyRxVOtzWEdFmKQy9NuAOQ@mail.gmail.com>
Message-ID: <CAD=FV=VSLz6TLgdvzqdqi04C48gmqyRxVOtzWEdFmKQy9NuAOQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: sc7280: Add DT for sc7280-herobrine-zombie
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Matthias Kaehlcke <mka@google.com>,
        Abner Yen <abner.yen@ecs.com.tw>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 29, 2022 at 10:30 PM Owen Yang <ecs.taipeikernel@gmail.com> wrote:
>
> +&pm8350c_pwm_backlight{
> +       pwms = <&pm8350c_pwm 3 200000>;
> +};

This is in the right location now, but previously I mentioned that it
would be nice to have a comment explaining what you're doing. In other
words, I wish the above was something like:

&pm8350c_pwm_backlight{
       /* Set the PWM period to 200 microseconds (5kHz duty cycle)
       pwms = <&pm8350c_pwm 3 200000>;
};

If you spin a v11 with that change feel free to add my Reviewed-by tag.


-Doug

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0721647A07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 00:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiLHXd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 18:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiLHXd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 18:33:57 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E3C6ACF8
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 15:33:56 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id g7so1928899ile.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 15:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKD0z1maEkr8LN0VfjE0onCG1Voz2tMlAbquW+aI4PQ=;
        b=iSoc4pbq9Do4IAFoykJi1KZ7vMe8vtdeeGGq5uZtTBdEV1CaLocmDJjg8KfSho38xH
         1FUG5kP/1iOT51Xx8FULwhkyjdC4wCgFiVDjFbUNs0q3d7eAfTXbT+XahCwcZJchaBA4
         sfgOW3bGfdZnzBWHxO6y3ULK2wpIcwrF9V0mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKD0z1maEkr8LN0VfjE0onCG1Voz2tMlAbquW+aI4PQ=;
        b=pUXVf7YH+DCRYPeTus7aVnUwkAmiGj3vquxM5hdqbqbv8eIs9JdB4i/0JvYNSUz/N3
         ABSU+2dxMGqWJh1lPq3poevu3y1T0mrd8cb4S1IQ9UuwDfNaC5qF9Qp5FAXVns4n/SXT
         LVeZBrQefc8LFhCTP9gnTrc+0ITeV/KXTOpHqooYk63g0k9QxRuP94ittDB9iS+S8F2/
         BwKq7msXMN00j0Dy4jqNurZ0PzHe45fAxYk1mtF33rtfM7QJRBRDiTQIDSxVAKnYBYzN
         ad+d4br7elCVUEnipPDq3JFIZR9zhfo3D9KzluQoEdLKqqITxf1C+hiQUgw3V9gb3fOk
         xH8g==
X-Gm-Message-State: ANoB5pl3ld5mCOQpmAPVyRI2QnC0WtfqzPbjCh3vHoiudbdHFZAp9iFe
        Cm92fdSQU/IafZCJiY0A+JBCCQ==
X-Google-Smtp-Source: AA0mqf5dzgNqV8tMzXnKMA0Xtxo+nx2jWlFnmxrgaHS3Hl7qDg7Di+cWg4Y0Oa6P18edB25yxnAprw==
X-Received: by 2002:a92:4a10:0:b0:302:ab04:915c with SMTP id m16-20020a924a10000000b00302ab04915cmr2025685ilf.24.1670542435623;
        Thu, 08 Dec 2022 15:33:55 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id e33-20020a026d61000000b00363ad31c149sm9096965jaf.110.2022.12.08.15.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 15:33:55 -0800 (PST)
Date:   Thu, 8 Dec 2022 23:33:54 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sc7180: Start the trogdor
 eDP/touchscreen regulator on
Message-ID: <Y5J0YqLPtjIJ3Lpc@google.com>
References: <20221208192006.1070898-1-dianders@chromium.org>
 <20221208111910.3.I7050a61ba3a48e44b86053f265265b5e3c0cee31@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221208111910.3.I7050a61ba3a48e44b86053f265265b5e3c0cee31@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 08, 2022 at 11:20:04AM -0800, Douglas Anderson wrote:
> Now that we've added the `off-on-delay-us` for the touchpanel
> regulator, we can see that we're actually hitting that delay at
> bootup. I saw about 200 ms of delay.
> 
> Let's avoid that delay by starting the regulator on. We'll only do
> this for eDP devices for the time being.
> 
> NOTE: we _won't_ do this for homestar. Homestar's panel really likes
> to be power cycled. It's why the Linux driver for this panel has a
> pm_runtime_put_sync_suspend() when the panel is being unprepared but
> the normal panel-edp driver doesn't. It's also why this hardware has a
> separate power rail for eDP vs. touchscreen, unlike all the other
> trogdor boards. We won't start homestar's regulator on. While this
> could mean a slight delay on homestar, it is probably a _correct_
> delay. The bootloader might have left the regulator on (it does so in
> dev and recovery modes), so if we turned the regulator off at probe
> time and we actually hit the delay then we were probably violating T12
> in the panel spec.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

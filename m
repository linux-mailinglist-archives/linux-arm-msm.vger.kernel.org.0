Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC58C6F0EE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 01:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344375AbjD0XaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 19:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344400AbjD0XaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 19:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8210635BD
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 16:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vcFglKyPAkh5dZyTCVBzEYjy5B4nwQaUU2WoJAnQQj8=;
        b=BoJ1CwrGqA3mHui72s7iamQKl9YJKymMKtGZrJeq6u4QQ0TFir7Kp/emLbsG9kPy2J7iE8
        M69RHKhWKt7x69uzto75u6b9T7db1H/7sV/6LCUjfX6jV8bWj8n0WVD01tS6H02CXe8VRo
        59paOfhxl69/Tn58dVay6rdUgZqbzmU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-BYinkQ24PCejvou6rk53dw-1; Thu, 27 Apr 2023 19:29:31 -0400
X-MC-Unique: BYinkQ24PCejvou6rk53dw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-54f809d82bcso151696187b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 16:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638170; x=1685230170;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcFglKyPAkh5dZyTCVBzEYjy5B4nwQaUU2WoJAnQQj8=;
        b=FqzrhBhZvxCtzNkhpFtwg5Y6Whev5A1SymGvmKOH4wB7RJlebwuFTqtgqq2LtM1vBY
         QKw1stjKvrOdJ3t+/uwyeUx40FrcKiPv0H0nvvJQOGLTcE9n0x/yRKsZAAQqGjV7TU1P
         PjhLo2NPn4Kd/OQhatEpG4kkUPd6lLDEVGxhnQoN3OLEvTO6EyMmPQ1M3Wt66/qLtx21
         MLz+xmVuIKBGLog9+mgO/rBB0gxGLF1Cxz5iMQBAxjFoUfjmsmQggqBEU+usu4lnBXGP
         UEzn9zz5EcmXpA17+60S+c+a6spGi2EhWnmU8fizXmltgSo7M0opU4N9vBGb8KajM1o0
         ChiA==
X-Gm-Message-State: AC+VfDzR3g9LZ2bL5MyaV7Do8fumcB2hv6FD3xEK5rSpylzw1IymYtCh
        d1J0gdsqYxgKm/v61JqOcTEVXpHTO3YJg4s9DVvbgkJYEN9hMXoxT3nA2IpF8vneOIzK9c/X4HR
        jUKSM+HRITrmD602FbS7Kbxrd+A==
X-Received: by 2002:a81:918a:0:b0:54f:8e64:e47f with SMTP id i132-20020a81918a000000b0054f8e64e47fmr2532271ywg.31.1682638170524;
        Thu, 27 Apr 2023 16:29:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ745lku6BCkyNoeANYeFs9vOAsqe3xUvEdBgIgvnVsWRepS97b8DYNlJOko6WOTqcIXYs7QKA==
X-Received: by 2002:a81:918a:0:b0:54f:8e64:e47f with SMTP id i132-20020a81918a000000b0054f8e64e47fmr2532252ywg.31.1682638170263;
        Thu, 27 Apr 2023 16:29:30 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id d201-20020a814fd2000000b0054f8b7b8514sm5092922ywb.128.2023.04.27.16.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:29:29 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:29:27 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: pwm-vibra - add support for enable GPIO
Message-ID: <ZEsFV6F4CEh2/av8@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-3-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427-hammerhead-vibra-v1-3-e87eeb94da51@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 27, 2023 at 10:34:28PM +0200, Luca Weiss wrote:
> Some pwm vibrators have a dedicated enable GPIO that needs to be set
> high so that the vibrator works. Add support for that optionally.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Hi Luca,

Thank you for picking up this work!

> +	vibrator->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> +							GPIOD_OUT_LOW);
> +	err = PTR_ERR_OR_ZERO(vibrator->enable_gpio);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to request enable gpio: %d\n",
> +				err);
> +		return err;
> +	}
> +

Take a look at dev_err_probe() to remove the -EPROBE_DEFER check.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


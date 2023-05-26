Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819CE7124D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 12:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242203AbjEZKig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 06:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEZKid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 06:38:33 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C6FFB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 03:38:32 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso4190475e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685097511; x=1687689511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqVVAm/y1HoALh+s361erx7bMZgCxQRFgtpi/v1PaKo=;
        b=HJ7fBVJqCsT5R4//AmW9AScNLLApXJA8d/6S7+0FY9YgxHH74VnQpWwCehPoOdr0wq
         SQ2JuvmK7sm2lA+i+BrspdAKh4JaEWD2AzLV6FIjF2d7I7ARoWcP75ZGPe3VoV3TouUX
         IFsE/VaWeFtVv+mcA4umKZORliI1NLDFlPa8O/NLaC9owMTeCLNhJrzWzxkHyPF91Phg
         Yw13DjWeDFiBMeKO94urScZMETTyzG7JWyUSgr0OIbueJhL17ZDbdm8bGjcQLXcB5Ps/
         RB2Ey9BZUFnKYilXj0DM97vYkgULbKziaGJx4rJaRpxlyrTiwKssm4TGN1ASwks8GDMS
         VZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685097511; x=1687689511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqVVAm/y1HoALh+s361erx7bMZgCxQRFgtpi/v1PaKo=;
        b=UrjE6/8fWWAm4uylmSVWKf7/LAid8sCdi7GRAY9wvvVg3VSgfTvcsOlCag3avaYTLr
         wZTdJz0drfl4h2ttElonuNcvt3ME4W91+Qqx8lHcZ6QnWDfXZ3D9GLU7yAsSK91LxdHG
         gOtqAN6TVTUhssJ1yzH30BPBGk0jCuc29VNqLdtcgXgy+q7V/i7g6ipR3z2VoMtDyVxN
         UCEGJ45BKglpQPzoBqqxjudp5tSQoWQcoyLByJ+rjek8ePIauoaSGlO081wLuIUCYZWd
         amdwKtpdoBUbcxE94QFhZZ+Yvvt9XRHrVN+zKWayTzgevG4/eGbTVVCaCAg6umilq57f
         8fCA==
X-Gm-Message-State: AC+VfDzq6GQTgApsSXFRijNRlTf73coPzM/9u32VANOrO24mS6vb3c/S
        eZrDKLJX/jwq4zVmLQfbH/pUqA==
X-Google-Smtp-Source: ACHHUZ656Zt2yUkAzWvrDGzkUWXOvr37WPMqjvtf1rRfMMcu9S7heLTHhVOVYRLwpW1FUroNPr92DQ==
X-Received: by 2002:a1c:f40a:0:b0:3f4:e853:6a1 with SMTP id z10-20020a1cf40a000000b003f4e85306a1mr1350782wma.38.1685097510904;
        Fri, 26 May 2023 03:38:30 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id x4-20020a05600c21c400b003f0aefcc457sm8460239wmj.45.2023.05.26.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:38:30 -0700 (PDT)
Date:   Fri, 26 May 2023 11:38:28 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Helge Deller <deller@gmx.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Luca Weiss <luca@z3ntu.xyz>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/4] video: backlight: lp855x: get PWM for PWM mode
 during probe
Message-ID: <20230526103828.GE626291@aspen.lan>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-3-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519180728.2281-3-aweber.kernel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 19, 2023 at 08:07:26PM +0200, Artur Weber wrote:
> Also deprecate the pwm-period DT property, as it is now redundant
> (pwms property already contains period value).
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

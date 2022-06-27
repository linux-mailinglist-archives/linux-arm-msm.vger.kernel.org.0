Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28AF655CEF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241015AbiF0UEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240864AbiF0UDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:45 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFCA1C93B
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:44 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id n11-20020a4ad12b000000b00425b01c3326so267306oor.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gj94jlKC6hmF1k0MguHsf5YQmPWRXBjppP7HpGrfnr4=;
        b=dDRN1qevxaeyjCOrx1h+RyLv2brFKFENNGI8zZHgLtdqU3xS6l7XbDXrzJM0U4QUqT
         KNT/thQ85lj4PKFptqupOCaCUZVBZX+mbyRGZw75jwfZv/QvyneHWncPm6DSSsDxxqT/
         rFgeNUYpvkpvrjeZOJjoAi44g7nLOE/gTDMrd9CcmzFhLpYBhgVITJL4oh1Y3Zq3tQJ0
         0wg+fGQEN9DB2Bj/kUudVpg0G/t5DcZUpSYE2yIyaGdlgpxeFwjUNDiP3qLYXN/Dbh6R
         RnSUyTDMPYN/lOSvYVAuNDZ8U4kYwrNGd1oS2sEHGffbLGO0wmHA++vZD6xYtXsM7hHm
         1LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gj94jlKC6hmF1k0MguHsf5YQmPWRXBjppP7HpGrfnr4=;
        b=ydgI/UkzVc6IHBhIVoQRBLfQqsNBWUKxTH3q6/j8Oa0Lj4/f0ppUueedKYgh2Jwydt
         6oZicZHgZMSBBUAghrSXd4+9ydbJut20DF1ukQ/ogEOR7rGFCM8jVSNJquE8Htt0YNHS
         /vopgNPpmXQWITsEyEhnHTpkhEBym6l2guveyBI7OpdWSwZ+WLMXaEGMre7kYX0bOdz7
         K8rjez1yyAIXVJgVBpUZ10wHEzbthOWoLW7ooGtjGt+UFOErM1Gm1+b/wIPxQx1/61eb
         gmEsogJq96pSXDCmAg5wDGKAQlForh3wh6xpUeFMKSOiYf0nNmG7ht/XmZ+N9ImwGEmI
         KWfw==
X-Gm-Message-State: AJIora9Wi9q1Wi+38CawluZ1LxplAGsYe+f8/NMTV85BnCiiXNUMZhVd
        HjlsDa7AFuH0iECwehsdiJFTNQ==
X-Google-Smtp-Source: AGRyM1tYrfIHTmIiIdujCndNAWXrywhkv7NOPnrSqmRkaZgn626fU1wCJz+c/Jazz/QHPQUT9n/+SA==
X-Received: by 2002:a4a:6518:0:b0:425:81ce:3ba1 with SMTP id y24-20020a4a6518000000b0042581ce3ba1mr6531005ooc.59.1656360224449;
        Mon, 27 Jun 2022 13:03:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7280: herobrine: Don't disable the keyboard backlight node
Date:   Mon, 27 Jun 2022 15:03:00 -0500
Message-Id: <165636016347.3080661.9093137799641920527.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220523123157.v2.1.I47ec78581907f7ef024f10bc085f970abf01ec11@changeid>
References: <20220523123157.v2.1.I47ec78581907f7ef024f10bc085f970abf01ec11@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 May 2022 12:32:03 -0700, Matthias Kaehlcke wrote:
> On herobrine boards the keyboard backlight is controlled through the
> PWM LED driver. Currently both the PWM LED node and the node for the
> keyboard backlight are disabled in sc7280-herobrine.dtsi, which
> requires boards with a backlit keyboard to enable both nodes. There
> are no other PWM LEDs on herobrine boards besides the keyboard
> backlight, delete the 'disabled' status from the keyboard backlight
> node, with that boards only have to enable the 'pwmleds' node for
> keyboard backlight support.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc7280: herobrine: Don't disable the keyboard backlight node
      commit: 426e81c7e6250723eb37c8a05187e28eef17484f
[2/2] arm64: dts: qcom: sc7280: Enable keyboard backlight for villager
      commit: 1a22eff4b429f9da9e4259d019cc809ba7b4593c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

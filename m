Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A4C660383
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 16:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbjAFPj6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 10:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbjAFPjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 10:39:54 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A0A7817A
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 07:39:53 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id t17so4286294eju.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 07:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKfo3csM5YVpm75Odrr7cMYcdrBI/spn1my7oe7Ikhk=;
        b=aMXO1CFuuhMbogRgkJFX88/S6oG0J6Cns9rS3tuzXNwyooe8y7VtdhnsH0f1Xklf3Q
         6OvRQAiIsU8YLdFhL9r1ysjJVS627Kllc78PLNS/xfETEFGXbSy4jJ+48Ss6yCGxoKn7
         ANFtYuUJNsy5l6K12I+uDtvu9lvo33ULFb4beAX37Ap+kOcz0COxJTmAyWOAu56Pe6HP
         zX/3ypvDw57k2r/j8RM8SYMw7DiWVRvFmYXVEFudA5gd0XGLrBDIkGWEAwXBip8jNoXh
         2WxTR/JG45mnxRyiHECJynbk/giIWy9thxecbWjAfwcSryc7kuLLCbD7ntboY3EFsIw2
         UdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKfo3csM5YVpm75Odrr7cMYcdrBI/spn1my7oe7Ikhk=;
        b=THcviJaTMvR8rEQX6fUK5GN4CPK9PXo14x0xo7uS3AH+Jbjd9+6W/Sqh9utfbxiXPk
         CggDSPuOuhYWNSjJbe7e0suceje3CMJb81Qh2Wxh1RlKnpcaZ0219PLyIp0OXSFXj4Wl
         OmYUttvWpnFGJf3SQwXDZeV+VvS8lLhBKoQFXMkO7lrrjhDOVKkT24bILK4lfXWv2Z6l
         FHcLZAhLD1PI6/7SQAitt3cWRRE4llIh8PVIJxXxFJ1HpK5JaLXsoLxIFOxzGX6h0QUZ
         4CMZ/TaAWRj/8Qpv89nnl7GQQ0/mUQgFZIkBIGJbUmVo+vRWjgcxWfQadqXkNMnJL+4h
         84Bw==
X-Gm-Message-State: AFqh2krxGY1dk7wOMYrvxGwz1f6KKydaikz1tNrG8uPwAinLE4ixOv/g
        lPzzzWGgPuzUhzGw/z1GFNA4xw==
X-Google-Smtp-Source: AMrXdXsOyRUDY8eTet0D35T1l5K8RorTnSSAlMJKMff96LiunHit972nEL9f6APpfimuB2JpRWEMOg==
X-Received: by 2002:a17:907:c386:b0:7c1:31b:2181 with SMTP id tm6-20020a170907c38600b007c1031b2181mr50124974ejc.19.1673019591602;
        Fri, 06 Jan 2023 07:39:51 -0800 (PST)
Received: from [10.0.0.3] (217-149-174-217.nat.highway.telekom.at. [217.149.174.217])
        by smtp.gmail.com with ESMTPSA id gx8-20020a170906f1c800b007aed2057eacsm496235ejb.221.2023.01.06.07.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 07:39:51 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 06 Jan 2023 16:39:41 +0100
Subject: [PATCH 1/2] iio: adc: qcom-spmi-adc5: define ADC5_BAT_ID_100K_PU channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230106-pm7250b-bat_id-v1-1-82ca8f2db741@fairphone.com>
References: <20230106-pm7250b-bat_id-v1-0-82ca8f2db741@fairphone.com>
In-Reply-To: <20230106-pm7250b-bat_id-v1-0-82ca8f2db741@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.2
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define the ADC channel used for battery identification purposes so it
can be used in drivers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index 821fee60a765..8c33da9de257 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -543,6 +543,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_XO_THERM_100K_PU]	= ADC5_CHAN_TEMP("xo_therm", 0,
 					SCALE_HW_CALIB_XOTHERM)
+	[ADC5_BAT_ID_100K_PU]	= ADC5_CHAN_TEMP("bat_id", 0,
+					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_AMUX_THM1_100K_PU] = ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
 					SCALE_HW_CALIB_THERM_100K_PULLUP)
 	[ADC5_AMUX_THM2_100K_PU] = ADC5_CHAN_TEMP("amux_thm2_100k_pu", 0,

-- 
2.39.0

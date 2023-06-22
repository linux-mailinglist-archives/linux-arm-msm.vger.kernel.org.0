Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3177393B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 02:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjFVAUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 20:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjFVAU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 20:20:26 -0400
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8C6A1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 17:20:25 -0700 (PDT)
Date:   Thu, 22 Jun 2023 00:00:30 +0000
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FNip5Xb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1687392041; x=1687651241;
        bh=woxRHx54bL276MtNal16PQ45VdaC3OFmLaUw4jNYEoc=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=FNip5Xb7W0zfTA2gP5Bi9lkOSxNebYjJj31a7MzBfn4f6J2LzE+co4XObiO57+YJL
         28c7CBVQkDOjDEZh1tEwa3NlvX8XuOr5/fTU4duXzlNFlYz5jbZAj7blcVwPdjkpmx
         4Uv9wgnTfU124YQJcpdcNd293lJr9Yngt9gqH+EBCzibMHkkFF1GStQ50MWAbzwyH7
         FBrRQDm/l3nTYXGBdyfVhhibOrZA7VU8XifGXcXtnEjI6QJ14GU9TWEh1z5o96a9Np
         aMu1S1/LUOpkDTBeZMbmAvw+lpeS06elqBCVM+vli8WvDgvAsAjyyhDOm4ve/UpS/y
         PX04P+SG037zQ==
To:     linux-kernel@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, soc@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add initial device trees
Message-ID: <20230622000007.48219-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Samsung Galaxy Core Prime, Grand Prime and Ace 4 are phones based on
MSM8916. They are similar to the other Samsung devices based on MSM8916
with only a few minor differences.

This initial commit adds support for:
 - fortuna3g (SM-G530H)
 - fortunaltezt (SM-G530Y)
 - gprimeltecan (SM-G530W)
 - grandprimelte (SM-G530FZ)
 - heatqlte (SM-G357FZ)
 - rossa (SM-G360G)

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART (on USB connector via the SM5502/SM5504 MUIC)
 - WCNSS (WiFi/BT)
 - Regulators
 - Fuelgauge
 - Accelerometer and magnetometer
 - NFC (except fortuna3g)

There are different variants of Grand Prime, with some differences
in accelerometer, NFC and panel.
Core Prime and Grand Prime are similar, with some differences in MUIC,
panel and touchscreen.
Ace 4 and Core Prime are similar, with some differences in panel and
touchscreen.


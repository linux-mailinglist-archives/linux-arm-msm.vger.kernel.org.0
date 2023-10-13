Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2014C7C8E90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 22:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbjJMUxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 16:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjJMUxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 16:53:41 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 13 Oct 2023 13:53:40 PDT
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de [80.67.18.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C385BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 13:53:40 -0700 (PDT)
Received: from [92.206.139.21] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <git@apitzsch.eu>)
        id 1qrP98-0002ny-0b;
        Fri, 13 Oct 2023 22:52:34 +0200
From:   =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH 0/2] arm64: dts: qcom: longcheer l8910 and l9100: Enable
 RGB LED
Date:   Fri, 13 Oct 2023 22:51:35 +0200
Message-Id: <20231013-bq_leds-v1-0-cc374369fc56@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANetKWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Nj3aTC+JzUlGJdgxSLRMskQ9PUZLNEJaDqgqLUtMwKsEnRsbW1AG4
 aLYtZAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.3
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the driver for ktd2026 recently applied to linux-leds[1], the LED
can be enabled on longcheer l8910 and l9100.

[1] https://lore.kernel.org/all/20231002-ktd202x-v6-0-26be8eefeb88@apitzsch.eu/

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
André Apitzsch (2):
      arm64: dts: qcom: msm8916-longcheer-l8910: Enable RGB LED
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable RGB LED

 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      | 51 ++++++++++++++++++++++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      | 51 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)
---
base-commit: beb63bee4857fd3661305eec8888d025a7c26c56
change-id: 20231013-bq_leds-0d8a9b15ec6a

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>


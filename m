Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 853C16C8EB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 14:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjCYNv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 09:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjCYNvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 09:51:52 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89A0149AA;
        Sat, 25 Mar 2023 06:51:47 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PkL8v5QV1z9sZ1;
        Sat, 25 Mar 2023 14:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1679752303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mJrkeajSbPmUTlnQcK+oYCWNNZwdbEPrtpC9LjWx5tc=;
        b=1G64lqDzuTp8F6gZXdvDNTrBOG7skFONfDAU8GnkwSoOmsFTVB0Kq1pzke/SEUPwP9TLWS
        kpJRwlQWqC8PUzDd+iRxlyW04jRl2La3tGBma4m/EYcdNQvPeiJyrUyvIJv/hD4yQXbp1h
        1ZecPwCKH6vVMpXkbz8szSWHNwaRFAFxJq8XXFG6FzOD6Hg96TjWjfNIP/li7/zYXbduoT
        lo63yTEH1zQQ6lmUJYwg8FZo68aeR4HDL9Qfqx6AnTrf2JwIVnN6R73NU1Un0MkzXBrpX2
        fLJWuF8x5ywzwyuDE/BQxHi7lGhoNFXqZaCp155Vq8BrJ1hTwYCWvX+Z9Zr/1Q==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH 4/4] dts: arm64: qcom: sdm845-shift-axolotl: enable SLPI
Date:   Sat, 25 Mar 2023 14:51:14 +0100
Message-Id: <20230325135114.21688-5-me@dylanvanassche.be>
In-Reply-To: <20230325135114.21688-1-me@dylanvanassche.be>
References: <20230325135114.21688-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PkL8v5QV1z9sZ1
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the SLPI DSP on the SHIFTPHONES SHIFT6mq phone with a
Qualcomm SDM845 SoC.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index b54e304abf71..66d1cac6c515 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -501,6 +501,11 @@ &ipa {
 	status = "okay";
 };
 
+&slpi_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/axolotl/slpi.mbn";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.39.2


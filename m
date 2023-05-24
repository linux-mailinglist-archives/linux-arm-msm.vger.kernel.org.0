Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0B970FCD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjEXRjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235540AbjEXRjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:39:10 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55947122
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:09 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f60410106cso9959285e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684949947; x=1687541947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFRpfOgAemmobrPyj5/6+5l5ZSGSv9HGDmWDnbrjeGI=;
        b=o43bHwJTVhFwhegLH1AWD+ExeObFKxgkmYvQjhUH4jqymDaoiyC6Oga33WNk6DQtgL
         aWFVYNwXscZvIem4sfnMJygP28lm+qYaFNq0fEAkiYOXnkOhS+2uTjw+HA6ffE3TnHsF
         Gm3/pw5kCAs3d/3VmhnODQhLfNEj20pbVbZ7jGCq8YZoP6DfMIui3EohJ9TUMOh8SMqL
         2zl8dz7Qhn9idsz0u6VhKWVFlMGmg03VVo73GzNauDHOI9sbrXPKlOPRDf4lEo5w2GnD
         ilUX6Nfg4g4eEaAXGWQj7Gg7mFp3+YP2S1vdVQpfy1uz0ObdRy02SaQ31rFkeTSnDKhm
         GPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949947; x=1687541947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFRpfOgAemmobrPyj5/6+5l5ZSGSv9HGDmWDnbrjeGI=;
        b=asMqdtMkqFlWxpokwKBbB2jy++bq0IWjRMCNinzTUvNDUAGvIxjRcP53mRH6Wgj17Q
         WoBLHIT3caB7uUokIJM6bRsRr5nk6vHNmWcywLnj9x9U//0w1I09vzExth9r5MhZkc7f
         yTaQdIs/yeqHR14+VvSH9TbTpNPn+NSdYEF/y7dDEWbXEQn3V7Fnb2aGS/jQGf1SHLT5
         q2iLFXqcqujwFqvH0J3DpKb0Unt76IURwDipnRYv59cgyVwTtOZnFr8vYUo0/ocpArAk
         MJvfIAy00RXt1Hmj5BY9eC9SrY1G0QjwrG1U9YcQcjsjTo2BNMRH8upB87KDqKMW3V+c
         xTXA==
X-Gm-Message-State: AC+VfDxNoeig7yu9B4RkAqQG2bunkBQMhEZiWdwZyvGAFD12FKil7Y9i
        FHsarSRGSMSDpC+xJSZbUDQ0SE0A0jrKUjQemyTNEQ==
X-Google-Smtp-Source: ACHHUZ4iFybeQrsZ+JMvAZvBqeQKewZ3WRIkvssf0mWHctBFt2dBfZLDMilLnAGsjFtxHwUFmzc7QQ==
X-Received: by 2002:a7b:cd1a:0:b0:3f6:8f5:f9ee with SMTP id f26-20020a7bcd1a000000b003f608f5f9eemr395095wmj.26.1684949947204;
        Wed, 24 May 2023 10:39:07 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc451000000b003f4fb5532a1sm2993053wmi.43.2023.05.24.10.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:39:06 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Wed, 24 May 2023 18:38:56 +0100
Subject: [PATCH 5/6] arm64: dts: qcom: sdm845-shift-axolotl: enable pmi8998
 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v1-5-f9334afc4505@linaro.org>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=c0cAnT6j/U4OJJbr0Wl5brf37cZLiHaOow4CrkWfhbY=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkbku1umekLdHjw8bIs+aMGv9ctSrY9Nqh9HcSO
 NJ7+qTRxWKJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZG5LtQAKCRAFgzErGV9k
 tthBD/0crRgaEynYAsNVQj7qHYTajULPqAjtj2SYQr/pGzyJTpPzcL0q3wlIvbT2nWH/QgKIN4t
 Ek2kNG8fxMYiPP3i02nuSjPjiKEzFg0SP6pOVkg/CZqcXywfbXhjLtvc0ENvyiWJlq316uV/gMh
 +U5yU4xaUSGdiww7GiUaKBSidLrcJwC/eyS1b8wzqazLJWxuf8cFShelt2YEcLgfUdf89efwSfP
 CSjSIVfsOmOgoYJYAmB5UwccjxqLviP9FZOdj/TmaTh7dlBsn9Q47JiFSUQd3K/iKeR+fnBcBns
 BM6Y+ZGd89rl97rr5YKwvir7VaeTROb+Mz8Eh7WGxTNwD3QnHHhcGpFIS+WEHuyT6vPzcaXVE2x
 zT6/iZU+tV+as03M4VQXto4A+x2AYOko6M0AhcqMMndFGO6qjhKcvvOhx6FrKWcV3LmhM7ns/hz
 qhFL60Db9Vtbk/+OE8lEh4ptP1AW/oFilUP+DhhuJDZbO+rT73BAWUxdo+xVOfVFRJyV4FUGBWl
 9Atnv6e5wI7nD3iB7rigUIbb821PXAPyuafmepdfYLKm/5w4ZOtnUbJuI6zSo4LjwfTQiM3npft
 cNvf98cF20AlQVNCRgnVlh468Ayxx0BGDsdav9yR0kEtzyvx6V1645M4HudDFLi4ecbP27Env8p
 ZNFiilj2NfP9NLA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the PMI8998/smb2 charger, and denote the secondary SMB1355
charger which is used for parallel charging.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 0ad891348e0c..bb0f55c52a95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -494,6 +494,10 @@ touchscreen@38 {
 	};
 };
 
+&i2c10 {
+	/* SMB1355@0x0C */
+};
+
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
@@ -522,6 +526,11 @@ pinconf {
 	};
 };
 
+&pmi8998_charger {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.40.1


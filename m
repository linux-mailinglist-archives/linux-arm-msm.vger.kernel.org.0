Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABB0712F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 23:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbjEZVu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 17:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237968AbjEZVu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 17:50:27 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B70135
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:26 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6d3f83d0cso12941945e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137824; x=1687729824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbbKXkEwNc8+Wi+7L4Y9FUnUfGWKREA2C+RjRq+6R1I=;
        b=jebmOqrKt2pcISZSGHiZwykJv1ftJHZVHf3oqTOzuOA/bet9cpxKVCzOVy43ShLMVH
         LqgdOh+Wb3duTANx6H2cZDSlEkcw18mvLZGUCZQSnWWnmXBKVP5nA0NGoFbXNt7E32BI
         pAFp3iEWj1yNVbXGeP67nTxwwb9QPkBDVEeWNzNECa5JNlFPH5SDyzO/ZbzxMBMbzTnZ
         V1YgGVx/qQEGZmjVjRg3yO0S8YYenlySM5yAp1RCaL2/IciMWIXTRq6oyAhTe9ug7jbu
         rq74Qzjd8NHCITiDZzeFCO/7o4HfWzhrpP9lyPv6f/pLCizKh/eENi0+CIjBO7VbN8vc
         iqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137824; x=1687729824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbbKXkEwNc8+Wi+7L4Y9FUnUfGWKREA2C+RjRq+6R1I=;
        b=BCOm5qsjgBxk+Htoi/DkIDfuQ9ZLmQeGjEd7/gkF6+tg8U5kY8kfJrCQfg8Z/B6+0Z
         za2K5SeCmllMUnClq+gRIeW/kTAalUHw4E+GqBW0/qTdr9f7rJ0dTg4RpFshf5SD998x
         R8HVBiSU6Y2naWPYU97gEHzMlbiesOyVvOJv9kCJlEqBme/sxtImLd9hAlAltENB5LJP
         q7c/+e2QHuYJCaWnu+ZGgTnB+YYe0vBdvBUnaOFA6Oow2GjjKCj41vWKl3khP51drMOn
         x2lw6fcZFmKPRyg4cdmSQcNoDMZDYLEw4rrpHJCwWi7TI7pql8jI0EEJ88XXd8FboTLI
         A/zQ==
X-Gm-Message-State: AC+VfDxPPtyspBeKqM84FWBFAgEzGscJqKWpSttC4bzCYjOsXJ1Tj/Oo
        43DRyMIUD2cHoc+o3h+wMQ6wFw==
X-Google-Smtp-Source: ACHHUZ61EpRUrODQNdqOsDPr5voBi3qNDTxvf7SK+DcehCnjCW/wnFf/3SpXviRBgSY2smFQW64J3Q==
X-Received: by 2002:a05:600c:2141:b0:3f5:fff8:d4f3 with SMTP id v1-20020a05600c214100b003f5fff8d4f3mr2773445wml.7.1685137824477;
        Fri, 26 May 2023 14:50:24 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm6294314wrm.6.2023.05.26.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:50:24 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Fri, 26 May 2023 22:50:23 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: sdm845-shift-axolotl: enable
 pmi8998 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v2-4-2a5c77d2ff0c@linaro.org>
References: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=2/Cc6BpYgqPsrx9w4jVR7e8BD1UNIMng3Nd624AJy8g=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkcSmcOjg5t0ENlODajWGoR5qw9sEEiSaWJnStn
 3T86SsDMhyJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHEpnAAKCRAFgzErGV9k
 trS1D/9vwhkTOZpbZwWTaRjEHsFDyVCHjfytKTRT63TO6u9GsW8XnFhw4T5br0kMVRvGEtqwz8b
 Qr+QgYup7s1Hzqd4tskC3zh5tG5xhOEb7UP8ubRKkJxTnju2T4UEba9rLD5ElRexlW5qr3YIykn
 Vn5nzCx+2dVmKRUmS7DAHb1UTM5+2FY93uVEME8hlCiQ5HEmUvtpbC+/mJIy8TzIPfsg2nEUVZ9
 Xpk0tPdUJRA9OCeUXGNP5hkdRZrukNcz7g2k7BS/+GybXdPEddLyBQALTToWHTGp0mzON5yi1au
 zShiB4/wSEom4APXhnRBp4QI7P6snSibEN3mt4fjXwv59sYjot8iUJLEmtnR5H6LzsT/ekRWzVq
 TUaxb5EihMxOL2BEXNPwjWtTaAmvFhfkvVH6rQx62sZc0fu1FneMgl6QdnlYb2EFtQ34doTOBfd
 k9si0YzGNwdXFcK39zOAaarwSDNf7lTekMEqoEQpjjnGL+rcXWDDiDjUIOiGX9Zl+/bwDElEJjL
 li2LArtTY1fu4MZc5A5EmeqKkvWhv9xkTQXCiBCs+9Wfoch4pwjgi/gn7407+ufkakz0BLt7ID4
 ja//NpWf1mXMk9qOxi3OpKDE2/tYJXU7fBxV1X0po1KLm4+YscZ/uBB3XUc49pslbA5JMRSe4ip
 bGWlcAy6NLz0Bag==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the PMI8998/smb2 charger, and denote the secondary SMB1355
charger which is used for parallel charging.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 0ad891348e0c..de5f26fb780b 100644
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
@@ -522,6 +526,12 @@ pinconf {
 	};
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.40.1


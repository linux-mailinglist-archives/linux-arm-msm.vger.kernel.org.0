Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE58D7A9E74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 22:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbjIUUBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 16:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjIUUBS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 16:01:18 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463812D7D
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:27:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1465195a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695317271; x=1695922071; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wT6/A5jKUKPNqREpSjfwwNBvJsp9RJseHUsd7KRCJ5w=;
        b=gyV/lhnmx5CuA3fYvXtheidQdtg9BYmFIVJIDgKUy+Lq2/ezJrQin0F8a8HFoNFwZR
         LuRu65oQgPJUrd/vtNZo4wPL98FCE3xVpUtXt+c+0SZ1l6pjpbc5Pm3IWuhjB3G7I5hR
         oQaWhqfCRqmzJSPdDeoW4N58NpWbC51SbsZIo5cAHvZCQpF7+diPH+hSKhV4/Xz3nTTY
         tIiQjN3UCl8agJ7zPqhKvNyg5sc6gvn56eYsbhMmrz0Gfi2t2NXqNcOt1qNPbqKSMT2v
         uPBPfIK1QD6JpiSJgyTWwU/v19tqX8CPctmLDr718UwQjYUFxsXwa1Nw+TViD9qPyLfV
         f8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317271; x=1695922071;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT6/A5jKUKPNqREpSjfwwNBvJsp9RJseHUsd7KRCJ5w=;
        b=mX9SSqNds5pYCBd1bQpoEf70MHrGMKCZxsH2cKthokgxVkwiPsLsnuAwrRhTYfP/hN
         JRtKXsOICdwEeIXjleZ9fAk1tllIoMUmMfbrWA3sWQaWJOMB0cUHB4C99JjPPCEMMore
         W01c7Afb4h7BLECYGwPiJd8xVujC6NzX5cWAUvcVmskN0yN90r1ew68jtfEfKxAlfnlh
         dJ43ErHAHz8227zTw34T9zk8wOoYspfzE2f+T+pj4wzkXq+WTvNa3KmCr3Nfwdz9AYQi
         RQHMRTvquGAIsGzU5azpnN9HRkxYJkCyW7gS79e21HpEDgnllBVsnbS1pt9JuWxk2Zy4
         9Gyg==
X-Gm-Message-State: AOJu0YzcuZX/DoqEwHwcQEA8gYAjxw5UObO+JQhx+vEXNid52ujd6ttO
        wnUfg6+nP+TrPWH4pDFwPFvD6riEhkb7sHGbWpMGsg==
X-Google-Smtp-Source: AGHT+IGieRqnzeLuaUx6Ie7RXs8JxfkdBUmowjxYl2mDxddATi1AGsiIJ7LQSmc6+cCJVTz0fUr3Aw==
X-Received: by 2002:a2e:8696:0:b0:2ba:18e5:1064 with SMTP id l22-20020a2e8696000000b002ba18e51064mr3815918lji.14.1695278048481;
        Wed, 20 Sep 2023 23:34:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z25-20020aa7c659000000b00530ba0fd672sm367971edr.75.2023.09.20.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 23:34:08 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Thu, 21 Sep 2023 08:34:02 +0200
Subject: [PATCH] ARM: dts: qcom: sdx65-mtp: Specify PM7250B SID to use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-pm7250b-sid-fixup-v1-1-231c1a65471f@fairphone.com>
X-B4-Tracking: v=1; b=H4sIANnjC2UC/x2MQQqAIBAAvxJ7bkFXJOwr0aFsqz1kohRB+Pek4
 zDMvJA5CWfomxcS35LlDBV024Dfp7AxylIZSJFRjjTGoyOrZsyy4CrPFVF5Y73x1hlNULuYuIr
 /OYylfA4JhdVjAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the pm7250b.dtsi can be configured to be on a different SID, we
also need to specify it for this dts file. Set it to the SID 2/3 like it
was before commit 8e2d56f64572 ("arm64: dts: qcom: pm7250b: make SID
configurable").

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index fcf1c51c5e7a..9649c859a2c3 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -4,6 +4,10 @@
  */
 /dts-v1/;
 
+/* PM7250B is configured to use SID2/3 */
+#define PM7250B_SID 2
+#define PM7250B_SID1 3
+
 #include "qcom-sdx65.dtsi"
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <arm64/qcom/pmk8350.dtsi>

---
base-commit: 7fc7222d9680366edeecc219c21ca96310bdbc10
change-id: 20230921-pm7250b-sid-fixup-0c35c3c59312

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


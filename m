Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150EF6DFFB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 22:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjDLUZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 16:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDLUZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 16:25:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1BB10DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 13:24:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m4so16090052lfj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681331093; x=1683923093;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQpLZPwYAr7J4pjpU+otFF+825ZuxpGaiQlHVDDWCrA=;
        b=f4ceRHJKPg31tbTgwQ7jSj8xYhhxnW5hdMh20vb9jcVgF9G7dAkytBlQ1/RvDXfJSB
         OUB0Bdqgoqt4L+6CvMLtEmDrq/78ckm9Fk5M6+lZts3l5kNzn+CGF3Dt/gr3w/byKwxq
         bzh97ycBqdF8Q0KQDU/7tfCK1wlKt5iyk210iUQKUFjSWWgXKYNvr76LgZbhdK37uCWT
         +pp2i1rTbuxzpVJ3+n8kpzBneOvmsgnw86VSLbJ53HK7gtXMmZsTahUvTA6ibLTaANpB
         siasp89Jc8mSQuAT8SUVav/lTmv48yFNcyVNftLwCq+u0b39xpMcISfIBb5eGadn8wS8
         umKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681331093; x=1683923093;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQpLZPwYAr7J4pjpU+otFF+825ZuxpGaiQlHVDDWCrA=;
        b=evPghcLhBsGdFoeGsciNe+Utigs5j0dc1nFhReqbwPRFJ+Sv8NQEoTLa8+iJgKGk2h
         PWLTUcpQx1U2a1MGEhU1X4C/gaclXL/vnb1hOvn+AG92g9/fkNGhQJezUKmEpWh6Qtk4
         eyjSndbqO6Ntl+nYiroD0ScrIfv5L4QeXniwuGLYvVNyTWyhWI3SU6rFojVkIq6PnJVY
         61GapXdHGJR6MRBYDNiVo42v7PdN7ViEo4OwWmmw7bZ0QVYxUY6Yz5AvF05qVbArfyL5
         Ly3AEsVONuCenrVbiSw64HTzDgQGTVN4tmJr1bP/35ueFGA5G+e77E+F/7vS63caxKrj
         y6PA==
X-Gm-Message-State: AAQBX9eT++QMl3dl/mavnocgNrG6pg3eIfgv0pMz22Z0BSTMLNhD2iL9
        a7Zd7t5pp2PWHvQ00iQuYMwEmw==
X-Google-Smtp-Source: AKy350a/Hfc+0A3kfMGztZS4FUJ+0O90lFYaVyvpHvn74jjpVYDhJNWb8JxhbQR+RaD01hXSO2Vlxg==
X-Received: by 2002:ac2:4c3b:0:b0:4eb:1495:44ee with SMTP id u27-20020ac24c3b000000b004eb149544eemr26950lfq.48.1681331093088;
        Wed, 12 Apr 2023 13:24:53 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id r9-20020ac25a49000000b004db44babad7sm3139096lfn.260.2023.04.12.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 13:24:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 12 Apr 2023 22:24:51 +0200
Subject: [PATCH] arm64: dts: qcom: sm8250-edo: Enable Venus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-edo_venus-v1-1-bcfc82e0efc3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJITN2QC/x2NUQqDMBAFryL73UCMRUqvUkrZJM+6IGvJohTEu
 3fp5zzmMQcZmsDo3h3UsIvJqg79paMys74RpDpTimmI1z4F1PW1QzcL8TYOjFpj4UzuZzaE3Fj
 L7A/dlsXHT8Mk33/g8TzPH2X6NUNwAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681331092; l=896;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L4L5+07v1olBlp7mF4ECTmmAxe+VWZ1bMvL1gyV6LrE=;
 b=ZudwdKueUh7hYGWe3+JACwuvs1+aDkWJ5nNHuHnOIzYa0KB8oCtC5bppg1L2TbfmI8A5spFCGP6I
 Gmo84BXZDiSIgJcocBx9bC1bXoauQEVsKHXVAM4Do6s1vWEXNsZT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Venus on Edo phones. The firmware is signed, as per usual.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 2f22d348d45d..8d4352c8c543 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -672,3 +672,8 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p9>;
 };
+
+&venus {
+	firmware-name = "qcom/sm8250/Sony/edo/venus.mbn";
+	status = "okay";
+};

---
base-commit: 7d8214bba44c1aa6a75921a09a691945d26a8d43
change-id: 20230412-edo_venus-0863aedd0cab

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


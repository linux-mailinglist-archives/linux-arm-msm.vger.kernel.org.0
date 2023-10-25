Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57CB7D6A9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 13:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbjJYL6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 07:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbjJYL6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 07:58:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CD6129
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:58:08 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32d9552d765so4025860f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698235087; x=1698839887; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlx3leb/fOf20/ZSnP3M1ZG19ZufnWTKKnKwmqMVlX8=;
        b=LEl6/AS0JmSlxo0OHTSaBJsqTJZtqVBAFWFfYnDU07bsqt8j7/qybqKmkCuCWJ6aZO
         s3ZAfbGig3PJhpGAhCqn7lO3es/AH335E6ZUXdnqhD6owprSni32IqSb6/4iL6xW8k9T
         c3q3WtG7EYgRBCqcIGdxZbp076iwwDTSLhTsUg/oKrsYcdZpq0K3lUB5qSPQYkNIAK+P
         EPuFJDg4eQY3+jHOLkQr4SLdRpYPDxQFPvzbEkEK9/0ec/U/0HRq4NonO+hvtH+A+q+l
         mOlDqt/eWZPleiT/H7V15r4R13AXZBdQEg98jxVadzap6pxb60J7bMdZqMqrvYPM6ABg
         CDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235087; x=1698839887;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlx3leb/fOf20/ZSnP3M1ZG19ZufnWTKKnKwmqMVlX8=;
        b=YX2Ws0PABpJ8Fw5UXsl3C9o6688Ykch1hHiB57BnqGAtNVRX2jk0wdQ3aUGUuZZTJ4
         o4Tp5lW/XoTHt8M33iawMEkL+VrpfV1blFhzEln6zDPF/vpnrJegVm0a3/H8RanrovzH
         2iSj0KUiyEl11tiG+YWzHEQFVrWR9wY+jXiSEN9gfOb2A0jDg9YbBBNF9lTPGs42DPip
         F+mTLbSDU+foLPQhoOn00z2e7kwicXH+E+qJE1miOQZebDViDtOHrCG0JPHNL3ea43bR
         3j94Qo8f/58e9q1SUUG5IyAS+m07ifOxibiuFZvftVQu2oXxua+IPlfYDkRIZ5LOYqYT
         a3+g==
X-Gm-Message-State: AOJu0Yy4OXSTJKJy7Y82K40AzLLlf6e6p4TJ5+sKATY0JuMvIzeaFbqK
        /Y6nvCY9l54LFw3Ub7wSwA21oQ==
X-Google-Smtp-Source: AGHT+IG7RVzaj46OeaDK9gTP9047Bg8RMN0rUXMPc1LISeImHQ/gzRuxX3o/OgsmlbtdMindsmeqrg==
X-Received: by 2002:adf:cd0e:0:b0:32d:87df:6dea with SMTP id w14-20020adfcd0e000000b0032d87df6deamr11891398wrm.45.1698235087143;
        Wed, 25 Oct 2023 04:58:07 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d62c6000000b0032196c508e3sm11871721wrv.53.2023.10.25.04.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:58:06 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Wed, 25 Oct 2023 12:58:00 +0100
Subject: [PATCH] arm64: dts: qcom: qrb2210-rb1: use USB host mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMcCOWUC/x2NSQrDMAwAvxJ0rsB2un+l9GC5Si0ITpGaEgj5e
 0SPMzDMCsYqbHDvVlD+icnUHOKhg1JzezPKyxlSSH0M6YR0RKWIsxHWyb54vRTuOQ35Fs7gFWV
 jJM2tVO/aPI4uP8qDLP/N47ltOy0drnx2AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=zoiKtVHzLvhnPvwaM89PsmhcLzPbNHQwQeEPbjW6REA=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlRLprOFHvlrMkuzj2fuX7BFr1MlO0p+jVd19/zbRq0vS
 suMV+7tKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABOZ2MHI0NrtYRp04OKlg1vn
 tZjNffnye4fshxuTdrae8HGU36au1cPwT4U9X9dX2D7opMFKu40z9O9e6993S9i6T6SmzdDed4J
 5MwA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The default for the QCM2290 platform that this board is based on is OTG
mode, however the role detection logic is not hooked up for this board
and the dwc3 driver is configured to not allow role switching from
userspace.

Force this board to host mode as this is the preferred usecase until we
get role switching hooked up.

Fixes: e18771961336 ("arm64: dts: qcom: Add initial QTI RB1 device tree")
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1

// Caleb (they/them)
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index eadba066972e..f1961a07c9a3 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -366,6 +366,10 @@ &usb {
 	status = "okay";
 };
 
+&usb_dwc3 {
+	dr_mode = "host";
+};
+
 &usb_hsphy {
 	vdd-supply = <&pm2250_l12>;
 	vdda-pll-supply = <&pm2250_l13>;


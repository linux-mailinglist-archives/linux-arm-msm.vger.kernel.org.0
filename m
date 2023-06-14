Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1475572FE03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 14:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244524AbjFNMMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 08:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244446AbjFNMMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 08:12:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7338B2688
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 05:11:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so752571e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686744713; x=1689336713;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYyaAYoAiZPPWXaf4R2hKtCfO4zLm4oKoUYKWZFRm4I=;
        b=hKiVZuklWK+NqGpONCdITyK0/G4UuFam+X7VxpnSUQOb0cSzVtuweZOSizin1aXpu5
         YXqo3aoe5kakwvMHgsFLFOyznaBNV043AFcNXlw6/hfoI1oJysj+7Ru0908vxA7hVRb6
         CwWV1MeCQlICGJAsHGEDk+6evbQsVJ8eTx/LNjxwRx7wYXJploSbcDecoKlZ8BzLlBSX
         EdB5kHUro5ckRocl9aC1TDOo9pclvKc5s+Hd5wk3qgC8gDbQq70Hc1LMwr7jxoUQBVOI
         OXQ/sNZYv4P922CHV4LvAdpnregUcbgz5HJjvsqEnscv85bfBfhBlntxlftMgdl+KYtQ
         Fqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686744713; x=1689336713;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYyaAYoAiZPPWXaf4R2hKtCfO4zLm4oKoUYKWZFRm4I=;
        b=GfaUk/hkmZZAfrC2NIDhMzWn/+PF8ravxD6bPVAJUEWYzSaASzhaxyBq9qcosgeUIL
         2Dwd6zvvH9ucCBiE+8blFVW4wSWEsq9RR56H3RS2VazN6jRBd0h2R2d6Jux4NQv1NXk0
         YioMOmUpwPj9u+kZ189wggG5w6lcaWxbWhYUP2l2JReVbeFeO4SwoiCNhl0rsJvloxro
         d+zs1QAhxFlGrCCn4WzwzpQ6FcA/hV7eZpaV2BYmteVBy/QTl+MdLFpsCvb25Eojft4k
         zETsr5TvFpFl9P63aHJyGmXXBgh+amOuGC6Un9aB5t9ehf+pHmhGfbM0g/f8AfDpa3Gw
         bZmQ==
X-Gm-Message-State: AC+VfDw8nnOdKUoTXQmtbIpT2IlNl8XwuX0j4cabLBaPsInxMICFcEAX
        RHtto7huvoBh1jRnS/xPVsJH8Q==
X-Google-Smtp-Source: ACHHUZ5TJdH3ECSdMnlEzGFBheGVPe5ivU0D9N7rCttk2fTtA4W6zd7X4XTxVOxmzIVng9ufTPlKdA==
X-Received: by 2002:a19:3814:0:b0:4f7:66cc:6c91 with SMTP id f20-20020a193814000000b004f766cc6c91mr788222lfa.51.1686744713522;
        Wed, 14 Jun 2023 05:11:53 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id d2-20020ac25ec2000000b004f24e797c55sm2109793lfq.25.2023.06.14.05.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:11:53 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] SM8250 Edo pins, keys & pmic
Date:   Wed, 14 Jun 2023 14:11:45 +0200
Message-Id: <20230614-topic-edo_pinsgpiopmic-v1-0-cf88a0bac26c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIGuiWQC/x2N0QrCMAwAf2Xk2cI6pYi/IiJtk26BmYZ2ijD27
 wYf7+C4HTo1pg63YYdGH+5cxcCfBshLlJkcozFM43Qeg7+4rSpnR1ifytJn5aovE1iuCUPxKWA
 Ci1Ps5FKLkhfL5b2uJrVR4e//dn8cxw+CUXvRfQAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686744712; l=924;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=i3s4AcQganFr5wJlg7d766aH6boKY+DUBCJzoCXf1wg=;
 b=1eImbmQaN2fHFTLcnkmQCuifUuo822YJVIJvXrrG5+Z1vqkQCWWPHUxgDQMKbM6wZtRiGpqNu
 yU4lBeB0+DLB3+OmSZyfOvZTVHnKNJQ9Fd7xfuy43j+qIHY+o3JoDRD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings fixes to the GPIO buttons, adds gpio-line-names and
introduces the SLG51000 camera on Xperia Edo devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sm8250-edo: Add gpio line names for TLMM
      arm64: dts: qcom: sm8250-edo: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sm8250-pdx203: Configure SLG51000 PMIC
      arm64: dts: qcom: sm8250-edo: Rectify gpio-keys

 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     | 364 +++++++++++++++++++++
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     | 243 ++++++++++++++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |  61 +++-
 3 files changed, 655 insertions(+), 13 deletions(-)
---
base-commit: b16049b21162bb649cdd8519642a35972b7910fe
change-id: 20230614-topic-edo_pinsgpiopmic-df8bd6f1b6db

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


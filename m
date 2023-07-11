Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E312574F25A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbjGKOfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjGKOfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:35:40 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2874170E
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:35:19 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6b98ac328so88905661fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689086117; x=1691678117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHcWpUkeDbQbs1rYaPD7kUy5+LtT4XMVDwCPnvZoH8c=;
        b=MYsaUfBca0WkbY7zvuRVyV+tJU3Yr8/RTf/P9D3Aqs2el32fJcbhCPzbj19wNgYENC
         GC35DugRMGevn8bwgCzQIJ2EPp6arnmFokBPxko52FbWnpuwoRVD3Nal4tVIyR6UM87L
         DL3hcB5Mzn5p1OoHSaL75tJo2IY+NVSWrYK0+nX/e9DS7dXf9PUb9tGBWznXu2taD8eb
         2jFYDd2zZ1rs7B+F+0It3XPnigk142qytitTUcopQy9xVWGJeKE6fFvpflqntU/4IY0B
         sp1knS1GJzUOfNNXuMGa9pj6Z+VoOTBs6ham9rP4LuS2BHTHw5u59uIuVMuiWQ/t/kx/
         h06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689086117; x=1691678117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHcWpUkeDbQbs1rYaPD7kUy5+LtT4XMVDwCPnvZoH8c=;
        b=VVgJmmB9qk9Z7xa6VWNN/S5duahdPzv4TfEh7FqylXP1XPO79spiI7kqEKZNSrPbh0
         ACeNtvnRBmdSf1VIvxfKAEYp+2+hIUTm8+EJ+gk6qTQnpv1djbT+ddfKHuJmBLCc5LrK
         5MCTPWGGDF2cZ6QQd8s9f87IUb7PfezxmCGnRfAjzndL0TCMNr/1nq9D0cEgekF5r892
         QJiXbuUwwdwADkHhZAJe7Ggtjlg8G48wM8H5Pe1WiPkMcfu5Yj8wxrXiiULH8mJUkjPb
         trodKi8VfnctJfH9PoLw9dyBsPwzZ0KtP4ePD7W2Se6ngeSy/jf7UDOstLaGP9Hwhjro
         6UeA==
X-Gm-Message-State: ABy/qLbNdpphZGvM+BUexiTRInCPGFr5cEB7hIgkLTu94ei5UgEEHA1g
        WW/PGzEkvqxf2qz7MajDW9pR0A==
X-Google-Smtp-Source: APBJJlEYEvmHjNNBBf1LhH9mi813TJZJ3d0iLAZprpwzUq/1d/NNBi7BsFwWfIFYKf8VKKBs2uHL1A==
X-Received: by 2002:a2e:7c0c:0:b0:2b6:cf5e:5da0 with SMTP id x12-20020a2e7c0c000000b002b6cf5e5da0mr13218656ljc.40.1689086116794;
        Tue, 11 Jul 2023 07:35:16 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e90cb000000b002b71c128ea0sm484221ljg.117.2023.07.11.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:35:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] SM8250 + SM6350 BWMONs
Date:   Tue, 11 Jul 2023 16:35:12 +0200
Message-Id: <20230711-topic-sm638250_bwmon-v1-0-bd4bb96b0673@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBorWQC/x2NWwrCMBAAr1L220AerVqvIlKSdGMX2k1JtAqld
 3fxcwaG2aFiIaxwa3YouFGlzALm1ECcPD9R0SgMVlunL8aoV14pqrqc3dV2egifJbNqO4f9mAz
 2bQJJg6+oQvEcJ4n5Pc8i14KJvv/X/XEcPzeojy17AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689086115; l=997;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fPunmtKbb98JtOFKIGe99194Dk6r5bCp5cWmEu+rUiM=;
 b=pnuPGi4kYKrOxq+3JzlxPDCYK7msNRO0QW7+Dus/tqDofY2/x3JBWNpfDAi7ydiARyX8Id7gn
 ZpeM5QHQVh3DQgQ6ONUjmNOZMRhPS3LiQMxC5DZqFXFceaZtVxYI8wT
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

SM8250 and SM6350 both have 5 BWMONs: one for the CPU path, one for the
LLCC path and 3 more for the NPU.

This series hooks up the first two for both SoCs.

Rebased on top of djakov/icc/icc-next, atop the 7180 addition.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add SM8250 bwmon instances
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add SM6350 bwmon instances
      arm64: dts: qcom: sm8250: Add BWMONs
      arm64: dts: qcom: sm6350: Add BWMONs

 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   4 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  97 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 122 +++++++++++++++++++++
 3 files changed, 223 insertions(+)
---
base-commit: cf8c999ab33287103179fee7ee98d2faea3adffe
change-id: 20230711-topic-sm638250_bwmon-453e9df1e94f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


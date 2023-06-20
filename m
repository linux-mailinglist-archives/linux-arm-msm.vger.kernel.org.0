Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC80736CF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 15:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjFTNSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 09:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjFTNS3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 09:18:29 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6233719AD
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 06:18:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b46bfa66d2so43780581fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687267082; x=1689859082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVOdNiEd3QtveZDzDg3FsMJG7kxU4f80fKhWvEhaEaM=;
        b=vaXlCq4mGEiZSlvEza4Habx9SP/IfH2ZIfp57+w94uElLSArC5U2D5cVcE1HNVadKp
         NsoYpFT/T2SfnFNlbyqoEGaxgMZmpT6Mx+rDQ1MX1Jb+q8cFTFo20YCwxOl76kse0pCD
         Q1J/+sO/KVGTLLHiS1PuCr7Siy6NwN9cZm/gy8EmFDmtVDKpZJnwAy0htnUTez+pPd3Y
         8c3rNl/uAt3HxtXW/GtsxdP6lUI21W8Too/JDKyTH3et4WPJROVSFhnwSe0PP5eUFj9N
         GgSTvBJ10W6WUKC5icGx6OnVh2ruLkFET/VqkjVm/KTaXoCoI2cd9zsnAx5b6aPPmRgE
         JZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687267082; x=1689859082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVOdNiEd3QtveZDzDg3FsMJG7kxU4f80fKhWvEhaEaM=;
        b=ihdeWXQ/19xxswUAN5xdokJlcIWS7RAUBD9AMxFfyQ4myh4zSWc7vn77pQIk+DvNO+
         7Z4Vr0nCEZ5Dzhfdjs4T9BADftlE6C85MRITxej7myqJx05yLuPCbsbfev73cX/vdmre
         yyj5X0bXSJBxO4MJ80cK47AJY87GR17JLQ+vVRLYvtUAdsiAQNltderor66a77LKEzT/
         XvCWDDarvXtrsMTt3hnTgGIarr7fIvXt8DjFgoqUKOEnaAW2BGCyuJmCghpTDvk0Evcl
         6jd+6m5qOVWE7M7p+iq6Sj40CkWmO8bSOHv/T8DFH8wdBIE1I46q3vEI4mylJln3I4b2
         Mr4A==
X-Gm-Message-State: AC+VfDwwAZ4BAtXmo7pHaoqxpNV6m6w0kXwnDGYupL9iwyTB/1YIMsDG
        4WSt429067oCABYSfuyjEz8X2w==
X-Google-Smtp-Source: ACHHUZ79ZlCn0m4GZ9VNXHrUz7bP9VIrjrMLch6qLGBufeZH5e0N65/dSWFpYQgWpd3LgCZnu0t9Mg==
X-Received: by 2002:a2e:b0f0:0:b0:2b4:8251:7c89 with SMTP id h16-20020a2eb0f0000000b002b482517c89mr3028384ljl.28.1687267080873;
        Tue, 20 Jun 2023 06:18:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b3318c8d6fsm414433ljl.28.2023.06.20.06.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:18:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] A610 enablement, J606F display
Date:   Tue, 20 Jun 2023 15:17:44 +0200
Message-Id: <20230620-topic-gpu_tablet_disp-v1-0-7bb02bec8dc0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPimkWQC/x2N0QqDMAwAf0XyvELtVNh+ZQxJ00wDpZa2joH47
 ws+3sFxB1QuwhWe3QGFv1JlSwr9rQNaMS1sJCiDs+5uJ2dN27KQWfI+N/SR2xykZkOBJsLxMfQ
 0gLYeKxtfMNGqddpjVJkLf+R3zV7v8/wDgOGlM3wAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687267079; l=846;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zivfHVW7lha8lc01hiAsybuK9fAUZIvzRT5Lhvc+9EQ=;
 b=vcPPYNv0dOWEXpk3byHiurjBTlH7DgDagTMg5Dw8ar23lf3hZhW/NS+ORSay13wqPOOzf/kXN
 UxEpUwQ8Oh2Cr3i68027Usz7Og5UgW04e59NBtxmC9rujiFz8/K006N
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

Enable the A610 GPU on SM6115, as well as on the RB2 and J606F boards.
Add display support for the latter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sm6115: Add GPU nodes
      arm64: dts: qcom: sm6115p-j606f: Hook up display
      arm64: dts: qcom: sm6115p-j606f: Enable GPU
      arm64: dts: qcom: qrb4210-rb2: Enable GPU

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts          |   8 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi              | 103 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts |  65 ++++++++++++--
 3 files changed, 171 insertions(+), 5 deletions(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230620-topic-gpu_tablet_disp-cdc6ca5941c4

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


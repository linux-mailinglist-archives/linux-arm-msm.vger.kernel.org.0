Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F4579D223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 15:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235531AbjILNbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 09:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235553AbjILNbu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 09:31:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314DC10D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:31:46 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52f9a45b4bdso1184056a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525504; x=1695130304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pf7Q0JvYFIlne7PDYjwGZfU3lmXNj3gLNrHRp1Eh2cc=;
        b=xio4OpqoETQzdxJCXm7wN0Snnu5/5J/4vQykM2uIA52jQtugvlj1ydkG95tgTMwple
         5eN0B+ZAVXNLgbfrG1Hn0613Ho36gqCXoLabk0wg5n67DMp8bk18KNxv5tnQCX4gmnNv
         rrDZDQ2T2a6ENPpKvj9g7BvcLLqQfi6XGF23jLeyluTPgsx6CVJgHOl/0qCQtxsUlfqh
         75/6M5ddCahh4K0htcs3RpOm43WPvtqUZN+K8W9vQvLI2sdRJHQ5iRsm6iANEokQd9qI
         uzdgQRrPQtYvnDjKcrLGLJZh5XNrHtmU0CWwbLo4JplfmyKyjXLNnygipuzjivRcoWr+
         +fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525504; x=1695130304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf7Q0JvYFIlne7PDYjwGZfU3lmXNj3gLNrHRp1Eh2cc=;
        b=LKpHu1oAhF5uBESdD9WIWAI5ZkG8DCuzhEob6lN/Y8a8kBA8sBHSOQnR7JT07HApEc
         EEU+0nUp3lFWTIUrpFo3oKVJr/RaJcDmzgyg/qWhtouxnY/XUfx0gDTyvtmc/3/DrBj7
         7r1rX5df0xeoGM7xV3CjoqhO/rMdXQFufGjZYbUrfFPaBfMKL8qydt4SS+Qk2+KDnGK1
         vg/67K7f0YjLtk6W7xrqE/UcuyhaTYuDa5n6VtESpypgZQ+LZmGMXV0S3ZXI+GtMq9vK
         Dg+VkeAdXgCwXaAOEED3o/OD6vo9sK1SOJxZvWlqsArw+p0b5W4rUpq4SrA2mVd6vGrR
         rCvg==
X-Gm-Message-State: AOJu0YzTfXa53+quLE1gO/WfAsh5C1YbCwgO2SHmCPfCrO6UVIWYcaiC
        ftEvLYuI85w2Pbi0e+sPUvKMWw==
X-Google-Smtp-Source: AGHT+IHs3WNmvXll913Vtl7VEMAeUTqwDBcvXIxvRE7XHalmFOO8Jj4DA8k5vfr1c5fYL8bYrgKVGg==
X-Received: by 2002:aa7:cb52:0:b0:52a:46a7:4597 with SMTP id w18-20020aa7cb52000000b0052a46a74597mr11050775edt.33.1694525504563;
        Tue, 12 Sep 2023 06:31:44 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:31:44 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/14] Clean up RPM bus clocks remnants
Date:   Tue, 12 Sep 2023 15:31:38 +0200
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADpoAGUC/4WNQQrCMBBFr1KyNpJEW8GV95Ai6SRtB2MSJm1RS
 u/u2Au4+Iv34fFWUTyhL+JarYL8ggVTZDCHSsBo4+AlOmZhlDmpi9FyShlBUn49IDx53sY5S92
 Z/my1Bae0YLezxcuObISR7TiHwGcm3+N7j91b5hHLlOiztxf9e/9lFi2VhL4BV0NjtKtvAaOld
 Ew0iHbbti+Y0PxF0AAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=2936;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CvKjOth/TKTTVZAvkrUVTofGQmTgRncGfe147qHke1o=;
 b=Tci9qXx/tjv8ZOMsqCVXiSQ42Qi3ElBi6aWcjDlQOIk1Sg0zL92juBFDyp074pEuEfUZxjsZE
 p76V4XQ0yCRAKl1Pb5rneYNsCvWvfQ9Kz0tD4RA1w9DPdhHpBTn6P6q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After the recent cleanups ([1], [2]) some in-tree abusers that directly
accessed the RPM bus clocks, effectively circumventing and working
against the efforts of the interconnect framework, were found.

Patches 1-5 drop deprecated references and the rest attempt to stop
direct bus clock abuses.

Depends on [2].

8996 and 8998 remoteproc changes were not tested, they never worked on
my Sony phones.

[1] https://lore.kernel.org/linux-arm-msm/20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230721-topic-icc_bindings-v1-0-93e2bc728fb7@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Incorporate [3] into the sdm630 patch, add required bindings fixes
- dt-bindings: remoteproc: qcom,adsp: Remove AGGRE2 clock: Merge entries (krzk)
- Pick up a-b (krzk)
- Add "sdm630: Fix USB2 clock-names order"
- Link to v1: https://lore.kernel.org/r/20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org

[3] https://lore.kernel.org/linux-arm-msm/20230719073520.2644966-1-alexeymin@postmarketos.org/#t

---
Konrad Dybcio (14):
      arm64: dts: qcom: msm8916: Drop RPM bus clocks
      arm64: dts: qcom: msm8996: Drop RPM bus clocks
      arm64: dts: qcom: qcs404: Drop RPM bus clocks
      dt-bindings: arm-smmu: Fix SDM630 clocks description
      dt-bindings: usb: qcom,dwc3: Fix SDM660 clock description
      arm64: dts: qcom: sdm630: Drop RPM bus clocks
      arm64: dts: qcom: msm8939: Drop RPM bus clocks
      dt-bindings: remoteproc: qcom,adsp: Remove AGGRE2 clock
      dt-bindings: remoteproc: qcom,msm8996-mss-pil: Remove PNoC clock
      remoteproc: qcom: q6v5-mss: Remove PNoC clock from 8996 MSS
      arm64: dts: qcom: msm8998: Remove AGGRE2 clock from SLPI
      arm64: dts: qcom: msm8996: Remove AGGRE2 clock from SLPI
      arm64: dts: qcom: msm8996: Remove PNoC clock from MSS
      arm64: dts: qcom: sdm630: Fix USB2 clock-names order

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  2 +-
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 20 +-------
 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |  2 -
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  6 +--
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  9 ----
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 12 -----
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 43 ++++++-----------
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  5 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  9 ----
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 55 +++++-----------------
 drivers/remoteproc/qcom_q6v5_mss.c                 |  1 -
 11 files changed, 34 insertions(+), 130 deletions(-)
---
base-commit: 66d9573193967138cd12e232d4b5bc2b57e0d1ac
change-id: 20230721-topic-rpm_clk_cleanup-1b2f4a1acd01

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


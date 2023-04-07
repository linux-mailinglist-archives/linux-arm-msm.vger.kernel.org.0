Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2818A6DB48C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjDGTzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjDGTyt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:54:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FE6A5D6
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 12:54:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g19so42539953lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680897286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+AFb5wfJ9U1U6y3PYFeGEqZliVIyqi+6YzMhEDe6CJc=;
        b=P7ZjaEaTvMs1BcDqx1TVJyQbDfbs0tD4f/GJNOMFWjvTuwh6bf+UOyxTianQsBbQJC
         M6Hyl/9++/kNx9ycYamEW0R/3vt0ukQJwxUszl6wtnaDxy/+oSbGrqgZdfbjhjf1nx19
         pmX5FHB+eqtcSMxRUs9rWayPmZ9SjIZEBi/ueWYyVwcxqYb2TuIKz2AwLgGJFO12ttGS
         wT+b6KCadywhuFGRp6DCIZ82g3ijRahiGvjMH8G8YV+IU15RdvOk1vhv5YAyGohT4DSr
         wCfyOgLsuT6sXPK6j7aEp8Lk3iHctoomiQO2oCCq8Opbl6PnfrtsfM/FiQQzgnK6qLpF
         hHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AFb5wfJ9U1U6y3PYFeGEqZliVIyqi+6YzMhEDe6CJc=;
        b=QMvP+NfoqLwh6DL18I59TPJXZCadi6AsK+PT7DZuj3YO67T8oArBqMdwAyH0uLFRvx
         pSGS+YTfcYRVDuGAZIzX8UqAZ5noiHgXk9LzMjzaELO7/YZ/UdlSPsoA0MLl2tiwtNWY
         zPYdUbCrOZ7x8Upzi199HvvXoUfVKXU/DLWLI08QRVIEubcUYgT4iyIaPMGeJufjIJcE
         eZ8SsUDEvpX+UlSrqW1ZlSz1Jkuje1d5qA/NNa2HJeqGsvOOsWu/su5Sdp9z2lfEWJvN
         NwZHsJCfBkbB0b4O7IgTRpBwcsHaSiMgaFmIjQsfMeNz1NJcRDc6ASEV97YVBqdqdkBf
         9/4w==
X-Gm-Message-State: AAQBX9c4kv6PIpZQLCA9wNWtj8JKdGHtONBK6RTJHHUOLkXM15dnSX6I
        qSP0VeTNwu/wm+i0o5UfKEGjdw==
X-Google-Smtp-Source: AKy350Yig0hO9NGzEF3/rRaCn3/Y8UIVoiFM4pMUN2LM2+WmpLzFxVCp9dnLp3B0VHCGAjs6snj4rg==
X-Received: by 2002:ac2:5f0f:0:b0:4d7:ccef:6b52 with SMTP id 15-20020ac25f0f000000b004d7ccef6b52mr1019597lfq.39.1680897285900;
        Fri, 07 Apr 2023 12:54:45 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id u5-20020ac248a5000000b004d856fe5121sm839981lfg.194.2023.04.07.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 12:54:45 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/4] Tab P11 features
Date:   Fri, 07 Apr 2023 21:54:40 +0200
Message-Id: <20230406-topic-lenovo_features-v2-0-625d7cb4a944@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAB1MGQC/42N0QqDIBRAfyV8nkOzUva0/xgxbnorITS0ZCP69
 1lPe9sez4HD2UjEYDGSW7GRgMlG612G8lIQPYIbkFqTmZSsFKxiDV38bDWd0Pnknz3CsgaM1Ei
 msOYaQCLJbQcRaRfA6THXbp2mLOeAvX2ds0ebebRx8eF9vhM/7K9N4pRRYwQXBkqlZHOfrIPgr
 z4Mx/afXEsBNVcMK4Xfebvv+wfVXxfbDwEAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680897283; l=1028;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0hnuSRNhOLqupAv3AXDiTRWpTdMlZAZTpQkLVrqvS0w=;
 b=fCKUp4CYhU2DuPrrZVXj2GpZnDnN7tiV1vHJB9vV1SNCPpajGeQP5lYo41o7qshkbMz9mzLmV3VT
 jsPYdJBMB2BCzKx1d1PN3iHpsIo+ioSX8eXUFvZKHFxgLsh7ImP+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v1 -> v2:
- Add ftrace-size and drop no-map under pstore [1/4]
- Add qcom,ath10k-calibration-variant [4/4]
- Pick up rbs

v1: https://lore.kernel.org/r/20230406-topic-lenovo_features-v1-0-c73a5180e48e@linaro.org

This short series brings a couple of "nice" features to the Tab P11:
- Wi-Fi
- remoteprocs (+RMTFS)
- ramoops

No external dependencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sm6115-j606f: Add ramoops node
      arm64: dts: qcom: sm6115: Add RMTFS
      arm64: dts: qcom: sm6115p-j606f: Enable remoteprocs
      arm64: dts: qcom: sm6115p-j606f: Enable ATH10K WiFi

 arch/arm64/boot/dts/qcom/sm6115.dtsi              | 10 +++++++
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 35 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6
change-id: 20230406-topic-lenovo_features-d708e51caa7e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


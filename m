Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734AC705181
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjEPPFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbjEPPFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:05:23 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2946B5FD4
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:05:22 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-52cb78647ecso9034959a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684249521; x=1686841521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7txPToyylLXj/XeurHwXRxqGzvOp+rd7gJyEEX+n+mc=;
        b=PvT7igHMLEj8zD6P4R7JabDlBcl9puACGqWkd8D8L68rJbLbFTpSBEMtOs0zB59ssb
         cwjEa6KM18yUWqFIYkxkUO61wBCI8ZTekcW8mvyjgjaKeoJ+XU5mE7hndRPUGjyVbXRZ
         R0B1qiyVjs69DTDnP+z0TUxs6neB2P7iGxhFn41NVpfS6qPLX9eewNgjvDduIhiMv/vx
         MlO27RMkw12+Ff8Lg+HGQWMtVF8LkP6+//0JEpYkhiQr/Z0FVnlPRrBPPwk7HszsfFsl
         HSo0eKqsvH32V7tdH0JrFgJ6U97ERr2FiSm4vU6MGx5YK8A3TM/MAHrZNB28/T9RoBQC
         BcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249521; x=1686841521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7txPToyylLXj/XeurHwXRxqGzvOp+rd7gJyEEX+n+mc=;
        b=dlen8pOGxZkzmNtokzuiu89FUq85rBCcHY3jMLqorw0htkNW3YJTj9Kk0lig+dCC6T
         8wMKsc2nQmf8FVgpMh/3KKSCYEwjda6iZH84kwvtOCX9ebXzw11OXfyAWjYyV7iWMa6a
         vnm8SlB9FcipqGSTThhf+fzJWa6eVtLK0DQMRqjR2UB2Z+o0Ct1xH8OmPm1kpshpWPrf
         qGzMRAVmcGzYQ/MPADSjMUvUXDxYVXhrkuoRyltZZi+1fdF999oZUqjv8elRzDBH4jMN
         YOAMKppEC/e3MSswR8Y8CzS5FPcWuz9pF7lAH82qd96I6ZB9WV2dknt0/Y6LCe0zzGcL
         /11g==
X-Gm-Message-State: AC+VfDzXhrntDbezZWLKhNZZLy1Rq+YMJXLOXDeoz2iuhqc9S2AE1a4Q
        jXjiBhaElZdo8KTr+gMO2HrDFIyb9m1FD4GrFtc=
X-Google-Smtp-Source: ACHHUZ7OlVfboY2rOaNjd3FbvEe5wJbXRpyzeqvDCudGA3Geq+oEtvj4mUoMHww3/5QfIIX3lMwX4g==
X-Received: by 2002:a05:6a20:7d82:b0:103:4c5d:667a with SMTP id v2-20020a056a207d8200b001034c5d667amr27948776pzj.4.1684249520825;
        Tue, 16 May 2023 08:05:20 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:72cf:f5c9:ba94:6b85])
        by smtp.gmail.com with ESMTPSA id h1-20020a654801000000b005302682a668sm12817164pgs.17.2023.05.16.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:05:20 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org
Subject: [PATCH v11 0/4] Enable USB SS qmp phy for Qualcomm SM6115 SoC
Date:   Tue, 16 May 2023 20:35:07 +0530
Message-Id: <20230516150511.2346357-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v10:
-----------------
- v10 can be seen here: https://lore.kernel.org/lkml/20230502053534.1240553-4-bhupesh.sharma@linaro.org/
- Rebased on phy/next, as Vinod was seeing rebasing issues with v9 while
  applying.

Changes since v9:
-----------------
- v9 can be seen here: https://lore.kernel.org/linux-arm-msm/20230501192432.1220727-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Dmitry on v9, regarding register size
  and pcs_misc offset handling. Also collected his R-Bs.

Changes since v8:
-----------------
- v8 can be seen here: https://lore.kernel.org/linux-arm-msm/20230410171010.2561393-1-bhupesh.sharma@linaro.org/
- Added driver change for new bindings used for sm6115 / qcm2290
  devices.

Changes since v7:
-----------------
- v7 can be seen here: https://lore.kernel.org/linux-arm-msm/20230409200934.2329297-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Dmitry and added "pipe clk".

Changes since v6:
-----------------
- v6 can be seen here: https://lore.kernel.org/linux-arm-msm/20230407061122.2036838-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Bjorn and Dmitry and dropped old bindings in this
  version.

Changes since v5:
-----------------
- v5 can be seen here: https://lore.kernel.org/linux-arm-msm/20230405191633.1864671-1-bhupesh.sharma@linaro.org/
- Addressed review comments from Dmitry and made [PATCH 1/2] compatible with his 
  'split away legacy USB+DP code' series:
  <https://patchwork.kernel.org/project/linux-phy/cover/20230324215550.1966809-1-dmitry.baryshkov@linaro.org>

Changes since v4:
-----------------
- v4 can be seen here: https://lore.kernel.org/linux-arm-msm/20230401154725.1059563-1-bhupesh.sharma@linaro.org/ 
- Collected Krzysztof's Ack for [PATCH 1/2].
- Added more descriptive commit logs as per Dmitry's comments on v4.

Changes since v3:
-----------------
- v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20221215094532.589291-4-bhupesh.sharma@linaro.org/
- Fixed v4 as per the downstream driver code: https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#296

This patchset adds the support for USB SS qmp phy for Qualcomm SM6115
SoC. For the previous versions of this patch there were conversations
on irc as to whether this was a 'qcom,usb-ssphy-qmp-usb3-or-dp' or a
'qcom,usb-ssphy-qmp-dp-combo' as per downstream code and hardware
documentation.

But after a careful look at downstream dtsi (see [1]) it appears that
this indeed is a 'qcom,usb-ssphy-qmp-usb3-or-dp' phy and not a
'dp-combo' phy.

[1]. https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#296

Bhupesh Sharma (4):
  dt-bindings: phy: qcom,qmp-usb: Drop legacy bindings and move to newer
    one (SM6115 & QCM2290)
  phy: qcom-qmp-usb: add support for updated qcm2290 / sm6115 binding
  arm64: dts: qcom: sm6115: Add USB SS qmp phy node
  arm64: dts: qcom: qrb4210-rb2: Enable USB node

 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 27 -------------
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 38 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 24 ++++++++++++
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 29 +++++++++++++-
 .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 22 +++++++++++
 7 files changed, 117 insertions(+), 29 deletions(-)

-- 
2.38.1


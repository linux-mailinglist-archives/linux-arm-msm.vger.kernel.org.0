Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCC775F3C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 12:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbjGXKtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 06:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbjGXKtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 06:49:31 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F587107
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:49:24 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so6176521e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690195762; x=1690800562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZNvYrVthLVnyT1vCTz76LDPSOhoYBXUv6sJqHcelaw=;
        b=YJTYZImmB9JueLr3bDE0VuBdRIzqjP7CeXNL00mQgdEmEjfrZgJZSIwhPXM2ig+kPB
         ZeAmZR62wrlMN9+EvEatTNKZ9alkGgugOrVcP2KiBkh1NOF/PXEXG7rjg7nXe/vHbusq
         bkjTe8pGg6fSR3lvsxz5FBLM5tEsUa0KdtSFAFMLg+6Hp7GfMK80NJ/QjCybeMqkL9Eo
         tw7YHUjTRxvhnMA2n6QKEqXDyBZxj5i2qRAVHoqei6vWc+UGgmC+kWaN/f1fSoSLWQqE
         2oyYE26f0FPbpZYHXun/O4Kt8yjBZP+icHWGjHbGSI37HSD79a7uUjXYwbYhHBVOJ+vf
         qipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690195762; x=1690800562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZNvYrVthLVnyT1vCTz76LDPSOhoYBXUv6sJqHcelaw=;
        b=cYOk8c4pnpY+Ikwsxs1Sc/baQxj8M+WAYWpgT+gC32Kcpr1+r9jiqcaLkkfyJJBf9p
         iqC6tsJTgyOJ7mejrUxuonUWfmtDNz1j7Q28lqG1tOgOcsxkMJdbMt9jcTtjkdmx9Ko4
         +zDJoTduzJKcejGRpDYRQgmMxlC+9BMQXBds5RorQbofnHfIyOicnAf7MXUlxwNCBg6l
         hDYm+2yIsAOTeoE2ptmAzC7Se5G8hf5XhqH3VBpdtZ0glFFOxLmL99AM0UDpB/buQS/x
         inuwetppIZIwtqKars3aOBy80C24flRfewq+ooS/HV49R6Vz2hQYi/s5SM8x2SlQwKiA
         HQxw==
X-Gm-Message-State: ABy/qLZbak2gheuug6/mOrZGA6L3ai70+DBsvBJI6lwizcPXiRBzT7Vi
        Cn7roFUcZuErVkuscXe4jSF0ShdEdaVy/dcmwUx2cg==
X-Google-Smtp-Source: APBJJlFqc/fKryxe6UpKwyBjZRCiXffFBiaWUEf9MknSIxwWMEJd8TqWmfpO2ij4O28nimR0iZeBNA==
X-Received: by 2002:a05:6512:b97:b0:4fb:97e8:bc1c with SMTP id b23-20020a0565120b9700b004fb97e8bc1cmr6296392lfv.54.1690195762416;
        Mon, 24 Jul 2023 03:49:22 -0700 (PDT)
Received: from [192.168.1.101] (abyl203.neoplus.adsl.tpnet.pl. [83.9.31.203])
        by smtp.gmail.com with ESMTPSA id o14-20020ac2494e000000b004fdc7ec5cbesm2164201lfi.300.2023.07.24.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 03:49:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] QCM2290 icc fixes
Date:   Mon, 24 Jul 2023 12:49:20 +0200
Message-Id: <20230720-topic-qcm2290_icc-v2-0-a2ceb9d3e713@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBXvmQC/32NQQ6CMBAAv0L2bE27BhFP/MMQU5YFNsEWWyQaw
 t+tPMDjTDKZFSIH4QjXbIXAi0TxLgEeMqDBup6VtIkBNZ50gVrNfhJST3oglvouRAqNaanEnJA
 vkLrGRlZNsI6GVLrXOCY5Be7kvY9udeJB4uzDZ/8u5mf/LRajtCq6c9EhY16SqUZxNvijDz3U2
 7Z9Ad38cZvIAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690195761; l=703;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=V5VLuysiELC1Er6lyMJIuGPFDavBvRd/ufRAXrK7W9o=;
 b=fwqrM0Qa9FnLzPux2jyipgO4M7jLpaHP1a4+DULTJ38WE9pzeHjAfsrjZeHx0iXIUKNC9UV+l
 pLCgziY+yHNAm2seXUTDE3cUOo/Ec+tAwSZN0mC2xANz+lCWAEsjdOA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains fixes necessary for icc to behave correctly on
QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Clarify commit message in patch 2
- Link to v1: https://lore.kernel.org/r/20230720-topic-qcm2290_icc-v1-0-7f67f2e259c1@linaro.org

---
Konrad Dybcio (2):
      interconnect: qcom: qcm2290: Enable keep_alive on all buses
      interconnect: qcom: qcm2290: Enable sync state

 drivers/interconnect/qcom/qcm2290.c | 7 +++++++
 1 file changed, 7 insertions(+)
---
base-commit: c58c49dd89324b18a812762a2bfa5a0458e4f252
change-id: 20230720-topic-qcm2290_icc-211dc925c2e8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


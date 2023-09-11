Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D28679BEBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344797AbjIKVOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244177AbjIKTc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 15:32:59 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBAC18D
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 12:32:54 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52e828ad46bso6319237a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694460773; x=1695065573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5UMn+F1EegjHCQSiGIpyYjyy5ijgml80Jw1Zt5EbFAY=;
        b=nWiyP+bLLMJQ6NzMFaeyyhkPNbxhvGPJ/kdx9Mk4qI+tZOmTmx0/IIRL7Gt4VdY5O9
         wDzwU9FpaBgMFQwRMCCjqtw246ME6vTdbI2/BH7pY81Tay0kbHnny70tJNDVXa576IVt
         XcSju+R2uRV4OzQ9GnjhnUuw7WRFEqsGfezL2RQV0za/j6bqHpptrmPRTYGuinBF5FS8
         WgyM4QgvsxrQltPRC2VxUhIzv8qruTdRNVYa2s7YXKaw0txsVS3tE8Iy3x2Ts2GDw45v
         K2EVOIp4yIpnsbfwhtflUbBzK062J1o2Ro3fUw4iSeija24I7KKjK4bzjW7LFGKARWmJ
         E+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694460773; x=1695065573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UMn+F1EegjHCQSiGIpyYjyy5ijgml80Jw1Zt5EbFAY=;
        b=F/BBHG5Oe1axvCUHuwEe9vo+mONqLCqwA62eFXFBrukB2/sx5gyeI5m2hUAfqygPWR
         p+UvD/fO60C7CISuoKzIGHSbByOe3Sx1JC9Ega89RgskY83ABVT7aeRzOvlQJLAy3KYB
         qO/CDLCqMVYRz8Tw2MHRMkL2YZpv3r4nA/lfGOulf5TnoyglWcyet2b3FR3VDRPTy84Z
         v7YKDMDD2Yj0RypM6wzZxu9XQsiBG7uLRec8YrZ336Z9LSyDAAnsxev7LGfMwp5ksHUR
         HcLNjS/p9RY5e6Fc7qo2Tlfs/INPaEe3gCDaqJacETdqmwrEvZ6NWph/s8/4loZw1OH8
         0VmA==
X-Gm-Message-State: AOJu0YxqCYzwNyzH67Xh9M6p8dJ6UxHoi645DFQiUfgW/blubk9DOmyn
        IQyVIjuIA8EB4nZW7/0LdtQIgw==
X-Google-Smtp-Source: AGHT+IEN5RIi2xcSnwPNjVQSja3SRb0xD2tJCeAWxHBcwbpnLaq6G6YhG1w4oLwsBjzDuJ/UWy83rg==
X-Received: by 2002:a17:906:2d1:b0:9ad:7d5b:dc11 with SMTP id 17-20020a17090602d100b009ad7d5bdc11mr296841ejk.33.1694460773048;
        Mon, 11 Sep 2023 12:32:53 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906410400b0099cc402d3ddsm5698607ejk.202.2023.09.11.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:32:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] 8550 USB QMPPHY fixups
Date:   Mon, 11 Sep 2023 21:32:47 +0200
Message-Id: <20230829-topic-8550_usbphy-v2-0-a72f43311d19@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9r/2QC/32NQQqDMBAAvyJ7bkqM1Zqe+o8iJdHVLEgiG5WK+
 PemPqDHGRhmh4hMGOGR7cC4UqTgE6hLBq0zfkBBXWJQUhWyVlrMYaJW1GUp30u0k9tEpfO+qO5
 W2wIhddZEFJaNb10q/TKOSU6MPX3O0atJ7CjOgbfzu+Y/+2+x5kKKUuuus72R+maeI3nD4Rp4g
 OY4ji8cU/RZyAAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Adrien Thierry <athierry@redhat.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694460770; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gGhpM1D6PVCOQ2pV5FmkVKUb1CkrT+N170vl0E9tfxI=;
 b=Ha/wnW7hzeLkLBHibTEtEvqo8nAhkwUGnW0MVSw09JpsRyfBQ1RXCS1a48fZi0rmDT7C0iKNk
 iDxD9HO0T14BqbGIJWT/oxlVa0Ro+6WNo8FEByr/DZfxjWvpbMqMJEG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Inspired by [1] I went over the 8550 QMPPHY init sequences and found
some inconsistencies. This series attempts to fix them.

[1] https://lore.kernel.org/linux-arm-msm/20230828152353.16529-1-athierry@redhat.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Pick up tags
- "Q6" -> "V6"
- Link to v1: https://lore.kernel.org/r/20230829-topic-8550_usbphy-v1-0-599ddbfa094a@linaro.org

---
Konrad Dybcio (2):
      phy: qcom-qmp-combo: Square out 8550 POWER_STATE_CONFIG1
      phy: qcom-qmp-combo: initialize PCS_USB registers

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 6 +++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)
---
base-commit: 7bc675554773f09d88101bf1ccfc8537dc7c0be9
change-id: 20230829-topic-8550_usbphy-691f367b9b3e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


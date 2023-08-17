Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5273D77FA5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 17:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352798AbjHQPJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 11:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352909AbjHQPJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 11:09:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F42173F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 08:08:39 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so27316401fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692284906; x=1692889706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQOKLFSRw5whge5pt965xQ0um1rH9VrSs87wuRePlok=;
        b=xGXUTZ5Q9FjqCp8/YaNNnsp21FodXU1//vTz0vURJ3RfEpWlaLoB282d1n5XO+qI+M
         yhm798wwKu4FLRmFw+k5e7xhQWReXOKietVaGdLqovu0iKlqwkYYl/zn4edgIY/G70OR
         0F8DWIbVGR7XJW004YSIyPShD7MvoE0eFQs1L7tz8+kxnluQ0lKrmZfx/1fG+0QmKhBH
         zw+pYW69FuCMmQcJXLRt2e4QfjxzLOUEaaN/YUggnO4eiXuzpgo8kVbBGgQ/LCYe0CEs
         kDSO7Xbd8aEl1UMNjp9A7Idb+7horaUT1NSdjYrvFtUcogSIRP4IgQ26NRzVhhE9gC3h
         Klaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284906; x=1692889706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQOKLFSRw5whge5pt965xQ0um1rH9VrSs87wuRePlok=;
        b=Lk+Lc+ljlJZC3W6NHdb2fPwMg6z/sX2qPlGG9VE6alyWL+otQfX597wJua6BC3eXMj
         XSDMMbl0dGX1961TzPLVWK10BHGqRCSVf+k7jIZuuOZ/ou1czF47ebtQLv3fCqxXvrSV
         nI/OqwVX766BgxVoOHRX5rp7wbpLs4abladyg5Y+F7yodRBHpBQJ8Jjjr6O/pABwHjnB
         hqfl1YiTnAZ4LF3P4nTuV1edRWTHcyCffYmAC1eWOeCpmkY8MV+HSGZfeeQwSwLpUEn2
         3eyhk0PiSJUp63ofalBuy4qlsvYYxN4JM5zRXz+pkyKz+7mXVlJHNlkKNrxRR8OiYNOb
         RNHw==
X-Gm-Message-State: AOJu0YxFvkYHNUx//rwPTCPiZMtHLIPQe0/KJXM6kLd3uq0IkbvkQ/O5
        +rBsvBXnA7OexsigNgu38zN6Lg==
X-Google-Smtp-Source: AGHT+IGNqy/GmFcXkzErjwbjqgy+8GRT4/DtzlNV8TFPf8yaPghQ87/shTD6zsYd7YczRUdkwQ2rSg==
X-Received: by 2002:a05:651c:d6:b0:2b6:e958:5700 with SMTP id 22-20020a05651c00d600b002b6e9585700mr3949207ljr.4.1692284906396;
        Thu, 17 Aug 2023 08:08:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u8-20020a2e9b08000000b002b6ef2fca66sm4111413lji.41.2023.08.17.08.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 08:08:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] usb: typec: qcom-pmic-typec: enable DP support
Date:   Thu, 17 Aug 2023 18:08:22 +0300
Message-Id: <20230817150824.14371-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To enable DisplayPort on the platforms supported by qcom-pmic-typec
driver, we need to register a corresponding drm_bridge for this device
and also be able to send the OOB hotplug event to the corresponding DRM
connector. All this is implemented by [1], but there is no direct
dependency on that patchset.

[1] https://patchwork.freedesktop.org/series/120393/

Changes since v4:
- Put of_node field access under CONFIG_OF (LKP)
- Changed ifdef CONFIG_DRM to IS_ENABLED(CONFIG_DRM) (Guenter)

Changes since v3:
- Fixed changelog for v1 (Guenter)
- After discussion on IRC, change connector type to
  DRM_MODE_CONNECTOR_DisplayPort to follow i915 and amdgpu example.
  The fact that this is a DP wrapped in the USB connector will be
  handled separately via the subconnector property (Simon Ser, Janne
  Grunau)

Changes since v2:
- Reworded commit message for the first patch to explicitly mention that
  the "displayport" OF property was rejected (Bjorn)
- Removed several #ifdefs from the qcom-pmic-typec patch (Bryan, Konrad,
  Greg K-H)

Changes since v1:
- Properly handle CONFIG_DRM dependency. Disallow building
  qcom-pmic-typec into the kernel if DRM is built as module (Bryan).

Dmitry Baryshkov (2):
  usb: typec: altmodes/displayport: add support for embedded DP cases
  usb: typec: qcom-pmic-typec: register drm_bridge

 drivers/usb/typec/altmodes/displayport.c      |  5 ++-
 drivers/usb/typec/tcpm/Kconfig                |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 37 +++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.39.2


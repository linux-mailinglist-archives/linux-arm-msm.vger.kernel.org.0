Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB03B7669DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 12:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbjG1KJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 06:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbjG1KJD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 06:09:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217D235AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 03:09:01 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so3333661e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690538939; x=1691143739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/yDS6GJ77QbFwTMN91XqQ7OJgmLRybRbCpy7Yu02w1A=;
        b=rnjbWsI0m+4cAh+BrLKko6ztdnDcbo7mrJ5bAdWuHOmjMQP3zgR4RfnGL+IAmSH5e3
         vD4JeZLgtwUkGNM6jK6JZF2M80aobp085r75R0sKwvbRdo5YCeSK92XwTzlnCWdEun31
         uRpOUOoWDJRFdpAj3aW2CFInGVhQVna+qsxHtmFV8FpZDeCvZpT9xTaDrdp4IxDnB0k0
         o+tQfsXhgIj511GAqJY3usY+3fiMqgSYDCaVwuqb1KolBfNOvY4s+76AMDGkFzRDXoMd
         /ArrlEMXJYHBjy2nS5JQ6LuwJF7v9PPTeuObHmvsvoacJbENlJz+zfyNiH2HnHTGNCbR
         5d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690538939; x=1691143739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yDS6GJ77QbFwTMN91XqQ7OJgmLRybRbCpy7Yu02w1A=;
        b=EEMkebusauJVx09zJcqZ8LfqBcBqtmN0pJyoVSPMcZNpSET0dDfk+m8KpxHYb/86T5
         nhD8Y19A2im35zt0eeC3/Nd1M/N676taKY4mX3UcHuCD+8MLOEPdQ5x/S86l36eAOHHk
         WzDp88p74vG7jVfdnIiZJYEMoevWKUR7SuOBuR62qRF+iGIJ/V5HY+KLGxUviG7ymfZy
         leJ6hZvgDOIsQe7mnoChi3R7pzbujYQGlD2uy+QAApL3oJF0eanSVT55omgdTqhQQbAQ
         8MOCpwrABaCLe57w0eshSWhCiKX7oYVS2xa7wSbvY7a0my/8Anrw4MFMvcdcD4dXlNfW
         w+5g==
X-Gm-Message-State: ABy/qLZENS+aKIRa/MqvQOXNGPfNw7b9srUTk3dhlArSA0/gz56n4voG
        gBG4nVrxXp8JSQHuLMF+1UEss306V4416rThX5w=
X-Google-Smtp-Source: APBJJlERWlYn1ylb2cFFDaSjXnIb9eeLCxv7ON82btxPoT7IgD9XqwCAzQJRqbGtXjJGrD0TpBjNsQ==
X-Received: by 2002:a05:6512:2026:b0:4f8:5635:2cd8 with SMTP id s6-20020a056512202600b004f856352cd8mr1250200lfs.32.1690538939264;
        Fri, 28 Jul 2023 03:08:59 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id h16-20020ac25970000000b004fe0de39fddsm741704lfp.290.2023.07.28.03.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 03:08:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: qcom-pmic-typec: enable DP support
Date:   Fri, 28 Jul 2023 13:08:55 +0300
Message-Id: <20230728100857.471984-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

To enable DisplayPort on the platforms supported by qcom-pmic-typec
driver, we need to register a corresponding drm_bridge for this device
to be able to receive the OOB hotplug event sent to the corresponding
DRM connector.

Reception of the hotplug event is implemented by [1], but there is no
direct dependency on that patchset. This series implements the remaining
parts: registration of the drm_bridge and setting of the proper
destination for the OOB hotplug event.

[1] https://patchwork.freedesktop.org/series/120393/

Changes since v2:
- Reworded commit message for the first patch to explicitly mention that
  the "displayport" OF property was rejected (Bjorn)
- Removed several #ifdefs from the qcom-pmic-typec patch (Bryan, Konrad,
  Greg K-H)

Changes since v1:
- Properly handle CONFIG_DRM dependency. Disallow building DRM as a
  module if qcom-pmic-typec driver is built-in (Bryan).

Dmitry Baryshkov (2):
  usb: typec: altmodes/displayport: add support for embedded DP cases
  usb: typec: qcom-pmic-typec: register drm_bridge

 drivers/usb/typec/altmodes/displayport.c      |  5 ++-
 drivers/usb/typec/tcpm/Kconfig                |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 35 +++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.39.2


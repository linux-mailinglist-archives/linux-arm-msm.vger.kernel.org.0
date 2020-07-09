Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5796219F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 13:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgGIL67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 07:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgGIL66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 07:58:58 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9595DC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 04:58:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f18so2078021wrs.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gHgWXTMGTgSJ9NzYNTwxkcCv5i1cvCfL1OrkN27Xvho=;
        b=tnHPMiKoFwJCftAE8SCg0kw8XH99fwSKXcvrjclQk5KumZPLQx8iVZbjVHV01m5o31
         b7Ajh+U/4PD7rAc6ZOhSWoQaHUp9f97KeTfDZIwK2Ty9dTc+62IYRmUPf22orpGpxm0a
         eXacwtRdXeteEBT6ljePIFJsgtXHM8COLkEXPVSwQxguBgqaK0rQBlEouxg7ow+ob0rW
         /zD4eYoi+YVEJOsQrJXLKPGMUYpSxrZqEHXbEMBeX7FoGShcixB86bnOVYpMQoX9jFXt
         AjayRUt9ET3KIFz1nMOa8WLOMcCuILTPfTiS/uAMBAumBNj243HdfpxuGlSL0OTT6MQF
         okEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gHgWXTMGTgSJ9NzYNTwxkcCv5i1cvCfL1OrkN27Xvho=;
        b=cYfqQmQ+U+iylik+qr1Io+9WXpHeH86x7hILJlal0XmdUVTCeszgoWK6vMehUMloPu
         1fcubvt2Joer3CBHU5Als1sZysgVsiyDRkoXmrh3mKLHQBtcuJwpi4j5NMqP3VuUdted
         twMUPEnOwqS9XzDuvBmeSkEknkaXwE+HFkJSMW80KK91UBPWn4TZwS09h1i8TE114ZpE
         0A5Ptu7A1vyBMPMjCx8AEM2MFh7+LvAKnZeLf7vNdODVL39M0rLvQHPxbyF7pGU+BNpT
         3nuXg6lhY/DzJDCqMXhpeiJ7d18t+CGwpCkZdGNQX3RFnevPoEbHkZIt2Pb35s74eu1F
         F3ow==
X-Gm-Message-State: AOAM532r8rh+iMQ2XTUTvh+p41PwerDmfFmhLGodL4ijlOKjnPDOFq1Q
        ewa4/ieMMJAbi37SuXjqNT88SnOFKtzF8Q==
X-Google-Smtp-Source: ABdhPJyCuhps/FwjgEGCNRrbS5o38e0SWuvhsNtaS+uo0Brld9JdD09WDpyF2aDUN4l3vMi+qlU9vA==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr59987094wrm.141.1594295937009;
        Thu, 09 Jul 2020 04:58:57 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-112.ip.btc-net.bg. [212.5.158.112])
        by smtp.gmail.com with ESMTPSA id v7sm5140737wrp.45.2020.07.09.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 04:58:56 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Venus - fix firmware load failure
Date:   Thu,  9 Jul 2020 14:58:27 +0300
Message-Id: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

These two patches fixed the problem with "failed to reset venus core"
seen with various firmware versions (including the one from linux-firmware)
on sdm845 and sdm850.

regards,
Stan

Stanimir Varbanov (2):
  firmware: qcom_scm: Add memory protect virtual address ranges
  venus: firmware: Set virtual address ranges

 drivers/firmware/qcom_scm.c                  | 24 ++++++++++++++++++++
 drivers/firmware/qcom_scm.h                  |  1 +
 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/core.h     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 18 ++++++++++++++-
 include/linux/qcom_scm.h                     |  8 ++++++-
 6 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.17.1


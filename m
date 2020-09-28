Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB3C27A7A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 08:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgI1GiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 02:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgI1GiB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 02:38:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64070C0613CE;
        Sun, 27 Sep 2020 23:38:01 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u24so10071pgi.1;
        Sun, 27 Sep 2020 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0chtk5rr8XDTzC1Vz9PdERcVqFOmea/OCGt+6P6mjE=;
        b=M/fOxg41yJtwIweGfkUXKS4DhCzSmqY2kkbgvMY2OTdmDMRgkr6K7VKGmkzPx9128L
         5lhw4DYpVejne21gL5f3/OUDy279MdWqYeG0dEpng6IVhVk/t6YhS92dhsN17eHRwtB4
         myxZmB3Bs0kkOOTBjK3sYS+9+K6BpKP6gKFvCKSrttYPhYqT6Uk3vpdbftTym7bMA1jM
         lHTTa7lyZScNA1gLd76jTM4Rr4nNcIp6Z1i9Dr/ZMPZv1eJuijohynSMjEu5xLidIfrO
         E8cQ+6vAof+HbiNW2q+7H6EK0/zh4ZK+DryCYccV6Vr/OvXX8frUC6l/EyChq3Ddy/+Y
         xiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0chtk5rr8XDTzC1Vz9PdERcVqFOmea/OCGt+6P6mjE=;
        b=AQRiqWRrHfLECg9QhSCq73Bt+opfjO83GWzQvpFCebgCETm+HZHF4JR9xpAl0qI8ha
         BUhuuk0utk2WCjFNYQjYwnNTRv3pdAplR/XcyeoF9CBI3xc5HbLWPZkxQ75OHrYhFtT+
         5scXrTphDI5TQG/T7vSkEIXJT39kTyFH9fqXzmqdc3P0HjnCCJBm05AKADWoWSIg1m0Q
         sfRBX4ROH65dMxmt4ridEZDddZ9KTMb9jJqSg4YUsaOZ+tyeN76wYMIUqZKGugCPJ9DH
         QlFAmhB5uvgtzNvhmVanAPtXZHeebYntGgPmCB6qYJT9TXqjm5s0axjZprtEr88ADuUp
         JCPg==
X-Gm-Message-State: AOAM533mw2o7Uv4FkmGirmPcNgDdCGndVJJD/R2l8hlnsioOw0pzUw+S
        hWSYqiXxG0kgYeZuq9693ua+QhBN7QFYi4Ht
X-Google-Smtp-Source: ABdhPJyj1jBgh+AJFzEXL5d8eOV13dyDzQzXUtModYjoFV8sYvwq0POiaz94Z4R+8E8xiDjHI1/+CQ==
X-Received: by 2002:a63:4854:: with SMTP id x20mr138642pgk.220.1601275080603;
        Sun, 27 Sep 2020 23:38:00 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id g26sm192663pfr.105.2020.09.27.23.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 23:37:59 -0700 (PDT)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1 0/2] Modify documentation and machine driver for SC7180 sound card
Date:   Mon, 28 Sep 2020 14:37:42 +0800
Message-Id: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- This patch depends on this patch series 
 ASoC: qcom: dt-bindings: Add sc7180 machine bindings
 https://patchwork.kernel.org/patch/11773221/
 ASoC: qcom: sc7180: Add machine driver for sound card registration
 https://patchwork.kernel.org/patch/11773223/
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

Thanks for the review!

Ajye Huang (2):
  ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/qcom,sc7180.yaml           | 64 ++++++++++++++++++-
 sound/soc/qcom/sc7180.c                       | 60 +++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)

-- 
2.25.1


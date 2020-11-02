Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D342A24BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 07:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgKBGYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 01:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgKBGYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 01:24:19 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100ACC0617A6;
        Sun,  1 Nov 2020 22:24:19 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id i7so7966735pgh.6;
        Sun, 01 Nov 2020 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAM5CT2KacUDjyxFo+2f/EVZL5xw2B882UgmQkCWM/0=;
        b=mO35MAJoGz0ZYzS2OL3cLsTGuXCQRXjKdYHgKdhFETYbWaDYSRqTXmftQogUUqIQJU
         D1uarZC2+esGZabr8GFsDh4XmOU3h1KttLKqWxnCNkgOZRdDsm5EWQnvfmLbTS4FweL4
         Pj62twAumJepNB4d+QtQVK3NN1sOxqR4Iw9p+TCpSjEqK5XobpJY+5V/g9fhAadB6yil
         tCLBtqRFK12pOhGxLnvxuIKKvfz/N++Ia9tG5Bj4NgW039LYqeMEsZ1gFMiN//zmTqSW
         MpqnvBpbLxpXnY0t8On/E/TrVUlXvojRUSbTagtQpeUNwaKZ1+dyq18SC95qVhSM8ldW
         084g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAM5CT2KacUDjyxFo+2f/EVZL5xw2B882UgmQkCWM/0=;
        b=mhIX0IBndejoFlIWW2YVMi8Pduz9tr5rPPKRaZ6sW80SMr+jhT0RdbFTikMiivM+Pn
         XqXJTI1tW7ktabmK2AyYxg1Mm/ZCWF0PLGZW/ctFl8FQwUdzD6orSLqvcmRy2qZkj93j
         A11NVQf7BvUWIsNUBU/iO+If2o1lIRA9/JHQxK6z4srWprHDholtUPdVcPNs+i1zWycW
         Lbzrpe19D5rWcQwRhLMlvArL0t/8GFTZzfbWUDyoTqRlK2nC0MP9AkOIoTHpOeKsTUkY
         i6gPASxccz9rF0JpYJdtTIHHLhaBrTYdJ/QMsAixzPVoBFL+GbqLDwE35HjV7NuvHpHR
         sP0Q==
X-Gm-Message-State: AOAM533j9s5gEKoPIC/EIwESdYEjBFHFE+mOQbJSLZvI9Q3UDbf9eGK4
        XbwbnOC/Vw6nDn2H4TXD+/T8JwUE+uU4AA==
X-Google-Smtp-Source: ABdhPJzvcRARwD+rcPvRxCml9bRA82oNKtrnY6PjzJYKl+AIVn9BUZndu8V5jaSEKb+VII6P6tC+7A==
X-Received: by 2002:a17:90a:f2c5:: with SMTP id gt5mr706151pjb.66.1604298258344;
        Sun, 01 Nov 2020 22:24:18 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id b6sm10607015pjq.42.2020.11.01.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 22:24:17 -0800 (PST)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v3 0/2] Modify documentation and machine driver for SC7180 sound card
Date:   Mon,  2 Nov 2020 14:24:06 +0800
Message-Id: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

Changes from v1 to v2:
- Ducumentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.

Changes from v2 to v3:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
  - Remove redundant judgments in dmic_set(). 
  
Thanks for the review!


Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 65 +++++++++++++++++++
 2 files changed, 123 insertions(+)

-- 
2.25.1


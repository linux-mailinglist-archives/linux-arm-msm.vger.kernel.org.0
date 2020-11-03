Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0966C2A3AA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 03:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgKCCx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 21:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgKCCx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 21:53:59 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36769C0617A6;
        Mon,  2 Nov 2020 18:53:59 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id j5so7862976plk.7;
        Mon, 02 Nov 2020 18:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqs+1TnFEGdD9FcDOYfC91qpqXfct7hE2tf3ECPoBSs=;
        b=h3//92rpvD3iQ/zyByZAkFZ0BcjqX4Qh4TZ04zul6pRXuCGJp0XP6iG2eb+QPXZJR1
         XdpSkDIMU5SAQOv3YMwCT6nO7shM5yIuxEJrsr7QvxqjrJAmYvOpEmAApFJEGXDo/bjM
         PeUjA73o8WqXAUjuXo8YW3FnYIv0Y2qd0mfI6WWEo0XKjAK700F6op3TGjSb+7OXgB9/
         0c67pawv5YMb6LBKecao9lO9U1U4j8kQ4k4OAiTRl7kiKSxzOfgnPs4m6TLp+Xqvhr+A
         W2Yu2+pCvAg0CQlwpnuLYREU2+Na6oipsN9HlgWdZjpbaV0vRYR3Sd8a/JBUXghp8ZOX
         MNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqs+1TnFEGdD9FcDOYfC91qpqXfct7hE2tf3ECPoBSs=;
        b=emyvCCSRdUWAdnozIuTWpwiuiLrU106jx406Up7w68+hAFcsNExON8IU6JLki3AMF8
         e6FfHscXcqKDSec6i3dIqdWr9iU21+k/6cq4KqE1UVxkS6lETsC8nQHxwqsXAk12u2ex
         rJm/hpWvLbj9InZIjTvDBB8rgAWskv34hNnqg0vIQIgrw8EEbhFI9dWjtH3ZgDnffOVi
         7N+8enb4jTOo2bk9U3fcVmAI6q+9EmuqjQSS4RRI/ytfri5KMIgzFcOkDpiReryzFD6y
         Bnhk0osA9OSJy4KGCUd4f2oPrNtufEz4wc6zw2XGHN5spUZi/CDq6F99U2of+HeSURAO
         CF8Q==
X-Gm-Message-State: AOAM532FAjWQE/gF+p3/O0Y8LNa47vCbabkHLTOTDMwtBx4qvVNW0CN7
        +NvA8fIjLOY3hrhuyfzo0eXzFgv5emvSBg==
X-Google-Smtp-Source: ABdhPJzu5XHybPXfvvmK+2kjYSsHvClT7MzkEy+gcpckiXpa1Cg6UrXC6bbxPS0EIU1BkvkV/2Ek9g==
X-Received: by 2002:a17:902:bb8c:b029:d2:2503:e458 with SMTP id m12-20020a170902bb8cb02900d22503e458mr23372102pls.18.1604372038547;
        Mon, 02 Nov 2020 18:53:58 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id cv4sm886145pjb.1.2020.11.02.18.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:53:57 -0800 (PST)
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
Subject: [PATCH v4 0/2] Modify documentation and machine driver for SC7180 sound card
Date:   Tue,  3 Nov 2020 10:53:45 +0800
Message-Id: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
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

Changes from v3 to v4:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Remove redundant judgments in dmic_set() and dmic_get().
  - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).
  
Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 ++++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
 2 files changed, 119 insertions(+)

-- 
2.25.1


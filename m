Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408731C1FE4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 23:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgEAVqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 17:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAVqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 17:46:30 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B162C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 14:46:30 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id s30so9101744qth.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/e974up5L7p2EuoJjEWBhJm9+klgFA+qT9TcmGyWDxo=;
        b=wLK/MVUZkZamne+YmZbJq2sQLoZiWa+KiljiYYOGZcfkHyVBJu09IZuZ9m7a4qLQR/
         B3iZYN5z8neiWvtpjIbZYNtypUzIh+IH9TjQAmHtsmcTu0LOnKzZ4aygmpKffwo6Xy7k
         5qIJ/IwswlLPH/fWKnXouh9thdgOglNuqx6DwxPDILmcap0vKjcjRdEZOU4RhKtcNMQX
         JMXUkIeRULDzBjEhnWoKbNH8mfTvSQtBHQ35AlpeeqDd7DckPA0IUWPCP2GlmggKavaH
         M/j6bvQns92ZNHAv1Lk65bOvDJnCov9wNwEn9j4eZTDJ4oy/amF1bPzEyLkETUsXxXf8
         rJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/e974up5L7p2EuoJjEWBhJm9+klgFA+qT9TcmGyWDxo=;
        b=q/T1+XH5lNlfOH/XoJT+ASCSp6S+lv0zI/Flggr01Yg/Tl6LYS8PfFJb+jm5DK3Jbp
         7s5mf8PzGTJfhcfG+oNWaQ+wJLcWgOa8TaEgU/EaaYNLFcvU7a0vyLhXdQModKYkX2wJ
         n4a554tpjAzJ6QLaovEh/aRHJdr3UkCHMl36Y/A70Q7HWsW/zK4zu9//s4crhk32seyI
         nu++mdoB/Xs86bcU72PZjmc55Ur+NGPZ6eb1C2axQWAurQ93BtMoCC2AABKqA7mf+7Un
         7oEJkgEsJHmn4QjkoD2O5FVJ+sBzsqm8V6vZ5CEJYiYmmXLTGHkpB3YdYE1j5rOJ4hfh
         yvKg==
X-Gm-Message-State: AGi0PuZ2BCwBjaVRnxKaRnQn2nbaw/E3k6y9IwqBrXKGVNZhaslvQXV0
        BGfbiET8GAwpOxSEFW6TINSaww==
X-Google-Smtp-Source: APiQypKXHzx9oTOTGiRb+iQ4oW2F4i2JoLrfWhiIHML18OG8xyDjXlXVH9MgeiBh20w2RmlSSctQMg==
X-Received: by 2002:ac8:65d4:: with SMTP id t20mr5924751qto.358.1588369589840;
        Fri, 01 May 2020 14:46:29 -0700 (PDT)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id z18sm3470982qti.47.2020.05.01.14.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:46:29 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net
Cc:     evgreen@chromium.org.net, subashab@codeaurora.org,
        cpratapa@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next 0/4] net: ipa: I/O map SMEM and IMEM
Date:   Fri,  1 May 2020 16:46:21 -0500
Message-Id: <20200501214625.31539-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the definition of two memory regions that must be
mapped for IPA to access through an SMMU.  It defines the SMMU for
the SDM845 SoC; the SC7180 already had this defined, though these
memory regions were not previously defined or mapped.

					-Alex

Alex Elder (4):
  arm64: dts: sdm845: add IPA iommus property
  net: ipa: redefine struct ipa_mem_data
  net: ipa: define IMEM memory region for IPA
  net: ipa: define SMEM memory region for IPA

 arch/arm64/boot/dts/qcom/sdm845.dtsi |   2 +
 drivers/net/ipa/ipa.h                |  10 ++
 drivers/net/ipa/ipa_data-sc7180.c    |  14 +-
 drivers/net/ipa/ipa_data-sdm845.c    |  14 +-
 drivers/net/ipa/ipa_data.h           |  23 +--
 drivers/net/ipa/ipa_main.c           |   2 +-
 drivers/net/ipa/ipa_mem.c            | 209 ++++++++++++++++++++++++++-
 drivers/net/ipa/ipa_mem.h            |   3 +-
 8 files changed, 256 insertions(+), 21 deletions(-)

-- 
2.20.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADE81894FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgCREjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:39:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37554 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgCREjA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:39:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id f16so10624301plj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hD4OTb2ukvF61pVeHuPC5lcbHIWQCqsGeGiLx1Rvchs=;
        b=aiHNfWE0XgosFyJ0+CwG4UE57kGUR7maaaONNjxpxZH/6UxI3wfP6zXvweFNQ48O6H
         6TNEkWAEyc9iohRqYey2hXe8vqZ5pnc9bmx4kZ2Ojlo42Epv8akrYy3bpMDf4cAb0XB7
         HOdlR9tsOWmi9i3jzFP1X7pD5L0fHkydGvcoxzyDb1+3Tl76POTsDPJtwk0EGUEq790T
         QK5mtfGyWLLOpydF7VSf6/iqKKym49PpKWXW1GLP3SojLzazPerBsvzPsWdYBRvpE6EH
         gMhvmJnLNVKVUS7c9p5vMrINbqW3NWBDPDJj2+GrRRs8n/dsJVgo18TdcY1uq9pVx+IP
         IWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hD4OTb2ukvF61pVeHuPC5lcbHIWQCqsGeGiLx1Rvchs=;
        b=i1OozcF8WSEKQwQnSD9RlVdZBSXaDhuDoQhukDl/fr8IVP1tyVWhmXOEbAvVyPsOIy
         crqTPUmiCXqXasMRfgJCg0Cdqp8Hf1nHy1XO3xrB1JYbVaBmhBDgJYAQaEEJPx7gvXxI
         KD+LeBydWcoMjew9UbKBIFYMZMLfW9caIOmSPSKIZBC589giNFd8bfc0DEVfeAIWA9g+
         v95y/sWalPQP+0G8mSJ/kMzEpXqEUPdMhle0SLZhO1hMK7rrGB78ESpQX3ENUjSnNwNP
         zmtl6medugcknW7DIsV6EX7iktvqoou5/kxeiAeiHEh982bBBypK/LMKGMAmJtWOcogR
         DFDA==
X-Gm-Message-State: ANhLgQ0XbrM09FGZhiIA53C6vFJtj+FUCdcyl7l1v4G5KRD0Q6vuUplj
        cp8auo8g/LGdJtWDf6/ZmfLzDg==
X-Google-Smtp-Source: ADFU+vt8zPjFve5Lzf8111BcvtQ46OdX9DFr+m5z0b0ioG5fo6mVd11MHu7Z6qKC0WsQJVUN7MCYuQ==
X-Received: by 2002:a17:902:710c:: with SMTP id a12mr1981292pll.283.1584506339206;
        Tue, 17 Mar 2020 21:38:59 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d11sm4639337pfo.39.2020.03.17.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:38:58 -0700 (PDT)
Date:   Tue, 17 Mar 2020 21:38:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.7
Message-ID: <20200318043856.GB470201@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.7

for you to fetch changes up to 1788e7a932076205d0e43024f457dd0a05ded592:

  arm64: defconfig: Enable Qualcomm SDM845 audio configs (2020-03-15 21:04:33 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.7

Enable SDM845 audio, display and gpu related configs and the Truly
NT35597 panel driver, all relevant for various SDM845 based boards.
Enable IPQ6018 clocks and pinctrl and the pmic vibrator driver for
PM8916.

----------------------------------------------------------------
Bjorn Andersson (3):
      arm64: defconfig: Enable Qualcomm SDM845 display and gpu clocks
      arm64: defconfig: Enable Truly NT35597 WQXGA panel
      arm64: defconfig: Enable Qualcomm SDM845 audio configs

Sricharan R (1):
      arm64: defconfig: Enable qcom ipq6018 clock and pinctrl

Stephan Gerhold (1):
      arm64: defconfig: Enable Qualcomm PM8XXX vibrator support

 arch/arm64/configs/defconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

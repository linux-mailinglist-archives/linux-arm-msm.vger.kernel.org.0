Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79A91E69B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 20:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405984AbgE1Sr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 14:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405966AbgE1Sr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 14:47:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8587C08C5C6;
        Thu, 28 May 2020 11:47:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id g5so2514313pfm.10;
        Thu, 28 May 2020 11:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AhPc+WQEnRknCyiVWiYGN5zVm2rCAmISMS8pUXVe9wY=;
        b=NFNMFRLe0XdUEh3rJHAwgjhbA/HkgWMH+u/20KPpzp7vGsYcZPF/n6jqFSLT21EyhL
         qvNmiKD60uVYu7YT0SJUrSHVy7PSMhc2C2bO6Ts6CKrD+w0YuMzO6NOeF2ZA0nTLtOY5
         WWkk9GeWe+G7osAtaVaVIdION/12nMsUEQt+mK5wUk3XntdDRpVRe60jeJXUAfICJOFQ
         X8nj97pLCDMHMsoQuUNIQYxp6Xmn08gjb6sNKzChnZkI/mou9zQkbN8a4QLfnW9C2qFf
         S9M3r0e7dLefk7ecuJiAUcgjSyBBFl8dmSQGFvgUxsSkT4p2PEevOnj38vrkLkWXm8g5
         pCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AhPc+WQEnRknCyiVWiYGN5zVm2rCAmISMS8pUXVe9wY=;
        b=fEVkKtXF/6jiayTA1syTytoEmGx4t3GbCLskl7Bh3diBA47vQI6ShBGuAfIb4+5HPa
         CCvchuSjK/d7QeLyPvHa0ey7y70hHWmKn+DJq2alaq0yuWc3r06XG5a8tN9GVoNbGDEU
         dFFabQR3aGtOTiZ+lS0cuG15PcLVNQO2xGQ6aYM6umKeRNhfzLNXvSEBMY5cBU0D0g3e
         rh2m8q6XpkEfP8UvZAkc339wwATd9esunadCzUgCe8XQN0uaX7ZsEZi+l3Jt/MFI4Ixu
         +Lc5+U9ffjGwNxlm3EVVputvzWZnZSIdM/FHflYUNXjfQRkcbL4G437RCp+Y1+V6VWGU
         Oc3Q==
X-Gm-Message-State: AOAM532OT3DV9a5vyuZ2upg0cZ8W0f6xrMtBQBhTq9AQcuoc9cuglgdV
        G8mDxYXwwDtStEuKkE2DcpY=
X-Google-Smtp-Source: ABdhPJwHn9kL5TvA8UDoV5v3CUxebAecr07tCzPTVygbVakEPiNaQd+TL3XRV33sGJW8ZY4+JmFAOg==
X-Received: by 2002:aa7:8bcd:: with SMTP id s13mr4584968pfd.321.1590691676283;
        Thu, 28 May 2020 11:47:56 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id c2sm6558636pjg.51.2020.05.28.11.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 11:47:55 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: defconfig: Add CONFIG_QCOM_RPMPD
Date:   Thu, 28 May 2020 11:47:52 -0700
Message-Id: <20200528184752.4747-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMPD provides us the CS/MX power domains needed to boot the modem
subsystem on msm8998 for wifi.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5212e9c0883f..dc7d0f3b2a14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -843,6 +843,7 @@ CONFIG_QCOM_GLINK_SSR=m
 CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_RPMPD=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
-- 
2.17.1


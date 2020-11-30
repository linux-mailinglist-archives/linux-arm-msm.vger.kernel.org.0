Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9745D2C8D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgK3TCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbgK3TCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:02:12 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD29C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 11:01:26 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id o25so15350073oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me9gvmdPdwgMfYqBMx+yVMz/ZeJC/Y9+hXpy6aQ553A=;
        b=YJMTNQNk8EBuk7v+Q8deTWkmAdkaNkxsQqYjsnb0/CF3KHidap5KK5YIgsT+/96pYo
         GI9hmAaxyP38uxE1Gq0K8Jcbvaa8N+VDNMaet4EtFsSkieG5T/i1o3JK51LSYs7ES4QE
         kUtHwhOWr4P4rJnmqwcMyqpv7SoeCw6J2q0NuM3HXF3mvs/A43pk2kmNsrXtzm7+H674
         42O4WZyWfP/OGUCB2dxQDsrgZWxI8UX1XNWY0ca8TQmXz7P0IinUlIQOn7wV5eVc79tM
         LfBLMlq7mFUyP1OcfUlYp1NLyimWKbJ3jIvKqW29M2nUlqt/dVNFlbEaMoii6K4vNfeq
         tvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me9gvmdPdwgMfYqBMx+yVMz/ZeJC/Y9+hXpy6aQ553A=;
        b=mzYkTEBl9U4lfbd0lScTQb7qfJSssCM3YmdUvFrOSoFPNvRxunTWoS+tVmpDO/CU7n
         bFI3tbbqa+kEF62ag1ogb+ew2cLCBITM/pdHxGIuHWeOIK6ZDZyJEifIagxwPd2VGx39
         MT4dT9mkKhuX1NdXuX5X6fO41XoDGMdJMHW1zXi549NyWXu29gM0f1/j2IkmIruI17nR
         XLBCaerpW/vtMCYzm2kPw4t/hLdQ+1PqToA3wLSFh8RGH11WN4QQlaG8U9JZb9g2TMwe
         yIm3WksmvRiPABaSHKPRk6ptypbjsrMYRye4/fukZeUnOQeNtVhiyuTxn37vXixKcI41
         RD5w==
X-Gm-Message-State: AOAM5317UhZvk+djOG2b97hO8BamZC9j5mMVoQF4oeJmsXIhlJ/CtY9g
        ROrbYJedomqJJPXP8F+669gtiQ==
X-Google-Smtp-Source: ABdhPJzC9294BlXXSNgQYq5DzHAxdgvl/ZPN01BPL6WXHog337osmyLN7doZQIFdqjCHeVDSxuUN2w==
X-Received: by 2002:aca:3dc3:: with SMTP id k186mr235780oia.156.1606762885498;
        Mon, 30 Nov 2020 11:01:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d13sm7027930oti.74.2020.11.30.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:01:24 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm defconfig updates for 5.11
Date:   Mon, 30 Nov 2020 13:01:24 -0600
Message-Id: <20201130190124.345127-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.11

for you to fetch changes up to cc563f8f769b9fe4bbe18dcd3cbb382a49cf3585:

  arm64: defconfig: Enable Qualcomm PON driver (2020-11-24 22:28:47 -0600)

----------------------------------------------------------------
Qualcomm defconfig updates for 5.11

This enables the Qualcomm PON and OSM L3 drivers. It then ensures that
the QCOM_SCM and Command DB drivers are built-in, now that they have
been made user selectable and tristate.

----------------------------------------------------------------
Bjorn Andersson (4):
      arm64: defconfig: Enable Qualcomm Command DB driver
      arm64: defconfig: Enable Qualcomm OSM L3 driver
      arm64: defconfig: Enable QCOM_SCM as builtin
      arm64: defconfig: Enable Qualcomm PON driver

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11DE1BD3FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 07:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgD2F26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 01:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725767AbgD2F26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 01:28:58 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F30C03C1AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 22:28:58 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a5so323801pjh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 22:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=rGPuYOPEfdslSJOajpa2Kv3VROVAoCeN+BZX3FPFhxc=;
        b=amWObkXXkaOUOxaNYsF4sooIzcrpeSoowBnsqLGl1MiyW+ZjZqexsOAH0jd++0VbRE
         zU8Ql/V+6EHe+pAA1sc8m9/3lvyONM7UbLTvJQAMxLgOGaa5nxkn1I2iBwn7O9Du5YkZ
         IX7osJEAyl8Z/EmNs71IdtUKf18wgExUeFbpEkGvZ3WIc4QbkMFRk/IlgJNsbrY+8p/V
         R521d3olvaGbmL2uVo4VQw6DjRPDGqyKl3mM/bj60+tYv8r8QXm1OwFCw1bL4V042FBv
         tMqrQ9b/Aeuz728f9AnGFtiO7cJrD5kl4RHO23Al3FLdjKTclI0lgkGsmLrNeptT544R
         QMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rGPuYOPEfdslSJOajpa2Kv3VROVAoCeN+BZX3FPFhxc=;
        b=hog/MXFpUY8W5ZDZTvngu5GBqC/D5whtTVmGRsJMO/HFkTJS5ydpD+rdJDT/85NfVI
         8dcOTDboLW93ztAmv/fLJMegkAoDv+JYwv7UhyuED8nnyHX4ARi4dGFRM1MIibiRJk8/
         4Ua0gUBoRdQ+d2b1b8NJNVLhifXHU/qBuLMIm7wteEctT4dkGRzu1lVu7iJFAHavuTGZ
         4fdMuxHApWsubE2Bxln0AC2Y0B84S01Y4gOEYnWFtJ9YNcRcZfcXgkv3vbomnngSJRY5
         /CAMxR++omUt7rympyXoL8MND+da3p6leIGj7lK7VefnSvTSiiLlpbJDHtfDw47PWtJn
         ADIQ==
X-Gm-Message-State: AGi0Pub3RfsxaYGZ0ECOm+wAz3KVGrLhL7HLlM+B34Pxb0ACe2NI3LDI
        p6i2UjeAFpXv/NrP46nLb0RbXA==
X-Google-Smtp-Source: APiQypJzRgVDYwYP2dRSxMMomfpHQPzWzFGLjdgVhOZRCPgtKHs5ts8w04aQq2bG6CE3erx1zEdVZQ==
X-Received: by 2002:a17:90a:8d0f:: with SMTP id c15mr1209940pjo.100.1588138137286;
        Tue, 28 Apr 2020 22:28:57 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g74sm60061pfb.69.2020.04.28.22.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 22:28:56 -0700 (PDT)
Date:   Tue, 28 Apr 2020 22:29:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DT fixes for v5.7
Message-ID: <20200429052932.GA2627045@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.7

for you to fetch changes up to 7710f80ecd9c74544a22557ab581cf603e713f51:

  arm64: dts: qcom: db820c: fix audio configuration (2020-04-22 19:26:14 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DT fixes for v5.7

This reduces the (hard coded) CPU voltage to a safe level on MSM8996 and
updates the audio nodes on db820c, db845c and c630 to reflect audio
changes that landed late in the cycle.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: msm8996: Reduce vdd_apc voltage

Srinivas Kandagatla (3):
      arm64: qcom: c630: fix asm dai setup
      arm64: dts: qcom: db845c: fix asm dai setup
      arm64: dts: qcom: db820c: fix audio configuration

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 23 +++++++++++++++++++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  3 ---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  2 --
 4 files changed, 22 insertions(+), 8 deletions(-)

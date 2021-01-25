Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D7830300F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 00:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731266AbhAYXZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 18:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732242AbhAYXY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 18:24:57 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E860C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 15:24:14 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id m13so8694619oig.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 15:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxEcU6b+RmfdibISUxArgxsBfCRGKrvIT+AEAVhb/DA=;
        b=xAOnjRjaC234JB+z/tRn7AjkeBS3vgpqdr/mD37Hnm2zzKhZCx3e5Q3D+kNZooWqP4
         XUSlyGhEy+msWsgZI6ksdiBDeYiDKg6yZGPxAvk9yKhtCa9HYOCDChORMy/1iHvrE0ub
         hFzpr2ZDULt3p4UyS9N7unl1tjBidMVlfDr1qOMd2c7zLAXKf5/b2sZ/5cc7kC8/uluf
         nZLHQKl8gYGISZC+caolK649i8Gs9OlHquJRPIAMBuAwv7VlzzZDK5qlXhdHJ9UBqPSe
         0X4KJtM6aTnRkDANGiVof9zcZCMgYAfzfzvjRpgsuRmaZ/nSQ+3c+my9hoH8851VSB5F
         6aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxEcU6b+RmfdibISUxArgxsBfCRGKrvIT+AEAVhb/DA=;
        b=mkrmWzhxBr/k52lmfaCyMhzzuHDiwZ/GjaXyvjUWyJBYOuHNr/8O6XsgF2rDjpx1/h
         kGibuTmNpgzIyjbUgAWadFVXM700gAxLcBQms+2WLbZA+7ZcqTZvHr1tJ2K3UfUAeJBB
         3kubrozYZRuhg0uCEyUoHS9IY7IpgUiq050zunwF++cd3crk6Xd/XIgCMa0js4yEskNC
         VT6h9pPBfw3xigCWmc7M7iqhp4C7h/DJlNZJztPaN5nsUMewwrBh20BPjcub/K6uDX7j
         MK0bSnQB9Nbg3Q7NUXkjejV5O790EFW1PRPDtLTREsM31MGjPREkHWNwmKDsoaBE7Qp/
         utqA==
X-Gm-Message-State: AOAM531Cscd/ffkJ1CUWN64M5ZN2Sg3YhIpbFjsTLr2R50GZEMFGF9VG
        B7E7DOB+nBlYR7LLJmaVagtA9Q==
X-Google-Smtp-Source: ABdhPJxEaffWeUuF51yZPFUPw4waATGBvom/UkEbjzaK0d30+T7sFUeF+aViZv0adupAKmFWzkbjkg==
X-Received: by 2002:aca:ab08:: with SMTP id u8mr1536302oie.84.1611617053440;
        Mon, 25 Jan 2021 15:24:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 68sm3759386otr.16.2021.01.25.15.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:24:12 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig fixes for v5.11
Date:   Mon, 25 Jan 2021 17:24:12 -0600
Message-Id: <20210125232412.642834-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-5.11

for you to fetch changes up to 5b5465dd947cb655550332d3fa509f91a768482b:

  arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin (2020-12-30 11:07:32 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig fixes for v5.11

Devicetree patches for SDM845 introduced in v5.11 requires the
platform's interconnect driver to be buildin, or the kernel will fail to
provide a valid console when we hit userspace.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

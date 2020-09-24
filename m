Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACB8276787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 06:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgIXEHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 00:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgIXEHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 00:07:12 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FC8C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 21:07:12 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t76so2276205oif.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 21:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=02TUkYxNc2vRaO7X7yA1aOAR8OfgZvadotIkUY2Th0I=;
        b=jNjal2kmVJp4pL+Tb4qUCDQNsAVBBR2O0g0C/GDcFMXwebdojMH+coXrGl2h8bsTi1
         8z1bfLHpSRdN4xLXuS9M10FwxNDFInNUpbla8Z922cp2pH8C7mivZ7JJQxaDew+YOw/O
         7rIbPIbWLIK5a5A4YELgPQm4IgXNG3Lom4pjrDgREI+vARkb0tLTAKX67mIHHDoaxNeQ
         CROvNg7ca2K30OcLQ+mnhOvh/gfTosVdIxIORaQZ9iklrJW6K8kjXJVHC7xbrhYgOp+3
         iFS1BD7bcOWzNph09SUSSoGEUHxVRvxIJ3mhiPVrq2tXv3sgwKXjA8J0SwRMqKZslJhm
         BgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=02TUkYxNc2vRaO7X7yA1aOAR8OfgZvadotIkUY2Th0I=;
        b=csde6wL05awTUlnya+yi/ph6iTYRP0iqVnhlRlxRoUT5OoYkVNkXxJn54BYfhdS8iI
         baY43qp28poRYwoT0RuPlDIF2IVsovL54cw1eeXZwIfHqquvJOUAh4fFJpVbXy+YJ0Pi
         Yter14xOJKitHoATyCcY56W63yL+tvQyuEyjlJ9exy3qN1sxfunrHSHbo7mhaZFp83er
         ePaYoSBRL2mvS+RnGDW4cxn7Qkq8IoBEOv6C5Hopkl2Ak9082s/jp6UQX+SdnfOJsTGt
         tCWjYgsgUdpD3uR9V3BwttGx23O4ARtMUje7pIiQjFSJG2Jcm5HAGQekr++L4CWYNEUx
         U0zg==
X-Gm-Message-State: AOAM532XcEjfTRGWTamIK90FukF0KRAEpKAuZIqXgk7NDXAqpHCd9GV4
        UboPl7atY1TB+JbdovpTY3AvUA==
X-Google-Smtp-Source: ABdhPJwNiOmW/M/bZwcQl3f917MePNeL5L++WTEY2Jlwpe2ptJZfcUHwCaLxX2mvLMKknSuMtQOTeQ==
X-Received: by 2002:aca:d07:: with SMTP id 7mr1504975oin.65.1600920432083;
        Wed, 23 Sep 2020 21:07:12 -0700 (PDT)
Received: from localhost.localdomain (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id j18sm546216otr.12.2020.09.23.21.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 21:07:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64defconfig updates for v5.10
Date:   Wed, 23 Sep 2020 23:07:08 -0500
Message-Id: <20200924040708.180352-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.10

for you to fetch changes up to e38175f6e11749427d724abddf3bb8b9928eb232:

  arm64: defconfig: enable Qualcomm ASoC modules (2020-09-24 03:04:52 +0000)

----------------------------------------------------------------
Qualcomm ARM64defconfig updates for v5.10

Enable Qualcomm related drivers for Lontium LT9611 HDMI bridge, SNPS
high-speed USB PHY, various Interconnect providers, GPU clock
controllers for SM8150 and SM8250 and audio driver for MSM8996 and
APQ8016.

Then enable ACM and FTDI host drivers, which are useful when working
with various development boards using ARM64 hosts.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defcondfig: Enable USB ACM and FTDI drivers

Dmitry Baryshkov (3):
      arm64: defconfig: enable INTERCONNECT for Qualcomm chipsets
      arm64: defconfig: qcom: enable GPU clock controller for SM8[12]50
      arm64: defconfig: enable Qualcomm ASoC modules

Manivannan Sadhasivam (1):
      arm64: defconfig: Enable Qcom SNPS Femto PHY

Vinod Koul (1):
      arm64: defconfig: Enable Lontium LT9611 driver

 arch/arm64/configs/defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

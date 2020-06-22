Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB5D203A88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbgFVPSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:18:43 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.160]:14873 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729416AbgFVPSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592839114;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=fJli+iBRk/tOBUvTn/eRnpt+UynUZbK5fCjHy9r/Wl4=;
        b=ra9tnjuWrRdPzboiM9rO5FCm8dKf2ndhFBfdNksJsw2UX3HQDth9vA4SxtTuVEB9Tm
        9quOgfwAPrEVJ/BJ/i1QLDSvfwfAlBSNC1lHjUngseo0ZoAmAQmoqroBgHqfX2m1JKsk
        MycPFQI9L6zUoqLC9z/uLEsdzzj34Y7ivO5we171s6Q+rQFLRVgUjaT4zY9c7PZOy1Iv
        OrWkrCYel2PSYlum7eo60cC0xVf9K/UBwDXQNepJJ5xpUpOrk79bhNdX8jWDmsCk4mDc
        oCiIGANuvz81lpzMetxV1o8HQbx5wkkDpStZM0tVj7tirebG9Q5AlDpDfePmjUudsMJc
        HQbw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OIUPH"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5MFIW5Xi
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 22 Jun 2020 17:18:32 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/4] Pinctrl cleanup for MSM8916, add sensors for samsung-a2015
Date:   Mon, 22 Jun 2020 17:17:47 +0200
Message-Id: <20200622151751.408995-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch sets prepares for adding the accelerometer/magnetometer used
in msm8916-samsung-a2015 by:

  1. Cleaning up existing pinctrl configurations
     (Bjorn recently suggested using a simpler form)
  2. Restoring the minimal drive strength for the I2C pins by default
     (The higher drive strength is only set for apq8016-sbc)

And finally the accelerometer/magnetometer is added to the
msm8916-samsung-a2015 device tree.

Stephan Gerhold (4):
  arm64: dts: msm8916-samsung/longcheer: Move pinctrl/regulators to end
    of file
  arm64: dts: qcom: msm8916: Simplify pinctrl configuration
  arm64: dts: qcom: msm8916: Use higher I2C drive-strength only on
    DB410c
  arm64: dts: qcom: msm8916-samsung-a2015: Add
    accelerometer/magnetometer

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 187 ++--
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  42 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    | 861 +++++++-----------
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 150 +--
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  20 +-
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  20 +-
 6 files changed, 508 insertions(+), 772 deletions(-)

-- 
2.27.0


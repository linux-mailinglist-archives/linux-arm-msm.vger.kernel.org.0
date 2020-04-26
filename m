Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322B11B90CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2020 16:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDZOId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Apr 2020 10:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgDZOIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Apr 2020 10:08:32 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D824C09B050;
        Sun, 26 Apr 2020 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587910109;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=fEN/W8JQvcwVXPrg6byzh4PGroQnpjWICFAQKgeEoOc=;
        b=k84v9zizjhKQgUVTvuAVKbcrtVlRUWmE8lJHK+hP/lS/HVt0flVDPQvqLjcY0uFBdc
        JFfkHfft/YrhycsMvXBqgABTZrRHHLR0Xugsv/6lM2Y7yoIDhMMVvDXoPFmwMyFG4soT
        D/LT3N7dg5yjORk9L82xfEWN+TSyixcGb6RqzqWPJB3yg+Y+L8b+I+wwSM+179XnVuyc
        FhI8eAOczS7SlTLs2A37pcwqNfBe9seGfLM7GuWpt4hcpyQD2az9bZzlSmlkvPg372qZ
        YDGBv9flaSznaKiJ8YQ4Eh/ki4q0Qx6ofZVXMnMBxjrIZMUlepL2nh3+qvJivuMwo/XB
        j+Qg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3QE8PNFJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 26 Apr 2020 16:08:25 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/4] Add touchscreen for msm8916-samsung-a5u
Date:   Sun, 26 Apr 2020 16:06:38 +0200
Message-Id: <20200426140642.204395-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series enables the touchscreen
on the Samsung Galaxy A5 (2015) ("samsung-a5u").

Stephan Gerhold (4):
  arm64: dts: qcom: msm8916: Add blsp_i2c1
  arm64: dts: qcom: msm8916: Add blsp_i2c5
  arm64: dts: qcom: msm8916-samsung-a2015: Add touchscreen regulator
  arm64: dts: qcom: msm8916-samsung-a5u: Add touchscreen

 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    | 48 +++++++++++++++++++
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 25 ++++++++++
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 35 ++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 30 ++++++++++++
 4 files changed, 138 insertions(+)

-- 
2.26.2


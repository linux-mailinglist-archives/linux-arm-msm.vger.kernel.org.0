Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B898A4316EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhJRLMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:12:54 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:20479 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhJRLMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634555437;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=HvmYj+4tnTPIJzbFK+skjrP5LiKfAkMql0EdkBkaaLs=;
    b=cKvo9XDf0zG0cWvi/1cEU4fgkA2As10vYy8u2owYfcaULifqsubuwclb/uWx9dqH3P
    yxIDPI3+lbGo4NwJ4qFj/WN01tlbxJABVcvsEUN6Kscv48g8P30H7W4mDxk2k5FVFb2T
    LJsGBpR+377E9TaeJ8abzR3QoNudc30Xr3OvTcQYn6LmvtYjC4g2ZZkMeOxUFdomSMvh
    gMJxkfxAO3ss7a8WEObZ8jOkUvy13eH8canlGTBXziIkf5DAgfyQPPAQrv514rXB96Uc
    htKETaAttHbU5A42R3FcN2FDLCUBHT+9D1lM7v0ImrlBg3REBlz4b9B6VBFF9Lz+lEen
    znMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IBAaVhK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 13:10:36 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/3] Add RPM sleep stats for MSM8916
Date:   Mon, 18 Oct 2021 13:08:00 +0200
Message-Id: <20211018110803.32777-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 is similar to the other SoCs that had the RPM stats node added
in commit 290bc68 ("arm64: dts: qcom: Enable RPM Sleep stats").
However, the dynamic offset readable at 0x14 seems only available on
some of the newer RPM firmware versions.

To be absolutely sure, this series adds a new qcom,rpm-legacy-stats
compatible that reads the sleep stats from a fixed offset of 0xdba0.
This approach was originally suggested by Maulik Shah in:
https://lore.kernel.org/linux-arm-msm/c22d57cc-025b-5a8c-91d5-5385292da49f@codeaurora.org/

Stephan Gerhold (3):
  dt-bindings: soc: qcom: stats: Document qcom,rpm-legacy-stats
  soc: qcom: stats: Add fixed sleep stats offset for older RPM firmwares
  arm64: dts: qcom: msm8916: Add RPM sleep stats

 .../devicetree/bindings/soc/qcom/qcom-stats.yaml       |  2 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  |  5 +++++
 drivers/soc/qcom/qcom_stats.c                          | 10 ++++++++++
 3 files changed, 17 insertions(+)

-- 
2.33.0


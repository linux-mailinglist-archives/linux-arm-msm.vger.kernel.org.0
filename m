Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89568457846
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 22:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhKSVn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 16:43:59 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:32857 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhKSVn6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 16:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637358046;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=bln0vGeM3u7mgviQTRS4P30Mga8eF63dguseA/OwUIY=;
    b=P3SvwSdaTpmO1n9elSCvefRumu8jCudgLx++yRtM4jJtGB0OiYTKsM9OsZiH42Nw4M
    fFgt+IgnCPtgqsNaP1xxpbFdccqyrjkYW9mSc7lc1sMS8BD0MCfI5CELmRvC1ugPdkOo
    LeBfSMdk1yf16V/FLK3bSSDLo3SCX8aOnFFvd2G9hOygewgbX52VzzBO7Ho2W6urV5La
    kvrWNyR9mWAA1N+5yFRArN2giSbprVWz9XmHxu/Jwk8cAuMa+HAHvkgu/LiIv6XUt2NK
    6cozsO/sJ5WuI6YWm19kOyBzTcbZJBOvp+752z+/cWn0mLdBCzHcGZotE1E3k4Eh96Cu
    vcaQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL0Iik="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAJLej0CQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 22:40:45 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 0/3] Add RPM sleep stats for MSM8916
Date:   Fri, 19 Nov 2021 22:39:50 +0100
Message-Id: <20211119213953.31970-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 is similar to the other SoCs that had the RPM stats node added
in commit 290bc6846547 ("arm64: dts: qcom: Enable RPM Sleep stats").
However, the dynamic offset readable at 0x14 seems only available on
some of the newer RPM firmware versions.

To be absolutely sure, this series adds new SoC-specific compatibles
for the older SoC that read the sleep stats from a fixed offset of 0xdba0.

This approach was originally suggested by Maulik Shah in:
https://lore.kernel.org/linux-arm-msm/c22d57cc-025b-5a8c-91d5-5385292da49f@codeaurora.org/
Bjorn suggested using SoC-specific compatibles instead of a generic
qcom,rpm-legacy-stats since there seem to be more legacy variants
on even older SoCs.

Changes in v2:
  - Use SoC-specific compatibles instead of qcom,rpm-legacy-stats

Stephan Gerhold (3):
  dt-bindings: soc: qcom: stats: Document compatibles with fixed offset
  soc: qcom: stats: Add fixed sleep stats offset for older RPM firmwares
  arm64: dts: qcom: msm8916: Add RPM sleep stats

 .../devicetree/bindings/soc/qcom/qcom-stats.yaml    |  5 +++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi               |  5 +++++
 drivers/soc/qcom/qcom_stats.c                       | 13 +++++++++++++
 3 files changed, 23 insertions(+)

-- 
2.34.0


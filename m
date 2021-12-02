Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B71B4665EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239462AbhLBPAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:00:37 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:11260 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbhLBPAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457026;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NNx+hi3aDIPo3ao1SaJ4PvzUDk3d4JiYY4XCPyjzaS0=;
    b=iAPRxMjLGg7XgdPEZt3EtZF1S1Zowi2vlrcKCMm8GaWitjhPamNTQ4jPGN1cSH9kG3
    Wv84Rg01c8+QZQRx7KffCRISbNAIOZ8w8fUQbAxBQXkqT9TijsRImyhR/SFKXGKX3aVW
    N6vekMMzWqLWG1CKvvPDbHMQc1qt8oiAXBfzYwRQ1EZr+NVD/OX6/Fh9pZUWBhSjT3OZ
    kqXtsgl0fL6zzHwR8CT7WK8ZUkZ4XbIgCK8OXreXZYpBtE8mJU2eCoxfXR2XIc/Vym4l
    MWtj0+TdXCdumIaxtrlanagIMSkk5a2nZ9F55IhFTb/ILZf/BxUylF4bWPVzkd4kBN+Z
    Vkzg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB2Ev5pxv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 2 Dec 2021 15:57:05 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/5] ASoC: dt-bindings: qcom: sm8250: Drop redundant MultiMedia routes
Date:   Thu,  2 Dec 2021 15:55:01 +0100
Message-Id: <20211202145505.58852-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MultiMedia audio routes can be deduced from other parts of the
device tree (e.g. the definitions of the MultiMedia DAIs) and therefore
specifying them again in "audio-routing" is redundant and prone to
mistakes. This is no longer necessary since commit 6fd8d2d275f7
("ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai").

Let's drop them from the example in the DT schema as well
to avoid confusion.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 7d57eb91657a..a0f1d7340eb5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -86,10 +86,7 @@ examples:
         audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
                     "SpkrRight IN", "WSA_SPK2 OUT",
                     "VA DMIC0", "vdd-micb",
-                    "VA DMIC1", "vdd-micb",
-                    "MM_DL1",  "MultiMedia1 Playback",
-                    "MM_DL2",  "MultiMedia2 Playback",
-                    "MultiMedia3 Capture", "MM_UL3";
+                    "VA DMIC1", "vdd-micb";
 
         mm1-dai-link {
             link-name = "MultiMedia0";
-- 
2.34.1


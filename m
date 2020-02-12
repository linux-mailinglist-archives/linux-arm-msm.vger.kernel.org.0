Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1C2159EBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 02:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgBLBwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 20:52:49 -0500
Received: from mail.serbinski.com ([162.218.126.2]:50262 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgBLBwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 20:52:49 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 9C5BCD00717;
        Wed, 12 Feb 2020 01:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id w6sI_TrmwMDz; Tue, 11 Feb 2020 20:52:32 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 3FDAAD00693;
        Tue, 11 Feb 2020 20:52:32 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 3FDAAD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581472352;
        bh=HeEXjb1mAS3JAt8AjmL+s+xV5zTwkyyh6B62a9LbWeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e9o7LKEWtXhjwswZEoVIu2hrsfGBwTXOHUenIb6M7a5su89PFfrYqZWsa2fsDi/gf
         0MStw4EAz9Vx14FpB/TuO4oI8UJaKtGZb38RR+V8sM7QIbw9e8Y41e6IP5xu4zUhDn
         +ZmTfwewWuYqkNHnX8EChG7sEQsMWi0grOZTN0CU=
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Adam Serbinski <adam@serbinski.com>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding documentation
Date:   Tue, 11 Feb 2020 20:52:22 -0500
Message-Id: <20200212015222.8229-7-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200212015222.8229-1-adam@serbinski.com>
References: <20200212015222.8229-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds documentation of bindings required for PCM ports on AFE.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index d74888b9f1bb..6b1b17d31a2a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -51,6 +51,24 @@ configuration of each dai. Must contain the following properties.
 	Definition: Must be list of serial data lines used by this dai.
 	should be one or more of the 0-3 sd lines.
 
+ - qcom,pcm-quantype
+	Usage: required for pcm interface
+	Value type: <u32>
+	Definition: PCM quantization type
+		0 - ALAW, no padding
+		1 - MULAW, no padding
+		2 - Linear, no padding
+		3 - ALAW, padding
+		4 - MULAW, padding
+		5 - Linear, padding
+
+ - qcom,pcm-slot-mapping
+	Usage: required for pcm interface
+	Value type: <prop-encoded-array>
+	Definition: Slot mapping for audio channels. Array size is the number
+		of slots, minimum 1, maximum 4. The value is 0 for no mapping
+		to the slot, or the channel number from 1 to 32.
+
  - qcom,tdm-sync-mode:
 	Usage: required for tdm interface
 	Value type: <prop-encoded-array>
@@ -174,5 +192,29 @@ q6afe@4 {
 			reg = <23>;
 			qcom,sd-lines = <1>;
 		};
+
+		pri-pcm-rx@105 {
+			reg = <105>;
+			qcom,pcm-quantype = <2>;
+			qcom,pcm-slot-mapping = <1>;
+		};
+
+		pri-pcm-tx@106 {
+			reg = <106>;
+			qcom,pcm-quantype = <2>;
+			qcom,pcm-slot-mapping = <1>;
+		};
+
+		quat-pcm-rx@111 {
+			reg = <111>;
+			qcom,pcm-quantype = <5>;
+			qcom,pcm-slot-mapping = <0 0 1>;
+		};
+
+		quat-pcm-tx@112 {
+			reg = <112>;
+			qcom,pcm-quantype = <5>;
+			qcom,pcm-slot-mapping = <0 0 1>;
+		};
 	};
 };
-- 
2.21.1


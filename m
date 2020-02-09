Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B58156B20
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 16:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgBIPsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 10:48:24 -0500
Received: from mail.serbinski.com ([162.218.126.2]:32782 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgBIPsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 10:48:24 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 7ACEAD006FC;
        Sun,  9 Feb 2020 15:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xo4SnI5uVEOu; Sun,  9 Feb 2020 10:48:17 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 27C4AD00715;
        Sun,  9 Feb 2020 10:48:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 27C4AD00715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581263289;
        bh=UQULhBFsFv/7KduXszLvTWU0rPWyMPBaOu3wrDjbjjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lmYxYZAOj8MMW1czRIaqj05/8zMgi28X2PT0HhS0wDLeEgMGnBtxDODssGs8ftJpZ
         SCIgrvkeNGm9IPSJSmu1VY34Z8toTqoaLFvoClrAH2k/ofRcqvowmNfKlt18rMygEj
         +hNajc5V2o1Mrbq5oBGxhTvLjP+VT49fDKPtbggU=
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
Subject: [PATCH v2 1/8] ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
Date:   Sun,  9 Feb 2020 10:47:41 -0500
Message-Id: <20200209154748.3015-2-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209154748.3015-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds bindings required for PCM ports on AFE.

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
 include/dt-bindings/sound/qcom,q6afe.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
index 1df06f8ad5c3..f3a435a112cb 100644
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ b/include/dt-bindings/sound/qcom,q6afe.h
@@ -107,6 +107,14 @@
 #define QUINARY_TDM_RX_7	102
 #define QUINARY_TDM_TX_7	103
 #define DISPLAY_PORT_RX		104
+#define PRIMARY_PCM_RX		105
+#define PRIMARY_PCM_TX		106
+#define SECONDARY_PCM_RX	107
+#define SECONDARY_PCM_TX	108
+#define TERTIARY_PCM_RX		109
+#define TERTIARY_PCM_TX		110
+#define QUATERNARY_PCM_RX	111
+#define QUATERNARY_PCM_TX	112
 
 #endif /* __DT_BINDINGS_Q6_AFE_H__ */
 
-- 
2.21.1


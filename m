Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8053156054
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgBGU65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:58:57 -0500
Received: from mail.serbinski.com ([162.218.126.2]:46988 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgBGU6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:58:46 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id DE9CCD00726;
        Fri,  7 Feb 2020 20:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CmXjl-noarjk; Fri,  7 Feb 2020 15:50:42 -0500 (EST)
Received: from anet (ipagstaticip-7ac5353e-e7de-3a0d-ff65-4540e9bc137f.sdsl.bell.ca [142.112.15.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 307BDD00719;
        Fri,  7 Feb 2020 15:50:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 307BDD00719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581108629;
        bh=UQULhBFsFv/7KduXszLvTWU0rPWyMPBaOu3wrDjbjjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2UePYZR8IyiFtcwSsUCCNyfJiJ/4RPykXWiqz9fedCovaK20fK5EUsi3qigyExoj3
         iC/7GNwe0CO+epWwxaqfkTRN8mUFNJ2Gs5ypuYrGN44yrKs1MWBiiogrsGZI2Gv3zL
         Kb+sfM0H6MU6bVBgTAXUx5Pbqa0/OSWboyl/lofc=
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
Subject: [PATCH 1/8] ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
Date:   Fri,  7 Feb 2020 15:50:06 -0500
Message-Id: <20200207205013.12274-2-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
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


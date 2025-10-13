Return-Path: <linux-arm-msm+bounces-77014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE94BD33DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5FB4B4EDC35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 13:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917D830649D;
	Mon, 13 Oct 2025 13:40:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFC3064A5;
	Mon, 13 Oct 2025 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362834; cv=none; b=Y4Mx8Y6Rdh/asaDY1NxvycPova1HCZTEbygSujn4vabHl5mAz0YZy3bdGynU4jjymZNHjhkoCWINugPfQM9EPP/jwbOk2xtWJy5vxG4GcjzB4Oy2BZQrhaWBbi6wGpiO6YPJp6RpWT1T+JIoA1VP2FczqkX7OMbKjascLcJpnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362834; c=relaxed/simple;
	bh=7IitNfFxeuRtQCQPMlEdaH3Q/Xv+smTip+tkaLsWJws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=se9Js2g5YBUlnLxOr4DDsrfeH1ocTTtXD2Od7B6idguaJc48zyFd8Lq6NJPlIExZ+blfXW0hboNBm6RfcLB1mVVhrHoa6IsPAwcmnuoHN01D2qa/cfC+5PIwsk3YQb5xKfcrw1XUYVVN5WdUTb+yNakvfOkYCZB2PyUAmmJ6abw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 13 Oct
 2025 16:39:18 +0300
Received: from localhost (10.0.253.101) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 13 Oct
 2025 16:39:17 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] ASoC: q6apm: fix potential overflow in q6hdmi_hw_params
Date: Mon, 13 Oct 2025 16:39:04 +0300
Message-ID: <20251013133906.3299497-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Since 'module_config' array in struct 'q6apm_lpass_dai_data' has fixed
size APM_PORT_MAX (127), function q6hdmi_hw_params() may hit
accidental buffer overflow. Specifically, in case 'dai->id' has
values ranging between DISPLAY_PORT_RX_1 and DISPLAY_PORT_RX_7,
DISPLAY_PORT_RX_1 being equal 129, module_config[] array will
attempt to access elements out of reach.

Mitigate this issue by expanding the maximum possible size of
'module_config' and increasing APM_PORT_MAX to account for bigger
possible values for indexes.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 2f6860e6133f ("ASoC: qcom: q6apm: add support to display ports in lpass dais")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
P.S. This issue is quite similar to another, already fixed one, see
commit a31a4934b31f ("ASoC: qcom: Fix sc7280 lpass potential buffer
overflow").

v1 -> v2: increase APM_PORT_MAX by 1 to ensure that no overflow
occurs if dai->id is equal to max possible value (DISPLAY_PORT_RX_7).
Thanks to Fedor Pchelkin <pchelkin@ispras.ru> for the suggestion.
Also, expand description a tiny bit.
---
 sound/soc/qcom/qdsp6/q6apm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..fa766c038d78 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -14,9 +14,10 @@
 #include <linux/of_platform.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		(DISPLAY_PORT_RX_7 + 1)
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */


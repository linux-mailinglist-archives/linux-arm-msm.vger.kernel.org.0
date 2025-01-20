Return-Path: <linux-arm-msm+bounces-45533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ABA1652A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 02:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 324A1165DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 01:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9A24C80;
	Mon, 20 Jan 2025 01:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="h0drQtDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA6A10F1;
	Mon, 20 Jan 2025 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336751; cv=none; b=Uhy43IJKtw1eJkP+s2Vs1iqNxttnT1q+8GYwAh2ouXpJJuRJXQFlMe06nj+hr23KqJsyIjhNI6MYoxtIi1UnIHS2TCCUmts6+u2tb5HnScYscsmSPhyqgOlfh1LDEHXNjXRyEsSTTfR+Zq57S23uRAjybO84GcxcACjiYIh77qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336751; c=relaxed/simple;
	bh=vdu1TigO5nobVEg3R42kQJHyloW/6WS6HQBSAY8sT0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvjWVDmeiTX0wBp8gXQ7MwYHVL9Gj1LKX9MTa53KxVN/vAWwfr0ybfJZLzeUbWUEdpORusZYPc8JOADfzU9x/DUQttMtYBB/u9A30ypapax4cxieGIaAs2zgRcuCHexC96Oa2Wq+VMCWAPsJrHDg4IpUMFz1QiFlR2DQ6EdC+7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=h0drQtDo; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Ybt9z5g4Fz9sTM;
	Mon, 20 Jan 2025 02:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1737336744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MURBR24qYXT3/f8sCeWQJ7YPDGGyUpvtE3SYqUTxqvQ=;
	b=h0drQtDovTBO7uHETN8Za+YBwL0zDszLnB+Z/77N6gARwCM/XRU3tn8ZdBPUotN0vpOzN2
	nKFySYL6Na3gd1lvvxUpMfbZU6rDRc6OYZ2ZGKQD0vAidNZpLFOm5SNb5YOU7kjGh+tbyq
	MGTncgPZjqBrPl0sspD9ssKicKo8u4akmFS/+dTUfkYhSdLNJp82Vj1PfsruXaHxvp55CM
	dMWjK3y9AREm0n15gF8tmHNyHxMn6rYq4erTD1CJGGQbJG3bKM9r6T6oP2aP/rcEw896d3
	mg6vYjLsLU9SS3vitUBb77Puv0v5Kytfm0y9h/ba3ya5aMIDLgT7HuCmYbCXbw==
Date: Sun, 19 Jan 2025 20:32:20 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: q6dsp: q6apm: change kzalloc to kcalloc
Message-ID: <s6duijftssuzy34ilogc5ggfyukfqxmbflhllyzjlu4ki3xoo4@ci57esahvmxn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 4Ybt9z5g4Fz9sTM

We are replacing any instances of kzalloc(size * count, ...) with
kcalloc(count, size, ...) due to risk of overflow [1].

[1] https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
Link: https://github.com/KSPP/linux/issues/162

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2a2a5bd98110..11e252a70f69 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -230,7 +230,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 		return 0;
 	}
 
-	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL);
+	buf = kcalloc(periods, sizeof(struct audio_buffer), GFP_KERNEL);
 	if (!buf) {
 		mutex_unlock(&graph->lock);
 		return -ENOMEM;
-- 
2.48.0



Return-Path: <linux-arm-msm+bounces-87279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F0CEF654
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 23:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD72E300BB8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 22:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902203C465;
	Fri,  2 Jan 2026 22:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="PL7mhzsY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD928504F;
	Fri,  2 Jan 2026 22:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767391373; cv=none; b=AvBmBgNztUWYhv8yNjhqVHaHwmR5+o01TMXJpEG4ZmvOGiO9zl9fHnIz2V4+40YQuH5mEQHzlUsNlrKSxhw9dLWHWsrAsA3ZXxY39oYPQwSGS0B1ypFJMKAXPYbwcI1q7zJLOVPWJin1+RES24F8hug5Xz8z2Wqlf/Hx3nRtde8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767391373; c=relaxed/simple;
	bh=0ajJhV1/3hImaEK9n273jA0jaSryeQ3IzNEx6UDDV24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gydIFPNsq2+9h0qqw1sXUTTg+Y+TyoFVbgh34SrDuylp8Jyf7WUlUXKpgZ8kyxSNK09v6MZOOhLrZhiun6dxAW0sA1UMHrVJEWnALSLaWv2pwrZOOWyAU/9chLacXqIbNVn6SKUjb0D1FFC/ZH660ValG3XgAQIfoxDVSE856fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=PL7mhzsY; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Received: from p-si-bellegarde (88-167-17-4.subs.proxad.net [88.167.17.4])
	by adishatz.org (Postfix) with ESMTPSA id 963A04C01FB;
	Fri,  2 Jan 2026 22:52:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1767390759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5kOO4pxmf3hNOobaYEaYpomPQ+IoW8Idvt4kA1liQ08=;
	b=PL7mhzsYtPjR4Ip5bsHk5wcOnQ5U1f+XVnykkNhIeOrW2SkQvXE1P40xtT/ePAvXPp3oRr
	McJwADisqAQ/rANNwwWXbwpMqiVcBlhriIgxNwbMMBXurvUOF9+eZMAkO2sSKAnawMcDzc
	0vtoPhxsKiEKFc5ZCPmv7ed9qeZ2uLUaQJViG9wbLCD0M3/CTgV9tY6Su3QwvZyoJIpAwu
	xP4E7yIlI/KyPvIuo8n1v+BFHOCPErz2ULY7vRrjbwgmSbHzi2e5rsnYCE7eQ8eTJA8U/g
	ZxvgqkcjRw+LloTZXUT37npGwcIiF8hdYPZ18PcxOQ8BGAYe/xvCUAFvWazRuA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
To: srini@kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Subject: [PATCH] ASoC: qcom: q6asm: drop DSP responses for closed data streams
Date: Fri,  2 Jan 2026 22:52:25 +0100
Message-ID: <20260102215225.609166-1-cedric.bellegarde@adishatz.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'Commit a354f030dbce ("ASoC: qcom: q6asm: handle the responses
after closing")' attempted to ignore DSP responses arriving
after a stream had been closed.

However, those responses were still handled, causing lockups.

Fix this by unconditionally dropping all DSP responses associated with
closed data streams.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index e7295b7b2461..3c4a24c9dba2 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -638,7 +638,6 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			client_event = ASM_CLIENT_EVENT_CMD_OUT_FLUSH_DONE;
 			break;
 		case ASM_STREAM_CMD_OPEN_WRITE_V3:
-		case ASM_DATA_CMD_WRITE_V2:
 		case ASM_STREAM_CMD_OPEN_READ_V3:
 		case ASM_STREAM_CMD_OPEN_READWRITE_V2:
 		case ASM_STREAM_CMD_SET_ENCDEC_PARAM:
@@ -657,8 +656,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			break;
 		case ASM_DATA_CMD_EOS:
 		case ASM_DATA_CMD_READ_V2:
+		case ASM_DATA_CMD_WRITE_V2:
 			/* response as result of close stream */
-			break;
+			goto done;
 		default:
 			dev_err(ac->dev, "command[0x%x] not expecting rsp\n",
 				result->opcode);
-- 
2.52.0



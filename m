Return-Path: <linux-arm-msm+bounces-98109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLH1JtUbuWkyrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:16:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EA2A65A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073AC307FD7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB43435C1B8;
	Tue, 17 Mar 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="T5MFRtE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49235.qiye.163.com (mail-m49235.qiye.163.com [45.254.49.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6435836F;
	Tue, 17 Mar 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738713; cv=none; b=qnNzgGIS2s6jiDmBfvnJXQsG7h6lmCAYkxQNn0Dprm2qITMbSFR7C0HobS3Q/lT9XhAtbWoA4wNokZz0/cIM6SYVHs1fzn//XUGm7NTutLHchEEVWAYwqNLYEDJb6Gswqw7aflBkH0GaVaqt187MlQ3JIqqIERVgKPkKEA/sbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738713; c=relaxed/simple;
	bh=Ajb1QPbHmj8b08GpQRql3qLsMQUU8u7NopSHVlNBGUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSGXXpsukH0ZOxBJTYc8LMDYly+YIqyMYABV59JJtbbp4r39jlFR02x6BffOloxcBBrwL1JbRDgWcdqMJvCdnPYbVrb7Y7o0X3UWK4L2QOIs4GDNRrXC8m82MykZFqNk9kp5DW6zhAYrfmQiMLUSfFlYk83OV9CAaAyodtPuMts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=T5MFRtE9; arc=none smtp.client-ip=45.254.49.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 373e3b47f;
	Tue, 17 Mar 2026 16:36:12 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 17 Mar 2026 16:35:40 +0800
Subject: [PATCH v2 1/6] ASoC: dt-bindings: es8316: Document
 everest,jack-detect-inverted property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rubikpi-next-20260304-v2-1-5634fabe0c43@thundersoft.com>
References: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
In-Reply-To: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773736570; l=1053;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=Ajb1QPbHmj8b08GpQRql3qLsMQUU8u7NopSHVlNBGUA=;
 b=wlTANxLYLfSU4wIQkyW0hjTub1X5iHjJzCskx0fG6Esor25ezYLAIgOcBZHg/T0mXxxYuLeI7
 KQTPMBxz1A1CwPZc6Jgze5FFPwYjQ21ot1YRCk/0nFbBHDPStnFZPna
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cfaf0375809d5kunm8391965e39c985
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0xKVkJDQhpOT0MZTR4YSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=T5MFRtE9wf91ANTCyyZdrhNgKfxwBV8GIkSy9WQDjrAda82Nl80I4/NovaLQgmpDAdHFtqho74xkxJaeZfIFbuimLNK3I3c3KFErEepRZh72/x/1iWbHrI9kTg5KSaHW1BYJOM9VYqbnrIRMfP133iPRduNaOMZ8QYp8Cbf73gs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=ouyxfbQT8uRoz1obRd9/fMlDp+dB5+soLr3veMB15sk=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98109-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 244EA2A65A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The es8316 codec driver already supports the everest,jack-detect-inverted
property to invert the jack detection logic, but it was not documented in
the devicetree binding. Add the missing property documentation.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index fe5d938ca310..a0a4c1c99cf3 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -60,6 +60,11 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  everest,jack-detect-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Defined to invert the jack detection.
+
 required:
   - compatible
   - reg

-- 
2.43.0



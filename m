Return-Path: <linux-arm-msm+bounces-102076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO4dHlzB1GmWwwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:33:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D94413AB655
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEF28300A3BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 08:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315CA3988F9;
	Tue,  7 Apr 2026 08:33:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78BB397E76;
	Tue,  7 Apr 2026 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550807; cv=none; b=M8AUIIGwi34EW2oPXVCEE/y2vY7wvcQr2Wc3Jv5HzztdOSoP8m7wrEy9HYD8g1R5AAvIT62pS+hHQjXEwWK1wThhpEgLYEJEFi9Kdq4ReWkB4Yc8cvUTL9tCcJkeBbS9tcnjwq7chItRSJHd+p4RskZABZmtCnLnAjXVedH3ox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550807; c=relaxed/simple;
	bh=btgOKgbuheDcUPT8oEZacQRTKrs4Vl9Yek45oxBmL2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ez+DcpHZKqltW8/uS9D5T/U5QrfIhcqA0khWdxFFjz9yrqZHowTlysqa3bkHTyhVLREFxqc1YwzEaeBlGJwtKgbV56rsM6LUZNSUdSG7ar6QioQOuj5JPJmoEHqZmRd0i1fqhk2fcCi7693K5eIDwmqIjTKkTEjHUv6a3+8D51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz11t1775550741t4bae4b67
X-QQ-Originating-IP: km4qO8TB8e0CX3fAEWqRNQfz23UNoL5SmAgx2StGANo=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 16:32:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5058057940856507686
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 16:32:05 +0800
Subject: [PATCH 6.18.y] ASoC: qcom: sc7280: make use of common helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-qcom-sdw-6-18-v1-1-2e1b884c14cf@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQ6CMBAGX4V8Z5d0G1KIr2I8QLvomgja9TeEd
 7fqcSaZWWCSVQzbakGWh5rOUwHeVIjHfjoIaSoM73xwjWvpGuczWXpSIO7Ip36QJrBwO6I0lyy
 jvn6/HULNXf3G/u/tPpwk3r4zrOsH7uS5nnkAAAA=
X-Change-ID: 20260407-qcom-sdw-6-18-2dabe461e17f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Steev Klimaszewski <threeway@gmail.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001; i=sophon@radxa.com;
 h=from:subject:message-id; bh=w+gy2MD3FrtevswuLj1MAXnzeWGi3gtTK0a6/TYrKU4=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXDorcZUj5/a4ywbHVetb/93uWm4X43ZS68TlO8OlPS
 0kpq/OtHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACYyr4KR4T6vTU7CpqPnGhak
 OGa48q/Z+eXw6ZjsPfyHKy/8PRuZtZHhn103F4/ez7lSGyI//Py8Olbfe2GWh+TFGyy3BIzW/mb
 w5QMA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NNCgUTg3ctKTMDUrCTnMZMl4OsNfKTYmF6/2Qxei4XrdNrTcEj79/YkN
	Vj7wathQG1INbkZgNJMHl54wbduGDEkeLJ7KhRJbyhUfWOGjf4aAVmOdq1oXtaWvTD8ck5P
	abQ5+vJnqJIu0eOj4IUlvsDGXcrwlv4XfXL+iUNLB0+Y5u+sUhyFjPL6Oa1M4tHmBstyYr/
	11zZHHvAYX6pNnl34YJSPVo2jcvCUw1cLpJGUmDmXk/rx9tGxEZg3ZcQoEhtKaaD9ySWW0Q
	UcGsCdUZKUVBJxehAQcnKZFpL3ONLmHWAmF5jdtsQ+5l4mvZFTaDYFO/06EH/qUzjFrBjNu
	3/SIoVfJYQeTDgA+6REwxRbK7OqQJ5Sl/PVWGMCikDph5P9Ry9EyyDuzwneUl0AMTuH17S6
	d2OkFuHlyCHlNzxY0VlXxKHczBiwub++R1bd5n/K2WbhXpL7pXOVfqAC7d173OoWxNEsH0M
	4bsFNi7Q8OmebgzlaQSvEhF8UOq7yui5zZJrzGbRezVl44eYJUZSbbbyBFuaWy/6Nu1oTrc
	vSw0g6QxUmmxlNyXetQ+yOz1ea0Ynb/jjl19uEeWxdrRVmIC0n6PylT1/Nd1v+6yjmAD1pz
	LL0rZvGokSJLjHKDTvmKh8ox6WbG1UoFZVCtyYkZ2mekG/T3PW1tZ8DQJdauooJu9Aa5Zdw
	1xT1/6ffs0n5KD09WALvAHiQfh9dWTwJIaE/k3jhIY13o7MxvMf+dOmvwdIC0HzOd8MdAbE
	/mKcA2hfcvcrDCWp2wAi2IdpXUgoY/USYfeDShxT2C231907nhrkuuvaR8xKtEzVs5gKasq
	Q6+F51gBfjSm/wKT/etAoCbsmKH2G67fDjWAZrQ5ei6M4slZHHbXrxBISwguHLlFegeJNfu
	AyPx005Njj1ZBH5UakZPypAi7p5tuZyZAsIZ9LMIkcjunRYrzwqMxca53oOq8XBvjnitBhM
	0ZBwfp00KpkScITwmU4pUmnc/QV9W5YPyr0NqaH1dQkPu0Y+LzrshPhyMLDQQNwfRBniFYK
	3Em0tJk7mLWPIOYYRBnq8lYYxpziM=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102076-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,radxa.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: D94413AB655
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

commit 8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce upstream.

sc7280 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sc7280
driver.

[This is a partial backport containing only the sound/soc/qcom/sdw.c
changes which add LPASS CDC DMA DAI IDs to qcom_snd_is_sdw_dai().
The sc7280.c refactoring changes are omitted as they depend on
intermediate patches not present in 6.18.y. The sdw.c change fixes a
NULL pointer dereference for lpass-cpu based SoundWire links.]

Fixes: bcba17279327 ("ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s
Link: https://patch.msgid.link/20251022143349.1081513-5-srinivas.kandagatla@oss.qualcomm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 sound/soc/qcom/sdw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 7b2cae92c812..5f880c74c8dc 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
@@ -35,6 +36,16 @@ static bool qcom_snd_is_sdw_dai(int id)
 		break;
 	}
 
+	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
+	 * DO NOT MERGE into top switch case */
+	switch (id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
+		return true;
+	default:
+		break;
+	}
+
 	return false;
 }
 

---
base-commit: dd26ea937ef593a9c47aa4c85296e6b57a5344a1
change-id: 20260407-qcom-sdw-6-18-2dabe461e17f

Best regards,
--  
Xilin Wu <sophon@radxa.com>



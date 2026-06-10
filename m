Return-Path: <linux-arm-msm+bounces-112411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qmftIFFIKWo3TgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:19:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2C668AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:19:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XIPUOzPw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDBAB3130273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABAC406816;
	Wed, 10 Jun 2026 11:11:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297E2406807
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:11:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089915; cv=none; b=GqnvlKrtAw4GKIAZ34QQH7rZOvPW44m0efGjFGnTX4gGorvUxojTSfKRd0uek0b0Uj9yiZ+ZnhSencSMz95Nbzhrut6Hj0C6Xg14Q6hDh1euqYPwBwBlcc+oM2R4i5PovCQANE8lTRbVITaZhMaPTP7XfCrg2eeH0xadO+/R4qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089915; c=relaxed/simple;
	bh=uO7dmp+7kXXq35mabsz2m2dY+q1mTPopJfhyX1CU2yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/QurDloq/xKJ/A0IAp53+oqHZ3UC26bz5ZkyhvG7MQGRmRz9aKlOU4gt5dMKuvm3BSH0YzmcjaJX0W8oDYZ49+1dOsGelPgTuW5NL+jsM2CjJjag73eyV8yzAsiRdXpOQx2qZWYjH9IhHdYXMIwim6gK9Wx5grmIrsfqLvE9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIPUOzPw; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso47688905ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089909; x=1781694709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxy+/rJ2nBiXps0IHi4kt0tmpzHJC70O0pAZEhcagdg=;
        b=XIPUOzPwgjXIPK7biyPPlRzceYZtN7R8dG3p1ulo+zB35BN2yXL8YeFGL2gc/yhuQj
         pXL6qs/MB2hi2ObsGmd/mf+/W6IybJgn/mR/FBymWLs5KAUOj5BmMNBMwCcPBgYDA73h
         6unGp/fsP1qf3GfsZXeiiMZWsmY/lWydnv7tDxXl/bXdTKDGoHB+fgzn4Pd9AseUIWsz
         R4ETxTraXIncb1kAgE9vb5oqL7uMbf5FPwJmwaTt0YxdxoRhlUvOLMJYcxOILk3HXemE
         P1kVnRkPReSoqeiXku9AMAotf1tESAlCQ1P/2KAYanulyMOYVHAGeIVkRXN6gcSxtXKQ
         X10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089909; x=1781694709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxy+/rJ2nBiXps0IHi4kt0tmpzHJC70O0pAZEhcagdg=;
        b=S6DGg/9VF55kaBuuvfQUfxOBphlROrYUb+mXg23S5reX6p0P2Hn5ARTBK/MrBS1yeD
         i/88Z1l6jA5v0et3F0OsndHQQ2aloOVvynxbZ0pdH34GV0/HwhMWDMM3nHzQymfOSLWL
         t449Jq5sbZI56EDnWqIdDAGJGkauXlt8SeG3C55vaHrq6IZbVavAE36kqu94EMSvSeei
         omM1Gu2wHw9beGmL93FpZD373o6ABkq7jZLS17ibvl4wUrJIPUMT+DyGt53fzklTiHeC
         7BcD6h+otuzJ25/W908peI2Fw5L7Yirpao4tw1YL4GROp7OKsQVW1CW4f7WAh5nV9gB+
         a6nw==
X-Forwarded-Encrypted: i=1; AFNElJ86RfX/0Tbb/Yvph4L/Io/azBY/6sXFVhxqWPEMizXVB5h4DAQYXumfLzHRMdd78jmRvjAHenKR0DRfCcVu@vger.kernel.org
X-Gm-Message-State: AOJu0YxOphr3XyRlYneo8nRCWn4C7YiMnXdKKhWT1zV/0ffRBCrpt2G0
	V1LN15f39vC0G48GP4hj6+apMyfaMayQPguajFVj+cQZMdlIfGFeS5/LOVmayQND
X-Gm-Gg: Acq92OFRHTxuuKDQeduycPC7JcMLCoG+2pHNDZulNCQpNrVBPdBWvt5XzyAnD18kNT5
	srFoFqvHMe8NkTEZsSREPFHtkc4jF4q9+rauWEJvdmzCHJ9wtwP2nfQFbv4CSRZ7VFjtouX3Nkk
	4YEITnKaalbdbJVv2In1/JvAI5eY1MVLczycM3kKQhMOga1pZ8sZa6Vbxdj7nE7c05g40DfO68a
	zCLhBqMbbhsvgCC4WF7+AzZvpg36vq+KPjS59kzT5skDx6Vy+Yk4HaJogm8gg1FcHL99m4w6MlT
	IVr+87aoa7fg98OkLSb09uFjCcLCg/mqZEQZ2+dKlcszPGkEFoPsy3EOcdXDg6NpT1GkmCM72MS
	HsQucsNIXGRX0AQwwR2tAmJsnh39Y83NraVwPUVGMns4jWmym4a8/S+sCrH+fcc4DMPhXUUxLrP
	cH9MWpPmGBbObbGOoiZq0SBnJ65E4ZiUdqwU8ZNgBJPSzTk/hu
X-Received: by 2002:a17:903:1a10:b0:2bd:606d:b342 with SMTP id d9443c01a7336-2c1e881ff09mr286316365ad.26.1781089909338;
        Wed, 10 Jun 2026 04:11:49 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:48 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:34 +0530
Subject: [PATCH 9/9] phy: qcom-mipi-csi2: accept PHY_QCOM_CSI2_MODE_DPHY
 phy-cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-9-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=uO7dmp+7kXXq35mabsz2m2dY+q1mTPopJfhyX1CU2yw=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYRSIMMjLHMhkZR5dO4CGE49UyTRGGP49w1C
 ttyD41c+g+JAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGEQAKCRAVlYpeERwF
 3pYHD/4uAmyfmypJaZPNO+fgd9CIEWOXJil30ot5bQFVpCScoYrN+SscUOUg/0WkUll4bJ3+x07
 4lUTL1vAUQBwAXx8sO3k6nnEfy/hQdIYedpATkAFsq1TeLYKhyCamempsswk31EIAiFcJUOC79n
 G117fd0WQzZq4hF5qG6DyZNmNWEreZZDdi7dNVXHQXgIkV0R+M28rvqsmNYiT2SztbFYux4Gusl
 9+bTO20QltCUmvr5DjhjtUpxrwJYZZ8vnVr3BSM6YaQsxq/I4tuT99q/1tWt+Mtb5H6I+9MCw0F
 dljQE7+DpI96IW1gHamorEK3exUeCkUc4MWz/ulGJmgcKZVlDDkl0lVoUUwEHhaQZ/M/6MybnAC
 4C56VRCpTM0y9lfjzrdvU+P8ZIOnbR7A26lMQhHeiGb9twCX9jHX76cpPgQBJetyUlJuxkQG1js
 neA6ecvVxK0t1kiV0kiP8K4LFIxXFRrQ9gqE9BrvROicKC6dq3YuzXzsMW3Y7vVcuoII/O+I3JD
 BcYF1fft05FfNsxqDNVRd+6CMwBGXFf+hBjCsELVOJIzG1zipThLmpLhzLuuiP/nk9zOdVSpSI0
 y8SAVNMGxwOW14k1IkqCE7g8TxwH4bj660ix4jD3y12u74goy2RB0wLdkqojUUM+1Tl06JsG10W
 /trux3pAPFc86QQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112411-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3E2C668AAA

qcom_csi2_phy_xlate() validates the phy-cell against the generic
PHY_TYPE_DPHY (10) instead of PHY_QCOM_CSI2_MODE_DPHY (0), so a correct
DPHY request from the camss DTSI is rejected with -EOPNOTSUPP and camss
probe fails with -95.

Include the CSI2 mode header and check the phy-cell against
PHY_QCOM_CSI2_MODE_DPHY.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index dfeff863a406..857c54cbaea6 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2025, Linaro Ltd.
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -188,7 +189,7 @@ static struct phy *qcom_csi2_phy_xlate(struct device *dev,
 {
 	struct mipi_csi2phy_device *csi2phy = dev_get_drvdata(dev);
 
-	if (args->args[0] != PHY_TYPE_DPHY) {
+	if (args->args[0] != PHY_QCOM_CSI2_MODE_DPHY) {
 		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
 		return ERR_PTR(-EOPNOTSUPP);
 	}

-- 
2.53.0



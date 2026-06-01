Return-Path: <linux-arm-msm+bounces-110648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IVuFle6HWoedQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:59:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BE622EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C5C0302FEBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8875039B954;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2aY9A2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F263403EA;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332950; cv=none; b=ES4ORFpxdMO+SjcNzwRtE9wjWR5To5PbvlRar6uvRKN9ZXXzjkw4SRANQ9d6kdoLhc9vjqnmM5oaS53AK8ehuISw1xqo4djsEJOi89LaA6v+tN1axjYTWItiCTV0hw8gChW8D6mh59X/ySZbn/NE3XqU+CFypJMTCxY8FuBXAQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332950; c=relaxed/simple;
	bh=6v7pnbHEqhl+JmazKgM2s3MkutECEkPUWqCabk1RSmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YbJsbocK/VxWhcg2gmS49+2LyfvxjN18JgFlXBbLq3On0yN/CyBPmeVDm6Wuht3/nJbsOAp9/ad9uiWPX1xSkPEt79M7p/uDTfZE5OMTk6gdKKhb+aF3xijzEG/utYN015EjOvGW76GdqLuIebWuKzaTtgmIwVi0jw6XuP9UaGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2aY9A2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08F94C2BCB8;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332950;
	bh=6v7pnbHEqhl+JmazKgM2s3MkutECEkPUWqCabk1RSmU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=H2aY9A2wGRvsrpJeehqdIubFVGyRFCMrGC+ecz6NY4AiACeX+xe48l/YUDYpMA+I9
	 5dDoLOAx60hOJ1gjJObnb/uTnY0Ncdsjmg6gQ7xrnXAQkdfeCyYWMig7o97F4hV6Hl
	 bwGzMbbE8x8yRmo3IbnJIgaHTW9FdpJOizksHPiuJuqB2QfTYKjmIXoPH54pVSIYpL
	 KdfYu0VfXdqeGahyrd18ZV1M3IiBGNkDSwQBfoP2ViA8yhqeYUXHUliUk/avF4bCYJ
	 G6ny5XoDIOBH3RGiXVX0ApekswPN9N8ouPF9xjehZUDkgzxe8U185nPiPuIPrWTqM5
	 4Pi2KkWzUyOUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00268CD6E5D;
	Mon,  1 Jun 2026 16:55:49 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Subject: [PATCH v4 0/3] Add support and enable the debug UART in the Pixel
 3a and Pixel 3a XL
Date: Mon, 01 Jun 2026 18:55:35 +0200
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53Oz07EIBAG8FfZcHYMhRZbT76H8TDA0MU/UIE22
 2z67tLVZC96cDOnbzKZ33dmmZKnzB4PZ5Zo8dnHUEN7d2DmiGEk8LZmJrhQXIoeJtTvca3jc0G
 wpOcRZkwFYoBk0eCKAQKdCqhBPLSy6w25ltV/UyLnTxfr+eU751m/kik78HOR6HOuJcr17Fihm
 NZLw6XZt7eUWRrgwDVq1/UtGqufppjLB6Y3KjHfxzSyHVvEzYCoQCdR28Hq3nH8A5BXQPHmP4C
 sgHLWWKUGqVr6Bdi27QuLEa3o0gEAAA==
X-Change-ID: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=6v7pnbHEqhl+JmazKgM2s3MkutECEkPUWqCabk1RSmU=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbmUlpMWuavpjbrdQjFyXUapD9LCdvOcV+MZ4
 kpBj1fAzTqJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25lAAKCRB6NCVl/2Nf
 eavtD/9G8We3Cij1iJa5rONvtJ1/dXXRDm7VEDpKtuXLvuqH61ahri9hyiWn3NdppeuurJpPJxQ
 ftw1kTg9baQqArC+4lspnUwmj1sod7GbKNuw7VD17a1trQFVm25cIwN5rPMHLibppzM/SxxQzY+
 bwONh1q9WqjcXhfVj6QArF0lw07cVuyb8zwKYK4AIMn5kpiKFIjaF1++GoJw0uD/va7rHhXyx//
 tNQzYTIBW2+htUHINQ33zPx9J0zLaV3708mak/LVaTyFD2Zfuxq2rCpGSgZitAflw1TVR3Dge08
 zZbPxEkwhnJpzzKe4S0c5yZBTRUna02qCTHNgkj7aDEVps359jishDN2TYynr7o5CpZy1cgfZwH
 wJIqNlEKWVDPc73siXpAMVfQOe16gROrL2+ZkJYuGZDEHMAkwyZU2YP9U/HmYUjOlVXyZNBGjfz
 INPSBsv+lje8zCufMJsd/i2nUblwOaje/fI687Bxv0gcRZnDnAS5QeXSCBTQTzI031rBhmZ3ICW
 0EMca/GGWLXYpH4U+9F6CERP+bxjZD1B2IwgUvcayygJNXE7ubDR+SpmvKCChUsGqT+IMsi9Ers
 L9HVVN2W5g5sjFGPNzoznrV4rt7yITXVFpBfZbUadMuQh1oO+8Flf9sQdY7G+moFL35xYJMyc32
 n2Q8gQ9oOq2mkZA==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110648-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,postmarketos.org:replyto,postmarketos.org:mid,postmarketos.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CC5BE622EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to get logs through the SBU pins in Google Pixel devices, it is
necessary to add support to the devicetree, and enable the corresponding
UART. With this code and an USB-Cereal board, I was able to get full kernel
logs through serial.

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
Changes in v4:
- Picked Reviewed-by tags
- Link to v3: https://patch.msgid.link/20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org

Changes in v3:
- Drop dependency on already-picked patches
- Link to v2: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org

Changes in v2:
- Fix typo in (3/3) commit message
- Link to v1: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org

---
Pablo Correa Gómez (3):
      arm64: dts: qcom: sdm670: add default uart pinctrl nodes
      arm64: dts: qcom: sdm670: add debug uart soc node
      arm64: dts: qcom: sdm670-google-common: enable debug uart

 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |  18 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 207 +++++++++++++++++++++
 2 files changed, 224 insertions(+), 1 deletion(-)
---
base-commit: be0cd82a9f584e562b243684303054134c8f6583
change-id: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4

Best regards,
--  
Pablo Correa Gómez <pabloyoyoista@postmarketos.org>




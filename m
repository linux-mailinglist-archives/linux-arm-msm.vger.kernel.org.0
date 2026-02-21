Return-Path: <linux-arm-msm+bounces-93548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCfJEyQcmmnZYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 21:57:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B555D16DDE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 21:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E43AC3036042
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 20:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BBB369209;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqrMRFIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3B30DECB;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771707383; cv=none; b=dgP9C7TBCgq7NPiXWISpCjg32CN9WIFLD8opEpqFWOwkEuWoMLqjOSdKCuEtdx2z7mX0WeEYBg1ieBYAtMQPpPlANRWAtGsXBHG1x+EQm6ax1Gsn1cTh+hHerA0glt2qsnTehFuZj1zYVpepFF4BL3R0Eqn4n2Wqi/oV5aQ867c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771707383; c=relaxed/simple;
	bh=AZs1vxPt9SaMKZCE+Kqbdakk7aiHEyQ2fz5IQwGzDM4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BDWDF3hRdg+eYhnXqpqFpw8+594JUJ2H83ydaJ75WdCttcT2Ll9onI6oerLDPbMAyGnqQfVExydlMDb74fd7PYfEi+6ttTi9juDxjO4FFEcptgL3o5AfgYkofEar/VAIpJlXjO723auDgqg26sBGXYsZh9klBPwYfjUGQQS3Zbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqrMRFIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C095C4CEF7;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771707383;
	bh=AZs1vxPt9SaMKZCE+Kqbdakk7aiHEyQ2fz5IQwGzDM4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oqrMRFItvl/v7dancNuxH+fbK/lMXgooePaW+XnQhfQGoxgQ+JKBfg4xnIyzR+va5
	 eaiAbX/uSLdB8QGyjxFVWKMcLYWy5ck9xgBlnTjtm7lPtVjYaYoKnmtTx4kJzHmSiN
	 RWLi0/SADNRtqZ44us15zwNk4kSFO5GAZhhYF5QbSbbWHd9nPaQhK1LDH90+xTS/Qu
	 qt+O+70eMRrN3aHK7vzhER2bu2Y4DdJyPiXqZaBhetrQtdUC5dg6fkBmjOEG+fcfxC
	 Bn5qdxiDwT1xfT/5wvCD5Z8vqVCO8jRjoAGhJgtakFEcwB67mtlDESfcGQHvduEEoo
	 ov5Ed4IdRWJvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8EFC61DE3;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Subject: [PATCH v2 0/3] Add wiko-chuppito devictree
Date: Sat, 21 Feb 2026 21:55:38 +0100
Message-Id: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMobmmkC/3XMQQ7CIBCF4as0s3YMxYrUlfcwXWA7lYlJIYCoa
 bi72L3L/yXvWyFSYIpwblYIlDmyW2rIXQOjNcudkKfaIIVUQrZHfPHD4Wif3nNyaEibudPdgdQ
 J6scHmvm9edehtuWYXPhsfG5/6z8ptyiwJ1I33SuhjLh4FxO5/UQwlFK+8lrTKaoAAAA=
X-Change-ID: 20260215-wiko-chuppito-ae8af4843e67
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771707381; l=1603;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=AZs1vxPt9SaMKZCE+Kqbdakk7aiHEyQ2fz5IQwGzDM4=;
 b=pXSnDF+RA7wbiTQmvYHeHeerUNGpJY/JhDV56vtstu2mZiArhSruhRJSKaBRMjf/LbbwAvyzn
 +8bTl8IVi42ADWoqQY+hrQzbNUhpUaSP7YCZlDcI/E47tx8bEw8m1/X
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93548-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wiko.com:url,wikomobile.com:url,posteo.de:mid,posteo.de:email,posteo.de:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B555D16DDE6
X-Rspamd-Action: no action

Add bindings vor Wiko SAS and wiko-chuppito
which are used in the devicetree.

Then introduce an initial device tree for Wiko PULP 4G.
Includes support for:
- UART
- USB (no OTG)
- Internal storage
- MicroSD
- Volume keys + Power button
- Touchscreen
- Backlight
- Accelerometer: Invensense MPU6880
- Magnetometer: Asahi Kasei AK09911
- Hall sensor: Rohm BU52021HFV
- Proximity sensor
- Vibrator
- Earpiece
- Microphone 1
- Headphones
- Wifi
- Bluetooth
- GPU

Signed-off-by: Paul Adam <adamp@posteo.de>
---
Changes in v2:
- changed company website link to wiko.com (which is just the chinese
version, changing the language redirects to wikomobile.com)
- fix minor dts styling issues
- drop gpio prefix for some nodes
- confirmed stk3310 to be correct
- remove l6: regulator-always-on
- remove gcc node
- Link to v1:
https://lore.kernel.org/r/20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de

---
Paul Adam (3):
      dt-bindings: vendor-prefixes: add WIKO SAS
      dt-bindings: arm: qcom: add wiko,chuppito compatible string
      arm64: dts: qcom: msm8916-wiko-chuppito: add initial devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 361 +++++++++++++++++++++
 4 files changed, 365 insertions(+)
---
base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
change-id: 20260215-wiko-chuppito-ae8af4843e67

Best regards,
-- 
Paul Adam <adamp@posteo.de>




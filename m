Return-Path: <linux-arm-msm+bounces-60842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3CAD3FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7EFC174ACF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461FF242D99;
	Tue, 10 Jun 2025 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="12yg+hg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AD4230BF5;
	Tue, 10 Jun 2025 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575046; cv=none; b=WoicnQNqHb5tfThhBN9JXzMy8Z1Y1/+ZdlPPkGwaOhJSpccrpjmhyMqmfOIyhpl4Qkq+ljBHI6h7vLJMZSdyiQLrNq2J1kYxsK8Ku7g2AYtarDIQcf6NvKDYuZZktNPKseZ6XrGOIGLSag5L6+aW8ii2swLZrerGdIaYzHx3chA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575046; c=relaxed/simple;
	bh=nEJHW4wNPzS2N/9ze+d/67j7fjzeMqQ+h8hJFz8lGgk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i4eCV+TWH67Sy/OFrxizgRWht+y8kkWI4ptBcRzhMs6LKzEewTeszRWG7odI04ao8+uTQwz7/mgrlrow5Rxcha5c30U4lsPB3QctUJZJQ1Vwm+nvlUZ3vWM0nvm8KwC9sfCSKH6GmjEdD6ZXFS1fN5PlQXUiTdwoyTSc/yi3x58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=12yg+hg6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749575042; bh=nEJHW4wNPzS2N/9ze+d/67j7fjzeMqQ+h8hJFz8lGgk=;
	h=From:Subject:Date:To:Cc;
	b=12yg+hg6iP3lOx0fluDHlgUw9vADP2tweia/3DIkhtaMwh86gJgAiVqO/yAvFDgbf
	 bFvTIXna2gzt5Ao6Bwk3bSFmwFMolLLhiPZLweXx5LWQb3iYdBFfPQurYo8E/+Wgsp
	 EolK+u+i40/bnIeq0YH923ZxQvp41yOX+74TMjKo=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/3] Add devicetree aliases for mmc on multiple MSM8974
 devices
Date: Tue, 10 Jun 2025 19:03:48 +0200
Message-Id: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRlSGgC/32NQQ6CMBBFr0K6dgxTEKgr72FYjGWUSaiYjqCGc
 HcrB3D5XvLfX4xyFFZzzBYTeRaV8Z7A7jLje7rfGKRLbGxuD3mJDoKGxtUlhOCBBiGFxhUdurr
 zFZJJu0fkq7y35rlN3Is+x/jZLmb82X+1GSGHxhJhgdaWl+o0TJ5eLKp7nky7rusXREb+6bUAA
 AA=
X-Change-ID: 20250419-msm8974-mmc-alias-893d197dc61a
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=nEJHW4wNPzS2N/9ze+d/67j7fjzeMqQ+h8hJFz8lGgk=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSGV7ISSA0IyU2p2m9XUCPIZLuDzvVsnnkVo7f
 e9N5klOUGKJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEhlewAKCRBy2EO4nU3X
 Vj/EEADapAMGKuq7m3ob85I3BsTXxzWJEOEepHDOGhBUZPAwbIcS4ebUENsy/5kQSJ1zwpQMkN9
 1udZKH+jV4eqW7UVx4z7OXTY0XoPul0BJnZJt9PJUN2b6C5qoJcodPgVG+w9ngoTQu/ushYCoPW
 SAjkU1VGgy95MusPQvFVmAophThCK5Qu+7tOvYrRHR7CBEVbpCMY3sS50dK2dlAjjTjS2V1IZC6
 1fdyhmrByDvQ1yHfyB2dFBfdABzLkcJydLViiobE0x+YFkb91xvwTH3haHHRAG1IT7P0nAlNFcW
 DXeITubPH7xud+HvezBIy/r3zTkQt2pFmapd6InnRcRqBdWAW+Tfp5Icaz7N59lGszXvOaHQrpD
 2XrKFsZ0iFIjzDWq0b1eSRxxth93gJOuiTousJQbgOpZEm+5Iy/jFyZQfdQ6q9+DezmUYzYWp/v
 QNzok4qe8tbh9kvqghBNZx47SPjoYSGupcQVYMwgueYYhd9RZnrsVnLTxqGCTEUDregvDSpgg33
 EEGpP7VSFUCYz2o2ntCjpql3j94H+SsTN4kH/etXmtAHLW3rcsXBbk1LZVVOU78qHt5eaydm0kI
 eeaReIiK2Q+1YZ3M5v39BVoqrAguu3NY3UI4HMmMRHEumgFp2pfCFEqmjg0MOVQa9N0RR2OTS68
 HETEBVAKvHfj+fA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0 and
- where applicable - SD card becomes mmcblk1.

This avoids issues with internal storage becoming mmcblk1 unexpectedly
and aligns this board with other boards that use MMC storage.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Expand on commit messages (Bjorn)
- Link to v1: https://lore.kernel.org/r/20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu

---
Luca Weiss (3):
      ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for mmc0
      ARM: dts: qcom: msm8974-hammerhead: Add alias for mmc0
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1

 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 2 ++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts      | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250419-msm8974-mmc-alias-893d197dc61a

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>



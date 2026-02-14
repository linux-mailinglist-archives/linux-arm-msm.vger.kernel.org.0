Return-Path: <linux-arm-msm+bounces-92841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIW6NEkzkGnbWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:33:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E9E13B66E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BB1830074C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 08:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99A02517A5;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei7t0NnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958953EBF3D;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057986; cv=none; b=fBMu+x8/PjAQATgR7ZkHhoxexa8wo7ypm3KlzYuCVUJLb23VVhgOCcgSLwXpWHoLn/qO9pbzD5H6Zx6/xgjrX0hjAkdPrtzHYSqZrf1xgw1bRXcsAA3H22DDzo1t8a8PtMWeurfGEXA3/YpY3UJRbpoFf9JYQg/fd1Q7IjPI1yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057986; c=relaxed/simple;
	bh=Ghx+NO5PD21JPthd0b2XCXAdcOQW8V5g2COXkPcaDf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YF2TrJiQC3DO4coj+kwgaXPj1AaHU1+T0Mxfo36Ob5tFA9OB/R51nD4qva14EAztbiHfWT7+eIgfK+fcA7ooWOqo/Ghf+Oe0JZp/Z0YPHdE1jCNgRL1h/G+NzQ8WHDyPE5E9B5q4YIjvMGIVTQh5eCpjgrK8+KvLib+R7DpBXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei7t0NnP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B884C19421;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771057986;
	bh=Ghx+NO5PD21JPthd0b2XCXAdcOQW8V5g2COXkPcaDf8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ei7t0NnP/RMqh/UfL4WWUr3x3R1OLMHhV3ADo8KFpBXoc81rxTkv5vK2caTmmeOON
	 Y2VShSgj5YA0YtSEa1OH4kIcMT5OjRoPB2kDtnJQxOCG7iLmGj9JjM/2sBiYk8+5tF
	 dY3lwx51zQpjUUbCWNH835yMxqr5xVErTClTyrlZa1u9SLuWwzfrDpLTo2//Jfl0Kf
	 jpmqJI/qhNCkCoFvy7H0WS/ZEl9BUIA2d4O7ahPwVkYI7jeytlLlQ0jOryI3+/dUND
	 /lEcSCrQJjaeJT0FSp+sUtvyFXkOKiPBbw1xgcQp6+6C+oC2lf5z6TwwQdcFUBV7HK
	 ErKNA24DxYtOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CF6EF99F5;
	Sat, 14 Feb 2026 08:33:05 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v3 0/4] arm64: qcom: x1-vivobook-s15: add X1P42100 variant,
 restructure dts files
Date: Sat, 14 Feb 2026 09:32:52 +0100
Message-Id: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYzkGkC/3XOQQ6CMBCF4auQrq3pFErAlfcwLigdZCJxTIuNS
 ri7BTeycPm/ZL7MJAJ6wiAO2SQ8RgrEtxT5LhNt39wuKMmlFlrpUgFU0hYyUmTLfJVOGVOU2GF
 baZEu7h47eq7a6Zy6pzCyf614hGX9OlptnQhSybyprUEwea3qIw8utD3zEHh4jOmnsLf0Fgsa9
 Q8EsIV0gurOKFWAcRrdX2ie5w8hVlcR/AAAAA==
X-Change-ID: 20260118-b4-vivobook-d05546efec82
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 "Colin K. Williams" <colin@li-nk.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771057984; l=2082;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Ghx+NO5PD21JPthd0b2XCXAdcOQW8V5g2COXkPcaDf8=;
 b=QEwgM6fwAwd7J50x07qde4b19KBiyOkcEVoA1sCPHgFkCDMC1fmcmoWlZeFrnOF3t07gTVaZz
 GgJa4haFNDjBjiyMFo4SnutLoA91rPATfDoghZPiFgskWuQVoTipoSR
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92841-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oldschoolsolutions.biz,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto]
X-Rspamd-Queue-Id: 00E9E13B66E
X-Rspamd-Action: no action

This patchset adds the X1P42100 variant of the ASUS Vivobook S15 [1]. To avoid
redundant code, it pulls the part that is identical to both variants into
x1-asus-vivobook-s15.dtsi.

I have maintained the X1P42100 variant on my tree for about a year now, it has
been tested by quite a few users. Also added sound (not in this patchset) and
users operate this successfully.

[1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v3:
- Fixed the \nstatus = "okay"; nit
- Dropped the t-b on the bindings commit
- Rebased onto next-20260213
- Link to v2: https://lore.kernel.org/r/20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz

Changes in v2:
- Fixed the bindings mixup and the redundant gpu node in the Purwa dts
- Re-partitioned the patch set to have no new dangling file
- Rebased onto next-20260210
- Thanks to all that commented on the patches.
- Link to v1: https://lore.kernel.org/r/20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz

---
Jens Glathe (4):
      dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100 variant
      firmware: qcom: scm: allow QSEECOM on ASUS Vivobook X1P42100 variant
      arm64: dts: qcom: x1-vivobook-s15: create a common dtsi for Hamoa and Purwa variants
      arm64: dts: qcom: x1-vivobook-s15: add Purwa-compatible device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1362 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1346 +------------------
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   44 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 6 files changed, 1411 insertions(+), 1345 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260118-b4-vivobook-d05546efec82

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>




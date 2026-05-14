Return-Path: <linux-arm-msm+bounces-107636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDdLET3YBWoncQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:12:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B8542D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33B15303ECBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6928F40FD94;
	Thu, 14 May 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KER9KMHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B440759F;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767765; cv=none; b=qY80wb0r3AKotrDG8R7BR4PX3EmVWV6xTJ6d5eY+uUQA/ftOrfiiQbPnGekvQ6OWZaNL2yzxN7WuXrqb5rQ3v5vAsaCLvBsNmdHU0eysv882S3LoI04RXGyIxylwmCnCeRAGeGTbNJ+t42k6yYijfp2NZXKfm6FTHGmSBl7RQxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767765; c=relaxed/simple;
	bh=/ME0Mw8yFZ6acKIvcXuH13dYDD4es0j3/Ym2DfKBlFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UqEoYoQptAznLTNqpUPUWF93iXTxZxmXSzfi7jh77sUSZsDTXmsh9TEj3g7vmTQKS/XVs5WIf++9otVtkaLiZ4hdR6l0uMkb6zQ0pG5FRH+hVxQ+PDAmkp4E+vpF5RPQ7XkFlH9q/aIF+vgG1iAs/SS0cvMe9hLuqdGwK5ZNFj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KER9KMHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 719B3C2BCF5;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767764;
	bh=/ME0Mw8yFZ6acKIvcXuH13dYDD4es0j3/Ym2DfKBlFs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KER9KMHrgxZMcrW0fvlmzrsUCDsuA+o9rDRz6wSTPeEIWrJj34NwRu7+GGpngOo9J
	 qNX+mVr6hKHhqacXohCg/3Ke5KyccjSgHLsLjR+reWoaR5aPW7wWYpnCqN6uk11unB
	 F+PHo+UTGZ72JxBCd+oLsvBoJtkYVY8ZFfhBN2zxniQ+t07PL7WEVnSmhc0X0hYjsh
	 tXq9oafkSqnqbL34OOByXnIcmWcK17izEfKYpZ0tVJvpVhWyrQU7BrH/HXlNWA485E
	 oHdmvn9wdFDpTaDJ9NmHGsCCOOzjpZKre/FxYt2tlmflzbyGvgH1nwyVk0iUxAjzLG
	 G1FHULDNGjiOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CB4CD4F25;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Subject: [PATCH v2 00/10] ARM: qcom: msm8960: enable WCNSS (Bluetooth &
 Wi-Fi)
Date: Thu, 14 May 2026 21:08:29 +0700
Message-Id: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3XBWoC/1XMQQ6CMBCF4auQWVvT1jqKK+9hWGA7yMSUmo6ih
 nB3CzuX/0veN4FQZhI4VRNkGlk4DSXspgLft8ONFIfSYLXdG2tRRYnHGrV6c8fqSuRDjR7RIZT
 LI1PHn5W7NKV7lmfK31UfzbIuEGpn3D80GqWV1ocutHVAs3Nnie1wf0nKsvUpQjPP8w8NMxvnr
 QAAAA==
X-Change-ID: 20251226-msm8960-wifi-beecd96c6646
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=4038;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=/ME0Mw8yFZ6acKIvcXuH13dYDD4es0j3/Ym2DfKBlFs=;
 b=3+cCOPgqxOC30E+M91NO38mx3txRrZoUgnrINY4ZX4cqAmks4oVnSC9ZNzwzrlCOL3qWAMIOn
 VlEQO3aPrYbC0Uf1UH2yL2fyyAgmZveP0N4JSFXAW1s3LVvRKLn90eU
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Rspamd-Queue-Id: 3B8B8542D5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107636-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:mid,smankusors.com:replyto,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Action: no action

Enable the WCNSS (Riva) subsystem on MSM8960-based devices to support
Bluetooth and Wi-Fi.

Add the required device tree nodes and resources, including memory
regions, clocks, interconnects, and communication interfaces used by
the WCNSS firmware and drivers.

Changes:
- Add Riva (WCNSS) nodes: firmware memory, WCN3660 iris radio,
  Bluetooth and Wi-Fi subdevices, and pinctrl states
- Add SMSM and SPS nodes for coordination with the WCNSS subsystem
- Add shared memory and hardware lock for inter-processor communication
- Add SCM node for secure channel manager interaction
- Add RPM clock controller and required QDSS clock resource
- Add bindings for SPS interrupt controller and RPM clocks

This series supersedes the earlier dt-bindings-only submission [1] and
includes the corresponding driver and DT integration changes.

This patch series depends on:
  [2] "dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks for
  qcom,ci-hdrc"
for fixing the USB controller clock configuration on MSM8960.

Tested on:
- Sony Xperia SP
- Samsung Galaxy Express (SGH-I437) - requires additional work for
  firmware loading (separate series pending)

Known limitations (not addressed in this series):
The wcn36xx driver appears to misclassify 2.4 GHz networks as 5 GHz
during hardware scanning, preventing association with 2.4 GHz networks.
This issue has also been observed on MSM8916 and MSM8953 platforms
using WCN3620 [3][4].

[1] https://lore.kernel.org/all/20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com/
[2] https://lore.kernel.org/all/20260509-qcom-ci-hdrc-clock-fix-v1-1-f52386bf85da@smankusors.com/
[3] https://github.com/msm8916-mainline/linux/commit/cc4abc694fcf2c942410136bc58a61e79bf21e83
[4] https://github.com/msm8953-mainline/linux/commit/779c9627ec0b971bf466588e64fe530cf78a414d

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Changes in v2:
- Updated cover letter about the previous dt-bindings only submission
  and the dependency on the USB controller clock fix series
- Drop the apq8064 reference from the commit message for adding msm8960
  QDSS clock resource
- Add fallback compatible "qcom,rpmcc-apq8064" in the rpmcc node
- Updated qcom,rpmcc dt-bindings to allow for fallback compatible
- Put clocks, clock-names, reg, reg-names, interrupt-names, &
  smem-states entries one per line in the rpmcc, riva, and wifi nodes
- Move riva pinctrl assignments to SoC DTSI
- Renamed hwmutex to hwlock for consistency with the dt-bindings
- Link to v1: https://patch.msgid.link/20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com
- Note: an incomplete v1 also exists at https://lore.kernel.org/all/20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com/
  due to SMTP rate limit. Please ignore that thread.

---
Antony Kurniawan Soemardi (10):
      dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
      dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
      mfd: qcom_rpm: add msm8960 QDSS clock resource
      clk: qcom: clk-rpm: add msm8960 compatible
      ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
      ARM: dts: qcom: msm8960: add SCM
      ARM: dts: qcom: msm8960: add SMEM & hwlock
      ARM: dts: qcom: msm8960: add SMSM & SPS
      ARM: dts: qcom: msm8960: add Riva
      ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |  77 ++++++----
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |  15 ++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 170 ++++++++++++++++++++-
 drivers/clk/qcom/clk-rpm.c                         |   1 +
 drivers/mfd/qcom_rpm.c                             |   1 +
 6 files changed, 234 insertions(+), 32 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20251226-msm8960-wifi-beecd96c6646

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>




Return-Path: <linux-arm-msm+bounces-94102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GhTEezqnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:28:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E0197537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48403026C06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DED53ACF0C;
	Wed, 25 Feb 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6ZRjqdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED170392C27;
	Wed, 25 Feb 2026 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022215; cv=none; b=qXQCxPCb/cUx9mdFBpLK4/lEUd90cHDq+nqkX5cCRJVEKrSS8omyvDT+KydeDU18Rz461XRO9GoeduGIgi1FnuMscNzcJ3Kf+tZbblPkpxGnbRdm+G3SkxNtWk5mfbTByTdlzQMTpt0PukZdd+ZIQs7ZcYQlgDW3rEeutf3Oyec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022215; c=relaxed/simple;
	bh=C7Zenm+BDARl0dby+xvY6F+YytdyD7GpTvVJArMA95Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LiGeFQ09ceKupzvV7UFXaxZArQX0H/IOM1o/fSS6drplRXWk3+OTK923VASBWLH0HJod0jixCQJYOYYE2HaTEq5G1jK/YFEfofp4UmdufFmeGoffzughrqKtM4CRYbv/bkWp55B31C0K/8DRlO5qyDuWjja1ypSFCp3EpvV4YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6ZRjqdI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BD7C116D0;
	Wed, 25 Feb 2026 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772022214;
	bh=C7Zenm+BDARl0dby+xvY6F+YytdyD7GpTvVJArMA95Y=;
	h=From:Subject:Date:To:Cc:From;
	b=W6ZRjqdIhUXsLeQuw8feYPhc6cGB1+shjpCatqqXnW/EsWRF8zGsAf+P8gCsV69JS
	 AYfTrudbgYo7cKxc/ADorXEMi5GsDNPBL0gku1I/W7jYFzcNO9l5vTjqePrsniIrZX
	 DroA//GrkaCrLciryMpAM9/SaDXe7ssVja+Q+aA5YjkKAO/7BV5VQsOOuYIX8oy7bB
	 AbQsvnWbkStKl6UzaW8Qe8p4sLuSCT/+LdvHQMtThMrbkzM85SC9ih0pR0GCA9ejZE
	 5lvcInv2KwlHDpBLeIMZBrqqXs54ImzNQ8MFGXJNGmj4w56sk9/1oMZG7N0Iqp+Vu0
	 yCMVkfFA/rKtw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 00/10] Fix up WCN6855 RFA power supply name
Date: Wed, 25 Feb 2026 13:23:20 +0100
Message-Id: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33O0Q6CIBQG4FdxXEfjYCB21Xu01hJQ2RIU1GrOd
 490rZvmzdn+/+L7z4SC9kYHdEwm5PVognE2hnSXIFnfbKWxUTEjSigDQgnuXWskfkjLBWPXthm
 uqi+UsVXAOVXikDJBpU5RBFqvS/Nc8PNlzV53Q9zof2VtQu/8a3lghE+7blHCtrZGwAQDZxyg5
 CKT4uRC2HfD7S5d0+zjQR99pF+RE4B8U6RR5ApkxjgRRVH8Eed5fgNyhSUVMgEAAA==
X-Change-ID: 20251020-topic-wcn6855_pmu_dtbdings-92d843582ce3
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772022207; l=2912;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=C7Zenm+BDARl0dby+xvY6F+YytdyD7GpTvVJArMA95Y=;
 b=M0W4BCygdBRj+oP2rwNVYFBWtk+sDXJ0eExHNJ1I9Zyh56eFvO40TmsxhZXsa+7mqERo7LSTe
 wbwxkYQytfTBhQeZ6f1DNyAEbZZI0pM8CMlKpbS31l77ndvU8EfoLPO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94102-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,bgdev.pl,holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 984E0197537
X-Rspamd-Action: no action

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") renamed the supply representing the
VDD17_PMU_RFA leg to mention "1p8" instead.

While the supply's voltage is normally 1.8 V, the bindings should
reflect the actual naming of the pin. Moreover, almost all DTs define
the output as 1p7, so that ends up looking a little odd..

Ultimately, this is a "fake" regulator that is consumed for the sake
of DT sanity and this series is meant to bring uniformity and squash
checker errors.

The last patch fixes up a less-trivial warning.
sc8280xp-microsoft-arcata is left out because I don't know whether the
mounting of the chip is on-board or as an M.2-y card (although I would
guesstimate the prior).

Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
bindings split of qualcomm-bluetooth.yaml), mentioned below

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Rebase once more, pick up more tags, it's more than ready to pick up
- Link to v2: https://lore.kernel.org/r/20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com

Changes in v2:
- Rebase, drop dependency (in -next now), pick up tags
- Link to v1: https://lore.kernel.org/r/20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com

---
Konrad Dybcio (10):
      dt-bindings: net: bluetooth: qualcomm: Fix WCN6855 regulator names
      arm64: dts: qcom: qcs615-ride: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA supply name
      arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
      arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply name
      arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply name
      arm64: dts: qcom: lemans-ride-common: Fix up WCN power grid

 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  7 ++---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   | 32 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  2 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  2 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  2 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |  2 +-
 10 files changed, 42 insertions(+), 13 deletions(-)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20251020-topic-wcn6855_pmu_dtbdings-92d843582ce3

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



Return-Path: <linux-arm-msm+bounces-95598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dn5H2thqWk96gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:56:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D2210265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 652E1301AA9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED3C378D94;
	Thu,  5 Mar 2026 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkRSH7a+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D730B509;
	Thu,  5 Mar 2026 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708153; cv=none; b=hEHMOLOUFAXQAWwYhiFltz42LVSIaARkZnebgZ4OjrQ1VtIo+ACAIfdUhludCRNKbD8vadv1NhbzjXJcde6UjaS+UN6mcCFWxs62/wQCct7LW29yL74Y4D8jscuu9TcDaYRMdLCVLMbMD7ngrE1E0zlOGZxlaqVJQaA7peVXw5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708153; c=relaxed/simple;
	bh=w0/jog6Zwr5G/s42bpK5By9/P8OkG6hhmyCC6CjddII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UaxTv8EaIHVGJJ9eub78dRGfGEp8r3tPXSpDQdY/iMRvaHDLNke4Rz+MGGfP4Mq3cNIt0oftDsiRYQv8n8L3A9fy5tIHlBKak+M+i86Mu6o4F4SD2m7r1jL5tol82PFtlBb6Qkh3iN0AlEsL8ZT57wBB4UE7HmhyfVvmaaiqeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkRSH7a+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A98C19423;
	Thu,  5 Mar 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708152;
	bh=w0/jog6Zwr5G/s42bpK5By9/P8OkG6hhmyCC6CjddII=;
	h=From:Subject:Date:To:Cc:From;
	b=SkRSH7a+2X+PlSWz1h1rdOjoLw//ZdyjhJNPW3zC5/5ZjY8B3CGQfKT5Dc7TwidFf
	 Eo8e148Oe7v6l7XYl07g1v6sHICglXe2og1VDLpeIfjFNU/aN5ZjYXOh8dikn0jbUb
	 VGycXrtvg+x/JOwJL7x0QsnD4bU/2BPh+dPyGh41ecLnpt20HpC9Pejf36qGygd70K
	 Jsp1FL/a2kvhrqUABQuYOBVo+hRks9rtY7ILuOhAhyVcUiknvQ51/zATo5AdxE9xAY
	 yw1fcdSq5Mdho9Sf2gmYUpSVYRW1lK8BZXmwPwJSBNeygOfL+q5EUZW2gyVmZfIFyB
	 GOsy0sCsiKewA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/7] Grab IPA IMEM slice through DT, part 2
Date: Thu, 05 Mar 2026 11:55:39 +0100
Message-Id: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBREr0K6toQWG9QV9zCEfEsrP7EU+gvRE
 O5uxYU7N5O8SWbeysgENMQu2cqCWZDQDwnkIWO6h+FuOHaJmSykKpQsefQjao4jtM64tovE1cm
 qripBWClY2o3BWHzun9fmy8FMc7qOv7JHij68du8iPu0/xSJ4wW0FcD5a0AJutSfKpxke2juXp
 2DNtm1vbgMkz84AAAA=
X-Change-ID: 20250523-topic-ipa_mem_dts-58f5d73a1f21
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708147; l=2067;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=w0/jog6Zwr5G/s42bpK5By9/P8OkG6hhmyCC6CjddII=;
 b=jD3tDT/nmvKo8StYfmvLn+eQFXq5P647My3YejwltRoKsTM5gMsMYePaUz/9jFxQOEgzVDt+D
 Qdfy5Xr1sVmAuTSZ62nDUcrlB67eie6PV/KdO3Yxbyed0V1KpEDL7pv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 870D2210265
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
	TAGGED_FROM(0.00)[bounces-95598-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

The IPA IMEM slice addresses/sizes are hardcoded in the driver. That's
mucho no bueno, especially since the same versions of IPA are used
across a number of vastly different platforms, which invalidates that
approach completely.

This series wires up the IMEM slices in DT on almost all platforms
(need some more time for SDX55/65) and fills in the necessary bindings
holes.

Tested on SC7280 only, FWIW.

Patches 1-3 are good to go instantly, the rest must wait for the
bindings changes that were submitted in the series marked as a
dependency.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Rebase (drop applied changes), drop dependencies (now in next)
- Make 8[56]50 use its own compatible and not 8350's (three people
  didn't notice ;)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com

---
Konrad Dybcio (7):
      arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice

 arch/arm64/boot/dts/qcom/kodiak.dtsi |  6 ++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi |  6 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi |  6 ++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++++++
 7 files changed, 82 insertions(+)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20250523-topic-ipa_mem_dts-58f5d73a1f21

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



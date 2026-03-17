Return-Path: <linux-arm-msm+bounces-98201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJyuA1tquWmZDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:51:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A15092AC5BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43A5F30AF951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316143E867C;
	Tue, 17 Mar 2026 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsZi4YE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1AB3A6EF8;
	Tue, 17 Mar 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758482; cv=none; b=GUVNA3z0DxOsaYPGFc9i3QKcpY5aPlu8kcRfIJcU0Ow5ykIO76ugEA0qMrSIZxQAbug7BgQ+/n5l+JsQPsf+WXftu7gutNUnBgL6gABa82aOAL4AylWm+2QyLvsmVBR6KkJNg4U2Gf5eQrlaRN4LWf5GLysAzGKSyyJJhPgCe8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758482; c=relaxed/simple;
	bh=cCZyrwoJTutOdtatTTGYDDdTrgYPCBHH8+BsCAXqMwI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqtBmndFadMce/2EGG8DpemXzHU8Xae0YSzP9zXIVhFzYAClp1IT9PUoqLgYKV/5mMfU+DVgmiVzkwUakYpiqejW5oQ5bm/8fBUjxIudd1qoKEdgkODrqQN/rnBR7aCu+e5JzBccVf4vekCAXSKQOPF/z00Ys2M5I4MZkDM9fuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsZi4YE9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2547FC19424;
	Tue, 17 Mar 2026 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758481;
	bh=cCZyrwoJTutOdtatTTGYDDdTrgYPCBHH8+BsCAXqMwI=;
	h=From:Subject:Date:To:Cc:From;
	b=VsZi4YE98s59cGpuWO6Ud2VDomEdbClA68YC6zEsXIYznzEPFJinSxcqvl2Ti1lWL
	 IBhUwZlbh+52bnPAubsDaQFit+yGSERyWss9qBrmRN2ivDE1UcSpOM77L7cRee8IjG
	 xOfCLfkX7LPu1LpKp/K7UM7nUhM6CPsvaFxq/vOXCEJRe66TtKQZ/Scck9dpwlNCTZ
	 Ihttr0olkOPWIEnaC1nGzo3Bl2Z8wlvWDJAcxYrL0xkZ8GvizY8xzf08y0IB/lfb7t
	 QfAKBpitC2WawbvpOrFesXKDV3BNaHqsnHcIWi8S+GxVx7lPSo4cb8fVD2tvyMlSId
	 6/ilXrKBrp2Lg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/6] Fix up GIC_ITS ranges in QCOM DTs
Date: Tue, 17 Mar 2026 15:41:13 +0100
Message-Id: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL7ndCDTLpKhMS61v6YaEUQ3j3rc
 xhmHkgUmRKM4oFIFyfefYGmEoDb4leSbAtDW7eq7ppBHntglHwkEz9tHN9nkHpYXI9WWW0RShs
 iFfF/pznnF3Hyi4hnAAAA
X-Change-ID: 20260317-topic-its_range_fixup-87af5cd6d8dc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tengfei Fan <tengfei.fan@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jishnu Prakash <quic_jprakash@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773758475; l=1095;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cCZyrwoJTutOdtatTTGYDDdTrgYPCBHH8+BsCAXqMwI=;
 b=xUZf3XKwqJGMohIYim+JLc+dSRyNKVvXgdz32wOHGPfaMl5ctzxGodalkVthtcKQ2OUONrbI/
 L6N7wBEgemQAg7lZuhWELno1TAKtRgfx80oSq3qhhEL8V5y6z5QZD4w
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98201-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A15092AC5BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Platforms with GIC-700 have additional registers (such as GITS_SGIR).
Checked against the docs and compile-tested only.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (6):
      arm64: dts: qcom: kaanapali: Fix GIC_ITS range length
      arm64: dts: qcom: milos: Fix GIC_ITS range length
      arm64: dts: qcom: sm8450: Fix GIC_ITS range length
      arm64: dts: qcom: sm8550: Fix GIC_ITS range length
      arm64: dts: qcom: sm8650: Fix GIC_ITS range length
      arm64: dts: qcom: sm8750: Fix GIC_ITS range length

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/milos.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-topic-its_range_fixup-87af5cd6d8dc

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



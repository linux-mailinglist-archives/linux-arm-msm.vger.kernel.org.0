Return-Path: <linux-arm-msm+bounces-91051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COQWG/oremnz3gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:32:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B7A3E8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1245C3023016
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B9C28B4E2;
	Wed, 28 Jan 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey0Cgf/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770C288C96
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614252; cv=none; b=k1ac82EVNOBQtaauGriBbk5NHPE4mG7GK3vcHdMCglWNfoyfJ4iuSwxh7Z11PwDkNExGXLmula/VuQ+cNVQ/xy2Vdws1H8qDeQ8afgbNcL3ijDE67hzi31j8VrE9Va3czcCtyCgnCreEEqC/7GR2iHMc9ZpBs6yhh8freb7Wkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614252; c=relaxed/simple;
	bh=J991PkmjZ7cA51EaGuqYRzLfi0O3QuM9Zcdo95J/bZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaGEeBFqdCVBjikz4xZfJm6G6TGxXf9NjuAyctjVId8XYMYFNHh0S3+dSL1IeLBPOcbkIkj+F+vw7zElIW7EykTXqS3W8XaY3d+Gbw6ICDi9WPPid819qZtIsJUt0xJSScP5nAfrCWkmVtAnXIu0JcS0Fmyo5Kd+JZYzcM+nRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey0Cgf/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEEDC4CEF1;
	Wed, 28 Jan 2026 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769614252;
	bh=J991PkmjZ7cA51EaGuqYRzLfi0O3QuM9Zcdo95J/bZs=;
	h=From:To:Cc:Subject:Date:From;
	b=Ey0Cgf/BeMmcHmj9Po1fk/yF9Z/LBh3tzQRGuNTcualGu6dgs18PGcZT73ljIOQwN
	 rdc/+4WGYKPAV9tbIwjeb8CmxBxJfrUS9SDW+ffmc1NoJBgrXEPj+XiZ/c6xaw850m
	 YC96uVsb6/HqeAIjUe9AX/wv78r5RaNCHHAgP5qrQzW7D8o7xT4OVvONxmGcrc7cSm
	 Ykg7R+STzZgnSSZBkSdcYr6TQZMN8+pNEKGEggAYbQz3WGbHIV9ZuV2Jlbc/21HeGA
	 RsuFwGbkJRTs0c7LyJQusnjcDXiqHZrQE/nnu3Lf3zKTjMNiGfBYlACA6+l2oJtvTP
	 ppQsiycLvJEsQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v6.20
Date: Wed, 28 Jan 2026 09:30:50 -0600
Message-ID: <20260128153050.2092039-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91051-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A0B7A3E8D
X-Rspamd-Action: no action


The following changes since commit fc12767c19d49663b13ba2def6e4674df041c8a2:

  dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Glymur Platforms (2026-01-17 15:35:17 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.20-2

for you to fetch changes up to 78c13dac18cf0e6f6cbc6ea85d4f967e6cca9562:

  arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions (2026-01-21 13:15:50 -0600)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree updates for v6.20

Enable ADSP FastRPC and add missing GPU memory regions on Agatti.
Also add the missing GPU regions on SM6115.

Describe the application subsystem watchdog on Hamoa and enable this in
the EL2 configurations.

Add the camera control interface (CCI) I2C controller on MSM8953, and
describe the camera regulators and the camera EEPROM on Fairphone FP3.

Specify clock frequency for the i2c4 bus on OnePlus 6, to silence the
warnings about missing frequency definition.

Add FastRPC and associated heap memory, as well as Coresight, on SM8750

Switch a variety of platforms to use the generic RPMPD_ constants,
instead of target-specific duplicated, to allow us to drop these from
the header files.

Drop the invalid opp-shared on the QUP OPP table for Talos.

----------------------------------------------------------------
Abel Vesa (3):
      dt-bindings: watchdog: Document X1E80100 compatible
      arm64: dts: qcom: hamoa: Add the APSS watchdog
      arm64: dts: qcom: x1-el2: Enable the APSS watchdog

Alexey Klimov (2):
      arm64: dts: qcom: sm8750: add memory node for adsp fastrpc
      arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes

David Heidelberg (1):
      arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock frequency

Dmitry Baryshkov (2):
      arm64: dts: qcom: agatti: enable FastRPC on the ADSP
      arm64: dts: qcom: switch to RPMPD_* indices

Jie Gan (1):
      arm64: qcom: dts: sm8750: add coresight nodes

Konrad Dybcio (2):
      arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

Luca Weiss (5):
      arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl states
      arm64: dts: qcom: msm8953: Add CCI nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add camera fixed regulators
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI and add EEPROM
      arm64: dts: qcom: sm6350: Add clocks for aggre1 & aggre2 NoC

Viken Dadhaniya (1):
      arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table

 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |    1 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   49 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |    8 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  516 +++----
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   16 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   57 +
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |    2 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    2 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    3 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 1431 +++++++++++++++++---
 arch/arm64/boot/dts/qcom/talos.dtsi                |    1 -
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    4 +
 19 files changed, 1694 insertions(+), 466 deletions(-)


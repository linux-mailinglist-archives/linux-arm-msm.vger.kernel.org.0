Return-Path: <linux-arm-msm+bounces-91709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLLvAWYtgmlFQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:16:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87DDC9D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDFA830010E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 17:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D802417C2;
	Tue,  3 Feb 2026 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ3cEh1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDE1A76DE;
	Tue,  3 Feb 2026 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138979; cv=none; b=KEcSmD/mZBhdVdMcR8pbpApxfIg2D4jYI2ZFNF89xl4525cpBz7o/myAmdve1XZ9eDmukvpiuNM52s8gD9hmWUzplCF4tZfF7y3G4R8ur9y41uaH59Yla3/wEcB+xXtooKbl5UCh+KPUtbS4NdQGE/bzcOWP+U3Tq/z1Gaq5Fio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138979; c=relaxed/simple;
	bh=V+hRYaveht9zKYaY/x1O5Uifx5AVMz4lD+Sn9iPlVes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nFPjcZOb0RgkHlOWz3QrDMnlDji60sTWv5Hla3NZVURrF65tfVA6Ju+G2UfQdINFiGXXiyGNhr61XEYWXsrosYq4IrTsBoyGRsRJCd64LB1smV7KlmnPQd32BhLMQbT0xX5sCLCXlBytO9QhTRX7mv9JmGiPhcZe1agdfTjAdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ3cEh1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8305AC116D0;
	Tue,  3 Feb 2026 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770138979;
	bh=V+hRYaveht9zKYaY/x1O5Uifx5AVMz4lD+Sn9iPlVes=;
	h=From:To:Cc:Subject:Date:From;
	b=GQ3cEh1/aMEa1eRzUixJkttpRawZoqz4f7u8KkkpBmx7jTWjibs1zj/DH+ViIr621
	 BaVOfdcElW0Jd2Hky6y/TK26NkwP2HwruSO72btzEzmMR2OzqWIYiEyuUaGcT2xTHI
	 O1az1+38QA0ZNAwVwieSa9LZ3XnWePr0nPiaB23h1E61I/XefUWLIoZXyuegyiWjuh
	 c9OTs3K+1dHjBcMX9AhbCmVr9haOH51n2LeczDsMO/t7BwFvwiNiqULBrMEL9XWyt9
	 RhRsyXe8IJgkLXAIl7ATvEE1FUbvn+cbR7sbYyQjNe7HmTlLzCBL8u1YQ/5kwGSh0I
	 FOage/04NqELg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Daniil Titov <daniilt971@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Petr Hodina <petr.hodina@protonmail.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.20
Date: Tue,  3 Feb 2026 11:16:16 -0600
Message-ID: <20260203171616.2830464-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91709-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,mainlining.org,redhat.com,gmail.com,linaro.org,ixit.cz,outlook.com,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9D87DDC9D6
X-Rspamd-Action: no action


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.20

for you to fetch changes up to 012e012e4917da06b512a3074980c3091949befa:

  clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc (2026-01-28 14:23:35 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v6.20

Convert clock dividers from round_rate() to determine_rate().

Add support for global, tcsr, rpmh, display, gpu, camera, and video
clock controllers for Kaanapali.

Add support for camera clock controller for SM8750.

Fix the SDCC RCGs to use shared_floor_ops across a variety of platforms.

Add support for global clock controller on MSM8940 and SDM439.

----------------------------------------------------------------
Barnabás Czémán (6):
      dt-bindings: clock: gcc-msm8917: Add missing MDSS reset
      clk: qcom: gcc-msm8917: Add missing MDSS reset
      dt-bindings: clock: qcom: Add MSM8940 Global Clock Controller
      dt-bindings: clock: qcom: Add SDM439 Global Clock Controller
      clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
      clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc

Bjorn Andersson (4):
      Merge branch '20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org' into clk-for-6.20
      Merge branch '20260103-ufs_symbol_clk-v2-1-51828cc76236@oss.qualcomm.com' into clk-for-6.20
      Merge branch '20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com' into clk-for-6.20
      Merge branch '20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com' into clk-for-6.20

Brian Masney (3):
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()

Daniil Titov (2):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8940
      clk: qcom: gcc: Add support for Global Clock controller found on SDM439

David Heidelberg (1):
      clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src

Dmitry Baryshkov (1):
      clk: qcom: gfx3d: add parent to parent request map

George Moussalem (1):
      clk: qcom: gcc-ipq5018: flag sleep clock as critical

Jagadeesh Kona (8):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops

Krzysztof Kozlowski (4):
      clk: qcom: gcc-kaanapali: Fix double array initializer
      clk: qcom: rpmh: Fix double array initializer on Kaanapali
      clk: qcom: videocc-sm8750: Constify qcom_cc_desc
      clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc

Petr Hodina (1):
      clk: qcom: dispcc-sdm845: Enable parents for pixel clocks

Taniya Das (20):
      clk: qcom: rpmh: Update the clock suffix for Glymur
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS mux clocks
      clk: qcom: gcc-x1e80100: Add missing UFS symbol mux clocks
      clk: qcom: rcg2: compute 2d using duty fraction directly
      dt-bindings: clock: qcom: Add camera clock controller for SM8750 SoC
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

Vladimir Zapolskiy (2):
      clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
      clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs

 .../bindings/clock/qcom,gcc-msm8953.yaml           |    6 +-
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   11 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    8 +-
 drivers/clk/qcom/Kconfig                           |   71 +-
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 +++
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |  454 +++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 +++++++++++++++
 drivers/clk/qcom/camcc-sm8750.c                    | 2710 +++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   41 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rcg2.c                        |    7 +-
 drivers/clk/qcom/clk-regmap-divider.c              |   16 +-
 drivers/clk/qcom/clk-rpmh.c                        |   60 +-
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 +++++++++++
 drivers/clk/qcom/dispcc-sdm845.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm7150.c                   |    2 +-
 drivers/clk/qcom/gcc-glymur.c                      |    4 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |    1 +
 drivers/clk/qcom/gcc-kaanapali.c                   | 3540 ++++++++++++++++++++
 drivers/clk/qcom/gcc-milos.c                       |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  282 +-
 drivers/clk/qcom/gcc-msm8953.c                     |    1 -
 drivers/clk/qcom/gcc-qdu1000.c                     |    4 +-
 drivers/clk/qcom/gcc-sdx75.c                       |    4 +-
 drivers/clk/qcom/gcc-sm4450.c                      |    6 +-
 drivers/clk/qcom/gcc-sm8450.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8550.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8650.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8750.c                      |    4 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   76 +-
 drivers/clk/qcom/gpucc-kaanapali.c                 |  482 +++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/tcsrcc-kaanapali.c                |  141 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 +++++
 drivers/clk/qcom/videocc-sm8750.c                  |    2 +-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |    2 +
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   13 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |   30 +
 include/dt-bindings/clock/qcom,sm8750-camcc.h      |  151 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |    3 +
 50 files changed, 14504 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
 create mode 100644 drivers/clk/qcom/cambistmclkcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/cambistmclkcc-sm8750.c
 create mode 100644 drivers/clk/qcom/camcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/camcc-sm8750.c
 create mode 100644 drivers/clk/qcom/dispcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gpucc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gxclkctl-kaanapali.c
 create mode 100644 drivers/clk/qcom/tcsrcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/videocc-kaanapali.c
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-camcc.h


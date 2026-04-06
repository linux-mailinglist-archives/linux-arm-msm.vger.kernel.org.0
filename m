Return-Path: <linux-arm-msm+bounces-101952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +tHFLw6z02kdkgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3B3A37E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B0B0300C9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 13:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3BC3290C3;
	Mon,  6 Apr 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx/63tbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD7E1A5BAE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481612; cv=none; b=kWpbusKGvuB0wqwD/qOfGksGpr1L8WqU1PiS8tWx7q0PhbmijuhF4Q8/uclrm2yN1fIKC2z6v8ovYaMYu4n18sw5AK+wUoSkDHKYPOU6usR/Gi6N/TWlCO017VPbFT4VnhUI058VAXTs6i7y8Eg3aVLhBhQVosDY1qEsGwNwDOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481612; c=relaxed/simple;
	bh=StZoYZSX3E03qoBHUpVi4AQ8Vdh7LtYLTjwMGiHSG10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maXInv49VEyEIYMGAPXWf3UcIxCYHz1JrOKFej00RubrgirqSd8gIB9UosJs+oGeNCdYzA3SN7m3Vw+jWL7f3v0l39JtgcE21FqGuNQv/GODzBC9A+A9M44nZek2qE9b2KQniLVmt7SUnqWwwyrkKUFnQpIJIp2vCxryEuZ2jyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx/63tbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268CDC4CEF7;
	Mon,  6 Apr 2026 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481611;
	bh=StZoYZSX3E03qoBHUpVi4AQ8Vdh7LtYLTjwMGiHSG10=;
	h=From:To:Cc:Subject:Date:From;
	b=lx/63tbTBTxuSxb+GUC1vG9fWJr7naq+7Hx8amitFSBw96HDow9a5P9EtlPvI2qBE
	 /tQsB6uTEvRlVSskV95YURmF2UxXB62MB9O3LTlMbn5eUGi4BKsMA7Sh65TEH/aW1i
	 A4V56wXyAjG1kTwcA+SkK/J1iwWLUNVArP6ScKF/RYBwlsanWOrhgBnqCLGnD+sfBd
	 uzhZSOaipmHa0lB0WPgz51msd/JBnyiiKyMCIR506FY6pEVxjVVbSz6ltbe/V1XRAe
	 zwo5wY7CqWbM9RvbhU1h7w/SoytBZgfFuhg/9dv2Af8/6Di/UzPhttTcquAV0ce4d2
	 LjNN/RWcxbPtg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Sajna <sajattack@postmarketos.org>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Jie Zhang <quic_jiezh@quicinc.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: [GIT PULL] A few more Arm64 DeviceTree updates for v7.1
Date: Mon,  6 Apr 2026 08:20:07 -0500
Message-ID: <20260406132007.2264408-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arndb.de,postmarketos.org,oss.qualcomm.com,gmail.com,linaro.org,quicinc.com,shiftphones.com,tuta.io];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30E3B3A37E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit b683730e27ba4f91986c4c92f5cb7297f1e01a6d:

  arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1-2

for you to fetch changes up to af241225893ac4933bb8f0615f2dfda8ea2326ce:

  arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X (2026-04-02 16:08:54 -0500)

----------------------------------------------------------------
A few more Arm64 DeviceTree updates for v7.1

Introduce the Hamoa-based Lenovo IdeaCentre Mini X, the Dragonwing
IQ-615 (Talos) EVK, and a Talos EVK camera overlay.

Enable DisplayPort support on the Glymur CRD.

Add WiFi, Bluetooh, LEDs, and venus on LG-based SDM845 devices. Add
battery, charger, and display on the LG G7 ThinQ.

Enable SD-card, describe the audio amplifier, and increase the speed of
the i2c clock for touchscreen on the SHIFT SHIFT6mq.

Add camera subsystem, camera control interface, GPU, GMU, and GPU
cooling on the Talos platform. Enable the GPU on the Ride board.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: glymur-crd: Enable DisplayPort support

Alexander Martinz (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890 codec

Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Bjorn Andersson (2):
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X

Casey Connolly (2):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
      arm64: dts: qcom: sdm845-shift-axolotl: Set higher touchscreen i2c clock

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (2):
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Mukesh Ojha (1):
      arm64: dts: qcom: talos: Add EL2 overlay

Odelu Kukatla (1):
      arm64: dts: qcom: talos: Add clocks for QoS configuration

Paul Sajna (10):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
      arm64: dts: qcom: sdm845-lg-common: Enable venus
      arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
      arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg: Add wifi nodes
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

Sudarshan Shetty (3):
      dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
      arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
      arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

Wenmeng Liu (4):
      arm64: dts: qcom: talos: Add camss node
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   14 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   16 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1200 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   10 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |  210 +++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |  127 ++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |   28 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   59 +
 arch/arm64/boot/dts/qcom/talos-el2.dtso            |   25 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |   63 +
 .../dts/qcom/talos-evk-lvds-auo,g133han01.dtso     |  127 +++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  617 ++++++++++
 .../boot/dts/qcom/talos-evk-usb1-peripheral.dtso   |   27 +
 arch/arm64/boot/dts/qcom/talos-evk.dts             |  139 +++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  436 ++++++-
 16 files changed, 3033 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/talos-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts


Return-Path: <linux-arm-msm+bounces-82167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02BC666DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 23:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D247F208E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 22:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E87530AD0E;
	Mon, 17 Nov 2025 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8wlncCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F026F2A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763418547; cv=none; b=h7kDPvAQN0XflHhoii02U0QXTSC4Dh2zSs4ehDn7JU5wXi0dAOkCUnfTiaro+EVAJictqvVEk6nvHOMxZ6sGNiN3/X7o9m719ARqS4hZL4QRphIlcD4q+tgnvVYR49JjcBDJUS4z+o1Tfz/a/UGFA2llB+v6Wp4BfBvaL8LkuFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763418547; c=relaxed/simple;
	bh=hl6CH6Yiq+xysgEp8DyKDlYJqVA2cXF/gQZc0kWutMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mPhp+rxWWIbb4RCK2a9n/ce4Poqp4+yH1zj//+AnhPglMaO6BDsHykLEean0F2oRNPVn2xljA1e2MMNS00+BhxR/AJEYsBUC/H3vSogjcXMPn/c/eftsvGO6753ylxB1mcijLEZh+OqrgHTUYTFHFS1WQcSgwwowSQvFjnt8b3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8wlncCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F9AC2BC86;
	Mon, 17 Nov 2025 22:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763418545;
	bh=hl6CH6Yiq+xysgEp8DyKDlYJqVA2cXF/gQZc0kWutMQ=;
	h=From:To:Cc:Subject:Date:From;
	b=M8wlncCxSGxfRQPIymaZo4WJAl0U3f3OWetzfSktkpa4viEkMr/FXU6+1UGDGMzkb
	 0gu45EvOVbfoafi2qKVpPUgJKb/TQTa66MkKRcXkb4U4llAHruRlRGd0kSW5MBBXKK
	 E9mDu8U1osLMTtwYg3YgjJaN3lhNA1d73pY2dha3F1Hs+PhPZZMP6RnVQTcZAfluSg
	 eG9r9fn21B/5fgOv5wLBYAwXDsakMeyAoRPNPULQ87r43r6z0rb/vmOmoEAyIhVTOn
	 9VwU5t1IVcQXHxa52m1TiWkCGmlvHZP6VIFGKJYr2PFJeT0+WiTlmn0tGaDny26gZ/
	 pErbj5fm+x8AQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	David Heidelberg <david@ixit.cz>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Jingzhou Zhu <newwheatzjz@zohomail.com>,
	Li Liu <li.liu@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Wojciech Slenska <wojciech.slenska@gmail.com>,
	Xilin Wu <sophon@radxa.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dang Huynh <danct12@riseup.net>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Gergo Koteles <soyer@irl.hu>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Jonathan Albrieux <jonathan.albrieux@gmail.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Le Qi <le.qi@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Sarthak Garg <quic_sartgarg@quicinc.com>,
	Valentine Burley <valentine.burley@collabora.com>,
	Wenmeng Liu <quic_wenmliu@quicinc.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Xueyao An <xueyao.an@oss.qualcomm.com>,
	Yu Zhang <yu.zhang@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.19
Date: Mon, 17 Nov 2025 16:33:37 -0600
Message-ID: <20251117223345.3192497-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.19

for you to fetch changes up to f481e772e014da92fa1232de54e4cac66b5fc5e4:

  arm64: dts: qcom: sdx75: Add missing usb-role-switch property (2025-11-14 09:23:44 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.19

Introduce support for the Redxa Dragon Q6A development board, the Huawei
MateBoot E 2019, the Asus ZenFone 2 Laser/Selfie, the MSM8937 platform
and the Xiaomo Redmi 3S device based on it.

SoC dtsi files for Agatti, Hamoa, Kodiak, Monaco, Purwa, and Talos, are
renamed in order to better facilitate the addition of new boards on the
various SKUs of these.

Cooling maps are introduced for the CPU cores in IPQ5424, and the
network subsystem clock controller is added.

On Lemans, RTC is enabled, the EVK fan controller is described and a
camera mezzanine overlay is introduced.

Touchscreen support is added to the BQ Aquaris M5, and the touchscreen
from Samsung Galaxy Core Prime is moved to the common platform to
benefit the other devices sharing common definitions.

On Agatti two more UARTs are described, as well as APR and the related audio
services, and the LPASS LPI pin controller. The RB1 board gets HDMI
autio playback support.

On Kodiak-based targets, Fairphone FP5 gains definitions of the UW camera
actuator, regulator for the ToF sensor, and haptic module. The SHIFT
SHIFTphone 8 gains RGB and flash LEDs, and Venus support. The Rb3Gen2
development board gets QUP firmware path defined, to support dynamic
loading of the serial engine firmware. Kodiak also gains Coresight
devices for AOSS and QDSS blocks.

Display support is added for the Talos platform, and enabled on the Ride
board. Talos also gains the definitions to scale DDR and L3
interconnects.

On SC8280XP, the camera privacy indicator on Lenovo Thinkpad X13s is
connected to the camera stack. Off-by-one GPI DMA channels are
corrected.

The SDM845-based LG and OnePlus custom defined rmtfs guard pages are
replaced with the inline-support for guard pages.

SDX75 DWC3 node is flattened and marked for USB role switching.

On SM8550, the camera subsystem and the S5K3M5 camera sensor is
introduced for the QRD, and an overlay for the "Rear Camera Card" for
the Hardware Development Kit (HDK) is introduced.

USB support is introduce for the SM8750 platform, and enabled in the MTP
and QRD devices.

On Hamoa, like on other devices the Asus Zenbook A14 definition of the
eDP panel is reworked to support both LCD and OLED configurations. WiFi
and Bluetooth is also enabled on the A14. The CRD gains support for
controlling charge limits.

The refgen regulator supplying DSI is defined and wired up on a variety
of platforms.

----------------------------------------------------------------
Aleksandrs Vinarskis (4):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 UX3407QA LCD/OLED variants
      arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
      arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable WiFi, Bluetooth
      arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator

Alexander Martinz (4):
      arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and indentation
      arm64: dts: qcom: qcm6490-shift-otter: Remove thermal zone polling delays
      arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
      arm64: dts: qcom: qcm6490-shift-otter: Enable venus node

Alexey Klimov (3):
      arm64: dts: qcom: qcm2290: add APR and its services
      arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
      arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio playback support

Antony Kurniawan Soemardi (2):
      arm64: dts: qcom: pmi8950: Add missing VADC channels
      arm64: dts: qcom: pmi8950: Fix VADC channel scaling factors

Barnabás Czémán (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Bjorn Andersson (5):
      Merge branch '20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com' into arm64-for-6.19
      Merge branch '20251014-qcom_ipq5424_nsscc-v7-2-081f4956be02@quicinc.com' into HEAD
      Merge branch 'arm64-fixes-for-6.18' into HEAD
      arm64: dts: qcom: qcs6490-rb3gen2: Rename vph-pwr regulator node
      Revert "arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature"

Casey Connolly (2):
      arm64: dts: qcom: qcm6490-shift-otter: Enable flash LED
      arm64: dts: qcom: sdm845-oneplus: Update compatbible and add DDIC supplies

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

David Heidelberg (4):
      arm64: dts: qcom: sdm845: Define guard pages within the rmtfs region
      arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl
      arm64: dts: qcom: sdm845-oneplus: Describe TE gpio

Dmitry Baryshkov (26):
      arm64: dts: qcom: lemans: move USB PHYs to a proper place
      arm64: dts: qcom: lemans: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc7180: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc7280: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc8180x: add refgen regulator and use it for DSI
      arm64: dts: qcom: sdm670: add refgen regulator and use it for DSI
      arm64: dts: qcom: sdm845: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm6350: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm8150: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm8250: add refgen regulator and use it for DSI
      arm64: dts: qcom: qcs8300: add refgen regulator
      arm64: dts: qcom: sc8280xp: add refgen regulator
      arm64: dts: qcom: sm6375: add refgen regulator
      arm64: dts: qcom: rename qcs8300 to monaco
      arm64: dts: qcom: rename x1e80100 to hamoa
      arm64: dts: qcom: rename sm6150 to talos
      arm64: dts: qcom: sdm670: create common zap-shader node
      arm64: dts: qcom: sdm845: create common zap-shader node
      arm64: dts: qcom: sc8180x: create common zap-shader node
      arm64: dts: qcom: sc8280xp: create common zap-shader node
      arm64: dts: qcom: sm8250: drop duplicate memory-region defs
      arm64: dts: qcom: sc7180: add gpu_zap_shader label
      arm64: dts: qcom: add gpu_zap_shader label
      arm64: dts: qcom: rename qcm2290 to agatti
      arm64: dts: qcom: rename sc7280 to kodiak
      arm64: dts: qcom: rename x1p42100 to purwa

Dzmitry Sankouski (2):
      arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
      arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts

Eric Gonçalves (1):
      arm64: dts: qcom: sm8250-samsung-common: correct reserved pins

Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
      arm64: dts: qcom: msm8939-asus-z00t: add initial device tree

Fenglin Wu (1):
      arm64: dts: qcom: x1e80100-crd: Add charge limit nvmem

Gaurav Kohli (1):
      arm64: dts: qcom: lemans-evk: Enable AMC6821 fan controller

Gergo Koteles (1):
      arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider

Griffin Kroah-Hartman (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI pull-up
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam actuator

Guido Günther (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Drop address and size cells from panel

Jie Gan (1):
      arm64: dts: qcom: kodiak: add coresight nodes

Jingzhou Zhu (2):
      dt-bindings: arm: qcom: Document Huawei MateBook E 2019
      arm64: dts: qcom: Add support for Huawei MateBook E 2019

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen properties

Jonathan Albrieux (1):
      arm64: dts: qcom: msm8916-longcheer-l8910: Add touchscreen

Kathiravan Thirumoorthy (1):
      arm64: dts: qcom: ipq5424: correct the TF-A reserved memory to 512K

Konrad Dybcio (7):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/resets
      arm64: dts: qcom: x1e80100: Extend the gcc input clock list
      arm64: dts: qcom: x1e80100: Describe the full 'link' region of DP hosts
      arm64: dts: qcom: x1e80100: Move CPU idle states to their respective PSCI PDs
      arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio node name
      arm64: dts: qcom: lemans: Align ethernet interconnect-names with schema
      arm64: dts: qcom: sdx75: Fix the USB interrupt entry order

Krishna Chaitanya Chundru (6):
      arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
      arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to pcieport0 node
      arm64: dts: qcom: sm8450: Add opp-level to indicate PCIe data rates
      arm64: dts: qcom: sm8550: Add opp-level to indicate PCIe data rates
      arm64: dts: qcom: sm8650: Add opp-level to indicate PCIe data rates
      arm64: dts: qcom: x1e80100: Add opp-level to indicate PCIe data rates

Krishna Kurapati (5):
      arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
      arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB controller
      arm64: dts: qcom: lemans: Add missing quirk for HS only USB controller
      arm64: dts: qcom: sdx75: Flatten usb controller node
      arm64: dts: qcom: sdx75: Add missing usb-role-switch property

Le Qi (1):
      arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker playback support

Li Liu (2):
      arm64: dts: qcom: Add display support for QCS615
      arm64: dts: qcom: Add display support for QCS615 RIDE board

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Fix camss register prop ordering

Luca Weiss (12):
      dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
      arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies to simple-fb node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add VTOF_LDO_2P8 regulator
      arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct compatible for audiocc
      arm64: dts: qcom: qcm6490-shift-otter: Use correct compatible for audiocc
      arm64: dts: qcom: sm7325-nothing-spacewar: Use correct compatible for audiocc
      arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
      arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
      arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
      arm64: dts: qcom: sm6350: Add interconnect support to UFS

Luo Jie (5):
      dt-bindings: clock: Add "#interconnect-cells" property in IPQ9574 example
      dt-bindings: interconnect: Add Qualcomm IPQ5424 NSSNOC IDs
      dt-bindings: clock: gcc-ipq5424: Add definition for GPLL0_OUT_AUX
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5424 SoC
      arm64: dts: qcom: ipq5424: Add NSS clock controller node

Manikanta Mylavarapu (1):
      arm64: dts: qcom: ipq5424: add cooling maps for CPU thermal zones

Neil Armstrong (1):
      arm64: dts: qcom: sm8650: set ufs as dma coherent

Pengyu Luo (1):
      arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels

Praveen Talari (1):
      arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup IRQ storm

Rakesh Kota (2):
      arm64: dts: qcom: qcs6490-rb3gen2: Update regulator settings
      arm64: dts: qcom: lemans-evk: Add resin key code for PMM8654AU

Raviteja Laggyshetty (1):
      arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and CPU OPP tables to scale DDR/L3

Raymond Hackley (1):
      arm64: dts: qcom: msm8916-samsung-rossa: Move touchscreen to common device tree

Sarthak Garg (1):
      arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default

Tingguo Cheng (2):
      arm64: dts: qcom: qcs8300-pmics: Remove 'allow-set-time' property
      arm64: dts: qcom: lemans-pmics: enable rtc

Val Packett (2):
      arm64: dts: qcom: x1-dell-thena: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-dell-thena: remove dp data-lanes

Valentine Burley (1):
      arm64: dts: qcom: apq8096-db820c: Specify zap shader location

Viken Dadhaniya (3):
      arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name to QUPv3 nodes
      arm64: dts: qcom: lemans-evk: Add firmware-name to QUPv3 nodes
      arm64: dts: qcom: monaco-evk: Add firmware-name to QUPv3 nodes

Vladimir Zapolskiy (3):
      arm64: dts: qcom: sm8550: Add description of MCLK pins
      arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
      arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay

Wenmeng Liu (1):
      arm64: dts: qcom: lemans-evk-camera: Add DT overlay

Wesley Cheng (3):
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

Wojciech Slenska (2):
      arm64: dts: qcom: qcm2290: Fix uart3 QUP interconnect
      arm64: dts: qcom: qcm2290: Add uart1 and uart5 nodes

Xilin Wu (2):
      dt-bindings: arm: qcom: Add Radxa Dragon Q6A
      arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A

Xin Liu (1):
      arm64: dts: qcom: qcs615-ride: Update 'model' string for qcs615 ride

Xueyao An (1):
      arm64: dts: qcom: HAMOA-IOT-SOM: Unreserve GPIOs blocking SPI11 access

Yu Zhang(Yuriy) (1):
      arm64: dts: qcom: qcs615-ride: Set drive strength for wlan-en-state pin

 Documentation/devicetree/bindings/arm/qcom.yaml    |   17 +-
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   63 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   62 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +
 .../boot/dts/qcom/{qcm2290.dtsi => agatti.dtsi}    |  172 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |    4 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   38 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |    7 +-
 .../qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} |   20 +
 .../boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi}    |  171 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   95 +-
 .../boot/dts/qcom/{sc7280.dtsi => kodiak.dtsi}     |  300 +++
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  105 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   28 +
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |    9 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  133 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |    6 +-
 .../qcom/{qcs8300-pmics.dtsi => monaco-pmics.dtsi} |    1 -
 .../boot/dts/qcom/{qcs8300.dtsi => monaco.dtsi}    |    7 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |   46 +
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |   22 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |   20 -
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2133 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |  256 +++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |    6 +-
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |    6 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |    6 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts    |    6 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |   14 +-
 .../boot/dts/qcom/{x1p42100.dtsi => purwa.dtsi}    |    4 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   51 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    2 +-
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |    2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |   82 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  155 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1095 ++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   76 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   65 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    6 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    7 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   14 +-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    9 +-
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso           |    6 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   12 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    4 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |    2 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   12 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    9 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   19 +
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso         |    6 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   12 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   20 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   12 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  185 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |    7 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   14 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   21 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    7 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  138 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    2 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |   23 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   27 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    7 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    7 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   13 +
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |  971 +++++++++
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    9 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |    6 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   72 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    6 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    6 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   59 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    6 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    5 +
 arch/arm64/boot/dts/qcom/sm7325.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    7 +-
 .../arm64/boot/dts/qcom/sm8250-samsung-common.dtsi |    3 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    7 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |    7 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   57 +-
 .../boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso |   91 +
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   52 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  226 ++-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   83 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   79 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   73 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  161 +-
 .../boot/dts/qcom/{sm6150.dtsi => talos.dtsi}      |  330 ++-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |    9 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |    9 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |    7 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   10 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   10 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   10 +-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |  104 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |    2 +-
 .../qcom/x1e80100-dell-inspiron-14-plus-7441.dts   |    2 +-
 .../boot/dts/qcom/x1e80100-dell-latitude-7455.dts  |    2 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   10 +-
 .../dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts   |    6 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |    4 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   10 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   12 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   10 +-
 .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts     |   62 +
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    |  133 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |  138 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |    2 +-
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |    4 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |    4 +-
 include/dt-bindings/clock/qcom,dispcc-sm6350.h     |    4 +
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    3 +-
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     |   65 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |   61 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   33 +
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     |   46 +
 138 files changed, 8554 insertions(+), 945 deletions(-)
 rename arch/arm64/boot/dts/qcom/{qcm2290.dtsi => agatti.dtsi} (93%)
 rename arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} (96%)
 rename arch/arm64/boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi} (98%)
 rename arch/arm64/boot/dts/qcom/{sc7280.dtsi => kodiak.dtsi} (97%)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
 rename arch/arm64/boot/dts/qcom/{qcs8300-pmics.dtsi => monaco-pmics.dtsi} (98%)
 rename arch/arm64/boot/dts/qcom/{qcs8300.dtsi => monaco.dtsi} (99%)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8937.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
 rename arch/arm64/boot/dts/qcom/{x1p42100.dtsi => purwa.dtsi} (99%)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
 rename arch/arm64/boot/dts/qcom/{sm6150.dtsi => talos.dtsi} (92%)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-nsscc.h


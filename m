Return-Path: <linux-arm-msm+bounces-25419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08C79294E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 19:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B28311C208ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 17:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1327172F;
	Sat,  6 Jul 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxRXkUna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D538FB9
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jul 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720287107; cv=none; b=VB3TsiXzEPV0RvbQ3JaXfDod6Dar8OdEy5ekDcEUm6Zl2Am7iklSdpUsiSFGjbHpp/aGsUp9bNKu5jON7RQ/fKQ2nnaruKLZWCrJMS6O5KQb8U+DLISEIhtwtXW6RSNrVioia6JUUrRw6xRqUrVfMxxhT0OQ/ywzXsxVZn/+3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720287107; c=relaxed/simple;
	bh=eL72ChiuzkXsxh7MN+2z4hSCPhLpOjwCXi81Pq4+FKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c/sOy7NmEAGnePfw5KaXqB2Dgb2j2DO/NNyFjKxaDBJIeZpKhoS8FcSBm86H+dFFcUlqo/1gazH6VuWy1ofWZQGDUvJSZBgWcM+N4rdz6+iJhr/rPYK1e6U5lYlhhiiesNRSMzty1Ka0Yab3O9gwI2tc417VgElENAmZpEH6pFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxRXkUna; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E426C2BD10;
	Sat,  6 Jul 2024 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720287106;
	bh=eL72ChiuzkXsxh7MN+2z4hSCPhLpOjwCXi81Pq4+FKU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mxRXkUnaIuZV5Uh/m1JEQsYNTnXiffbHF65bMBSHWfG0+ozTKWRkvv+3BC9AQ3CT/
	 eUOFF0P4UoEM/X0Jm7JHdrKxIdmUv/irm0Hr9M+b26HhPXAorgJoj/mHxp1Ttb78Vi
	 a7/OFhO1U6nvK8BrmC7sKHUM6N1jk/fVIYW6qbHgxG4nmYRzcdnDjJ+3hc2s2Db33w
	 zG38BDBb2tBPz9cEAhxHw6pTMjfhJzq2KmvYCKGHhIdPTkGfcs4Xpaa2D/u0ihUxJP
	 YgFbJcteQiHVZrCZqC4u346FtMaLNEieLqGCaAiRcm7wNjgGZtjPI6Ih0Y1AGrgMdf
	 j8rSyOzl64upg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
	Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
	Caleb Connolly <caleb@postmarketos.org>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	Joe Mason <buddyjojo06@outlook.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lin@web.codeaurora.org, Meng-Bo <linmengbo06890@proton.me>,
	Marc Gonzalez <mgonzalez@freebox.fr>,
	Naina Mehta <quic_nainmeht@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Aboothahir U <aboothahirpkd@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Alexandre Messier <alex@me.ssier.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Bryant Mairs <bryant@mai.rs>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Cong Zhang <quic_congzhan@quicinc.com>,
	Dang Huynh <danct12@riseup.net>, David Wronek <david@mainlining.org>,
	Gianluca Boiano <morf3089@gmail.com>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Kaushal Kumar <quic_kaushalk@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Martijn Braam <martijn@brixit.nl>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Nikita Travkin <nikita@trvn.ru>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Agarwal <rohiagar@qti.qualcomm.com>,
	Ruby Iris Juric <ruby@srxl.me>,
	Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
	Siddharth Manthan <siddharth.manthan@gmail.com>,
	Umang Chheda <quic_uchheda@quicinc.com>,
	Valeriy Klimin <vdos63@gmail.com>,
	Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>,
	=?UTF-8?q?Wiktor=20Strz=C4=99ba=C5=82a?= <wiktorek140@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.11
Date: Sat,  6 Jul 2024 12:31:38 -0500
Message-ID: <20240706173140.18887-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.11

for you to fetch changes up to 968178e35e78e566f75dbb7fbfc4dd1436ce8309:

  dt-bindings: arm: qcom: Document samsung,ms013g (2024-07-02 22:15:29 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.11

This introduces 11 new boards, namely:
* ASUS Vivobook S 15
* Lenovo Smart Tab M10 DTS
* Motorola Moto E 2015 LTE (surnia)
* Motorola Moto G 2015 (osprey)
* Motorola Moto G4 Play (harpia)
* Qualcomm AIM300 AIoT development board
* Qualcomm SM8650 Hardware Development Kit (HDK)
* SHIFTphone 8
* Samsung Galaxy Z Fold5
* Schneider HMIBSC board DTS
* TP-Link Archer AX55 v1

Of particular interest here is the Asus Vivobook, the first supported X1
Elite consumer laptop.

For IPQ6018 an SDHCI controller is added and on IPQ9574 an MDIO bus is
described.

The improvements to MSM8916-based devices continues, with sound and
mdoem support added to Acer Iconia Talk S and GPLUS FL8005A, the latter
also gaining BMS support. Samsung Galaxy devices gains PMIC and charger
definitions, NFC support and MUIC. Accelerometer and magnetometer
support is added to the Samsung Galaxy Grand Prime devices.

On MSM8976 definitions for IOMMU, the display subsystem, wifi subsystem,
and Adreno GPU are added.

On MSM8996 UFS core clock frequencies are specified, FastRPC nodes are
added for the audio DSP, glink-edges are described where available, the
display subsystem reset is added.

Venus is introduced on MSM8998 and the "No MSA Ready" quirk is added to
allow ath10k to come up.

GPU support is added to QCM2290 and enabled on the RB1 development
board.
The I2C controller used for communicating with the LT9611UXC HDMI
bridge is temporarily replaced with i2c-gpio while issues with the
builtin controller is diagnosed. The same is done for RB2, on the
QRB4210 platform.
On RB2 TCPM max current draw is corrected and the vreg_l9a regulator is
marked as always on to match expectations.

On the QDU1000 platform, USB is added, secure QFPROM is introduced to
allow LLCC to access OTP data. USB is enabled on the two IDP boards.

SA8775p gains PCIe endpoint definitions, LLCCC support, IMEM and PIL
info regions. Nodes are marked as dma-coherent as needed, a dedicated
carveout for shared memory bridge allocations is introduced.
The SA8775P ride device is split in the two versions r2 and r3.

The SC7180 Trogdor clamshell/detachable fragments are refactored for
convenience, and pwmleds are disabled where unused.

On SC7280 the APR nodes for interfacing with the audio services in audio
DSP firmware are introduced. The Qualcomm SMMU TBUs are described, to
enable improved debug support. QoS clocks are added to interconnects, as
needed in order to operate the QoS settings on some buses.
SuperSpeed in park is disabled for the primary DWC3 instance to address
host controller issues under load.

The PM8008 (camera PMIC) is introduced in Fairphone 5, regulators are
named for better output, and firmware name for IPA is adjusted to the
preferred file format.
The HDMI bridge on Rb3gen2 is described, rtc, gpi-dma and qup nodes are
enabled.

The Type-C port manager found in PM7250b is enabled, for targets not
using pmic-glink firmware for Type-C management.

SC8180X gets a number of smaller corrections, and some cleanups -
related to both functional issues and DeviceTree validation.

The PSHOLD node is marked reserved, after reports that this causes
issues during shutdown. Description of the USB signals are updated to
match the signal path. The PM8008 camera PMIC is added to Lenovo
ThinkPad X13s.

The PM660 PMIC is extended with charger and rradc definitions, and the
SDM670 gains a SMEM region definition.

On SDM845 the Qualcomm SMMU TBU nodes are described, to enable improved
debug output during faults etc. The UFS PHY is associated with its GDSC,
and the DisplayPort controller is wired up to the QMP PHY.

The Lenovo Yoga C630 Embedded Controller is introduced, adding battery
and Type-C port management and altmode support. The C630 also gains WiFI
calibration variant information, to cause selection of the right data.
The missing IPA firmware path is corrected.

For the SDX75 platform, AOSS, IPCC, SDHCI, TCSR, modem SMP2P, I2C and
SPI nodes are introduced. SD-card support is added to the IDP board.

CPUfreq support is introduced for the SM4450 platform.

Missing reset is added to the SDHC controller of SM6115. The UFS PHY
is associated with its GDSC, so is the PHY on SM6350.

On Fairphone 4, the camera pmic (PM8008) is introduced, regulators are
named for more informative debug output, and USB role switching is
enabled.

On the Fairphone 3, vibrator support is added and enabled.

On SM8250, the USB signal paths are properly described in the OF graph,
the UFS PHY gains its required power-domains description.
Thanks to the introduction of PCI power sequence support, the QRB5165
RB5 WiFi chip can now be powered up, so this is added.

Touchscreen interrupt flags are corrected accross a number of Sony
Xperia devices, to remove the unexpected traces from downstream.

On SM8450 an OPP-table is introduced for the PCIe controllers, to
specify the bandwidth and performance state requirements for the
different genrations and link widths. For this the PCIe controllers also
gains interconnect path definitions. The LLCC register layout is
corrected, and the UFS PHY is associated with its GDSC.

On the SM8550 development boards speaker port mapping is added. WiFi
support is finally enabled on the QRD board.
The new AIM300 development platform/board is introduced.

For SM8650 video and camera clock controller are introduced. SCM node
gains details necessary to trigger USB ramdump (download mode) upon a
system crash.
WiFi support and speaker port mapping is added to the QRD and the newly
introduced HDK. On the MTP the USB Type-C connector is describe to be
routed to the PHY.
In addition to the base HDK, a Display Card overlay is also introduced.

For X1 Elite bwmon, fastrpc and GPU support, tsens, and the missing PCIe
6a instance are added. Thermal zones are described. Pmic-glink is
introduced for both CRD and QCP devices, and remaining PMICs are
described. Audio support is also added to the QCP.
An explicit, larger, chunk of CMA memory is added to the various
devices, in order to compensate for the lack of IOMMU for PCIe.

Across a wide range of platforms, the thermal zone polling delays are
removed as supplies are interrupt driven anyways. Also thermal related
is the introduction of GPU thermal throttling, across many SoCs.

The old SMSM implementation is finally transitioned to using the
mailbox-based description and implementation for invoking interrupts on
remote processors. As such interrupt-triggering is converted to use this
mechanism on related platforms.

The usb-role-switch property is removed for all USB instances hard coded
to either host or peripheral across a range of boards.

----------------------------------------------------------------
Abel Vesa (11):
      arm64: dts: qcom: x1e80100-crd: Fix USB PHYs regulators
      arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs regulators
      arm64: dts: qcom: x1e80100-crd: Fix the PHY regulator for PCIe 6a
      arm64: dts: qcom: x1e80100-qcp: Fix the PHY regulator for PCIe 6a
      arm64: dts: qcom: x1e80100: Describe the PCIe 6a resources
      arm64: dts: qcom: x1e80100: Disable the SMB2360 4th instance by default
      arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets and add MHI
      arm64: dts: qcom: x1e80100: Add remote endpoints between PHYs and DPs
      arm64: dts: qcom: x1e80100-crd: Add pmic-glink node with all 3 connectors
      arm64: dts: qcom: x1e80100-qcp: Add pmic-glink node with all 3 connectors
      arm64: dts: qcom: x1e80100: Fix USB HS PHY 0.8V supply

Aboothahir U (1):
      arm64: dts: qcom: pm660: Add rradc, charger

Adam Skladowski (4):
      arm64: dts: qcom: msm8976: Add IOMMU nodes
      arm64: dts: qcom: msm8976: Add MDSS nodes
      arm64: dts: qcom: msm8976: Add Adreno GPU
      arm64: dts: qcom: msm8976: Add WCNSS node

Akhil P Oommen (1):
      arm64: dts: qcom: x1e80100: Add gpu support

Alexandre Messier (1):
      dt-bindings: arm: qcom: add HTC One (M8)

Alexandru Gagniuc (1):
      arm64: dts: qcom: ipq9574: add MDIO bus

Alexandru Marc Serdeliuc (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Z Fold5
      arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Z Fold5

Barnabás Czémán (1):
      arm64: dts: qcom: msm8996: add reset for display subsystem

Bartosz Golaszewski (7):
      arm64: dts: qcom: sm8550-qrd: add the Wifi node
      arm64: dts: qcom: sm8650-qrd: add the Wifi node
      arm64: dts: qcom: qrb5165-rb5: add the Wifi node
      arm64: dts: qcom: sa8775p: add a dedicated memory carveout for TZ
      dt-bindings: arm: qcom: add sa8775p-ride Rev 3
      arm64: dts: qcom: move common parts for sa8775p-ride variants into a .dtsi
      arm64: dts: qcom: sa8775p-ride-r3: add new board file

Bjorn Andersson (8):
      arm64: dts: qcom: sc8180x: Drop ipa-virt interconnect
      arm64: dts: qcom: sc8180x: Fix aoss_qmp node
      arm64: dts: qcom: sc8180x: Correct PCIe slave ports
      arm64: dts: qcom: sc8180x: Fix LLCC reg property again
      Merge branch 'arm64-fixes-for-6.10' into arm64-for-6.11
      Merge branch '20240606-topic-rb1_gpu-v4-1-4bc0c19da4af@linaro.org' into arm64-for-6.11
      arm64: dts: qcom: c630: Add Embedded Controller node
      Merge branch '20240602114439.1611-1-quic_jkona@quicinc.com' into arm64-for-6.11

Bryant Mairs (1):
      dt-bindings: arm: qcom: Document samsung,milletwifi device

Caleb Connolly (3):
      dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
      arm64: dts: qcom: add QCM6490 SHIFTphone 8
      arm64: dts: qcom: sm6115: add resets for sdhc_1

Chukun Pan (1):
      arm64: dts: qcom: ipq6018: add sdhci node

Cong Zhang (1):
      arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer

Dang Huynh (1):
      arm64: dts: qcom: qrb4210-rb2: Correct max current draw for VBUS

David Wronek (1):
      arm64: dts: qcom: sm8550-samsung-q5q: fix typo

Dmitry Baryshkov (51):
      arm64: dts: qcom: sm8150: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8350: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8450: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8550: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8650: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8350: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8450: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8550: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8650: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8650-mtp: connect USB-C SS port to QMP PHY
      arm64: dts: qcom: delete wrong usb-role-switch properties
      arm64: dts: qcom: x1e80100: drop wrong usb-role-switch properties
      arm64: dts: qcom: sc7180: drop extra UFS PHY compat
      arm64: dts: qcom: sc8180x: add power-domain to UFS PHY
      arm64: dts: qcom: sdm845: add power-domain to UFS PHY
      arm64: dts: qcom: sm6115: add power-domain to UFS PHY
      arm64: dts: qcom: sm6350: add power-domain to UFS PHY
      arm64: dts: qcom: sm8250: add power-domain to UFS PHY
      arm64: dts: qcom: sm8350: add power-domain to UFS PHY
      arm64: dts: qcom: sm8450: add power-domain to UFS PHY
      arm64: dts: qcom: sda660-ifc6560: document missing USB PHY supplies
      arm64: dts: qcom: msm8996-xiaomi-common: drop excton from the USB PHY
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix IPA firmware path
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: add WiFi calibration variant
      arm64: dts: qcom: sc8180x: correct dispcc clocks
      arm64: dts: qcom: sm8250: describe HS signals properly
      arm64: dts: qcom: sm8250: add a link between DWC3 and QMP PHY
      arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings
      arm64: dts: qcom: sc8180x: describe USB signals properly
      arm64: dts: qcom: sc8280xp: describe USB signals properly
      arm64: dts: qcom: x1e80100: describe USB signals properly
      arm64: dts: qcom: sm8150-hdk: rename Type-C HS endpoints
      arm64: dts: qcom: msm8996: add glink-edge nodes
      arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
      arm64: dts: qcom: msm8996: set GCC_UFS_ICE_CORE_CLK freq directly
      arm64: dts: qcom: msm8996: drop source clock entries from the UFS node
      arm64: dts: qcom: sm8650-hdk: remove redundant properties
      arm64: dts: qcom: ipq5018: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq5332: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq9574: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq6018: fix GCC node name
      arm64: dts: qcom: ipq8074: fix GCC node name
      arm64: dts: qcom: qrb2210-rb1: switch I2C2 to i2c-gpio
      arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
      arm64: dts: qcom: qrb4210-rb2: make L9A always-on
      arm64: dts: qcom: sdm845: describe connections of USB/DP port
      arm64: dts: qcom: sm8450: drop second clock name from clock-output-names
      arm64: dts: qcom: sm8550: drop second clock name from clock-output-names
      arm64: dts: qcom: sm8650: drop second clock name from clock-output-names
      arm64: dts: qcom: pm8916: add temp-alarm thermal zone
      arm64: dts: qcom: pm8916: correct thermal zone name

Gabor Juhos (2):
      dt-bindings: arm: qcom: add TP-Link Archer AX55 v1
      arm64: dts: qcom: add TP-Link Archer AX55 v1

Georgi Djakov (2):
      arm64: dts: qcom: sdm845: Add DT nodes for the TBUs
      arm64: dts: qcom: sc7280: Add DT nodes for the TBUs

Gianluca Boiano (1):
      arm64: dts: qcom: pmi8950: add pwm node

Jagadeesh Kona (8):
      dt-bindings: clock: qcom: Update SM8450 videocc header file name
      dt-bindings: clock: qcom: Add SM8650 video clock controller
      clk: qcom: videocc-sm8550: Add support for videocc XO clk ares
      clk: qcom: videocc-sm8550: Add SM8650 video clock controller
      dt-bindings: clock: qcom: Update the order of SC8280XP camcc header
      dt-bindings: clock: qcom: Add SM8650 camera clock controller
      clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
      arm64: dts: qcom: sm8650: Add video and camera clock controllers

Jie Gan (1):
      arm64: dts: qcom: Add coresight nodes for SA8775p

Joe Mason (2):
      arm64: dts: qcom: msm8916-samsung-fortuna: Add BMC150 accelerometer/magnetometer
      arm64: dts: qcom: msm8916-samsung-gprimeltecan: Add NFC

Johan Hovold (1):
      arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic

Kaushal Kumar (1):
      arm64: dts: qcom: sdx75: Add modem SMP2P node

Komal Bajaj (5):
      arm64: dts: qcom: qdu1000: Add USB3 and PHY support
      arm64: dts: qcom: qdu1000-idp: enable USB nodes
      arm64: dts: qcom: qru1000-idp: enable USB nodes
      arm64: dts: qcom: qdu1000: Add secure qfprom node
      arm64: dts: qcom: qdu1000: fix usb interrupts properties

Konrad Dybcio (49):
      arm64: dts: qcom: x1e80100-*: Allocate some CMA buffers
      arm64: dts: qcom: sc8280xp: Set status = "reserved" on PSHOLD
      arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs
      arm64: dts: qcom: ipq6018-*: Remove thermal zone polling delays
      arm64: dts: qcom: ipq8074-*: Remove thermal zone polling delays
      arm64: dts: qcom: ipq9574-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8916-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8939-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8953-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8976-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8996-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8998-*: Remove thermal zone polling delays
      arm64: dts: qcom: pm7550ba: Remove thermal zone polling delays
      arm64: dts: qcom: pms405: Remove thermal zone polling delays
      arm64: dts: qcom: pmx75: Remove thermal zone polling delays
      arm64: dts: qcom: qcm2290-*: Remove thermal zone polling delays
      arm64: dts: qcom: qcs404-*: Remove thermal zone polling delays
      arm64: dts: qcom: sa8775p-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc7180-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc7280-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc8180x-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc8280xp-*: Remove thermal zone polling delays
      arm64: dts: qcom: sdm660-*: Remove thermal zone polling delays
      arm64: dts: qcom: sdm845-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6115-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6125-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6350-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6375-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8150-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8250-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8350-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8450-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8550-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8650-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc8180x: Throttle the GPU when overheating
      arm64: dts: qcom: sc8280xp: Throttle the GPU when overheating
      arm64: dts: qcom: sdm630: Throttle the GPU when overheating
      arm64: dts: qcom: sdm845: Throttle the GPU when overheating
      arm64: dts: qcom: sm6115: Update GPU thermal zone settings
      arm64: dts: qcom: sm6350: Update GPU thermal zone settings
      arm64: dts: qcom: sm8150: Throttle the GPU when overheating
      arm64: dts: qcom: sm8250: Throttle the GPU when overheating
      arm64: dts: qcom: sm8350: Throttle the GPU when overheating
      arm64: dts: qcom: sm8450: Throttle the GPU when overheating
      arm64: dts: qcom: sm8550: Throttle the GPU when overheating
      arm64: dts: qcom: sm8650: Throttle the GPU when overheating
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      arm64: dts: qcom: qcm2290: Add GPU nodes
      arm64: dts: qcom: qrb2210-rb1: Enable the GPU

Krishna Kurapati (2):
      arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode
      arm64: dts: qcom: sc7280: Disable SuperSpeed instances in park mode

Krishna chaitanya chundru (2):
      arm64: dts: qcom: sm8450: Add interconnect path to PCIe node
      arm64: dts: qcom: sm8450: Add OPP table support to PCIe

Krzysztof Kozlowski (9):
      arm64: dts: qocm: sdx75: align smem node name with coding style
      arm64: dts: qcom: use defines for interrupts
      arm64: dts: qcom: sm6350-pdx213: correct touchscreen interrupt flags
      arm64: dts: qcom: sm6375-pdx225: correct touchscreen interrupt flags
      arm64: dts: qcom: sm8250-sony-xperia: correct touchscreen interrupt flags
      arm64: dts: qcom: sm8450-sony-xperia: correct touchscreen interrupt flags
      arm64: dts: qcom: sm8550-hdk: add port mapping to speakers
      arm64: dts: qcom: sm8550-mtp: add port mapping to speakers
      arm64: dts: qcom: sm8550-qrd: add port mapping to speakers

Lin, Meng-Bo (2):
      arm64: dts: qcom: msm8916-gplus-fl8005a: Add sound and modem
      arm64: dts: qcom: msm8916-gplus-fl8005a: Add BMS

Luca Weiss (23):
      arm64: dts: qcom: sc7280: Add APR nodes for sound
      dt-bindings: arm: qcom: Add Samsung Galaxy Note 3
      arm64: dts: qcom: qcs404: Use qcs404-hfpll compatible for hfpll
      arm64: dts: qcom: pmi632: Add vibrator
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable vibrator
      arm64: dts: qcom: pm7250b: Add node for PMIC VBUS booster
      arm64: dts: qcom: pm7250b: Add a TCPM description
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB role switching
      arm64: dts: qcom: msm8916: Use mboxes properties for APCS
      arm64: dts: qcom: msm8939: Use mboxes properties for APCS
      arm64: dts: qcom: msm8953: Use mboxes properties for APCS
      arm64: dts: qcom: msm8976: Use mboxes properties for APCS
      arm64: dts: qcom: msm8994: Use mboxes properties for APCS
      arm64: dts: qcom: qcm6490-fairphone-fp5: Use .mbn firmware for IPA
      arm64: dts: qcom: qcm6490-fairphone-fp5: Name the regulators
      arm64: dts: qcom: qcm6490-shift-otter: Name the regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Configure PM8008 regulators
      arm64: dts: qcom: qcm6490-fairphone-fp5: Configure PM8008 regulators
      arm64: dts: qcom: msm8916: Use mboxes in smsm node
      arm64: dts: qcom: msm8939: Use mboxes in smsm node
      arm64: dts: qcom: msm8953: Use mboxes in smsm node
      arm64: dts: qcom: msm8976: Use mboxes in smsm node
      arm64: dts: qcom: sm7225-fairphone-fp4: Name the regulators

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sm8650: Use "pcie" as the node name instead of "pci"

Marc Gonzalez (2):
      arm64: dts: qcom: msm8998: enable adreno_smmu by default
      arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi

Martijn Braam (1):
      arm64: dts: qcom: Add Motorola Moto G 2015 (osprey)

Mrinmay Sarkar (3):
      arm64: dts: qcom: sa8775p: Add ep pcie0 controller node
      arm64: dts: qcom: sa8775p: Add ep pcie1 controller node
      arm64: dts: qcom: sa8775p: Mark PCIe EP controller as cache coherent

Mukesh Ojha (1):
      arm64: dts: qcom: sm8650: Enable download mode register write

Naina Mehta (2):
      arm64: dts: qcom: sdx75: Add SDHCI node
      arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card

Neil Armstrong (14):
      arm64: dts: qcom: sm8450: correct pcie1 phy clocks inputs to gcc
      arm64: dts: qcom: sm8550: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk
      arm64: dts: qcom: sm8650: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk
      dt-bindings: arm: qcom: Document the HDK8650 board
      arm64: dts: qcom: sm8650: add support for the SM8650-HDK board
      arm64: dts: qcom: sm8650-hdk: enable GPU
      arm64: dts: qcom: sdm450: add Lenovo Smart Tab M10 DTS
      dt-bindings: arm: qcom: Add Lenovo Smart Tab M10 (WiFi)
      arm64: dts: qcom: sm8650-hdk: allow more IOMMU SID for the first QUP instance
      arm64: dts: sm8650-hdk: add support for the Display Card overlay
      arm64: dts: qcom: sm8650-hdk: add the Wifi node
      arm64: dts: qcom: sm8650-hdk: add port mapping to speakers
      arm64: dts: qcom: sm8650-mtp: add port mapping to speakers
      arm64: dts: qcom: sm8650-qrd: add port mapping to speakers

Nikita Travkin (1):
      dt-bindings: arm: qcom: Add msm8916 based Motorola devices

Nícolas F. R. A. Prado (1):
      arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node where unused

Odelu Kukatla (1):
      arm64: dts: qcom: sc7280: Add clocks for QOS configuration

Pierre-Hugues Husson (1):
      arm64: dts: qcom: msm8998: add venus node

Rajendra Nayak (1):
      arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes

Raymond Hackley (7):
      arm64: dts: qcom: msm8916/39-samsung-a2015: Add PMIC and charger
      arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add connector for MUIC
      arm64: dts: qcom: msm8916-samsung-rossa: Add LIS2HH12 accelerometer
      arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add S3FWRN5 NFC
      arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add PMIC and charger
      arm64: dts: qcom: msm8916-acer-a1-724: Add sound and modem
      dt-bindings: arm: qcom: Document samsung,ms013g

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add smem region

Rob Herring (Arm) (1):
      arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs

Rohit Agarwal (4):
      arm64: dts: qcom: sdx75: Add IPCC node
      arm64: dts: qcom: sdx75: Add TCSR register space
      arm64: dts: qcom: sdx75: Add AOSS node
      arm64: dts: qcom: sdx75: Support for I2C and SPI

Ruby Iris Juric (1):
      arm64: dts: qcom: Add device tree for Motorola Moto G4 Play (harpia)

Sagar Cheluvegowda (1):
      arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent

Sibi Sankar (2):
      arm64: dts: qcom: x1e80100: Add BWMONs
      arm64: dts: qcom: x1e80100: Add fastrpc nodes

Siddharth Manthan (1):
      arm64: dts: qcom: msm8916-samsung-fortuna: Add LSM303C accelerometer/magnetometer

Srinivas Kandagatla (2):
      arm64: dts: qcom: msm8996: add fastrpc nodes
      arm64: dts: qcom: x1e80100-qcp: add audio support

Stephen Boyd (3):
      arm64: dts: qcom: sc7180: quackingstick: Disable instead of delete usb_c1
      arm64: dts: qcom: sc7180: pazquel: Add missing comment header
      arm64: dts: qcom: sc7180-trogdor: Make clamshell/detachable fragments

Sumit Garg (3):
      dt-bindings: vendor-prefixes: Add Schneider Electric
      dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
      arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS

Tengfei Fan (10):
      arm64: dts: qcom: sm4450: Add cpufreq support
      arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform
      dt-bindings: soc: qcom: add qcom,sa8775p-imem compatible
      arm64: dts: qcom: sa8775p: Add IMEM and PIL info region
      arm64: dts: qcom: sm8550: Move usb-role-switch to SoC dtsi
      arm64: dts: qcom: sm8550: Remove usb default dr_mode
      dt-bindings: arm: qcom: Document QCS8550 SoC and the AIM300 AIoT board
      arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
      arm64: dts: qcom: add base AIM300 dtsi
      arm64: dts: qcom: aim300: add AIM300 AIoT

Umang Chheda (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Enable PMK8350 RTC module

Unnathi Chalicheemala (3):
      arm64: dts: qcom: sm8450: Add Broadcast_AND register in LLCC block
      arm64: dts: qcom: sm8550: Add Broadcast_AND register in LLCC block
      arm64: dts: qcom: sm8650: Add Broadcast_AND register in LLCC block

Valeriy Klimin (1):
      dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact

Venkata Prahlad Valluru (1):
      arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge

Viken Dadhaniya (2):
      arm64: dts: qcom: qcm6490-rb3: Enable gpi-dma and qup node
      arm64: dts: qcom: sc7280: Remove CTS/RTS configuration

Wiktor Strzębała (1):
      arm64: dts: qcom: Add Motorola Moto E 2015 LTE (surnia)

Xilin Wu (2):
      dt-bindings: arm: qcom: Add ASUS Vivobook S 15
      arm64: dts: qcom: Add device tree for ASUS Vivobook S 15

 Documentation/devicetree/bindings/arm/qcom.yaml    |   24 +
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   77 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    7 +-
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    6 +-
 .../devicetree/bindings/sram/qcom,imem.yaml        |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   16 +
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     |  491 +++
 .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  128 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   27 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   14 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   37 +-
 .../boot/dts/qcom/msm8216-samsung-fortuna3g.dts    |   14 +
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |   26 +
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |   47 +
 .../boot/dts/qcom/msm8916-motorola-common.dtsi     |  161 +
 .../boot/dts/qcom/msm8916-motorola-harpia.dts      |  147 +
 .../boot/dts/qcom/msm8916-motorola-osprey.dts      |  105 +
 .../boot/dts/qcom/msm8916-motorola-surnia.dts      |   83 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   53 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |    6 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    6 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts    |    6 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dts    |    7 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |  197 ++
 .../boot/dts/qcom/msm8916-samsung-gprimeltecan.dts |   70 +
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |    6 +
 .../dts/qcom/msm8916-samsung-grandprimelte.dts     |   14 +
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |   18 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |    6 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   18 +-
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |   56 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   16 +-
 .../boot/dts/qcom/msm8953-motorola-potter.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dts   |    1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts |    1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   30 +-
 arch/arm64/boot/dts/qcom/msm8956.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  579 +++-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   14 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  103 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   69 +-
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |    3 -
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm660.dtsi                |   26 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   47 +-
 arch/arm64/boot/dts/qcom/pm7325.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm7550ba.dtsi             |    1 -
 arch/arm64/boot/dts/qcom/pm8010.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pm8450.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm8550b.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi             |    1 -
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             |    4 -
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   31 +-
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |    3 -
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |    7 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |    8 +
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |    1 -
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          |    1 -
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pmr735d_a.dtsi            |    1 -
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi            |    1 -
 arch/arm64/boot/dts/qcom/pms405.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pmx75.dtsi                |    1 -
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  184 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  157 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |  961 ++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  111 +-
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts   |  315 ++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |  405 +++
 arch/arm64/boot/dts/qcom/qcs8550.dtsi              |  162 +
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |   23 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  137 +
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   21 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   17 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  122 +-
 arch/arm64/boot/dts/qcom/qru1000-idp.dts           |   23 +
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi        |    8 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts       |   47 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |  834 +----
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  814 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 1146 ++++++-
 .../boot/dts/qcom/sc7180-trogdor-clamshell.dtsi    |    9 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    6 +-
 .../boot/dts/qcom/sc7180-trogdor-detachable.dtsi   |   13 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   10 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts    |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    3 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi      |    5 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    6 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |   15 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    3 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    6 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   29 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    1 -
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |    1 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  225 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   16 +-
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |    2 -
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   20 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  263 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   20 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  145 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |    4 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   84 +-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   15 +
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts |  276 ++
 arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts   |    1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   29 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |    4 +
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts |    1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   18 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   12 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  177 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   77 +
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |   45 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  583 +++-
 .../arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |    1 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |   48 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    1 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   44 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    1 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |    8 -
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |    6 -
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    8 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |    3 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  145 +-
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   78 -
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  205 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   17 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   60 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   14 -
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    2 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    8 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   83 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   27 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   82 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   43 +-
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  225 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   26 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   26 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  134 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |  593 ++++
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |   14 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  335 +-
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |  141 +
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 1355 ++++++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   34 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  128 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  327 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  616 ++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  209 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |  482 +++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  365 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 1856 +++++++++-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sm8650.c                    | 3591 ++++++++++++++++++++
 drivers/clk/qcom/videocc-sm8550.c                  |  156 +-
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |   32 +
 include/dt-bindings/clock/qcom,sm8650-camcc.h      |  195 ++
 include/dt-bindings/clock/qcom,sm8650-videocc.h    |   23 +
 193 files changed, 19698 insertions(+), 2584 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
 create mode 100644 drivers/clk/qcom/camcc-sm8650.c
 create mode 100644 include/dt-bindings/clock/qcom,qcm2290-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-videocc.h


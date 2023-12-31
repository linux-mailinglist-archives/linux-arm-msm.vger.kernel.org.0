Return-Path: <linux-arm-msm+bounces-6170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E168209AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 05:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38EE5283359
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 04:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A55CECE;
	Sun, 31 Dec 2023 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qxz1hyvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D033CE;
	Sun, 31 Dec 2023 04:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFA1C433C7;
	Sun, 31 Dec 2023 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703995630;
	bh=ptuLjlUKPnGzI09vvWf6AUIipqAGb+53ZX9S0FtKUQU=;
	h=From:To:Cc:Subject:Date:From;
	b=Qxz1hyvmfkmfi5TTJNGNbD2YD23KXgJD+HWO0fGFOcEiyJHYwgnnMy/Nbsg2A4KwO
	 30TxgriXMljPhyqt5wDtomv+F+0HSizDVA8XE3fo5/bmvOKbIbUhaivkZIIM+cB3LV
	 Q3tJcCf75lNDF42gc5eQt4iYvcu+AUlrwVOnFCmyxH6aDU7gzwzgCFINq+8Loa/RUf
	 TRIcKhAK2fnI7bqprhl8W2UKSwlPVtn2DwpXlFtuoyzN7nQY2/zaXl9vir+ojOTyNH
	 yyFU6zOAI46qYVL/ECZcxu56gqihC/nljZ0c6fI8RvonoTDO5fvV6usqtLAjWYHzDg
	 AMiWlpB6yKU+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.8
Date: Sat, 30 Dec 2023 20:11:14 -0800
Message-ID: <20231231041115.3263074-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.8

for you to fetch changes up to 757d1ca14f94e4e00777491dcab0b4abee18f9bf:

  clk: qcom: dispcc-sm8650: Add test_ctl parameters to PLL config (2023-12-19 14:12:41 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v6.8

New drivers to support global, display, gpu, tcsr, and rpmh clocks for
the SM8650 platform is introduced.

Global and RPMh clock support for the new X1E80100 platform is added.

Support for the Stromer APCS PLL found in IPQ5018 is added.

A new type of branch clock, with support for controlling separate memory
control bits is introduced, and used in the newly introduced clock
driver for the ECPRI on QDU1000 and QRU1000.

A number of missing clock related to CSI2 on MSM8939 are added. Support
for the camera clock controller on SC8280XP is added.

PLL configuration is corrected in GPU and Video clock controllers for
SM8150, runtim PM support and a few missing resets are added to the
video clock controller.

For SM8550 configuration of a variety of GDSCs in GCC is corrected.
Shared RCGs was not marked appropriately when the driver was upstreamed,
so this is corrected as well.
For GPU and Display clock controllers PLL configuration settings are
reviewed and corrected.

----------------------------------------------------------------
Bjorn Andersson (5):
      Merge branch '20231026105345.3376-3-bryan.odonoghue@linaro.org' into clk-for-6.8
      Merge branch '20231106-topic-sm8650-upstream-clocks-v3-5-761a6fadb4c0@linaro.org' into clk-for-6.8
      Merge branch '20231123064735.2979802-2-quic_imrashai@quicinc.com' into clk-for-6.8
      Merge branch '20231205061002.30759-4-quic_sibis@quicinc.com' into clk-for-6.8
      Merge branch '20231201-videocc-8150-v3-1-56bec3a5e443@quicinc.com' into clk-for-6.8

Bryan O'Donoghue (3):
      dt-bindings: clock: Use gcc.yaml for common clock properties
      dt-bindings: clock: Add SC8280XP CAMCC
      clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC

Dan Carpenter (1):
      clk: qcom: camcc-sc8280xp: Prevent error pointer dereference

Gokul Sriram Palanisamy (2):
      dt-bindings: clock: qcom,a53pll: add IPQ5018 compatible
      clk: qcom: apss-ipq-pll: add support for IPQ5018

Imran Shaik (2):
      dt-bindings: clock: qcom: Add ECPRICC clocks for QDU1000 and QRU1000
      clk: qcom: Add ECPRICC driver support for QDU1000 and QRU1000

Konrad Dybcio (9):
      clk: qcom: gcc-sm8550: Add the missing RETAIN_FF_ENABLE GDSC flag
      clk: qcom: gcc-sm8550: Mark the PCIe GDSCs votable
      clk: qcom: gcc-sm8550: use collapse-voting for PCIe GDSCs
      clk: qcom: gcc-sm8550: Mark RCGs shared where applicable
      clk: qcom: gpucc-sm8550: Update GPU PLL settings
      clk: qcom: dispcc-sm8550: Update disp PLL settings
      clk: qcom: dispcc-sm8550: Use the correct PLL configuration function
      clk: qcom: gpucc-sm8650: Add test_ctl parameters to PLL config
      clk: qcom: dispcc-sm8650: Add test_ctl parameters to PLL config

Neil Armstrong (11):
      dt-bindings: clock: qcom: document the SM8650 TCSR Clock Controller
      dt-bindings: clock: qcom: document the SM8650 General Clock Controller
      dt-bindings: clock: qcom: document the SM8650 Display Clock Controller
      dt-bindings: clock: qcom: document the SM8650 GPU Clock Controller
      dt-bindings: clock: qcom: Document the SM8650 RPMH Clock Controller
      clk: qcom: add the SM8650 Global Clock Controller driver, part 1
      clk: qcom: add the SM8650 Global Clock Controller driver, part 2
      clk: qcom: add the SM8650 TCSR Clock Controller driver
      clk: qcom: add the SM8650 Display Clock Controller driver
      clk: qcom: add the SM8650 GPU Clock Controller driver
      clk: qcom: rpmh: add clocks for SM8650

Rajendra Nayak (4):
      dt-bindings: clock: qcom: Add X1E80100 GCC clocks
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for X1E80100
      clk: qcom: Add Global Clock controller (GCC) driver for X1E80100
      clk: qcom: rpmh: Add support for X1E80100 rpmh clocks

Robert Marko (1):
      dt-bindings: clock: qcom,gcc-ipq6018: split to separate schema

Satya Priya Kakitapalli (5):
      clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
      dt-bindings: clock: Update the videocc resets for sm8150
      clk: qcom: videocc-sm8150: Update the videocc resets
      clk: qcom: videocc-sm8150: Add missing PLL config property
      clk: qcom: videocc-sm8150: Add runtime PM support

Taniya Das (1):
      clk: qcom: branch: Add mem ops support for branch2 clocks

Vincent Knecht (2):
      dt-bindings: clock: qcom,gcc-msm8939: Add CSI2 related clocks
      clk: qcom: gcc-msm8939: Add missing CSI2 related clocks

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    1 +
 .../bindings/clock/qcom,camcc-sm8250.yaml          |   18 +-
 .../bindings/clock/qcom,gcc-ipq6018.yaml           |   57 +
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |    3 -
 .../bindings/clock/qcom,qdu1000-ecpricc.yaml       |   68 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../bindings/clock/qcom,sc7180-camcc.yaml          |   18 +-
 .../bindings/clock/qcom,sc7280-camcc.yaml          |   18 +-
 .../bindings/clock/qcom,sdm845-camcc.yaml          |   18 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   20 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    8 +-
 .../bindings/clock/qcom,sm8650-dispcc.yaml         |  106 +
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |   65 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   72 +
 drivers/clk/qcom/Kconfig                           |   63 +
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/apss-ipq-pll.c                    |   21 +
 drivers/clk/qcom/camcc-sc8280xp.c                  | 3045 +++++++++
 drivers/clk/qcom/clk-branch.c                      |   38 +
 drivers/clk/qcom/clk-branch.h                      |   21 +
 drivers/clk/qcom/clk-rpmh.c                        |   58 +
 drivers/clk/qcom/dispcc-sm8550.c                   |   12 +-
 drivers/clk/qcom/dispcc-sm8650.c                   | 1818 ++++++
 drivers/clk/qcom/ecpricc-qdu1000.c                 | 2456 +++++++
 drivers/clk/qcom/gcc-msm8939.c                     |  110 +-
 drivers/clk/qcom/gcc-sm8550.c                      |  110 +-
 drivers/clk/qcom/gcc-sm8650.c                      | 3849 +++++++++++
 drivers/clk/qcom/gcc-x1e80100.c                    | 6807 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-sm8150.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm8550.c                    |    6 +-
 drivers/clk/qcom/gpucc-sm8650.c                    |  663 ++
 drivers/clk/qcom/tcsrcc-sm8650.c                   |  182 +
 drivers/clk/qcom/videocc-sm8150.c                  |   25 +-
 include/dt-bindings/clock/qcom,gcc-msm8939.h       |    6 +
 include/dt-bindings/clock/qcom,qdu1000-ecpricc.h   |  147 +
 include/dt-bindings/clock/qcom,sc8280xp-camcc.h    |  179 +
 include/dt-bindings/clock/qcom,sm8650-dispcc.h     |  102 +
 include/dt-bindings/clock/qcom,sm8650-gcc.h        |  254 +
 include/dt-bindings/clock/qcom,sm8650-gpucc.h      |   43 +
 include/dt-bindings/clock/qcom,sm8650-tcsr.h       |   18 +
 include/dt-bindings/clock/qcom,videocc-sm8150.h    |    4 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  485 ++
 include/dt-bindings/reset/qcom,sm8650-gpucc.h      |   20 +
 44 files changed, 20891 insertions(+), 138 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sc8280xp.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8650.c
 create mode 100644 drivers/clk/qcom/ecpricc-qdu1000.c
 create mode 100644 drivers/clk/qcom/gcc-sm8650.c
 create mode 100644 drivers/clk/qcom/gcc-x1e80100.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8650.c
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8650.c
 create mode 100644 include/dt-bindings/clock/qcom,qdu1000-ecpricc.h
 create mode 100644 include/dt-bindings/clock/qcom,sc8280xp-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-tcsr.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,sm8650-gpucc.h


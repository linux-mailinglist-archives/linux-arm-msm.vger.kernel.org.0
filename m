Return-Path: <linux-arm-msm+bounces-36841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D509BA304
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 00:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78551F2195F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 23:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE9218593A;
	Sat,  2 Nov 2024 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8ph0RKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C7F1714CA
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 23:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730589597; cv=none; b=QVUL4sOvIRJa8P5aGMqGt28ExBqpbBoKk9TfxGtDPlZhBWtmydmU1c2+hJJ/8Rgh4CtS6fEb5c7++Fkg9kjduemOudLVTTcyxmIBNQc2mmBimIHzQpDOWFXENzvRv9byEVj6iAqo7YVGV1RS1zM8DjQTYnd3nJnPKFcV+TPXlRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730589597; c=relaxed/simple;
	bh=/BnZgvaqjscf0IvYfmdX4PIdhBAXfbRaWA+hx7RV3fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=txAaYL7oT6WY2KZl94WjHw+0MYVh544rXNqKNvzjOQ1ooXX84NKqika73aV1+5q867l0gekm6ZNIGJplx6z+noXHjTdv1a5VPj8M8vMvAD21PJgvz0c9N83lt+wz+Dqfdibadrd36WO/xKr1SZZwN//g5NS14AaUuFT9XZ5qqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8ph0RKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B57CC4CEC3;
	Sat,  2 Nov 2024 23:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730589596;
	bh=/BnZgvaqjscf0IvYfmdX4PIdhBAXfbRaWA+hx7RV3fE=;
	h=From:To:Cc:Subject:Date:From;
	b=V8ph0RKJ9/nHSPRyxYP8hMtmj3Jfq+78V3LGhWV0DZ2GKHOA4oQ/iSHPWq/0F1mSW
	 f/eAernmmhsbQ/TyHwv6YWNliDuuEEsSy7YA653OHm1uQtvx5wYWScMWU6/deMdKg3
	 pczg76sQ3lCtXoinx625QxBpmzCai+SQZzdq61ByXhWdP/r9aUgxDqo8AqB/Gg7T5X
	 CR7FZyUvy88+hj8x8siUyAJPlFBPkGNVmBD+kAZ724H3CqJVTbiw59FqTPaR12X2Qp
	 0dbROLlF91p+NDq/i674qvhQRFyYsK2RtpPrMVYDUh1hylA0d3//IyxE3Sqwov/ZQY
	 dx4HGdMnS6MFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nikunj Kela <quic_nkela@quicinc.com>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.13
Date: Sat,  2 Nov 2024 18:19:48 -0500
Message-ID: <20241102231953.871067-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.13

for you to fetch changes up to d088afa7de3cbe689954dad49e7058d2c4b8944c:

  soc: qcom: socinfo: add QCS9100 ID (2024-10-29 15:09:02 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.13

Enable QSEECOM, and thereby access to EFI variables, for Lenovo Yoga
Slim 7x, Dell XPS 13, Microsoft Surface Pro 9.

Last Level Cache Controller (LLCC) driver code is shuffled, to improve
readability of the tables.

The Qualcomm socinfo driver gains support for QCS615, QCS9100, SAR1130P,
SAR2130P, and SA8255P.

A few drivers are simplified using dev_err_probe() and guard(), and a
few kernel-doc issues are corrected.

Mentioning of the #linux-msm IRC channel is added to the MAINTAINERS
file.

----------------------------------------------------------------
Aleksandrs Vinarskis (1):
      firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345

Bjorn Andersson (1):
      soc: qcom: pd-mapper: Add QCM6490 PD maps

Dan Carpenter (1):
      soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()

Dmitry Baryshkov (4):
      dt-bindings: arm: qcom,ids: add SoC ID for SAR2130P and SAR1130P
      soc: qcom: socinfo: add SoC IDs for SAR1130P and SAR2130P
      dt-bindings: firmware: qcom,scm: Add SAR2130P compatible
      dt-bindings: soc: qcom,aoss-qmp: Add SAR2130P compatible

Jingyi Wang (1):
      dt-bindings: soc: qcom: add qcom,qcs8300-imem compatible

Julia Lawall (1):
      soc: qcom: qmi: Reorganize kerneldoc parameter names

Jérôme de Bretagne (1):
      firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G

Konrad Dybcio (2):
      soc: qcom: llcc: Use designated initializers for LLC settings
      soc: qcom: smem: Fix up kerneldoc

Krzysztof Kozlowski (4):
      qcom: MAINTAINERS: add linux-msm IRC on OFTC
      soc: qcom: pbs: simplify locking with guard()
      soc: qcom: smem_state: simplify locking with guard()
      dt-bindings: soc: qcom: aoss-qmp: Add SM8750

Kyle Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the QCS8300 AOSS channel

Lijuan Gao (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS615
      soc: qcom: socinfo: Add QCS615 SoC ID table entry

Maya Matuszczyk (1):
      firmware: qcom: scm:  Allow QSEECOM on Lenovo Yoga Slim 7x

Nikunj Kela (4):
      dt-bindings: firmware: qcom,scm: document support for SA8255p
      dt-bindings: soc: qcom: aoss-qmp: document support for SA8255p
      dt-bindings: arm: qcom: add the SoC ID for SA8255P
      soc: qcom: socinfo: add support for SA8255P

Tengfei Fan (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
      soc: qcom: socinfo: add QCS9100 ID

Zhang Zekun (3):
      soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
      soc: qcom: smem: Simplify code with dev_err_probe()
      soc: qcom: smp2p: Simplify code with dev_err_probe()

Zhenhua Huang (1):
      dt-bindings: firmware: qcom,scm: document SCM on QCS8300 SoCs

 .../devicetree/bindings/firmware/qcom,scm.yaml     |    4 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    4 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |    1 +
 MAINTAINERS                                        |    3 +
 drivers/firmware/qcom/qcom_scm.c                   |    3 +
 drivers/soc/qcom/llcc-qcom.c                       | 2644 ++++++++++++++++++--
 drivers/soc/qcom/qcom-geni-se.c                    |    3 +-
 drivers/soc/qcom/qcom-pbs.c                        |   22 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |    1 +
 drivers/soc/qcom/qmi_interface.c                   |    2 +-
 drivers/soc/qcom/rpmh-rsc.c                        |    9 +-
 drivers/soc/qcom/smem.c                            |   16 +-
 drivers/soc/qcom/smem_state.c                      |   12 +-
 drivers/soc/qcom/smp2p.c                           |    9 +-
 drivers/soc/qcom/socinfo.c                         |    5 +
 include/dt-bindings/arm/qcom,ids.h                 |    5 +
 16 files changed, 2432 insertions(+), 311 deletions(-)


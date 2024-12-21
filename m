Return-Path: <linux-arm-msm+bounces-43037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 522789FA084
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77AF8188FBE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FFE1F0E41;
	Sat, 21 Dec 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQLPYFJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809855B1FB;
	Sat, 21 Dec 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734783873; cv=none; b=uGNHliP2ey8dRVwukiXE0LpZTTDiMOGKw+Dz0FcY2WSbI7NeKnLfCovaQINq/yoAps+RUADIfCECzi+R1uYYvsGCmQDPEkiSOrsBzIXY+QiOJD/NTO0Tkcgd8amZOcTBBgjdKyR5nXEk843XwJfsZiBb2c4YAzUJaT2WB8a9ono=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734783873; c=relaxed/simple;
	bh=9uIF7zK9EIOCaX4c4DhQUzEU2qjXi64hgZtJIRoy7w4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ey5lhsw9PK9py88Y3+VJWWIRn0O3pNpsNwpn/JcOwsDWu5Us/0cF9ggNBxPCrVqQeSX71KWWQm+W1BgZdL+8TmJsGZ5ID0GCMc748UPqRI5F319zWI9xLou302P0Loyjbjc7CXstqGQI8q4pRHn5MsnBKsuIJYGfEr59tZjYv2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQLPYFJn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C364C4CECE;
	Sat, 21 Dec 2024 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734783872;
	bh=9uIF7zK9EIOCaX4c4DhQUzEU2qjXi64hgZtJIRoy7w4=;
	h=From:Subject:Date:To:Cc:From;
	b=cQLPYFJn14aDekkn/IySHjodQ/3mpGx/TrgGI1/UmttRsvUe1xFQqcjh5UbfPwZL0
	 RihDU4F/U45HHHWy6KymTmAQttlS/zhJTq7L5h5nnrHFW7WkAzpjhQ5Prts2Natk0X
	 HmJLmS4/RFhbBDtdi5EnD5O9SyMqcJQL/a8KawyRazMqOaeOsYaaFPBsLLuS/yCJuJ
	 5DxcwCn/RuoZsbgLW4br4Y7Frj//UhzaQ8kFOR3A9Wihjs3LDk8VOCUauR5DAez44X
	 nP+tA/6rkJGnNv+h+LXsHBKY/YcmB+EwGrXqbyn0ZK7kYTrkm4KnR/CLm99UOtI/FX
	 cTgDNEhUfKblg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] X1P42100 clock changes
Date: Sat, 21 Dec 2024 13:24:08 +0100
Message-Id: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGizZmcC/x3MQQqAIBBA0avErBMaMYquEhFmUw2FiUYI4t2Tl
 m/xf4JAninAUCXw9HLg2xZgXYE5tN1J8FoMspEKpUTx3I6NiOjUbK5TaLVunaKFemyhRM7TxvE
 fjlPOH10LYp1gAAAA
X-Change-ID: 20241221-topic-x1p4_clk-a4df74ebe815
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734783869; l=1405;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9uIF7zK9EIOCaX4c4DhQUzEU2qjXi64hgZtJIRoy7w4=;
 b=a20sO02KdXStZ/KLhxPPUnHLn0mGb0PEy7G8q0++dKayjPP3O6HagWBRfxUhbcnCSQ65wJnjd
 syd0r8/SZN7AA1UJcdr36vLjGmuJqbpMFQ+xLwEbHfboYP6iGUvo3uV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

X1P42100 is heavily based upon X1E80100, but ultimately it's a
separate design.

From the clocks POV, we need a new GPUCC driver (though for ease of DT
integration the bindings part is reused from X1E - perhaps that's
something to look into on a broader scale, but that's not for today).

GCC also has some tiny changes, enough to warrant a new compatible,
however none of them are big enough to require driver changes today.
Bindings are adjusted so that if/when such need arises, it'll be
easy to take care of.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,x1e80100-gcc: Add X1P42100
      dt-bindings: clock: qcom,x1e80100-gpucc: Extend for X1P42100
      clk: qcom: Add X1P42100 GPUCC driver

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   1 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   6 +-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-x1p42100.c                  | 587 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |  13 +
 6 files changed, 616 insertions(+), 1 deletion(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241221-topic-x1p4_clk-a4df74ebe815

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



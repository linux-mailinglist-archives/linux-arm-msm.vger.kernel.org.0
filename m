Return-Path: <linux-arm-msm+bounces-43041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C979FA096
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DEF018903FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9E61F2361;
	Sat, 21 Dec 2024 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koJrFkpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6651C1F0D;
	Sat, 21 Dec 2024 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734784582; cv=none; b=uwo5rzu62qm9hCDtcnkdWqtwGH+43pdAgq0EMK5HWzgxGkOSjbWCqy9OV2V9JpJ+8wupvOy/TPCgf8JqJJYEPCfdMmrfdawqOLWWYUWsLN0zqhcUsNm1veiB//Lk3VaHegosk66BYc1Q4wCezIquRi+8dPh6ocTiFpFlemUwlMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734784582; c=relaxed/simple;
	bh=gKk7zGu/htVLHGjg3BsFRM/yrMKjDenJa8hOKSHQgRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DnUMOlPdMrVjsofDAgOEGG9aZ17Xz2dHXPs1Bccovy6S3cPSndBCJLWAX1Lqjtn+O27XC/mKs/U62EyjH6JxTlmkQ5Ie3Q8o7Tlx9OIIpVbkF7BW76YH+LeJgXnKeqhfRoZZxlqikLcgc/FwxMB+wAgstiqy02g5apcuSQ/+7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koJrFkpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC965C4CECE;
	Sat, 21 Dec 2024 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734784581;
	bh=gKk7zGu/htVLHGjg3BsFRM/yrMKjDenJa8hOKSHQgRY=;
	h=From:Subject:Date:To:Cc:From;
	b=koJrFkpywPlDIt0tACIUyTAvo+pbuGQ8qoKXuW9G28Alk+io0fcWOs94fNlCaFMAc
	 LAp7bGgFpk62+LuAeOyz7To0CpJ0Xo/In3TPQHm3sn9p49SFuNCoVREIEUmkP8rzo6
	 Q+C/3xK9u0qgu5w9GQQ9q4XovxNNAbEwYqorB764UKgqxlrsL4lEB/KIYe67lo8vaw
	 e+Ydl7+vF5rSr7staQJ6Z/NUWuyKSXOVfA+w5C75KQ06y/qqoa8f0HFPqbSz5p6nB6
	 yD5zo5++cb66gShIC5884X40P6JSd1Surv09gZaMQuyzfXMkM+ivJxeyq/yC9J0GLc
	 yo5dWDEXBmGug==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] X1P42100 bindings + common driver bits
Date: Sat, 21 Dec 2024 13:35:59 +0100
Message-Id: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC+2ZmcC/x3MTQqAIBBA4avErBN00v6uEhFhY81GRSOC6O5Jy
 2/x3gOZElOGsXog0cWZgy9QdQX2WP1OgrdiQIlaISpxhshW3CrqJQcrXNMb2aLBbjBQopjI8f0
 Pp/l9P0FiaDpgAAAA
X-Change-ID: 20241221-topic-x1p4_soc-f38506252795
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734784578; l=1024;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gKk7zGu/htVLHGjg3BsFRM/yrMKjDenJa8hOKSHQgRY=;
 b=qZ5Rd6ibiWYnmoR/SEZPFGOrV/RB1G27U3E4mWN45bYaJnn+xi81E+wcWmyeTG3iSAit5Nxhz
 BXeuW7X4vwhBzU4dgzhF0ueKNsoSksqqetgVfYm3vIL+vRy99qysW2e
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series brings the board/platform compatibles for X1P42100 & the
CRD based on it and adds them to various match tables.

The DT itself will come in a separate series, as it depends on some
more changes across the tree.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      dt-bindings: arm: qcom-soc: Extend X1E prefix match for X1P
      dt-bindings: arm: qcom: Add X1P42100 SoC & CRD
      soc: qcom: pd-mapper: Add X1P42100
      firmware: qcom: scm: Allow QSEECOM on X1P42100 CRD

 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 8 ++++----
 Documentation/devicetree/bindings/arm/qcom.yaml     | 6 ++++++
 drivers/firmware/qcom/qcom_scm.c                    | 1 +
 drivers/soc/qcom/qcom_pd_mapper.c                   | 1 +
 4 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241221-topic-x1p4_soc-f38506252795

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



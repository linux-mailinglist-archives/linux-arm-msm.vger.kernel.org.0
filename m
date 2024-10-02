Return-Path: <linux-arm-msm+bounces-32971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612C98E6A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 01:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ECCB284153
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 23:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245C719C56B;
	Wed,  2 Oct 2024 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kklkgx1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB075197A99;
	Wed,  2 Oct 2024 23:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727910993; cv=none; b=RVNJSLdAm2MzHPWkwy5Yi/qSEc4kSLbHD3U2SoC+ttJNbGje4Fqc1EpMMuUI/EU5fGZd9p889yh+yKy3UNAp8VrmCQlAU7f7/CnCIHVEVi++/AFp6gRpWwSp0YsOoqsaIFUHej6R15RX+dAKmSoNqIJDLHVROf37CnBnbHH13m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727910993; c=relaxed/simple;
	bh=o+VHdKbmiGlXJTupzdrpMFjQirhvQhCSI/GqaAKKTQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vDHn8kYfWn0/whgdhdsFqtq7T7mqRPTuufgfnI+bEHceVCeq71uDggyKHxF2TB+fkDROSAKUpVO7FS9v2Za+1XBWLXXOSVxUfGYLgFrrMPMJACJT6hEtqrQOP1WpwUCYrvWZ7HRzh/w3f8UzjamjIoSvrmjLZYyk45Lqeocy5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kklkgx1t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83105C4CEC2;
	Wed,  2 Oct 2024 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727910992;
	bh=o+VHdKbmiGlXJTupzdrpMFjQirhvQhCSI/GqaAKKTQo=;
	h=From:Date:Subject:To:Cc:From;
	b=Kklkgx1txHgM5ISyZcXwlTOhVmlBrsLPBRx5KjBpMzQPJod7QrXQLFcY8m/VSJVpo
	 s0Z1PRf6UwOoPkttTOwBSlY70OjgWiSy6cRjduLrrkRfoqLvW6cyUQunNfbI+4uA+p
	 iGoAf5HNdz1pbUsxU/EFE4DiCaXXdP2bkJWIHEs+8Vh/bRHS1XYX4nBvQPud1oQi8Q
	 4hUcpmb7/eZQVv0wvMMJ0+E9u+2QJYeQMW8mEr0We4djDAAR72DEF8X+Vq+xs/1VvA
	 iTPAPyOkAsoBkcgMSYxlor01gKInWoNEBl/0jVZm37PAQcIQm+4Qocp1KxOl73y8Rl
	 m9AMlIDQUx76A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 03 Oct 2024 01:16:27 +0200
Subject: [PATCH] clk: qcom: Make GCC_6125 depend on QCOM_GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241003-topic-6125kconfig-v1-1-f5e1efbff07c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAErU/WYC/x3MTQqAIBBA4avErBPU/ImuEi3CRhsCDY0IpLsnL
 b/FexUKZsICU1ch402FUmwQfQduX2NARlszSC6V4HxgVzrJMSOkPlyKngIzyq7DqIUcjYXWnRk
 9Pf9zXt73A1WALutjAAAA
X-Change-ID: 20241003-topic-6125kconfig-647a38512867
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727910990; l=1058;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=P2Le5x9hpPEWZ4GtR5vV6vqorxiZr5wPNu2HAqL1DGU=;
 b=SGXPzu+2JeTSkb7NAgcRpHbX30UddRcRMDYoSUekTPM8lYS2keL/c5+HJCrTXNbL3XSBePHIA
 HYIWykVA5CaCKWSvFTLOddl76sVvsKnR0cdNupFOBxvveXD5GkupcdU
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
required, as the GCC driver defines and instantiates a bunch of GDSCs.

Add the missing dependency.

Reported-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a3e2a09e2105b2f0a43afce7987fdd65f9b08c92..c6642d31707d01c33e9c0cee7100074e4cffc15b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -987,6 +987,7 @@ config SM_GCC_6115
 config SM_GCC_6125
 	tristate "SM6125 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM6125 devices.
 	  Say Y if you want to use peripheral devices such as UART,

---
base-commit: cea5425829f77e476b03702426f6b3701299b925
change-id: 20241003-topic-6125kconfig-647a38512867

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>



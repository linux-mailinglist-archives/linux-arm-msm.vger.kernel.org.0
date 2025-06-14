Return-Path: <linux-arm-msm+bounces-61299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB171AD9F3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398983B8082
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1BE2E7F19;
	Sat, 14 Jun 2025 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZyyvhVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423A72E7F0F;
	Sat, 14 Jun 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927943; cv=none; b=RyLIVqfPD4r4pRclHSiOdMVvr6UFZrjqhU/ErdaFhrfpRIYyZ1+7FOTrGNaZuTGqMu6vZU9/5TEkY49/uCYp6zX8F//1JxVC67ZGBWbDtDQNIsxyPUBk/pSqp0BEdiVfgcZnp7ZkdGm514ViNkhc7AyEh9L1zZ3h1jQWQSgKRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927943; c=relaxed/simple;
	bh=NhGYq/ElzSOc7nCDW2yDymZSl/f8rkK8D+CBGdI9bd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=da79pUxNi4FqLypPmWbPcMn/WWkuXGYulkWA2C+MdCTSACEGH5R/Fl/EhEeq5DCm1lSz+AxRuf8CuAG1bKOuFv4evF78dOpRdm1yac/wtACRoQFG6XAqqd3v3EAXYoqztxsv0ONlSykyDOQk8gqkhqQh4DGBFjStlEi3vRaUfPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZyyvhVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF7CC4CEF1;
	Sat, 14 Jun 2025 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927942;
	bh=NhGYq/ElzSOc7nCDW2yDymZSl/f8rkK8D+CBGdI9bd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QZyyvhVCIHQCCCAw8W6LYyT5zpW5ZTlZ6nuBQIM7RebX6zCQHZHzHKuoLn14/Hc7i
	 iv6JG6jIsmE/nGjfxVbMgrT/qBesKGelfguyCxvwBCQLqbbOZwUFE1VYo2hgF07NT1
	 Uo0BI6414CpQk0hrqM9GH8Fu91wVms0Le2/Mzaxc/uuXvMu7rj+f2zLO61wpAp4UHi
	 taoZp4rH7i7f1+y76uyfM7A+p2jXgIfNovw1Y/jaSvfbqxxOzMZbQ4Taz9vP6ulSry
	 YTGCW8SWUDrKdDOmJF0HeRN+Zs7Eqq1x9BPaOW+/3frgpl3NWzp2u/t52Br3UJt9Qt
	 iQ0MsJdSBf7lQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 14 Jun 2025 21:05:20 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: sc7180: Drop venus-enc/decoder node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-topic-encdec-v1-2-f974c3e9cb43@oss.qualcomm.com>
References: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
In-Reply-To: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749927933; l=986;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=e92erQ54zQgwh5TDVg6IpH75IOUboBb5G5N43UJsAyU=;
 b=m15UW8OCucDDBjULiaXCWy0A/Sh6AS3vdb9adEw5FMqBojzykJBQnyxSmsmUJdARAl0jQ0Lti
 CH56TD3yskEABsHDD+BSYeAkhZNA9YYutCiceau6mholUOUllC0Z2xC
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 687bfbba5a1c ("media: venus: Add support for static video
encoder/decoder declarations") invalidates these empty nodes.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 01e727b021ec587f7b3384f7301620a21ddef281..4fe8b483be66db2ecc9eb8a103e697f25bab8ba3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3095,14 +3095,6 @@ venus: video-codec@aa00000 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
 			interconnect-names = "video-mem", "cpu-cfg";
 
-			video-decoder {
-				compatible = "venus-decoder";
-			};
-
-			video-encoder {
-				compatible = "venus-encoder";
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.49.0



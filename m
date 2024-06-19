Return-Path: <linux-arm-msm+bounces-23244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690D90F484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF49F1F21289
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193E7155337;
	Wed, 19 Jun 2024 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="2Tc/YWf1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A132137747;
	Wed, 19 Jun 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816068; cv=none; b=cFzoukCE5VQLX/4cvtI+xW3lKioIOr23G8iadcQ7J2PAo0GexA6heIJrnIyD28jRRq7DAIieBVNxY0m0VfVKQCqdEmJXQU9Qj4cXeHzL1PvhCTsQvyHa841ws2Drf14hXUG7DVbWEu7Za4nASdv0TTIxqwArv6mc9u9IyiBy/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816068; c=relaxed/simple;
	bh=gk+KVnKD8bjZxiM/P8uQSXYWMGzx+sSUbwEhyTCCLUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Orcg+nBiD3/DzIFHDCm8KcoSe/uMvySeLh14wdY0TrQFrrwpxDajfayBv5i5RyS5Hq4juggUZWpKixlNjWHsQx4RKMo3Cbh3Jdh7dr8yi7ecnd2p9a4dsz+8wT0bQgqFl6P/HjDxxuRtiWrpe0bwRaR0o2Nv4XnbmWSZfGbkVQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=2Tc/YWf1; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718815510; bh=gk+KVnKD8bjZxiM/P8uQSXYWMGzx+sSUbwEhyTCCLUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=2Tc/YWf1qO6wpjJZ1ckwX3CnNQRk+f5eGYLsWAidh6kZBrBAGq9YjQkY9FFiLEZ22
	 yLgj8LeLHYboQcHSGgdUyvQm64wb3BmhSsuh1Ko8oAEBXDFtoyTRoyUqUON/enfhT+
	 SQxmwAX++5joAd/B5/dnOQrHxmd7uCUlPkKxHldg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 18:42:30 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: msm8953: Use mboxes in smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-smsm-mbox-dts-v1-4-268ab7eef779@lucaweiss.eu>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
In-Reply-To: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=gk+KVnKD8bjZxiM/P8uQSXYWMGzx+sSUbwEhyTCCLUY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmcwsT/tYwMqgqHVcHILwd+wpB0YusTPcjZiIFH
 wq+yk8zuDqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnMLEwAKCRBy2EO4nU3X
 VrKXD/9yb33t6L1COmkK4OuFQt79jKSjUz1GJYBB+t6menoIfi83T+F7xWlXI74xkpyatidmlaA
 +kclLGppcbkGqF8KnthOnx12JkLGVUEnegxbHWgUT7+RSCTWlI7YcEkee48cRgfHZZ1gzwMq44D
 nKbPMcGk7VXazsBS5keNvWcoJWZEVfRBFBQtLskaq2/0W92dheARZQ1sWKp/HuTnJdDrPCJA5ju
 SylEUU2Q4Mav4IBz2972/LirIHiw+52TNrwG/BRjWC9GyTytdkBKsqVrFX1HmM3SzIixiKq1TkY
 XbqJAjnLw5Ppqs8hxsJytniddRFSrm2rtYfEdENK9Ue5WrAqQNcCaIUAqLHoPoQ7h56uuz732Zl
 D91TmXNFIbeGKvaLo3vSLSJO/O3eGBkGWqgqE72gm9d9TgnypnVOTB/Kt6+Xk6wBBkoX1xvEIMZ
 9Zis/86en+JBaThujKe0+Xf8xaPSPmT8jQsEr466qEs06ICj7NJdyVSuDdZxaucH2hhYde9BiCO
 /5zfW97/KQTjpgRPXi2HWshwQJlRNVpef2Gn1ivceelqtzpEpeJVVQm/rSj72kxOAu478vQn2Cd
 Y2QYfqG40daARcNSfK+qe7O9r2sd5tTTU3Y37QyYb4wPXcosanu/qhe0ZIl3+DGXJzMbp9UfRT/
 4JEEzMWZYddm6Jw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

With the smsm bindings and driver finally supporting mboxes, switch to
that and stop using apcs as syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 1b61a63710a6..a4bfb624fb8a 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -411,8 +411,7 @@ smsm {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-3 = <&apcs 8 19>;
+		mboxes = <0>, <&apcs 13>, <0>, <&apcs 19>;
 
 		apps_smsm: apps@0 {
 			reg = <0>;

-- 
2.45.2



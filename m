Return-Path: <linux-arm-msm+bounces-76164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98284BC0474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598A23BDCE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B18227563;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puWxnLaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566822222B6;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816549; cv=none; b=e0yJzRcbZYP2JILj+zUWTSHzsouuKfUIH+5PP1WEwQ6Zy1Nrdq+JmDWEksDTShcjhU5XPrexd4EslKVJcjfn6wbxE6oScw9u5YfYLkxJPq744Z6g9oMRef4T8f+iZzCrEd8VdIuNywa3YtA647B2Rk79JyVJivTQRMPlvA/WZM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816549; c=relaxed/simple;
	bh=L6upHGNIYk6LiIUvrs8zcdks11R9wmaJquSLT/WgQMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rN6nZ3f8TvI7I2mwjL6hNPSRbSbT8Vj/XI0FWf+84dnomiVcBa435+ZlC4/7EhhePcSuo5csJ/+ylPJEheO0TKxJV1vAqT4gxX3tIbeEXCN473JkWjPixUi4pprBh6hDyMiwKG8ng1jX5zBeQPCc7MSY4WO4YC8BXeUVCFFyoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puWxnLaI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13A97C16AAE;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=L6upHGNIYk6LiIUvrs8zcdks11R9wmaJquSLT/WgQMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=puWxnLaITyjQd2Z3HoxtPeMB6VgQCMUHhW6A7h1eSWQykKQR7uNZWIXdKWHhL4njI
	 NaBy8rnESRaHb47vUTVzThpm1z756xnwtwN+4AqacWcwhlJCrZ9qrqNcO1fNJlNpMr
	 Epcl68XcsXt8qu0UfKYTVKyMhDvxpTnymuHMZrOAeuOEFKdde2JhitB+nj49yPsb3g
	 1bFDlRvTa17z9thj/86HxtSykwU6ae8saRradXlxmY/UdAeX9E5wamM3PSlAuqixew
	 DZ+WIVjXEDqFIKcaJ7D/4rRThYV9Mme7WzPy95YxlUFt3B6vBg1cEgFTbF5SfdKFjJ
	 1aQKqScRrmBcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B93ACAC5B0;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:44 -0400
Subject: [PATCH 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=1058;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=0cC08gikvTy5BFUHETIstK9cv6Jxb/k0e5mDBRsGtzY=;
 b=5VQisWZuZSSDwAomDfZ0ayVYlEE0twKfTIhmKAuwlu0bDHKQXqPsQwv86sihrcKEsRr3BzdIt
 a9/jEQH50c2AbD0BUjmuzpYxxhOaIOxhQwH2IWswkQBZ4PJKEyk/pT0
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add the required pin configuration to enable Bluetooth.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 4026d6fedfbe..36eb42f0f3d9 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -359,10 +359,19 @@ cmd-data-pins {
 	};
 
 	wcnss_pin_a: wcnss-pin-active-state {
-		pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
-		function = "wlan";
-		drive-strength = <6>;
-		bias-pull-down;
+		bt-pins {
+			pins = "gpio35", "gpio43", "gpio44";
+			function = "bt";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wlan-pins {
+			pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
+			function = "wlan";
+			drive-strength = <6>;
+			bias-pull-down;
+		};
 	};
 };
 

-- 
2.51.0




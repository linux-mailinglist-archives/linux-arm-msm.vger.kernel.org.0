Return-Path: <linux-arm-msm+bounces-82446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3111C6D7A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A75422D253
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F38632E69B;
	Wed, 19 Nov 2025 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOeHHc9Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D0235C01;
	Wed, 19 Nov 2025 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541711; cv=none; b=PGl2/aqX3OHRCGCGuedkTR4anoCGn/Fx10TCpd0PkDRCbk0g+OA+k6TcyDe5UrBqZE687KIVbQPITVfKc514fBIq5zXIwfzPEAzpns0m5co7zpcYjN9MAXRDWSYSDXYW3ZiH9RHOQsM8jYAY7VUlllG/Pp6Xg3sjRpu5xb2up3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541711; c=relaxed/simple;
	bh=Nm7/h6r4hTLBqKkz2Ex8aon1E1oIxVSdgItCSV6pu+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZZR0mRPB+Ak/J2Zba2Xd84CEO5gdRD8W250gGBP2h1P1VzX/EG9iTlFbVIq/TshxXvtvDBySxAbYUq9bwdTHKXOFJ+7gXn9xj+JvL3B4Fq/0am3qWYbbvrY8Py3LMl0FF9Pz/NQiJ5jrmZOBvZ+ndZqdyjv5nyKN31D09kDeAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOeHHc9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F330C2BCB2;
	Wed, 19 Nov 2025 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763541710;
	bh=Nm7/h6r4hTLBqKkz2Ex8aon1E1oIxVSdgItCSV6pu+8=;
	h=From:To:Cc:Subject:Date:From;
	b=uOeHHc9QIKErfGxMUUONsi3PS1ldhCAK3fOuXI5grqMZKnG55JoV0CYaIC+1gLtpt
	 s0TkgOOVGY1cEY8ZMYzg/JZ6vqhMWyHSr+Bo1KSapuot0TkWfaC8aV8d+v6hhhSznr
	 5htXzG2ZWZt9wkapBvVfebemEmG72y45fv97KkQusPf7mjMK9pgwjzqe02ptXkZFfH
	 tBX9DB4gaPxXufUzNIttFJB6My2CioWU/bJZjOT1YVv3NRi0r+sLBypFT5Lkv9rdkw
	 D7GoMhaGsgpv0GHS9Zzd4zyzLYIJbNUL9EcMoPpOacsUseiRtLtN6VfPT+57ko1iYq
	 sIse2k88eFUdw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] arm64: defconfig: Enable EC drivers for Qualcomm-based laptops
Date: Wed, 19 Nov 2025 09:24:09 +0100
Message-ID: <20251119082408.49712-2-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the drivers for Embedded Controllers present on laptops with
Qualcomm SoCs: Acer Aspire 1, Huawei Matebook E Go, Lenovo Yoga C630 and
Lenovo Thinkpad T14s.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8d6a1bb1e03e..7030b27528c6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1383,6 +1383,10 @@ CONFIG_CROS_EC_RPMSG=m
 CONFIG_CROS_EC_SPI=y
 CONFIG_CROS_KBD_LED_BACKLIGHT=m
 CONFIG_CROS_EC_CHARDEV=m
+CONFIG_EC_ACER_ASPIRE1=m
+CONFIG_EC_HUAWEI_GAOKUN=m
+CONFIG_EC_LENOVO_YOGA_C630=m
+CONFIG_EC_LENOVO_THINKPAD_T14S=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y
-- 
2.48.1



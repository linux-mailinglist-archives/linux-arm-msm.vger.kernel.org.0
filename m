Return-Path: <linux-arm-msm+bounces-77445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7980BDFAB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A54EB4F0E23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8E3338F25;
	Wed, 15 Oct 2025 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzIrkRf1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDD2F1FDB;
	Wed, 15 Oct 2025 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545951; cv=none; b=m4yhdyfYtDWRig9yvrU1GvCHmE+I6jpyzMtdplM3DIlXoteIlmAS1h5/RXrWZuvME0O6QHYsJNp52gNl8as+mT8RPp/gK/rOEMFoiDFmU2juXYRKvc3XsgPTEpZQUgAC/orxrWUnZnjWJ2tM2nWDnnw3SueujxY7Cp53E7nCs8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545951; c=relaxed/simple;
	bh=FMqJbqQx+j2xvaO2M3G9GTqscFNkxapW8j0lcdHfUqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+O5ZZdjl8KEhnL1NdMBui6zNuZVgAxlz9BtXiLmOtSjbXtmRLyK8XQU6EpOs508seTtF33aF8ruc1vtllMKVQn9jLnU2aWeg5rlPafgsv5YYRMGo/xgNAq3XNOPEFWaM0tL8fH1KEYKGvdSlxV40VMYi/ZrYR7ua9ptT8vwfuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzIrkRf1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426DC4CEF8;
	Wed, 15 Oct 2025 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545951;
	bh=FMqJbqQx+j2xvaO2M3G9GTqscFNkxapW8j0lcdHfUqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CzIrkRf1qWTCiymn4tGa9ciDQ3RItJyQ3v55JjsV8Lle80dYYEqdF+d15yoSbQk4Z
	 UGrGKVvUPCdWZ9EDi+GpnfFanWET0olv1CjFHfTER8TDyWmOWUgamNZ7Fmopyi8iux
	 4ArmruYYzvbENMb9+lepyNcm3FMZRVjfrYOTvbv7LnL81cZdoBejNifGdokWUmMF3E
	 rxIbRuA8P8bCoZg+dK91hyOe/UMl0024JfkOJGveCKcaq39HmPk2AN8AG0/Y/qrCYi
	 +V9e+NWZ/iWm0hiqDxksA6Xhq7C1vHVpgdkUptX+Tx27eKu4/HDDbxsmDQDWJ09kNg
	 jGtPlNnoS2mlQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Oct 2025 18:32:16 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio
 node name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-topic-starltechn_i2c_gpio-v1-1-6d303184ee87@oss.qualcomm.com>
References: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
In-Reply-To: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760545944; l=931;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=TAoDwbMEXJTD0ZlXC6XIY/CKn8XZ9UisyyD5gmj/yuo=;
 b=DHyLuMd0XoXvPhIt3TTCTImkKGN2V6bYcsKZrjK69bFFD1ejgqj4cm9iwij51px6UweQPqmtk
 mBHR9mZGFEKD4quOOR/EgUjWd4bixzy4rmLQsvoqo0X1lkZa5HydzPj
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix the following DT checker warning:

$nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'

Fixes: 3a4600448bef ("arm64: dts: qcom: sdm845-starqltechn: add display PMIC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 75a53f0bbebd..61a4fe7f843c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -158,7 +158,7 @@ rmtfs_mem: rmtfs-mem@fde00000 {
 		};
 	};
 
-	i2c21 {
+	i2c-21 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&tlmm 127 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&tlmm 128 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

-- 
2.51.0



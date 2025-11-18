Return-Path: <linux-arm-msm+bounces-82348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62FC6A22E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 459072BFB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213CC35F8AC;
	Tue, 18 Nov 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBj6oI4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC80035E52C;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477549; cv=none; b=a8dpxzeNWa51C/3lmBhmAqzfUcpuKRNMlY1tQuY38CmlHdNVCGm/mkTwCBCwApHDJjP/yU6Hqo6lI6zVE8+y88r64Vu1ihlKsgZg9T6EfQr8j5pKsTbWth0bCq4At9Kh67DdI6T9mVcDX0IaCaBcvebqiIR5ywqcREmNnCzvHzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477549; c=relaxed/simple;
	bh=nfeYwL19hD5k6Lc4F6ZkvRNXQbBqxNTYPFfGzAi+ee0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmYDSC5HbKGgTUVO3hZj3IPyMV+McNf66qGwH4Bz2YuVv4n671MIlBp5mBEs5Di4qFSB6NpoaG6wC8TIgbj/UBXXYrRNjYtHiEgy3lAuF6yPn65MvEvQ3xl6YcrlP6WmYQNEnY86Tnr6ZwfCWRxelNM8ijM4cO1aAHjYzlHHl/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBj6oI4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B04EC4CEFB;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477548;
	bh=nfeYwL19hD5k6Lc4F6ZkvRNXQbBqxNTYPFfGzAi+ee0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oBj6oI4o3hbFwscxm1Ut+TDwS2Wrr7Ax6Mz7fcrQgByo43bE1E0Yhj1mPkBePGshg
	 td2rJkujsU2As0RPC6sE0k2npYPxS7bwk1Ulh8gEf9GJRoo9+aHFc1PlyjFXY84rKf
	 1bpxQp+NIXcvf5PiH7VtCDsyVNHqwa+29aLv6olWmKa1rBKH5aZZPxCFTyg6LbKMYN
	 EOKxGxMkCmla0qy15wDHnWFZO4fkG9D4KZOBY+IW9xFW44eDjVKuG06Swv6ITtxMj2
	 c2ba2UHmtYBSELpxuEaQK3zgraNKnBLqtsLRKJETTScblPBsagOibzoCV4yqthXfIr
	 un9Rj+TTpbSgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530E2CEBF97;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 15:52:26 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-oneplus-regulators-v2-2-3e67cea1e4e7@ixit.cz>
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=j0QnjGANGmzRmUOnq9jdVWDCQrtTASbh7BGRtKRJX+A=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHIgrJLbt+5shKWrJ9vnhDSlhzTU2zrY4SYHBX
 F7g+zZy6duJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRyIKwAKCRBgAj/E00kg
 coQUD/408Q1Kwch7A9SU42JCBBgEbRR3x860qPjiDEvqphiwRgk0ei3ZfJstJ2Ygg7Q00yjOzG2
 LMAjNk/mPv3ELYN+DH+jfEaK5NClhwtiODKXH8Zmv/yTHFemTtK4pFpBuS+mcaxX3XdA1vSrRbl
 ZTqed0mYjP6TG9+C3olItdS3vhC9JDYTEoHBEFZL3dwSt1t2tdTEfWHEP68Ny61bEb7f1B1NG3q
 Qw+XKssfHDhhI7A3U7ZxE8aVys/qhxDnA39no7bhkhL4N/OBHk1QaIswwfDFRLBl5U8UPNDLoNv
 4NGOtuLopq+HdbCeNkVa6EGBvCVhAnvjgYufukfobq7fT4GQZ+hpRVkwaL/trsjlQA7vy6buMYf
 DfTAT9wO+zLTh/sTIMXmOI0yKnx7KoqGtYubozUX9wmrj9qNFqE2gEAeUGro1SGVbfHs3Nkd57F
 1LHgiUKXri+8Sjic7dIV42BX7nN8bANf6FSQfCYotwU+cxRy2740sujchElGZvj9SdkpELlRnH6
 X8QJvx8f83k9GJjBsYe5piHQ4dXC73Y1krvMkWq3Lj8HqSYf9W2uUUj3Bj3eRNxL6GMt6ywTg6l
 YGfZKc87r1PP67voAPQ7Mw1X3E6QNlAeQZquzR0RTZtL6+RLsGX15nWETxkLxFJd4WVG1PJgYcF
 3IAKDLka65EN5Zw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

The panel regulator doesn't need to be always on, so remove this
property.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index ee62adfa6af0b..5845bc3bb80b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -272,7 +272,6 @@ vreg_l14a_1p88: ldo14 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_l17a_1p3: ldo17 {

-- 
2.51.0




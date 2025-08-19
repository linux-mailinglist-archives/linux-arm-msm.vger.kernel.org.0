Return-Path: <linux-arm-msm+bounces-69760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C24B2C54B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 15:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97F883AD8AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE683469FA;
	Tue, 19 Aug 2025 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d46pVRlc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE932A3CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609446; cv=none; b=kT8mZhykBFUW6G7L/eesTk/VNdiPBrfBKNDEnjWUFrKqKpqP+8or+vRSNqWexZEIwpuI/i2N/fzPlaY26k28Owouuvwk0Oocc+2ntrCqasLDQwCg8r5lZY22hMRmM3hxoPtEgXvfuzR1oSBBkM1/i3PoAXDnvzYv97AzvHKR8z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609446; c=relaxed/simple;
	bh=cAElRoL2NWCvmuacyatuiiR1RMfdevKs/9j2Ed/NzVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMxuAV9g3/YiLif4ecYVyk5LbumCORcFm9+m4wkjnYVr/ciEBxYY0E3WA1+j8S2ABJmJoIhjM9jQJ40M3ba77vQvpU3YUiQnqhOz/zpE6EwP7nwQiUbwhJ3zy0NAWOvDyVoga03L1ZUKGF2xrIh5oKFBiS94GkdboKORbfSxK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d46pVRlc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61a3a7c09d9so332072a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609442; x=1756214242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/SWEsw9FA3/BNJIk6fInZnfujPr6po/3IYDw4Qd3Tw=;
        b=d46pVRlcvyQdsdPXaWZW6HaZkdmzYUK1XGcUsELM+dXpJ/P4bjP1rqgqMo5hpdip4Z
         1pokdrZAGab7R4Ty2e8gq0ftAV8VSRmUmDrZZNvhfI8l3cFAkTCRm0IACf1J8EY6e+U6
         fB6ypb2cT/PaLbirQMiAc8DbAgoXGMmyndPeDJ/dy3MGYlH153/pfUthhPZv15xjcebo
         k4Y5AvCqbA1biwG9kG+H2jDjZa6AKawvqV/MvWz4WK4CXVFDkR4hX3GUk8lE+Kx+Re9j
         4WQASxRf0fi/rGUuynD+wSD+KVI4tjKLUXoK9EhzJSWRbpEGsb6PvOR1lKmtMg1Fp3uS
         GYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609442; x=1756214242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/SWEsw9FA3/BNJIk6fInZnfujPr6po/3IYDw4Qd3Tw=;
        b=cuYSyDZh76/bVDAyoRPqPIYuKYSTo3IPT7T8W6FpINiaBEBj3DNfDjQHkMlU8vw1kR
         9xYHb5SJlT4dVhACFJpaVbWcJqGInaeSDgeeNvQjJxJySaxsqj5Fk1j6r9fFKsw8urNU
         QImdb6ie+l0qSnTE78egdb1fPWiRQdKulCj3G2AwOJbXJ4tpNbXESNVY0QqNhDcxgzRc
         RP5NQDf7NRjQI8I4dUVptVPFUJuiDOw9Ru//eUAjllOd8Kyw9XJi8z0PEwBjQPuGYZct
         E/cLqoulSc6j3Tx2AXfaykX8TQoJenQZZD6pn/7sRCjPHoFeq+N3wie19NimBIFmgA8T
         E4wg==
X-Forwarded-Encrypted: i=1; AJvYcCXgpzSwNTgc7Fw4uDK+TGgIoYE/PGPFIOLeplxZfjNMfs18eClh42y95ZV+ZcpzN2py9E6y39RL27YZEIf7@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4wc30fhDqDHlqHMMGdQTcw59Pb9Wtn9dsabvuTxpcFAMuKcq
	VnaamfYcKYwQbjfAv7hqRZQJpdMBAf117R/NbilLUKQjZBqkqpnjMpgYs93JPlubsvs=
X-Gm-Gg: ASbGncsozmUcuBdpb2CM6DrR8x7g+s4K+ANZwTBDf0/AJqY45PHjgr/zvUFZxezQPy7
	dpee6I7KCLoDyUWxX+adKNza6GUbeaoRyeCEe8iIpdWE1WhiJjmgqDsanfo0hz8qhLv9HYRL5ts
	gitKc26cqd9j1HEpU1/SavTUCS6QF+p7vQCX2/UFgGVEnKaGt9nbGNPIooxHNaz3yDUqbqK3avj
	w7pM1gBjm/20+OoGKvx+gNbLEKP0OpOyZtBl/t/DezHl7dm5i56P7/fmvWonZWu1uYeqnr+lVw3
	/OFMzvsxrlQ21ioXDsiN+krke21FmPpbvi7+A9htSnktzDtWIeDrTVe7hOPC+gvkepLGZjD5LP4
	izZPnBUuXqaw7AKYGTWHbOzW7oyqX/r/MKw==
X-Google-Smtp-Source: AGHT+IFLw4OO7nSlgIF0qPS+YvoqDVvOPMHcN6Km34QLMfCyT+GzpmfJIFPnh8iJs+rvRWXDVTu29w==
X-Received: by 2002:a05:6402:13c7:b0:612:a505:34c3 with SMTP id 4fb4d7f45d1cf-61a7e765e61mr940286a12.4.1755609441644;
        Tue, 19 Aug 2025 06:17:21 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a758b8efesm1694229a12.50.2025.08.19.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: qcom: apq8064-mako: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:18 +0200
Message-ID: <20250819131717.86713-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=cAElRoL2NWCvmuacyatuiiR1RMfdevKs/9j2Ed/NzVg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHldNt7hGa21JU8Gz1KGlMh3GILNacKyzCCeP
 voiRS8LlwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5XQAKCRDBN2bmhouD
 1+NOD/9CfUYtVivxuyZU4eEgjmt4Q0N4PsKnUbRscq6f8ZkQVHxQxkPrbyNeHSziNjMIyKZNowe
 G8bMZNapagriutogSZxWpukuiwLe8iaAyyicBDNxgh9PN4ECtgXpeLqpYrMPvADUbJ/0B4Yefwg
 4UtDTNtuTMXlEkE9tA3simAWtomIN/6AKa2qUidyK2luD0+UZFMtfr2Ddr7ICYlRpQMqAKawkjp
 gOs9W+/iSrHmaBSYd9tSInwsHsMl7mwyMxI5zbQkFI3FXf/o7qnqrAKhIWmlrWNEDGMLYmaC3kZ
 f8eGUArolxbe8iKTpVaiv0R5sW6z9tsRniwlKMC0j2UIcUNvT2PYnpombnnloMKxDwV447UqXA9
 Ys2nlJzeYKtzJUW+NyHkOjmjz4O7BiY/f6V5Ba2e0lYai9EFFE2vVc8pnjoHQJfCY6CfDHsMDVz
 3RUa+wzxIFA3UO+tcKXfjinbH+fs60L/zT2lHUU291yDsExinQpVb8kFd2CnBSyIYqwBdGCGSnq
 d15akv264DZcQj9aJxWAEu3gp6IGF6aFWB4ba2/OYqYwEUOThD8O9UcDEOPRXeljPxDpq1wennk
 9JqZluZAizzLPi/dHHAVb3nOnQXht5aL4PLsPxEdE0mAxIpGQHTlEQO9c8JF9V6JqL+6S/L/yyU dhLb5c0Tkwtn+YA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
index c187c6875bc6..fdbbc1389297 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
@@ -34,7 +34,7 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		ramoops@88d00000{
+		ramoops@88d00000 {
 			compatible = "ramoops";
 			reg = <0x88d00000 0x100000>;
 			record-size = <0x20000>;
@@ -326,8 +326,8 @@ pm8921_s3: s3 {
 		 */
 		pm8921_s4: s4 {
 			regulator-always-on;
-			regulator-min-microvolt	= <1800000>;
-			regulator-max-microvolt	= <1800000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
-- 
2.48.1



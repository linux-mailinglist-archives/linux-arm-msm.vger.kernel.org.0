Return-Path: <linux-arm-msm+bounces-76575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A0770BC82FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BB1C934C685
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594F92DA75B;
	Thu,  9 Oct 2025 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RYYTk8nx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2182D7DE9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000811; cv=none; b=R0lSWesDMSQr6YlCDzi20M3RiTCGenxAiof7gT+ieNLprohf+jJBWoAGHIMU1ChpXvvQtLrRVoUQa8ba6bZVPHp6nV5YkMKp6Cbfr/aed46Tuhm5B0F3JUgKfP/ok+jeHbMyjlBkDg6HKBimB7Uo9HKrVb6OPPk9ThUtfdG5Oes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000811; c=relaxed/simple;
	bh=SqYp6oMGQfRwN2qH98jj6JyAPPXL3u1jMwQvHYWacq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1ws4mHypVvlQ01fZd0Cl0PQMdrBDOfeuq830NvUACmw61X8sJvM2/PUN+AfH8dzp7/sQT5obikqHi/EO5gSoNG0en/Vh1nY7j9Oaench/q854eFUjK7BYfo0Mhn78FQFSrELfUvDz6cHPdmuT175DpKC0FhOKYXEj3IxzSditQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RYYTk8nx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so1375300a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000807; x=1760605607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNMFRDKf+PR9ZifP7PovpqPBrj6t9cvi/yjDK0cLJZg=;
        b=RYYTk8nxGInV6JK+Ti9BAS9o1eWxsoLGpJSrpBOpTCyN7VDU+HwJTNnznx3hoWNlCm
         7Rt66NEwCSc/Ir4uYKqcf+uUtAt6uQ4qGoBVyygOGhYerpPYWjzZhDq7O2Eg/we33Cqg
         6wkTs5rf8Jdy8ClQVViFSaknu2VDtTXl1oVaNnM0biNsWMXPRneev7U/6yoquWg1hmE0
         miILVMxuowQAXuoYtkbkFJGQ/z1UKP7ltuu4V8+1j6sSdguBNxTdWQW2TkrjOqBJOFzj
         ISqCk2cl+FY5WsoakwgIQiNzitGdOgvWiilRcaNkrdsAXHINYT11vwx2ONCUJctNdQLe
         X6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000807; x=1760605607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNMFRDKf+PR9ZifP7PovpqPBrj6t9cvi/yjDK0cLJZg=;
        b=H/qyrjJk/ZpkajiUBD40DqDdHm3ZsVfHkV5Cszxx64Bfv7CyFOY1i302zq1K/tFXVA
         wHF/vRHUGdU46Syp8L8Kz45fuDCf7ETnPEtUovG5TKE7wRMD2MCYGMmJWH8JfomYhKgZ
         MkKfkbx8FdN7OmWZD/hQ4Q9VonLmgS0l5T8dlvMjBuYvvkOeIDMABh13a9qdn/NTHt4k
         7a8pVcvaTXDctDivzChvEE0vHFR6uP9BMsmI1/I01l9BgJe8zUpGpvqAO9aoS8GyAAXy
         HEBusgiaLJI2hxybCFR5aTg6yiTzS1p0HAsbiGiTSpVP9inE3sh9QcjhpE/7ms6C28Ne
         gGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVChTUaRnN35jvJHTrxSR7/TOntuWr2d96OjNOU+Jf/RHSFJCM7I1ok9RKANB19JbJ+dSqB+kZLZGWInz/X@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKiNzx68iNRLePL3fltF9T4rsddqPIeOfZzkdzi+r0hhwn1RG
	tMGaZA1KDIQPsW3PzgOeOB+9PnHHXZifGFdRRhVWAeiNN9NoRyCKH9psmqwKl7HfFooPmeaNA9D
	C82hwc+I=
X-Gm-Gg: ASbGncvMdzXq67V5Imsk1ArAaxxzNnR/n+NqCgap36p4DQpShVqm5f1D9JGvnnIeMF/
	qXpwi8sKMB562dDZQJr3c+jAuwWX9/z4oG04v/TK2lmi7WpCipnj2BH3U0tSTG6miKoWoXy8vZe
	xVj2tS5qlg27+uON2WywCz9NoSRmO0wakSxwuOIDah1pppI5wEQReLkcozqedXR0pe0whwgQAG4
	SBXT6PNpzx/z0yA6/C1fVWL8KglGFL2AG6UR0cozrQhFLb/lkaae0gJr13eitcmNkSDO6iVGlOx
	7Q2PNa3A4DGxqyQGUiXKy5rb4ekanWMKpzfZZX2QvEvUtiTgUq14X1e9VQD3TZZEC5dVYsSoCiV
	Eosz6dOJYfqoNmuynObS2mw2RFHw/PuHTH7ColJfiTEw0wF5kyYGeI3hMfMRK5On0BYEp1UQzyE
	ug1AkiNSVqUhW162Fx41MMe8iYGGX9
X-Google-Smtp-Source: AGHT+IGm/Mg20wT52Yz18adAEnK19Y7RIb9c4hj+CZ1l8vH2jZ1AG0rITrk09L/xcZA5AmW7s2lOKQ==
X-Received: by 2002:a05:6402:26d3:b0:639:fc76:a1c5 with SMTP id 4fb4d7f45d1cf-639fc76a9b7mr1504552a12.0.1760000806651;
        Thu, 09 Oct 2025 02:06:46 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:32 +0200
Subject: [PATCH v2 2/6] arm64: dts: qcom: qcm6490-shift-otter: Remove
 thermal zone polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-2-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=2070;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Xc4H+R3mMQrdOpE68XhI6JWcRws9SKVfGYWA9EyPAUY=;
 b=7CsE0YfsD2z9CLqNOuY/vXXLfkngSXvRXnGRSw0zBuQ5jQZ0VOMBU+u6MslQvP2csPjlDDrbT
 xcjwltMQFI5C8Thh8ymLmP2AGKLvF9kHo3q6JTSjrIhHnK3oUbr8TF/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

As with all other devices in commit 7747a49db7e5 ("arm64: dts: qcom:
sc7280-*: Remove thermal zone polling delays"), apply the same change to
this device as the delays are assumed to be equal to "0" if not set.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 8d45e6ac0e44..0d331bda4a82 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -130,8 +130,6 @@ rmtfs_mem: rmtfs@f8500000 {
 
 	thermal-zones {
 		camera-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmk8350_adc_tm 2>;
 
 			trips {
@@ -144,8 +142,6 @@ active-config0 {
 		};
 
 		chg-skin-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm7250b_adc_tm 0>;
 
 			trips {
@@ -158,8 +154,6 @@ active-config0 {
 		};
 
 		conn-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm7250b_adc_tm 1>;
 
 			trips {
@@ -172,8 +166,6 @@ active-config0 {
 		};
 
 		quiet-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmk8350_adc_tm 1>;
 
 			trips {
@@ -186,8 +178,6 @@ active-config0 {
 		};
 
 		rear-cam-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmk8350_adc_tm 4>;
 
 			trips {
@@ -200,8 +190,6 @@ active-config0 {
 		};
 
 		sdm-skin-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmk8350_adc_tm 3>;
 
 			trips {
@@ -214,8 +202,6 @@ active-config0 {
 		};
 
 		xo-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmk8350_adc_tm 0>;
 
 			trips {

-- 
2.51.0



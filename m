Return-Path: <linux-arm-msm+bounces-62053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0DEAE3E14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79DA717353F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E179D24337C;
	Mon, 23 Jun 2025 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltve4euP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D723C511;
	Mon, 23 Jun 2025 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678637; cv=none; b=J9GvunwBdith2BDSFeS0wrokzP9QqlII6WfcA2+q9VNtgkZMA2Bed9m+/RTKS8zRFjHL5fCmtDaJmuOL7DovKJZKvyuxtYAQpTdL8h6QgtzXibxgYvf6Z3lsnwXVkKLju/YQrRciHwVC2f7e78ZmH2H51OekJrI1eLHGuW0m1UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678637; c=relaxed/simple;
	bh=Y0VB27RH0WYoiyehvQWxTYoe3QvLHXGk9F3Jdn/qOG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQiRChO7BpvaPk2C39vDy4UKP9gwIT4ok5grSxK73j01AChwKQ5gQcON0+TbOgioz7BhKbtt28HGo9M1CPeuxfmNAo+bk7GKs13tgEOYjXNn3OgSPx/zehnYhvIRHxZDq2d1VGGvzNiwCMVsPmaYb67DdG/uZTJhYSTk7QCQ53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltve4euP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so39120945e9.3;
        Mon, 23 Jun 2025 04:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678634; x=1751283434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0Lv0sWU+klYLwQqzfLavoUyPC5rHucRlBjUY90ufh4=;
        b=ltve4euPgVTB/cE5OMXtLJi8xQNUAAGlD/vaVx29EzDFVf4O6feRAxPk+YOYhRRfmV
         c1J+VhdDwohHvDq+dhbhvxOmKmnUGj+3GcL3PRM+76Q8waH1z+f5BmZhOtXFBi3QW6Fy
         BFg9xDBm/66Yzo8ZTtyAnBGzY8GKOX1D3F+sbr8BQwVJeeImV9HWHu+JpHLdvQ84HkCn
         JLpMTyvJyzmHb7Vzrbp0m7GVQ4FwxHfhQkRfP+JZO6kGZGbApHB/C23PUUtwQqaYaG9w
         VkuI3sTjhsdohsTOKOjGl1h8DK3xXBrutoiFo6HzdCakMpNeHQIsJPKnRnThOf4H+ghU
         cCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678634; x=1751283434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0Lv0sWU+klYLwQqzfLavoUyPC5rHucRlBjUY90ufh4=;
        b=SpHLrWbo6G1F49oDcVhxPVopT5SLy1b9TRM1Xwk5wa9/6kLkydk5uyd1LqtaufgwLC
         esP7482vfAeddJFaMugMGWb4EySpSIvq2CpcqGdV68wwED3nU6sGrbgcTJPA5r8WOhNS
         ADPs2MJqHxeGCh6eHR9v2JVenGpAgDCM5uV54byyrQDfOT74V6FowH2k6bS4CL6cHG/A
         Ot0WG/IT7JSGiJMVklVc8XvYS9Ws3H9lrgIsyXzhWRv2khm7eE3vJbL4YPGHs96tvEaA
         NhHutoLXjipDp7OPj2JEoOPON7SqGRHeCMr+u9cHdV/sWccGCqHj5cNPHnx3uUGm26NZ
         /MkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW78eZo4FQNVWuHHLMPef2gXsMqSKKcOCk0cjPkC5+2GKpBInxDIIq8nJaVbfa1K1MC3pyqEZlAeMuQpgbleg==@vger.kernel.org, AJvYcCWwRzAdVkHbJ/Dqg6+UFOwWxZgA1uzTKaGvXRIohYWkoK8BWy0x16wVnlMLxvxRsFNaotl4r0rZmqBK@vger.kernel.org, AJvYcCX+Smo2abdSJbsCf8GG4rQx2awHgFSalBsYgzv1+uNMLinUd4tF08jMMMHxbEyMvt0YHJNQInjxgqLcbqNn@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBScs2weaGZ12dc90JDEIPWGjaP6ksoSoqf0szHnkX/7MQExo
	W8kzYz+Bj7TDZC79CRTNADxKmVJmjCaKp6iMuSk8yr53BBHPiGk35K4=
X-Gm-Gg: ASbGncsW9Ax3u5AVbpGWaU/salSduyDCcWP7R+KluA5QTiA0dkZmN20uKe6XQD5R3Jx
	mO1ixUN80HGNjyeRmJp11Oo2WP7KON8ZOhkoftWQieZ3so//2F6px9nA745LksNJ06/aSzqX+ze
	gspcRSkoAC2iOopfzW+m0cs9dYm1LX/hpke7pcyvID5ZCPv4yK/5MGr0kI2Y2JIEywGgBnOp/yY
	ntUlu/sluj5ZBJ+CDg6k4ikLNXes68/HRk0AZ+mamt7JPL7loUhbnm5aLkyqVg95DyulXo8whJP
	so9Jq3LgONZdyZaVy47iOPNSrMP2rEj47bNqu40lZ0UGUhnVBNImMbkugBkWF4kHhzFmcZF76mm
	arD2WrhyMCXzPdAZbx35iJDBBfg61nQ==
X-Google-Smtp-Source: AGHT+IEv+15TvjDvb3IzFbOpB1C98nfMg5GVXW0gUnO3EKDSPcIMvitHgUYF7Nucuyqmo7bf3faQKw==
X-Received: by 2002:a05:600c:1e20:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-453659d7233mr125746725e9.30.1750678633817;
        Mon, 23 Jun 2025 04:37:13 -0700 (PDT)
Received: from alex-x1.. (mob-194-230-148-213.cgn.sunrise.net. [194.230.148.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm9092625f8f.29.2025.06.23.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:37:13 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
Date: Mon, 23 Jun 2025 13:36:13 +0200
Message-ID: <20250623113709.21184-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623113709.21184-1-alex.vinarskis@gmail.com>
References: <20250623113709.21184-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears not the latest version of the patch was merged. Align with
latest upstreamed version by correcting GPU enable location and typo
in GPU firmware path for x1p42100 variant.

Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi      | 4 ----
 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts | 4 ++++
 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts | 6 +++++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 65c41d99c9bf..c8d6d66d05c8 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -645,10 +645,6 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
-&gpu {
-	status = "okay";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
index 5b254d867694..0d0bcc50207d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
@@ -14,6 +14,10 @@ / {
 	compatible = "asus,zenbook-a14-ux3407ra", "qcom,x1e80100";
 };
 
+&gpu {
+	status = "okay";
+};
+
 &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
index 86b16212c168..bd75ff898601 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
@@ -80,8 +80,12 @@ vreg_pmu_rfa_1p7: ldo9 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsucpurwa.mbn";
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsucpurwa.mbn";
 };
 
 &pcie4_port0 {
-- 
2.45.2



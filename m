Return-Path: <linux-arm-msm+bounces-61973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9BAE3032
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 15:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E411B188F315
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E481E521F;
	Sun, 22 Jun 2025 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImH/CLxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F91E1A3F;
	Sun, 22 Jun 2025 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750599789; cv=none; b=eT7eXS61fr0Y+IHTcSL7+7q/nJkuuYoLhtfKGXyqjYnZfU0Yi37rK7RPrLOB+/wJxc6Ez6YP59qnUimqOiJhu/FcwgSyHKavxWHz5kBrAK6lrJjhbpAAZ8Hzo4m1OPwVc8OENp1zjtTIhvWbDPXspiX1Vmpxk/rwEcvf3Ynej18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750599789; c=relaxed/simple;
	bh=Y0VB27RH0WYoiyehvQWxTYoe3QvLHXGk9F3Jdn/qOG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHyGEoOMZ/veXyRu5ogLdegF0ppmb6OFmhDq8OXGYoT35vnEowq1RhJHYeYd0WhWb5B7bKWe8PYdJU7YVRIIDXUI5vw4wHOOk1ekQwNHU1eG++eZ2DqqGevGoeBrSnNTpK6JIuwhTn0ZkilZ+OcX0xkQ6b+mCMrQ9hNob3kjSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImH/CLxh; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso5771352a12.1;
        Sun, 22 Jun 2025 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750599786; x=1751204586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0Lv0sWU+klYLwQqzfLavoUyPC5rHucRlBjUY90ufh4=;
        b=ImH/CLxh0DOMx1gLRGjfGkfvWVE1tn4yFdFy5A0e0BUqwV949aL+ze10UJKJi/J9Up
         ho8YFINQtn9FEHYW2cKygYxkWnbxlrrWIoPdwheRwovnsW2IOnMELN6NS9taR+9FCKhE
         il/rCMLtuENfK/miOCYhy4stQb86LeUbOEx1dIXQT0hrWSt3uh3EnFfSoBKRf0qRKnLD
         sRK8ThWn2yeaaTU+RtyuBNQLivZF0kXC4vP1jn4Md8Tm2J3CfGqbt/4IfwFl014fNXUR
         lY7p517pXhsBw25yRYiATwhKJJfZK914IaSDU0j6CQFaLvF0ZqkVPjdThll9Bzt9u7xK
         FI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599786; x=1751204586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0Lv0sWU+klYLwQqzfLavoUyPC5rHucRlBjUY90ufh4=;
        b=nNU3FP3gwb8AyXzvc7fkIGl2u5VwONfz2JLtLxZYFJzfPrfrdlIWRMrSeXfllIVja7
         vYaHFtvn5x159cdVxhjcwNFMzEGJCGTXQngqyHhbX1NSaxDa4sJoOU1PsL7AC6zyA+yh
         zZ5zUSZ1et6pTHM6BKOqITzAzsiIvaB2LOiPDpXIG4daEyMiI38z2yOnJbHjhh1EtPUJ
         yQSUVtv3ZN+QENsac2JczvMEb6SLTCQ15RyHQpotuBQOkuDxeWQb9Zgs3Dj9cTIFi8yh
         Z3Mwi6O+5owoUap38/8iAiojlPx/y8t8+ob29brDBxJlXRrZxqFclRyVyP1sXLxbQpmE
         6/dg==
X-Forwarded-Encrypted: i=1; AJvYcCV6nBca/u5orWiPJqFeNNodugA96PwI/1y/7gMQsbfVh3nOHKo0ZytcbcnsmERdz9mQH6QvckoOot24@vger.kernel.org, AJvYcCVd/HUSpwc//qLQLPHgztmwzbqNIK5xciUs7xnCNfW65+YmhvE6Kid1j71xE/AJwVOlkZ1LOb3wsY0FI+VSdQ==@vger.kernel.org, AJvYcCVtBAr1XuOrV4f4qyGPh+CgWbYQMWQ6T528h3bJ2KqNlSGzxg7YeIxwOq4WFAzAp4ON/yNgkVVZd2gzWVAC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQdfKLhlTeWHQA3d9aNUNRcaCGb+U/WVszL3pNrMfSjA6P5ri
	oed7+HP+UVYzBdqg12jncs0NBxQE5Rq8dLH8oanP1rT8+wQBY3fNsXM+E7F9o1s=
X-Gm-Gg: ASbGnctY9I3Bj+a/rz7Q7Bke6QP+5Q5WSYlXihCGL/zSJT+XRnqKm90nzzY0mca545y
	CY8wPHfKz8jbzdf5V+XtWRxHv+9VhM/N5ucpV0ZsLu/RfzJGJNH9CYc3x+RixEYvGN0Shu1RV+c
	ovuvB4tzg4s7X5tPeK/P1dxyj1r0I0Dcv5vsKUr1yZYKo5DgM2Qlr+4lcYMFgAEgFITIg57LksW
	dkVSP8N/IWtMZyn2OJGETmAKWZJCbcCUqMnrVCOcdsQL4USi1CbJXNQRHbV9Dle7AJg2HSuj42Z
	wSswEQ8sKZ3Pbg/JGX/BaZ6/vGn42CUQ2cm7yPK/7qOa18khk3Jbw8mIUdmMra+16xyYyvGj3Q3
	rBQk=
X-Google-Smtp-Source: AGHT+IESm5fUmklNae3vB3JsjrZPJ+MPQDbqcQoDHkySbyDFVXQsKwPzwgLMiMDXWJ+qWUToyGhIDA==
X-Received: by 2002:a05:6402:40c3:b0:606:a99d:91d4 with SMTP id 4fb4d7f45d1cf-60a1d190867mr7676023a12.27.1750599785714;
        Sun, 22 Jun 2025 06:43:05 -0700 (PDT)
Received: from alex-x1.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm4654457a12.53.2025.06.22.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:43:05 -0700 (PDT)
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
Subject: [PATCH v1 1/2] arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
Date: Sun, 22 Jun 2025 15:40:00 +0200
Message-ID: <20250622134301.10403-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622134301.10403-1-alex.vinarskis@gmail.com>
References: <20250622134301.10403-1-alex.vinarskis@gmail.com>
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



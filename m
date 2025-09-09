Return-Path: <linux-arm-msm+bounces-72877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5DB50965
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 01:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383075E517E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 23:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB8628CF6D;
	Tue,  9 Sep 2025 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RDbYYtC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E359C266EFC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462165; cv=none; b=tPEwPPVE9+dnWWNz6fA8t7Iy2bq9J3ZK0SMm6Njk5do2oEqwDpMq7/Z9UecS2N7xhG2WxIYFw1h+nhv8UeaR1MhreDCJB4EAwaUkkxTB2zkeeCtpX0e9YlrS74ERmTPU8xVuYFNUUSiUywP6kKsJkygymWkZsc2w149rT9DdTMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462165; c=relaxed/simple;
	bh=V/4bySwnQHyMs3ISIH9yIpaRt7bcIxL4U2GAC/rhWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OyPz5xG9I6qgzbM2KXhDN68+NDoDWApVRjaPpQrbZLFUxNykjdbT+195AO7Vgvwb2RKtntefXMp1qzGebtCLeH++RWEEyj8lK3BTPo7PiaKDzqH9+yXfYf3aFRPzwr2SqrggawEp/0y5r6dUfmAddccRAt1iS2oYvOFSLVqubJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RDbYYtC9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-337e43f9c20so5040091fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757462161; x=1758066961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wut2N6v7MXaS7iMDatzIHHoOrLQhmLH2PYx5ZEyzN4=;
        b=RDbYYtC9MgYN+9CBqpEq3e0f6wHM5brpundGbvY3sT6Tyd/x+nfJzfdaagnkUDSWw3
         qpuyldzO1ewP/+XEga2fVWCwoSX0uw7i5E4N1nNLqHnxDzgMkbu9yPq+AlNVVUBCK3LL
         7xQ7cUgIC8PsJlg/Cv6UZ0omn3ALn1xLfuYFLcuTgSygVFEkh1Iht0jBksuTc69P3gHv
         Ecz8eEQ6j7prON5Zl0R6BPYj9RBVQR5ey7J1MyV31JAK8afBBOu80gY66RJIXjhsX/5s
         x3IkJavdpuRVbN66PwOElhiRZW5v3oBhkY/iNLub2LEDsEL/KMlJ6gdPD/QykBelVMtp
         GtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462161; x=1758066961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wut2N6v7MXaS7iMDatzIHHoOrLQhmLH2PYx5ZEyzN4=;
        b=MY5EIk4Dc7CmsZL9wRqX9bOoLM99QQsdxhQY1cO1ry7YRjfggkQgQwbUNqBrd5nYIN
         EHYqlbT7SjZLUD1PkHsItPHDwFO1aMzmPxkfEnf5OvH/7v/nEluJGdbCDYWy8yV24oio
         NzrPdPjA95sIxBQqRIAlZRlGp1/yZQ82KlvSThBTqfigwrGy0CAwZD4APBF1bvQYZUgW
         9ZQkInWc44q1Tb0DKchiYq1jYf0+JCLRsBnBS0gelF+1JnHLxtxYtFS69s+TwG+HfjKr
         gvH8Jl7NS0RngsU/pqCfGtmNT5e2uPLHPbyiB/MbyrTXrsyvU32X9sFnxzjjDpzdln4H
         /MPA==
X-Forwarded-Encrypted: i=1; AJvYcCV7MW0vkApryz0Gv7iM7kmPyvYbHiugXB6zoK+uYIJcTEo+MS9dobOj537nJwindwDMax9VZJUAcbVo8XIs@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMf3x1t/iIlvl4JLRh0nMdv/vILu7yZOk/XxcJJyvqc+KJwDq
	WoqZTvMf1eFHOesGJvq8XY2MFL8Wr3RG6sgX9L5r1vivyDciPyTJBCGdpIAnzMWicMqLh9kmk9b
	8lH2f
X-Gm-Gg: ASbGncsjOwkn9bEfgQ9SbGEUtlVsBvykS6Yohd/RhFVRVS4ACPV1HF4t4svUZgtVTcf
	LRYwHqkz2Z/POGMJcmHzWmVUSKBk7Eowikw/Zu/sTF53N0LTNIGolBcgBapTRvKCiaftDuNlw73
	tqPsxXbjW4cYnvO28opWEYtWERal+A1EhqhiZS7U4PVO/s4pnMipT8a344timg7/BFRFgX7PEB4
	Oq//ah0df0cBVy3gLlnDOkvrm3gGfMg732+XNlQ+E+UYya73ojlh4dwqsnOlHbMGmlNRxp3d2C/
	a19h2Yt6/TkOroEIvNcrOdcdbfR40FipZcAIsH325O9XxButyAg01Ub7Jcpm6A7PZFkitN8BHFq
	5KwXhLFYtzPLOLAsQ2ikd82XDkz1qN5JGG68G+VYEkH9DefPJ15by7ER8r2X2fzdGQKzAnoA=
X-Google-Smtp-Source: AGHT+IGbUmd3BnTOAfvqhxqaxM6jeYhQvHJR1zvOluF6st0Se5DPt6WufPTIfT4AHhc7z45LT5rx+w==
X-Received: by 2002:a2e:a9a0:0:b0:336:d8e5:8dd2 with SMTP id 38308e7fff4ca-33b4b230a64mr18040141fa.2.1757462161060;
        Tue, 09 Sep 2025 16:56:01 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c905d6sm44112571fa.20.2025.09.09.16.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 16:55:59 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8450: enable camera clock controller by default
Date: Wed, 10 Sep 2025 02:55:47 +0300
Message-ID: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable camera clock controller on Qualcomm SM8450 boards by default
due to a reasonable agreement of having all clock controllers enabled.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
The change is based on Bjorn's qcom/arm64-for-6.18 branch.

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9ebf2b8700d2..e9ffa0af3cb3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3300,7 +3300,6 @@ camcc: clock-controller@ade0000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			status = "disabled";
 		};
 
 		mdss: display-subsystem@ae00000 {
-- 
2.49.0



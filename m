Return-Path: <linux-arm-msm+bounces-55624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D5A9C837
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ABB84E203D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE0C253355;
	Fri, 25 Apr 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pEAT4CBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA71250BEC
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582040; cv=none; b=GwOGVda6yI8FINPrRufuH4t1sih1sgIzRvaIgcaV9Nc/hN/B5gRTk5NMpimafmswIxODXsifQzE01DSij1K7PGrD9gX4n1qMyjJD9/c1vKaqKYriaoTVqnLt24orcOE65UaQShtM/IlFF2VmakT3G9wm2+Isy/nB/8fR6Fsb29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582040; c=relaxed/simple;
	bh=xA8NKzSZeMZy2ZgXNKPIKIYpW4Hf/Vjvs+lFkOc9rEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAzP9mT6ec5T8fJ+XC767A4FdqAAMrCwu2sSZjxQXbCsPQEWmhuhxnOUYVbuxjI/lAQh1V7o49leObnQ6+QV1ofG7SAw3kSOFP2QtonwclS9fYeeSaHgWTHfyn9Bn09hLD6/O9q7IfVo5++FAkCJ1j756TXrdQTKM/d3xPqJf5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pEAT4CBK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aca99fc253bso322538166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582037; x=1746186837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+EeMa3F8H7ojQ/yzojb+zajWCzvkVtlo4S7C+lzWDU=;
        b=pEAT4CBKk8kZq9hHx27kz1/rPMRLh/6FOBQ+EEUKxpkuzjDe0pYoKWe+0P1f5bskdm
         28+FY7mCYGXSNeJ2gQARRnEtvKPBsXuqWexneVb8ezU6sOT7OuxLq8/7eJnexZDF784c
         /3M4kxFGstu/hwBIzi8Pa96Sc3RdJDtl0X4EWj/aYcnxzYiV3/19XRot9Ace6tcjPdpz
         LoiF6TDM8A+Wbb2+MXXxb/7JYS4/HpgJBt9ZlzTvL3HhYnlTfgRwQ7k+5nIN2PvuKlV8
         RcjTnGPoacFublesm+WdyQJkUiCJXGibkK+lgibz88IAfMtzLL1MB4AvVwU93n5ZedRk
         HQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582037; x=1746186837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+EeMa3F8H7ojQ/yzojb+zajWCzvkVtlo4S7C+lzWDU=;
        b=KefjnW5y25Hh5/oKLFpITt0LQWFRPTLSmxizm2tgCVjGgUgkm5divmIkaaid1GNtNU
         lVIE0e4vuSMsTXkRQJj2J73jjAccZUk4urbpCLU/60r9z7Tmxjj9PaMmMfPBnObeFCgp
         noOdJn8xXdIULnV8GO5DwHBXvUGd3vJ9ksOGGgxlD0X+tenHcxBn0AgeNN+Egm2pXqbM
         3sAZlDGnRvydJ7VCW9fRr/a4eiXWmyqP9qBbUTzol/914poAgev5X1aBwLJHsIzaCbe3
         v6LXoi5JsB2gXfdstJOn7PGfDjlktINtchia5OlUwOwL3XBCFwJ1DNLljMgVFPCdWuBw
         xPSg==
X-Forwarded-Encrypted: i=1; AJvYcCURe/tEvoYYuV9z3NxznPTLp59LaKXmfRwcQlGokDS6g0mnHFOGls7lJla0XafYuwoO2nZ3zxPbDd6zuVb0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr6y9lIrbEvf3KwINBbM4kVK4t34syxJYmkq172kHeHzUBNYJd
	hTZtUE3FulSeaUJh+i6fwVrMeky6dCpYJ9hy6LGyXdGexBxh58Rz3qcHCG1EJos=
X-Gm-Gg: ASbGncs43aQqiZSx1+aI5CxHEw/grgeO7GhbLeDhIVruZKR9oa49rIcDrRPt5atSgdc
	C9sSxODVXsAFFZjVU0CcDbi7N3tjqWlBnKOmnYSMUtu3VMMVPXzrKy2OtqOqaUBkl3SprFR1gcl
	INQJ9HNJxXtCJyGkgvy5cwHp7YtaoVRGZdLvoolWaLvvqd0iL+rkFgxw4gX3a7PzMGE8yT7vFCQ
	0ZQG4ZVGZ4MQ0IT97YShfvUft7KFBbMkKEqLsrT61PNKQghRzSSSOzv0MomsHS30t6d88aEhooQ
	1WMPERLutBU6IwlmzK+eccgMgmlo+K5iGtpwauzWVMBnU4WMylzZJjBeUa7jhIRCclbl/ffRx8C
	2gabnJ3sDxTpcGn99RHfGXS1IYK0/scg+LlOGvJNPFwrJ5HfVV+MWPsJEE2J1bzi0EOs=
X-Google-Smtp-Source: AGHT+IGUVJI2dlEtwHRWklbLnsmR4txxtIplCnP7D/soWMK88Xud1U4+gAr5CXe5ahL9vOPO9+mX6A==
X-Received: by 2002:a17:907:9405:b0:aca:a1cf:d5f8 with SMTP id a640c23a62f3a-ace71047e97mr181754066b.11.1745582037043;
        Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:44 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: qrb5165-rb5: Use q6asm defines for
 reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dcb998b8b05498d8f9a82ff9a984c1e237a61308..33ecbc81997c5ecb5606c7555adefd1a53634b80 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1008,21 +1008,21 @@ dai@20 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
 		direction = <Q6ASM_DAI_RX>;
 		is-compress-dai;
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 };
 

-- 
2.49.0



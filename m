Return-Path: <linux-arm-msm+bounces-20439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 600388CEF38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 16:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008421F21385
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 14:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4B447F6B;
	Sat, 25 May 2024 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSCkpUzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5883010E3;
	Sat, 25 May 2024 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716646142; cv=none; b=Io0W5rTS3mkCZbNRbnM+A3tnxRE+382YlAvSEYpviZpWz8rTGWxpp5Zgg4GXm5RKXHavZ7DRS5fNzZ1Az4lqypF/sJQPN0lKYDpLPR903S5Z6lTIcqPrzPfnyvQtqLHuZ4K3HGLPszVO5LKUoqYZH9WChnHaRHD5mDRlcIr6BsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716646142; c=relaxed/simple;
	bh=+elB30saaXlo6LsHhurtq8E/AFS/wrzcQAc+zBEqtno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=phd8JY+AgTdGX2S5DBzmnyBuDj3VEin7d1WuzSKWATFMD4yO5aopv6FqolJBIdCtTiYzgVJn59Pe9lZ9E/j6UeQoq5wGjWdelIc6P1GgmrBa3bRKLPiOyf0Fj5v1LZvemqCZ6KQsCoecmFDZnGpYicZ5JZPNaqX7p8k8r3zv8Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSCkpUzn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-351d309bbcfso2788531f8f.3;
        Sat, 25 May 2024 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716646140; x=1717250940; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pu7b7wAhdfWX/XytK4RwpPuw2a4lq91Ut54amI8h4S4=;
        b=iSCkpUznXntPpDZTJKyoArORBX8oXb97tl3H8qVwRet+PPhV85A8Oo7yFGBApbUHN/
         DiCMF75tgM3nTGNsfVPuG6lbGbN6okmr/YvnaKqH1yudO5cMjMt9y/YsirMmdAUW0CDQ
         CGlAtpjoXZCCOvqJ1qs4Fg6zfTb7nI3I5DklcdsBTXjqiqwJmwu0QFaSWQ7K+k/dGEra
         A5rOebOzqGWvQ4MkrSZdoWJJifbaFwPgnSUd6V6uQgjnsoQax6dnN08tgbGvSP19oXM9
         8U51HM/aCWXLTgZdcj2TUkP/1QQC12WXVU+yGykE1ZzeWL2P4hmXAmfFZUCePPgE+Bjf
         WO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716646140; x=1717250940;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu7b7wAhdfWX/XytK4RwpPuw2a4lq91Ut54amI8h4S4=;
        b=cUaDvb3qFNAzkqmdSFxi7WEowxecDidREQHLOXhZ4N17IdC2AwMpMh79JPzqUka0X8
         usdi+rBKcbpdZmpe+ZGFC+3LvnIEhwfXa1OYfCdFOUR68oF7fmwmAGZA2aaFLpoyZjNs
         KLQX7P+nAF078CmxlRh7xekSC7jcHWlvwqmaGmG/r+OThbTQBbsurQg9yBZZgmdlP4Xd
         HfOjRDktR1U1X6kN7eGuKyfrtVw7cajNck5UVLQ8Sa73xR16ueXFP2psnTC/Pi0LzoMh
         ih2aL1YCcm7TAwJnvTvl0uHl35HBBAx5tb/ZY43y9g6Kwn/IBTnLqMO80L+sP9/dz+1J
         mGyA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ltkfMdH7BBkq/Pv7u+RsNuIr6F/lfjnzdpxHmxgNljikm1lGC/tcd76gTiimjvcy5ybQ96IugbXHFXOz2mVMPVvzSTrccGgZOb7bSbmGr9yzG5yDnX9OuZQukeEcaJ0P43C47nQGDg==
X-Gm-Message-State: AOJu0YyEhkdwuwgOX9loA56Cbkk+kBzmq1pLHXGd4ryWU/kriUwdtnpp
	/MZsQCDsJ+bKkt1oqW88RL6i46XFCtuq+4b79TFKP+V33MORd0Jb3qEm9JAI
X-Google-Smtp-Source: AGHT+IEy8Onkk8CRzmuZl+QCmSI5WfRRlXWztENEBqoyhpwzMThXlg6wQHhjkmJQLPgJqXttOGkC6Q==
X-Received: by 2002:a05:6000:d88:b0:354:f34c:646f with SMTP id ffacd0b85a97d-3552fe020afmr3324836f8f.58.1716646139434;
        Sat, 25 May 2024 07:08:59 -0700 (PDT)
Received: from [192.168.1.90] (86FF59BD.unconfigured.pool.telekom.hu. [134.255.89.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08a8c9sm4087087f8f.40.2024.05.25.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 07:08:58 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sat, 25 May 2024 16:08:57 +0200
Subject: [PATCH] arm64: dts: qcom: msm8996: add reset for display subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPjwUWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNT3dyU4mLdotTi1BJdiyQL49TERCOTJItkJaCGgqLUtMwKsGHRsbW
 1AL/SmyZcAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

Add reset for display subsystem, make sure it gets
properly reset.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8d2cb6f41095..5348feac026e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -982,6 +982,8 @@ mdss: display-subsystem@900000 {
 				 <&mmcc MDSS_MDP_CLK>;
 			clock-names = "iface", "core";
 
+			resets = <&mmcc MDSS_BCR>;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-mdss-reset-8b83eaa24b8c

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>



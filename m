Return-Path: <linux-arm-msm+bounces-47154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07784A2C6AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 16:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09D1D188C402
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6D7238D5A;
	Fri,  7 Feb 2025 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INbPK3Uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E69238D58
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941494; cv=none; b=bd2mEhlZBauB5OMtQTFAs3v8xCtxZdlcZNnCCae1wiApnmbHm2C3OKEaYGcVcUCDSMOvYtjnd1IHmNXhI1TX51C7Gd2XT4lLITJ6TeGWplRc/KTfzoKYLQjpXwBdKiTlv+LaVXiWTiWMWPHDdNg4gVvp6M4B/LFs0LesIKibNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941494; c=relaxed/simple;
	bh=ySJ57oK9YumgrJ5dRy7ysZMOo4QrDcpqRpFc3at84vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoNDRskHYi9yjWuiFZKYdGg7Y3rRNgONvy/+5c+4wLxJ3x6EKI+ZgLDk9I8bk0ZOIcKW52bOi/pnDQYnd+BLHK13INVJcafn2XGaqU5jHXivIRBPwW5Z32U9tV1Ra089gwCh87BrYFd/ObPkt4kfXPLJVkbf+Ofg6TcS45UBD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INbPK3Uv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so27122f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738941489; x=1739546289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLOxmza0Xh37kooLPEsbeXAASrabtW2f4a8oMEz8hs0=;
        b=INbPK3UvWTL4BPlq5Rx6Lh6I9I7WsxhTSLbtGSqyz8eJl2FpiAvAa+lX6+CUMEUNC0
         7itiy966lRhUhNnZRNnE5KPp6mU4TfVGzlosMkPkLAspVELYVgnkznEaNP3Vg1gL4M3P
         coJUdqNXbqYRIYAGBjCrlnQKDGAPHe/QPdl+UTAHELKs0Sb9kPQYClc+qfQiOeaqWv2W
         ioJZtR+JhxhuSBK4T9LY9H7hSfb3aCggaZhoJWgADYpO6qsIn0mvJyQA1ITybQKrZZG0
         N3e+C+z7qIlNIOmwfIunHlXjuEUl1q7GZMefDYQPeiWtsUpg6HlJzXyjPm5laIOhA8ZX
         hlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941489; x=1739546289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLOxmza0Xh37kooLPEsbeXAASrabtW2f4a8oMEz8hs0=;
        b=dYjdpKYZr3s9AlJH7aDHj+JCUYmF4P+39Zvn9afoCyCWC823a9zkyYH2X2TMqWkYgo
         P8EW5qD9S6VPQ6H0BVlpgoTZZw4jDGFvbIbLQICb8jBFD1mF+pU8dfaP3yMVB+u6SHiO
         M75fGtntutmmddOCX8GX5eTbAs65HvyHQh35FntjRDtZgzzFORDrjPp4NaqatIBXZLN6
         GlR2kCltegPd3o2W2guDryrO6VOQz1hTJr0eSmJcXlf7bxfJ63T0fX1GrPDnDs4JgpkJ
         Ey9KBXGKAW1vy6jHHpKPi2sKVyH1DLB7qk2lvyKYWzJxjnnsbADVWnSVgfA8xtsN2CSY
         uRWw==
X-Forwarded-Encrypted: i=1; AJvYcCX6DyYqTASvmku2cpEtJIPbJMfnkbPR+kGw5nxcKWsUL5GvG70iUiwbzQPLwTbZMIGpCs60GAGga8DY/xVm@vger.kernel.org
X-Gm-Message-State: AOJu0YyouN0vC7kZ3sU8B79KEpyVOP3d7ILz6aIrVvYH0XV2QpHUVgEp
	vErjuniocZxnw50e3sQiuEvT/QBldUEwrX4OJ7UO3RbtULctytUtEkILsPJ4578=
X-Gm-Gg: ASbGnctVogu/pRObrRXfAzwxzlzjpoebw5lguzS7+/oaFGWHlc1n6q/xsIgfWmWlGFo
	ttSzLaPU8jaco0r15HbeMRRKfSDZCw1Mz8nefFdB86sc1llFxJxczapYXlQB1n6h+AbtFR6umI3
	y0LclMpvRa/+680fQBZ5gA/5gawX9qhKkrj3y7bRW04ZsBeJ/2EebrVa6/7DjBsnFfg3jqOvQun
	40++GRbyKOadBx5WQKshjG8oMBTf1k8hJ8jnJnhWO64kFRXjM+q2Ycb0H4x2Ph1ZuezlNgmEO3e
	doMHT8XaJMSrxt8zQk7DzNmbiTUS
X-Google-Smtp-Source: AGHT+IHxBbwMJB7wl6gARXNhgXpu1MMqOG+uVf9n1tUHvZWpaGxVfL2UNQ+pxRLlPoeJMqaUCrNgsA==
X-Received: by 2002:adf:e6cb:0:b0:385:f72a:a3b0 with SMTP id ffacd0b85a97d-38dc9357796mr1940658f8f.55.1738941489344;
        Fri, 07 Feb 2025 07:18:09 -0800 (PST)
Received: from toyger.powerhub ([2a0a:ef40:1d11:ab01:88:c96c:f11d:1729])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc4d00645sm3545350f8f.66.2025.02.07.07.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:18:08 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: "Dr. Git" <drgitx@gmail.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: use guard pages
Date: Fri,  7 Feb 2025 16:17:03 +0100
Message-ID: <20250207151706.45031-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. Git" <drgitx@gmail.com>

Rather than manually define the guard pages, use the
"qcom,use-guard-pages" property for rmtfs.

Signed-off-by: "Dr. Git" <drgitx@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi   | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 46e25c53829a..6a2acbec68ba 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -70,33 +70,21 @@ key-vol-up {
 		};
 	};
 
 	reserved-memory {
-		/*
-		 * The rmtfs_mem needs to be guarded due to "XPU limitations"
-		 * it is otherwise possible for an allocation adjacent to the
-		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
-		 */
-		rmtfs_lower_guard: rmtfs-lower-guard@f5b00000 {
-			no-map;
-			reg = <0 0xf5b00000 0 0x1000>;
-		};
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
 		 * but given the same address every time. Hard code it as this address is
 		 * where the modem firmware expects it to be.
 		 */
-		rmtfs_mem: rmtfs-mem@f5b01000 {
+		rmtfs_mem: rmtfs-mem@f5b00000 {
 			compatible = "qcom,rmtfs-mem";
-			reg = <0 0xf5b01000 0 0x200000>;
+			reg = <0 0xf5b00000 0 0x202000>;
 			no-map;
 
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
-		};
-		rmtfs_upper_guard: rmtfs-upper-guard@f5d01000 {
-			no-map;
-			reg = <0 0xf5d01000 0 0x1000>;
+			qcom,use-guard-pages;
 		};
 
 		/*
 		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
-- 
2.48.1



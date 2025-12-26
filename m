Return-Path: <linux-arm-msm+bounces-86625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F6CDE2F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 01:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECD093007C51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 00:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8D8155C82;
	Fri, 26 Dec 2025 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Al7vo+ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A914A60C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766709573; cv=none; b=FiPmP0a9XX1enAZc2jB3Zw9nTrsHbMUuOw/+diheB2x5w4TSLvXuBd/ps06GU3j6ea2qxjUpv3Mf2rYq7B+hvuyi+Ay+Y3f10kz+MJ4oJo4EKN3zwcka7NKmqDBIkA6H7idJf9b4g8vgovfC67+p8bABuSrzS7WihLv0i3pUhow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766709573; c=relaxed/simple;
	bh=rqFd2l1YfZw44O1FMXMHStYrnVjpIY13jAshnwo2sTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLqYI3q9A5pvlWRQQvYzcbuQyW0qgaEiTYM2vrR9m7VA/kaJpNeD6G1rZG56aNzqbuEHCBwEfaU+jVUP9v3r6ZY9mWYhhs/U49IZ6bHnvfsR32K9Ki0fokyHLx5ZjTBZAUYdvj4ncTvJ26YVeamuNNTplR83JZqNpKC14gCPDgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Al7vo+ms; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-380091744caso6831971fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 16:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766709570; x=1767314370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p19WqP+sSUrS54uc580t8JVdTnmts4rYJId0mLI6KdQ=;
        b=Al7vo+msAr08zsYetNJlPo9mim5oZRjGsJTUj337HL4hHW2kwY2jymBCkEVARpTZvF
         QcIePprTuh3e114i90TSmR0TXLbjUlhYZHTtFbJipV+y4zU2s3v8tN8YeUflcuaCKufO
         eia1mA+062h1naHvuK+Xe9XwDHI5s7kmc+Ve/DHVW+QcV0dy+l7wbTS0CmYBYm1qcH+k
         MuVR5FyUsaOl9FOjU5Ii1sobIea0ZNmfNOJgbyG8VaAiz8Wetyx2OEmsQb0tlFpkUrlV
         o4Mr7Iudm0QVHNzzVEzqGUHvJdQdmN8Jn/iAn9zCO71bXsolwjPyFNz72jaWldE50SmA
         uaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766709570; x=1767314370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p19WqP+sSUrS54uc580t8JVdTnmts4rYJId0mLI6KdQ=;
        b=M2Fl8rXrStaGzuNis//MkmNvrL/6gwisF6pStCSfvQtOYodIBB08U/iQFj5G29nwhv
         kVNOoirHSZxND+EKylfUluJACrZfNRx/718Hnxkud6+D+dEcoV1e/iEOnO7JnyQ4huDJ
         9Ne4lUsS6heQZxADBw1gJi2nBlNhI/9nHxw8lAEoh21Q5b6LOXqFoGM+ArGETgeXKKQo
         6rWivOC7SMMKyMeQX1UAwzWyZciHTiIPnU4RPrNJ2qsAIhYpPkr/yABsGAPF7HTiTv3w
         VVhJAyvFxaYT7sUdmv4Qc5KJZ4fsf2cOiPeoU/2bzfKkvjP8CUCUgP4qZuQD9ypm2P1D
         LlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzZHVNKMHQ7tOz0xfly+IBekzbTxV6jev41MlDp+lOh8USg/cfW5ZKh3QTE5R+haGEUPH5l+NFlXZ7QUS2@vger.kernel.org
X-Gm-Message-State: AOJu0YwEqBi5UbrLOAo12ojLN5WhXmbzkYRdmJIBeXtjPRcyVyD2jaf/
	2QUmBzKw0K4OfY78Z2GTGFh29xk4K54oFr4PXfWPvPb7QhljH0EvEqr8dzcjJaR/bhAvVmNpR2O
	MCtWRx6U=
X-Gm-Gg: AY/fxX5/m/ej6RU6J99V/gQY5IMfHFouYv11tRvQAqdI04wfWDLR+4yO3drNQF5VdHl
	/OvZ4H6JjFZ1wvTRG3rn5Gm2fwmHtLvT2A/4UyYSmHBeoC9D1MwYSBYIFQJb9CD+JqX+WIYUOkM
	8UFTh7ujhnAiD2wTKF4vzrWqH5qXoJjRqNlNOcuLIiW+BsnoCVcDcTF3wWthSEvCyvPyVRosVBj
	34Zi8+siLwD2r6u98S+cAqaZjrkmBEvidCmVFBvOHu/FvAWNrYaUAtsgLiJUdZ2CRd5OXZ5p2Dt
	HK29u6AdtvuaV9I3kN/cwiMLxTrcFJu9iWkv/vxutl3FWkGkdjGV1heBnRQUj4+alWsIch20orl
	WJLRJcovsgj41fRS+0EeMVmkdAqGY5evB4s2OpNZ0SnLxsOCL+YzepKk0bhwVPvYpIA93Ja3YBx
	nZvsz1z5HhLdhExPeShLTZtnXG+Y0bzgBUPAuyi89Lz3W0mZmOraJJ1w==
X-Google-Smtp-Source: AGHT+IEeJ4dBn/6zZZYsH+vBmg1tZ3L3GoSwiXL4UhkuARiWBKJlDKKWuHs7JA29i8nEZFcHN/u5qg==
X-Received: by 2002:a05:6512:3a84:b0:592:f383:3aad with SMTP id 2adb3069b0e04-59a17df4092mr4515379e87.8.1766709569795;
        Thu, 25 Dec 2025 16:39:29 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f477sm6201283e87.71.2025.12.25.16.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 16:39:28 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gustave Monce <gustave.monce@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
Date: Fri, 26 Dec 2025 02:39:23 +0200
Message-ID: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial change, Analog Devices vendor prefix is "adi", but there is
a valid "ad" vendor prefix of another company, this may explain why
the issue hasn't been discovered by the automatic tests.

A problem of not described compatible value is out of this change scope.

Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 4c983b10dd92..7ace3540ef0a 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -378,7 +378,7 @@ &blsp2_i2c1 {
 	status = "okay";
 
 	sideinteraction: touch@2c {
-		compatible = "ad,ad7147_captouch";
+		compatible = "adi,ad7147_captouch";
 		reg = <0x2c>;
 
 		pinctrl-names = "default", "sleep";
-- 
2.49.0



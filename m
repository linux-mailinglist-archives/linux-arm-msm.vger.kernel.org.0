Return-Path: <linux-arm-msm+bounces-70327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EDB3139F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81F9EBA02C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD482F39D7;
	Fri, 22 Aug 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="foxDDdEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B722F755
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855572; cv=none; b=GcHh7OYpqdokORBQNd4pc66qV9nmJUdEJ15pteU3az+nQddnfQg3zaZNB93egEb+8WEKA4rg2bOwvd5R9mkFem5HJON4UixsNn2GJlFygX6LDGTT82+TT2Jc4D7S9lGZ3UD09OP88US+9EsC6XJqXVJF7ECEVHdi4uSCU+yTRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855572; c=relaxed/simple;
	bh=33V6vO8dY2xO/0hImlUa4h4K6tSixB5izhQ3YWGUhF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HaktjPkoqgKNpfYythXRfkSW7LaF2UgFbhWyScamdC5eG/k4vqzezPVBR0/QwptDC8KWVp6leg11fGnc7e34LGvGIOd5KjnkU9BTUCs70HgrFiSmQ/JFNMWz6cNvNrwlCyMVmNrhPYgR9UgMchFMd6GiUC3zx6IZOaZfJluoV7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=foxDDdEE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so1124223f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855564; x=1756460364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FN3M1ELHzNZvl0HLZKgIMT8AvEW6zwa4QCuopr7VTZI=;
        b=foxDDdEEYRRT2jDrf7PAZ5+ed0ryMWWsmnLkKxIBJ4Vtklwp8ptjo1zquDrOv3zaGF
         7xy4HJPKcX5SVgSBgla6pzTpz2pKqIynufTRW4nPZDx//My3xl2ShEvBNNwQ4/sJHtaO
         FC2FBf1ZzM3R/PLN46UvJYP1Qu99tfLZbTyjGeYcEdLAfXeP5u0udtACDytReGxa9HBb
         /GaG0M/Ood2vYHzT1T8b44EoU+04rmLrZHatRm6rkqPZdNmWFiyUYRPpTheYBbutt96Y
         d/t4GkdnVgI0UplT9ezx63R4fnkuxdlEFCxIAaH56prZdzVmbVdPvfQ0v9igAto1Gt8Z
         O+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855564; x=1756460364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN3M1ELHzNZvl0HLZKgIMT8AvEW6zwa4QCuopr7VTZI=;
        b=T7FGSfNs/dM+7bK5uUYsi1pSAVjJbVHnx9jVcXe1HHGCRlTc1fw/LLsb5SLdg/SzqH
         eAeJz4bHD4fUzOhw7UGwBpkltquI7xv+j0cXXjtiif3IX7Y7Iqz0H6b/vn9S6QW8MEUc
         /NpPAHFQ0+o9YiTaQuT8vL9UXYrsXy8Z4heYrdReBwJuWxsWaO1uGPc1r+d4J/r9Xe3Z
         eouuIdl42WATrsJcXnsLKoV9+LjKidQynkD5sVNxjqqTdOIr6cBLtMgqDXHRlQdyqMG+
         vsXCi4eGSJwFIIuokGDkWOx3Ne4oAuHSpqgXLAajOQs+q1oD3ParKcJvhS3SierovsLu
         JKrw==
X-Gm-Message-State: AOJu0YzjsvNSceTr+uE/bHRUMfK/FzRaUGP5cJDqJCiJ0NzFWTE882OC
	DYObLt7cVgLsFHE7U04oxo9VN3xirhLX3STmqb7LStM29NM2hDqYe2X4O83r4PU8XpQ=
X-Gm-Gg: ASbGncuFWRxJKFlYAU8+UkHCHtzFhf3CzgZJE0yiry8WYgBCdTjCFUPzHdYJ35JFY9z
	B+1sJ9m3ARamec0GlDO9ToNcpO3Or7acQEX+0H5WCxafcY5Bc1U7vEf2JUiwjJgz65MmDsf6/Vp
	BpZn6caZtQuMm2YYyp50zZlF4DbDeHtX3oP4pZJRyVvDadnHsSLbq8RqSmQyVIXeqi8t36ijl45
	ZyuNC1PvBPKSea5NB7ojmWbvJkTEdJUj88sIAxqRRZ+nmXY62ME7kJ8LTIqbz62900e9FlxiHsU
	4nWRVpC+8Rn47N4jcYIxVIXUQuabiFQeDjfie1VH5TvKLC+sqyyBikSsxSINtu6hqXROkXCeEkO
	i6tEPsNoCTs4peZZOIdVkfgkZ0zUzjC0x7HY3O1KPLGQ=
X-Google-Smtp-Source: AGHT+IGJ68yT3uMWwjghe50nYfb6T/a/MnWwRI7s6dwWoQV0Xc0niE7+5hqohLZT08H6TqIsnjN1bQ==
X-Received: by 2002:a05:6000:1883:b0:3c0:4f30:acde with SMTP id ffacd0b85a97d-3c5dcff535cmr1600624f8f.55.1755855564318;
        Fri, 22 Aug 2025 02:39:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:16 +0200
Subject: [PATCH v2 04/16] arm64: dts: qcom: sm8550-hdk: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-4-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=734;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=33V6vO8dY2xO/0hImlUa4h4K6tSixB5izhQ3YWGUhF4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrDwRAUGJaa81iL/NB2pGU41mbKbaUmf8aCkXET
 3wFcyPqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6wwAKCRB33NvayMhJ0VigD/
 0SyMp9yz1Jm/Js73SUZISi20pNqIqKhOzCEhDnVqOtep8ags2Ph147Clksqv+0u/4Z1OEnQ5zchHvb
 Sm4WXLBfldwSZMP1h7Xz/PrNSCujobPBmj3YFojt+bw4bHlVJJVLBlOEzwwGUnYTeoHF17BRTYr5Km
 j/VbQCT7Jj0v5lOamNjQAhDfQb6V7s5tHvULcZRebbe9e6VUjO3WPJRHYaG2whn7MgnqccakvmUkTh
 AhBkpz21nW2podAgXZQZ2CJ3OeSGNGZybfCVV3JqfO4QZUu/KN1WhR4kbqzw4lFQVjQPf/7WUxW1og
 YZle8rduQmpKQkB7MaU/kt4fB87IEMVmHy56+hsCgqCf4xEvRel8Ikfpz8+EUOEjIBiNp+iZZ82Ldj
 IhntBIcYSFZ4diCda/2yr2JlSdQz6JhiEIKg4zf5HNBzLzJeQtXB+2le9BHkJL48C044zDL7vobZgO
 l5oqzUc7r18FDgIztyCX3WXVzSCr2SItCrdbtG2wb+R5iau15IQWY32WBXJg4VvpcoW23oA06w/f65
 8HVwnPeS2zQ2WZx7UsmWhqBQTygzteV3MUjswW5v0/p7/muq644RCt9yv3Vyjw/R+7l4c0KWpANp1r
 Az2Vq411naGJ7h/z8q1IV/vkqF0n/aUCyI4GMDaG5LbI3oaxbaOYYQESnBjQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 9dfb248f9ab52b354453cf42c09d93bbee99214f..6c2c9514a7396a8b75ebe24585b47571c74ff568 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,7 +1003,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {

-- 
2.34.1



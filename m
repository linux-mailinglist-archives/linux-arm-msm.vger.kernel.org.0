Return-Path: <linux-arm-msm+bounces-44638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A39A07BD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7C3A1674F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3585521D590;
	Thu,  9 Jan 2025 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N70x+o8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753FE249E5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436248; cv=none; b=kiFsv3SuowuzFWeZ2n6aBe+033L6DxeKR33yvPUaHBUolwC9ibll96+k4NYAP4g9LBlW09S5AYMXB2KZQEpQUvLAWcUr0lxspd0NVBGgRXrZx/G5b+wQ3tyfkjJK9UQHJPEWT50gJunjw2gtlJZE35Scqwd19zX9ocgLIbSGggM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436248; c=relaxed/simple;
	bh=rhTBVIa6Z2yjlqW0cljU/JWm9DLEsWHp+KGdZgAU/Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fd5EnX5eU7b4v9whzJrGu4ZXk2h8RGxEdh5Lbc9b0OoYaeEZOJ+R8XMWHpT/0xr0cS1lC2pAOyhFr4HCkO4a1yhxiQ2MNYzogIEEAAmhmij2ONO51eq8zX4yAwrHam9lQ2kgKCGxc81Slo7zXkZK1YD7snUt56whkMcuMS5KnmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N70x+o8V; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862f32a33eso490132f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 07:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736436244; x=1737041044; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwj8eZNz0nnqHr+tVnOwVmMBRwGwTKx/FOPQGDcqsfE=;
        b=N70x+o8VNml0W8jTy2hMUZGecJnFIAcH4qCba2ec0J/xrJYJWL99D06B7kL/Z3O/rX
         7lcwkneqddzn3jpZZqzXwWI2k+SZo6hDJ5GLiQsyFJlGWKECQgSe0WHeMgK+kGxtxWyC
         nuNlxGWTt7rCkoZGct0H6wMRBAis8gtg2OzAwXK5u5GAUEWBgqtyw4dJJGv9L7curiPU
         wmmTN1PVxMNj/0997MgkeL4UOKUGf0rmS0c9g76dzJQ+OiGUtc0p+75QHexSuTCSg3kD
         8WhCOG09fXkGwWxC08Fh0McTESzHVtnsA8EDTwP8KdpUvxEvPxV06v1VAF7Kjgb4rOHA
         PgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436244; x=1737041044;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jwj8eZNz0nnqHr+tVnOwVmMBRwGwTKx/FOPQGDcqsfE=;
        b=R/6YMOCg6NWc95g7114Gkf8n3CAi7i3JT4F3uiKFcs30WWUg+h3TMxYmafhAoSNpA4
         MBGCSbr1PM4QePiwxCQUzSIkftM0jPfVzqYYG7B5yjCavxK0QZJe+pORn5L5aG5imztT
         ruX6x2hZS965R6RwGvMyYVKwL0IRIEXzY8SByW/Y9qqsUK0NvtWIlyDsDYpa5uHwIB4H
         7G8bwxkK2mEwlkcWY+Y6k8oZ9cEb4Saow1V2ksFh0WcL5PxpQ8vDH+TZs2kFtZ803PB4
         YfNEBLujxuBD8Hh7yHve3mqHk+PuA09tlI4vQ13Di+XD7lkTfwgyWickJznH4kpzZhbd
         If+A==
X-Forwarded-Encrypted: i=1; AJvYcCU6ElGlmYRcQYLu0f+K6hG+pM2kcSpIQ9hHxphycl4h60Yxk1y7bl+CQLFkfBHGJmy6ewzifR1bKVcQAI8g@vger.kernel.org
X-Gm-Message-State: AOJu0YyT25Ak+X2p/pVxVsB5f50a/ws1sC/XVOKm3ZML5umFLn+ULI9n
	kgL9X92Dddd6/rL0CS/nVHr06sT4CVV5qlvO69t4gs1uFGbuEPQ2xuUteG2ykxk=
X-Gm-Gg: ASbGncsmhakXp+cUI0MElWOW9kWWbj27Lpeoq3BuqTa6Y90n1vMDRqv/gN1WBqzirRr
	1jiRUkIoWxBzleyIDBl1TNfZ5Oxwz+5JhD9in4x7M2SkWvLkRDRW/kpnGTzOg8xdjXFzlqFS6hd
	xEvRy9SyT12u6XW/9Q5gOXwBRUZ84cNtjItNmipyX/mBNovTUOHv70jNXz3/eV2RlPxxQ2QuZST
	Qkc9DoMxXpfGaJ2hjuk7T27XKLFCK5JvHzWuYSoIQwSAnXJZk5tGy9neayL9eFDIhFTGJbei10I
	7Q==
X-Google-Smtp-Source: AGHT+IF22QGsytI2xvU6xasu+HV1wb94nCQneYiwPiwPQBUnrywKcqu4STvjyA9YvI0m+23mdWankg==
X-Received: by 2002:a05:6000:1862:b0:38a:41a3:218 with SMTP id ffacd0b85a97d-38a8733899emr6430016f8f.36.1736436243868;
        Thu, 09 Jan 2025 07:24:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d154sm2160643f8f.10.2025.01.09.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:24:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Jan 2025 16:24:02 +0100
Subject: [PATCH] arm64: dts: qcom: add missing cache node for cpu1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-topic-sm8650-cpu1-missing-cache-v1-1-0e85148a48a8@linaro.org>
X-B4-Tracking: v=1; b=H4sIABHqf2cC/x3NQQqDMBBA0avIrB1ILAmJVyku4jjqLIwh05aCe
 PeGLt/m/wuUq7DC2F1Q+SMqZ26wfQe0p7wxytIMgxmcsSbi6yxCqEfwziCVt8VDVCVvSIl2xuC
 8n2NI8/qI0Cql8irf/+E53fcPGUHsTHEAAAA=
X-Change-ID: 20250109-topic-sm8650-cpu1-missing-cache-8566b98abf39
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rhTBVIa6Z2yjlqW0cljU/JWm9DLEsWHp+KGdZgAU/Iw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnf+oSrcPDIRK1hF1BUciaar+IosNZC0Lj1fnR+eEl
 3fPNmECJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3/qEgAKCRB33NvayMhJ0Tn8D/
 96ve/r9OqqEhVrRjeI88rIpbHU+cBANM+igyA0+9rlqOHWh7Bo9Mf+kTsZ3dQj0y84Xu4ov3yyJXK/
 xWwI9tUNzzw7r+p2MrixSWNf49lU9ncnWmlkZ/bKwrBsKCb3ClFF0P0K3GBI/rZqhKWFOOjtZPgTr9
 NrmvKiOiNjY+v22/YvFUXfIiuSoiDAnIZGZZcH/kzOZcqg9LZ3hchiBTy6Za9QQyZ3N37MInTtv2Q+
 9kudKzSXRkXiH8YkQOXMZwnpFSWkWlzIhdqgqezTTKuwjJ9PQusW931jB38ofvku3VmbzBq8O2iCv6
 yXJKpW1xwZFQ8p0bbDXSYYf2elMD9gNrSqAwPTx/gcE+p9QdTEj0Kay8udYJNzHkduqA6zq8+6xgCA
 KN3sYFj+iHoIQhUmJeGltY6yjurERhq3jBtEW0anikGDWLggUwkPkoC2FEuGMLHgQLukFrVDmucXm6
 wn3ZtbJ3YerWn9Vys4yzw+G0zhlqdczHMGfSZKv7ciRVpDiZyJN0gX28SiNTT8qps6UNwDLvTjFO4Y
 EU2y5jH7lXlrHgh/f+Yrvfq++rF+1/9LTa2mdukGE9pK0u4djhP97RV7CiHk5ldOFHVTrNMeAosU2e
 s46CdPt6ZPRK0i+urkDVF4nSqAgCK/ynax5rJ1lv9rD4Bd4OcIeUVxZUyyew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing l2-cache node for the cpu1

Fixes: 20eb2057b3e4 ("arm64: dts: qcom: sm8650: change labels to lower-case")
Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..832f3a2c400e8348847bc24b27397e2a0dc08db8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -119,6 +119,13 @@ cpu1: cpu@100 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			#cooling-cells = <2>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
 		};
 
 		cpu2: cpu@200 {

---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250109-topic-sm8650-cpu1-missing-cache-8566b98abf39

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



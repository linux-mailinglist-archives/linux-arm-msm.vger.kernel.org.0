Return-Path: <linux-arm-msm+bounces-86970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C820CE9B97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2051A30049E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83792036E9;
	Tue, 30 Dec 2025 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWh/0dH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731BE1CEAB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099776; cv=none; b=Ty4yZHTu5WQ5A2oep3jXUW8Ggbie/bTdfG6Lre63AZ1q4bM0afhxBzR6Tj+5GFppImC53Zq7LAJXE6KFjiLhB8DW2iAmrT38oMzxkFgAE3yur6cc43hmq3mB9ZN1oOHSWqOLiqfp0cPun/M2ENAQyaq4Y0VkbD7zJ6y3znOnTWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099776; c=relaxed/simple;
	bh=PxCQTf0sv7QzLd6DqOSDEvSRIeqRvmjXe6fJoD8/mIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J5YNnHDfNyzIiRgul1kUWwQBQJ+o3s2/MBqUhqZGBszfB+AEQaPjRbR6qtTpj2QOStjloCWD+dnlAgUUWWVzIVwfAWbjzYx0mt6XRSWjFnHaMedIR4wm5IDRH2uR9I0tfy1YRD48BID3plGxYyatuwpLiQZjwdWHPBnQ5n/uav8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWh/0dH+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29efd139227so131283415ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767099775; x=1767704575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkLGkdwc37J5zIcULYPexnsqFBQiNhqOB0YosqQKU/M=;
        b=eWh/0dH+LhMIiMkG4rqF9Ng4K4qVtj+lcw0oJ58y1ze8cpD1Kym5JhNIVeJajSW3PF
         CED+gQ+rr0EPCyrKXhoEm5NU1zgA23aGIAPBSf8bNNbJ2dYvjxMCEzegPdaHE/DgADb7
         VX4j4eUSoMvHm39PpKfMFLQzU+5W0jWS7Z5Yr+7ZYCuutn3uMfPWjMTkY6TX4q8wqCCm
         URgz8XYAtPRGuDcr90lsFCDjsFg8svMV6hZv5vsBS24BpFhlBhi5CtUERfKX2eE5JrCA
         q61LWENnT/RUBtxMtpCtz9blK0mMXPW9f24pr/13ju4ugjQDb9Z2WQ95dagYhFLKZFN0
         LtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767099775; x=1767704575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkLGkdwc37J5zIcULYPexnsqFBQiNhqOB0YosqQKU/M=;
        b=p8ea7MgDWWJC0ZxEl5Q2UaesA/WjAMT3/KKN8H1Gkb8Ks3W1izC+0gaHcLstlRsszY
         9PxrX4ZFbqPunTv4/MGRtEz/uZA5m6OB8J6qVVo37GG47Kk2YIOB7C4mWERslSL6VcnN
         trG2znKAziH+WcoOleaF2PnWt6FRm7ziQUlMToxkemcATOuHlWobQjjWYaNt/Rtb5+8T
         8KYMIYXzE4yHgifKbXNoRyr6lj5hpDOGVkIjNnsqPLgSKzX/Rsp7QPItCEo+DpiwO8VN
         ZmElaFxNdVvVP56ahvhVkEQFIt5P54n4U0qiry3hHDKEqhcnLF+1KXB8hf48/Ez8QkLg
         4vkw==
X-Forwarded-Encrypted: i=1; AJvYcCWb1bDo2loSra4is/frhqO/+Cs5bWRF13kt9YkFWa7vUfi4jf155r1V8G7e1pDeuqgO5S8dudSaPA+n4H+g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nDnu5oW2ihfglbrg8kMCZhF5E+rFTf40viGVCOxrFzrrtzUF
	+ipH7fCziBmgVZ93pWSK4KHVhmnJaIuqdlmbVyXHZ9DvF4qWUgatIVdP
X-Gm-Gg: AY/fxX48vgOjKhzXNWwt/kSxmf3scJZ6JI8ZUBg6YbQbi1hElQEPdLz7kbOLG3osU+H
	zTBCEfLNQYvg4O9K30SSKc/HCRSjEuMv7cSiFbajeAd8T+M2+zmt0GJseHbJMILq3epwTggK/bg
	z6VrCAUJeEhUPiFTMeR5D+uHS2/JniKg4DvDt1BDWEWsKJzmRK/WKAqP5BKpQLRvs4XeRwrUPzn
	vFp+Wlk+d09PcDpizUSFsO/V5kwIXw8hmKm9mSZ292enm5V9kj1D3XgsltTN7GKxtjDOGzIhFuC
	qntCbBHEgYUiFIzY88LNoiqlReSXETLfLX/xJPYprd4UdHXL8bHSuTPVTwzyEF5p4nzok9yo5K8
	tTJngnOdZBuAhQttGSt7gwM0Y0UpucIcoXusyAXadjXwsEbulWBJKIHqvHYSbh/UYsk+TzhcLMd
	x6fPHTNJB0xsEPf1H2U/4WdXCgqQ5BfmTUqSXI
X-Google-Smtp-Source: AGHT+IHeybGu7HHBFejCa/d5Z08toe9rqxykBzbONNCZ/YIld63ToENPUnsHhb3Km6GuQyRowwLAlQ==
X-Received: by 2002:a17:902:cecd:b0:2a0:8963:c147 with SMTP id d9443c01a7336-2a2f2830b8bmr312833105ad.45.1767099774656;
        Tue, 30 Dec 2025 05:02:54 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm296003075ad.87.2025.12.30.05.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:02:54 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v10 1/5] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Tue, 30 Dec 2025 18:32:23 +0530
Message-Id: <20251230130227.3503590-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230130227.3503590-1-tessolveupstream@gmail.com>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4eb0a7a9ee4a..c081746636d1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -876,6 +876,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-56378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25BAA6018
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 16:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947953A4C20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 14:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872C9202F8F;
	Thu,  1 May 2025 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wuJk7iO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21F0201033
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110021; cv=none; b=YyqZgD+KJsugf+OH6afULuDYdrXMTGYjtT3WOxujMf1bH5wDPvY3H4yZ00DPtNhP+TuMRWCAAMhH3TsPJSz0KgSyYBaC0XeSf3yZxgd+jq8c69qTsgDsCO2YOs3w1eeOQYAZQ1++eov4fRPzQmuIalC+M355wb6PgAY5Z9yCuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110021; c=relaxed/simple;
	bh=2aoVFkAjElaHENHtg8TjDWPYjXCiMNrGnaFnDbM6YaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sg29px5VnshT0SPAshvrC0hAKHEARIdtA2iOT5cc7jeEML0d6pvS14OY136vS24G59Lvgj9w/pPg7QL+B2IA13jdHHbhtheZc6dwyWu5InPSNXtKwPLIp9dIsSoJQAWXxU74ju/+9u0NUXHsAeaYIB1kNWjsQph9In7OgZrWzaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wuJk7iO0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43f106a3591so1316855e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746110018; x=1746714818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+H5gIa6d4pyLO8MdBlU6oFyFMziUKLEhRLhfdswqn4=;
        b=wuJk7iO09rELbz3quIVEMJeq3Qhaw2EJlviOetFTUAOJEIb9aeEB2l15m9Gs/f8MyJ
         Y6TSflkBHr6Yt39WwyrTxcWjRUl3cmDspOZI1V/HV61sSI0+KZd3Jyi5loW1k7KI86zr
         8UjO9hIJG27iCNI9j70hVeFySmYx4N6E2RNxVWa5vSuMBbjcHU+uxg+ck1abD2xf52t1
         VrCHmabXLbE6LS7NUqP1y5xnuTmu5GRKbyg+zw7yKSq0aqd7L+krjKoeoWqY7SDP3v4n
         gFvd6Vx+HCv0PEoaRM8PMKYQ+ukPK2QV1OZ3awDAfx4p+Q9DvWiLPYlscxD3ski65kA9
         zkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110018; x=1746714818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+H5gIa6d4pyLO8MdBlU6oFyFMziUKLEhRLhfdswqn4=;
        b=k8z3Asd/1Lj6cfsxmYzQsY+9m6IqiBvqZONtBpL9yPKMkKeKceinCsu4mGYfdXxxaI
         gGeJAim1NJd++mmqWjyJXN3fP1Fd8UUpmfMalUJ5oqcuYcxezPpFYM/JTHTsUct7eFap
         3d8A8lAPSZd4Ben9PDuEdxbUzIvWkVqw4MVclwhOlXZHuveC1vVawh5cIDQnD8PgnJ5d
         dXlMLARrQn3hiTUXuABpVhVGww8/ZOm1XuPMi2txZxHjuxllSARpEmqFT5HIXyxr+t5l
         R45OoK6hh9IyBtW9GgRtiNMbNonYuKuyfTbuoVOUOAMwbOgFCqLs1C/m3qZNO4aILpY7
         v1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfPPG6pwNeBN82VD+Hp/bYrqRHrqiJ0VxalNgy/K+c3upWVJYFK14twBmuqvcdlixp9GnJmbjh3KjVKHSX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+osgrO6yX18aN1rjWNFVv61qV73pA2Du2dKjNUx4CKdnvhxfP
	M0xibeCm7a5jfAONWuMCE2Cl78QBv2Tq6our7eUbJbngqqPVp/3aMJuPXSlslk8=
X-Gm-Gg: ASbGncurh1ZYT2KOr/ClxxBH1bmzyDaE0innmlSxirsH1xnZRwsqJXRgkX5aqU/SPqb
	mSDXUfI99q7Z2kEPhWyky4rPJtG9t/P++CwKc2/YXiQND7vx0Dc2znKRu4DoUeUnxssBOg2J1g0
	9LShG6bwj7mEWCb2Cbbvc7n7F/oqYT92StH3OE8SPIU4RkwKN0M+4tNpMN7dPk4JeLvoEttYfMB
	u9YbL3hcENSsZ6k2FYIiMp2BXX7UEjI/ElO63Q2ETgP2gkB2hNOooLKKJHRwfOonlA+V7gkZRvk
	oQDTERab0rEcj+mXsUvTypXLTWN80BBvWKayNbP5yB2vNUU3MJa3iEKpU5w=
X-Google-Smtp-Source: AGHT+IEZATzbg/rgmI6bhSczj0axA9hwqI+q39PcQPM8+MaFD8mRfMUqEaGtuwQ93o0OYfWDkXaF/Q==
X-Received: by 2002:a5d:6b0f:0:b0:3a0:9570:7233 with SMTP id ffacd0b85a97d-3a095707240mr350578f8f.11.1746110018004;
        Thu, 01 May 2025 07:33:38 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8ef66sm957636f8f.88.2025.05.01.07.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:33:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 16:33:24 +0200
Subject: [PATCH v2 4/4] extcon: qcom-spmi-misc: Fix wakeup source leaks on
 device unbind
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-device-wakeup-leak-extcon-v2-4-7af77802cbea@linaro.org>
References: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
In-Reply-To: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2aoVFkAjElaHENHtg8TjDWPYjXCiMNrGnaFnDbM6YaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4Y6EdqQvi7iSbCPndmZkC+pXDb36V2KHvHE+
 0sRg5QFcouJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOGOgAKCRDBN2bmhouD
 1yjAD/0XskD2vQXiEUBv5CQhPcKLav8KeOqqIn/LsWowRspN8Udl/FO1N5AtS632Irr4FM3A06N
 0HvKqEi8uZ46yvCmr3lny3gjfH3dmUN+TuLsZulBilCBI4lyX3KMzfrvVntKcdM+HJa/HCMJzhz
 NOGmtILGMD4yfnH+CgFXf4zN8d1de8GgP5+YRUKUBJrjx50J30JoBMad4nGZwGA/XHW9D3DLIth
 RgMPveHYoVRRa9smq7xPQC8DuHKqF2hR9TaKvXm7THj4C3NSZtHKUDhSmD6url2RE5Z5j0dS5cm
 l+Z3kJ6WixTkR0x4qUsa+BGeuPlTMOpTvOBWc7bGsFRTv9V1aXgCL7cHO2MKWBI+vyjCDB3lD0q
 p3hI1YQflx0ExfD+HDxq3eBC/6zB5hRTg6X7fHZCyPNkN6PbH/Ty1yFmzkSH1bsjq8qWmeaYttq
 L4KXcbaOBC5DdhsBovHRsrOLvQeXV8aUgJLvKn1VlLXjX5m+yiVN1XzXAUXgs1TMcCXkKddnKHe
 GMIWRmbkyM7l9kFgz3bCk+1EiUboAYqPkl2o1uQsVlRo0Kt901qUoFOmH6/ZJR5vIwxwotVHpYm
 MyIwXMwK8bgcSQp9umrZf73h2QYaubFTAbhfaqLYAF9Serlp4NRrAJNChtPDST6pHfQgj4uuoBE
 FLcoTRp8853hTHA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index 53de581a393a35bb48f637ea73e910b4c8340ace..afaba5685c3dcdbdc750c1835ec4c696bcc64fc4 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -155,7 +155,7 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, info);
-	device_init_wakeup(dev, 1);
+	devm_device_init_wakeup(dev);
 
 	/* Perform initial detection */
 	qcom_usb_extcon_detect_cable(&info->wq_detcable.work);

-- 
2.45.2



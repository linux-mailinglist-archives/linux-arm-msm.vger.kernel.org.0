Return-Path: <linux-arm-msm+bounces-16918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F189DC42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687ED1F25F99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3064E130E48;
	Tue,  9 Apr 2024 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cez3e15A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576481304BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672900; cv=none; b=ZbHvXtZbUjWX9eSM+3Lz6sB4jXOUMXCXnDzsFGjoy7UHhVBcuk+S0u/KobhHus0wuK855dgVv9Ii19zlS7GVjb1171clyJ3rv9yYchlc0Ig8e1+BoMOOpEiAZATur/tH6T3bFYQ3ZPjNyT35h61evYPMr8VMS3/cLmVBveilN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672900; c=relaxed/simple;
	bh=HK+pQGlyEMASzaLMUZhoZ4LQ1b2xuwD3oB+E8BsoQRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oO7eMEKUIJIBWqixvhee7O3MjzqOz2vr/LP1P4weApthNb0KqNES5EF6fdsYNKcWdDTp/6Ops8FRAzazMY544OKFZDQ6gtFXayMw1xDTV+KfKSlmKQ6EnM51XpnxbSI64lBqYV5MYx2MC+tP58i+URr1DwwNn6Iz4RZY5Wo6W4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cez3e15A; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d0c004b1so6588814e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712672896; x=1713277696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBs+x784L93t5mpvshVcosruv/wnrHW9FZoVJjVQz+U=;
        b=cez3e15AkbM/CFIFdfPeYanLGWnaqd7IIW2UiWxUSOA9tglPLfJLFc+yVFcO3x5fqm
         ZoXJBYx+B7n9qncAgTvkzHXaNttjeqHuSjDl6pRWIkBBgN5V9ar9+XrDYudYQynIMpBw
         SANNFGopA5Jvwn0eRY/HWd6cY8WATm5qvHDXn1f6xF55G6A+Nm8JvZYjQ0I6SiQ/lNpu
         1Sbg23maOUUtSBUEgusgcM229xdOSqI7LvoxXX6lSkB3MxbClQ3qagA7pqpI9iomyTwR
         Q8yJ7ogijS82S2OKJ5Axb09hINJB3/t7BcQpnJIA719HEP6ysZgRwL5mH2IN+/+qzbT+
         tXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672896; x=1713277696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBs+x784L93t5mpvshVcosruv/wnrHW9FZoVJjVQz+U=;
        b=Jd+6vKffyWlA3xqyRL0qvQyYX9/sEflZfCXLxm3MvJzXnUyptqlqXdWk86p0mpv7ck
         S1+1wfFwzHacFLJ/oYhJ8TXZRanxnMVvJ2zZ6ZT80H5AVSZhFEHDbLwsRyVSGUVbD2zJ
         gQ2y9kjPEK1kzhJ32v0vk5imyCvYVzQA2kQWDzMJBXQGOBVg506vMUCqfaoMJ/jvGSDT
         3qEzfGAuXPlNOuUHxsLrpbSsTGLeb3FfHJW4lqM6F+9X8z4qG3uMdeDRHRHNcb+RXAY6
         whhBhgUvRhLLIGgBtSt9UP4ma4F/0kDKXbVEdtuAunVH9tEm0RJrOhH7xvs+thDDRCyX
         pJzg==
X-Gm-Message-State: AOJu0Yxd96h/FCfpONAVzvj7Mqo2+mDkz5N0g1q9OkM2qJlNfyCmpDte
	JB0PYFdbUc38UV7h1soin9O2QInqluCtdRyVqlQD3ugaJJbo/HIiMJ7ndOIh0g0zJs5/Kqk7cKN
	A
X-Google-Smtp-Source: AGHT+IFETJVI+4Za9sj2AQkfZZ5Tz1V4SEbzbbLAh2eieIVo3gMOqRq7mT8raJ7iguGCQkjeQsoRIQ==
X-Received: by 2002:ac2:5462:0:b0:513:9e44:c68c with SMTP id e2-20020ac25462000000b005139e44c68cmr9047971lfn.6.1712672896402;
        Tue, 09 Apr 2024 07:28:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020ac25ec9000000b00515d2ee5b38sm1556445lfq.48.2024.04.09.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:28:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 17:28:14 +0300
Subject: [PATCH v2 4/5] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s:
 add USB-C orientation GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-hdk-orientation-gpios-v2-4-658efd993987@linaro.org>
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
In-Reply-To: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HK+pQGlyEMASzaLMUZhoZ4LQ1b2xuwD3oB+E8BsoQRA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFVB8QO0WAWUZDUwwUZuIWB6MAPFdadwwHaaED
 MbwSIe2ec6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVQfAAKCRCLPIo+Aiko
 1aL5B/903g9A6aL5RbR5dfzNmnegEq+FtH59N6WKPy6nxLFk1+Dtk4SEoBihxS4ZuKTkjFe43Nq
 IIyBYVw8tVRRoUi32GXgzSk0fn9ASSBK6CMH1GPfbwGD6JQ1//ffGzYd7Co4wstJGtfsv/FBRIH
 otLLu2ZdTiA2CcvTMqQPKf5MOBuCS7jgYFlTBIX9S5yesA8IRR+WPqpWl4Ocd8hBOB1l0qXSsrK
 LnzZzbqmBaaeVAU9VucZNJEbooZV7z3WcTdHQUietLBO5DZfiCYxPN9oXqI8JtB0PFm+meCjoCB
 XRPZ4CU4O3hlpkJLMJUvYjhM0vMYh6SfoeVEX9t+Ka71j3IY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define the USB-C orientation GPIOs so that the USB-C ports orientation
is known without having to resort to the altmode notifications.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 15ae94c1602d..2806aa8ec497 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -100,6 +100,8 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.39.2



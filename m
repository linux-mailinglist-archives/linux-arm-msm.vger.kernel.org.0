Return-Path: <linux-arm-msm+bounces-34093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3578A99A48A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC0B32853B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC6221A6F9;
	Fri, 11 Oct 2024 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QP26Lct/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78911219CB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652182; cv=none; b=iGVtMc9mH1OAOa9WqK77dkWVCq5VxgoQ+v+CzDveqaFWExF7thkyWAKc1p+nRYJwB3Q0If8RP0fTqD3VAEsbPLaDxZf/wOlNMh96WeSdGz7qmrO3zoO4TNqViTdUFuJLZHeQtKjT2FBlLKhmgMEeWRYQzZcat6xZDly4ztKrkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652182; c=relaxed/simple;
	bh=bvaks1hkBdB6mLkHtBE9WICW75Nlrwxy9QIEZHf5SV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUib0C6DendRPYbwRYa4N+YSdoRKIDYgqPQbE3bBE9yz10ypYOOTuEJntfiKQASAnKalJ8srB/bEX2/Sal/kOC6dWBAbquOT4ZjGbP4x5ANyKJkhA8o1zGqoRqqkRzzB1+SkUzTQord6WxNjYa2BOTvXi8o4kTImwurmrJ4XTwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QP26Lct/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43117fd9afeso3044445e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652179; x=1729256979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Olg8vobPLxKKVdM2AmGN1izI2HRaSwEbsq5chGiY2mE=;
        b=QP26Lct/78CVddHfVjdz55twkuFSGCOLGYJPOQj79HOkW4TIXTan3bejj014MFzKO9
         s/ub+4pAUzTBGqDK+kH4k4eZpgLGWr8FbC7At7N3Qa4DUwMvLDYQqc8prmYS182Bf+SC
         WOeV06sICe5rEAO9B1E4gOGcDeeuO5dyoWyjGndNyUEGEQJ9rbXtArbRBEZheVrO7IeI
         kNm0MQUj2EUoDGjFZOUFP0I+Vc+qKCIyqmVHI0FHiIOgDXqyHE9D/EoSC+26q9CAtU+T
         w0RRoZuk5rm6WcYPfa1ZkepoXfRE66nVjVQLhZ9CmavN3Z2KlV4t6gQ/cKWzS9ws56NC
         qlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652179; x=1729256979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Olg8vobPLxKKVdM2AmGN1izI2HRaSwEbsq5chGiY2mE=;
        b=jsPodUIeZl2E8G2HI2wIzuQqr5kLPIzeutwpDcTTEa7eNS/MS3XaJUt9Z0fJoyeDEW
         9iN1EeZzd3QmtoQJ8pCUjWrl6+a9J2TJuWridh1lVTg8ayultt37xllVzqXjFdRpisXw
         yEzsA9uyFNRpwJPfLQtXdRG9+pwHYPzNoNR2MuYnMexgYytp//rsTCXp9/dkGMrUUTJm
         RgJRR3nBIV9Xw9vsOB2Jx6sJnc8R0cK8HC+OkRiMEHTuE4gJPi9fViokW5HD7KsXTosd
         foA614JKJGE5jBXt1yr4zFyBGMgMsYPsGrmao8Xa/QzjChalrgasIa7zWsAEf1m8xgCH
         d6KA==
X-Forwarded-Encrypted: i=1; AJvYcCVu79yoGneoVBuFpuifN2yqZH7Es2HqNZIRjA7jalrCRxQssg7k8AixR3lnhyOLcOPhZVVSyHLLK6AXLrzz@vger.kernel.org
X-Gm-Message-State: AOJu0YyhAAmx0CYsuVRRSWoO5Hi7Iv+1lvucK8gd8Ra0EKAnKVBcCIoN
	Tvi07acfAOAvFLpUsCYe7BgLRjKq5ARw2MdbEUxm7YKmbjd2/WCcf3dAaPb4o6gL99rj+3X4KYx
	V
X-Google-Smtp-Source: AGHT+IFpNFWEOyFUWKDSkiNlm3PuRHh6l2nekkNPS86zLVNOkzKgF0XXWQYiHg7H/r+Qxem8WLu3kQ==
X-Received: by 2002:a05:600c:1c18:b0:42c:ba61:d20b with SMTP id 5b1f17b1804b1-4311ded5e0emr9831245e9.3.1728652178690;
        Fri, 11 Oct 2024 06:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:14 +0200
Subject: [PATCH 06/10] remoteproc: qcom_q6v5_mss: Simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-6-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bvaks1hkBdB6mLkHtBE9WICW75Nlrwxy9QIEZHf5SV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSODbabTLS0pgHoToJ7VcKLDStZd9nrPVUHY0
 riYkvXG1AGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjgwAKCRDBN2bmhouD
 13b3D/9DytQwg/ro7GHg8SA//whmufixWNVrMMzZ5TDG8MQbnVYgfVahpwYfOm2aZB003Kxg7jw
 lQ1qU3jncUebqCAVSwgdyarXu60+mvJMPfKSTEuPYKtFdDPiZGkCH2ORCAsrumq9B/Knybf4a4l
 x6d1C7l/Zy6c4q3t3WY/RgEhgKNaVGoUi0WAWdxDe3hSGEvwDOL9dzC04ohPxq4ftd6hl3wWphy
 vL1I8OagpVsQQLe0af18gN9rKEeMQgeFdlHGTLSR/utNw8Iz256u6LrVPRqL/NpLJZOx/D9yyo/
 IEcvLvmIsLXsdxjZZtNscc/4JE0vBdEXbkkSDR2GKkx4+4OCYud5oOxyMhdWe/moo2HohhSePSK
 srcgoEmoOuzT2Fvl5FxQLXGNXCDitLy9qghJVeK/ONv9IFCFJJU2KC9374TPi+srKsQIwRi3lqN
 6JjGR00TdhfumQ7Kb6GF9o7EQ1qgb76vV+DCYdRr8QivQxm4g4ePzCp5AR48yZxJcotPqXP5+Kx
 l2xZJa+ur5gb7XYstfUMyMe5mp2B2khe4EbRYaM0q+Ns7NZiSfngSyiXZa5nvb0qRJi8ENDymss
 bsQIK2+dSNu9LsYbtLeq3RWYN/JVsODNNmhdfCq4qxEyJ5Cmb4ZVQfFzn7tIUihJ0Em8HqqrBFz
 o/gWveKt1t+v7IA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2a42215ce8e07b25cb45e708aa62f9ebe83bb88c..92212892a53ea4843da62642c39413c33b4c962a 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -261,7 +261,6 @@ enum {
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
 			       const struct qcom_mss_reg_res *reg_res)
 {
-	int rc;
 	int i;
 
 	if (!reg_res)
@@ -269,13 +268,10 @@ static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
 
 	for (i = 0; reg_res[i].supply; i++) {
 		regs[i].reg = devm_regulator_get(dev, reg_res[i].supply);
-		if (IS_ERR(regs[i].reg)) {
-			rc = PTR_ERR(regs[i].reg);
-			if (rc != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get %s\n regulator",
-					reg_res[i].supply);
-			return rc;
-		}
+		if (IS_ERR(regs[i].reg))
+			return dev_err_probe(dev, PTR_ERR(regs[i].reg),
+					     "Failed to get %s\n regulator",
+					     reg_res[i].supply);
 
 		regs[i].uV = reg_res[i].uV;
 		regs[i].uA = reg_res[i].uA;
@@ -1813,14 +1809,10 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
 
 	for (i = 0; clk_names[i]; i++) {
 		clks[i] = devm_clk_get(dev, clk_names[i]);
-		if (IS_ERR(clks[i])) {
-			int rc = PTR_ERR(clks[i]);
-
-			if (rc != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get %s clock\n",
-					clk_names[i]);
-			return rc;
-		}
+		if (IS_ERR(clks[i]))
+			return dev_err_probe(dev, PTR_ERR(clks[i]),
+					     "Failed to get %s clock\n",
+					     clk_names[i]);
 	}
 
 	return i;

-- 
2.43.0



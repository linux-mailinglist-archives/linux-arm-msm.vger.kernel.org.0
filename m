Return-Path: <linux-arm-msm+bounces-34096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2799A492
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3892857A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1173021B441;
	Fri, 11 Oct 2024 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnOj0+nt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC4C218D70
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652188; cv=none; b=nWE12YbzCrxPj99z20xpTEcVByaaT7uPAaSI/RVrmgPC/yf5g5mO+xQ4fRvAGWAer3fNZKaGxphlEvp0Yzix66quETjocC9HKYRVDH4pulj/9Kc7jBihn1AqP/byBtg1HX39BgwZDGIelUt8y09ttKZJient1F30u5rEnrJgWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652188; c=relaxed/simple;
	bh=J4xZfv0aBPmZUKd/vkSpTrvNwZXicEmiz2DyP7s4fn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAbqDIl1THzbJyDgS6ZEVoLg2IN6IYj00i8OAnhbJP0//kYH6dU566fU9cP+gpnVTQsxVip5uDfihUZN+JXDsodqDTKkaHvwvh70X/XcKdMDcBpeOwo0+IIBHlX4IOWKTMSPK9QCDoQxXkZNNVGIRv4Rlpv5APzEe/YJCt56vu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnOj0+nt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43115367693so2805775e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652185; x=1729256985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqrKaOgTrk5zGkRdbTZV4VPhrGZkf7sOsanYq3cQGaU=;
        b=ZnOj0+ntUeDseJZesdhG5Szng8VLWmO4RB0GRubG4FTFJkBGHUo3e45ZZmXvphewGD
         /hLqnsXA2C64pcLf5XxolQUVJ6gYmOApKf0kU++WusyXcMph+FC27uu42fVMSHl6G1nU
         P961uKP9ePlLeyntm43kjjqFWn7K03oq+Db+5Agc1EYERjMiM36iJWAWfv5X9aDdCz6k
         0P9Ypukt/0aEQTiQ1u5jbRii113ZlZC35ImTRqJt0uuf61I95LYLfqmuKM0qsPj4YUII
         HTP4P7IKNR3vqFF0VoirmJ4jg8bPTlU8kq0OhtlGLDWdiHhFl+IPGdqi5O2GwlNoq2d0
         Aufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652185; x=1729256985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqrKaOgTrk5zGkRdbTZV4VPhrGZkf7sOsanYq3cQGaU=;
        b=NOJw4LfmF2UOnghkwN3bOFcLjZYQmPMWjquXOVo3nYNxbKSkdp32VPuvW1bJSUx5Ti
         QXoTbn3NferB7RQNI2SSp5r+ys0q1f/k9pUcsg/IXQkWsya8owDnDVlQHsy5tBpp0udO
         hbdhh1GZjP0JJYjYGZLm0gG+9VOeghm9AOj9XPDAUfKOdis1PBWo9W98y//GM2SyRswQ
         seXDWh+6TEN1LfzdbU9JauqSmCjXucvQz3jw6fU2YuZTRnJX5TqhY4q8z9ZUdpDMh9vL
         YyQXnd0ykhNGk2SjPiZv8BJooFV+pN8Mze1bskHDrTO/qgKu4vja2IezbFHl1uQQoyTM
         9VUg==
X-Forwarded-Encrypted: i=1; AJvYcCUQD2ofYBCWA46BsbLgvtWgcX2f6HRt3ffQLcbJzc9h4DwjBZuxqcmP3tzn/qi44caDSXSpSBLCQQsUqfA2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYLyLUB3TjIje+sIStk/u2UddbjWbM9A2lcZHGXcJZT+EdbnU
	u3W7juqBFn5g50SdsK0MJyUpmXYYTk1/MJ2HZm/AhtS0rnKPBpY0vfpmLJ/dcWE=
X-Google-Smtp-Source: AGHT+IF3kesAXyhMwmNSL4o1EgSlt461F7qCTFbPjzkwgRZmy+poFqq9hqnI7K0qPneA/ge4SdrcfQ==
X-Received: by 2002:a05:600c:5122:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-4311ddff73dmr10861545e9.0.1728652183050;
        Fri, 11 Oct 2024 06:09:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:16 +0200
Subject: [PATCH 08/10] remoteproc: qcom_q6v5_pas: Simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-8-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=J4xZfv0aBPmZUKd/vkSpTrvNwZXicEmiz2DyP7s4fn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSOF8kFMiQpFUeuGBhxFHjTWsv5edpTYSPeAT
 Jb/y/ueQH2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjhQAKCRDBN2bmhouD
 15OSD/4m4QvmU19MrdHhDDZUabGwCw76kND3nw6IgY+o+BDPxNPHPtRXSlT7ttqiBbG1qnIHz0X
 QkzTH9R05BIdwteqKJ25YsVy7xpDSyLFdcFTAQ+zwLjD/eamsazhAnhtVHIZRNU61jJFuC9iaUj
 z9B1j9QMtn+xlzeGmE5lRIosQ3uJNw5B2uTq+c1SX8Va6YvyU2W0Xy94zUJzR74iraDzD8GxLvD
 td5u+9TBnov4zOeaqG9eb1A7ijiw2p3Z0WMdWBEnlbga6MfB+uqLlSLu6I4lq3YESAcSIrfDny6
 sNVS4pAOZ39ozMZtIULoDcT/7oXHlON/dVFrkQgyPnee5w+K7L/tsBG9mi00YVqjrpcUzdqTMI8
 aCDKtJUPJzSvAgzNJr9UoAk4iC5fw8D4fpDEKKU3/1hNqYsDWaqrl8O1tX/4kfFNK81IRp/6nav
 QIqQOhriIPbdy+KpO6ybA4L16WYyCVrs6Ixl1AXL1+HycPDn/nueW+qFz2UJ57g7zFmBcEfbZ1e
 DvWd92+FvvmEJIzI57FGwbOFqdlZ/RTCszUCUC+CCfxxuVSvjrLYC6wMzmDly1U1mRtsbYH/5qS
 7b5CCT6jw3Sd52F2JYSOgcw4cNipm8REUbezWrLf92ngSfCOp6Kfms9R/o1cb6loPG6SLP2eg94
 K6NTgztZXRuGmKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4efd4bc603cff604d531a51fe9f9c..806b3baa297ea1053dde3343fd86cffbc05b8461 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -453,24 +453,16 @@ static const struct rproc_ops adsp_minidump_ops = {
 
 static int adsp_init_clock(struct qcom_adsp *adsp)
 {
-	int ret;
-
 	adsp->xo = devm_clk_get(adsp->dev, "xo");
-	if (IS_ERR(adsp->xo)) {
-		ret = PTR_ERR(adsp->xo);
-		if (ret != -EPROBE_DEFER)
-			dev_err(adsp->dev, "failed to get xo clock");
-		return ret;
-	}
+	if (IS_ERR(adsp->xo))
+		return dev_err_probe(adsp->dev, PTR_ERR(adsp->xo),
+				     "failed to get xo clock");
+
 
 	adsp->aggre2_clk = devm_clk_get_optional(adsp->dev, "aggre2");
-	if (IS_ERR(adsp->aggre2_clk)) {
-		ret = PTR_ERR(adsp->aggre2_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(adsp->dev,
-				"failed to get aggre2 clock");
-		return ret;
-	}
+	if (IS_ERR(adsp->aggre2_clk))
+		return dev_err_probe(adsp->dev, PTR_ERR(adsp->aggre2_clk),
+				     "failed to get aggre2 clock");
 
 	return 0;
 }

-- 
2.43.0



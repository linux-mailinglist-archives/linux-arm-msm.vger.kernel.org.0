Return-Path: <linux-arm-msm+bounces-73033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A61B52594
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A9C1C26DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE82212FB9;
	Thu, 11 Sep 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INvzT7TR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA4A1F4CBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553148; cv=none; b=ttpMkANq10bQhvhEx1Ix7DiPAaUmV1HrEopvRFWoXH/GwWv1B+5PwbLNT0iVK3xAe08AK4GIBeyCVIymGu3PgKdkeSPSjGC7KJWjkzguaRit5LUhSXhjm6YE5Z2lamV1jaUue7MwVqF+ZowYJnGDWda4QgmXPkqcFI8WWC6XLoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553148; c=relaxed/simple;
	bh=cyqsY+2iBPm0Fr2O/qXayL/1CH7MKN4erIyrBOIDDU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJ2RojesTjEdjckdo8vHbdOMK6ZcEnmqHL++WJi7MO2+2sRKTAdCoqisuz5/yNnhCPkdVfG5wqxsW1d5QdjRnFlvbKy1svH5bUJTV65nzmbrwdIlr4qtseJ60XOv0ntpPsci37K2K6WHUXSHAtLslTXG5SSHgKhoBuaPHpX2Pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INvzT7TR; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3381af2736dso399661fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553145; x=1758157945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGYOgwO4nhCryouhrLQk1idBdFzw9ZworlUETk2rTwI=;
        b=INvzT7TROXd6oju1Le4cDOGG3ksLjjG4h5JZ2vDZHffGoMuKd+buNXR5QCx4nFpblV
         BQ9SR6aZMLv12GiWdlJMQo8yT02KFMFhgGsX8KAD4Ax3D6kah8SsBjz+ARaVW76nhIav
         aBSyptq+mwXYOqtzr1CjNMWiK+oBPXt133PpRbdF6zqXXOkMX2f8wOJl0gmzrNlwmAl9
         ju4ssGt6sI4LoJO8nIHCtjSNdZyxkWLVFmYBF4ev4YcTTYGt1rZS1y8sQlKMzMvj2KuL
         RTq8W15gps4JUgcGls6SNOfCH7IkZonD5B5Ci+QJh75RmXnQL6Fp/rzajrP9yOCgWCda
         IjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553145; x=1758157945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGYOgwO4nhCryouhrLQk1idBdFzw9ZworlUETk2rTwI=;
        b=YgN0ZB726r0QEARF3OZkrXo9AafkguAEVef04grcnr562PE9HloLTeGVmzrpqjlF3C
         5I5Ep489uTzqkb3rv7lwah0yetp1IOHE0ej4jWpbw65VpnQPtb8ilmvsnFCtkrlLcL2i
         z7Nff7lWFksydsdX68MQQLmGiC6S4edETiw1B/6DUOCtcyRWEuNIFMxhSxo+ax9Vuw63
         jWqUovMDv/eDZYmEdPf7z8LMX7pDNc5pzCh8KtE0MLjQkly7642k6ph2wbgYcizhVODE
         PfTQhWKG7LABJ8OkY3K/G7kzg0WeuF6OKkON8MBl7zNaZtcCzEzYUTIB5KqzfmmQA5tM
         1+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1bcqpocUJSe+2xzJ9UUY0Hb+tzaVl8KReg9LFytQ3ELQrxn2OZ4cDv4M60tybgGGeYU6yP+7zPzb95V+U@vger.kernel.org
X-Gm-Message-State: AOJu0YyxJhzuLvrNxt4aEZXoApIvz2ORuL2iJoBDIpqrfJxMAM3v96g8
	dA75CFIHvEjX19fXIBwWZ+ZJH8YudHKQ4STRETdBTPUNNmANbNUGTXa/To9YY4O6jLg=
X-Gm-Gg: ASbGncuYWpNtNd6Tv7jw2JcsvVcrn+u7P0G0cwVtym2xN1d6MNpdk2lSoWCqW4WmwsV
	ISu5tkPf2QqKo95u3uN3NsxTAdaEOLUSQFA10xrBrkKqMWdkxQAmWdzWB5EcpWKcgaVFPs/GnFV
	SIOD3q0tWisFrJenSzDKhZ1XLFWF8J7ScCfjfFa6Z4kdW34+2qTZEeWzkH95b+jFUALZzKJo3Jo
	YdK3C0D4anMuNMa6O8Q+fnaMw7NBUNJpz9Lb93pEseX2eNmGVvc2SQP33HiMSamcOdvh1rtUNbJ
	yz5f5Kbaiu+iLwjjZ3JPmCL0iiC/ypoEyPb3YKUkJRISJ4g+lGmmi6eCMzQBQkVhPkX5XQcJdXd
	HxpKKhUkSQJMNMxHtI8PmAc1Amtrb3GAunJWB4FUex4Fy2iProC1N18oFYerVpGVqhQqj+Dw40G
	VfAImgKg==
X-Google-Smtp-Source: AGHT+IG9b66M0O/XbAvWJOlbcI1Gv1Aqc3qD4A/jWD08WCUA86lnswuNJ6w9zUDcQRoHVhLSmPBvrg==
X-Received: by 2002:a05:6512:6185:b0:553:252f:adf4 with SMTP id 2adb3069b0e04-56263e840e5mr3094976e87.10.1757553144970;
        Wed, 10 Sep 2025 18:12:24 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:14 +0300
Message-ID: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SM6350 camera clock controller to enforce a correct
sequence of enabling and disabling power domains by the consumers.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 8aac97d29ce3..6c272f7b0721 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
 	.en_rest_wait_val = 0x2,
@@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_1_gdsc = {
@@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_2_gdsc = {
@@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc = {
 		.name = "ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc titan_top_gdsc = {
-- 
2.49.0



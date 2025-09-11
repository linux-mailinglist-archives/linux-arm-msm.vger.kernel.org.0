Return-Path: <linux-arm-msm+bounces-73036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA6B52599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1CBF1C26BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82F4205ABA;
	Thu, 11 Sep 2025 01:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFIup1l+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9609203706
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553151; cv=none; b=OzJUP6R7U/wab1cy/IqkRhOLQtUK8+IgqkYyr642kS8dcQFulgtmwA4R5/7SkERtL13PRw3yxwAr9a+8RwmlFLsRNdpG+hzAKBNq1/AVImZkD5x19U6tCUyya2hTwlSvpdHeyJZ0ZbAk4BbV1Gfa8v4D7HSN0E07bDCPVcPf8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553151; c=relaxed/simple;
	bh=yikHLuTBZHzsxxFD44vU9yXO9sACUCrGHYpafZk7q7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UsIbiWvuOD6ici9dJTlBlhRkpPr3S07VHLbI0jXwi/PDyR/VGbcwyMGAnbt8pONM6W3dddp8FrZR+V0O3jPu1lxFotj1pgs/GVd2GqdU0YXt0BzoWaLTo2ALqpLALVBzREQPitk7sE5Wa1yGVkpWPRrfYYSN08aX93UGUOEzvSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFIup1l+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-56bde9c6543so20562e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553148; x=1758157948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkXb22++snaLsScjs5VjWE6H6Xz+K03us3zm7SPxwLs=;
        b=LFIup1l+iVIP5MU42WGT24zqX59N2M1V/7J2wDFlKGVtI1KnvZOaUxswMwLWNK1Cd9
         YUxoBrZiGQd/+0HSZr9m2b3FNlrHgErUjl29vBee825JJEKPblPVwBuOCoIthPK3iGTi
         B1J4P0H0j0lwpDbarNSjHF5Pb61earACVESmPj2Uf5lhyuUlLlz9yKB5B5EV72+bMrYm
         wQRx0hRZSJ1jMbKoaINykk6vcFy2UzAOPHqc/68PsFFk2W3rEm10/nzZpx+sFJWFClEE
         DBg2dvE95tXHvYG3h2UzBXwSAkTLjcowhuUChXtYhU65PoB8qjn5y5vADx2Z9QivOSzB
         O9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553148; x=1758157948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkXb22++snaLsScjs5VjWE6H6Xz+K03us3zm7SPxwLs=;
        b=Lt06gERduZMF/BnzA4XyE2wF3y/T104wbVigMfsjscdIxAymfxbMx3MFDUlyKaB118
         JyhW++K3Co6u6FM4E862hWJxmkk+tCw5Vsbj8IEJ3LKKG9qe6aIc+9UDzCMHu+mZnP15
         3w1kvUsp5Eqsd7+tbgg2/A7lklihMn7upyHVOXYhIw3xFB9SKPGW+jie63O6uH9SCMvw
         FbZaPBrnn/RYEcjpTDlY+/OHU/5WiU+67Po63Jyh3No4bM1Azl7KkWcDsYW+BX/KfCcV
         o35UsB6SSZU3YATL2nBLZsLGei4x6xZ4o2mtMijfIajJeOqokNzWPv5bDpuXmEYcGiMv
         glZw==
X-Forwarded-Encrypted: i=1; AJvYcCVGFrprTHDLwcov94GDrnm/b7lFlFUx/7uPuDGbdz8uwlkzch4a90Cj5JSBeRXLib074nSZDf0S1cdYLeZi@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnaDOpzaIQ1FT+s4gNqwD3Ak5JyFliIxnqkaXBpYAnH2imQ28
	yF3SPKPfmijggqSj67GiVmtneUen92QkZ8uTbzLH0WHs/NeDc1hVVLjVgfY8KNi758HZnsX9U5A
	AHPma
X-Gm-Gg: ASbGncs5UKmS9V2dI9fYdtYU8/MR8cNQ5kC6+GlezavODFBe2esjHoN1qf0KtqIqtmA
	ujavdqvTHz6UwxKNzzDzlIEP1lj8rlIsiyCBivuAa3y/KNdWTru9mEJ/z1bA3cXKZyFEgXy6pkX
	ktb44Yhk/DSGgBIM4MeNgV74u5VqY68+5NFOm7c9YI2+mE0F8e6j2Bkgm+xi4qvWbklV2rjL4/d
	mTChE/Jv2b8qwYSqa//oZaFFk7f4TlaFD0UgPKhgnFDPX3bh79eWhGjg/BxnQ6xTpUJ+cnLQLUr
	tSc/7VcFhcImWU2OlwJWx+Gqt0AfUCfP5t9LiVwYo/imNazi0NjyGU3dpVZxChKPuc/C+UwSWVJ
	Xq6bmqTWCnREpdW1gMGy0cvj/8qCpeNaQO38AykDyB3Qy5ttcqoFu/7X5CQj95C03w5qaXd0=
X-Google-Smtp-Source: AGHT+IFD2S7dwFeq/Dqvy0o91A34wdRf1wybrUzhLKVCjtQaIJs7Lw9qhiHJ6HAHPOntjoMO4xKKmA==
X-Received: by 2002:a05:6512:3a86:b0:55f:6a5e:3699 with SMTP id 2adb3069b0e04-56260d4669amr2935780e87.3.1757553148111;
        Wed, 10 Sep 2025 18:12:28 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:27 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
Date: Thu, 11 Sep 2025 04:12:17 +0300
Message-ID: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
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
provided by the SM8250 camera clock controller, and it should include
IPE, BPS and SBI ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 6da89c49ba3d..c95a00628630 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2213,6 +2213,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2222,6 +2223,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2231,6 +2233,7 @@ static struct gdsc sbi_gdsc = {
 		.name = "sbi_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0



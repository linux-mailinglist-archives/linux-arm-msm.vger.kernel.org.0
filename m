Return-Path: <linux-arm-msm+bounces-78236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B75BF9470
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 713C43AED87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621A6C2FB;
	Tue, 21 Oct 2025 23:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuHXN2MH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8AD515
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090329; cv=none; b=ceGT5P11IsWeaFAY6iaLunojgSAfbz8ppUf+MDSa1pviP9gruIOWOOpkQH9DfHs0K0Txor2nppnCwQGLP7FRomrlBmucxcVBu5s6r8/92u0vOGajFtvyOgbMEyH/YXzEYk1k4gE5nTaejfYRchzLTIOU9VDAUxt1gEBH/33W1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090329; c=relaxed/simple;
	bh=/bIMNZB8cYnkCwa0a6Q7efTtWvhnK1S4hUxycemXvp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNNOmZiyYDypNIADCs+W+REZV5YfU4BlDFqWUb2W746qVdj4FM2xZ5R7vHF8nLYbg11dl/nT6tUuEqNlu89KJnnSpNWhwm7FMaucgPV+FkQQE1etkvyH0PkUyEq/BenOEvijoYXD3JqB5Y7xk7JK6um0AzgVtGVwXAL3pbgesM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuHXN2MH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58b037243d5so1136881e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090325; x=1761695125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmySGO+B/MmieRszAxDcHcpwhvqMsE0PTZQEjVQVLrQ=;
        b=HuHXN2MHvY+7cypbe7YuSCc8BYHn9vOCyWQXO2shIlsFD/td5wVfNrLPsiiyslxpqX
         UR4OwkcMHciszTZoZjWzuPGdvrTZrQWtbtcDFGM4T5qAC6mAIAz60ean0OkoaUww9V4i
         i2qjfCfOUIwqkw4zIQjQIJ46JhlOZL7KKCYGCEB14m4kzbfnkugJw9UfzkrATUi3feBK
         a7/ojj9fQcV5IAExcGq1TKAG4SAePLk7LPbP22FB0Mj99uJ8+JMXeM36aWoEtUE6g+ps
         LDqK+X/jkYfz0J68vc3+h5cLnDoSJcqyJ5/2L9/PN/LuFDfWpVmNXKTph+zf+74lSKO/
         H6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090325; x=1761695125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmySGO+B/MmieRszAxDcHcpwhvqMsE0PTZQEjVQVLrQ=;
        b=Vk/FbeLx3lIEluLTNJhYDzoGHjTkeDv55B0ZLgbkG5tdGgfdj/NeBSpMhRsM8ToGLs
         sWrq9MCc8TnUqhzOCySXQGjXYg4ZFJoYuG+gL7VypB2t3uAftNI3TIt889X4oDFs/jqg
         BtGHg1espGy2wRXzOodyYcqjA5LpPWPxt50m5P+lc1vNO7w6xqGJOp3qUJteeFPeGbM2
         Ru+MyMS8NLlpRilTEvvzAK5FUOVlhshBKTRb6Zm2l0b9SyY2MW8ktSQwd2qWZeNAwoz7
         S42kVRc+Ss5PxuX8kzTnAARlgBGusooz1xvhK5/9QX4/o2eVaoI+p5rCuWLQUoqr7Ho9
         7ODw==
X-Forwarded-Encrypted: i=1; AJvYcCUzWp7Wnvw1XzVCYyLFHB0n26Dblcb/g9Bm+kjin4PgagvNyBOyHfn7vAvy2HXgX2pou+1if8kmjflTANnw@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjuBquTxL5p3cFT78yuNiwQ5iEEEnKJzUV1g0AkNp9S8wZk3a
	jN7NUMAT4E/wbirhElPyzjLqwIv+FvDucamhWr2SFLGtloHWZzaP6yd4PsKhx/TbBD0=
X-Gm-Gg: ASbGncugkUh5cIjcAGB3zICH54xiVxpX+74OIHmn8pZRYLsFalzJNcosK3obtLnH5e2
	HZ4Imy4jAvH2/4EqUrLr86/tlezzoR444yTs/AQy6rf7elBPsb/ZQFeabRe6vjWAZnTXLHcZzsW
	PUVt5U5gRtum5jOtVZMEniX2iyrbgn/p4cba/1LIh3snBdHm6KZCT+3zzESDBam7/NXTCV7h/s7
	5EXl+/t5l8v7b66uIdC6yheqWxX8P6SqVHyR3SgBjkRYLVRboLbfZMCuV/4NcJJp+EqdS6BpASy
	EOTYMqSjvMGrhBFYKsROvBrXPcY7DHPhcoKP1y4GTo0SU/XRVYYPD88xga+fexJEI4EvLf8p0zV
	+sdfdFsQeffN68Xi9Kr7J0GAujsXNqKSilbVtrAgnPoCb8b/XFbJzx5dvU/0YwvobMm2hzFQrx2
	o63F6fybC2ecqfJmoY9BiRkUOYdAf1muX1jDxavmJb7d+V7/sIotHj1feMheLemkn2
X-Google-Smtp-Source: AGHT+IGT8qQm72MH4N/KV/5pSWCcFg8v2M28ktxDyD4xjiYjdumKL2klCN+ekO0/+aP9ptjSGDv/Sg==
X-Received: by 2002:a05:6512:401b:b0:58b:212:b0b5 with SMTP id 2adb3069b0e04-591ea30a314mr971900e87.7.1761090325313;
        Tue, 21 Oct 2025 16:45:25 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
Date: Wed, 22 Oct 2025 02:44:49 +0300
Message-ID: <20251021234450.2271279-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SM8250 camera clock controller,
including IPE, BPS and SBI ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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



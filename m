Return-Path: <linux-arm-msm+bounces-63914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A595AFB086
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1071F189A607
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5347829552B;
	Mon,  7 Jul 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iyEYlPkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48636295D92
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882229; cv=none; b=gtFdV7/7h7OoObaIetIavsSRcosf1nlU29f9SQu5MrSp/GlUkGOCUv9GUbgHb1jHfk0gJ957SDJtXFg5Nmh6DrTEU5OzrxV6U0WmRC0/MX3PtXrrsDhCLRtXyDteI7fNEla2XME7PzgmIqfZleBH7l9EaT58Hd33w+OqOTHtd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882229; c=relaxed/simple;
	bh=3Mu2inPeLurTgxYIMXmvWJLeE7eR7Fy6XDeF6vArhtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXyy1BHKW+xACm2TwEEqs3zDm0XVtsRFv91fay7ijTN/TlUwKbld8hVp7jte11RO+lxwc9L1tbinrNzFURrx7oGo0rkIS4gQDCo7GQ8MSBUA2VhSLV/OFBd+mgO7NjVMUNC3BHiJd58UBoul5OJHKcEmP4h64JwfyeZD9iRdTDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iyEYlPkF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so6470538a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882225; x=1752487025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOnXjDsqREhCmFz88p49UNo+eXUiRZ56Bd8zYTlBpIA=;
        b=iyEYlPkFwUyAwTcMUvc97NQ6mZcgozgZfTX0JFclFwPj0oSZtjX/JbqZJpETRaRRby
         YEbqmfxvwPF6TCMwNxzPnsa0o3Opk1iv3fXuRV6Lwg2SwK48FnwR/XhOm22NrMb74kDQ
         ePNR/zFNKGRzBH5fk1VVK9qVbzTielD+ESYltioF5j6DVntVug/Kexisg4mAxgcm7tCg
         BnKWvj8Xti5XhKIRUlTZtGcg+4tsWAvOWx4ZmUG7NzsgkN+RcoNB/83BMZDMQ0LBl5Cw
         Pxl33yNqTpsIytR8Hq5qJjxHFdvCvYBX8QknIc7euv4vsYD7P95iQFWz59GEtSC0hwR6
         +R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882225; x=1752487025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOnXjDsqREhCmFz88p49UNo+eXUiRZ56Bd8zYTlBpIA=;
        b=m8mn7OsspZHQ6CvgLUFB3sDcGB+dZOBV8EoVASns7pfl6CKyZvsTeL7vFqq2DM52gz
         IAZAIAyRF5Q92mNc3UF6q11OAbSJH3H/zxabtCK68dTH7Q8OrfYVBk671hVeaPqQ+tE/
         C9W80dIJhgf+kAEPVdQjacP+T1xURqQQuFutKns8lKESkjAcFCli8GpDZxoIrHdrHzcC
         zWBJY0n3b0HR+07TYBHS6Ypq0iNKb6ohthGyt1mUZZOC0xyzyCiZ/Ii9Ry6Zidf/Q/KK
         fEyQDTd6tIz2WGQ1iruIdgqGfLLL/6LYBjRFP07x/iWN+O1IviCvLf7hoy7hliVi8GAk
         d6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX7FtPxviSKoXjn4WYsWoMrPjdRoqF2BNHjXekOndpYtLHCy0JLOEEHbIc8uvQKL1R6S0ThuSokcXxGhq4M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XF8Bc9HhLZvogxG2KHP0XHwrMc43me9fMCIHwv5yYNXHmiKZ
	5tcFoIG26LcGMk6xyIvFA/5Zqvb2xXd6t4oJYrOcwkzzuefn6cCwC+7XHXVBD9OJOGU=
X-Gm-Gg: ASbGncuqHJ7Q6xqz6Vj8lLoNeIZ+gvUiTxNIsMNH1Pzj2X3SPMTZMJXAso7oM4irlEs
	qyknKX3JSxClzW9uXia7zD/8g0yOfhW2/XNVFF4JAQIug8r9Gr/cbbzA0kJrtAYSfrgHcKTyfbd
	PA6Aevo0cfNBEclkmjZmOtrqloT10+Xe9CM9xVCW8ZEYvPFW7VxyubxdLM2COc05Gwnd8qdVZv5
	oAUT3r9D8mhy/f/vik/Py/NFfNwt0wohqrxceTD7EjIeHuTHaOVAIdSf6DdJPDOJUmPQZ/NNgUB
	uRif2oRAemMEjqwLW8uttUSdqgY7RlgGtNiJWpFQzu6hN/eJk+EBd2YzpmdDZc3kdaUgSyIMycQ
	v0RSP2fpMOdkfBwWjWVTVa5aDb5pL65lG
X-Google-Smtp-Source: AGHT+IGKhMhFSGKlsIJ79aw5G6QurSRw8NCQFcx3lleMs7147mX87cuyeRhXpjtmLkhn9V0f7LM0PQ==
X-Received: by 2002:a17:907:e90:b0:ae3:eab4:21ed with SMTP id a640c23a62f3a-ae3f80acbf7mr1348668966b.11.1751882225465;
        Mon, 07 Jul 2025 02:57:05 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 11:56:40 +0200
Subject: [PATCH v2 4/4] clk: qcom: tcsrcc-sm8650: Add support for Milos SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-clocks-misc-v2-4-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=1444;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3Mu2inPeLurTgxYIMXmvWJLeE7eR7Fy6XDeF6vArhtI=;
 b=Wtvm1YrlQYeQB2SHtJa+HyB8AdrvrSqn/xb3Iesq39ZhGe/BB5eqogjRlpyJs5iP8J2pzA7I9
 3PdMXLLd6FaA9OORSwNJH0kAn/MNrc4SXMzR8zSMe8BHr8fmfVIiXy1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The Milos SoC has a very similar tcsrcc block, only TCSR_UFS_CLKREF_EN
uses different regs, and both TCSR_USB2_CLKREF_EN and
TCSR_USB3_CLKREF_EN are not present.

Modify these resources at probe if we're probing for Milos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/tcsrcc-sm8650.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/tcsrcc-sm8650.c b/drivers/clk/qcom/tcsrcc-sm8650.c
index 11c7d6df48c7b39f661cc4c2df30387836d2ca60..3685dcde9a4bd5ebc62ae9c054e6b6a44d68d0c5 100644
--- a/drivers/clk/qcom/tcsrcc-sm8650.c
+++ b/drivers/clk/qcom/tcsrcc-sm8650.c
@@ -148,6 +148,7 @@ static const struct qcom_cc_desc tcsr_cc_sm8650_desc = {
 };
 
 static const struct of_device_id tcsr_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,milos-tcsr" },
 	{ .compatible = "qcom,sm8650-tcsr" },
 	{ }
 };
@@ -155,6 +156,13 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_sm8650_match_table);
 
 static int tcsr_cc_sm8650_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,milos-tcsr")) {
+		tcsr_ufs_clkref_en.halt_reg = 0x31118;
+		tcsr_ufs_clkref_en.clkr.enable_reg = 0x31118;
+		tcsr_cc_sm8650_clocks[TCSR_USB2_CLKREF_EN] = NULL;
+		tcsr_cc_sm8650_clocks[TCSR_USB3_CLKREF_EN] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &tcsr_cc_sm8650_desc);
 }
 

-- 
2.50.0



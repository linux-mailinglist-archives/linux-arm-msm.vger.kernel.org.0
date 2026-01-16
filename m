Return-Path: <linux-arm-msm+bounces-89422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2AD330D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46BDE3124993
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8A02D7DDE;
	Fri, 16 Jan 2026 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zj0Jz96c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633A1E0E08
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575054; cv=none; b=TyuJ1rypsuH+YZdnjJC/hpiJPLamDAxExcQCj0ANofP6/QIbs2l5L0xVW4TDdHzTk9zoQgYYuBagd6mC8He53Xk4Y7fn9rQ8ORWqwGaL0qp6Ftjg1KkUTsqlI89HCFB9E1YrTU5cUasCmf90D7KGWjP8oNRUQwAcwlcCDUiKNKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575054; c=relaxed/simple;
	bh=ahUcEGPytnk8Si96cVgaUrgSwtkt/kRnPkhww2URxL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twdOM88D0FVE5lox711gqz6tA+9uz5EC5ZDy+PSqkPz2v2ZE0hMfk1O7moM42aw/VrxewlsQeLfmJDM0x4UuL7UjftCQ60Im77FMN7oP/Wu68lk85NG4ZHw+QszP1yfIJB9agDyripSuozyrjz3eh5Ji7gqnVhxVVwUr/Eg47co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zj0Jz96c; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so3570921a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575051; x=1769179851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMptCAYYTXce1rQ8rmGChbIW938AEbv2PXNH6WP9t4w=;
        b=zj0Jz96ckVaszgzj30Lr5WeCC8QFhRnCAf67SFouedHOzcMxTySE0mhI+Ig6ObQNEv
         kCWE1lrZMCWwNZ/HVqWK0MY8o+e1hwXC3Yyw+kvXFDXus81X2O9Q5jBrUOaQT3y7cTQF
         cICceky+aRpO17MIsBPLKPnd9zCfx8NOf9WshGFtaez6HL+GfT8duiCpYQOnL8zzQ+Lw
         uoXJmhSUNfkEdWrPD0fw5JaMSjBTjRko6si5x2gxSrirjrMFKmX6n6NFzG1ubI7A0GmI
         DlbaLrquWdeuhd4HTzUNp3vZQBE4tIniXChbuQrqFvmWc9J61HSYNQ7Q2wacDjiRUHON
         UIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575051; x=1769179851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMptCAYYTXce1rQ8rmGChbIW938AEbv2PXNH6WP9t4w=;
        b=PDjAgdVxUU3/T7sGQqe64SmGhyGwrfizax91UrXKJxiLDCPl5Gnaj69TlqUNxplfAB
         s5rd3j24YnO7rrbEq6h+AmKfyiBPd6whxQGTYa5NhdcUNKEvK1/ZZ59RcK/E7zHgFY3S
         fJm57FBJGt/d/hYN0LF1o8l29AtXr3Jq+u3UbDjirK4CF/NAAeCKHGOlD3kUzlql1pkG
         UEjjyF+pCC/3caKBcTP8wPc1zC/CRcD2v0hXzr15pv0F54iJsy4xF2rJSp9OfTQDaXvD
         K0t9+n5EzY6rjgv6JzBLqVz4vI6BvARCXTNNkKNfT2KIgzxk/wmSHFAikQcOmu2nuLfU
         kw+w==
X-Forwarded-Encrypted: i=1; AJvYcCVXvaWKS4Pnr2qng5ImkJ8nmIyvY8XK8bioeaU3ftqE4Tr1Gyb9bdWvVM0Ojt4dOxUVUxdJitmslbaz5Q+L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56EKiY2v0im2PMPhefX3vlguq9XnnPOOYXV1i7eqWZWD9JhVx
	kAk4n4Dod5hMd8QkhdyTUyFUJooyZUGiglvdQK5GF2gban53MRC2OcxFWpDPqnNLGVo=
X-Gm-Gg: AY/fxX6UD3ovV2do3z7renVys7vSi6p6kjyfPGprs5pac4Hgkp7bZAK9Bvvuyi4Ltbz
	j4bQIJbadUG2jszh7SiuOeZhpwVKcLUi4rHYoNU3EJLqAEw4nAzfLjToxb6nAsDGHFWSHNTgmh0
	sFREzNFVg4D7bSfNloMquTudiX/nhLAFNUUHriYwZP5KtsU2Xh1VvEFZpugD8q9sJdHDM0rHYr1
	zkuWw1PuSrJpP4GF+8a15QCK39Z7WreYWOEw2DBH61Q/iRnLfXUlnZricbrGScslCaOBxYnSunO
	+TUqiEQbwGyyE3lPABQmV42ft6s/IqhlWdE1Y7RJFbB5kAl/jHroNGAryHGblasmeQlqP+ystRp
	dGKj5IephyCrD5rw9E77yvLlSpZyeOormFQPNReydokjGGYPrIahAfWX2FUn5vpHXRz1fkSMpR1
	g9Nsuc7LMom30sbGVaykRXhhuFhkAVoye9MmrP9CHptJ2jgrYReyntvReW6vLvuasJ
X-Received: by 2002:a05:6402:34d5:b0:64b:a1e6:8018 with SMTP id 4fb4d7f45d1cf-654bb70fb62mr1997705a12.31.1768575051053;
        Fri, 16 Jan 2026 06:50:51 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:50 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:47 +0100
Subject: [PATCH 1/5] soc: qcom: pd-mapper: Add Milos compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-1-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=1032;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ahUcEGPytnk8Si96cVgaUrgSwtkt/kRnPkhww2URxL8=;
 b=pQ0d7mU49Oaiu6eodLT7kdl3pBbBGjYE/xrRcrTvoLeTdG6y1PAvrfT20CLnuXrPrJ8aNVcfD
 b3uSdA9TjFvBiuyZI6uYBlNz04Cgh/p0M5YyyidWOX6G3efIex9tvN/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the Qualcomm Milos SoC to the protection domain mapper.
Milos shares the same protection domain configuration as SM8550, so
reuse the existing SM8550 domain data.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..e6f525813b32 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -562,6 +562,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
+	{ .compatible = "qcom,milos", .data = sm8550_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

-- 
2.52.0



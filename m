Return-Path: <linux-arm-msm+bounces-53037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA5A78E54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE55117309E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8D023A9B4;
	Wed,  2 Apr 2025 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="esSmra/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E083469D
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596662; cv=none; b=MZGWYrdIdIpEgJaH9GDwExqlXxv5dpVl92/fxs8ZaJ1IeuM8wgZb0c9K/N9RetHKkMYnishEIapBL55dcHX3x30/j6P/QYpKUoOn55YyI+qrH7iUhIHn30txOI5og+tlr9eABPAnlhd7XYcoAlFuxXGx/sC1vTJO8L/qFTqPuz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596662; c=relaxed/simple;
	bh=pd3p1EOQeH1JIt4Udq9z6hzw43geRI4pY+FfLwoeNyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/4upuTxG696zFY30lIhrB6/sfM+Df+s1dGHYO/gA91BE1wOl5q9/kfMOFPHMG/ljr2JC9HIdePEQ16FpMWSbYjKpYvyqXaJHxRQZJ7hCSFZu6F4JwwwgIUg/0lZtphH8YadVOu6t1ZQJJvqCD5Ao3/tT/ilaJd5qYe5vcquNjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=esSmra/x; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso68916175e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 05:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596658; x=1744201458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag+qe36rtOH7BLdLDFRBy4D28dCl/fsM+SZOhDkhdl0=;
        b=esSmra/xoXXUbxKb420hDYnq3/8ceIa/4QK0SyVejyi6Ifp05e++k3tcg0oXGkjIl6
         ActRxgW7R5MUG19CfuyVfoYDX4oi7Oic7cKKU1QbXmZ3bn1kAh0l/APCH2O2sMTM3UcI
         MP8Lipb9nZnA9VmQNoeAvcDA9RvZlqMVGcXq+aWw4mrWHIiA0QXT+TKyLwBinMncmESm
         qVPXZG4YuMydJ9h0IxnloYakY9MeFVx0HYTGwuNtA3fL/teaYnye04AeMPbD52FCFoPZ
         Id1kvZNeqjYfpdWcIvtHW9xxZZQ74HOsvzDKE/7CCC600Bd0dpO2lNdyDJIl6pUg7Lgz
         6k7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596658; x=1744201458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ag+qe36rtOH7BLdLDFRBy4D28dCl/fsM+SZOhDkhdl0=;
        b=Ax0FtnastCoZuVV0Jcq17vPMvwdIJ3ylvV1qDbObM3kOgBu1AVy6+VwqltsQQc5o99
         18n+N8ObP9831eeDoQxZNu1U0NvFBYmIihr7K4LksdQ+6NPi+wyClZaQ6Od8yEwEUqUj
         V/Z6FFRq2gGT+0FXDwFdxYo72YP17c11s47DJLPELZOuQ+l3hbClUTEQXsJ/gZazeuFX
         h+Aoy7oCT6Dc37LrcmkeP2c1NwkuWKNgkNOix9HLGvU8Z0vbCxLD6Tj/KU59FqJ1W1mz
         lZGW5zoYvesYz9oC5XMOR9re6PzAV9y1Di0A6pM3/0d/tVCayVcdFk2h5fsW8EOIf4+F
         8CVw==
X-Forwarded-Encrypted: i=1; AJvYcCVF2TX6+kuh8mszWflXygxJQ98jVFZhAyuooSgOiDrQZnHqTHlUDTxlBSupohq6S2w9q19CYwee9xubOpnc@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8cyHJzBRzz8RC+AEtHUFenkdSUq/qxM17yfWs57um2/ldJGZ
	5AxJlpSYOY6cHU7dpZac32qJSIH0sAiYKpdPe0zwX+mY5nyL5VrWK8KXN7AdyvU=
X-Gm-Gg: ASbGncvIZFvwynmqIQ8SLu2sn3VoLuKMJJCGf5qwxqfpXwJo6/kyBNq4yglA0G4j1KC
	OzbR+1YUvG3OoSa2owEWxVCNuvxVfiZ+8G4LorfciLBLlg6KeQYf+K5kNiCFs3jmK7lNRGqUcNx
	VxQAE8ilElCfQiA2s00uy6xLuVPOYFA9J16Xid0ER0dfN5MK0nqNpkHg++M4ejrfhzlgch6jko7
	/6IuFxp0cx008bMlo98M9WzeMadIWFHcSJf0VIxF3EzISOiDP4FCNvbuo9iI3OoPX6bybu+lgxy
	g1k28KdodxONNVN4oh/SuEi0RSPS7KnSTpCLJPrlSvWLQlDFo/hgaHFvmUTzV/2siaNYLMf7ZrQ
	phvUbPCyGyA==
X-Google-Smtp-Source: AGHT+IGZ2A+/X2i0m4nqT4WW0eKZBN0Bs5Jmua4vnLJ9sVRHmwsIh+X6Rzu6YnRHs9vcyXyorAWz4Q==
X-Received: by 2002:a05:600c:474a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-43db622a023mr164334985e9.12.1743596657700;
        Wed, 02 Apr 2025 05:24:17 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 02 Apr 2025 13:24:14 +0100
Subject: [PATCH v3 1/2] media: MAINTAINERS: Amend venus Maintainers and
 Reviewers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-1-2b2434807ece@linaro.org>
References: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
In-Reply-To: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Stan has stepped back from active venus development as a result I'd like to
volunteer my help in keeping venus maintained upstream.

Discussing with the qcom team on this we agreed

+M for Dikshita
+R for me

Many thanks to Stan for his hard work over the years from originating this
driver upstream to his many years of maintenance of it too.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..1d03530f3298703c5f3d025010511451f878f822 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19590,8 +19590,8 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
-M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org

-- 
2.49.0



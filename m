Return-Path: <linux-arm-msm+bounces-24545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500591B472
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 03:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CBE1C211C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 01:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E671755C;
	Fri, 28 Jun 2024 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xax8yphb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6063FD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536842; cv=none; b=c79VxvIXuuKDiWU939ZHU9o/q8kz2P55eT927GpK5ZAtM4+VDBXlnd3y8xYh5jHwNkbxZdXxmzt1Qr1CJc+jE/rOEV7IBEU+d8yVB020iLE5nspNZF7nmnF7jssplP+ejfQ3mRMrQEruJELTNmLMUjeCFMA53bOiC79I8uNCCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536842; c=relaxed/simple;
	bh=KI0YAwoE5tOePJ3OE78J/FukHKyRQlV6qp3tvk4r3uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQx2EnJHtkqWCuFJwGpo/fxFFdlD1WMGQ5kEbCxU31Lak+l8amPmbaGf1eqOUuqzjXEc4gsGjvsxxM7VjkTnm8U2gJ1sDM3x80aQwHsqbbwyLHNtTo3cCEF4W0kYP8IFjn8V2FO33Vc79spZN6Ouv3VLkAd/EbwEAx6vVsINwpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xax8yphb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42564316479so419385e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536839; x=1720141639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG1DAtBscnbl92897tEGafV+QEn7b6lppJT5wBhQF54=;
        b=Xax8yphb/1oEGWWBptbJTKbZ+H+HW8TUc4uvFpSQ5y/NPxnMKQUrIhSzPatqsDlliw
         Kh0sPbcGdH/PUb4ZBOkthWV+Ltf0RyYE+ito07k7Zv+1zto/px+qG1YSEstfSImqiJXA
         TtXNAIXitnJ/Ng6BULAu20OfSaHZVu6bx0CTksHQz6qylppv5SR9TuHl0DjpACVzPUqb
         qtNmavZPq/EI6DcqgshUtiu0/5RjspBlNrNJCTVARV3rqysjt+j4F4ZeoQe1DgRq9MgN
         IGi1mJN1cvpObVE/Bw8hGFYELrjWD5YgO08PGXHPT6kFxw8w6N1wsNr/ikwZ247+w2BQ
         NPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536839; x=1720141639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tG1DAtBscnbl92897tEGafV+QEn7b6lppJT5wBhQF54=;
        b=Rv8NwtvsdCi4XG26c3z+vWN7AJf83Hg/G/Ngd83ZmxECuFw9xfQwIBCnWs1zxtFoba
         BUbB1saHzHBFcIy1w0antT3FOASHNkxDYXqkmI4WY+dlBAorzIh6z0bnLD8cCR9SZIZF
         R+UPljt1akZLJumoBV7ujKMTpIyQPFy2+8bgWKo9426kkTXMU+YLumOmSOPQ3jJaxBb2
         6ECNSmfOdkCXXC43mABKam/LfbVNEBGUsbUDNXuoFH+tedgeIfqJL5V5Z0s7aVHUgGvR
         MPNZk4cgY8wqQK0ijfyTymh13UgZJg1Oj9PXIcS7B/E6othLyYdxkPkQKV9jpzo2h6M9
         1OlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOpBAh/NsuIZFuknZnMYJKmBvzt36IaBILFsZbxaOBk3QbVITDInJHRt0hGrizjJ33Jgp8qyz5ctG2llX9TCnhrAYAqZbOqM6XDro5CQ==
X-Gm-Message-State: AOJu0YxY+I3rbr2sF+bLuBa1BQU0i8O/xL2gHgRiZmucXzHv9zymoQZh
	uolPLZ7IqOZqr4t+t0DzlHNObVOn/w34kDx3wsjljhaDtVhd1ozyjUZAz/Fi8jA=
X-Google-Smtp-Source: AGHT+IFaXp+aeAO1CS/cju1lvX6fP2/V5KyNto62ApeEBvJ1oGHUvh4DgDlWfDnP07O2Fls30BjBHA==
X-Received: by 2002:a05:600c:491d:b0:424:fb2f:9d4b with SMTP id 5b1f17b1804b1-424fb2f9f55mr43198915e9.21.1719536838893;
        Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
Date: Fri, 28 Jun 2024 02:07:10 +0100
Message-ID: <20240628010715.438471-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b33..50e175fd521c 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -166,6 +166,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{.compatible = "qcom,sm8250-sndcard"},
+	{.compatible = "qcom,qrb4210-rb2-sndcard"},
 	{.compatible = "qcom,qrb5165-rb5-sndcard"},
 	{}
 };
-- 
2.45.2



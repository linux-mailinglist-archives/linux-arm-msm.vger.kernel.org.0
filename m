Return-Path: <linux-arm-msm+bounces-28030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C4949A72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89D78B24367
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 21:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6200017557C;
	Tue,  6 Aug 2024 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu6BrwD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351316F27E;
	Tue,  6 Aug 2024 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980713; cv=none; b=BSL7QkvR3f/rHUxWlOuxOFBzfRflvHuYR7V8FG1kuoHQGLSkkHGQmxJtidqwKEB5fUjnNEd0oDw2t5mWX8Y+D7LouXQA68de/u9Kpsi8iNu6bfVL5TLZE6tB2cCG+LYhmcOTfPGYpenZLSg82FoMankm0F6JgUNxu8G7TlPaIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980713; c=relaxed/simple;
	bh=8UA6xNK6FFgeRMN8qOKhlzPpsHPsnXY+tcFy/jX1oMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/UNHAhfyoaXuaiukTtVY2031LnadgQTW9AF4V8V2uIfAZt+CMVfFXM2leus0y/gN4/kN4dqV4DbsJWRNtdyEhjTd8YolFo+cVVd/ksxteWLCLTlY6XKkfI7XgD1hjalTLj56BEKbkrTcXNRyUV7KVxb384acVORw86f7gUJ55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu6BrwD4; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4f6ac477ff4so627519e0c.3;
        Tue, 06 Aug 2024 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722980711; x=1723585511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG6C2q34NWeKgA7Rpje8FNPGJXT/EfHsIqSMnZCRL2s=;
        b=Bu6BrwD4dssAswDLM7X5N/QsoI/+TbvISVY4Yw/I6mOvK++ypacE18w2P3B37Rcrcv
         woxdd/zI4+efLTZMumFfTG7xVcwo5XcZd9pZCDS9WCVC2f+Syc0LbXGvvC25UgrD8rN9
         JP2V+HWDDep3/imlMSZDm0Gmmrn09AaAfdic5QdVAymwD0dSizIDemCVQynicB5hjPe6
         aBY652QwBeQ08v4Cvxc15doIXIdxdYPBqGIsO0aiSx8gWoehcIRPWBdeXXV66syBRnZa
         HdQZ9psoYx9FicqTC6pqaN9QX9wDJnkXNSyfQDudGg8KbqTOzVYEyCxxmO/lcSKOED5T
         TDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980711; x=1723585511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG6C2q34NWeKgA7Rpje8FNPGJXT/EfHsIqSMnZCRL2s=;
        b=ZLECNU/rVmUR6vI0kPkomr0Hom0PK1MhNGudTgUkY/4HGbFkluUVAmB0vxamLevORh
         BTpxWG7MDZcCib1ubx1QoS1N0AxpPbeNdn2gTj5TwVKqjLHEN2xuvddyaMFvvsaz/gr4
         n9/OI3oMYDmmfpKBHm6g9ZiHreLJ1OnXnu51Hgqt1UgKrp4cCxDovh+mpW6JTRnPwmov
         2YcyZN8g2hzL1EgmIjDiZQZI0HWXgtVXkQ/I2saC6fZjPBgLX/jBSo65jxQGBQPf30Jb
         Lm9jmbvvLyL5KzXUYeCJ2iKwEiZYF4sDDUm0VGYfQyIj4zK4FkWBhSOXWMz6z4+9OQ5H
         Xoeg==
X-Forwarded-Encrypted: i=1; AJvYcCU4caN+sHDE6jk79sKjVQGQpBJtKpiwUbwzoyWGumkx4hOUIIVz2vCnPswXUHCUDWyCRxJ86oiusYAH@vger.kernel.org, AJvYcCVG2taw7DD0kA6sPTg7f/QPqUD0O+U9vapjyZT9bB40lcYbDoyehUDG6IGpj94FZlOBzI5YdfdfMbZLNHN0sA==@vger.kernel.org, AJvYcCXNO3BV1CHhvFJP5zj8llG4Uxkf8J3TcBEpQyVhL0pIOFAGoySptyMeVIEaRKXrp4bTdA3BZBuJFRXeC/SV@vger.kernel.org
X-Gm-Message-State: AOJu0YxHVgsu7BDn8x74sVKkJJAQwuB689Sw0/ujBaxzNj6vSy/yab1O
	Z72jIhFgGfPcUJCxDpJGxZLFYs55H1/EojaHIj+wTFBeUTlgoBLP
X-Google-Smtp-Source: AGHT+IH/Dpe/wIyv8ocAPkGI7uZGGC4gjw5oaxM1OgPkTR3suXR/XYthhC4ZWU5segmKMX73hvgZxQ==
X-Received: by 2002:a05:6122:4584:b0:4eb:5cb9:f219 with SMTP id 71dfb90a1353d-4f89fe84d6fmr20318387e0c.0.1722980710619;
        Tue, 06 Aug 2024 14:45:10 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f796911sm487104385a.131.2024.08.06.14.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:45:10 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm670-google-sargo: enable gpu
Date: Tue,  6 Aug 2024 17:44:58 -0400
Message-ID: <20240806214452.16406-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the A615 GPU and GMU for the Pixel 3a. It has zap firmware, so
add that in as well.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 176b0119fe6d..465aedf32d56 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -407,6 +407,15 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
+	};
+};
+
 &i2c9 {
 	clock-frequency = <100000>;
 	status = "okay";
-- 
2.46.0



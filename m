Return-Path: <linux-arm-msm+bounces-32612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8C987A84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49C21C22A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930A2187FEB;
	Thu, 26 Sep 2024 21:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS3fqjA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD46518660A;
	Thu, 26 Sep 2024 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385425; cv=none; b=NO+ptzexJQLKAw3+GcDeJypoprfh+oNfCxUQCXH7Ec8XOkW8i1XG6ZHCOagwMAHhiaOfqiw90csn/SQL4OdlCL8RHIL8ajdruKDZNdnXn+6n2BpUX7kVBKpYPyq3TYqcxwDuD7l0be6gX9hi7RMp0LkuB59KxpQDU36nvzUiFUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385425; c=relaxed/simple;
	bh=HrcVfm6GphW+dkH2/eI9roTkaCaCbkN7M4JC5UFjlfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OABK0x0i9Qu4yzRFyS0GRTrq3a7aZZGqI2iOHY4KFHUs3kKfmI9P2sToOghxBE0pnoms0l0b0Pi9t9iKhI5fwH4ep/KD+qv6/rTFWgEq8ahX8EWFkxuj5DpcymR/9R9vzvfIJri+m203PGFo1bPnYTG7cPECH2V+rxzz2Pqv9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZS3fqjA8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a86e9db75b9so224103566b.1;
        Thu, 26 Sep 2024 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385422; x=1727990222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
        b=ZS3fqjA8UdNlWXfcZSgHCH06eKmRLaFUSE49jAg6IELxP7AHRSX0Mg8iFlb5/kLcw2
         8IX5wX7FAPfHYJ7bC8nIHAD8I3+KVlzkmOXRTxvE0bP1B4rCy2j1k+3Hi+9imw9MDjHm
         w1P3XaHJhnUAEmJlHLavwSvVoG5Cfcj7Z8KIEfSKTnWZCycbPSTlVT30uKBHXGx+3ZgV
         Gm6KVimj0yzin9G9Xzd0AtprYLHegNiJEhJGeT0cruSeq+ocLBzvRmCs++Yn16CIokCs
         uR/RF/OHAgYThhUMRdgIDx45PUEQfERcIrz4jD3/9hbH45xk6vynLSvpxYrWD/+j5lWe
         qx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385422; x=1727990222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
        b=ApDLy+vI16PRIq38UKBh61dTmb/DjSywZyZr6tPaGgQWDOD9TmCLLEaaxJridxZKVi
         l0vjXcm9O0s7w646yGZebCqEw0tVmHaqVc3DCiYPx/dDiHupb0dN7d/H3QlVQyfcZPdy
         6E5UrkLlhaiRZZQiQClDpW4nam0O/N62kn15Ss/z9JFZl6/z6QKRWfElaLy5rkLQ3imJ
         pMcn5q2mxGqpJhJjUGOI8P4QGwhIs64RXNM5ZuAHBxIymqf3RirzDNjJwKtYAYQc8pn4
         80Q+arV9OVbEGlkxcqjEw6zUaUGROZyGjzhS5Ff1VFrq70kz2jWkjj/jqhsmzFZtIkZq
         gWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYNM8ZZmDR+AXAgcAv2+ZO2Iqilg5iJcWhI349WDO23xH4EiscshP1FhKj6XWmo2H7HTwmyFBNZmc=@vger.kernel.org, AJvYcCXw/gZ6Go3icsgty2Ca9wGNowi2F+MBHaZbzWnlByz0Lj3CZACX+qp7yGEAizNT/0jVsJDjieudz4lqloly@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzUxzd59+iWjo3zL/NIaUMh/ou+8arV/gdCRPdWWaqQ/adgmD
	eH/w75tV5XUi3btyJXAeh4HIMO4xk/qPEJcy57LrKgavtiVHbxCy
X-Google-Smtp-Source: AGHT+IFeG3xQe2NUPb0TWY2IpSWyUWxXtqMEEggeGF8jV+8iSTppPXNsjqibA2NC+C8f+F4+2Kaaqg==
X-Received: by 2002:a17:906:4788:b0:a8d:2ab2:c99e with SMTP id a640c23a62f3a-a93c4aa6a5bmr61656266b.55.1727385421887;
        Thu, 26 Sep 2024 14:17:01 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:17:01 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:46 +0200
Subject: [PATCH v6 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=1479;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HrcVfm6GphW+dkH2/eI9roTkaCaCbkN7M4JC5UFjlfM=;
 b=ec7LoUmEJAjOmebgibx3u60S+UsCHv4BwpHYl/Nc/7q9K7NGp9GiEBLqx/gvyNu6Wv+J7Suz2
 nQnm9jESmN5Cejmax/JV9YxHfosajsFLUgzIOl368HKPOvv+/ryayTH
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.1



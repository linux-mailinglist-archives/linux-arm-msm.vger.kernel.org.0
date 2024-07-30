Return-Path: <linux-arm-msm+bounces-27348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B69403EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D8A282EAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2D8101C5;
	Tue, 30 Jul 2024 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgdOAqPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E03101DE;
	Tue, 30 Jul 2024 01:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303539; cv=none; b=a0bLnHVo7ov4YhGQ7iBsxNuNBI+Rd+1SXpwPkzgfw4vCunCm5Lzbwf/1sqiOOQJZa7Wp7CSe2Fu5C1FjpEHtQG6NHIqyr1ymp0RYQ5AP6MMJmyvu3SGoPLlAlCUdMnTdRirGzRDFLtNa7NwkLcSLUSVADj/zY2ojDhfpPXImHj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303539; c=relaxed/simple;
	bh=KAID1401/yovJn3uQZvS2PURUS+l7Z9Dh1uBQxKOEwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFkYLQVMr6snSnROh0SdLUpIa57NeiL0He4ghW0Q2CXkr0tYXd/BOBHE+t45ddu+q0o4a80MLy0SphXPALcNSZPXqxeMGVKCM68Ja/8nHIqWlywTCmZlnnhIlxv5+1KREn3Nro3crR0nR4yb0UQas6m8R8ZIrprCYh9CBJBpXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgdOAqPS; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b5d3113168so23276796d6.2;
        Mon, 29 Jul 2024 18:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303537; x=1722908337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwijiQXrp5DlEM6JJIJ/GaHG36m5U+A+7dOKNwuF2TM=;
        b=dgdOAqPSW2rysy99l+gzup8xkyuUgyMg7PxM8cjFkFOMOVxWAIrexX60fnN0yPdxOT
         mjdFCkfeE9ywInRcWKqWF/zsM3ueWhSr8JrseY7kLE5xcsadKu0HqoFZY3O/U2C9KuMo
         5AoSKoRTxK3zI3iirp8amviJ5oqjFrkYClvSJK258AmfJt0VNEv5PqfVPpWcJhZEk4lx
         Pzw3AzwjGf5w9HM0cG/HIARPCwSVYJyYC//644/Ygg+aHBD5xLebA9jrtrALpwQOkhbB
         +a9ePfshk0meaUyF62xXDjyI2tE8Sksf1DYOsljkMjRMVe0osMANSAcMvTGXCfHGB3rJ
         1mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303537; x=1722908337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwijiQXrp5DlEM6JJIJ/GaHG36m5U+A+7dOKNwuF2TM=;
        b=LpAgEw1HFP7uBZIHnoa1MzmCVaMxR8VhLB2BB3ZfHXeHYCYGqch/3Gk+ZRbQJ768AH
         tRHab9DMlKLE7AK4LxBePBjIi5QJyQ5C5ZSZjtu4gKTvTEIQTyIUZAuiqA2pvUl2qt6V
         y6kBmJa19D5PQq5ZQ9V60wBajHD4bYqXQ2xA7PZLNPNTHfWk7Wazo3pPQTwyyjTFAkOJ
         czH3+xK1/k6Ajfc6FpiP30IE0sVMNvFAR7i4RaE3sAfAnLm9VkH00jgBDmU6KNu4m7IV
         h1WaNF5GHVHeFJ2JZ6LD9rO0XGz3Qv2K/x+uBGeh2eri3tO7teMGUlIEA++KLvd40nb3
         g/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRWXjpg3kGrA+f3Q3dN2BhkwNT/C8Gx9dgv3TqibxfdoPcEPj4Nbdmd/XopWwBMuSZq5DWRjsdp0ydaZwvB/aGcVempSUk2/tfD/m78JcvGaZ9N6z9nK1vMOKdpk5uM15vvPTq4j74+XA=
X-Gm-Message-State: AOJu0YwcopLifLhXOphZgPxoMt+c6dTM4SjdLYKKrMt+B3wEojLi8NJl
	FmEIIyBhssM3Xp47VagHA8K98OU01sTfj4dQqEMClo9KmiqTRFr0
X-Google-Smtp-Source: AGHT+IFV16qAcfMqLWnSDqEkg2eRkXAFyIb+aIGVTG94FYyBQh9KiIsTQXx20fyc3j8qOo7IH/YlCg==
X-Received: by 2002:a05:6214:402:b0:6b5:80e0:1301 with SMTP id 6a1803df08f44-6bb55aeca19mr135400336d6.55.1722303536758;
        Mon, 29 Jul 2024 18:38:56 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3fa950a3sm58221016d6.90.2024.07.29.18.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: sdm670-google-common: enable gpu
Date: Mon, 29 Jul 2024 21:38:49 -0400
Message-ID: <20240730013844.41951-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
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
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 176b0119fe6d..7acbcb5b69e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -403,10 +403,23 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpi_dma1 {
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
2.45.2



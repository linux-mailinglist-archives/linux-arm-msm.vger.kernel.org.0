Return-Path: <linux-arm-msm+bounces-39408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFAD9DB589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F6A281D2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA2F1917E9;
	Thu, 28 Nov 2024 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFgG/7Q4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6815854A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789551; cv=none; b=gNs18nRj+3WoLYScr02XYxmILzymbeFWbyzCz12d7/WaPK5JKa7jgTz0S6w1Qhy6uwY3yVqpKV9FdmN5THvXgkiSyy76GvA2fienP9ngrOl6mgdQHN/bDxEemvKFZtYtESZ1wl+12WiySVNw78e1kdq9Egis0WDRGmIxRG1UxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789551; c=relaxed/simple;
	bh=vsEtJhqxnbLwiKyoTF80GGH+V1VYTVJylLP0loUgqSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTO3x13AkpZ7ccIr1bR/UjWScJnPG0gHTqmVwphgJBeX1Sk5VUPUqPrRJx/ywAoXEKWdray2Eu7R6Mdb16dAhYeccHgNSBJRkqfQdBVE0hRb5QDZgpbwLAKNtD5H2FmtMOHM4miL2zUYl0PuBgp3TeRlRpMtiCgm+HRO0XshnKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFgG/7Q4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso6031605e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789549; x=1733394349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reoDVbzQsiSf/gPv0A34FrWumLX+gyEDCSO0BWtsisc=;
        b=zFgG/7Q42juePtAqz6+rjW8MhJDU8ePUopqFhQonszGOLxbIzaIHiJHIoUFA0FlIu2
         /fJ+DDHp8hmGJotI4DlkLlV3EtFl6XojutEDbLG5tA1Xb5YX31FhtthQBMbrvX22ye92
         DDdJqeRbdCbta0O53vKSUmeNnuXXyYMjObJJCuQndZByfsv9Hzc8MzDa7AjERJlMuMXC
         fig6FuHaxUiejYoeMnvYuySoiKx/AtziWY/+029STv5MzSXJz2gHGX63XG8ITUUm5I1T
         miRWEJFMrqUO2dEDR65ZP+PW3ccf8R8yTxz+ZwNzjgaDT6o0WkPX/fOqk+0xRkyBLc7L
         9DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789549; x=1733394349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reoDVbzQsiSf/gPv0A34FrWumLX+gyEDCSO0BWtsisc=;
        b=mV1Ukd2DBKkBs7YrMZnG/sQYNXF2d2C04UWJvgFQhGZKVMk0/z4j/pTS3JMifgm251
         k0R+oXbGx9FQ+apdYf0i61WVtaMJZ6KJ7pj3jZljCanj4ckOCo/yZIEsngo9F0Gz2NOj
         eIc2+wJtvH7Z1bRNkkLXGUD1J9JDFFMR5y3K2Vm633yvTThw04WJWuGZ3/f+wX45YwRC
         t91HcoEo1brupL4wNpvkbCwJasy/ZeN+s9CrAiozamN1enJypic2CddbrWngHEGRhdwV
         +JU6Jj0cON2ItiXqtHuT2UN1PUdlGkT9LSqVRA4k5CmFEBFJvyAfMu9m5kvsOgLREZk6
         WLiQ==
X-Gm-Message-State: AOJu0Yxn3kfm25fi+dD/2omHPfgOp9wInoNzIsa6P05b18VUXtLsJD19
	tbDcv/nbxx9Ge6gTFPAtoUeAnUtKwrGu6sUSEtuWSMezq5o6QEB3zkyvs9AOdzE=
X-Gm-Gg: ASbGncvhVND9NJPEgctE32IRbF0nWp/exaLwu0OrMkjD+urmad2VdwO74DZP1QetfiA
	lZqwQONt/S56xTMG3AjUOkuea4BsFLhzGiTt/4LYQ+wb1rA2Q/1U2mIIJYUEGuXiSQUM14RdfVx
	mvPeniJI9lhGZElWhOj644KesIQypO8nPhcfTbvcomsjzEhzXsbYWx1eqzl4R3izDjbFh+nqVcc
	8W04ZAxDnH1w3A/rt0njGb4AcvQIa8HNUvQYb/EAdtgzzW0YZ2sFTbThBmGGPdeiOnMHAA=
X-Google-Smtp-Source: AGHT+IGVIJCasw1w/lv4nzEi6y4n3531XuVT2EDn/i1vSfZn52Q39Pj28ZjDj+ocKgTB+1FjYDEvjQ==
X-Received: by 2002:a05:600c:4e8b:b0:42c:de34:34be with SMTP id 5b1f17b1804b1-434a9db8393mr69151985e9.3.1732789548697;
        Thu, 28 Nov 2024 02:25:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:25:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:41 +0100
Subject: [PATCH v3 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vsEtJhqxnbLwiKyoTF80GGH+V1VYTVJylLP0loUgqSU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUn67+M0ZML1AQ2Cu12caF1aO4b5n+ci1RzZfKS
 W1UiU6CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFJwAKCRB33NvayMhJ0Tk/D/
 4/1hGwJ8vuHp8WboZb5xYxpLSFr2w5QWVfhTYJfXz3uYFf09IKoQt1rD0qqOYKUrioDRVPXnOvnfEC
 gdYfqAzokrpfBrJ1IDSdDZL+bMw1poelWVWdr/UDO+0q6ivtCgTxe2i1toSmnHE+ccpXigknc2U1iS
 4WecgJfwi5zaxlqGStKnjZ9MxeJrP+tdi4VW0ghOInX7WgduaepmTAgesQ+Rpwlan7bVaG1eG82k8V
 /vqsiQUlUWnE26PhWF3K6eNPhgJfD3x4DFGKxo3eqS7dmDvq3d7qNtP3hbfJVLdrdGwkk144aPe0MS
 yVH1y4I40NCPtp7OnHEKjXgF9xJoLRbyT00Fb23tJMPethBjIJpk8WlY65znroi+j3S1h18DId/rDd
 PqHbmxcxetOWwL7/3XxDYrss9FqK+Zex+tDk6DRcaWhyM498GXdx19lvKJv8ND4HZx337ctJvhESGI
 ufv7C0e84+6RUTlMZ/lZ5BBEBsCbh1SDOh01uiyiDNT8SuBt7hIW5oYwurg6UTtd0TUG8wAyOzI2cZ
 wIMDENQbTNcZRmSUhpzL5Yje+OU3Vmh6qIR8MBF9VDeKTKv2XfTwxUhgDqqDexHTA4QaQesWcGgPNL
 B5Zxk5qKmVc9bmnZjA+xVsY2XGnYSD6O9w30M20cCS0NRrieE9AwUWCgXaVw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Even if the code uses ARRAY_SIZE() to fill those tables,
it's still a best practice to not use magic values for
tables in structs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
+#define GMU_MAX_GX_FREQS	16
+#define GMU_MAX_CX_FREQS	4
+
 /*
  * These define the different GMU wake up options - these define how both the
  * CPU and the GMU bring up the hardware
@@ -79,12 +82,12 @@ struct a6xx_gmu {
 	int current_perf_index;
 
 	int nr_gpu_freqs;
-	unsigned long gpu_freqs[16];
-	u32 gx_arc_votes[16];
+	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
+	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
 	int nr_gmu_freqs;
-	unsigned long gmu_freqs[4];
-	u32 cx_arc_votes[4];
+	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
+	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
 
 	unsigned long freq;
 

-- 
2.34.1



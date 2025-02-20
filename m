Return-Path: <linux-arm-msm+bounces-48644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B07A3D693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 785ED7AB89B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6931F130B;
	Thu, 20 Feb 2025 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMh3Ven7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B201F0E5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047186; cv=none; b=M96MKsYz9tsSeYhktWN8pE7QeetqeDAfsk1znBwH/3xupJmKlsX2kzrHem2TRuqrbWGWB2iJHiHoq23J9JXTODXyiwFeJmWbTyQwAZbi9zA1D9pmjxcudH70kGeMY9j8M5Teco8XybidiRtugaNnt/rFBJ5gfa0j9hY+i0zWESU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047186; c=relaxed/simple;
	bh=w10ZfN4br6Ap7llW/HC7sm0zGLP894PWSldkoISRy7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIN3fI0YBRb5kIHIWobTSuD0otyVLMbX735eBU98EAtWJZM15uvxUFwvRTl9iXFaw7DDRrGWmrrqFY6y8t4BO3QtiAaYVZFOTzVbybWj6BsexYH7q0JTzUH9mufP4PMprr72hNZ+j/2D129IvTtdNdanyTDvodrAFclU5NUOjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMh3Ven7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so846481e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047183; x=1740651983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHG5/92JHG16RLprBRzXgLa8hI+3p50zsk7zJC6YSjI=;
        b=mMh3Ven7JY6+5/SrwKzboHhkJCBEE8ky2Jsgkj4agEYR6xVOiTeUKbRZW0tCCGLHVr
         7ehuEoi5djLbifkSHxBQU8DwfCkP6jD0/gHBkJpAyg4d9834TOOXQFkshtwE/6I9QuAK
         u2ZhFU5qhM5mh+BJVdkiw9l2GlaAsBugnMOQbQk+lNjAe1GrXZngmxvo8wR+BRtGj37R
         CUMan3rT1GadxJuXkqLXHvfTEr3FVC6LG4Lwos1oadqtIdDo41j+JTHVnd5BD/v32hLW
         q4/tLAqlddH35G8py8mVYczQ8sIdFFpn9sxaYn/HzVOpGsCLN4UrG2gpQGHDjk6GFid2
         UNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047183; x=1740651983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHG5/92JHG16RLprBRzXgLa8hI+3p50zsk7zJC6YSjI=;
        b=Xe+DX606n0NilwWxbF7PMFKk7gXHbLDSCTkFwgtlM3QJnCF0JGS8bYay6bEq3keup7
         cYut9b9S1FlRxLVFJ4EYGMC8ulJ1ASA3UksfmX3d4n8Ui/AJ1MUZHBBWMFDTXtrygqRg
         N8eN4Fb3VEC7JvOGMyoQtr9yTDfm1TtPgQeC7EvEmfF6V2yTl308ZLFQ2kh5yzpF3t6R
         psCN7nrKSN2da2vJnzTWjfdvmBUMagD1lLmRAj8GUmC38jvmReMUMHDgLv98AnTPU1HO
         NodXaARr6ezKjs6nJRj5OCnraH0csUJLMIySCfNHurkOCEC4nagCrgOlcfOcyEUjaCld
         eNig==
X-Gm-Message-State: AOJu0Yy5QHMX9LGZMso6deC6fGmAnEFAjlfa+Q6bpSImWyRKoEd3QcuF
	6MwDG70SaHmjFI9lRIoIWec4bJMlcK7+pCglp17b2DYlioV28v952aKxDd3aBik=
X-Gm-Gg: ASbGncvRFCWzFkqWvalCB8npEVyQlzHy+4JUU9eqlaBH7ud+QT6ZgriywbMgp89ZO44
	VZJVPHC1opy3mDlh1NBXzfBsCA2iqpqWS8CM3UA1QwIalnD8xo5qWpE680htSejD3fDBJhrBER9
	Xf/wefWe2Yc5W3/tv8mbBoY4LdziFBB5bTI9SIvKb3CCZns0ndW9y1tNjuESvd17gu7amvzXpLU
	z/xUp/XeTuIRCr9tXRvdzlZbjm4vz0KR+mxNdU/Ng6LYP8i5WEcpB2B5FjUPKpTJl1cvVwafPJ2
	MkDK723GDg3WRaip5S6AZUo=
X-Google-Smtp-Source: AGHT+IHoB8cGAPCGqCy5Ys3Z/ClpL2nQWVmYQHHBfQ6tZBAycg+fN9nJybcNHcZmN/tcLAhsEfwZzQ==
X-Received: by 2002:a05:6512:308d:b0:545:2f09:a3fc with SMTP id 2adb3069b0e04-5452fe26402mr9020270e87.3.1740047182645;
        Thu, 20 Feb 2025 02:26:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:26:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:18 +0200
Subject: [PATCH 1/7] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-1-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=w10ZfN4br6Ap7llW/HC7sm0zGLP894PWSldkoISRy7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKGB2SRGw4F+CCKnh3jnyyk4Z50hcLkYJZL
 WDHvV06OyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1dz1B/9E+EDZuiyFKbu+SOvzfZfWbAo0fN+Z7dtd6euH0aZu3Xj0jlLMVWKP5Gp98xq1o+/fBQw
 mSvUCdUuEsf4Dx1B8IDw0NCpJq0SpYCgZFjQo7jy3jNGrM0s2dYkT/+ZDRzQQtIu34oiYi0AFLK
 lvPc8qzUidfSVyfB/LarXGTT/HPKmqn7uFjrDVOqFJeQLV8PNLTjQbjNp+Mc17t3dYlv+hXXnSU
 mj30TPmuI6n0Y0GFklZBoHHtNHaUZVJXsRHm1q2V8emUk6Y+8cnCQ+PO3xm1qSb7PNSl8Wi0ZIM
 CXxZrghI2QOhgosSlmSjvUD2JTpAKq91N3VTX1O6/N/HZIfC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
might use more that one MERGE_3D block for a single output.  Follow the
pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
simply writing new value there. Currently at most one MERGE_3D block is
being used, so this has no impact on existing targets.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4893f10d6a5832521808c0f4d8b231c356dbdc41..321a89e6400d2824ebda2c08be5e6943cb0f6b11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -548,6 +548,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 dsc_active = 0;
 	u32 wb_active = 0;
 	u32 mode_sel = 0;
+	u32 merge_3d_active = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
 	 * per VM. Explicitly disable it until VM support is
@@ -562,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
 	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
 
 	if (cfg->intf)
 		intf_active |= BIT(cfg->intf - INTF_0);
@@ -572,14 +574,16 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->dsc)
 		dsc_active |= cfg->dsc;
 
+	if (cfg->merge_3d)
+		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
+
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 
 	if (cfg->merge_3d)
-		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
-			      BIT(cfg->merge_3d - MERGE_3D_0));
+		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);

-- 
2.39.5



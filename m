Return-Path: <linux-arm-msm+bounces-47283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45831A2DB1D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B6C3A6F07
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAD0175D50;
	Sun,  9 Feb 2025 05:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWp1lagO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412D86331
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077631; cv=none; b=bzAL4h6PQ1KW59XPc1/KPAriI6i4hJIfXLRDOgNErZEETrulxInTmzX2r83a7uVV9RrmIY0awP+btuJabJFJpo6cMo4luvLuFWWk3lByR6IaQXKwsyCP0XHHedLfcaXH6oThykJM3MkSnsVzEW29Tq2Os7ayxYEi6SV5Yzzlwp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077631; c=relaxed/simple;
	bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LiwF89hHQFR36sPWN2KqauyqAvkETeLJ0mnhBE6FIbrEpQF9jIY1rSm//yniDxxsq8E1S9H0G+dEKdV/CBUU0munBinqPxvV7a4PrkAsOxX06lufj1kpGqOGCrJINgp2L6L0NS4K5Bup3LVHI4u7RekZbAOBLxQV+OhV8YZwQPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWp1lagO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-545064389d3so812111e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077627; x=1739682427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPGyQgNZ0aCBKHZLfiK3AEZ4dYrfnGwELgJGxdZANgU=;
        b=NWp1lagOzJzEIocLjc6k4VYsfHIur/Bl4zZ1FS3pK84/246B9GAKKO9ZTd1xSSHMP9
         42xTcaIVK0fHgkhu+VXKUF35mBjolt6BX/ZOKX5rfxZ3mPu+IpJCpHhU4rEstWUemK4e
         aKFq5k/TPxN0XbqAdPqYbu029ukH6si+pTfD0hOdDTcdEidjkFNFBXfjAioSyQwoqma3
         FpNKyTcHWFTuAMyZcIocYPyt1P3ximUPQq1pMN6KKVIYX22hQbIzq13JAym0sYTLm5/H
         FQ7RybMj+ds84Bxc4FAIyUZC33DJrxAFc2qUplAulzvV68nQTvL9TaQ8tH1Y6aeSbbU3
         vtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077627; x=1739682427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPGyQgNZ0aCBKHZLfiK3AEZ4dYrfnGwELgJGxdZANgU=;
        b=YlnOaBCZipZbwZOM1gHiLL5dS5vnKTNzcl2bR1hxH06Zf0+vS/a5/jvnzQ0CZs5hVv
         1kN38lnIlyCKrLgrauOKOX3P7SKgN9MAcHPAlx3jH5xy5n6qbawfwRhTVoE8g1XHHYza
         0xdGi4wMSPit3kZA0Q62O8eXElH28qlMqZB4/e772rS0TQ5UFZTzkDkuIaen1JzwT4Ku
         epgEVU5NZY3+a5xivM7ttj40V2W06Ucv8osskZbpbtuWb8ATkWE3PAdKfdUSJBjSLxrz
         YL6JO/P1X7q0SO/WbnS6sVss+EwfT/kNIKtDI+L11d6JjuERTzwjfRQnCk7/I1fEoiaj
         E9fA==
X-Gm-Message-State: AOJu0Yz2IRSu27IN/uiakSCXoMkgG5Wc53AKiF7EEGk7HQU1XsXLFANj
	9YKkSebPGWw1Oq/NEutkDNXyCVsvUMfXw2KsyrwIyDmnA3ljwFy8xNeszR43Nb2cEdQA+F1jgZz
	zUPU=
X-Gm-Gg: ASbGncuCDqytxWPHX9TYPdv1lxCo32zj1VZQ54R3ans4bv0jgkiG+PQ4PyVSLDtuFxQ
	J+dB9prRHi6rjRtXYH5wl4zWVvEcGt9nzl3JWh7HKtXdZHOvm2124S0y3Jb7HP1H9YvOL7n+mrD
	p1GHouRbjsrLbCVc2awiO+DxUic5ktVBMUB5Py3xi1CbQgjOwIKEUObIp0PL/LP+8MmziaeNpE5
	jp1AzGmGVmPA6frThmv0TUPwJ9Ys+9n1ORINVpLxojIAtv4iavWDF/JOXXQasbSDYrhYzu8f0yI
	8UBZQAF1mrf5xcjg2DQZr5E=
X-Google-Smtp-Source: AGHT+IHOgcR2Z0Kqo6vnivPTHmH/O6i7EBOYINI+rp89KZLNIblSE2CYospkx5vQksFw/e13bAf1pg==
X-Received: by 2002:a05:6512:3fc:b0:542:98bb:5674 with SMTP id 2adb3069b0e04-54414ae0732mr2345723e87.33.1739077627095;
        Sat, 08 Feb 2025 21:07:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:53 +0200
Subject: [PATCH v4 09/16] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-9-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfia7EBbrd6GV3tmBxCrKU999OvEGr1JbtMF
 Mdzz6fu9ISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1QrVB/92GfoPb+KtYU7kLhhmf8FYFyhFLKMmj7oEBLJB/Vecg7K+hhR0Emve+xmn01ZP2Hue125
 fGhKF5HYwmbu/ANhmsEmvcebBvFD2gQEoQ4Lwt1jRlMBU1ZFsK/jPKRhArWSRPJvb2h7bvze98Z
 iSvNIGpCe6hy46XwhA3JyWsuiCmD5Ixjr+qjSYBazwM3NoF4Tub4SccSG9YC6Rm+A5csfhytRvp
 3Eo7gCWZfST2ZoSjTu3D0TM8xROiS0KPlCgMCL1RHg8fqk6VX6brvVQaw+ho8zcJ/kSrIzbi3P9
 PWmdaxYOgzgmWMYcjBaHqX14VY8iFOCzpKD4as4jMTXz2bWo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240ff3ed6694c469eafc4388c982346..ebefea4fb40855745001ed97367d571bde28f413 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.5



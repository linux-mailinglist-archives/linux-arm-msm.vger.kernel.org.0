Return-Path: <linux-arm-msm+bounces-20199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6404F8CBFA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17301F237B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBE184047;
	Wed, 22 May 2024 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+DkYB/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBCB82D66
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375067; cv=none; b=G5T6Ey/6sayx8B4VSZ0uRMAtDME7rX7WcAT9Eb0So1Bnc5S59uWQocM4pjQ/62T2ZvNYnxLVuqQElgk3kP2TCyhZh90d3uwHt+8jYA7eRj7kvF5bazl4N3Bp91q6pItqcAXwC4ZD39AtjkM7SSBNgJfYvQhUKnQ0A1poaZA9SCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375067; c=relaxed/simple;
	bh=Jgttl5H44Vld14qWMns1jroXWg5YOpL1Dc2oQSS9ypw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VReAJ408O/lc2xzmIgp7X6EtH5+3fhlqhA7vxyB0rWnxREIYmdh+kw67PSGIjyBQJKS+Q2RtuOn0zjEw0C4xxbrvKUdO4Yr3znEC6X/BFY+6zEm3ZUu0AP0ctOVj2Nj6c8WDjhULEgnjpgN1ziY3ERBDBwO9ROeSF1MgN/tJnt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+DkYB/g; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52192578b95so7497944e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375064; x=1716979864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6GgwKTdsZwJRv3Ukk7SFtFzEc2aaRxTR76EeCWgZKA=;
        b=J+DkYB/gslx7TMhjgQCCJh3/Ltmu/25tbMFf0DXtl2i7IoamLjjtvvu55HmdxBexTN
         O0OYeyscnvgIDLaGNgm0+f7X/zcSGHsDBR3I4GQWjkFPa1LLwO7jk+NdocoyRAxfYWhU
         KxTpQBTmfX450e1dKTrTRjrqVJEKuOOr8lMyCVFrF73z1XNiHY1StAu4mG2jdfhIr24I
         0iojeGJS1ZUAzgGwzvSWiwL9zmzvq+F6af/TAgifgsxBpcQGbYQJQNiH3S3IzrFTNXrT
         oNQ8WtnlCyhrBcY9sFDCQdeHT3kMuhQaiflX1S/FrVNdQmlG9UT5Wn/Nb3FdDqBhhRWn
         q2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375064; x=1716979864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6GgwKTdsZwJRv3Ukk7SFtFzEc2aaRxTR76EeCWgZKA=;
        b=t+DLxYjHNp/DS0vfAyAfEyio3c1+W/WJwl+2w8VnFOA2GAlM3BHief3W76LjqaNf49
         HhnjJyFw8KUvcCLMCONUu7uzK1Ut7IC85NevvCBmT3kff8DWgT14pwHQzO10q1tLj4XV
         dHSiRYtTG5deW89nct3gd+rN3PHq3lXM3I3RJJBNKkMtPeGftPB91aZU047JV3BX7NMy
         1Ai8Fr533sfHGXtJgaYVDUh4OfrJaXXijqbMLpovbkfpiqy/+2m7YcOtRL5F/S13v/jz
         rQdI/xlgOCgkVrnNNFYKnIpyPh5ixTGE2UwMXo1/TC3Cmw1AGlowGK6HiqLqHgcuzZRv
         UdsQ==
X-Gm-Message-State: AOJu0Yz7zVDzkhFW8ogOA3jzljjF82g+SbKvho8NfL09CSWnuEfegbxI
	L2XtbnCA0J0blxqKJi2sH1ltGJ+GKCe8Go8LLprtfJ+EBbUuepzZJlYh2El6Jfg=
X-Google-Smtp-Source: AGHT+IGZEv+CIDPXP0TJ1i+AotzbFz5H7fqitUI/2i1sh33JfiQ5E7D0YHElItOMq6UM8jVLtSM+jA==
X-Received: by 2002:ac2:47e8:0:b0:521:7846:69d1 with SMTP id 2adb3069b0e04-526be6ea784mr995436e87.6.1716375064461;
        Wed, 22 May 2024 03:51:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:00 +0300
Subject: [PATCH v2 08/14] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-8-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Jgttl5H44Vld14qWMns1jroXWg5YOpL1Dc2oQSS9ypw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5rvOYH/AvxRXG5PuivCtgZbTDkzq5nVPWvqSuvbF7bJ9
 rk0FuZ2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAik8U4GBpOrL91US2S2SFV
 9ZCs0o4mLsaQ+M5Xpdm66VVdr8SybSZkrV92JVMh3kPGLmgR67tHLIlF57/r1jWJRc/4UDnxY+m
 eeTJx0/alXEoTqJaWKljNnD9vmuILxjDFKMP8sMMFJ0svhu7uyJeqCn45Q3lKZMEFZq9JrYpvfy
 y7FHL66gttO929211S1l5RmLlJsmeSBLf7boZrZzszPBmMFyzbI5fVJGMSfdl5+4nyf9t1vyXP/
 PukZV1B4yyra3/OSLzOcK6Z+CnSfLVGYfnVbwyO/6VbMg801y/ROpJzgLss7q1uTcbtjao+B2Tf
 7zvHoJK1ZYrOpKDmdXeWHam/tVr6j4H+YcHFqf7lBVKnAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240..ebefea4fb408 100644
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
2.39.2



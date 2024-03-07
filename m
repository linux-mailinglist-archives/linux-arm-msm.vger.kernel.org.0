Return-Path: <linux-arm-msm+bounces-13649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A10875B46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C69A41C20D55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6845E47F7D;
	Thu,  7 Mar 2024 23:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/0AZBAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB41D698
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855829; cv=none; b=pbBT9B/6s8YQzShlszkjnHRWLIG9LhTnbNS/d3QvRf3uFa6WNOLeAG+NumTlRD5HcwoM7DHk3TayOCJYfX19SRWUEtTcp2ZOqCvnYgzj2/XZaapPD9J1j3teFXhxxgAGfZxyPkSrBos3bcfMrdeZSCdhsMEkZN7fMoz5njr8r6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855829; c=relaxed/simple;
	bh=0xTy7u4ldl8TibzkLZodtG0AmzrH8EDBIk+OF9QReyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjqOu5Sf/aBFj/fOlwTFMDA+C/d6jEQteGM8T+s4Nmn6LhBGRvJ45+lieVCEyf5kxW+teD2DHmybMK3BlzpeFwGfu+/ct8z5Z1jcz9GtNyCH0B1RiDgahsgRCA0s+LqcqYvpO08KDJwpVQe/JDcfW1UB7Ags3XLAdZ0QWoT5lqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/0AZBAU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51326436876so1952447e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855825; x=1710460625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrWVSqhIZg5i9GRohJrsO0PLTsaI98ZgAO0O1ROuapU=;
        b=F/0AZBAU1RS6struOKMwq7fRGhqodeHjBKV9nOyR9lALea5dfjwfkOaHinpKL2ohq+
         ku/ZqPfhhrAwp3JCUzUJqbhzOuJcjC5wWZLXG66qYCTEDKUpWP8KNvPywyP5K5R5/DZw
         Pm7wnaI8Q7L8tbRo3MXcKiQn6Zh9ErTvewG3xLbkykYWxlbWugFy3NVmfnvJu+CPSPzE
         hCYkW2697XTRtV1ns9ytYI/FFlr1Ut6z0UUiraEkZ323ia/1OvNO1KNTZv3rPTH1sUX9
         2xbPP0JeVZNzz3UZ+oY/0gY3EHY7oFodIMJ29LD0M0NZcTvJeipVIqbIutES2UuXBaNt
         5WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855825; x=1710460625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrWVSqhIZg5i9GRohJrsO0PLTsaI98ZgAO0O1ROuapU=;
        b=i3Kp1s3UpcD9IY9wkp596lnZtviqiUJ04wkqrUqZyCPfnPw+va+E+nVSV3Pe7KVQFk
         J52RLDeivBwPzNbfKp+NtbXPKCsg4DZNL0LO4AjPttdG4vjnmtSXKHyKO/FSipgPL9nt
         eLS4lSX3tZLeWFQFezSL5elTkR6UTO+eeL/IQdKfRo4G9EEjR541tV4+LKuJvpQhfBin
         27ItKo5a8gv4XrGZWzlX6k8nc73Fe1eQ/Lxf8J/3nS9I4Za9OCtYsc+UYfqTZCJnwrQv
         90TRp8unY2sZQhgWhoEYgUDXDUvNTN8SCHhbhL1M673mG7Qj075rWs6npLCoyfnJX1in
         uNeg==
X-Forwarded-Encrypted: i=1; AJvYcCVgIanglt//omj9zqfT9Ja7KP5vuHk2sRBTqVxCe5Yy8uhnq3HqowPqzctwkAL35aL00vjE12iWX3f4iXih0B2/Cxob3PvozJsPOD7mLg==
X-Gm-Message-State: AOJu0Yy5K965R6WsXvDq1YueYG/aaYoubHbgLQkuNRf3skjCs2V9TMME
	bZD3kaRkKzPvej5UIqXzRfASgCnoczPkuh9HiLflOYAMvLwk0sllxu8FlfQZ+wo=
X-Google-Smtp-Source: AGHT+IGuA3HpzTHNMT/KEhcYh1+21MTcVQqktl2nFqKCMu6Crq3nALckLhb8llyF03hWv2ZWQZuwwQ==
X-Received: by 2002:a19:5f5d:0:b0:513:202b:9001 with SMTP id a29-20020a195f5d000000b00513202b9001mr2415854lfj.6.1709855825593;
        Thu, 07 Mar 2024 15:57:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:01 +0200
Subject: [PATCH RFC 2/6] drm/connector: hdmi: fix Infoframes generation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-2-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0xTy7u4ldl8TibzkLZodtG0AmzrH8EDBIk+OF9QReyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROOz11Yb17TBIupmYO+n6/3qc16U9eNuJjU
 v4r2QckfeOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1YZLCACtlXPIfPPPrGFH+Nz6Yjy0fxuNUleNqH5GonV4FFU/dYWXJRxcS/bVgNct+zcEbgumRv8
 vczi52rS1IMlex9j9k8OdBEvaHhuF8LurhDtgMtGS6C8f0G1CrXOoQyCKLOH8rY6LTe+U2hZmtx
 5DMbvRfXvZTxVMnt4igberndjzbs8fbLcNzWr+1DA/pZhnLoDOjw82O39bL3Xt6S5+EHcMz23uV
 AEWZ3i7NJvubGENtn8kAWZb3gkpWSjTiyzcR0n+rdD46gKCWATosfrv0Jzla7dXnqC3lsg2V3WU
 49VrOdL7kXp08E2zPFTkScLuhyCIPfeXMezHaGI2QRapFENz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Gate only HDMI Vendor Infoframe generation on the
info->has_hdmi_infoframe. All other infoframes were defined in earlier
HDMI specs and should be generated by default.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 46d9fd2ea8fa..691efce9661a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -1025,9 +1025,6 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	ret = hdmi_generate_avi_infoframe(connector, state);
 	if (ret)
 		return ret;
@@ -1045,9 +1042,11 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
-	if (ret)
-		return ret;
+	if (info->has_hdmi_infoframe) {
+		ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1208,9 +1207,6 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	ret = UPDATE_INFOFRAME(connector, old_state, new_state, avi);
@@ -1233,9 +1229,11 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (ret)
 		goto out;
 
-	ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
-	if (ret)
-		goto out;
+	if (info->has_hdmi_infoframe) {
+		ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
+		if (ret)
+			goto out;
+	}
 
 out:
 	mutex_unlock(&connector->hdmi.infoframes.lock);
@@ -1269,9 +1267,6 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	memcpy(&infoframe.data, frame, sizeof(infoframe.data));
 	infoframe.set = true;
 

-- 
2.39.2



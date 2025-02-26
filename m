Return-Path: <linux-arm-msm+bounces-49457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17537A45945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A89C7A80C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0314238166;
	Wed, 26 Feb 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TabCXKOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A79238154
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560384; cv=none; b=JURz0Nv0DsS5xjIkZPs5uyRGsp3P6L67x+YRJWn8e0pUQMcuntxl/p6OBt7JTVnJso9S6TObGwhLCtW93QDL9Cjk+zvOgKaJkqTk1S5BYt33aYyfaM7d2imIvWwqk0ASHWdbbvc4dWu8qTbck/b4AUiodOF8i0VAuZZPEBmr5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560384; c=relaxed/simple;
	bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkesaxEA1Hs2IpN4p5AGuDbW7hCYsXtlIds8CY2uU6tQ3PvMZSWlf48YFLtAN/SXaAFG2OVLcvv6JCKnpo55U4afSpP+OFavigivCGENaig9Ni1m9xSWGdSzqJpa/XIaJ9YE83MCWr5eJdJqggROXkCx+7BGrpnbNp8PEnmavkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TabCXKOo; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a2d4b61e4so48084311fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560381; x=1741165181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
        b=TabCXKOo6cTMFHArUU4PqFzzcG9vtPem5ac4jUtUSHQptsT9bt1t6dJaTEmPnfzPXT
         nejdbee+Ri8uGhciQFhbpENNr/k/b1v49sSe46GyEAnULJDyT/JpsK1MTAo2CLRKiaNm
         TcoZeBXGJy3ucp61rxdhJSHaRCDcIWeKWSF35wKLeo5rS2PWtBG2HqVaOWd7NdeTN98b
         hQObmtUz87AwhG0fqduqwFwpacmCTsHbKbQaN6xalGgj1skKcx+OBcTHyB11FFOTEHxU
         B/6NHGCzMn1NxBMUga3GOxtHregOJGzMzIwBXs9zGTS9UMuzxAWC15HPtmoo0Rs5I78i
         9XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560381; x=1741165181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
        b=pOkzJK1/bcucWj7UgqbjfvY18k8faGivcf7IHprKYCbAY79t0rrLfePdTl4wEuE47G
         5Gy/U/f/R/q4WFo7k+C0z7TWPaP4jGZFi41Uw9ENOaw4U86SeaYsSRD4c1PdZq3FdF9k
         9VACZXMnvmSZdo30YSWmx6P6EN7F/z4Lg5vC5oaZZ64TqAFzQ6AIxS95P4mCvriGe0kv
         1y9c4kSqCPlKkpFVa5STrL9D/VxXrHAQazAXjaAHYB8o+V1pUevYICm4hUvIsPsHmIjb
         o7STs7LoFUpaElAzuSb5XPuKfJX39cKBkIOpjTO7l3Y8oEjBaNxJGV7/qqDEQey+UYp2
         nuwg==
X-Forwarded-Encrypted: i=1; AJvYcCUUwEyyHvuqNARjmmbc1Vvk8IBkxmSCslj1fkTktELUHDNjpK17Xkfinf3TxMZoDcL7xyrOflFogXr1n4hf@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7jkGynDxbmqWQPa4rLqreG37RP6utDWloDQsscQn2a3E1wkz
	QfgTdOTS7eVMDbGyxAFFnfxwVfQEWKwJXg11xoDKVqbny9+Ye4xT/iKOlSA9QFc=
X-Gm-Gg: ASbGncsqDf7xVWaHeh2Mk4k7MQfcJr6sq8IlCExPBG7LoZs01U3IsTvhQzaV850/Gea
	10aP4qlSFvEPxX9cB5CBpP0lkqxlj3SwMAj3U3aFqCT5Xzh6+zJRJEY9TTtGhr7HBCom1YlLUuf
	mg9U4H+M5HyjcbTMTWS8cgI1vFwVeHVAU0E03HmPVCF7WWnz0WuuLAWw4cOdxxq81w4Up2Fxujq
	TIfy4Se5ZfDKyCvmttKyzhTcRWliZ7fklPYc1LZWPnXJOLStu6TmYMJ/OQ1RFxmbeq+j0v999IM
	zB8nfTnaKM9sQgnu1hKEDz09yrUwMixg5Q==
X-Google-Smtp-Source: AGHT+IFIstiUWb828AgIqSu/ljVx7698UENLpRl0AsY21WG4mplxCihJ20chMJifNN+VTAFh8RwL3Q==
X-Received: by 2002:a2e:b609:0:b0:308:ec6f:7022 with SMTP id 38308e7fff4ca-30b791832cbmr23531521fa.17.1740560380799;
        Wed, 26 Feb 2025 00:59:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:59:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:28 +0200
Subject: [PATCH v8 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-5-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftzKFbgYCMbYXDtuTbkps1sLO/1BiE+TJuB
 fQwesvAqTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1TsuB/4pVV9CMv49UiMTJIEgL+qiw5buub248rfTYgGygTN/itp4QgFwwr0+m/bI+EZhR80wdXe
 SeTxFF6CBjSL+yR+/JP22/h73WF7RhXo+92/5L+l57liwAENoxErqEu+5X19KIwKlbxnXRNh007
 YEA9AUa3SFYTENk9t44L4glEILLtjW15xp5uR+ImONmslyIE3nB2sIKusOUr3VGXTY+AAMCTNt9
 nfPZckgIIHRwEgyAFl55ZRscpnOgLWSI3mLS9pWbEPFqhOL9IPnVoJ9z5jcApJJiUhjuj7V1nX+
 BApcipfWgqtuiNniAYB0g+s54XmYhvEVgrj/okw70eq6ru7s
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 1cf1b14fbd919e041fd7ac8a0731d554d4468f4f..0ebb96297dae80940dc8a918d26cd58ff2e6f81a 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.5



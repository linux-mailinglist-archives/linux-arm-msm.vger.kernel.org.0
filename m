Return-Path: <linux-arm-msm+bounces-22671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FAD908001
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 02:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341E61C21589
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB29E4A21;
	Fri, 14 Jun 2024 00:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3+/j0wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349510E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718323352; cv=none; b=XEyuxFqiBzLfdAhplQfVqyzE9RZtDxX6d430l1qN7DrHGSEkaQHOFGMrVkc6JDviNmdsOSEgE4JfQjJli0JP66Prsp2wyfNU22+pLV4qZu7ht01f/r33Oot9ONMQdH4LVjU5QhbxeQmgIRivunV1pT2PzKXhW/IG8GLl4yKluUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718323352; c=relaxed/simple;
	bh=ly28wJZAdwzm4TkEnW8cpppYMs8mXFFUqZf4RJIpHsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UguQ4ADdYs/az+Ypyx8Lw7e4rDw02dEDukxt90E+5u7VIVny4OVseBtJg+bKU0zokKAdRqJwzENDE/PsYJbp7AFu5wdmGIU4dAVnHS9Rlpd7unLTLhOOZMsntgzSRRYUpdEJr8B5xU7shl8QlAbovIB2CZw0Uyj6UAu7PaLNh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3+/j0wt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso2152567e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718323349; x=1718928149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkpCvK5EJTTZ5JzjKWIiKlKTNiomLgsRfQupOZcIcJE=;
        b=K3+/j0wtsHmIvdqCUdtxl8piGkanaqIrcaOSANp77mpMgWWvFvllCyLlpQHcXlcLWq
         rb0gleEo9K04gTBiY3ZnR5kQhLIM6rFIixtUks47vRPVvIOry56Qc8Qt/0LK4/sw7qvc
         VndTRnww1JAu+deg1yadLCq16AeshBg/JfbnDhc19X5dFDBrFNhNKN1kz0MccLMKSrzv
         vE5oFpMZiiVhNHCf427O/dvccPkR1Bh/fzV+AcxA22yWOzRCbsebQotEYOuXFjQUg5h7
         dl/D2u8jc4mj6+wjEkvhKZt1YIxupNM6Xpn/afrBKPZ8N5R0dNVbFmkNlx7cej7xGSbG
         0sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718323349; x=1718928149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkpCvK5EJTTZ5JzjKWIiKlKTNiomLgsRfQupOZcIcJE=;
        b=AyM1pwL/i4rdybZAA+VgWuVWnPPD55+qiiTwvxPSk0xad9spuRYoahwxwobaAay7S3
         0g9LFVdBokdG5KwBPVvTIEOG82a1GSwkHajE0Ac2sVuPoXH+7u6hULOiMvo7yQUGfuTR
         M6SUyw0kFn2DXiGKC4mD0362DTqB4Q0E3o62iQPr3ctK0Gdb0bWm9f4e0kvceRZpvqF0
         ZequrpdBTGTH6V0ewOBq2m24H+aIIp0IV3sKC0KBiQXDqBHXcv4I6fJQGtyyhH/5+R26
         6Dzk01i2Lwc5DGux6VCzQFGakKJxqkQHNBoLWNuE76xklrjMQgr40zvPFJdTpglJWNTK
         L2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCU3OB6KvSd+1xbbyEmXoZwk/vz7LvQlHcFOOEV8Yyqlc2OYT3wHwgpHkIADJseUTAuVbdYDQNG8BB7dM2GfdK8pYaVom74sOoPFigsHiQ==
X-Gm-Message-State: AOJu0Yx/m3aB1Q1QqHuErW90surgg/OdddF7GI8yneL3ILmgtadESyFl
	f9GGdvRXkRU4T/TagBk2CPrkFmKsabLRZ2uQj+445zDjTmCpgnIrH68yad2FsLY=
X-Google-Smtp-Source: AGHT+IE9BLBhYpbu8JV4xf74wnBpCPiJUBFcxX6WNhMf1mJ+tJupZI8mMcrVtFEFb4OG5G8Qwnt76A==
X-Received: by 2002:ac2:4ada:0:b0:52b:c27c:ea1f with SMTP id 2adb3069b0e04-52ca6e91627mr570592e87.55.1718323348734;
        Thu, 13 Jun 2024 17:02:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288804dsm374797e87.262.2024.06.13.17.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 17:02:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 03:02:20 +0300
Subject: [PATCH v4 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-edp-panel-drop-v4-1-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ly28wJZAdwzm4TkEnW8cpppYMs8mXFFUqZf4RJIpHsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4iSY+Yydhiuir67MsMxJdnd2Q8Ogxxf/FjtW
 28+90lvPdOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuIkgAKCRCLPIo+Aiko
 1XGACACfi39l6OxtT8igatdQccpf9x3vBJq5skcjoGrat0PbMc8DgVkX7morDBPARu7RHfFBkNt
 xzWrqoHmJ9vkgMf7bWLP2q3A8zQ9SMJGxTBEbsmVRyPuslO3LWe1HlYzG36+7MGTSUMqB5Hy1Hx
 9uBx2CMq2UeA9QgOBhA+ma3H99VPMjzDcGsN9fQ+hj3l3CmSou4/L5TgjBBBTSi1ppdHYEWX/xj
 2ZQ6qOZNY8Ob88E8By6lCDov3+bjsItFrHkDGkCDE5ru1jQO3LRIVz9/+h7VZHthy9Mw3jHCMuJ
 BpSaGD4Fr8p5MkT4mxWughrf3EM4IMkuvAdfwd1kPYbMMGAV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add a fat warning against adding new panel compatibles to the panel-edp
driver. All new users of the eDP panels are supposed to use the generic
"edp-panel" compatible device on the AUX bus. The remaining compatibles
are either used by the existing DT or were used previously and are
retained for backwards compatibility.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 67ab6915d6e4..85edfd3d59f3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1762,7 +1762,24 @@ static const struct of_device_id platform_of_match[] = {
 	{
 		/* Must be first */
 		.compatible = "edp-panel",
-	}, {
+	},
+	/*
+	 * Do not add panels to the list below unless they cannot be handled by
+	 * the generic edp-panel compatible.
+	 *
+	 * The only two valid reasons are:
+	 * - Because of the panel issues (e.g. broken EDID or broken
+	 *   identification).
+	 * - Because the eDP drivers didn't wire up the AUX bus properly.
+	 *   NOTE that, though this is a marginally valid reason,
+	 *   some justification needs to be made for why the platform can't
+	 *   wire up the AUX bus properly.
+	 *
+	 * In all other cases the platform should use the aux-bus and declare
+	 * the panel using the 'edp-panel' compatible as a device on the AUX
+	 * bus.
+	 */
+	{
 		.compatible = "auo,b101ean01",
 		.data = &auo_b101ean01,
 	}, {

-- 
2.39.2



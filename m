Return-Path: <linux-arm-msm+bounces-21367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2948D6A74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED7C41C24783
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAD8183080;
	Fri, 31 May 2024 20:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOpvlwrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9F181CEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717186060; cv=none; b=ukhicdQngfe3gXSz8z7m8eB8KwV12vMWfSiDmZFeQ2lvHWGNMm1CqTf7VEpNGC/DlBPVtE5B9BJeNCph9YVPmqca7kD81WSPiEiPye1tXie56opoZW3vNOrTL8JzwAOH7b9YDuhOvjA75+Ym+oCY7oFAeTgcAWFHIMSWOpWSf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717186060; c=relaxed/simple;
	bh=JXbaAkUfXwOLePC7VJ3jRbdq5WguoXJxRCdZfMDCGD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPbkr9nkBaQcZuZU633LoJlqPLyp0dp5RasgO4UIupdiG0rUU/juasCKaI6NG3PZF+EXI8pXby371tax+JAqGJV0J8H9YlKQV2xhhMLTsHxpkr8epEdBIc11cpaye8mOugnn5+h5Oe4SW5jSFA4moJxQClr2U0xjmeEb0KOzMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOpvlwrJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso37298011fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717186056; x=1717790856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
        b=uOpvlwrJVhBo25LF41YKDPeEv/T6lO4ZpXieYs7iVKYKt0uGHQLbUHjSJjaqGqKUw5
         CO1v9BrycAuMWNebLv4iPJJVGaXt1ZzyPIJrVA8Qi2szSvvvFJ4rB+gq+1uSSiMaTSTj
         gjtRt7tskohh0bdxYKOu/RKfPUa/MPl16raL8uJIALzp/wTrKGthsjwHWMljtcu2h+Bl
         e7/ibVLN4AmuRl1LlGSXQ8RwjUVuYgUFkn9w/Gwslhg9gE25t9HINeG4Zf+laSOdtYa9
         cYPRZKcDGYKOpopxA0AQrNe+Cs3LZFzcNm4ogf2ytk9pqhnjZITmyBKzoz7Qmtw2eAO8
         Xfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186056; x=1717790856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
        b=YFbOXgGcqQdOYEwzczOOEp72PK9kRwnxn+XofwSg7TA73P2Kwcq1q0irjPAxWh/91F
         pE6I9yYBOImcRBlyHKvxElqKfPYxJcon+Rh3AlDjTUGwN0ytidRRKGW/O1Duo6HxG9Gl
         hd4u7w/allzXdd3ZhnfFMBmHIHejXngM0dbghYnHiqy4w10y6eb8PiGDKNnv9kXvAR9V
         WsJLNcEgtzIHYdG7Hajw50e6TlLDIoE0unfywHSKuS5vHhp/cOtknySpi9RLh+zNKVrH
         vEa9oBCzOhC/gMQenBTbjMv6ocb81PX/3vqTqga9vbxemH6azKn/cLpU7JW57ALMoxVR
         lK7A==
X-Forwarded-Encrypted: i=1; AJvYcCV6HP9toRqtS4WcFtBRe0hWGjOkJHYFALallKuJQiBACwHPymRbhvYgyacuVzGIWC6JgcToAfBx49YVtzj4fGpoxOwsXuEt+5ZIGV0nLw==
X-Gm-Message-State: AOJu0YyOXdCObXmhKK9J+kroycdVJvkqlvxqALkcmFy6muoKv2qIFb14
	sFWafZYxiPQ3/pUvZGPdAyXILU5wu8LM23/J978acQziojnnruiQ4/jJfBUZqeI=
X-Google-Smtp-Source: AGHT+IGIMq/02fN9VaMxPRgQS9gadWvjnFmtbHVzXgej6CyCQ5quwaOEwoTQOwiyLNKP/eeCiAydgw==
X-Received: by 2002:a05:651c:2112:b0:2ea:7dc3:bdc with SMTP id 38308e7fff4ca-2ea951ddecfmr30202261fa.40.1717186056564;
        Fri, 31 May 2024 13:07:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:31 +0300
Subject: [PATCH v4 8/9] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-8-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JXbaAkUfXwOLePC7VJ3jRbdq5WguoXJxRCdZfMDCGD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4B4ZlhVOmXUjUHCWOqtnSa7ILwA7r/cU3H9
 cpqQSneAaOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAQAKCRCLPIo+Aiko
 1VmSB/47l6orxp3up1rfCwe6PSVlP9Jfe6KD6YbCaGQ1HbSxcOEBCOUor73qVPIK1d5jN61Sk0b
 6/vcmaA/8ip6UhoS2yfneatbS9yUOksIQeJqN1rqAqTCUGYFKKtesmzdo4v9g6lCOlsoE64l+SC
 dlXfxHwBOx3h0RV3kvTrmSU75ugnl1LnjLsEYGgbapjupaQK6rKrmC88/mdjK++P+gh5fKSKgKD
 0SKf4IPVIr50Pu4lJVZh/HKgrzNF/ubBRVMhQXARdw60pShnSL8PTMsbcMb6WjoXwhTus/tjbJ+
 dBdzTv8eYSbgRDv/3FMYPp+5dpdbUQLsKSOfR4INxPEgf+xr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 6c81581016c7..fc711a842363 100644
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
2.39.2



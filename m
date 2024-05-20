Return-Path: <linux-arm-msm+bounces-20060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B449A8C9CE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29FDBB22212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C2A54BF6;
	Mon, 20 May 2024 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFRdGOuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422353E25
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207170; cv=none; b=LJPjGRqjYMCtXTnaBxha1+peJuiXgKDOQXzttZxi15lYMRQNN7PmB8lHHOz3zTC1A4E7hddvt+MAQYmPVmA4tukRdVKec5sVZ4Re3OEkYerORqBshC6IBNVYQBwE/lwQGet1zjOmfFWz3laHqxMiPYJm0T2RabUldLsrQNYDJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207170; c=relaxed/simple;
	bh=jse+EfinCh8AnjkQx3C/iJk2/gtirSq7agUZaG5U5so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFEHCQVol1+riAmr5O7FtMeomsEgBBkJW2jGDV3lWUlkeurBHNzgUM9G5uUYME9B0EvGhDKdqQT13HVJRQecqNGtozUIDlDVtNbIdlok4n0a6qQvbk1rGAqnj7xDuvi3Xtx25W9nnIhuKw0Oc1h+OWUBIOhYMbJKVR9o4n3RVTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFRdGOuF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f1e8eaee5so3697441e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716207167; x=1716811967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5zLKnMtRb2Yx+jUatqEm2tktsnKzIpv+CHT4vbWSNo=;
        b=UFRdGOuFXfIeuzvDBn8yMb888J+m7NbPIMOIjkzu0D5biRGt0o9C844GYDuTMCJjM+
         0KL9ZJ5bG0O/p07LcmOEFK0YVz7spkIWI4Y22T4+Y8J+SiEGKtJmMr0dNo2nCbpOuIm/
         UL6KZfupwAGH8q23aAuf6C6MghXSCwoVzInc6kx5tirXYUgzHgKZfGxXHuX92rUJEJQ2
         1YIFwBjOEU0Pmknyzk1SSxVGWm8XY8cSaBnGmOP4AY+0KkaWnYvQD8XPeLY9jgv4hllO
         d2H8myltyGi9RZJe5ot6Rp2RAlHHxIYgFU8qsib6MjtJhCNsL2AZ68y9exPXAuYdUR99
         swmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207167; x=1716811967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5zLKnMtRb2Yx+jUatqEm2tktsnKzIpv+CHT4vbWSNo=;
        b=Ct8c+77aJXpr9umeLCI/WWPLjEi/AyFWxegJrEHm1MEHuO9HpVrfdCZwbX45G2jMdG
         gMg4r7uC8bUPyBABF79OJSinW88MSssawtEwzGTpegHOSpIL0IvRip9AUf9VYqwWFkin
         fkMHDg6oUPKnr932SayQy8B4/l3+rKCi0INPZc+n2yBwunmQuo0lsrZMpjn4Ie0Udatu
         iOntl/xo2yy9/4m+//OqOZAhcYM2aTfPw4mq8fenwhffkpzr8cNhiV+LIXxmfyBzsS3t
         GUvPzwI+s1nIimJ5AoSvIebJ+wMR3e7VJzAK0AWfnbCxSqyD/cFzAJCVpzEAuMd5KMOM
         wRig==
X-Gm-Message-State: AOJu0YyRWc2IGIXOnzhew/z0c5aYNMR3Yn3n9RITH+VP58hTufY8bVud
	QjdIuVdSjA3ADxBBD8v+Q6cQNBdxrpIzmsj8vZf4xq+XX4mt+ofAd3NXoWiJcRc=
X-Google-Smtp-Source: AGHT+IFmCz2UjdpX2jReHWPeQmSe3l39pMsynvOjbskQ/rKPTL0Rxr5iRCVGRc6KIMGt0K9PVz9jrQ==
X-Received: by 2002:ac2:504a:0:b0:523:7680:d07 with SMTP id 2adb3069b0e04-52407ac106bmr2029575e87.6.1716207167313;
        Mon, 20 May 2024 05:12:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:12:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:43 +0300
Subject: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jse+EfinCh8AnjkQx3C/iJk2/gtirSq7agUZaG5U5so=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48jwip4m8plivDyhrPuFWOv0Ug1EGy9W0K9
 cDJzlc2sZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1Y8uB/985G/uHWGA0fZD2EfZLAaCrUvpeIOFfLeCFEa028C+6blQHf0FSdKZqvw3Zj2Pzfptf9k
 4mn6ZhLgH3HoSk9Lur7syvZFJflVZn9Zyxo2U9VTjxi+78uTiZuZevLadDhhwvjNTghv6uqvqMH
 oDXwGp6eReQbD5gvE+TYsw3cn/6zdGzRcus9oMvln5mkk91k/aoLNpTaBGJ3y5wREkYW0xC22QB
 NTKhnNxwNfYb40pqUpqyMwMIXJp4dwrM8pITaxgYhp1RoskLo7YpNb1tNMWTSmM2LbpkqXyb4zV
 Zt71RD+a1F2Wvdbr2bBMwR4o1PYlHQF+NVi+mylASA5FrqWX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Command mode panels provide TE signal back to the DSI host to signal
that the frame display has completed and update of the image will not
cause tearing. Usually it is connected to the first GPIO with the
mdp_vsync function, which is the default. In such case the property can
be skipped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 1fa28e976559..c1771c69b247 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -162,6 +162,21 @@ properties:
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
+              qcom,te-source:
+                $ref: /schemas/types.yaml#/definitions/string
+                description:
+                  Specifies the source of vsync signal from the panel used for
+                  tearing elimination. The default is mdp_gpio0.
+                enum:
+                  - mdp_gpio0
+                  - mdp_gpio1
+                  - mdp_gpio2
+                  - timer0
+                  - timer1
+                  - timer2
+                  - timer3
+                  - timer4
+
     required:
       - port@0
       - port@1
@@ -452,6 +467,7 @@ examples:
                           dsi0_out: endpoint {
                                    remote-endpoint = <&sn65dsi86_in>;
                                    data-lanes = <0 1 2 3>;
+                                   qcom,te-source = "mdp_gpio2";
                           };
                   };
            };

-- 
2.39.2



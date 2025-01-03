Return-Path: <linux-arm-msm+bounces-43889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF36A009A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BC9A7A1943
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B721FA8F8;
	Fri,  3 Jan 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Udaxm0V2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F145F1F866F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735909135; cv=none; b=ipAAvwZCa8l3tNPEpFetvPJin53vdDbZnMTVVfwm55Sl9dm4fopXjp+BQc7OM/QYpEbwyVB9IVGi4ZPDqD9ll9I1Jiyp08mly01o3WSYd6AQLGUjCyn57pdcciVztA3pHmWa/6fweOQsiW2pM0nPBm3MrfaKAPYuYvMtrIZBOWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735909135; c=relaxed/simple;
	bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPmdH3RWOjUQah2KSQa8oOOw8dTxH49beOOCxrXlcDlxYZm7TvAnfuKHqCMjlVCdPxFnpuybIbE2qM1b9/LvP0kbKifwCWTCvYBWyR3X0cpFkfijJt4oAB/d+OSamhu9ctHYWtSIyGS/y1kblEnndVw7jyZAxoHuf7dTQu1Z11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Udaxm0V2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso88834035e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735909131; x=1736513931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
        b=Udaxm0V2Zx0cNb/iCDGyA9CmcOVm4AMc6/bIfHQ9X8j+NxUQ01n9EazJMkEy7bc56B
         EdyD7TWoEQJkEAfNAg0Jls3Slq/eYvNuq4CUv2t/AsG4bwhTtTKi4pXSxO98JVaLuxw8
         /Kvp0lZOwkI6frhmScrNY7VxFS43rIpoUuQWkU7K0F17/9OIzDPhJdV110J6OdQK1FsI
         FNaHDOePMJYZSd+GKjuHhWXMQz84ClWRHDHVsnUXutfDEpgU63UVQvFTORVzhoNKgM5P
         w7xjwGW00MZALjWf+vJw8ymKLhnV49hSUWKrgN9HQ92CX1q+4TzseOysn2Hft//rm2lV
         vNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735909131; x=1736513931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
        b=ECx5bUd9LKBAEzOcZKtUqoozlt4JfgabPl6EGNeK8b3h1+CqlirbjSpifVMSVZJ/tG
         IgP3qkk3Tb1xpADA2xEp5ZWDkJxN0ObEe1wMN2NZ7smyk9UbVW3jDa9qZj896bG5bt7V
         jpSZNXkTWlj0Jy5JUeKqyLub1XvAyvR7P5cLycDrYpQmrt5hY9SuSZLMlCEEZDsjfYVV
         Q7sc6O/I1VLP6LI52qH7wUDexLUqmYHvgmfh6nh0ea8oAXlu8ZKc+Pj+4b7tVB/QJAlx
         97yG82J7IdyZ+8S5aFM/zYRhCjEC8WGraHeOJG0RbhK4mwshnX7Iio2s455xhknRKNFS
         +VYg==
X-Forwarded-Encrypted: i=1; AJvYcCXRc6adzf1aXTRcjn6BNy41w1NOyjb/hFon/ln1ZSzk8V4k3K4vOLiRokVOBuL0+HPh8SJcdVjgSeuwr0Xc@vger.kernel.org
X-Gm-Message-State: AOJu0YyTP7iY2vZqd7BbtEwXMpTTlBFifsROWR60+826vt2ll6/rIesg
	8sFoR8IXhWGVGZjpC/yJQ/oQhDH4Rx22QHEEitNmMSLqtwmgKjW1n283fKHkYyk=
X-Gm-Gg: ASbGncv4UO7BzgUY5MmdbVsyheq0yWfEhfmlH1JIJy2j2QgBPqfC145zPqFITGtElA9
	p9TWSSDrs9ycz+rnAq0Z3VFAXIxXZ1EmgLB4GxMRWIc/Ks+aBrIgVPcDbYnp5vAUJDRrt0lKza5
	ltZ4FMNi9CSIkTYyaribIE/9fHj+U7YipIkL/c7qDdbHUPe52BlR15NrIDDymFRxeTdjTMHAOmE
	IGo6Qu6gdK4h+WbfoVHu6T7MLfkU/XuXWpC8wP24OaukJXj4UPoly+L
X-Google-Smtp-Source: AGHT+IHuqDHnHcd3WF9fZflWdy+Epup29qUDvzgDke+6NvPjnNnt0l09UcQvUzjj7ALc15cgq9nQ7g==
X-Received: by 2002:a05:6000:186e:b0:386:378c:b7ec with SMTP id ffacd0b85a97d-38a22405d3emr42892574f8f.58.1735909131268;
        Fri, 03 Jan 2025 04:58:51 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:58:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:16 +0200
Subject: [PATCH v3 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-2-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98By7+7V5W8HMUxlKldGyiQrYwuq4jO5Of1X
 B3VQSkyoXKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAQAKCRAbX0TJAJUV
 VuApD/4qJrXPMuVFlu1Y3C0w2QBGNOwC8Kd1/O1an/dVPfDmHFzp1BN4X5XeV54FXsFUPl7z/Yv
 CLx7tlv9WL2kvIqM/n93QJkE67uOATYU1pcOPkmnQc8HZ+x5JN2QZgyD3saXpcv2UUEzEMlcxY/
 KeZHgN4TKA7G4LZHG79/0tYd26xSR0HgOOpjD+ltQ8LCD9rF6zY4TAgCy3HgzrbQvBG8c++rQRA
 He8crsrdI25Xh1uXL+YuieNyNP6OwxpYfxbUcJNEbmfK66CDf7vHcbM8uyzR6+dq4DHof8D/VRv
 LL7F5L7VHvN5ysvlCRTuEBRaZ+k41TLkkCW2C2QABpXk/NE1Nc6honOz8l0kOnfxuKK6xqg+tgk
 5h39FDZEaMvbkcz2JD/Cu6KfhgNiqMeY/UzReYHNDVoK71OdB2ogBcdujH8tCQAhHoE1t06Civ+
 /x4fsT3oyE6IKfInlIDQq0rpK+4F6eDNwHFBJCCp0lIY6XWmTk1ehHrySv6zH3z2MbUJBNZsKQ2
 GKQO9QF7w9OgfciGKtoKNptEilU9MO/yIyih95mVXG97xYdGt1QwZqD+MjLVoihfhl9SiavHziH
 VbIalr2poTpXTXVQZ67PSqmogwtYx5ba2nwdNhrOm9hu8tu2/sXkpgUb5g86pQo3WI98DUoS2ak
 dzODu9EtTIz9otA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1



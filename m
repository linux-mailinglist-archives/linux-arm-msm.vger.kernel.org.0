Return-Path: <linux-arm-msm+bounces-14284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F387D64E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 22:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6E91C20805
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 21:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCCC58211;
	Fri, 15 Mar 2024 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lu77+Ek9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1F95676D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538670; cv=none; b=QlBhBF7dijIJ6xw3IRbwR3jYt5fXyp6LtOD2pYgailWr4KGi9AQjPuSp9aZkhVlT3VUpsWIN1vIfmcR0Vlgo8lJ56/qUR5U7XoBnZSK1H3tooraN6l0KJFJ/Jen+lWG4HUDQPvVB4Y+rtotofxFjef0MWY3YyIhC9sDGqZ2rZf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538670; c=relaxed/simple;
	bh=acyFtJQRnelnWZYDGUSGDw6BXQBKRCxuM7aVkptR+Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDFp3pIJrv+FP94VTBHR3bkxxOYX+xBlPA1+qOUpStvTsPpxMiCbJz6bFGuT1/7NxAYREXP8P1FuJpy5/Wt2Eumc5RzIkqrr2KhgEZn1HC7o523ob4gLEqnD9oJdaOsa6pAaNkneeyNty5DLrF44f8uTt6facbWgj3JEE041N0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lu77+Ek9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6b5aa0b52so2325097b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710538664; x=1711143464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b4mQbGcIQsTKsNYPQB3QvL0YJEVDJmGJzSl3gUd7iE=;
        b=lu77+Ek9s4dF2Z/zzJS5bnscpZ2m2JM2miJOrXe0pY0mT1wjHVzdyxGLLAvnYwf6QN
         l9zqaWHNorYJuBfeTsMrz76PJY/7VXO5vWuJzBUEFRUDDvy6kxaiMnnguluoxxOD4Rmu
         sQBykeNnFxHRYQivD8A21MpxuKyEfqjQUzINs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538664; x=1711143464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b4mQbGcIQsTKsNYPQB3QvL0YJEVDJmGJzSl3gUd7iE=;
        b=KYwAsD/6mmwtroULtAmwO5cLjeFwsaAftd9MPxWdwIn5pi2vDNxWIDZczv9u2eNCR0
         E7vJeEHa9e6/BzZ/JjPcUNyxiMhadkDtkRW3zP3Yz4c5JRq8QYSe5ZZu5vgNeo/mcr+I
         w2sUYgd/rZK2Kl3ysqO5ciBoi8NOaEI6zKD2Mp/MUHZP13Peq9bdVYgFgsWzVLeaoSPS
         OsXPkICtbVflHN0zZLEv2rgODI9AupJopv5gC3WGjPZjpJ/AAZ7e0tAC602d3cNrkRJn
         3dVNVRUbMYAy7rCkon7MsvgtoxnJXvDKHa63xHZFvbCS2bFYRiR6BsLMiOiZVqUonJu0
         LVHA==
X-Forwarded-Encrypted: i=1; AJvYcCVdP7RnBNABCZbRaJa11/XUdmSWQdpBNIjWaY7pyohIWoYjtOPZ3PEH22y6Z7nV7Y751S+EC/n2DViliT7gfWgAjuAghSLVzsEUZ7Iw+Q==
X-Gm-Message-State: AOJu0YzwyYF15Line/aYAemJNs0pcMUxZUHXJ8v5qsj9nJtvGTMGz9mU
	JHG/oRQpe4hmh2v/djyJBw7CeWGBG/a40LCEIBNWDGi3dOQZbsIB6hy52aFkLQ==
X-Google-Smtp-Source: AGHT+IE6dILwhQwRnscQL2HZqCpcQ27ndmx7cXGzDQCIBh26yGtAACsBjiXvN4gTm/UODHNKDKm1Kg==
X-Received: by 2002:a05:6a00:92a4:b0:6e6:5396:ce43 with SMTP id jw36-20020a056a0092a400b006e65396ce43mr6495390pfb.7.1710538663984;
        Fri, 15 Mar 2024 14:37:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:37:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer
Date: Fri, 15 Mar 2024 14:36:31 -0700
Message-ID: <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315213717.1411017-1-dianders@chromium.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before the introduction of the wait_hpd_asserted() callback in commit
841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
that it was up to the AUX bus driver to wait for HPD in the transfer()
function.

Now wait_hpd_asserted() has been added. The two panel drivers that are
DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
3b5765df375c ("drm/panel: atna33xc20: Take advantage of
wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
no longer any reason for long wait in the AUX transfer() function.
Remove it.

NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
optional for the DP AUX bus to implement. In the case of the MSM DP
driver we implement it so we can assume it will be called.

ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
causing long timeouts, but it's still nice to get rid of unneeded
code. Specificaly it's not truly needed because to handle other DP
drivers that can't power on as quickly (specifically parade-ps8640) we
already avoid DP AUX transfers for eDP panels that aren't powered
on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
eDP panels are not powered").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 75c51f3ee106..ecefd1922d6d 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		goto exit;
 	}
 
-	/*
-	 * For eDP it's important to give a reasonably long wait here for HPD
-	 * to be asserted. This is because the panel driver may have _just_
-	 * turned on the panel and then tried to do an AUX transfer. The panel
-	 * driver has no way of knowing when the panel is ready, so it's up
-	 * to us to wait. For DP we never get into this situation so let's
-	 * avoid ever doing the extra long wait for DP.
-	 */
-	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
-								500000);
-		if (ret) {
-			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
-			goto exit;
-		}
-	}
-
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
-- 
2.44.0.291.gc1ea87d7ee-goog



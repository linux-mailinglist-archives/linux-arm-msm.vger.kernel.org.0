Return-Path: <linux-arm-msm+bounces-109115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULSOCD0jD2rPGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A242A5A8360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6848534A661B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA50A36A371;
	Thu, 21 May 2026 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IsCNdlw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81887368D73
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374826; cv=none; b=NmfjsnZvGOlY4qlis3ZaauxyN4t5s4BEYosCL1fzTRub+Wa/e9rg+fXeMC+kWsSzQ6xGWI9PKmCUMt+3SqwpxfqE9t76YjuYHDz4T0kY7RVumEqqBXwRp8HXcNK99xplYnqZKLN13DdMah7BLLy+FkrQjz2TDs2E7D/jrJivhs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374826; c=relaxed/simple;
	bh=mkr0K1mBT5RxN/+YTqKfY48rfoOCEL8C2meJua6xkiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/wOwhvQ2+iCLCzb3vzc/UcgcdcVhYosLtJqLO6pmpSXDJYsR8rorAJbBg2wJyTJn0BY3WQm4tdMV5Zr+jYG22bLp4DhcRqDMYT6K+r/IWqGISu5zCfSy73Bvm/i64y1/Ar4fIbavxJL5kjY0dNO01RAr6Mz5m1bVA+fi4fdi5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IsCNdlw0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3664df32e91so6692715a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374824; x=1779979624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2YtFavMCVSChLdyN1Eu3nk01mQaCAGqqLzhDnGc7Wo=;
        b=IsCNdlw0YkwyEwEkCwNGSjCvqKHpESTdJGuWuHA2j9/9cJlnCQU7HGh6Z2jOhasCb7
         yieom6BxuTFZIBC+VLhVU0OhsUkXK0hSs7n4AyfeEHwq4wXrfcaYK+IxP1OUCMIPhbs5
         0MOu2QJPC0Ys1FjTg9Wh1DtgdiFmoZGmFJ4iRlYNR4ERMOBvOdPBri2Hrhf45IXobDDJ
         pahlkwiK5Mvey+ZWBZ46fFzI599CoHMfiixWMW+fSk+L8oIe123j0G8miciDm1Lks41Z
         DO2CT7Zzc/Cnlb/EjfYJz/dY6GgYk68jpXsddF7XpjgnL7SNsaTF7jXFiSHfIhmYWFeI
         KkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374824; x=1779979624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2YtFavMCVSChLdyN1Eu3nk01mQaCAGqqLzhDnGc7Wo=;
        b=hCY+mJrcJhEEdPqw4UzFAgOT58z5TKrrgcYttbDN+YEcCv1xyFPPXqbKnpHqV8Z4mS
         GxHwMmP2th8Ptr3Z44dleT6Ta5DgHvqtQZAKUggLHHwZg47iLq1aA886Qxx7hv3YZcFS
         zSvO5eJhORqFYmdI/8DQtHvml+dwsh5Yltxueyt+11LXI79O0O5NyLeXtir75n6JNhSg
         mgaRTpQxIn3W5memkRXY7UQtnxh3MuBwwMeS71kfsJpBraWB4aSF5FWlM5q2/1BJ59dg
         VEGCLbSCRpwUSJ2Ax+oYu4ycnJC8O4CXn0IcFpGHxgaec5O369n/tkBp1kx+SbZ4/IJj
         Rq4w==
X-Gm-Message-State: AOJu0Yx53zhNHnX8/60IphgRzkwYff0GuFl0XZEISiZjB0ad79tVq/Js
	ngc1oPiAn8ko5Kxgkgmk2h5md/SlGKBhWm9klW427FAks0QyyNxnN+HEjJWm/csVVYY=
X-Gm-Gg: Acq92OH1dXqH5uP+/nqVprBUFrWQf2yzaBSkyN9qsa7FL5o8jjtpI6YxMurgr3t43ed
	VAL5gQ3WVYON7+peKqTKxDJp43DjLnDGvktsDFyW4P8RQ2DobIS2Emc8mXzs2gWgpSthsRhsoUQ
	3GbxweShowW+/AjEHlyDBzHCB4psdy2avK6VhV6O7wYUQqF1ryxbg4isvPwrvy8/HRI22xF+k9s
	rUc1h94vBF8rCtjZM+cT7ToLIq0tR0nxYT7i0+/XW88JZiSe6cXCqLkJ1+xajJuW3VynHTkaeDV
	L3Quns9pSte8XTgZMJq7yuHJYsmxmEPPzN4yWhCzlgVXkLS5jx5Ek+lrQ36Ftf+oQ3C7oc7fhqw
	2Esv649yt11f+xaDWbfIFGxxl+cVjSDnjQmRh4SHYMFPqiVhIaBKLgX6YA5xHeQz5VyEmG4DWaT
	b9q2+T
X-Received: by 2002:a17:90b:2e4d:b0:368:b176:c5a8 with SMTP id 98e67ed59e1d1-36a4560d3femr3288287a91.15.1779374823731;
        Thu, 21 May 2026 07:47:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:04 +0800
Subject: [PATCH v4 2/5] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-2-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=1347;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=mkr0K1mBT5RxN/+YTqKfY48rfoOCEL8C2meJua6xkiM=;
 b=5+BFUHgumhowsBls/J2rN2yIsZQXpzOQS6/+y+2Qz3iGix/P7ZytH3k3y+Mg9h5wKQaqlauaP
 LhU3lmKnCkmDIsEMKF+cgBAlPUlB8yMWgxQTqBhhZg4H5n/7FtZgOGS
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109115-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A242A5A8360
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some devices treat two independent physical DSI panels as a single
logical panel from the CRTC's perspective. However, two separate DSI
hosts are still required to drive the panels individually.

Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
allows a panel driver to inform the DSI host that it is part of a
dual-panel setup, enabling the host to coordinate both physical
displays as one.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 2ab651a36115d..889ef1421207a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @attached: the DSI device has been successfully attached
+ * @dual_panel: the DSI device is one instance of dual panel
  * @name: DSI peripheral chip type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
@@ -186,6 +187,7 @@ struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
 	struct device dev;
 	bool attached;
+	bool dual_panel;
 
 	char name[DSI_DEV_NAME_SIZE];
 	unsigned int channel;

-- 
2.43.0



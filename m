Return-Path: <linux-arm-msm+bounces-44404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD72A05EB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAB817A14A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7A81FE46A;
	Wed,  8 Jan 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuQti48p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0514C1FDE06
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346731; cv=none; b=nb3cRQ8mKywYf0S0Mg3r5MC5wXc9OporI0vNKNb9liA9bDy+F2KAqDM6lwwsppWpBaTyfdDCDlNrB/JsUfkAFHvA4Ny6yv8mAbE7jTBw0VkUcRbfl5bjU5MVonfoxag0xO51S1H1dLNPo657ja/6VPhvebkFlZo1TdCh2/fG2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346731; c=relaxed/simple;
	bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8Xyy7Qp3mzX0apzz9llg00gsbAq7yTvrPtSVtNa83gvrR6yLygwf84U13xglI9L8pOcBu9V9HD3m5AdRBSJGiH5h6qFqjoMkM/tzs9usi2OjtgZRn95IcLISV2PrV3VTZb3NNbuGQiQ2ZI5i9X7uY/HR/xcqYVKUWOlxthP1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cuQti48p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43624b2d453so172756155e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 06:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346727; x=1736951527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
        b=cuQti48pvFfPNJ51MW+ys0Ku+Au5RddvLtGLwQcNs8E1sm71Pjy+9rrMoQr9w2jMF1
         ctTX9oceFt0c5OwRE4yjW7f+9GJXrHtqu3BeowwsRC3nHF8eEJkCqekRdiLBOL94Rk2t
         q92xYFEueEkj38MrmlgLMwEq2qIYmK1jDcuFh7br9o6u4rFGbRGTrnQiNBKFjmDuNd9e
         9qE7BTrRdNNis4KJPuUz6yNwWZT1H/5qbupPvByOpJ1lJ2+Dn9Y1yuBJTgmqyFE3r1SL
         K/mFMQe2otj5kMiCI8eRpFmwukc3yGRIFtnB8EpHjLJWRKt9Bs1LTqp7RynzekADEnWV
         i6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346727; x=1736951527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
        b=rymPr/wm9ipfgKNgM5Eb2NLG2ULbtc0gG4d94MgfEbH1fqt1+aSnaqqjsg5icffW3l
         UMKRc+o47lqJrhSTFKunSEcnurmmor3m9sMzZWIjJ6HyKH+xXPExM2RIxijAooOsPTFc
         fKiKS3ab/KrBPkqYWz7uD5sy8RLR5m+SHL54YIk0/+C3t5FstpdLzu7o/qfnGvqDKM+3
         f8JOynWfuh5cKD5ITDWxVd4YAr66arREhk2hDVjEFm3pi7BC0eau0VbRbBMwUuu19QEK
         gcFWOoQ8zpUrHHHlgdcYAnd0kg4JaGXtgv34ny9PGbqgIKoFI6wBUHTSqZ1hwXhhgkYK
         0RRg==
X-Forwarded-Encrypted: i=1; AJvYcCUp8232wpmqKaThXTZPbv5G7+2lglApD8iA6mH0GA1L6FhTSFfb65cs7+n83Rn4yLwsWTCsoCAGwWeXtFLD@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCpK4+U2IFUcjINc9t8X1QB2ygeS0HusWF+ch8WMQtTyTnsxX
	4sZfIJjj0GHlDM1CWMQqNKxphx3DPUiAkMb1j0HJpBkIiJalTvuZ4SlfFQBhmcY=
X-Gm-Gg: ASbGncuuunUQx/16aiY2fvYYcsTEDCuZii/WE3kscoWXOCQDVdGo2JVYBa3+76UmJHn
	QTYE5o5GhSlWr3hX/4zIi25nSqfEpONpq65bf88lDPDwyOF7I+LWejOn1uJYqKTbft/W+W4jiau
	lj7HAQ0vXVLBnJNPm25vSvuagvOIG6cZyhRQKIjSryMcqPLLfDA4rJbTaZt8EDEdsgw7FuPTCGn
	WkrxvkBZggBZDVDvGOhYQWAmjwskaY0W9xJnvxcK1Sm1+kIyyxKa1rn
X-Google-Smtp-Source: AGHT+IEeHzOxvdMOGmcpEKHTmCQ1xR9X2mBdhrRAs090fw105gW9jWt3zL5YMm4BKVnJtfcnbPIJ6g==
X-Received: by 2002:a05:600c:1c1d:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-436e26fbaa6mr23365835e9.32.1736346727258;
        Wed, 08 Jan 2025 06:32:07 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:32:06 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:44 +0200
Subject: [PATCH v4 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-2-918949bc2e3a@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxd1zaADCiqyAG6sqqGiZaCSMDvAko7Z/RAB
 qnzYaAuP/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXQAKCRAbX0TJAJUV
 VsotEACKVYOAT4FX0Zl5/UtLfxszK6yqfSpvZBETDmfriJH3iARfEmyFCwzxT5krleGndSDwyWo
 muThvi9bmeveOffXwjS8yLtngaQQXm823SZWXLksm4rnDrgYtt8neXuYFKlkIwT7bLnydJ0DaJN
 JHTd3qWl1JqaA2voGitbWcjHGm+pQsyLr2qPugi3oVy0SbKleIX4uOHpcF/bie7veTJF4NIZIwn
 78+SUdHeJnvW0KMTl+Lx3YB+0kuMf0lzwSSFNiMZh8gAngpJQRE83FncDSI9g3RDXdaIX1VHmZ5
 cx/PkZKSloNzdooFCZWaHCeEShwsSeLD2xPGWA9JRf49cKwyEso50jtquK264rKvDzrAAvWV2QT
 6XXoLhrTkffqBoOqgbrc2WQbCpi2K6lIsWiqcKWPqfpr3XSUYpRNbvq+b0xwy42+D+LgpfbhUXJ
 dpM7NrjpU5qwl3BcPEHj+6IrytmW2bX4R5o9NArIQIi1rxnExJtr5XP9GGI7U3rHuW1wnciXJJx
 ogtweTyXXFCBIQXSAf4Uxwu+GkVziAZ1KkCB0OX5wDzOScajLIhPmr0Pt05vMOZbglN4KM2y+Rl
 esuSrBYIrshvVYjjyJ5H+uB0nipBl+fsNU0e9efycXuEOiA/7n2y7TeXx2vsg422BzYLPp0aHam
 l+vjJUlVNxarFVw==
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



Return-Path: <linux-arm-msm+bounces-52007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E7A692CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618668A65FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6A2221DA2;
	Wed, 19 Mar 2025 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APBIwsxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7241E22173D;
	Wed, 19 Mar 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396172; cv=none; b=hht3Ube67rSmrwdXvWdPtWmTQ2kVuPRFUG7rL+CqfzIQYkCtLr8+aWezVzRpf2u1uSqkmEiUMla/DAmJD/ZkM+ckar5dCM/AKn4jV/jwqz1gE/UTwgm/5johRNTCRa/ZkKLC38ClsFTS/kdQbeae5sieCQKPy3FONHVR0ei2DLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396172; c=relaxed/simple;
	bh=EMh7ikUmKJiwc+h49mq+pybrwDLR96YV5FxSuN5ZxBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/mzp5yLTdPxaAstbnCbCF8GGX/zl37jXRMC6I4tHAseEFFKXRShgcyw6YxXK+6Hq25kreVFXbUyMwHOC727t29afLEe6G6XGCvQR41ZMlXgWDdQ4DUPbILuGg4iFzsevleB663qLkhbg6PbB/1xrhRBDvZlyUszmAv7pxaBBp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APBIwsxD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241053582dso40881735ad.1;
        Wed, 19 Mar 2025 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396170; x=1743000970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5vghT+lRUUhODnBwluijwY+DynV1hCCLl7u4RlxQto=;
        b=APBIwsxDR8ryzsAwiTniLvuv4KPfDVNJKSAAf/SCP/6S4WOYQ19GRBMnkyL357cpUS
         0tkL3tP+UNnRDDAI9HGbzspKb3mFNQTF0MQTAW2NSI/A2z0wAatD0eBbpiZ3kBi/8i2/
         8QnHkY9SxiSp9JUc1DQrlc3W9gE6clD+r06tI+6acaWaQX5zadDIZAP99TlcM/W6vMhw
         YAJSQ7xkt95FY1RvgjpqSVJrT0g1LjeTfz9qnuLuQgnXfQIHue0w/0PNXGApvgQRSw3V
         9fFZeywQEh7pXtnwTvAPo+VdbLff2b2bTRolV3ib7ncul3UAcYSfWHu91hSG7EZ88wau
         JuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396170; x=1743000970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5vghT+lRUUhODnBwluijwY+DynV1hCCLl7u4RlxQto=;
        b=kwSISib/gMgQ7ZRqf+KOynTLZcH7QZdkFpTQthTW7+UAnk+k9TF7iH1UMR17TNXO18
         uKts8LF1v0Fl80Om6q4kJGcROj+QvfbUtALysS8lgn+Tgaw6joEOSgB24iq0qpYyaA23
         Yf/jeXB4ZPwGagBzr2vbw7Gq5fLhyVbsR6km5PrpnPkPG/L+OSGF87j8WGuhNfJ7MCWS
         IpH8GFvo2xZSWCxIEWCf8Nmmdo3fvl6dXK6fJKB9I6Nq83jCpegDUogtDtqwPD22h86W
         tGR7VsQrZ6cOby3NUgEEbi7C+gsyahb5Dw0p2fTga7qj016VUslbcTWCBh7TLW+U/oiB
         +KYw==
X-Forwarded-Encrypted: i=1; AJvYcCW4hayLNJcRxrrR7LTxgva/MfIktjgIjKA90eNgvpOubLzWvXFuE1IUDTGjtbkMmNDCqufrurC/a4BdLk95@vger.kernel.org, AJvYcCWDKGwp5UzjiXEEq8bCid58b4dyDJQg8WT68jG7hpJqdiPqU4N1ux4aaOMw3bUCXorGQFTNTVxpgpYEk3NX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/WRTKvx1xjQdnblbEZauKK/+YK23GYxluAsecQ56rsajOc/E
	Cd5w8l/Pns0MRfLrY3MxHwiBpGuThVjPseCiap+u40u34H72OPm9
X-Gm-Gg: ASbGncsiysz8yl5tE5m+F1+KoB5VuqqMX5NinkhrPGUvsPd4jGE/CfRYeljo697qOgq
	PD8lSLGniSCtcFXyh8YyhYtMCkU4Gs7pcoWGZaZ2qMKNhs2bNke+cmdO/Ai8xDBMT1EeEPK8RGL
	y61fZSpN1oy1smvSJSzQ3o6mEQEIaxQ9QWUPr8BJAHojj5Ghruz6DySbWdkw2W8QgXGdS7aNneY
	RVDB/HZ4clrFUi9lR6U+DjSdYX+6q+PqKu/wVHMbdsupaTB3xKG45tS8M3q+3FMiP/Zi+u57yFx
	+33WkbNNailTqdmMk4/mVV/N7GGA6AaBBg8/JJbvExQRCqPTC07Zc2IVoDewJ+dJzPaJ8eTXj4d
	JUCJCxeVhRrrmntjwC/A=
X-Google-Smtp-Source: AGHT+IG1ust121HcuGrJL14qmOc3DcJXO+l7Y43CZxyk5EJV4JgmEiZBepa3nzlmKg+3Zuaz5qbsrA==
X-Received: by 2002:a05:6a00:3c89:b0:736:4536:26cc with SMTP id d2e1a72fcca58-7376d6ff858mr5191039b3a.23.1742396169555;
        Wed, 19 Mar 2025 07:56:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115593aesm11643184b3a.46.2025.03.19.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:56:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 34/34] drm/msm: Bump UAPI version
Date: Wed, 19 Mar 2025 07:52:46 -0700
Message-ID: <20250319145425.51935-35-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 70c3a3712a3e..ee5a1e3d5f3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.48.1



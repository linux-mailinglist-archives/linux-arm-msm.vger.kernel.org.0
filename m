Return-Path: <linux-arm-msm+bounces-3036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9431801EB7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD88281080
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FB921350;
	Sat,  2 Dec 2023 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeJrdCQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFE6FB
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:20 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be58a751cso940543e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553219; x=1702158019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxwDCoOR7ZNcOAZH2cumKGd3jy5cB2n2pA+0b3i0ZRI=;
        b=eeJrdCQW/LDRqzKrQQ7H52MtVYK3/1bgckx2HF6d5gf+wYzvdEriAyTUDF7D5jXchd
         P2VehLNXNoE1c7tzKwbJUlDHvDk7DHQQKHJQHzsZ0CnCs3NRboWdUvhxoTe4oD6KKwXm
         fcZWGSEymp7wHyd1SU8pgpPsyG+XfDR7xAvbLj+y/EFdkSv08lNIEJPvvfTosOgrDHNd
         ebcuX/toeqRYaPAuvWN2b6eLDJQtyFfRULkZYoLQubW20JZY9P2zdMcvaNtRMXYeAQWK
         dUPRYyDhdLW5NpbraVPVhKGQ4DI2UJMx2Qg+M7uVoiFDvlIPQrN8xkP0QUClCWhCM3Sk
         2vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553219; x=1702158019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxwDCoOR7ZNcOAZH2cumKGd3jy5cB2n2pA+0b3i0ZRI=;
        b=Eqir52ah+o32PbfLvOu+Q6js3bHZbx8d0x0BVNwY7E2RABEL3dC3fBGHByq5S8Ftk1
         SznN6GA+SyPvyH9caoYeZVNZKM7kIbgz8itfmPY9sc9fm5+FqhXZjkJJn/dje1QNOlgd
         yi05pw37he/dlS30+Uwb9VnNmTbwepEr8w2kG69Kq2FbUsD7XQMqELb2dw9Zpd6rnNBL
         RMUR7hfi5NXZNO11yIKsPb/j4+PvWVoZ+POB1dDLIdcRq7lBaWfS+H2IxouxP9AOIljR
         R1r0viQKiWd4+oGedE75IyAR1X125ZXTvTcvGk0ai6YwBWUMUZWeebpGxS+P6RPlPkak
         Hjxw==
X-Gm-Message-State: AOJu0YydiMbQlXSwMh4+ZiH4dz3F31nSTouGxu3Qosl3WF9l4mxCp62D
	hHqI43wwPAI6vPRJ3Lr+dO0mwA==
X-Google-Smtp-Source: AGHT+IFuywgdglJv3/9MQaAbNBR2CeJFSzfl92kTlEKKfRLv9ergZGA8nr+WaRDOeLPGnoLQJAOQ+A==
X-Received: by 2002:a19:7618:0:b0:50b:c1d4:d41b with SMTP id c24-20020a197618000000b0050bc1d4d41bmr1752437lff.20.1701553219094;
        Sat, 02 Dec 2023 13:40:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 02/12] drm/msm/disp: add mdp_fetch_mode enum
Date: Sun,  3 Dec 2023 00:40:06 +0300
Message-Id: <20231202214016.1257621-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull in new enum from the mesa registers. This commit should be replaced
with the registers sync with Mesa instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_common.xml.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
index 5220688727e4..2fa333bab3d2 100644
--- a/drivers/gpu/drm/msm/disp/mdp_common.xml.h
+++ b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
@@ -107,5 +107,11 @@ enum mdp_bpc_alpha {
 	BPC8A = 3,
 };
 
+enum mdp_fetch_mode {
+	MDP_FETCH_LINEAR = 0,
+	MDP_FETCH_TILE = 1,
+	MDP_FETCH_UBWC = 2,
+};
+
 
 #endif /* MDP_COMMON_XML */
-- 
2.39.2



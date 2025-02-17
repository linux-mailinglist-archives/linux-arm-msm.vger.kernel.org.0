Return-Path: <linux-arm-msm+bounces-48254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CABA389E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717683B2E1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87A227E9A;
	Mon, 17 Feb 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mm7MyRk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4A122758A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810525; cv=none; b=QvPDd2zbgVJ1zj9DdTfkhTRbgJr9tfPnYMKao3jO1ipcM+mF5wwixrrEwILBbdx7jGK5yYvnwoflfeDjMhhVMTb3en5XD95M1mIDgmFN9aZEteeXnvKTepYk9iWiW8E8cfoXlW2GJ4iBuG1nO77eWKJQE2NKZu3sXVlIY5WzPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810525; c=relaxed/simple;
	bh=GT04k1mFiJ+qnvaMmIwvNVTsraccfdG4M0v2LnZow7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIcq7fAToTP5K8gmdAqQvezdMdF7UogqrF8KYpuOi7aKbHOfMeUhastVWdb9vdB3Hc7fxGwgQPJobcLGoXZzbeFfQyrJh3l62IPL1Jvtmqcmn5Em504ewCNB7T5OTg0C9Lw9U11YJ38FmiOae6ihYyHn1NITckp1I7w4vHNJNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mm7MyRk1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7f9f57192so66768266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810521; x=1740415321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFipMKdumZp/ytSDr8+PyLocBgLdcXYBb9dko7M0NwQ=;
        b=Mm7MyRk13v0FV7I7mfVkOkaBalMxpWCHVEbMIBz1cn2BwUnjlNn/G+w671sARUM+Ec
         T/RIeiVE1bwO1mVIxsNVK/4O7dJqZjMp9/V82G8A99RFGpfII/Up9xbBSNDJJ+2SGgIb
         zG6TmpZGDi8qEt2AqREFzt65qV3OhN9grXU+w2UUkdtiqYn0dV0qgNuSpN0uN37/j9SK
         uwaPNr6+4CHfrp5gz4xEA2B/e/6mVtgqIQHF29x5Nd2yiRz1pdmz/KvJ6z3OQt9goV8a
         sq0blT66Ammpj8/b2+JzrSSCAchg95M8+pYVXnJps8UGMi/aBno/Rbi+PemQikXOmQYo
         zlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810521; x=1740415321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFipMKdumZp/ytSDr8+PyLocBgLdcXYBb9dko7M0NwQ=;
        b=ZHA0YrPNZBHEuFRpsOiFFx/xF6Wsg7Cj53Zt6a182ifardJgMApzpGZ6aFOeWT7wCw
         gXKSWdgMxEK5TMNWUafT/zQMp/N7vzLuy5XPj7KkN5X1rBKjdGLdeOgcV0/S8g5pThVM
         a7+iwuyOcpOYa9ZOF/5ozGpION5ViRTHjAivIL76HXaBVAq2rcIV7VvCZY2qe6PlYYUJ
         UdTxnGX96ginUBAcY8X1GBxHqkroIenMC/l2XhpT/QziD+5CsZDd8D+9Nzy4W3lIQDZT
         03FvblvG5RgT7N5elkqE9fdYYvMJWw7WDKDM1X4Dsg3Ta8IkE/0TB5UUsN/yiRjO6zC3
         wadg==
X-Gm-Message-State: AOJu0YyktvzrCyF5iWRI1mPgTPjEGV2EfZD1228BPzs8KRzpB1HH5kgJ
	VaJIEZdOqjjlNMbevjpHsv3BUfMwd3I+oCOjQVg1Z0VpDpAH33fQu4Y3Y6/7OJs=
X-Gm-Gg: ASbGncu76yV70CZOXN978C7Ya2OGHtlS/kjH/tPlWk5gcNDiqZmzYmDTgDT6bGbNnUp
	pZFFAhQ6Jzz5GHqq0XJRYXLVIhNKBcOvhD7GSeU2AFsm9HjrzTTslfii1pZZ85TBM9+N49aPzpx
	i9Tw2UxP6gR0j1gGWZ+4MKJToUKVwpiH93IOII7UTedjcJSPtnOfqW7F6Lf7sXuQSymMhtfaz6j
	WZFlPFO/sdL3d5wOjvdWqKG73wcFzHi5gxFCyFthVom/G+hpVEECFLXW7C0i+8c5HuVDTr5Vam/
	og1LdC9IpoYqhEIvIKmlv4EKzHH3c3Y=
X-Google-Smtp-Source: AGHT+IH8X9Zg1clEmj/6r4mBE5gyMkbWVF3xBhqOvCd2zyGKE+fqYvp1/PXMHF0iPCM/T5BzreHRBw==
X-Received: by 2002:a17:907:9716:b0:ab3:8bcc:3d97 with SMTP id a640c23a62f3a-abb70ab8c13mr434167966b.5.1739810521088;
        Mon, 17 Feb 2025 08:42:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:42:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:30 +0100
Subject: [PATCH v2 09/16] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GT04k1mFiJ+qnvaMmIwvNVTsraccfdG4M0v2LnZow7o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a+MLwpsMNZdF7tUH90tpc2TJHTAFzK6warf
 UvcllLmaTyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvgAKCRDBN2bmhouD
 16chEACNIt2xqlhdWhrXc389+E83+h4BLRDazFXIiYNVaD9JcaFEyuQM6kY7DgZTV8VRl3y5qkn
 tVwtqRTfxtoN3Fld8M05ovL5vhjPfcQ4yoCwyNl9UNKPUstKe1d9jssKqPfJJhLV90CKNVA+ZFe
 UFCpL8LeceVXDcpeXlu4H3U7bKW7SVMQUEQO/lbwHnt5j3FSeBiiohB9neiP3Uuj3fi6hjzy/pi
 zLlY38SYUj6oLBkSfWFQO5PeYC3hEne/dX9Q6FDcQBb2ZRJgCj10SAhljWlOTLnw311BgPX0bkb
 1l5Yz20WmBtAt7Gs1DU1OwWw/pG/dwcbuG+Xdjr+wMvaZUbNRkJeHnSjrUIZXHbKON5O0QAgnD1
 cphzsYKOTibuiX3qzbGPvaaZ6ycDFgFDJ/bh6ienOrlhVqb0fFbY2Ov+bbuMPqWy9BiKRgE8PH4
 MMWjdY2fdQPImRCfztUDejLW/mRe/JEM1dGFSemCgIIBKChYEHw6MpVjzH/OSPGbuKVwMUhg7Ei
 4QeMvfrrtFaD8FdSkjxdh0tveR6pfztUkTqV7fESRK3ULxFQX1LftoOluU/dUrZJYz3sCCAsHDS
 7if/Ocxk7pRav9Rk8t0a/QDSCFZyQOONdASnz5TNH651HWn2wW0AHttdKIerqAxbtgE3wI7jgqV
 nhDLtV0OLBRE7Yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ba7bb05efe9b8cac01a908e53121117e130f91ec..440a327c64eb83a944289c6ce9ef9a5bfacc25f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -123,6 +123,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -167,6 +168,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -183,6 +186,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -197,6 +202,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.43.0



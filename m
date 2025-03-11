Return-Path: <linux-arm-msm+bounces-51053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF07A5CED0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A07FF7A2B86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE521266F03;
	Tue, 11 Mar 2025 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUGQIgSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5D266EF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719768; cv=none; b=l0aPpMYo+EIzpkeIxS0FVgWk4tQH7rHdSvTvYLozJkSJtgNFofM0TGIYeH9kLxPSfRMX6mj7XbbwU3m2XFLNZrMfP7wFWdA1ZrMZRvJkk9YP26uQOnfgGYEa0PmOOpQ/fCGEJrsz9q3mNs0Kaqe0ogoIvLpt0u3UO1R3R29gj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719768; c=relaxed/simple;
	bh=rbASTPjBDVDuXUnK84Co/5HFSWBJv467bNqZtllby24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2iOAnmLnk0HgX3RHrYfzhSPsszFOkfl9+G1wJbTbteyvlM7OOCMfv+NocWRp8bTK5WLuIVBBCYO824s8a83gMS8wp06Q0G1I+rqR1oKk5Cl3l9z4ez7icj49OfKKlD7FDB0P6NqzYtZbpKj9NRZh7vFiX6MjxAlRP4k7pvDVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUGQIgSm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39123d2eb7fso440122f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741719765; x=1742324565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0d0ZttAFtkwUxOwwsVTFt/HnprneOl6Wo5KShqPwIY=;
        b=cUGQIgSmJECuYRNJSW9+joqeoFtik07L7/ifeIOa8vgpPbc2vN1/AmoFCODImdByvp
         NZO1P9ZIYIx4dzo2yB/4L30wodze99GJpmc8kOhMHGksR/RdupyOtL8piXnhh2NIZAvk
         muITdP2QitvHx6OXGKHjiVrF3voA9MjPo03tLzQomW+X/69tKl3ReLXDxk8HP+C2ThXq
         z6cF8Ep3Xd74/Al4kNGdkO9S/bzkul4d6nu9p7uOTNLQ3LlzEkcpmcH1LynRjWsw7JKk
         EH0/KUzCic/7QfTpjJ2Hb0XBZq1kFuk2EEnrHETiwBsU7svV9n93SH3DhsUU2VVSGVaY
         4pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719765; x=1742324565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0d0ZttAFtkwUxOwwsVTFt/HnprneOl6Wo5KShqPwIY=;
        b=o3iEtp0y1wVVi4bMDx1Vl669hnmK2HjHAA8n8UWMWw6Q/6ABvt4ngDkCCkNR/U/Nnk
         3HGm1NocXB3xaT+hxvOE1+Qw4Zqun8PiHzjbwrsIVSW016Hv52A0VzTsknlEAhA/suCx
         ZHCyQQ4a4KyyWD+Zenp24wp750g2YJDLmDwkuOjc3tUpjQnjlQm9CL8fDTL3r+fj3EhB
         iVgkz/eSryQa4nO9LH+vlFsdvvtzPzIwjpiHhVbdFAMPD0GuTfaDkX+kyoTidZ3R3dou
         xz5vdbE+Mrw5boha8JwaLa5PT4GXLidOaI5WQsHYfHqqfBlGCScCjVu/Y/8llQD/23ja
         QdrA==
X-Gm-Message-State: AOJu0YyYKtyddk9iOl91fV/I8DhVVWWfSKBoSeqmGQmbMq86AcoKvhpZ
	6ganb24+mj68h0l7AbrvuBK4BypvtSyphiZStGgylj1sMgidJpl5MjLEgSfnslo=
X-Gm-Gg: ASbGncuqiZ371kuy+8zoVUgovWG8sX8ltCLGZPlpy3tuqetKshpGNmQshilRuDlJ3gg
	RRrBykQ27ybh8sTyUreyGDXJC7J6dwcY2ZjQfuhU+sgr41q2d3uxmDQMkKqnXAC4cyEy23AEyQK
	dMmqo+m0yoCIBHBa7sFpv8WJfvRJgChgQ8LpJVnbV061wLO2OIRDzqsb4pJri5EkYWyFPpYWU28
	KRH3Vi7SjCU9RVd9OAtMoLrWlQc/lRy317gD8q2WylneDe/KnsbipNxjNK7eKgeLpLtkcZtL7j9
	FYbFIQY9cfezRhStLgAxfd36qPAfYAMNFrWZ4NPFDpVFxMPCs9Q9+XjuFdA=
X-Google-Smtp-Source: AGHT+IFTq1fzI9DkxH76SuI6zs9b5L+7VoKkIdA2FrUOKKcp1yLpAGWBZ+iTVuss7hP++dlwksCTTA==
X-Received: by 2002:a05:600c:1c1f:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43ce6d46431mr46166985e9.5.1741719765380;
        Tue, 11 Mar 2025 12:02:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:02:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:01 +0100
Subject: [PATCH v4 11/19] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-11-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rbASTPjBDVDuXUnK84Co/5HFSWBJv467bNqZtllby24=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiuAtRk7ULRCYHnIA+Yy3/Ys1ZPh0+TZ6jAi
 P/Zjo0rvv6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIrgAKCRDBN2bmhouD
 1wEWD/9XY1AwSdm0gW7NukB2Yk9ql/zcWkUHY5jiG73tr03VG3aMj+LWrhmvCOQ4sn6OnBma8Ny
 15V9ldZXcpHXWklX4FE0zsluV1rll+L9GbUXN4xmo3GSLzqH96FdNJKpsMLoa8FGR93zt59O9ZK
 UJQvH9frlTY+jrfneZKUtSW46yIeX4P9DxFOLvKWyBU0olISugqyt6MhGTG0CoTHBFjfHDcnzhQ
 YNSo5st8TgNSUy4hUzh9V4bWC0P+ZQVes6DZ6cEvd1hDO1ryGIgPAoXwnpZdF/NJ7UY5GLiIQiw
 VTcNNzixZswnUejfRvdrrvkseYnKLYWwPzPdA6z6OridtQecwcfX8C/Bn49yRW2UucP1gt/jqqJ
 xb4BvVJkzoya3U5bLvugbhjZMWHXA7Sy448EDmIGCFroSCZsXLs4AbKa+W7iR+Fc+3PqG/wGhHN
 S/FcBjL0WCCwrxhes44a3tffmSeFlOefZ8TtxtpyzIMQtjZtn/MjWtXXLcCpwBDKfjni+vEEgEN
 GoD/Iev+vnVSmCiHGATQHkX94gK4hKp8sUUg4Bj2CEVJJ3j13r/2HdHiEbxgZN40A5IUT3RzByf
 7oLh/jj+OGSf4WMVosWDhUEplJwcOvXc12k2D4/I+9DKM8+0YjaeJXQfoJkx+wkXYws34QkqXDh
 Wdb/h1wX2bpPRWg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 8d820cd1b5545d247515763039b341184e814e32..175639c8bfbb9bbd02ed35f1780bcbd869f08c36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -125,6 +125,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -169,6 +170,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -185,6 +188,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -199,6 +204,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.43.0



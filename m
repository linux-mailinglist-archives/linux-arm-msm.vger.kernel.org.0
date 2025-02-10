Return-Path: <linux-arm-msm+bounces-47382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72811A2E7BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C40E3A48B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBA11C1AC7;
	Mon, 10 Feb 2025 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYya6BjD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79D1BC077
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179970; cv=none; b=oNfVk44BfaS/FMV8Oz1tRf/7yFl9qwbua6Of6aavSwjSva0si3d383cGJYLapxIH30ScwqDhKdrUEuWRx/xkE69JjNQzKkY4BdJOmiy3ukocLvj23k1sNNMl7AxYqpPy046jQ+T6P8yYAYT818WLsZj+Fny4OddJxlcz446V3Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179970; c=relaxed/simple;
	bh=V0pnai3sG2FUHiUUgHCPEL9XqGih2gi3fiou37xJXjA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NUYZXfJqSn7q5gIDYqjv6nGyc/uGuK84n2NgqwjYVsGnqRJRV7emuN7FIBPMbjhGMU4T5aFSGJOHGfMTLxAyRy8fI5PUz9ktFYyINEg/gFlTxsWeIryhRx8P9j0UO3gkHKSeiNpOVGo6Lq/otSYMBtPN+0ocZISSXsnhgPOVXNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYya6BjD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283d48so27593665e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179967; x=1739784767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzZ4qnyDjt3/FJ2e8uCPnYFFvXSGSVm1CHMdsRPG1Pg=;
        b=CYya6BjDrMNVXAC9qlwTxasiRAhx0POBDfYLtv6CQmH4oPnKAcX7P7RFbyII1pbBZR
         PN4U/CjfIXIc5c9OXKKi9/bjecgEU8QqBPzIj7LqQF0moUJd+tKsJ9Zvcnk6PUvxCoVy
         c5P/EOfPKhY+ovMIsfhP4Mm97B1VLOVHW2WYSCtae5av24zy8Wvo4lQ29io0seq70nM5
         kGxlaiijxJkGADApwBCELEbnQGDf6gahuTXFQGH7Brk8MUEaw9yonEwfs0nQfAlP9F7g
         ovn52rxGB8VC3xhJWfwhf8nn+apKtqk2FAVrYGWJAAIHW7fSPJsCLfYccamzB4Rs9bZM
         I7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179967; x=1739784767;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzZ4qnyDjt3/FJ2e8uCPnYFFvXSGSVm1CHMdsRPG1Pg=;
        b=WgCmi9PVvQzGkLdFYCZxUj3gN9M9cWNqBnexfqVXp1TfwmBjaiRdy9Ck51VXqjjR14
         lkocSmzT8hd0FidCNCzMcNhhGyLtdvyiOfW/bL0IGgYQlTZ0yo0umxElbZCeoGXAPoFk
         E0VZny4FcqewsKG1CMgbCrrRHvLSMQgzjklklBAM4WEiHBhv7XYQUxzLQY/kSNR6okb/
         O+XE1UjgEln50e4lWraVoQgw0pJChjxeQhB2ntPDjN4m5vlx9GFOYYN5QRUorkDCxeex
         djEayt/mNAJi2Tcd1b6xrm1fKBY/q/oFZsoU7LoZ+u+wVcSUEwfj3W+BkiRCXoDTT88g
         J2ow==
X-Gm-Message-State: AOJu0YzDnt/1ppjRH+Xk92OW61aZo387YDrkl+Nh/q9WfZlb/bXDxkmG
	63b37xgD6ImgU9FAa6AEsHyRXF+lmNQ92GTasrTQCCcPZ2LQn7QoS3fpYdgAJG2AmaiwNB8KaL7
	M
X-Gm-Gg: ASbGncunOQb0kkGHpOp9ynpZ+EY6OLN7hJ+VG+d3hELKJIpEYDGv9zW7TLNJhFftQmn
	wBIik9ZQiCq5/49Q9bO2EGWcEp+6CoL4VYZUdVfexD5ziCJIfXCEnp+4bXCjWKdxnSA6FYJ7otT
	30zY7Vh9szS7zkAemowWnigXIjkQ7F1BX222Bk4gKqo5JkhIbgVbuqLKDL8TK5CgPdle3UodoPS
	F4LZcf5MCA8Aee92zOT8aGZFjqIChlGXOyUWAeD+R9I8tilKqlE200lRw6t0MRCbhVyjs3bm3kA
	+vVKp+BWN4nd//yiWLRkpZXVynoWGxgJRZaf
X-Google-Smtp-Source: AGHT+IGNDPBJFJRV2pnpEXOymShd+51OHk+y0ckKkGyIoLDZ3cbt+pXP/FQMMjjsEzIh0bn9twywjQ==
X-Received: by 2002:a05:600c:4f47:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-4392499090cmr104561845e9.14.1739179967075;
        Mon, 10 Feb 2025 01:32:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:32:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/4] dt-bindings: display: qcom,sm8[56]50-mdss: properly
 document the interconnect paths
Date: Mon, 10 Feb 2025 10:32:38 +0100
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbHqWcC/6WNQQ6CMBBFr0K6dkwZLKAr72FcAJ3CJNKStiEYw
 t0t7Nzq8v3kv7eKQJ4piFu2Ck8zB3Y2QXHKRDc0tidgnVigRCVRVhDdxB2EsV6UhFGHAGwj+c5
 ZS12Elq1m2wcwvIDW10oZxEJLJZJx8pTmo/Z4Jh44ROffR3zO9/W3zpyDhFphm+uyIbqU9xfbx
 ruz873YQzP+IcckN1WOba1Nme5f8m3bPpm/5dFEAQAA
X-Change-ID: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V0pnai3sG2FUHiUUgHCPEL9XqGih2gi3fiou37xJXjA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce7qdjWC+8P/KsuKPrL8cabCUEntHyRqm8B1enU
 NRMB9pCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHuwAKCRB33NvayMhJ0fGGEA
 C0r9MZn5sVQ28nvrKPf5shEIsxNoLOdCxbfktrO0LwKE2O/uoA9mrOfbpaJCkho3ey4zrlR6XFNepd
 3uQFLaLMDOdbm7UBGJnoar2pIWXhAwPCEwxF5PG4kyZ8la7OVzUQ8aX7OQOQgRfPZieGV3s/ZLrKQU
 RIo4a8UcTjgMrSMShHWmOCHua61d7o/i5Qokg5xMAIrHGMC0VKsVh5lG6tB4n9zxghrjoipVbFfzfz
 LntwRNOdj5u0jodvvpVX2LMnwFnLCIazTJ8wpbr5bMYmAyxcd/hy/63VD6t1LYquYox38LSmql9L2w
 4tt8Cg2A4kdDPXxNR/BDutUHqSD8GWwD5s0TWJACxaJPqlZde3/+rLcoqsBkiNNCLr/wvgnkrtjLTi
 uOXiiknsfJQ5lREtRagYonl//UAGRT7gftmKKtxWuTeNsp6ufUP/6bnwHeaoeZTi2K8xaKc3YCyMRJ
 4QJwynbAlGDAcK4MJSrvmDFCY668ep2bx/z0scGvsHaV7xxbZIcNDeogQnj27SeLQp66dpbHo5u2zN
 tJbCY+tdjU9wsR7l8MpInQHS/mEAPlMKUiNnB8IxG5dGRSK/lfgiN8Eq/pIr/oBfbL7w0o4fHbuc1O
 0Bv4X1yzetydPzeVALJNNzwAxH/9Kud6NbVvzew4Eqwh87+YLox5h9UKiZYQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so properly document
the mdp0-mem and cpu-cfg interconnect entries.

This fixes the following errors:
display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org

Changes in v2:
- fixed example in qcom,sm8550-mdss.yaml
- Link to v1: https://lore.kernel.org/r/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org

---
Neil Armstrong (4):
      dt-bindings: display: qcom,sm8550-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      dt-bindings: display: qcom,sm8650-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      arm64: dts: qcom: sm8550: add missing cpu-cfg interconnect path in the mdss node
      arm64: dts: qcom: sm8650: add missing cpu-cfg interconnect path in the mdss node

 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml  | 13 +++++++++++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                       |  5 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi                       |  7 +++++--
 4 files changed, 28 insertions(+), 11 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



Return-Path: <linux-arm-msm+bounces-50681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC828A5787E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4461723E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D606187876;
	Sat,  8 Mar 2025 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ipgi055W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD4187332;
	Sat,  8 Mar 2025 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412311; cv=none; b=M1m5Q7f+g4ag2w6FMYt7Ob6pwXKZ9wU/RrqpBL7sDz7iP7KO82OdsJPqYIduz0YGIWYXTXFrDrrVjkIH4kMoZe1PyQV26W7M3zMnEC35dl0ZKdO3adW45uuIsF11aIVY8jNnR2Ph482e+2k/Ehmrt4j/73ZDAT+Ogz2kqy83TCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412311; c=relaxed/simple;
	bh=Y64VWnB0mpfc4K99JO0fOYXs+4MSOcIJZ9h7nUvXgt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DLJ3NK7u9TGsUujKY/Qy3n4b/yXxFjQUxdseNDtQmRontezPdJO4GHbX2C+4KEk+83gYsiKU36FlWa4A204Y+/qL/82vaG5eUCmgkiWV554tz+BMvAUaIHjuh+2S9IxRngJLhNx6yYzyekuqD1KOdmYTPp3L6U1X43VbtxvgU2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ipgi055W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A50C4CEE0;
	Sat,  8 Mar 2025 05:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412310;
	bh=Y64VWnB0mpfc4K99JO0fOYXs+4MSOcIJZ9h7nUvXgt8=;
	h=From:Subject:Date:To:Cc:From;
	b=Ipgi055WQ3+1L2ANYsq8rdw3ifpQvLiEV/d0vj6Yd4hGyKwU2jOhSWMeCEDKezVPq
	 J36qdcumrNp8sdMQWWsxZi4uQ+MJHs28/oxoByYxS/0+0FfkApppFabDfudTowYa6/
	 B0ymK7OCEcUQcHYQhdXPHFKDiET8ptyE81wSYwqRBUWmJwuKaQedBhvvEDnkRuISq6
	 LTljdknxfPQrVfR/ULCPLmvpuhRoAzSE5WH+emZZP6RVz9tOojO9TwJ/RrDBjIc2hD
	 hoCB8IosQNsy3VPSqs3jot6X/snzUS9lK2wKqdQ5diwLNpErP5HLFQFRY/k0TQEehO
	 uCy3TDvsJ3fMQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Sat, 08 Mar 2025 07:38:23 +0200
Message-Id: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDXy2cC/yXMQQqDMBCF4auEWXdoqi0Ur1JcxGRiB0liJ9EK4
 t0b6vJ/8L4dMglThk7tILRy5hRr3C4K7NvEkZBdbWh089CtfqKbFxT6Jplw5RGDyVNG68hrf/f
 tQBbqdRbyvP3ZV3+20GepejlHGEwmtCkELp2KtJVrlQoJ9MfxA29iqJyVAAAA
X-Change-ID: 20250308-dpu-rework-vig-masks-cdef0f4f3bec
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Y64VWnB0mpfc4K99JO0fOYXs+4MSOcIJZ9h7nUvXgt8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fSzLS6V5lAxOaAWiiUkRHKz+vOXPQxadv46
 mCk8JPM7XuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0gAKCRCLPIo+Aiko
 1W85B/96lqDIyD65wMNdHFxvwIkz55JCESTJlUI9Cme72XWzHZvxpwDCca9wJuVgZwxPyjOwqiV
 6QVfbk4TV8Rj6FCEQz8cBVR+6nXMKBJbuJLft9/fGim1z9J1u4URQq8mLERHBzN1RYy7sx/CAGw
 BVQzjtRmjU/hGFqLbQU0WVcE46EKUy3Oa5fThlCJsIyg3ZUr8c1vSVgly94zQrKUblkZnyjogJP
 5bochxj8u3U02P8D46V1H7j355Ew3tZ2AvsMrfO8LLsMWzx8ULFhiS9ORk9qI5LnuYo/X8TlwZV
 R4uh3LKmjNKzbrfkPeR8GjG2dELjkFIXKgvSDOFrMIQHWvai
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage).

Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
SSPP feature masks to make it more explicit that using non-SmartDMA
masks should not be an exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Abhinav Kumar (2):
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550

Dmitry Baryshkov (3):
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 16 ++++++++--------
 12 files changed, 63 insertions(+), 63 deletions(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-dpu-rework-vig-masks-cdef0f4f3bec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



Return-Path: <linux-arm-msm+bounces-67967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF6B1D32B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 09:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88458563EC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE3F230D35;
	Thu,  7 Aug 2025 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJce7DAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C0B21FF38;
	Thu,  7 Aug 2025 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551223; cv=none; b=m1/TRd9q2mgI24v2OteeVO+S93/9Ep1cptXW7U+fyVJOX8xeye4tlSLYZgPMM4sQ3VNiL35CuzdyYkumixMaKGcSV+l1wijp1zwVa5M78M+zgnTKgP+GIp8E1FVB2+6Spghg1HibQYpjI4oJ4awwHfy73aCb6vBugomTbWVTQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551223; c=relaxed/simple;
	bh=QAymJJ06cre5xL6TD3wl31zS7/sMx5/eUajrkA/4UAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P58t5Q4CYDkH7F4mC2AsKEgwIXWPbYvdjk/qB/gksuzwCQm6GTrg+qBnqaubZD3F6gwF8UuNHRrr7oDzdWi/in8+/8s8sT9QcoXS3MxJcZD+15X1HkqMer3vYLzMaI9oCKymHhrn+tVuWCUpbRskjhoZq7tI8hHHez4SaefzZbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJce7DAc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D271C4CEEB;
	Thu,  7 Aug 2025 07:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551223;
	bh=QAymJJ06cre5xL6TD3wl31zS7/sMx5/eUajrkA/4UAI=;
	h=From:To:Cc:Subject:Date:From;
	b=pJce7DAc80rSzLxSCt141wdl8kSmtmRpLIv3RS4HCQ8+tcgchWjbo/HJh/RU9sa2u
	 n1ZFXW8UNUGbTVpZpfmXhaNSioyP8FziwRp9aeCvYVq4dCdx+eBBN6sOKI8LuFvjR3
	 r7nqSC/NaRZFMR868vdH1UuVjqCCPmqogzUjrJ3XhPg3XlfIrEQu6HOhFQVRbqDt4C
	 pwl2xDwy5bSf8L4oJCkZJaF4KFtJZejxc6IYOtSwc0sYmyXMSYljB0jK0TDcWAnKvp
	 YwgtNpvdkcrJfVkJxINPQsMa0iTSHW7vvX3z+lw6iRxiY6PnLVrgI2+gXKHi/n5luH
	 BCGxnY0daRUbA==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jun Nie <jun.nie@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Date: Thu,  7 Aug 2025 09:19:48 +0200
Message-Id: <20250807072016.4109051-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-21 points out a variable that is conditionally initialized
but then dereferenced:

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
 1138 |         if (plane_state->crtc)
      |             ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1142:58: note: uninitialized use occurs here
 1142 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
      |                                                                 ^~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:2: note: remove the 'if' if its condition is always true
 1138 |         if (plane_state->crtc)
      |         ^~~~~~~~~~~~~~~~~~~~~~
 1139 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1132:35: note: initialize the variable 'crtc_state' to silence this warning
 1132 |         struct drm_crtc_state *crtc_state;
      |                                          ^
      |                                           = NULL

The bug is real, but the suggestion from clang to set it to NULL is
unfortunately just as harmful as dereferencing a NULL pointer is little
better than uninitialized data.

Change the function to return an error in this case.

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27..4987f2f2fee0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1135,10 +1135,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (IS_ERR(plane_state))
 		return PTR_ERR(plane_state);
 
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
+	if (!plane_state->crtc)
+		return -ENXIO;
 
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
 	if (ret)
 		return ret;
-- 
2.39.5



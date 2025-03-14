Return-Path: <linux-arm-msm+bounces-51336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D873A606D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 02:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E6F4460014
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 01:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609FB2E339C;
	Fri, 14 Mar 2025 01:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUnwudUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68D22E3374;
	Fri, 14 Mar 2025 01:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741914611; cv=none; b=vCZv766VS/K8CigW/YABGiwUANdZw1Za85O2bohxr4dT8rpIhMSIEIQWDReae2uoj4Hy1DY/pxkMzgCRGTgKVdLAtswo5GtQgz7e/AeyZsVWeyNydQ/Ns0Ds7lsl/0qz9SaGT0rXJ45f2s60uilrKD3x7EiDrpVodhatNytfI7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741914611; c=relaxed/simple;
	bh=CabPLOjFSc4Wpz1g5wSRcJa0dQvWkPwfqjYNijt/M3w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u7vB6Vi4tqSSVSmvA5g53pSkEXqxWcHIi+iY+6AXh6amng9562YhrQi04nlDBB1be2KZWidj/KtAg4dIT3eLV4Aq5aGq+XmMNeaYtgql8NarsuznHpamXVtWNd1A2uTzjPmJGOgQCjv2T49+Fa1YcVW1ELKcmpMSvjBOPHw18cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUnwudUF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8a1a92bb3so2746566d6.3;
        Thu, 13 Mar 2025 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741914608; x=1742519408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkSnH1tD+VyGeZC4CDJd4I/+pbRt7UbVDuyaiJJ96IA=;
        b=eUnwudUF7+mDRVWoaxUPXT4b6ibdMma0nvy2j7Pszj9M7zqOj8w7PltqGMiUvQrU/5
         EoRk8RO2Lh19dog9Wrc44RAhyHI/ZpdZfuVDaWrmIJgbVl0Cbar3dogBsWfgzSwzIJ9c
         uxUwGmSz/xWQtk4k/CxRbC5ahNCbq7o4Jq1b5stVDutsTu3urKExRFKwvVUW0ErdGsQd
         VEMGe73iedlJo2kTPGOx+qAwR6+xhuWi8WCWSrBERwlf7NveVETzkvvFjHZ+aItgY0pK
         z+CttTIDZI616MBAXtZPatFlPFGyHnBcXguiblrnS9L+xE6ubrVRnWNnWTLPVRTl6zoB
         vTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741914608; x=1742519408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkSnH1tD+VyGeZC4CDJd4I/+pbRt7UbVDuyaiJJ96IA=;
        b=GwaKeWA3704zCVv8YSwzH2QihYlXf3C16ogikId9rbUHzYiwynJqQ9+RTmg0BHnO3i
         a4utabwKLSxV4PR1VIX2cu8f1lqNYPPKflsjcKc0ytJdczIfb3k6OhHNrm9EKV+VqRXk
         u75saOvI6Qd/+KCiz2FoTWAnSABr70qquCTRjDGn+6/tUlq/bW7bMB8CK0Qe+8NHOSth
         YxEdzmnILAAdlugjxNCUwPEMGWuX+8SWcyPF7lNSGOhTHA+ObMyLAco4VyVMSang/poE
         qLQf1isBXoUJ0ZtSW73qBKPOv8U6JenPN7mmf2EOlFfDZsQZH9+iEXuGRokGE6dgyTYF
         T5PA==
X-Forwarded-Encrypted: i=1; AJvYcCU34acdxA9VButuJ9tsB6gpBDXUWvY/JvdF+3+YTza4kMGYSB9IuNQkR52UE8vmbmWK1ScrmBO2HxDi3TA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5kGKBBNC1i/Q75wcu9p3ra3moA2jWVxNfKzBxcERni7tuzFRN
	XRvLR51vP9eZn8wlmzywPdNUu5zi0YwNYW4RBaOgxLIkUqhnFI+u1cO0pfE=
X-Gm-Gg: ASbGncuFlnXDX67pdH6N1ib1m743eJ3x0FEW/dNssL+4zva8F6minNnSwx6KQTjt9Qk
	AMp0sXhTLGXCVL/R9UmVOK5obhCUBqxu7YOMCQidfZjnGfa5hHW3cnyEaN+neY1VM8lM/l/MfFq
	H6PAYbIm7aFQgT2YgTQ2+5z9Yn6Arq91b8chDI9idbeyrRYJpfXt2HcSGIAz8+uBSaP1Zw/lr5u
	uz8o9KgFR6cha7PoCgBYztgSGL+dAoLG4ITKAWa1BohcKirUhrX7bE1AETov3yf1zu8rOqRw0hi
	ooT0s+Xmdz3AtqRThMiOHzJdi0Pm7M3fTVnC7cUx2A==
X-Google-Smtp-Source: AGHT+IFmmZuJNS0zeaQVv7pfgVsxK7bio9LYQnBmmIvV0hbV2M/RWT5yx48Yln8G5HTdRHoKXlcTYQ==
X-Received: by 2002:a05:6214:e8d:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6eaeaaa0ca1mr2938166d6.6.1741914608576;
        Thu, 13 Mar 2025 18:10:08 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade34beb0sm16214436d6.105.2025.03.13.18.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 18:10:07 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/msm/dpu: Fix error pointers in dpu_plane_virtual_atomic_check
Date: Thu, 13 Mar 2025 20:10:04 -0500
Message-Id: <20250314011004.663804-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function dpu_plane_virtual_atomic_check was dereferencing pointers
returned by drm_atomic_get_plane_state without checking for errors. This
could lead to undefined behavior if the function returns an error pointer.

This commit adds checks using IS_ERR to ensure that plane_state is
valid before dereferencing them.

Similar to commit da29abe71e16
("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c3..b19193b02ab3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1059,6 +1059,9 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
+	if (IS_ERR(plane_state))
+		return PTR_ERR(plane_state);
+
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   plane_state->crtc);
-- 
2.34.1



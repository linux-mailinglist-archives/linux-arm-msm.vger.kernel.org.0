Return-Path: <linux-arm-msm+bounces-50588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA4A55F88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DD247A9018
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E165819ABD1;
	Fri,  7 Mar 2025 04:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFN5W6PY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5419ABAC;
	Fri,  7 Mar 2025 04:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741322122; cv=none; b=e66U4n0ohcdzsNW1N25BvNqWSCVmzqf8enhjqqqEnrjTK0s8I4uLrHoGf19XCYRLKNz1BiZikfbQfNUSm2UbuqaMoZNQg0+MUkOjCywB1U4n4Fd/zr5eJK04g0JXSJImr6zYN224HbFksTW9TjNNzo8XkewSE8xBmGDXyszUyKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741322122; c=relaxed/simple;
	bh=M5MEdbWeZE7zXQ60oSxYTGxGSrAsMNsHNGf6zM0ZgCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NvHQaYN8p3xGSoUNv5YPfjFNPWX/oog8mvhlu4PtfCbkBISRHMJvdiGP4LkM6kvEKZ26A/YY2gppRFolyrvXA1IUvm17km5Iid2PnJlCQn3ebwGNlYbF8WFPGzLI/Y3GUxgW0wVk5C6j1TLyiXLmhP4EfJc/1OpjRvvFOXEs0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFN5W6PY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9A0C4CEEB;
	Fri,  7 Mar 2025 04:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741322122;
	bh=M5MEdbWeZE7zXQ60oSxYTGxGSrAsMNsHNGf6zM0ZgCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rFN5W6PY7nnlg2MfG8mtBZJcZ6Wj4VrpFo3/12tGN+eeZtvxknU9qLl39UW+mHn7e
	 dRg58KZmbCVVXqc32RtsYXILiILuYfxMVM+afA7wxog0belrTQ0mMb0eyxkAPpLHkI
	 FAqQr7sRdjyTHpduyI+6XQLcdjiUPCUNVDD9n2GTwTw/LfJij82aQvuII9XcBKkZQI
	 gBXEP74TCKwMFGUw4vCQjQno8qnbVVclKfZAjFn75V8ymIARs09krw+/F2Bae3F1aI
	 BHNLO1y+ntxX3NVqhMEGLeho0xFqe74FsZhjAjliL+KZ/TBDXAX9UM/yRXBBcnLEvG
	 ZSGETaTAmJvCw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 06:34:46 +0200
Subject: [PATCH RFC v3 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-drm-rework-dpcd-access-v3-4-9044a3a868ee@linaro.org>
References: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
In-Reply-To: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oiT3XieBMSIfrzEMIa7+tHW3r4Yaol9yvhPjl0hzeR0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyndmGiquFLiYR8PUkIV7sx8wYRxkG3NJ/gWei
 jk4uH0eMKKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8p3ZgAKCRCLPIo+Aiko
 1QsbB/4iThkldo5Tl6AdOyTDiQWFEPSzA0nB/7OSpIBSeO4AazLhMgCVvamyuQiZ+/kb2F9L8Ow
 0LDwSYj393Omo3pr0XlCW3kiBlGsxf40hw+Nu6u1rbKVlyHZfJt87GLTgmqiLoS2TKV2Y4fJOoK
 qMSL/x9LCwN1Xsv8YMw2c9qfKd2QsfCdd77Pl6lkX/Yn2hrxhRtEampbf/DXyOJ4rBHI906MG8Z
 C7jPVukl4qVteMcihAgdC8iDnps7zu+Wp4fiTORisv9teq83oeBKe6c1KklOJ62FM/wdkzaEaSh
 QPepK/8E33OqsqCK9WatYMCnoTjfyE3INItaV+yPIKdnoJpI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
@@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 
-		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		if (copy_to_iter(buf, res, to) != res) {
+		if (copy_to_iter(buf, todo, to) != todo) {
 			res = -EFAULT;
 			break;
 		}
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)
@@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			break;
 		}
 
-		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)

-- 
2.39.5



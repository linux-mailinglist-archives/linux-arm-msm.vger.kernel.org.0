Return-Path: <linux-arm-msm+bounces-69625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3ADB2B606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD24620728
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB781EF09B;
	Tue, 19 Aug 2025 01:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2swiZQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75121E2823
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567073; cv=none; b=dIAyo8wk6DutPR2dRsTWCTNmdDDgaqc+mhgskzUqdjY4cvs3ytKSC0u0c50+vx6WA0GkF2PUG4kUfxM8f/zLXWMQaHEg9q1FKhJaOEuh/nX9wRnj6XZjGJoBdqa744koZV4VI2Zjz2UZPvrJV3GZlZ34efO6jBqSSicEJ4bqUgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567073; c=relaxed/simple;
	bh=kTeOmxXhQ+ch50lt+D0cO3o/E47sgOg8CG5Ss5YITlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mc9Ovuye7vh1aiZ6OZQhEpGqGdV8fhJqRfnv2PQ/ndliZg2HBWuhW3IBSxCLcBEezBVGSekAosb8IUlafZlRI6vICneOVc/uhXvbHrx1wsi+K916C5V4JDkvn4hlYyA2u2CpoJwLGaIhxex/jJIceug/ZmJo/GYeRnlop9bCREo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2swiZQ+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32372c05c5dso1321255a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567071; x=1756171871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PYDnfjcx7DpUU83wY0yl1Hf8rMD2pVEbU9c35OZ+h8=;
        b=J2swiZQ+27XIdZRiZPXBV98K4IGZPfG0EbptxWsainEnjWGDzqZKQFRSy8q0EJV4/T
         xF5vGgVvEEoTLDsDl/m82hDfVVxhqnZk/xuOPQu8vSPb9F0OIlTF5bBjn0/ybWJMoYgQ
         xzws2AmhPH/2MvL8IedU7SKWrEJl3djQMmWZ75ZkNsmwxnoyVeLRNQ8VXgRcpwfgJEt4
         nmbOw0fWMZ75d27cH4lJDXJmRDPNmnBb1YK9Ox+FRvoCcTeoojaQNlLhgx14NsLDL+ta
         tJIl2F0Gcv0SaXAze4LXCqliFQS621KAWM2dIzFzRBZTtq1qg5X2dfVHRZ2bZhEhGHtC
         uIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567071; x=1756171871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PYDnfjcx7DpUU83wY0yl1Hf8rMD2pVEbU9c35OZ+h8=;
        b=gdTJU7tEDDUFXdHdHi8YWFvLQ1opaGTEuvViLE0EYiJbI5PAOf0EE/0N5hTcPWtaGk
         QUqwDlbQJ3NlMWOwaWnUfpV/obAe1Ko1hdMffrg6/sDWpVrEGTzc2IDzC7pvWFP0HJ0Z
         6mmdBd8ZqF8pz+KMHQftE3V+H31VoM4dB3q5BCXGIf+FgYFM/BDh+xRT/rtJUNMgMMtt
         TZVCx1dK//pO3N6s+2rRVvSfUSsblIlExiRiMNWt0at/7FAYIidjD3PfT6l1iEAJxmq6
         B2Z68Wi4rmnD843VaUCD9SrYCnB4snPIdaecbBq/GdI+xZhy9DKlv6uRLt+P8mWECiCM
         oY1g==
X-Gm-Message-State: AOJu0YzyKr4ytE3LYCF8he6bo7O6Fk56pL1HmNXrGMu6Mhouz0kCc0nZ
	5Zd6Ys/pQRkApa2aKP3Kzj9YiX57Vr/qzi4eIOeE4y8BoXVLZbpZuQKtFA16RjYf0wGLvlm/RSX
	A7ZDfQ0M=
X-Gm-Gg: ASbGncsXno+lbuPYkVGstbryu9VRCJ0e3G9ytx7UIvCiouRihkKFvVu+Z8jjl9xb2iL
	xF9ibI2KjrLWuS4o/aUbmkWZepzkIZYy/cFFkyNYtHAd5Fh2UuU5VKdnxGEaabPc33kaFNwjPDO
	h4vBDqpkj7e0ifr4l3XxPEBoofjtOps5moeNDg3lNsyZyNg1vIhBrun0/Srv5EizR98GJNib3Y5
	9b7PDigDROYE91ysXArQC39KA4x7OUyaVz46nSanE0J0l1qRZD9MMVGey5E3MABIcWGJUmkSAQu
	eJHfLTlcIrS845W8QpnO7Ik/rZLwLBGvKe9UwvYYAeSJoZ907dEuJaegYeq3xHobdJWCQAztk8v
	XnBRbPaRAlEv11m7+Hg==
X-Google-Smtp-Source: AGHT+IG0xxURHdyn3w0qMS0E9bqiQc2e0Lfkc1QGH12O2UaVjhiGMXu9F2tJLJcIU5aM+B4XO77ohQ==
X-Received: by 2002:a17:90b:52c6:b0:323:7e80:8818 with SMTP id 98e67ed59e1d1-32497119cd6mr1183212a91.37.1755567070605;
        Mon, 18 Aug 2025 18:31:10 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:31:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:55 +0800
Subject: [PATCH v15 01/13] drm/msm: Do not validate SSPP when it is not
 ready
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-1-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=3970;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kTeOmxXhQ+ch50lt+D0cO3o/E47sgOg8CG5Ss5YITlM=;
 b=KB+TS9xLpfwaJ20L1fl9jkfQGuhI01ifSAlgyQxfwui9tw3ZeUGxKruSD5bIdmyqmVNTFvPEG
 U0sZDLWpkeWBFv4EjlOFI+yAJ+wBEoLbHx0JCbH6fem6+NkA5wTJE5l
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Current code will validate current plane and previous plane to
confirm they can share a SSPP with multi-rect mode. The SSPP
is already allocated for previous plane, while current plane
is not associated with any SSPP yet. Null pointer is referenced
when validating the SSPP of current plane. Skip SSPP validation
for current plane.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000888ac3000
[0000000000000020] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1891 Comm: modetest Tainted: G S                  6.15.0-rc2-g3ee3f6e1202e #335 PREEMPT
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: SM8650 EV1 rev1 4slam 2et (DT)
pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : dpu_plane_is_multirect_capable+0x68/0x90
lr : dpu_assign_plane_resources+0x288/0x410
sp : ffff800093dcb770
x29: ffff800093dcb770 x28: 0000000000002000 x27: ffff000817c6c000
x26: ffff000806b46368 x25: ffff0008013f6080 x24: ffff00080cbf4800
x23: ffff000810842680 x22: ffff0008013f1080 x21: ffff00080cc86080
x20: ffff000806b463b0 x19: ffff00080cbf5a00 x18: 00000000ffffffff
x17: 707a5f657a696c61 x16: 0000000000000003 x15: 0000000000002200
x14: 00000000ffffffff x13: 00aaaaaa00aaaaaa x12: 0000000000000000
x11: ffff000817c6e2b8 x10: 0000000000000000 x9 : ffff80008106a950
x8 : ffff00080cbf48f4 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000438 x3 : 0000000000000438
x2 : ffff800082e245e0 x1 : 0000000000000008 x0 : 0000000000000000
Call trace:
 dpu_plane_is_multirect_capable+0x68/0x90 (P)
 dpu_crtc_atomic_check+0x5bc/0x650
 drm_atomic_helper_check_planes+0x13c/0x220
 drm_atomic_helper_check+0x58/0xb8
 msm_atomic_check+0xd8/0xf0
 drm_atomic_check_only+0x4a8/0x968
 drm_atomic_commit+0x50/0xd8
 drm_atomic_helper_update_plane+0x140/0x188
 __setplane_atomic+0xfc/0x148
 drm_mode_setplane+0x164/0x378
 drm_ioctl_kernel+0xc0/0x140
 drm_ioctl+0x20c/0x500
 __arm64_sys_ioctl+0xbc/0xf8
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: b9402021 370fffc1 f9401441 3707ff81 (f94010a1)
---[ end trace 0000000000000000 ]---

Fixes: 3ed12a3664b36 ("drm/msm/dpu: allow sharing SSPP between planes")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..d20233ccd8df612fb6eee15242669510cf883c26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -922,6 +922,9 @@ static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
+	if (!sspp)
+		return true;
+
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -1028,6 +1031,7 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
+	/* Do not validate SSPP of current plane when it is not ready */
 	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
 	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
 		return false;

-- 
2.34.1



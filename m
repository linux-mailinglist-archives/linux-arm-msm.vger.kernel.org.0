Return-Path: <linux-arm-msm+bounces-77829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A05DDBEB6B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81BD34E7C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5AE25BEF2;
	Fri, 17 Oct 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWk658bC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D1D33F8C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731214; cv=none; b=Ai2d4g8zyPJXjqigw2/QB/ZvCJnxX30XdRuhPKPZYmOoGAqPL3uxy2CEPjQZdtY8i5BUGNesdTg5MZpxyzYmQVefNwJSNEMlQDhdaZfoFmR3b2P7N4nqYS7xXabQv1obwISDmVWC3KuZiUB0CUnqTkmXtLtytRxR6kw5OPAqbS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731214; c=relaxed/simple;
	bh=j4CxU22f5f5xHLw6uVxf327bBBJgMniZTot+Nm5mz0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJCxBJccDKsBPnhbYLwz4QeXqqdsJStf9Vjj25gMK8gg68/UZ8Vax46GCYnPGTTsuz7ULQEkTfIAlSCC5o2vk1EAGXHFjhwj4qPjbEwVnBbWMbXWfc1pj2gz2cnvGRD8U32zjx4+JiLcza+o2dMWRTm31003VXZgRwqVv6MZvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWk658bC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso4658559e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760731209; x=1761336009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FW9/6WAzhrFRAj+VvpEcKL8n1ZBRl0dJtQSc+UHoxRY=;
        b=PWk658bCJ41xt/bpQYGYJxP14/C3q3IWlI2Aghk9fk4E0rV6LdSq258qeIDE+ZIPqR
         dDmweSikgJVmqJ8TlGqDoHWyo8E95BXJ+jmMTSUN8viPWuKo2wxjXrq7KGb3660QiSDv
         A07jIoA3fzlm5RYhozjHnQLtdHYccu8Q8qWtW34V+SxsR+H9wwZluyWH60aH4Lo7UPc0
         ccw9njuy1r0rvsgMSg2SkNmjLjDzdcXJ5XnpBg2KlsvSzQnXGUbONJIQ1aeqlmgefMlo
         9hag2hwQeZYgpJZdiPS869x58sB25Wm4XAQroIxj2c+PF+s8VtSnP5d4lAG0uaIj5T9W
         +eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731209; x=1761336009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FW9/6WAzhrFRAj+VvpEcKL8n1ZBRl0dJtQSc+UHoxRY=;
        b=FP74F4FhGGFT4lUHj8NDIiRsu8xNX0Jtoz8LHwpVs5PBmFPJ4UOBDfhVeBZQFcd+Hk
         HB/d6CrD8tH6ePdGchyf4vnUzc7L/UCdEKPSjQTc0lfIBHw1ZfY9v8trXAvUnPZ74eXV
         ViuQs3+BYwzm6D6LQEsy8z4jgLvwQNgFrkE/hO7BLSPe0CNYXvE5h/+wTkDGXcJAc/Mh
         R2yJpui67WzEUk+K03eICZO4Mgfs2ZISXSUapb+QRCUbeG6ey1TOvEMDpm6Sz3kJJbDu
         WgEHIpp7g+voqNpeP9EtodcVcBzR8KGp/JbZjTT3iRPFx/yP4j6P7Zd+1dNEvSZOexUI
         XwTw==
X-Gm-Message-State: AOJu0Yx+uJZZcGJpPHMM9n4HzHhFaos4SgXi791aWiwZv9sRfFmAID7k
	KpAld5TaBEm3PnROyJL5gNz0ieal3S/p54SkXiszWYFU6J1IZCxwu4sj
X-Gm-Gg: ASbGncuerlHMLFBt+YdiSmzNNWfrErFwSs2tQjZd77twV/5YL7EzOZbV1BFbh8G9w2Q
	8dONynR1aBOKbjGcoB9lyFPqDuBgnxJuMcB1H8gI1RAKBRBxIgZtWL/rMVPr2JO+QbcXU3rduBS
	kTyz+LPbceyhht5u1oX4jVBcMgnwWleYbRgzaVIAyL1RJFb4KKscMrXMDzwspoVbGbCanR88gJz
	5GbsBF4+cX8eVZ9CxCMhIKC9f12WO52g75H45/gqAYg8XCREmwhzPqq4LoW2HRDSCH2XIw5kssM
	yZk8vP9LMHuaLrWpNWm8rXBRZbUITeje102J0bbztwxV6n4mPwoKxRXiJMyt/QbC572TjVy5229
	+9Tw6Uzh22lojzyGuaO0cC5N+NXDAkkblBra1EimokkU+Pz3APMgFt21KbO1G0kek1iPdMoBv30
	iAs5BqxVdaiT/ZUMFmQ3m1M1BY0NhoP27NGDTMIENjIvE6x+eyolrGwPaLrv7zHg==
X-Google-Smtp-Source: AGHT+IEQgaJHNjNCzev2AElmYZvm0Ji4cjMgDetLxA+1NUJ+RNTYtKrBYXG44qqxgaS1GwNzvFxAkw==
X-Received: by 2002:a05:651c:4353:20b0:377:991f:c1bc with SMTP id 38308e7fff4ca-377991fc573mr13307731fa.5.1760731209147;
        Fri, 17 Oct 2025 13:00:09 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp. [219.100.37.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.12.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:00:08 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:35 +0000
Subject: [PATCH 1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without
 scaling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2

Due to condition in dpu_rm_reserve_sspp, RGB SSPPs are only tried when
scaling is requested, which prevents those SSPPs from being reserved if
we don't need scaling at all. Instead we should check if YUV support is
requested, since scaling on RGB SSPPs is optional and is not implemented
in driver yet.

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..d9c3b0a1d0914a47f86ac9a854fbcede021e73cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -842,7 +842,7 @@ struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
 
 	if (!reqs->scale && !reqs->yuv)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
-	if (!hw_sspp && reqs->scale)
+	if (!hw_sspp && !reqs->yuv)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
 	if (!hw_sspp)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_VIG);

-- 
2.51.0



Return-Path: <linux-arm-msm+bounces-49793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA69A49036
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0201892D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A721A314B;
	Fri, 28 Feb 2025 04:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFY0tDo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C07E1C54AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716073; cv=none; b=cLA+7RSr9je+EsGcG5uODzV+SridIYjOU0bSIRGrMdiqAihSHXqL4LpZC/+SL8aUOuZhj2NJz/k0Jy2q4ysopnzpr7kTxV2P5pYnZMYpS+iWZUbGSQ+FAjuKqE8QQsbJsg4utglFv39dXW+B3C+i7QUBDKo6ylBlVkvBYU+3Bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716073; c=relaxed/simple;
	bh=gbAmmg7YrMzJ9XNxwCPOatERTxM1Dbe3+ajpkL6KPO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLg9A8t/Q1VogppvecTAc3SsaGo35dsU8u1i8DPO2Ovos6QoK1d2LPDWMfK+27+UOSxhqM4T7C1l8btr0VH/sKOYhRcSSfYTudDGxc4mbedbuiqwJx8ZwFiv+JiY9+8Eu9N2vunWGVx8bRQ4slbtDuQeZPhae1OvtvHxAdgXVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFY0tDo+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-548878c6a5aso1737761e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716070; x=1741320870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3kLn8+jQchoUvHapCVtAnDT2HhczV+P/3nKNxhd/mI=;
        b=IFY0tDo+C0bFruux1M+XTLWb4bI5ITNY/XTODarN3eDTy+wVpjV/b1GtL/+UXYBoPC
         BsE90wrHZ+RyIlRbbHKtS9iVfGc7JXX5qirnkS1ZSkQ1YLR9V/E6ucAEGaBJIJdgXnRk
         RWurGGqfRNaYPeZe/SkWPw7gBOabDrpELPNqwVC4jgMQ6Io0HgTS5Jbm++4UkuRXoaeq
         oCtwvg7cuHoWA0lq1BteasswTlaKI17HzRBdwUoA7u8vmh9kPpexTdyBh4PwmDzegqCU
         u5mnQXDLyz34wGAdGx/h4I4Yb9tsIHKyEUS9FKYR1ksmF1toNI5PSQOAuLG6GUF61tqj
         JBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716070; x=1741320870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3kLn8+jQchoUvHapCVtAnDT2HhczV+P/3nKNxhd/mI=;
        b=Fs/5Ee9Tal+WBNBWghcXm+WusTQiTQwXEonV8aPkuckghwr6ooxYctwDWntoPp/a9/
         Xpsx6X93Cn87OrHg6ACXq8IRIFFuN5SkVmTlsII63YgNlv86UphE0CRR2JcgUhl6j7uF
         ok1zWMEVdBzgzBSla6jv1zoP95kdBHbJotb1xSKwvNVZX1XKk3LrFC6vPIHCTXsuydcg
         1TcS28+hdT6S+oB1/OK03ZgP/zE0ncYuEQ8DvcZc5oSu7Y4Wj6xTrlRYLv0fmr5AveGs
         Jd/wco1PVzBQacPWmNZu9/B8KzrplUy46174rj9VdI8FchRmqac7wuVwInK9+iKUrJfX
         RBjw==
X-Gm-Message-State: AOJu0Yxo8PQxC4M95qNTj+xjXidddQgIDlULCXzquRo1QDeGMxGld7sJ
	D+FNmd9sIbXLFFhlzcc84RQK3jeZZpD1F4+HOT426bZVM0AxM5kG40f+rE0nsjs=
X-Gm-Gg: ASbGncvC2tmu1pjKsmmyyMD5ZtKI3weRV0+AXVD2dm2XVtPRRsyGri39LFZu6LjkYdn
	7o18o4q8ix+5fE432wqc+Xp1n10eFQjVCaP8cSKpdtEMvMdCUig4h96HmEQSUsuRUfOBHlUQDvS
	1cTB05H3MoXLl6XF3ofuZIQw0T/f/SXRFIUqclQJ2Gi624IyP89leYGjZpcOI1wovYX38hTf9Ip
	QRJbrVDjo5xVaktftKTlAMWY+3dHBsmW2PQ6RqS01wghns448ATHNoJawiiIrzBYh1nwwEeGroV
	ekcxQKeyr9vL2U7h6MmJKpjwaP3NHHopkQ==
X-Google-Smtp-Source: AGHT+IFDSc3I2mqP5qdXMpIRdHJvwKMmhG7fxY3oSiaLL4XJ56Lr0lDFiJk8seHX0EAq0LMWQw0Tdw==
X-Received: by 2002:a05:6512:693:b0:546:2a27:ec35 with SMTP id 2adb3069b0e04-5494c37d6dcmr634988e87.37.1740716069990;
        Thu, 27 Feb 2025 20:14:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:12 +0200
Subject: [PATCH v2 8/8] drm/msm/dpu: drop now-unused condition for
 has_legacy_ctls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-8-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gbAmmg7YrMzJ9XNxwCPOatERTxM1Dbe3+ajpkL6KPO8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgPgCbq+XDOYj4H5rvYaOVt6Lx/s7AaC8vhi
 DkF7csW16yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DwAKCRCLPIo+Aiko
 1arGB/9gEroWlk0T+tDjWT0IrtdxlhHsIIkLIlfrjs+HlEfUh1WEodAZTwZ9DWE07tG3DNCmZpn
 c3YEYkngaozD/ybdEE51nsh1lEdop/cJhejr/tusiBpBB3fvZ0M1nfUxsKfVut+XDfA+VaIqbQm
 sGNHgulMZGb1AX+2QY8LAxfVbV4MXZLt4GSmh5ZJhFqPxRHP3LqNh/yAoGYdYQoi6P4981GJwh6
 ZZG3Vq65duMphoVG53KKXxs87SPOdjM68WYAVpfclLHF4DyCHtBoPlUPxPKMpDurxwKVphZSete
 e7/Ks+NJ6bjmi2liXy02qC0fUERYj/Dr8KMxiyyrWS4tvvUe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >= 5.0
configuration, drop the rm->has_legacy_ctl condition which short-cutted
the check for those platforms.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Note, it is imposible to reoder commits in any other sensible way. The
DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
single-CTL support.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4dbc9bc7eb4f151f83055220665ee5fd238ae7ba..2557effe639b5360bc948a49b0cccdb59ee35dab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -410,8 +410,7 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (rm->has_legacy_ctls &&
-		    needs_split_display != has_split_display)
+		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5



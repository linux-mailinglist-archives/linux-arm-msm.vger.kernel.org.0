Return-Path: <linux-arm-msm+bounces-49783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6853A48EC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 03:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96F2F3B7BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 02:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8320D19CD01;
	Fri, 28 Feb 2025 02:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THXMXRvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855FF192D87
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740710456; cv=none; b=kxTKqKcD3hvp5WNrPDuo3yRF+hHr40lAcUUlKZsWwfArJeKTQDwTZV63byEbyTSn1yeatBcKYWEQfIHId7M49x+E3SVFhUZbYvvCLdPL+/v6axX+0rzZfTAbMwp1tTHJTdlmWI1id1/re/74kofRdzJt+uh1eCTKD7Ym/hR8Ne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740710456; c=relaxed/simple;
	bh=5ERbWujSiKto3U+OO7RC5nldxvAV3Xb1FsVd/34DI+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBI7c+1/d0HCaErsDwrrAHJ4YgVD+AksEsQIrQ+b5MS4p4UJvvg18xzegp4p2FHC6+Y6Dr9IDR1P3FSDiUaHEp4Wwwyxcr4/u5l7heIuiDZGqSHocNVHwrizQVc2Vq55jZR8eL+3D522Qa/jMmQ9ZjARcfvwe2tUsNZfdUaNgR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THXMXRvd; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30a3092a9ebso17614861fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 18:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740710453; x=1741315253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0drAA2PvbJ4hUCTdzmpW/pfB1rIMSFKchoim7lWctY=;
        b=THXMXRvdIlfXj56fnnVKkVPc6C2OO/0JQlblGwdyclizvvKfuCl80dSXXLPxjQKijP
         iSN5C+f/n9yhyDH9PqBwmhzk830A0prpcHRcDekKAmcDa7Bs9VOAyyx0725Yl2D20TYv
         qHaZ40jlDQyi4CgFHKaMndE697BD8lq+H4xOcGu+zRC0jgYqk4YwNsPNqy7np0fcD5uM
         XoxdYgQhDD/TV0Z3nkemnpREzxLgvUcogVwZi5cxv3wPYiV5bA6JD/TNq4VM29Bt9ADb
         +fOgXGHb1Bi555pSWO1Hk40Y9nXgZshKhjmBOow2E7ibda+XZHkIlbGVMoS8nKXnNBYn
         WaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740710453; x=1741315253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0drAA2PvbJ4hUCTdzmpW/pfB1rIMSFKchoim7lWctY=;
        b=Ai8oOK77Su02ksTFrEKSsdfBwJvVMhXAhjJoENUE9ynCgLB+cU21garHIySKmpGwiT
         FUJPFTeoLHPimDXPNyL03p2QfPm33NIKEmBFXOIRRmGaEHwV/h7/xBZwmOJIqfQT6+7O
         o4cVekJKAkkyry9Zxq4IqRqVBftn9lOBqH6/mZ8ZiqA3xhmhIfw9+dnBI4mwDpw+jGyl
         rhzn4ZgPWJYLe+zKKuMntjnU5gKOoJLpi8PI4RqTm+tazzUYtHVscI5LI3Bfe5pL6AHx
         o1I7IEnDJWDQUnBpkjfs0rpsNQIbme5P8pRzuAcW2O+Pk5dfNQlApVDt3vZsGs0g7rl2
         JI6Q==
X-Gm-Message-State: AOJu0YxFQe0MTMHXj3XujvhB5QqbYI8NAx7CzDktfxAdUY9wov8Iw72W
	V4+kAC3ZVMegIb5e/qKNTmifYw4+i6AOVHA46UoCabKO4UnQ060ygjTw7HvrrL8=
X-Gm-Gg: ASbGncs6rmbY3SgDXqAqysI08M/3dX03DX5ExpJ3higrfCK1s2W9pRODlgcKPIL0d7M
	cREHLpVSBJop/aDvChvvubsbX13+KVOPjeL49er/Ruvq7khO5zsMAyLcWS50ejm5C6nSWHxHIwU
	1rhOoW9uxeIbgAql9LwoO2upvaKiJAWc4oTFPb3BUQUI+q9oxkDJIdb3bpvdYlFTBoIbRqkjx/D
	0o6I8mpm4YY6mrXYU5NGR4tRK/UPC21HtNd5e6mzx1Q7ioREFdbQBHBY/K9I9NDGrqwmWUF4XW1
	UfZ95vajaQhZf5/5segskbRedCKIuE82NQ==
X-Google-Smtp-Source: AGHT+IEyA6OYswRzZk6KES4gyk4YksuY5o9aOh5bM9ecrpKh5LG64AXf+j9DZx4ELbV5JDnuU1skDA==
X-Received: by 2002:a05:651c:b0d:b0:30b:8de7:c877 with SMTP id 38308e7fff4ca-30b932f27f5mr3782391fa.29.1740710452656;
        Thu, 27 Feb 2025 18:40:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:41 +0200
Subject: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
In-Reply-To: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5ERbWujSiKto3U+OO7RC5nldxvAV3Xb1FsVd/34DI+E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIppBKKZZWahn5Gl8puGu+J1APz0T7Ew7c91
 NvB4zUOR9WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKQAKCRCLPIo+Aiko
 1eomB/kBscyXJstvxO1FfWarKxnLaj7+/cQqdJ7b2BZA4oKjEbWHt2gFNgSYoHv7kOWYpUX11BW
 GOEP2C05FVnfyF6dAFFx0mebAYSL3KQGKruZ5UmU/fXl3oAMzp5l3/H8Wav17TR+3S6eREXFEUX
 P6EYdVUAY+SIMsvoVXjsm+MEfBEe6hrDo6xtWeHDslnkniKMMZ8W6mfbNjXmaYMRafQtpOPTg+9
 EzqgYx/i//5cMR3KYNmfD8xzFYv6b1AjfzxcKEYahT3njHxlN0xubMbY9xyrNbULC769joFbum5
 2HMO77CtKfK4Aaxm3utxQUGoihOPJq58CCHDcD12f+w5MiYE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK and
PINGPONG_SDM845_TE2_MASK with proper bitmasks.

Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..4fdc9c19a74a0c52ae502b77fb8697a53bef0f97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,14 +115,15 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_DITHER) |
+			    BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
+		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),

-- 
2.39.5



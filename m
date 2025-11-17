Return-Path: <linux-arm-msm+bounces-82128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DEC64B6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id ED8A128E7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FD7309DDC;
	Mon, 17 Nov 2025 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLuLI4Rx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C01335BC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391102; cv=none; b=uCoq7aXfMHuSX8SEeuLPqEXFMn6FiM2/Uoxu70RwVliB924t+ycaJdKJ2AAbpsbIs8Lpxj9A6X/4brqP9exC16CW+gePxWYxyprISSkHbLpALDoP49WW3alSXjIIwor7Im004EmVxTPurGKEt0kqmSkI/dOXEat2rkQUxTSKSuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391102; c=relaxed/simple;
	bh=qnOrNESQ4kON/eGGcc8Sg52LyYkaBgKNyQ10apooHYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ueOHPTejsHQYYggie1RyQx3Mx5XPmt0yVkTnJD1utZtQ+cnFbYm4+lKusL/Z1vPPxjGSgE4xnXFzQzYOMJzo0Oq1YA9yv/I2dccAyCQQBvTUCJ1An01wGtG+mYFzYAr3Xq/fgDFgE2ICvCp8Xrfvoal/ycNDujU6xpXeyYA2YNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLuLI4Rx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47790b080e4so15729955e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763391099; x=1763995899; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMR46b4uQ8zvIZ4z4OEE92HyB4AJdF7hHAkE7g8Mulw=;
        b=YLuLI4Rx0gD+V7LGpoPqoIF88Swu/FuycyWLlLNBuOdOgDzyiyL5toicXFXfDrlrf3
         zMMdF8PODi8f5XyO7jGBjXRlWwfD6EhDmUKcsxZjideChFhcrQ7CraAEHJLvcWBY0yLU
         RuFeuuO7L8RTkfAtoZOx3DpvYI0W1Ej3NKlxcr809uALct2rJgH45Y+YRHCAG/LJyPzh
         ouQDw5eCp3huiyYPHtSDHHWOPVkPTf2+7r7QC8bC+VsTdgR9JFXzJ9z6YBzUBmFrSnN6
         SnizowhBmArmANtKQJy5jPuPnjUrUvIDVs1U/kW7J5hnD4jvduZmOHipHb/OmzUheybi
         VMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391099; x=1763995899;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMR46b4uQ8zvIZ4z4OEE92HyB4AJdF7hHAkE7g8Mulw=;
        b=cQ9Lxo4rruXupMF1aGpMygJqTtlB86VA4t1xpdVyRZIzVjk6EGkFZSAssvbLu5JAKO
         Vsx4JAqq3Nhig1ls2WvpzvAxE2xNT4lCmy0QgQ1obZLOfDTv5B6ouBMh+oDAZDfy1dZ0
         exdipsQ8HdiQaNZE4jUokh92KaKDektZbsQQAg/dSxnHgpRHZl7HhunERZ9HEUHAlkWI
         iBZHng/6JwYvH27nEyTGm5C+526pGjVHoa+WxJMRnv3YDcx/8T4mU5AzrdnCLLlMSs6b
         veJcL2NPSiHbLHAHnalfZeGEdn4gkexCyED/hf59MlM+PYE+d2U/yerbCWwP4om7mZ6K
         oXsA==
X-Gm-Message-State: AOJu0YxfWbyT5pKTxigpj7Ov9eb+2YwwJ6Bp5GfxX6V7dRFoSY0z2CDW
	9Ach3L6GG4SHQ8MaFUboL4nyvYw83luDfXZROCsNbALnmAuO4+VXY45bB8+J2V+UwnY=
X-Gm-Gg: ASbGncs3JiOUFNR5GQR5Bkx6bp/xnfTNTDmI9Jj1XSSk+IWUmCVoxwioU+4I5UgRyrb
	iFSielq4qQI1gzJXNZlDk3abJy3vg5JXG+ml9mqD5tai5Jrw8kvrefb2tNhbfERbBVcX75KI5gX
	VyrRLGCHl3SQ7vd1VDI1Nc1SSZE85EwdGhcjCdPiQ4Ukwzve/OvxXQSU6PiuE9cu1Njc4sNvi1C
	7Q153MnoABfT6YUe2lGul44bqod8yQ0g2/KceDE9JN62+GsE+tgCuw8C60mPqfOmANjrNWEFhrB
	f7XGNP14Fpy5ZU90gIUa1yNiUS3EcJCyV9HqkAstVDo07bl9z6HJGMYjKz5EQmbSvFvBUj52/3R
	zUnYlRmxFvitNZrBPwUZVLOWjj5oBBXmsP/g0zrsV/YMXqWSEqj7x3R61DQV412JSMQsUmEG31u
	HxWyaaUryxSlWyVrHyBeYp
X-Google-Smtp-Source: AGHT+IFuPywPKGEGfDcG3XySaSMUDElkhMg930wM60SJMl2cvSXCEeRs1HGQ0d5+jXggJVKqlRTvXg==
X-Received: by 2002:a05:600c:3b25:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-4778fe62d4emr106393025e9.14.1763391098818;
        Mon, 17 Nov 2025 06:51:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779920f2cdsm154545895e9.10.2025.11.17.06.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:51:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 17 Nov 2025 15:51:35 +0100
Subject: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHY2G2kC/x2NywqAIBAAfyX23EIm2uNXooPYWntIRSOE6N+Tj
 gPDzAOZElOGuXkg0c2Zg68g2gbsYfxOyFtl6LteCSEGvEJki/kci+rQcUGjS0EfPLKLFmmcBiW
 Nk3rSUCMxUZX+wbK+7wfekRj+cAAAAA==
X-Change-ID: 20251117-topic-sm8x50-fix-a6xx-non-ifpc-e89753af3696
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qnOrNESQ4kON/eGGcc8Sg52LyYkaBgKNyQ10apooHYk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpGzZ5S/Sn5xg2lbtN0jzVUFE+xgIwzsnr0zl1qiee
 xlTeTreJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaRs2eQAKCRB33NvayMhJ0TcKEA
 Cp3vLfgyZV/hDlI9A1dwBvwNGc+uzV5ZkylAmSAPv3hAWBvcw3mq4TTw+LnJakjLZb0nXOPq2PHdcK
 L3CWwfsRsFeURz5ozIqInxLG5jT9v9FSqWjrGoQnL8KCaof57vtMAklYzI2jO2Dv2bgTEB9bsaACN3
 suTMY4sZNjkNTDGUMDcQIG1wgcrT7Rp2NxVuPzLdl8tgHs3J/mhwpIHZQJeElkAYi/cOYeLSJwm0KA
 ZGPSevrKW/mTfER99/05xgA/+UBFKOVGFB1Y/s/R+n5Ta7cpW2v7ncx95Nu/t3h/JCh1Nnm4xrB9fX
 P2UOphJWgWrllsm4k9fjM3s9JhzXwjpG3XvoCM+8yU1wVxXWrGfTbBODGSz+eL/d9bhPvClz2QeXgw
 Uxn9T60+KBwcdkyZjMkA8psb35SDwt1Of44NrECEyM3YmfT+QqIxkz8kC6xeMMv/fXnVUTNWLEOOhD
 OrHbodeOv46BCnDcc20Mn78UX2awHRn0u3Y2VLlKpYD08/71Sf96ER82hEBfaID7goZm1BlG+4M5UL
 8bft8AJJnjJTefgywiGKk0Qm80vKCGjyUHee2YTYzo/yIDR0yOO4g3AZPpPeMF0zQD6CSnq7Dx7i0y
 uW+hM3IBO1a5lsbpugcjFTu8Z4jYu3YVppZtY0H+QH/iMhDfCSdR13KNtsBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
if still deferenced in a7xx_patch_pwrup_reglist() which causes
a kernel crash:
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
...
pc : a6xx_hw_init+0x155c/0x1e4c [msm]
lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
...
Call trace:
  a6xx_hw_init+0x155c/0x1e4c [msm] (P)
  msm_gpu_hw_init+0x58/0x88 [msm]
  adreno_load_gpu+0x94/0x1fc [msm]
  msm_open+0xe4/0xf4 [msm]
  drm_file_alloc+0x1a0/0x2e4 [drm]
  drm_client_init+0x7c/0x104 [drm]
  drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
  drm_client_setup+0xb4/0xd8 [drm_client_lib]
  msm_drm_kms_post_init+0x2c/0x3c [msm]
  msm_drm_init+0x1a4/0x228 [msm]
  msm_drm_bind+0x30/0x3c [msm]
...

Check the validity of ifpc_reglist before deferencing the table
to setup the register values.

Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..7ee15f339438 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -831,15 +831,17 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
 
 	reglist = adreno_gpu->info->a6xx->ifpc_reglist;
-	lock->ifpc_list_len = reglist->count;
+	if (reglist) {
+		lock->ifpc_list_len = reglist->count;
 
-	/*
-	 * For each entry in each of the lists, write the offset and the current
-	 * register value into the GPU buffer
-	 */
-	for (i = 0; i < reglist->count; i++) {
-		*dest++ = reglist->regs[i];
-		*dest++ = gpu_read(gpu, reglist->regs[i]);
+		/*
+		 * For each entry in each of the lists, write the offset and the current
+		 * register value into the GPU buffer
+		 */
+		for (i = 0; i < reglist->count; i++) {
+			*dest++ = reglist->regs[i];
+			*dest++ = gpu_read(gpu, reglist->regs[i]);
+		}
 	}
 
 	reglist = adreno_gpu->info->a6xx->pwrup_reglist;

---
base-commit: d6556aa99b8839819267e8167f04b715cfb5d4cf
change-id: 20251117-topic-sm8x50-fix-a6xx-non-ifpc-e89753af3696

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



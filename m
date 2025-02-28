Return-Path: <linux-arm-msm+bounces-49782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B92A48ECD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 03:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60B1416D79A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 02:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5995C192B7D;
	Fri, 28 Feb 2025 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+fZQ/J9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1F316A956
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 02:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740710454; cv=none; b=qYtQpJSw+agZC6vEfEcMQaaA5soL/tV8QJ55T7nG7F33rTHMifspIulU3FtsctXTTbmyZkPbPX3+RNzNSG+3dh5F59A7tqoeQY+XETnBfk5Pb+T2F/mimXfmqq908miJ2qUfbIFlifGp0hQuIB/FtyP5oFDpqUV/KRxu6nrGaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740710454; c=relaxed/simple;
	bh=Bwi+iwgQ+Rb+/es8x9Up9adCN7AKO6f7tRpJXs0LvbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZ/f9MG8+qsmFrwLXcotGcFklHa3g3MOP6kEoHvsuByixgUsS22Q9wlPAtWe2uoMUOYqj/wu5NpIZtjk4yN/ZCy0h8j7qC9W2dddWmeK9JRnodqxnJnnImuxeMfy+3c/aKOlJgFdvAZgEieaX8lZSHTOzR+SyN5lU/y2efvadrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+fZQ/J9; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30918c29da2so17735311fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 18:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740710450; x=1741315250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivKSxnQ8DB5AtKJZbKFIHtIat0403ancJcDyUvz/X6g=;
        b=N+fZQ/J9ZjspHSKmpob75uyDE7Gqfyep/NbyJCKakZEI3Q3UioSwZdRvhKai0Tivtx
         px/ViNbnNm9SeDlJ1yWWTmhllU0g40XJWyG3ygEhuLG1u6ALHpX9cYw45G3LNyi6b0vi
         pJrU+TH3WhaeCSh/NrXQw476eK6xSPpJYqJYWeQFbZCxyrhkW9vB+jUOJGu6CWBF93J+
         M3o19XPFyCw6KnhV8s34D5L3Gwg0U0lxJLhB0ZGXhqYvZPGxydNgiAR91VIcpbUDT9mw
         0oDTgkC623xe3FMRNiwfj/Z5Rv9xKhsOvX8Or1YjUaTrV6RQWSUVfp56y78yVWXMDoSX
         7HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740710450; x=1741315250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivKSxnQ8DB5AtKJZbKFIHtIat0403ancJcDyUvz/X6g=;
        b=A35lt1dYeuOyHV3gd18KCgIqe35ALBYYN0r5UdY90a1wgT475XsYFDfYMjztTssa3n
         hn9bRU7vjQVfdlyZV78y4v4/JcBRr5I4FmpA49/TvwRk2ZMEPuDjgxHUeUBAQkLazmgO
         0zdxdxCaCmJjykxpOwF8pkyTZD9kEmCKQ5UgPyBe9fDZeaw1EqPrgY4nkzyh9ZGIW6RP
         s4YquCxvib2cfj1L8xEp+V2xPzaswe5rvKDy5UkPDcv1zBurh9l24PZZXukNXGXRV5vF
         wc74NVzuEtjJlWtiDVyLmuSNCWv4MEsVwyVoz2x3QZ/TRCv28GYmsbnB2KUE9FTQDp/0
         rzLA==
X-Gm-Message-State: AOJu0YyOqD11/gT3Fj9+VvH8jDvjZ+i1BqlBFszcrF/lVaNfT/uc8PPC
	CxMg8QEB2J3Ql8i9ap+Lj3Ix5oy9kDWfQPwC+J+T9qE/02AZUGtsOgJk+vh2ufQ=
X-Gm-Gg: ASbGncvSn2LRVmy2N2iP2z6fXJZGbNfMp7fZj5elDUZDVjdXpSHt2VDD/nT+QzLdNjA
	9/U5NcXolU+QKHcod1WNWUG8Q6ogDO+0SrCMOAfITclVEYZ97WZtRNkipk+DiT7mHZ2t4egh+ZH
	3WF16oO8F6iOnI5WCwbrrDoCwyVdMIoqSadPv8/pYnnlKK0BbJnC/ipBdzlEtewdto4Qvw/gsHd
	hCOdvyMZMMOsJyZyfen+Hd7BB8G03FdfdkcQVYrC/16giv7sijt4ZRpEl9BwGFyqP1XyJ7ZE4dr
	NhVtDCxiqVjeNh6NgEtGzNulzbcjQhmlcQ==
X-Google-Smtp-Source: AGHT+IE/VW7ZgoJU2q0xpHj7pO/LeLZ/mYSQfo8wBTmKbg/dVc3r8HWfV/LWuQdxsmOFJYHvOL8c+Q==
X-Received: by 2002:a2e:97d7:0:b0:307:46f3:4e92 with SMTP id 38308e7fff4ca-30b9330f002mr4041901fa.32.1740710450233;
        Thu, 27 Feb 2025 18:40:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:40:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:40 +0200
Subject: [PATCH 3/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-3-b05d22fbc2b4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Bwi+iwgQ+Rb+/es8x9Up9adCN7AKO6f7tRpJXs0LvbM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIot0dlLqcggIIEO7ccmseCO13JHyvnyniPc
 KESL6DNx4mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1TM3B/9mVqc0uvziUX3Tfx76243xUbsqYZITOi2QiWPJ1rY12KtI28dI38UK6LtJWufHmCVOv6U
 K3AteEANOCQhfsWEAcc2X5OoZLxbhOC0PX5mWxhIa1fBooxOZ3qJ0iTaAvLiM3N4eMfpexuwqKQ
 PiYlKCoUFOrBG5pX6W8t3ttXhit7FqPVEl306MqBHnMqsFPpLiBkkXxgGuSJN/xSFooM1RyAyHf
 oYvC6CZso81Yl2LlxQUj9SRozPVfA0EWn3N95cWaO7sxGhw26E0x1MWmFvAroeaQoSOOeiq8PGm
 +hajaiNPw/XEAxGFtru1VBOvp1FxPigWInofMvhvbmctpgb8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..04f2021a7bef1bdefee77ab34074c06713f80487 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5



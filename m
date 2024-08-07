Return-Path: <linux-arm-msm+bounces-28085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61594A7C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F8441C226CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236301E4F06;
	Wed,  7 Aug 2024 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isjoGqNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E281E2101
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034089; cv=none; b=Mmau4bPdvSOKdN52sk0InbMTAqAzDVRu587WwEllhWt5TRaME3UkUvcDZNsxDMEFzFVtEkVA4Vv7WxrhQzz3cYXCIk4d9HIM1RhQaTvZTdmM+VMaea+lEDn2Shd/DRNQbYgzUrDd6oLsYE2wKv+AIGcuBfWKGEZk0pZmbcxqX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034089; c=relaxed/simple;
	bh=8T4wVzkwSHzii8as2XbKY/C9UUv5Tca7yG03x9E+Etk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmhOwuuZeV5Lk4BaS78GYPlBid53sQddAVeito44IUyvdD5/Cuf64bWpVHaLvBVrmioKNiLAkG/nQ8JBGPA6q1N/h2c7ne7rcvcQY6K7xNLi1fCgsAUroaYxlUKnc24ANmXw1pm/ogOmohip0TCfekhPyrDc3qTns7UKPH5wXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isjoGqNo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso11935795e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034086; x=1723638886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1730mRsiiRXYfsgu04nDdv5IB4O4YngwsTVcNbNbzQ=;
        b=isjoGqNoi6tzMsMQJWWOlv+TbVkrOq9oyZ6MakgnjZJd6Z4W7uXbaE67r5ecl/yEoI
         M9Hil2gpwxumW4Ap1SqKXK78JhEXp22+pfovrfnEJOT5t9C7n/4rmACuvofm2i6z6ONe
         lSqgSeXSzc6ZKVbJetjZsfviHaQ40+gPQAjCY/0FrIi8qPT936HuiIuhZTftqzYT9d3d
         wsxFGfXTm5inX716khAa10XMQFz/QN5uqhqX1u4wlU45hegXMg+ukg81RsjQO3nUSh6Q
         ggv0Is2ISqCKZmrif31eTmE1IA4zyM2SCOkcDlXXwn6r5sOGkz+5AAZFGEKYUNdXmdgG
         lyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034086; x=1723638886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1730mRsiiRXYfsgu04nDdv5IB4O4YngwsTVcNbNbzQ=;
        b=lHfoqWFlADGvym/Ndtdo0JEhSMgcj+xPFPqtXUefKeaFNWfo3NA+1KtV5JklDBsF4C
         3miqqsci4xQRXtkQJnfXCpWu+KKxFCLYm3+MhYdxNCxyuBQJpMnjcNiNwPmuHV9sGvyN
         sBs2RX53qr6J8Vl2wmfLfW0e4xJETn18GLU765p1Nut/1yRvAoNM3TyK6YLZgX5CfShn
         zoMcpySgf7H34aUBdr/imltfntweitid6UarkwXl1F2c9cHFaKxfU4IHHBclg2KEAV4R
         TIzyf2+z6z0z7NG5ztyEwtbT1Euq3UVg6v6hfL90QXXjtzg08GXpA4HDKGRQ6LQgFL9B
         8VhA==
X-Gm-Message-State: AOJu0Yy7KsXJzNHd/tCsgxYKJQj4JqTLkFFEUuVBzRnvNjEdyuSegRGt
	NNow61ErH7Zttr3iQaa9laLWBxPtPGfn1YpMXSfo6z/7m0eWB2YxJ+KzJQdC
X-Google-Smtp-Source: AGHT+IF7XR2+0mDDMNwFIrcAQU+gpFvdUP+W3EsW21nzOv/ICGcIgNlbSd5CgeP0CZfoDTem3RkDHA==
X-Received: by 2002:a05:600c:4ec6:b0:426:6960:34b0 with SMTP id 5b1f17b1804b1-428e6afea7fmr122535695e9.14.1723034085507;
        Wed, 07 Aug 2024 05:34:45 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059714d5sm27198425e9.13.2024.08.07.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:34:45 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 13:34:29 +0100
Subject: [PATCH v2 3/3] drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-a750-devcoredump-fixes-v2-3-d7483736d26d@gmail.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
In-Reply-To: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723034082; l=1121;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=8T4wVzkwSHzii8as2XbKY/C9UUv5Tca7yG03x9E+Etk=;
 b=wqIDhuEtX7BuG+jv+vjbRVSIMhMfbRqv//dwO6pXsZU7yoCL6B/Ds++kyG+eycDhzvfmU1tH6
 XiN3OGqFP0nC/FEfH2WvGXWOcXg0C1j09EJ+Y0051f9aU0voy9B3n89
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This was missed because we weren't using the a750-specific indexed regs.

Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index 260d66eccfec..9a327d543f27 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -1303,7 +1303,7 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
 	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
 	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
 		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},

-- 
2.31.1



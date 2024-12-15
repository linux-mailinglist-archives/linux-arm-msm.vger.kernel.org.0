Return-Path: <linux-arm-msm+bounces-42263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D76809F23D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24577188539D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 12:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC8A18FC81;
	Sun, 15 Dec 2024 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rPfNr1cl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1518C932
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734266432; cv=none; b=MLcuV5q3tbte5gO4GvN66i19/fnO/3R1VaB40GMZqkR/AlpD6ZUee1sjBYBytuTroqGrHOvTtYKcptfSnYlhOb14ELnJa/JlVlcqsboNTuuv+6R0aa4DufdLCHuPJuzAH88aWKR3dwM85Oom/RcmlTKt08HJgHiaILbWFAhsubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734266432; c=relaxed/simple;
	bh=rtLNZvWI4/c1Z6JTypcd/rzPjp3y7gPITQRLIp73VhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9wa7kKWv9eXN1vD9iIggSVB0LqucS3yFzmt6n5n6hPxoM7eKj2J9UvjXPWiEJgRLXdSAbs714kpAnKjxABPgtDBWnVlpT++2Y1bxwnR+IqYipsXOtKL36oKxfpLdXTDp1bGWra5AnnUVLABGfz/HZoPpIieQkIxorL0gWUI+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPfNr1cl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024ecc33dso3511673e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734266429; x=1734871229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKqGEI95SPDDmcPKpKKR/7dRWUBLgzZRIDEydq7WGYo=;
        b=rPfNr1cl/OtciG5hd3bXPLzHfuWFk/JK76AAklymqoWg+R35sueUQljXF9mEY+57Wn
         WXPmFhkl4KUkRORSKBaLneGotb/BCRnKMwlnh/JM4cokwKvhlm8LErnNWGrDuqM2SFl1
         AHIbrriplE4XGOH37PmOlKQoictU/OdkxMiOwHD0JFRQZ/H/hqpsY+2FRcDZZc529GQr
         0ozzdlxGKjDw6FVtE5tVN9WkspffS0j/guar1D7YeoBbq+9owazGt26vHLHaC0HA5c9q
         km/1Y7fYYOAAw2oedSZSSyzLY5NoxJAd3BIPnyPhv6m4jC71ZxASpChlEgIf/IItFlmK
         kWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734266429; x=1734871229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKqGEI95SPDDmcPKpKKR/7dRWUBLgzZRIDEydq7WGYo=;
        b=WHxGmwEY5ldLBAa5Sb/nANoouajiljUN0CSEM39J69MMX40ZTWiGODyBd60yobKJj/
         MO6zL0A2m+qO5tnNMywukoVxhjMR1UpWZoWixxP6FXfkLNK+KMMDxqF+AuDsaQx+PCG9
         nJCYPyBIT7um8HhyvbHDPh0ZIfdDZNGtOZAIxM560CtRDpaRyA3Levj6o0Sr9Pc5c0+/
         5oGBspc/Smz3maAPwb4NW8UeUPFG4U7p2/TcLoFCyLwcuOcgI5fi86vfRnyEvQbPOAgS
         e+xMPyeXdfCesfzs7gx8M8RuB9uid6osFNqPSuo97JgPGpgskY+ORzFAMjrsSWqVpizd
         ZiXA==
X-Gm-Message-State: AOJu0YyWF2mr4/zfeVtjQ1IiYBK0Oc2Z6bTiy6fLekLqXifj9hnbwK8l
	IO2w3vPvP/BGwbfTSvjEtuaarPACkdi2szR4m+KU8ouORVZ+Y47m9bdMTuY48As+3xow+1rL4k/
	V
X-Gm-Gg: ASbGncucCgx7F1RLmA3V2kWSsV7LyPTxhjX/R4+TulPp9cmph1boezZXGwMN80/5mTI
	jdMonc8CmLjTjtOeJnH2jBLuNy1Bv2oucc0HWLqLHi/1yAuZ4JSPU4/fiI0UaHnCL4Jpadj3PKj
	B3J90d5WTK1w2kRDxv4yVQR/6IsUV0pWLSLkijwtQAfvrOUkdPfcqjsiUzYVpPwYg07kcNP+KvX
	5Fap0cJesOGXWnocAZZko0LApmHhH+qFkMpJ01boXB5lIWmVp2FMbJ0V+zFiYJn
X-Google-Smtp-Source: AGHT+IHmwjv0eptuZxFT2gpCHkWuQYV+04StJGmgC+Z4JEQQCD20hv3AqzkFpjgizuTHMQMM+eyw5Q==
X-Received: by 2002:a05:6512:2356:b0:53e:3c3a:2032 with SMTP id 2adb3069b0e04-54099b72f79mr3223549e87.57.1734266428987;
        Sun, 15 Dec 2024 04:40:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13be2sm491481e87.195.2024.12.15.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 04:40:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 14:40:18 +0200
Subject: [PATCH v8 3/3] drm/msm/dpu: include SSPP allocation state into the
 dumped state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-dpu-virtual-wide-v8-3-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rtLNZvWI4/c1Z6JTypcd/rzPjp3y7gPITQRLIp73VhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXs4zHmqv+4KEvs+fxhU8HXyTshs00svWF3yCZ
 T6ZvsMWzTaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ17OMwAKCRCLPIo+Aiko
 1a/7B/41SmL6WXZHL42KtlTVJqEfm4JwzZrRiO7+EugrG1qKC+8+k1TQMOS8fjmtA9SfefGuwTe
 qlhWq3y18LWzTMHxLh+BKbguLUrLIP9RsaHzEKF4S6Q5qYrM5BKzKJbYn4AgxOPCKn5ScLAvPqZ
 jj2K93ctOcK01v9sLQp0bdcIvZWqnhc1algDaWSmFrdpv8FBR+5zOXJnM8nzHbhnU9bqkYieebx
 4OvZq2H6wtpipdUTg4Qb2pUkSwjY+ehAhxsL8q07t2SBEfjM7+L53yeF2Y0kuTd/BN0SntNMCSj
 O9byED58fAcpKgEQr/2GVjwyOMcvx7vR9goNc1p/+p4TDG+p
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c325bcd328aa475cba9b9a2146ee3e009816551..17b5d53297f23169aba3537f85f02f04421ac9e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -941,4 +941,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.5



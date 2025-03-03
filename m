Return-Path: <linux-arm-msm+bounces-50017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 995A8A4C4A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B804A18977BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953D22135CB;
	Mon,  3 Mar 2025 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSFZ1fxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4342135D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014919; cv=none; b=pFaN/UjSjDWE5lmhhlnYfib1opirJGi7mn5+axnJvw+NbRztG9mY2omVWCxrLgcQ+lJA+iHTlBSZ8rJxyUTJKIPCOy++D+6o9YMUB3NMGGynDx/PauweiM/c4PfY4Vh3s+6GTZAHpflFyEXebw+6cRRHTpEJgyXyjvpeFZ3Cj9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014919; c=relaxed/simple;
	bh=80huhgGXFEbENAM104XVYwfft3r9+sKb5+LZQUUxkp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSjOqg5WcVjpEOjciSEPG0kjW9uwVpypDUMETQbAYtd371pmMAin/J/oYnSxZ1xfg2xCcUZNxMgHZx0L8EdaGGYYOKx0I4yTgpCEPzdjxYrpSMbto+84jryEYLgCb+rTSnKeabB+UJWwlYnCD4/Kndelq1+01kxVScytK0rTQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSFZ1fxn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223a7065ff8so33747245ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014917; x=1741619717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
        b=zSFZ1fxnw20vgfqQanGITADfLy1UQGbpujwpzgv0PvhhSpfXAMRqS08uqzJlsXLjgM
         xSNzAgxeQZVoNHqRc+TYXObLWRoE7TNAiSRUyu4TEcKhjKh+4twbOrvFnPvJVAi2VzLE
         GEV/iBAK+8zNiKCAnyYop8ZFToj5/4/S74PRJBSHPFdivCVxHbPi5K/7yI+xLIRkK+KE
         17cYTVNdrbRg9jaQj8lKCIpLiGusuUA11ai/ayDI9ZadrhbUp92f1rTR4KBZJuTU2lsS
         VS9TE8+Scr+WTXPWN2dWwdBAWAC/elVwTtSwwz8Vgc/tXsiKYCAqYlniy/66BUMKQo+3
         AO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014917; x=1741619717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
        b=bHtDYyqn6xs6W+6IpcHyexD3kWQ7zhjGTiv6ULMff1Llj3ViGoli/OF4K859a9umsB
         Qs2UFWGvxmfQlB0D7XDsgpveeHT04eNAvyjBL1COby/HbYGYjJOLGOTl0b8tbKGI7i1r
         eU27jagegABq47yEKuygx3qCkGOsQNDoFMD2gzAJqHOZZ0ygEMK3R3solCRov05YX/kQ
         KyvNv2cSCRcgbAuSaY4BPkE/J+/88vqMETnnfCZtGJyFBzlFDuRdRGjoBrbtHmciWA+d
         9bnN+rjDYALt9w9a4c4EIGNNXskp2oL7gM7EJ/gE7BqDj4djCb7/CZ8M86xDllhAWFhq
         R/rw==
X-Gm-Message-State: AOJu0YzVisTeW6wSevQ74dqBG+0PJFTPYPdLWJPctRut4DUPV+IPvPDV
	7TgryLtql9qV5Q8QDtufnXntIQD2xkX9LrofswXu3pqogyrX6o4uYu4n6r/ob5g=
X-Gm-Gg: ASbGncvbLNci47AoKmNTLMDTboz2s8EMUiy9obWjBJBkl8hlbQQ0X3T68vmJwdj7bEQ
	NE/PJwzdn8tF/YNGwEDUFGyEuHHCuKnQWYEEpX3+mR4DYxXOGI4DhM13qE1+oNAgqH52Ut28TrW
	zUhP/5zEMIcyzCN1f6i29UoQhram/WXYsNKs0VtgI5P+jLIYlNpo5ibac+dz1cqnkNmq9HWrDFu
	EC+/y4RBMROIX/vUp6rY8aPpSuWehmgUDWITnXVzvW5bBYmfh9RUgPgNUXPQkK9hgnn/YqCP3q2
	KxEtOsWJ1oHusjmhrWJyL4RCQsFdy9Ater69+CcSmg==
X-Google-Smtp-Source: AGHT+IEDCCxneyDGrxpoVa1e/lVrsWKBTEfTydvZL1WgtRjC43I4z0Oh76p6iCNwl8fDaA8IUbPUsQ==
X-Received: by 2002:a05:6a00:23c4:b0:736:65c9:918d with SMTP id d2e1a72fcca58-73665c992b7mr2534582b3a.8.1741014917092;
        Mon, 03 Mar 2025 07:15:17 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:15:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:33 +0800
Subject: [PATCH v8 04/15] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-4-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2320;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=80huhgGXFEbENAM104XVYwfft3r9+sKb5+LZQUUxkp8=;
 b=IbXsTCj9eEmPtD1AnyWyOeyRklNL6/w5i/ZK87g7/5tkipc8JeXMZmfHHBbvcawzwQ6ZQn44i
 xX0VT/Un90HBQaDQH1FPpRZd/PyrWnD8Jh8B5kV4ILQAVktUgA9hjUn
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f5c14b9ec34806b83c7a58b71e16..24e085437039e677e0fb4bbd755a8cb3852300a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-20063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 614808C9CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F551C20432
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B5054BEB;
	Mon, 20 May 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c8F3RVUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7106A53E25
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207173; cv=none; b=a0FsiEE2IbSW7AazInllaBQSJG2oIAw7K/M8CzOfPdDn0PKcmgmgugXczTDLhtXrNTYyYsHzeiEUTCjTWib3lBGVfUYVtPixtfC8E2mCfqXPQY1IAeEUJ0LDXFPGIJLRNJK7x372sBLU7PrVK0id2qASpPbIbkiubaCUf4pmHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207173; c=relaxed/simple;
	bh=bDRD6hyOiwSp4TuqfrUKy12qF1U6aueui3oZOXjqlN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+g22bgE7o4lTBZgHOCdKOuARBzAbvYaWQNuyQ8Wg4irKLTH+djsalAnycmcEhpn+mJdGQKfhGuMGr9t4AWFwaUBx4LNNdYBS9hrbcRJt1r2rYADx3LASd3bg29JzzGyMRXK5FoJWNtpp92rcUTFAyLR0M6YLEnunnIWvAMFgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c8F3RVUM; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f72a29f13so3756449e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716207170; x=1716811970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keee18vyiohjBfgyo9UKfbBA5sVKxKV1c/ETLbjaR9s=;
        b=c8F3RVUMMwGV/EBonHDaLLeJYjx8Hgk4iZa2AV6qoAu4jyaiNNMK/2qz11oIBPk10f
         goLZWR1LVVa/PJ23dLFNCZV0WCe55QagIH7yq57DaKGXx2MwBLXQN2knyD6trc2AtPJE
         moCR5m3OslfgXFXFEULfaALIYG5GgybLdty/TsvDuyR2P55iPWOyRTGcDc6rLco7Zl8v
         CDuJpj9kBzfZRgZEljoOhhoRlxXyG8NEBDn8pMNtHBjHvn5tnF32UHmBOPki3wzgkoC/
         ft59k8duKZLoArc+yPx1+PAuPDfhyfaHqdIwUqiKMzbywgDMf2+V74oBuPkwkLLGrjM4
         s1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207170; x=1716811970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keee18vyiohjBfgyo9UKfbBA5sVKxKV1c/ETLbjaR9s=;
        b=shDCDSanvZgt1vOMfgdJR6HzMfdFxcCbcpzYnKbenvk9935VKP02Xu5nHBZLG5HjSl
         gO/JRayMKPO1qgAAu/Mp6dnz8LZWj+8PfBZ+j+DV3Y9TEbcYmxg5/3xKx0X1w81zzFiv
         thzXPyMiLqrnMwcMRc80iMPcyn5UXxNsTYfrw22QIyapDhkWGgqgHKrHtO9Ti1FT296f
         nKv31RXEPFLOE2jHFxZNWtfJzxAHCCXI/yxA/Clu2MFej9aVxQaw6/hyYJLM9LF637/w
         tZNimaPFpWEKStIyd9You7RiPMwjd5ozjWADuXhmcsNfJYYGxAHI0zFzoLeu0GZ5hps/
         eKbQ==
X-Gm-Message-State: AOJu0Yzp8rLqjVCrduOwq6rWvTojj4B876uFd6C+n4Hv67Z7TfzuEpaT
	lvRt6PsajmZiTDbj4poHjyqAYx70UyGByAzNTfA9VIuRz5GqygL8vmk40r6m0Ks=
X-Google-Smtp-Source: AGHT+IF6Mhvh250bABHjRxzDkj9uIsdB07MYJYgfIjq5uVOdCEnVKqMLdxmE8efNSAAbbYwjqx1KMg==
X-Received: by 2002:ac2:58d6:0:b0:523:b371:7b78 with SMTP id 2adb3069b0e04-523b371837dmr8066261e87.13.1716207169840;
        Mon, 20 May 2024 05:12:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:12:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:46 +0300
Subject: [PATCH 4/7] drm/msm/dpu: pull the is_cmd_mode out of
 _dpu_encoder_update_vsync_source()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-4-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bDRD6hyOiwSp4TuqfrUKy12qF1U6aueui3oZOXjqlN4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48rPmBSdBCPNcr0Nq4uZbzKAxnCAn9+N3ua
 l3iyx2kyeWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1SnOB/9b97fXE/ctQDf+BNb0r8haZVhTOA9gVVSIuS/CxtjyFcBl0xqbfoyy7HDqcYGQUXf96D5
 DiVsXnnEdODCvHMy9wyBO8lfpq5DapeRB+XmkZ6X424lZGw3XPze2Fu8kwq9J9WyiMRf46decbk
 MByl5kttundXLDlIiXnJvr3XpYT9GyKK/zVxBQhlpJk5ufKWpedVWI5eAd0Oaw67u1aGBImeHDq
 u4Y9eUtxdvLUcP+jdog4B301ApzKvbYCHHEVtSe56Cen301dQL1pm7evN95Gwu5XWpNapC6bDHL
 Letok6pJO2uU40lXqYVjUWjzZkFOdepwnVMcAoYHantl5j75
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Setting vsync source makes sense only for DSI CMD panels. Pull the
is_cmd_mode condition out of the function into the calling code, so that
it becomes more explicit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4988a1029431..bd37a56b4d03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -736,8 +736,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
-	if (hw_mdptop->ops.setup_vsync_source &&
-			disp_info->is_cmd_mode) {
+	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
@@ -1226,7 +1225,8 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
 			dpu_enc->cur_master->hw_mdptop);
 
-	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
+	if (dpu_enc->disp_info.is_cmd_mode)
+		_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
 	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {

-- 
2.39.2



Return-Path: <linux-arm-msm+bounces-45196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BCA133B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2FA1887075
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EBD197A8B;
	Thu, 16 Jan 2025 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xjo0EejM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67819644B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012378; cv=none; b=bGHKctZsvi2Gmk7PtQei1K8Pl4wtyA84BWgZskrfKHTBd88Y5Tx36pH6UtbsoIgmxFUjL62zt7zRrV8BjzQXWM1nSs70eLIetZ7ve3i1rloDUXakQ2UrsGxZYKtZDfU6Dm9RqfuJo4NCm5kyLZyiFLMc07uCv1ifQRwI7yUrNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012378; c=relaxed/simple;
	bh=u2GFE12qLfx13hrjSJDIvSRgATGg2YWsZ6oSOw/ZiU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfqF2xl1SNIU4dLcBGONoSiVH2rk6MQg64DSf2pVPwnD/fnLD6hnQWW8iyIvGjhxUkGK9zqYYrm4z166Up7V5XMSxbdfLeU/WISmZC6lHGa80w0ah00FRhAaonIJvTyHpo+BZ6tTQ07JvwTBAcnmxRMT2XpSjgXihqeUMBbUwMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xjo0EejM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so1231669a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012376; x=1737617176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQBV9g8vPMf8Uq4Wh2MqOnJmIVXoZ+dnuZKYDKl6oH8=;
        b=Xjo0EejMVYOzbry9CyB3XBDoa1+HDNyXZcDiamjoNYizrE8BINPUfVUrr0YpZN3FGy
         erJQyHf4hFm8oM3e5K3Bvc6mHnR8fo9J77wg01mVH4yWWxjRqdfy0bgtBkPr2hJcTciL
         z6e7+Z3Cf+tz3tzCA8IbmngZHgIWHPhH5yA9YqVrcebWRFlfjDMC8pVe0VQSTyLhzvmy
         3FQlMhStv4sIG/vhegzmqfRbb1LBr+Jgyqcxgp3Bl3NeOAuVTb9NhASUYV6UTNOEcRHz
         5EQ8z00WXGgitOWJmv2G/awznrP6Burop0/RQYTMjpJFAJ4tiDywE+IXXcFUNGWhO7ow
         +9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012376; x=1737617176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQBV9g8vPMf8Uq4Wh2MqOnJmIVXoZ+dnuZKYDKl6oH8=;
        b=kUAKeTh3sGA5xJNbDDp7MCqYywgXTRHQGDN/5mRQv5O/l7odTmM3B4qHUBQyRdqSN8
         EALZcpIbbaP3hVlRc77hzoyCVLBLKuXwerpIyu/nnbLEz7In+qrnahvUtqs/nfEWI65A
         1sTZcF6S8MDJUFZaCg32C2EVGmLNvlQ+/1FsOWNi7L1UJuZcHZysboXnc54FFwZo+eJS
         oUSiocJl8KeivmVfEQtQMI1m9vS5f9p5nbs987MBjqbt3lL+w/c4eUVIQb6580LCU0kF
         zYqrbDliBo0rmmyeRx8APQNGiVj7HLioUOiKnOljadDQ0kMsAfCNNpKl5JB23vkm1HnN
         ck/w==
X-Gm-Message-State: AOJu0YzjM19DsNCX5pgkOIAiJ2Yu0TSVLdQl4I91DaqYTT4lUC9m6Tl5
	/kPAAQSpX+Nv4grCyXuDO8LaldKGCo48/ncqhnKpYj6opMifEyFcV+w4M8S/j+7ewlhFyQe58Zj
	WKY/W0A==
X-Gm-Gg: ASbGncvC7tdZMuN90qgRCHfkXLsxi4LsbuOBJgjeUMziAn+dxPmUBQwAu/7GsXmqVon
	mBCepETxLGwerk5A8pH8clD4dgikSPqT+O0OtyunmM8COrRn28M8cJqadhLGZyjJ5silRDnOKxP
	ZnLBlzRZ5zxrSyYvtYBDyjPmLsUTcKJjtVaGZXct9ADi0yUfflzn38LempWfLWwGJ+q6Z+cgTFt
	dZ/eqzxRZzI1bscqnwqiD2Zy3whw54WY8kzwq4MlFM3ogvNf10eXg==
X-Google-Smtp-Source: AGHT+IF00SipaBn5NPWzgB5ZXnkdSOutUT9Qtc1tzeasYpsYLXBSfDlP3UkZIDf63uh/CeUtkd32rg==
X-Received: by 2002:a05:6a00:1942:b0:71e:6b8:2f4a with SMTP id d2e1a72fcca58-72d21f7bcccmr46697624b3a.12.1737012376528;
        Wed, 15 Jan 2025 23:26:16 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:51 +0800
Subject: [PATCH v4 02/16] drm/msm/dpu: Do not fix number of DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1814;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=u2GFE12qLfx13hrjSJDIvSRgATGg2YWsZ6oSOw/ZiU4=;
 b=B2zJX6OxJVLb1nrnneDJA+HhPR1wU8/wgPl7b3y+aZsPSv5T//cZ1Jt1PN18xaQ2mrJoaqZBN
 5jJJG51NEgnAV9vF7u6k+bPJ9d7rg4hiMBWYlezra+R9lwvwAnGaIVL
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede..c734d2c5790d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1



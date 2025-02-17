Return-Path: <linux-arm-msm+bounces-48253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2786EA389DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042C816F551
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8918227584;
	Mon, 17 Feb 2025 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGPF3/Xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86855226197
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810522; cv=none; b=JENobO4pzv9ZwYqRhPVSTerSzXKjzKEYVdXLeJ7BrFLoHdPshReGg9BSkGX4PJ93VVYeIPCiFX86SiT3MWmGdybvOTAN+6lUa30yaiYHKkgVQgjX7BWeGd56qgkY09dQh1x3Av50ouzMHeTUxYtglWqCRX0ChuVbuZdQ9lZ+bjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810522; c=relaxed/simple;
	bh=gjDcijeIK+Nbvl4pp10G9LcIQXqKrKmuCKSb2tjPXgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SA7w6ocbbMVbIsnXpigqz04kmWVEbOtCnqa34vaXftlgavP+UZ882EKeOcsi6ZLmlYdnDjks47B7t3+1As6VFTJb22K5MMHRNI+EBfk+L+DkDXxmQkYyAvSLCFaGm6tvy+mB3U4Eq+YwZkJ+YrYhbeRKFhKAvf6lRxpzGX7Y7cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGPF3/Xh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abad214f9c9so53959766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810519; x=1740415319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/r1XMPHjuDO1kyhnte017ae1OCKgAX0b3pXvaRphac=;
        b=cGPF3/XhUUfBYji3T0peSRavUyG27+BpNm+WYIRE0jBffvHEJpb2ISliebiBmCHK1p
         oZGlueeikf295Yx2ZNEPnWPrsREm8gh9YYoVvqfTvcV1dDCuRQq0b9lr2F+iv/z+v9Mc
         AnG2dUwCWvlxfW85REHpGjkjgzFQwqjxVlOetL0b9fOYVRUQpX7EjkOzJNLm7RVADXGh
         c9tGZJdFfqbJdR8nIqWdro2s9rdqHthabqjTdEscbPNUMPL7jN6l7FlOqxPwXa2upycI
         Xku3s64YY+btYfhLYzGhsPmqCEBTGzl304GNori+vVGthyGlsGZ2KWxI7mSBuokk2ESB
         w3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810519; x=1740415319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/r1XMPHjuDO1kyhnte017ae1OCKgAX0b3pXvaRphac=;
        b=Ln1qEslHtmMeMjmBw9FbyOVc1CJDV1ws0h3qwdIa/Rs6Ue27zdJhkhBRyVzb4a5y/D
         oLEdrmiMq6P4LNyh5s1zdm9IZEtxfkQxKiiddCQrpWf/1wfkjfMwHZ2nSIuw+J3M7DMA
         HrJk6At4FcWHu18VQyrxvBqkKjJ5EFYH8bjts7AqRvPmA6sFuf+rwgYujWGlajMdGQ9p
         HMLTcl7fa4UOMq/OWL14CNrpQ3tUsEJn/Jkg+qQbuyGeEeRJm79iqj2L8/QdwgbHGfMN
         2AEoSFM1IT1VAcJeI5uJnVEZ0uwAnWM1BrAkB7gZP3Gi6cHM/tTl8lzOnqRpl0PE7M4a
         5uaw==
X-Gm-Message-State: AOJu0YyHp6tlehohZsQp6nopA8Szk8bhOQ1I8bj4mItbpNn/YPoHR3Aa
	szPhOcZG1sPe6niC6Xna96m6Coj7toQFmoiC5NA0lBX5n4cPav4ymrGjAXoDyB/Y9kyvyofvpNX
	k
X-Gm-Gg: ASbGncvL8EKm7vBF+wwA8s8KhKNvrJ7oTOmFASkvDGKqx0yCxXz7oAICEa3vhX8IaeR
	VUunM/G1mYhfsGyrYPyF83Vx6Whgpa/XM6a8qbHaylJYSAEur6R+16JfE2lhBK/cU3wm6tPe5gw
	If5e6TYqeYW5863n2ApE9ocNOBwVFofFwOmMl+oR8YayqOU63qOZBbqChuD6oVktTiuVvWDBsr2
	DLr+BrcfQVXw9Ivkoi1zdu+0Bg1XEEWcIiZMUgv2B91k1IJJIhD0Eo0cdkblqVvpQv65v8S6jb1
	+SUBLW6U10dJ4m6fRqySdQ+WMNKDcE4=
X-Google-Smtp-Source: AGHT+IEWfnRL5i+VB7DrmpOwOnQj0z5hxTupC/1RGdp+N2SQOMPBNAMglWHyaypBczdPiq5cMcXAtA==
X-Received: by 2002:a17:906:4794:b0:ab7:6259:870 with SMTP id a640c23a62f3a-abb70d51d82mr372691666b.10.1739810518930;
        Mon, 17 Feb 2025 08:41:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:29 +0100
Subject: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gjDcijeIK+Nbvl4pp10G9LcIQXqKrKmuCKSb2tjPXgo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a+KYCS7p4X/NziV91PDzLks/UqjmtIPffMm
 KiE7JFAIyyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvgAKCRDBN2bmhouD
 19hMEACZWaTCupbLJoR/1UEEcwXP2fpQ9ZCltQvfOK05lJoEJpbIQkdqn063y9cv4as2AJxB9Qn
 oAiyOtlRVecKPf0SuRecxBl2oEkjilHBoWAwadGMKmq7SphEFVbPQ1fucrSBLyTIfN6dJ8yqZbN
 9vhF/4v6bL3CHOvoNmq8NbMTQMLBlwBa90mbgjpVSo8WBamcBouxIYtJoUBlWaIqg93L2wF3YH+
 CwEhivw6yHQ6aG6JHtWXwMH/jVeLKfi3/nxwhcS9q28uP8K1J+EzfcuPsMkHhMnn26T5LxX+xPi
 4DsOHY9c7nJbYZOcKbZiFb+KywjjkjRzxoKK6QttsppNoB8DHanUqGgAwMpB0s3ddj7pOqtLLX6
 XV7iPLgoBGtkf/JnPIdP3xEbEy1iiVCSvq+Xgs5xgYtwQuArF28NNsO5yb4GrtRBBlMO0mVOXR6
 hJFvUDVCxiQyM39RrsPGHIxk/U+KNYyGYSofYZxw+T8I8eXt2sz6fPduNLLKh9cxDnv35aMmDuA
 ODmwSLP5hRhll+E5j07H4zQiXFsCQOI34ehfo2bNIcC9hQB2VWpsmiH4imWCWPyZG9wA8JQXeyV
 wBOszpX8tGEWzwI6dc8TlJKWHAcm7Nd05l5TOsYnrj5kHIhBx/m92WTdNT28dKwDAXSWl8+xaFD
 5H5WiASBjP2KhgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-51049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D522A5CEC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94BA47ADC34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42BD2661A8;
	Tue, 11 Mar 2025 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0g5RDhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17E266195
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719757; cv=none; b=QUUW4gUJOvFlIYaukTAA1r5ShkyzEsgteXFTPLFUuBrUyUwWW630XhxxTrG7le4aLoMkB/vy2GYJfVxdc3VPQ7Qo5AHq3Kn9zJrB2ftwlZyYqD76pDsO4WJ9bbaybqZA2tWfJZQghQXyH2V6x3YJbpSqb68DwiYdkT1koHpN1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719757; c=relaxed/simple;
	bh=o16ipdDJogxXtmv8XiNUlgMzR8bXtNv0QSZLobZ5CdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rb15NaMRXZm46ys4WcB7kp6cmi9FAEzVnenbu6snoYpp+hkFS/ht/sm/Eg6sm5ijSV2u0vaCd4Oq7O2cXGmqY1LgAA7zoEx0ceh2h6CzHpAqF6/q+5L7wIoRn/V9zPeWUNb6U7rXBfM2xi4QiyTCggEldRBEIqozQRz0c1BNmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0g5RDhC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391324ef4a0so300730f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741719754; x=1742324554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVge0Bi84m1W4nmefcb1/Z/IlfylqQMKskx2WHqiPRI=;
        b=J0g5RDhCkgS5qvYIAiB+bz0p8hE6g8eOBJLjYQYfVJdlLyfnrbT9doGD0BjFQgPyxC
         +chK1BFEBhJx5UXrBLkE5qBt7asHHsLjOL7vkMr8aiEDea86l25TU1vjTjRRR5pwUZOi
         z+SefIorzB39lsFEW+K1bvK7NB+Myiqhtd8S/CZMO7QpAevxdwwl3lz2f/+uFka7MdDs
         /1aAet3ZPHjXu9z0WgaI5xgjbTxOgvV+9T1aSR2vnIDD2PGz1vmQmjHU7SEVFCg4z2h7
         HMN4lpxxggMlwhDoNOwthSjdaT7u/v1EQ7pEDjtYtB/x7Qiy3LyvXTQXM5W7w3tHQRJA
         XT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719754; x=1742324554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVge0Bi84m1W4nmefcb1/Z/IlfylqQMKskx2WHqiPRI=;
        b=BRtre3+6s97ggZj3yCZm+lAdX4vgEeAeM8Tejan0eRL1p7f8OnPjWZefl2D8En0AYH
         Q3UBVUJtZECj/hPTY6/aRfUU04svoCZExAxt8RQUeja4+WG6/28m8S+154G/sTQReT3N
         2+Z2jcGWEJq1O4VtQkP5Uj9dOzjNxXsWxtwKcbzv0QRmvXBHV5XiMUhZtZ0bo0RwfE1l
         Qi4mTaDvBUTABc2mSBPZBfG66gk1btemgKL9er0PHt2eiPldG2+m+UQ6NdyJjWPwPh/E
         aKbNAURpIK9FdMe+0hU9GguCvz26juBXXXy5JTPtMBMG6gLRLKtmNzPaHh6bEH1NuWo9
         eSkg==
X-Gm-Message-State: AOJu0YyXB/+PPLTvi0gAtq9YDsM5Zd5nEaPnXqr5LFxgcNJGt0ZV5pek
	rquA4z/kHYAdgqM4AIzhSUb6Q9InMCn4A3B0aIL3eOfZWRpCwzK48RpzpVUIKJ4=
X-Gm-Gg: ASbGncsOobJCSz9chyiDcuyh70A9xzgOAPiCJrhBsD/PRhUmnEHnFp27Q0yxLBJ0ZL6
	50YCD6uQ41zctmTn5fBMUdSVvtkcqNjHdfsaTt5q1SDlX6FC/aUnKuvSNnKdLzDrlFilR0Jef1q
	Dj6EToEQgThKCQOyRAsn4Ryy6Bt0d4dj8Qrn4E55IQD1UwunLlsvJ8eQVousvq40J6lLb6nxKSr
	P87/g5QTSfTCTbqoEYLr5oopJije37OkpGuDF5BhtfG2SLMcmeF+8rObaq4/yRrF1YLn4fJ1Yd4
	JnXjuUUVKKisztw09xaKKgl2e++vLC+O7uPz1x8GADEJBU2Q3pJGB0gQXX0=
X-Google-Smtp-Source: AGHT+IHKlpY9sCmu/+h6R5RUmpIVQoWt904tfMIQ0oOjY3httFCJIuM1s3lsgHr80J6zp84jA8A/6w==
X-Received: by 2002:a05:6000:18a9:b0:38f:20b5:2c80 with SMTP id ffacd0b85a97d-3913bb5cd34mr4480539f8f.6.1741719754177;
        Tue, 11 Mar 2025 12:02:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:02:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:57 +0100
Subject: [PATCH v4 07/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-7-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o16ipdDJogxXtmv8XiNUlgMzR8bXtNv0QSZLobZ5CdA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IirK+DqA2UIM8DZHlsOXQa9Nx+Al/d/PGk1R
 zQAUrjjVOmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqwAKCRDBN2bmhouD
 16IQEACUNi5yj4LEEOfNFUK6AUDkaxdL1plVw/D8RsMSuzs0lPQIhs82LP+td2eIZavNoPmewxT
 Igl4mnEYW8nQdNDaN3+n9twRQAZFtl9zAxy/h/YLO34xhoY0cggoqpxgHPPEKPAcsSP3THmB/LE
 x6eSi9ZqlInAaiYO/vMxRJKZUMRWI5kyKQ9g1Inf3O2rJM5RHt59BlSiqW5xw7pv03gXPUL8jEO
 D3Tn6tu0ogHvP/ry+9bfRxQtp3V3i7UYc1ueD3eOC0iTAnWY8F5maVhZW7Wpb6EOkw7lltEqE1E
 236OEMinPy4moxCSHToijfAmTL8NQF5E1ab9Wgbwb52r5WUfI75I8hPGfXn48NGf89ZVt3qkXZd
 zpYGtE9jhw36+c9QzxJuCXueXWPEWnujIeGHxjfT4D1q60r9XhABITpSdz7aCF0zn0xojgeDuWR
 jI+WVmQJk2CsFfe0PcsZMsax0FL97wB4MGPRR2DopFh4gcH5hmSrYFl/iUsHrupoe15Qk9P+6FP
 2FiSuSYH4ZgwHGShWinySJYjb4MbOX8oPTNSht6iNMlxmfzyuPUqczLAPpSCE8kMOHLlEBZ26lx
 1XRzXZO9k2uw/h8flwYU84oaGIkOmssZZOpYnsFpFnr8qcpBzyMHDmSNFCfC/lar2jRkO0lAaXy
 vIgcSk1MY5MuiaA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resetting mixers should also include resetting active fetch pipes.

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 284e69bb47c179ba62363b2df2cebd5172c44f8a..ccf492f27140a2841b454d413e885e4bbd9ee497 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2188,6 +2188,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		/* clear all blendstages */
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+
+		if (ctl->ops.set_active_fetch_pipes)
+			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 	}
 }
 

-- 
2.43.0



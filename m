Return-Path: <linux-arm-msm+bounces-78964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850BC0ECD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767D34061F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9A530BF4E;
	Mon, 27 Oct 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FL12bQjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6A130BB8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577183; cv=none; b=F97lwjkIfVSvjTxIRSkNEfuHvgoNkxKDpdAgMIA/ZhAxQPgAlA1msCiIqgTsy7Cs/ulMVrVQtqqCwJgLzMpbGdKagm2p7Ol96ok2eea65+SVTfeFGccnCQpmQeK9sTNUTn1T+GV/wB6kOcRpRG+VKkBftA706ucIZEYo/3fKy1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577183; c=relaxed/simple;
	bh=Kp1VLU4+XFZTkZgR+tSxksnxkxtMD6rynYbzEXze+LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ToPjfiMKXUf2qyoMsDtiJgl18c7RMa64e5onqkuTdWDq9sCfP7qIH86NCcTqNP5118KaMuP2zK8Wr95oxnbUBugv91BfAXefFcQt68XO+jZiwKC/K3NLiKMAiWsCiW8cNLIa7UVHEoJsjlOIcnFHLoM7Z2k7UGsalzRo9PdLGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FL12bQjl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso21568545e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761577180; x=1762181980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
        b=FL12bQjlLEP+ack740kSnp9Cow67P/cXw/6wv4jYbKVO/7EDeC8edNDqkJqQw5Swlh
         2ednDU3k2RGU9udswwyKFwifQRD1CaWv4lvAcuWYJk9pqNPDgYEU6kev9FRNttPlQh1M
         jXRNkoPO9w0/CCKNaqiAmeevXw7E/rAzVfVqOklCxypOLVlNMHUUfCTjx7PSSXqIc3oA
         1y4bl6+jTo/iMCaB2GqWaYKSpli8WZLyuQYBRkEX4fl3yaz/ulAelO5GaNm7YZ8CF7j+
         UguWJtwR0AvYKQbyM5qoxwV22UZlRYMsWzphapWahgAcNcowVsiW2lDzs4OqUIN9hw/I
         zeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577180; x=1762181980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
        b=wyb/+q6h6uHf++bVtJLv7eq7H1MC8tAeZ5Ljf8+1GA4Dd+njTAl4eOGqUA0vuiPjNa
         5TLgr4SlrFayVkmRtZ9A1OahPNkRL/cn9Uxq79tUDBUERNn5/neolYacIkR1neSfJbKi
         GBaol3HOmZW2x9c2UVhfuy2qpnyfjCtHJakzFlMP3S3BltdlGzlV5MwWgAha2IQrtmBi
         0s8BfuIEaWBauY0q7aIeKqbbSj0ln/qM0okAOSH3HQ618+mGDcCGFY2oy0B7U5uVJyM1
         3wpMOi7mb8skYhJK0jqu/7hwfYuIfLjfQKYQW1chVHbkY1bMFQNgnMaudwQQnBkzPjEf
         BE8Q==
X-Gm-Message-State: AOJu0Yy210B1DHeg8gvT/gNLQuZIJ6GodVaGUvWLTJVrfE2wt619dGpk
	V0LKViTf1e6Pn5Fo3j3R4NlSrSxh7nVUgfmzq7rt5Vjq+YfvGtXP0BK78u7QRSI2gRA=
X-Gm-Gg: ASbGncuO/UUvAv64PYR0XU8pE8NOJ8TB2UPz/si2+ScvHMHSGOqJB4HGZW6ixnl9WLw
	mGDQNhAi7u5y2Dn5TETM5RPkGCID5YELg3qD+FT0encbONllYqo4TCqs5DleOVYXIIvCMZ945sB
	48dvR5o32GpwVkAvCDpSyDrdwApgs4bZlXeoFUrg8L/DZwltLOemoLLfW4Xd7JyTehpob00YeLX
	B8Y8FGxWKe2c4KJZm5NS7jeF7OLRx3qjm0jSeWxh0idHZyCiDothDoi9+Ae2wXBH16SgGhdXfsu
	QcKFxqn6u9c3GvNd6IKvDl4kQdeIbo7VvQ9MV7hOv23375YgH0b/XYGb5V7EtfabRaUcnipQQgN
	k+2//cu31dVBsT7jI+wyfmjRXh6vnna2mDYsxuyF+eQTnRaq5Jo8INqESTXDWuCrjM24DXW/NzW
	An9bGKAS5P
X-Google-Smtp-Source: AGHT+IFedbhdyUTVG6vMtF39Ky0OpPGo23tseJIEvDxXucmYOYN7UQO9O/xKimjpmGHuwhnOnJxyRQ==
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id 5b1f17b1804b1-471179174dcmr315798875e9.33.1761577179786;
        Mon, 27 Oct 2025 07:59:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:59:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:19 +0200
Subject: [PATCH v3 2/7] dt-bindings: display: msm: Document the Glymur
 Display Processing Unit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-2-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Kp1VLU4+XFZTkZgR+tSxksnxkxtMD6rynYbzEXze+LI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jOWirPkps4aQ+Xz13QQMZYJ6dFosCe6dKiI
 grwBUPQlhmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+IzgAKCRAbX0TJAJUV
 ViIvD/9MmR5ciJpbq5Sta9VhSZOQ/JTpJJkhuCwZhAv7xV2t7prQsN9T9XGyxAS3e8aRKNNYWKQ
 BAwW0ajg65MGIruV0mVneWa3xW7qK7WQanH0RBztXtfzvzeqVwcknqUWbnGx4iMaIywBEVw7p9I
 8m/MUnglybcwN0Nt7YKLiI6OwfuAB3JuLvRaQ/jtme8mJ5rHjrnhIWltKw94gzB/lrUsquNrUpg
 5Tym4DKp58u2JFEhHDDrWDx0qO2RKEg5dtJf6rsez1RDKhwPkDvNM+yALYmqbQP69SPz79wTCbk
 U27/Duo0F3XTHrdCMA/A0tPa981my2zGKo97dYSm6h83rtQ4P34zySrqjtPqewrw+QrmtKBIRd3
 TM5I+Vw9vVS3pVfdGytAkSQM/LlKy5sw6PQtU+pJXIpsJ0lONR8odQ5JvNkU2WCH4Kq9qYvnwHb
 5ex/60jEss7TLhxJ0D/pw2P5wKhIUs4thRsy5B+WXvod6RfLz8iKRI7PIx013ge8W5sDJOfv9gO
 K/rUjhHUztxgr4sFwSLHz5MbjAvk8QbiWV91E1CRQY7AC81WPly4dH3O31DjKAII2rAJ4OX3gqr
 VLdMHL5my+jdNY6gA7FrUAHzS2UPuXnkisyuEM9xVwxuWEullc8GA2ypBolnk4KRGaFL4RUqLR9
 CF5mDamtdCyD6lw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add DPU for Qualcomm Glymur SoC which has very few changes compared
to SM8750, just enough to make them incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..feb1b8030ae0e381118a9482252a915199e19383 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,glymur-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu

-- 
2.48.1



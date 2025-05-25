Return-Path: <linux-arm-msm+bounces-59353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F0AC367D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 21:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97D987AB8E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7308225F980;
	Sun, 25 May 2025 19:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0V+YS5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC2A25C82C
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201176; cv=none; b=o8Ivl3o9XRteAv709iWT38RYirPSKos0T+pGK9BM5PPLBAsAj+bmqn1gTAniBOYFL7WpclziHr+vxB6RpYPe5yx9OA4s5LQE52ijgBQbTQonI7IKOXAXf5GnUgoy8p75zTExibS//xT82z55dOzZvbH35VhdGQoA4sjeC+innZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201176; c=relaxed/simple;
	bh=o+zBjGEsV7Nh+L1RgHv+ue70NZrWkIlXCtf5K78wx4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cErkN3fasDzLSSFCaZ0nOKNV76MO1Z53N8Z/nRszdut5EgC6pFaD+Dj9uvZLrwg18xr6lNP5lSYDfmvnzlI3LQZUDHBZr3MMN5/daFuvJY3bh6KIgwhdMFpbj8bW3MErrjusa8BZq+hxPMGMQZd2fJ8KxzH1l9CDoMlqmry8oYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0V+YS5Z; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad56f5f606aso20953266b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748201172; x=1748805972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRUlUb2Nyou4yT6I2joJv08pZwPgcDoL02K0xyB1KO0=;
        b=T0V+YS5ZKBAQZhEFr/dzPJNg/tNvdWV65ch7W9l4UDi8Xb3dNo209SyDe1Wv3R41f9
         n4nl1LY/elurXxwQctaZD4JvVXPwnRutZs/b22XbW5RzL/FVsmA5MvvYmP82gcEGR9oe
         SFRW4E34MDt185tdUgVlAXq/mXln5mnuXopv4EjfczK3ikdfoVGDFrSrf9tfhMHH4BDH
         WE9eQUDoeS550nu+aLaWu+Hsswto2N5ozosVoukGAInl+UsHROao6ZtpnwhpqI2RVbdA
         EPbKaJR/ZgrlkpDXPG8O8NdYSIXAs7GgRfY07Zg4ECcUOI6u1orY9EFwGDqOQ/tv5mdj
         s/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748201172; x=1748805972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRUlUb2Nyou4yT6I2joJv08pZwPgcDoL02K0xyB1KO0=;
        b=tmZT/G6LxY/q0tEQLudk9UkuNQgjp1lXHzvFnCS3EkxDq+T1PRN2bXuJGnhQ198o3e
         hfYs/LyKDOeIjUWQWHFBaZlK67J4AxvjKwaHTNjIQN2Hwb49g+E1Ag1AdJqTYvV7nZkU
         irkSCmQuP/e/mC1cw0xpNIqm5GYLJm5nz6IaP1hB3mHpPL16LmzPdccWwYqI1oQzmZaF
         3J/siyZxSj+sEaF68vzkZxu7e3wNf2QWvbFgWbU53OzyTWcOgic5Wk+tzzqtL+aI5aZT
         PTfQJnkhx1dNvZKHBaNTtBlTJALeUjaU4F2XWdrgInpJ1sVK2Vh2Hqu8ahVtnfHUcfJT
         oCnw==
X-Forwarded-Encrypted: i=1; AJvYcCUMEhHnSapI3XHn5wEv49EE5lbzsF12MbAAoRInobqUnWPwxORgJyUDpXBgHi9x7VLgyG3RQwk+5JZd76wK@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLzxkyCE0zZfemYtZSV826SHwwUPitl3dx6KgaHh5bAoj/hXh
	YiY7bSr4EbxuxIdvnbknXNtTFm+66NT4feCSVt7VAuREN4Gh3ap+RD0fks6rYkqBHcAB8o1wOVp
	l5vmk
X-Gm-Gg: ASbGnctkau5w5KmHxi3lhH0TWIyweLpa2R1ao8yyeGiCzoDYJdNvvO0rqiQgdJzORmf
	jCyjD/mcdrGzDXmTu0ykietU4RqdnNOxJ0Z0f79kEyVPKidlk6GtINGa1F1mR/MHdFlxHffeuVi
	xtZUP8uJMK4ksK3xtQUfEB5I4qv0/u/pfvTDN8KhViJuzmdklIz5L+/vnN6wEqKqJEyO0Z1mLLj
	OCWCni9vqA4qZSfnd1Kr0LWHvm+h5W0ku5FSm6L6po1AnMcZ8zjSO1T1pYyTO55Lgapy4NrKpVF
	pZatlPSMPYC9Ps4Bz7TPgQG+M3qEx6D2P+BW0/34uSiWxCf+zzSOCTqh1P8gJfwwHHlb6Ok=
X-Google-Smtp-Source: AGHT+IFfVGR4L1d0PIoviI/b+XKZl0sNPX164Vzih1wiSBouIe+9mrXc8wqt/Sq/Vx6fXa6iQWj4Eg==
X-Received: by 2002:a17:907:2ceb:b0:ad5:1ba6:2177 with SMTP id a640c23a62f3a-ad85b07045emr167943066b.1.1748201172238;
        Sun, 25 May 2025 12:26:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1578899866b.19.2025.05.25.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:26:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 May 2025 21:26:01 +0200
Subject: [PATCH 1/5] dmaengine: dw-edma: Drop unused dchan2dev() and
 chan2dev()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-dma-fixes-v1-1-89d06dac9bcb@linaro.org>
References: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
In-Reply-To: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o+zBjGEsV7Nh+L1RgHv+ue70NZrWkIlXCtf5K78wx4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM27NXGulQywd4dJ4611aeRv85F9RHzesFtso/
 62/9leqmbyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNuzQAKCRDBN2bmhouD
 10ncD/93/gwptNOF8A4DYHiNDQDKbYhjto0iBfiweR/TZ6d3Q/pLlF0Hbu66qmHNU5pfJegAgBn
 cFN2/YrsB18l6BZcsei98IKE4uBfSlRRaaYPoBjxBjRnEmKax0Q7F4/Cd4odJsW1uCVAbZyEfBh
 qthWjO5vfh8KhTKHLzPNLf6CmP3NKqEA6qrSKATF2cv/Bbfr73TjJtiy41isPszfgreQ5KBaTvW
 iA6mMjXiy1kzU6FzTzqjaSJkSmnSwkwtqKlZscyFJRQAAY6GKpJlUBjR6Ya9FQCguqctjUsPDEw
 l2bcjaNVJJKbEfhqqOcECBIqkifPB2+45ySPmITfzbEoNcr7FPFVSqGyulYoeAkSfOHGQecZP71
 zzC8z+mP2dCxJ7ADr/xaCBWv+LZNxvo4Ncr+bfDi0OHEr+Yw56h9htWIx+e7fbErev/O49z2Lm5
 rzpmIkvF6THIWr5yDcHiXI7SxXo6mnjE7NQFlLYd6dM1wYXD70GThVa0P5qB42wa0q5BbKDantv
 RWdO3ROT4dgc3mg/wUl4Q3zLAt6TaSKCDf3BMqHNBvlljUmKk8JjpDz+ph9T0zNfzImePycLUvb
 eHgN3AkKni0nASXsQ0Be5Zg1NaN+toueZmEDbYQzHt+KeLRHMzibDL1ObgMAUdty061ETITM5AM
 GGy1XYugSkYkNpg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static functions dchan2dev() and chan2dev() are not used, W=1 build:

  dw-edma-core.c:27:16: error: unused function 'dchan2dev' [-Werror,-Wunused-function]
  dw-edma-core.c:33:16: error: unused function 'chan2dev' [-Werror,-Wunused-function]

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/dw-edma/dw-edma-core.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index c2b88cc99e5d2d7c1ea4489d4a8f561ee5f0785d..b43255f914f3395f5d0be438151d9dd0d52764ff 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -23,18 +23,6 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
-static inline
-struct device *dchan2dev(struct dma_chan *dchan)
-{
-	return &dchan->dev->device;
-}
-
-static inline
-struct device *chan2dev(struct dw_edma_chan *chan)
-{
-	return &chan->vc.chan.dev->device;
-}
-
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 {

-- 
2.45.2



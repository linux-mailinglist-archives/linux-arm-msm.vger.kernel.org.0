Return-Path: <linux-arm-msm+bounces-28399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCCF950615
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDCBB280ED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C8C19D07C;
	Tue, 13 Aug 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="or/YwUTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159519D893
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554616; cv=none; b=PyzekTAG/8McVGGQpsD6slBhSK+032JscODcZ2d7KFbX6UnD4qHmOjOWsV/Gc1etuz8nlK2TVkgS7S/K1WZ1PH1mbr9Dbg6lQZeIvytzzwxZbVg5SD3TnQQ0k9f2dQG7Q+HRfysvcTY1+VtKRJJsAx9Kd6uyVhTckMraucPk4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554616; c=relaxed/simple;
	bh=YDxB0HgopBggQswhaM9Nf30/Wv6HgEPuB5MAMQDxXIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohK8HXSbK2VUUkxvLf6/PB2DUhzQAxWHrUspTuzbgo+U+m6nYV/6Y5JSMbLFoPlC3KRTXoGvrYFhKd3+Hv2wCm4ngzoCMfRbhp3ceHUt/7X+DrXwqUckVEA7Jpujq7My6kvLwcPKlRokK6OGYwU7a/Q8bPDlV2fYm5hW/kobDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=or/YwUTw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so38580575e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554613; x=1724159413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvFqdgdGTLbeV2IBiZybZvZVviH6ZKLzya6Ui6o1+og=;
        b=or/YwUTwhGTQ0tCNWwCsHlPor0GBt4bhgDzuC0Di0kV8kJ+GIaeJo5aH9e++Y8lKea
         RDksK5BIu+pxWW/m7NG5Qmjoa6GodVTZU1hxqci0TnXaBslUdDut3fGQVrL3c8HpRxzj
         J2yR/iW0rZHtF+Bv6TFch/bnbtxh3KH8HnlRTFNkImro8xoEg90PS3z8y6DdKYGkt22D
         2LtIyD4Ly1IEjDaCM4Q7SLG2NqfqpSzD5Ocpel2wmrUELrY2kLl7ipOnyUEDAsR9Epeh
         /SruHYLbRZ4amQQD0kbhCVhz1FYBugtj1d10dxdfiIcjONpo5xeZcXH3gz18hO5AOZOh
         iELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554613; x=1724159413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvFqdgdGTLbeV2IBiZybZvZVviH6ZKLzya6Ui6o1+og=;
        b=BInmEZKx2OFeStbidZg7sh3i3ojcA+rE2jy9NXWff0thtrkKxxhjnIpSxT57JLoqUJ
         A120O9bJGa/lMKvbaAuxbEvxiJOKlnWxKpGewCerIzOeVaAnB5AX/0Yo9RlEX4DxXW7/
         VEmeHe1FVYMdlvEtrfidLrUgV0ebLUG/o4E9ZSHU4lUujhNo/HR7DtHLbd/3pAvPLcpG
         L47Rs/QtrxkV514TIkmXHR5xeVlz+T2+i+XUBZYjE/Vp0y0lhPF9X0f/zqZz0YyzWveV
         FbQOrZFUBKR7XgAAzy3qv0+ebbJF9NDEvwY2tc9o6ohmUdAZ7QkZmaPX6MRVxQ1RCV+H
         ejvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdAcSeWzCfFvUTcoMigLVVuMXHzLgymH7pcF0t5rInmWN/Spt650rv1qWZETct1CcHVlM8v3H0INB5/O7JEKpuQGO6YzEGh5S1PwhZSA==
X-Gm-Message-State: AOJu0Ywu/MZDuS39pgp9GlHDCasJ95IewFPzuZ4xt6mDYnwW6GALO+fz
	xnsCE2Bl9tm2uYYTy8/aOlXUsitWqwm/9cX+bpKzBAmherZWlSvO9QAvNsehBtU=
X-Google-Smtp-Source: AGHT+IFr6R1DpWudIdK2UY1bOf6WYcFVh4iOEtSuhgiHZqcRCa0lqDw4BllFA19PwIX+96XPSVJgIA==
X-Received: by 2002:a05:600c:2305:b0:428:e09d:3c with SMTP id 5b1f17b1804b1-429d48e7af2mr24961855e9.33.1723554612987;
        Tue, 13 Aug 2024 06:10:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:50 +0200
Subject: [PATCH 4/6] soc: qcom: ocmem: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-b4-cleanup-h-of-node-put-other-v1-4-cfb67323a95c@linaro.org>
References: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YDxB0HgopBggQswhaM9Nf30/Wv6HgEPuB5MAMQDxXIs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1siVHCQ20U1/0c3igZrQElWbBLRyATq9fBlN
 F+5zmuH+maJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIgAKCRDBN2bmhouD
 1zbED/45WDZUHgP3RqB6w7yI2gsueMfYjV7TCCDzkdPzWodbwhKT9aOtyzZ8u6Nvu/VhqZ74CJn
 kgMTHSX2YZL4VHnkGRxfGRiw6TfagE2RDpkhmRlgg/55amHb8JlKBboZSID4mGP38knLAHuCr5d
 cFk+3m03hK7eWI352kn+S1JREEdN4Pjf8M1nUpeMBMTepZYnsPZqBQwuYUL36YEyw/h5SK5HWMp
 GWysgBX9xC31TRQSjqy3kVbq+hr8HTCwdQI373KQqVgdJ+tvv9KiZ4BKNTX/NH+JCr75+rTrety
 HZjYLIEwdhVHIUSX8MysgLQH1KcMjPggTMeQoZgxpDzMcaUc8Nt2V+o7PyeOJCmx1MPBQJG7+Vl
 zoQGETaGgP7RWWzsWasKZXQdyUwlwbdlcD/mJtAx80UIduzMW/z2YYMKR6BNYO4w43xjTN8bRSu
 QIQMNrgovYFSQozpl65x0ugXtaHPMJcxMN0OqXcazVZysVm67Sd4MqtLM8s38a1CzjZHpVpJ1FD
 H/l0sS37JzIkYoZbAqDbbFVrKa5Paz2BDPJ/KP2ZX/yG8R8JWoNn+gArLr3DvM22o0/veHPT9RA
 Yk+HJp5mncc87kzuj7MiHmTDIZLSX9ClbrkQ6/NM2Ai9o30UdeUQOEyEmWdG4jJFt2JNdeIquib
 mw5JqY6OXrxQoaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/ocmem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 6b6dd80cbc0f..ff8df7d75d6b 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -186,23 +186,20 @@ static void update_range(struct ocmem *ocmem, struct ocmem_buf *buf,
 struct ocmem *of_get_ocmem(struct device *dev)
 {
 	struct platform_device *pdev;
-	struct device_node *devnode;
 	struct ocmem *ocmem;
 
-	devnode = of_parse_phandle(dev->of_node, "sram", 0);
+	struct device_node *devnode __free(device_node) = of_parse_phandle(dev->of_node,
+									   "sram", 0);
 	if (!devnode || !devnode->parent) {
 		dev_err(dev, "Cannot look up sram phandle\n");
-		of_node_put(devnode);
 		return ERR_PTR(-ENODEV);
 	}
 
 	pdev = of_find_device_by_node(devnode->parent);
 	if (!pdev) {
 		dev_err(dev, "Cannot find device node %s\n", devnode->name);
-		of_node_put(devnode);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
-	of_node_put(devnode);
 
 	ocmem = platform_get_drvdata(pdev);
 	if (!ocmem) {

-- 
2.43.0



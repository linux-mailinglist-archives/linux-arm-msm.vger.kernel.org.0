Return-Path: <linux-arm-msm+bounces-12485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C302862CD5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF530283210
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31A31AAD0;
	Sun, 25 Feb 2024 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+GGva91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2793C440C
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892870; cv=none; b=UCPTEsdB0A5uIK16S1QQ/ag+19KH6maGNW9aeTJmuiTfIO/WgU8GkfyryN7ajsy1FXhLIh91NnK6pnCypQECKOn/GLYQHeN+uhTIo7OqWyyWVpNX246iTiKUuorfWI+znB9DOD77zp2WvZrnUIRroc49RUmggeZPa+zefuxyB7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892870; c=relaxed/simple;
	bh=SbS7KTY2g/kSILAPKWVyTsAxn3rWCAWQQVRtKe/T9X8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=auUeKUejQLvj4xmA4Y0luhPZ5A4DIIlZUzLORTBCNAkpNFr/BUk9RBL3EpGoKT99ZHsFTzojGPZII1pnb7Xmg/kqFb4TjCpmWVors5eVw3p7Hv6L+5Jxr2EFn4VtmoVktSHNxkM+VNjk79PBd79Fkj7DbGMz2yz1LsfzpY+nqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+GGva91; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a43488745bcso43144066b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708892867; x=1709497667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=In76HAMIFt7Hk8RU918oBE5HOKBWBy9WIjOW0F65HvQ=;
        b=O+GGva91GwPV32Yp1XZe4xmA5Y2QG0G0DRLLCopa8GmKZRXfSvOja5WiqDUzlfUuzq
         s+3XPELJ7IirgjbyY8gdhi3vdM5alBdZwH4yFW8LRioZr/xhLrtGCUu2Y+yAlytXflXt
         JjqVOEMhJ7Xd+FQsEzmgZN6vqL0njvivEH8jd91lmy14PImlK0VjwGjvucv/HvVnKN2W
         9IRIDFXWL+cGyDO+I5zGSSSG1W1KmO7mYN1OVT62B6dLO4vfdh4sqwv+wevDnFnq7a3o
         7TFb3ci0U00NttwL9nCYfZ4GV8Ga6lG/MWZtlYSSQWduwrYVhDrmA6sKnrZtfEuxbjB6
         4h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892867; x=1709497667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In76HAMIFt7Hk8RU918oBE5HOKBWBy9WIjOW0F65HvQ=;
        b=JOpBEBEgByU6gceNG5/jJ0y9IE5jU5iQX4LKv6tIzE/QMqUBBQi7VL12vdn3Hahaxs
         4M23QE3YOT6CmsOGf7TI9AvJ3xfhShogyWmTZ7L/qQPtfWiCtO5TI4ndDgmw8aojICJ6
         IuidATpkx3U/87aTCe9qyt1wjU9FNv3fnkPwa98maaHjSe33U5AJ+We6VGDvP5BVSgTN
         JVfOEGvTKsp6upMFVykjvjWITWK42q9xbJH1UFQLnAYN5Hp1XuB1i4xCuZxsKGXRrEb/
         y7tEXzS4j0ifIJLLUZN/LxdHZpvpd4Wfhz2xpiUhRHMvCSGrxYLPQdLfOOzf2nZ+jbSK
         yG8A==
X-Forwarded-Encrypted: i=1; AJvYcCXLvyXNYE8Je4KBYmMNSn1G0vRsDuelQjL5dRhO3f9QSXpTezdN9BsaXTd+GBnTUCXPk3g6HDRzrJcoUWAd9Zip0dk/R78KQVaV7/SVxg==
X-Gm-Message-State: AOJu0Yxg1A7MHZoUajGiN9q6N94VMFLxQujtDde/gtDH5E4PHjA5VcV0
	DHo3CDysXJ0EkRpohS3XZrJWe69Ez8sN5k6Af28pAM0zmbUHyDbOC47lvqUwIvY=
X-Google-Smtp-Source: AGHT+IHK2PAlczrWlP2LDm9Zn6liFHdYwA5Xleqykkq8Go4veJOjsMCXopCo1Q5l+09IfOqm1Um4Cw==
X-Received: by 2002:a17:906:d96c:b0:a43:4ddb:a9cd with SMTP id rp12-20020a170906d96c00b00a434ddba9cdmr581375ejb.37.1708892867493;
        Sun, 25 Feb 2024 12:27:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id vi17-20020a170907d41100b00a43215bff13sm888109ejc.117.2024.02.25.12.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:27:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] iio: adc: qcom-pm8xxx-xoadc: drop unused kerneldoc struct pm8xxx_chan_info member
Date: Sun, 25 Feb 2024 21:27:44 +0100
Message-Id: <20240225202744.60500-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop description of non-existing 'struct pm8xxx_chan_info' member:

  qcom-pm8xxx-xoadc.c:386: warning: Excess struct member 'scale_fn_type' description in 'pm8xxx_chan_info'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 01c5586df56d..c9d2c66434e4 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -372,7 +372,6 @@ static const struct xoadc_channel pm8921_xoadc_channels[] = {
  * @name: name of this channel
  * @hwchan: pointer to hardware channel information (muxing & scaling settings)
  * @calibration: whether to use absolute or ratiometric calibration
- * @scale_fn_type: scaling function type
  * @decimation: 0,1,2,3
  * @amux_ip_rsv: ratiometric scale value if using ratiometric
  * calibration: 0, 1, 2, 4, 5.
-- 
2.34.1



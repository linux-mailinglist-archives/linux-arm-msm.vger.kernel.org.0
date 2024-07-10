Return-Path: <linux-arm-msm+bounces-25873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8792D721
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA8D1F25B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385F719645D;
	Wed, 10 Jul 2024 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsGkDBh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA3195809
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720631121; cv=none; b=X7Oq4+J4OtqL9Nf/hCY6TXwks9BxZgGIZ5RzdZjoKEiBYkJAQ44ERCbWf2VbZE812f2p+xLQYTgSOgoFHXdZNjyBdR+LDcbrguH6Cotnf5ibEaGIHtB7IqMW7X1XV0qtjmAZK1QPXPoI2ZYziG97Zy6xKcIbtvjk8XFCTVoyZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720631121; c=relaxed/simple;
	bh=4u4EzVnigRGaEkzIutm5rdwG3oK439XpXPx5hpNTB2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2I862+9v82LeeLxfGzFENy7bNZZ+UlSZkJd/0QrGpgt2BKc8YM+vYq+63V/Q38+4YHIvjUqPlz0fMFayIwWUPkCa5S+3BMy2JOukV3BiyM17KrryOuVAM8T0vaiE5h2PKop+9MOFg4VpLWry7iP4Xhi6YQ2ATMMmsabDli8s/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsGkDBh4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3678aa359b7so710232f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720631117; x=1721235917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g1Yb1+vfOCpHonxF+Jqbu5p5cwpmV8OmQtPa+jVmyk=;
        b=DsGkDBh4bRXaavMvuqB/oQezv1jE2QdIFeLx4Ihe/nBwclajIIjRUwfruDljE9JFXv
         t2OL9AwPQjVDezw1LJAGFqHpnNow9oaZM/q73aOs90fH5zjcIPkQqpaddmMKUks5EKk9
         GQUNo7cnhjvalgFE3DFfx7lCXKTYwr/WwQKX/yKEV8wx/tBHF102lO3tT5IHaRI3hP5o
         dbZ4goidzy8xqRIzqUQ+FHL6gtb94bagPZjpWwIDEZZe3OehhFvnMqoTLbUB7/nF68cS
         I2tKCuZyQOIjRhKlwHEU2wXXLyguorxvuSM1ctKqyu5haZr3iBK/VoLk5SZSgVz/lrQi
         GT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720631117; x=1721235917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g1Yb1+vfOCpHonxF+Jqbu5p5cwpmV8OmQtPa+jVmyk=;
        b=qElO1pvvU7oJc2NxYhxUJYtmANZfuE1IU9x2rGjMvyv7pH6S09Bgm9KEWYqXDlMff8
         ShHHka0zbWodSt+bicXSqyxWZiBSk4CB1pBKPns3aSfJBVBfy3Orb+kWhMfMiVvPW6/M
         zCQtPF0Mw7LHBxp0YMT0OFasoyNkJ9cgaCq0GGlIx5i2j/WHDkfLpLuS+kz7raUFNXlk
         GrTbEDcF2svJJHRZCoAKpa80uAhiRdKQwDl6xI61HsrKfyWQTK2L0eHmRCoahcymXtdh
         pLrMypteEeX+HJfk/Ng4AVJOtK7liAFchbTV3aQOYsO6aU3Ggq4kOOmBg+Pgye1cOweo
         4wag==
X-Forwarded-Encrypted: i=1; AJvYcCXmtSwGOGEiwrbOVH0lvvi9hdAVMgRCC6mD8wdqqx9fOxqTjrmcp39vvuPqhMhYhVr7vSKIg7NjHGk8VuFlfCupZkgFQJayw9/RZZcRcw==
X-Gm-Message-State: AOJu0YxNCZU+TgNpAI3t4biKHCPKobNEU+joDCD0j/PfHU+UaKNOr9fi
	Ypbb6REBx/4wPwZLq4zm0pE2cdAT+d8+ELZ3yKZ9+g+fwOjviHxXyXcr5jDm4Ik=
X-Google-Smtp-Source: AGHT+IHrRXiCsidR4X+LasiuthOFj9ICKMJe5oQgZWQE5LzqBbT6SBTjtUxtWEVsNWAdJXaa53sXHw==
X-Received: by 2002:adf:e0d0:0:b0:360:8c88:ab82 with SMTP id ffacd0b85a97d-367f04de8e6mr260014f8f.30.1720631116954;
        Wed, 10 Jul 2024 10:05:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 10:05:16 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:04:58 +0200
Subject: [PATCH 2/5] drm/panel: samsung-atna33xc20: Add compatible for
 ATNA45AF01
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-2-eb242311a23e@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

The Samsung ATNA45AF01 panel needs exactly the same non-standard power
sequence as the Samsung ATNA33XC20 panel for backlight to work properly.
Add the new "samsung,atna45af01" compatible to the driver to make it handle
these panels as well.

While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
compatible, the original submission of the compatible in commit
4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
and resolution hardcoded. These would not work for ATNA45AF01.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9a482a744b8c..fd56fd02df87 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -333,6 +333,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 
 static const struct of_device_id atana33xc20_dt_match[] = {
 	{ .compatible = "samsung,atna33xc20", },
+	{ .compatible = "samsung,atna45af01", },
 	{ /* sentinal */ }
 };
 MODULE_DEVICE_TABLE(of, atana33xc20_dt_match);

-- 
2.44.1



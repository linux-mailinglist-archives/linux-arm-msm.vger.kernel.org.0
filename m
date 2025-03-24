Return-Path: <linux-arm-msm+bounces-52339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DC4A6DAA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 007E116B8A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868F225F785;
	Mon, 24 Mar 2025 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4//6K7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF241C6FF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821268; cv=none; b=AcRfakkZlKkLYdr54UIOLNhc4iFYqTm3AyY1+ANxW9ayhbypGwI4PeY4U6s8v71TGoMnfvd6vg0JqFzt+O7Me6ZkSfp5fuX5Scpl1AuFpAS9L7WhC6c+8LkWbJawzqqunVpTwg2pJl4y/bh2Tg4gJlgfZL8TnE7+Ww1ItA+ZCg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821268; c=relaxed/simple;
	bh=hfdMYkI1wSY3YPTVRxCMq5RnZCB7Q8NWRrwf11y3dFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2Rqa+RDG2Nh9lfhim8yaP0Zxj4H8j9ZbHIBEs7kETYcPLQ8GCIMetQc0XTz/BXq53OYO4s3hQnPOTedNzpwU3/gUUaUFpro42NcsYJExBWqhzYn8SqQM7JMRmYervtkC+Zlin1jf7EsqDM0Kjt/VEVbJO0hnVj9Xhnt54deJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4//6K7p; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so46429585e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821264; x=1743426064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx8vnuvBu7CvSAoy4lTQTdohK7w44dk4P3RzF1FDAZw=;
        b=o4//6K7pf7K6MI9VsRIUvoKHD2Zwh7PXdTDM7VgOJmrC8sApVEyh7ljoUpk6wyEeqh
         Su0sr1ZCDk8zMaOJjHejMPPLmAQDQT/YLOMq0t1DDtbuQH0OC+1sKJ20KEKgPEqS7i0b
         bE336d2CKA73r+au571v7e623LApknAA5BXwK7q54sdalH/7tjOfWmhbhQ8igd31bzuT
         h8Ox48KbNF8gm4n95wo88HW5FI/hjKShvVdDM3ECjaB5btXJ97WSbwOEmRWa9rqf0qu2
         ThyLa/M4mCcShfrF6674PfyLZxGUHkvzfArzPLxOWUd+w4XbP8/aQ0rZCsDs2UbKzbo2
         HehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821264; x=1743426064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx8vnuvBu7CvSAoy4lTQTdohK7w44dk4P3RzF1FDAZw=;
        b=f6zSMrv3+IzgXC2KwtXt7Dn9xEh/+l4RdKgYi0EG0ZqQl7OFcgwv/3RPnLqVcCobQs
         tg3mg3GkzswPyxgLpfeS8bGOYWXuz+dw68rwAxhrMhZV7xIT5gHDgBaN8zUX1l1VK8m9
         BTud1S3pDDpUx4S4lTBTxq5OkWxJliPk6ZPFn7KbM5BZhVy8zqkhDhWxHDRhCox+QTo2
         K+oycSyQaYQS8EeZHtdpX1hI2ZEGxOusjv7liHBPCw1spCnbiWrJi2gSu2wLiadxLwDH
         AjbePS/lj0rlg2cPfDfkuj1ePzrFUuvdv0Ak5N88k+7bu/bzmuhFUtvZVCVD/TWHYHEX
         53dg==
X-Forwarded-Encrypted: i=1; AJvYcCVPRblL2jTEfx1EN4fDannAdcbaBe+rTIWlFCQXE6LyUmHSB/inGt16htOCOWzVseBUF0UKduEWaVHMg3RP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs26irnBydIofpgjPXwXTcZ7db+dFE+EpsEvfq9fh+/HgRK6SC
	Fnq/SRAf+DaMyPHQCFKTS4sNOAz/vqNM972X/OjSpkHqvKuHKu4MXFKvvolkpso=
X-Gm-Gg: ASbGncuIhtVSLi9HXrC1Q06etOdWmsEc8w4mcyHXtBrJ5j5vQJ3IO63/wgXjTrrESlj
	rfuYZdSliU6NhlSLXgFFPjQV2QYQZGeXFeJCdeFpVgsdW6XzlgYBtCl2wO5f/h5QM+m6HGsAIb0
	S2oeFEc9FlyTm8IOTCWh6E70phzh9VCMUnyaPrm4OqciRvhdPwjq5ItMALXZcnp5cTLtqj5Fv/C
	0Ati5caOeqQg7RTAIR1C6mHcT/2GSdW9kO1T9090yqT3zUeQWCE6nqOj0khdqX/2ABjBuTbvOcS
	SJiCFPr7npRGW9hFcyR4jk2jqP18w7tpzN8Shwfq8lge8odRjLzZXvkkaPC0TyRdVF8C4g==
X-Google-Smtp-Source: AGHT+IGs1hed7eFfngKtDdIfLF7CUa5raY/UTLvoWGsHn1iu0AT2ObRpnyWdq4Tep0xWDphEI1SbUQ==
X-Received: by 2002:a05:600c:1548:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43d509f2ebemr127044545e9.16.1742821263769;
        Mon, 24 Mar 2025 06:01:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:03 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Mon, 24 Mar 2025 13:00:52 +0000
Message-Id: <20250324130057.4855-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5



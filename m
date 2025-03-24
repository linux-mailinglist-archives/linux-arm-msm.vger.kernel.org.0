Return-Path: <linux-arm-msm+bounces-52310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7CA6D8DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 12:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5610C16B180
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 11:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161A025DD08;
	Mon, 24 Mar 2025 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jv+7hI+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E095250BF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814384; cv=none; b=gid8Ds5aIRxBFUBXxh4K6XzF5lTt+Jsd3fC3R09EcG7xJrdAbuTzdWKWxDGF4pQ2IGJMBbgDuQdrzbDRlzygKBpStW7QvMMOeCd7RNfz1U1RPm9T4AGnnWUOt8eaUNFwoKkNo6wEv9Z/gTxEIRdAnfuiDWYsg/YYJv+o2HEkUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814384; c=relaxed/simple;
	bh=4KPz2dgcK6oAYA5wLTZGtAM7Mjdv3/Gv4z1Ch84MYAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVnIC8EB7IGjWHAoULxygiISWDJYbEe9Y+VHQl0/Www2+rK8f14cfSQvE74jCT7LaavVapmvJij0ysaHrZjAl95RyvkAcbWA01NMstyOUqBCsGljXuBlKsPgOcnDlTfCIOSCLcqVcFOiA/UqFfA+a+aVqeqEPyqBtcoDYYCeZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jv+7hI+k; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso18818795e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 04:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742814380; x=1743419180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1axor6d9w4plgEYoyUgTZRxyGQQY8c9NPyfBy5rid8=;
        b=jv+7hI+kXst8p//Dkh0gMhQG1IKQ05AV+0ETrGba9BUYDXV7ixCY+RsN92pNEmPGO8
         janOir1HlFMRVgQC0TrhJa8QLJ71VMHOov+4dMJaibjWdYhRCTcOsZZ1RfLxjayXFcS6
         oG+8jrsbX4APx6CrMwh2jq0Z9ez6R+l/s8lWELjHjmhRF+HaSUpyQr2v/kDqolT8V0nE
         +Sjw5b55I4wYYwh3rWySXhtLZukseBbTy+ZF2xzX7GLym7Ct5KjvOE36uB2JasJMqqMZ
         o4M4h6+QvJthlP7ZZJWa8huXkJkO/061+DC2xHW1t2knnagCLFZuzBOrdGZkA+m1qR4U
         mw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814380; x=1743419180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1axor6d9w4plgEYoyUgTZRxyGQQY8c9NPyfBy5rid8=;
        b=ulz9DH59GUfFP9EL//fNDDHPquBlrhuXoFZVRUlFLMjBn/P2U71DL1Xbcu9eA224tn
         U1hGN7GxBX85QC+4KG0zSazwSDNfbP/pPb9KdHuddlQ/hD+dr7f+8Qm7f4nMrmzmean5
         dPYlszpqvWGjFasGgqoAp1rlA7mlnQsyW4oM5n+N9/Mn3BjdPR4ZhOmExUR3/5CB65K7
         O3kIvXxy++9LG+ZrSsAmj67CAAkGdmAyE26u61006XaUgiet3XWoq1+0wiEans9wM0YW
         lG0zBzqwLbAdA0K05WtDVgTHR9LTpac+fvEveCFVevkPKzpeOg6oPO3G/qBBRc/NMdAg
         8JVw==
X-Forwarded-Encrypted: i=1; AJvYcCUy38bGouQcaKQDVi2XYPyxiQEmqO+gBzvKUdMGCbbNRY1XN94fNXiqoYMn2e3ZgdD81Nzb9ff4nwu0VsOt@vger.kernel.org
X-Gm-Message-State: AOJu0YzUM4qfVL5wUap42uYQFL3imoZh9PzaGjResYLU/H6lkUiAVGPO
	XCGG7h/l0pryNbAo8djEbAI4Mx8u5KQZmPiO0WSu5j8/K+YCDiQ9C8HLX4bzLrA=
X-Gm-Gg: ASbGncu4uLbMc97uSnSIe0yy7MF8NvpEkDDjpfXCqX2QKyv/BnL31vHajQKxRanwbAj
	TKaPX/wA2Qa/iwztBQV71PINlhAQxAIZ+FEPFPa+MKWYHEiBXDaexuj40XixicFnvDtKa0nBBrd
	J9Tm29jxocOSiBgYrcyw8MmLX4biGDRFwVEb3DbHDlAOfLHVUoQPd/c/R9e8NQz5vWenvdHhQK7
	nZyazYkym8xyv56njJM10ZQYHaJzQxhOnr/rPr6CMM+Hv1Mw8pudal6+BsGOQySoYl2R4dn/iM5
	2cxLc9Jq4gVUQFpi42Xe0cWlUODjwVHPfjx4ZJ5AV3u3AtGAI0iXpOBrdALtGysNPtckeQ==
X-Google-Smtp-Source: AGHT+IH9z4p4Z2S7Blu9BzHzsu9aZDSMDB7Td19pvYAR19+X1jWwwiCjxXg3TZVIRk2/ejMVRMLm/Q==
X-Received: by 2002:a05:600c:3b9c:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43d50a4ca6bmr105053195e9.30.1742814379624;
        Mon, 24 Mar 2025 04:06:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm117236055e9.24.2025.03.24.04.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:06:18 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Mon, 24 Mar 2025 11:06:01 +0000
Message-Id: <20250324110606.32001-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
References: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
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
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
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



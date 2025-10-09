Return-Path: <linux-arm-msm+bounces-76580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02EDBC833A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADD93E4DE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48A02D593C;
	Thu,  9 Oct 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4JWBZHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311BC2D3A9E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000857; cv=none; b=higvn/932DbbHb2hJZYCrQdR2Vk09NxCmEpa4VuWqeyF7056P90I/tX9ZB4xLMQ09BJLW1QM1peHzw7CMgSNaamsZj0sB8yvgULmK0fbOo+h5oXUwFZZnhhRvWOX968O5+Xnk6YnfP/5472r3rS26R9fyXynnhYzVlsCpjNB/Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000857; c=relaxed/simple;
	bh=l5mhbycfE08ir0RvnM0JhK5D+99iA9c0a12NXel/+9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3WuTR2w6zz8gcIeybaEvSeqnNbNii/o4b55LeNYrWHHn+yoIGKRTdHs5L024JW+SMqgNqCfREGDP49AmqY3gnhteGMj2kpGP7od+6L5wt8Fy02pGSiFd9HIfIuP/AIaxhXK8CFFb8YInXbldvt44nKb7LGJCu64u67p4SrSE1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4JWBZHY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so422695f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760000854; x=1760605654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o++CZcgphHqNF7K6IE3hm++2Mw0o+yR/xwaMs5XLwOQ=;
        b=D4JWBZHYqdm2ziFSOORrkqglUVuHsHrCMFMNEF57QyL37+73OQIqpszZPw9vZmDAwF
         6mVc24aUD0RhKZ88yvin5yJ7nUyfbakMjWnEflTtoJsgra0vddcMy8PEZLTUpEN/6RWK
         g2LB+r0VqSZ4laKZrwCgEZ2Uy8BGsFCQS8m4wvqfbLpOq2Gi0OAx3JCb8oWi3IR/2mqS
         BXaj3DMcKHGCd3/90byjSqmvk2knKSMfcDArZTgApYQjzPTKxCY2QLuWQK0IwtdvWgsR
         u8AnRT4eqPJhOn5/Qm5eYSOpoCt3ZxR+wZ2N6q5CWl9e9M/5lIEI6QHazT5tQZa34/EE
         SYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000854; x=1760605654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o++CZcgphHqNF7K6IE3hm++2Mw0o+yR/xwaMs5XLwOQ=;
        b=XbUvFUhBl0834ohvqpGfgjOriOfhNQYNnuSK9zkHXt4Oeht4zzkCvtT3fhoECqn6lH
         V1lJaimrYnBLXvNx2fQrB6s1FpyjRhAjjMBIvVpts3KwGJBrhsIuu7+tpMyirekzOZ/h
         89yYguU4OIAh7c1A84aB63VW/YLQVz3h3c7IowSZ5JRYLq/zXe4YxzAfGWXofSCQ9kpW
         NWQBdN/YrKRgdb+mi0As3H2RJc9r6QRUHyv+mmNro74Cj2CsT8wwu6rI/C6RF0ssHoZg
         TvcjGIsx6sI0j1+U0ElmA3ehVKW3k7sgG+Jjcos4mbJHcdLMGIzmJSkFtdrrR5bEYEbU
         M4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWpWg9mgO18kgm4Y8eHIVx27uxQwZLgI8aj6F5fSxNqfe6ERih1oxrWMZVu2fUEvj6h3hzUs04J4pwXOCYv@vger.kernel.org
X-Gm-Message-State: AOJu0YycZd+bimUOGYZINtU+RZWKxl1c5PKj8tMTK1noRKdcvhtZR9fc
	50dKx4ETvskc0DzTojgdGEKNNtzKWZAqshmMLTLV0YT8O9TK1nXn7Li4
X-Gm-Gg: ASbGncu/vCeNJBVHYCR0yO7jy44n/ZpTqMeIAZF5tzqiOMdZFeQlS5ag2ymRwjswebG
	L2rFmkfc7mQSDaK0uMYNkK3AtTmCY34sWdj7LcKva9IGhnzeah5p8oKp7gsVJBOUqzXeu6SZTcq
	M9BEvlpIH8Z6coeJQmUBaEs8d9x0q2H5sXc5u8cl+JFL6gUfoQQd2ZbRKSTIgrmNGmucPzSnPP2
	vErjYSIdCVwGbP1uH+IbB5JmssQ01v/CZ3tYX1rEiHQSvqPcNsjw7H1heYwUtH23xxW2LJ1zW5H
	Sb4xxub3kiBB60Z2MqOEJ8hGKG7q8DoTku8XVlxmrm4BVRn61PU4WASn1sSKFLFTblCfmCkvq+8
	yhRi+rzjxmjpYY3c9qlvkb3TrEA7uGAGJMGxkkvN9fi4207CBPn4+roZt
X-Google-Smtp-Source: AGHT+IGBpxxND25HGKh9Sv2Mhu71Rly/5HWjAPpRDKzQyqiB0LzVgVcpNLpNCoV5w5wRUa+5Id2Npg==
X-Received: by 2002:a5d:5f83:0:b0:3f7:4637:f052 with SMTP id ffacd0b85a97d-4266e8dab04mr4638469f8f.44.1760000854292;
        Thu, 09 Oct 2025 02:07:34 -0700 (PDT)
Received: from T15.. ([46.175.113.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b40sm33872761f8f.2.2025.10.09.02.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:07:33 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcm2290: Fix uart3 QUP interconnect
Date: Thu,  9 Oct 2025 11:07:17 +0200
Message-ID: <20251009090718.32503-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The config_noc interconnect should use SLAVE_QUP_0.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 08141b41de24..746c49d6e0fd 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1302,7 +1302,7 @@ uart3: serial@4a8c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				status = "disabled";
-- 
2.43.0



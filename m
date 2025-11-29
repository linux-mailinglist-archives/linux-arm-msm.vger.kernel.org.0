Return-Path: <linux-arm-msm+bounces-83869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3801C93F7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3F03A8396
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55F430FF04;
	Sat, 29 Nov 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kExB0oqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC830FC29
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426195; cv=none; b=JkYUTFTrI+kmtTJ6nJuOhOfbC8R35y7Xduxlflh9/qwIQm02RpvNzwPZ8/LkEBahOcuYH0MMP3fPToRNSpuFaK8n6598JznY528NQ2B/MI76tdpggMFKaN6TLykJCdOkBIjuxetP21/rgJdnxcb6Cg3DLpyJhp9xNFa6GxHP8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426195; c=relaxed/simple;
	bh=zfksRdzqKJhRlSNkDPTjQcTPNmX+bLOPlYzuDXVDI+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QlLFGycwsCHan0346x4qZ+Txx6S+3fR7e0G1FUzPqv4LIRlboTGvhKYtdWtcDSOua72QCxua+pyBMXMmrtmsngu2HeZGz588KNUqxE0Zhm2SPJ84TsJRWhe8Ob2/cwuH+jsBIvWUhThRD6p7tcNd7c9etkAR5MpZa/5tiIG/nzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kExB0oqT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295548467c7so31982385ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764426192; x=1765030992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=kExB0oqTVWgoe/XdzLqh2S/plz8WbLJakGtGqhuGDP2Zmbuasgo+IggQNeRmXm7nc2
         kwree03/SKYboefNRuUiKlPJnVrhcy+59ZDUANnxTYdfwvocqtfNi7T6/O9mpCCaunr7
         ekMvG9Jd0dluXf1IVFZMwKYiW74lOZyKFwLWpclprEwR3DMCv+mg/eetClDRwRyRFEy6
         3C3/42TxFTcZb0UeooQuIZQSlB6VqhAUh2qA+5IfZkdrCllWrCi4X9y7Wnsu7f7z9c53
         Xb6ICJAKPEPRs956L48A39BVFqfC4yLi/6e9pf+P2k4ixLrDXGvycJF7ISJMTDQZ1TWM
         xIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764426192; x=1765030992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=C3ujFkY7Vg7PQfsBggZgnhpGyCqb1LS4Q9IczBZ8y+dAqsvRlq5slgM3r20hA8HU97
         RclLTehdJIVxV3pFflFx0aKI7e0e2Rckcu3tBGND2yfi2ZcL2By4Npu3nxNIaAp6gpV9
         27DNuFG3qmI6D2tXiz7aDXPKpKKaDBKrLTjhjFhOqogQonOHZ1XcopbJtRDQr2QPneKC
         uR/U+NwI9guxN4uLu8UOU89FrBRRew6cRT0yROy9XRN1FkecoMMLiclgsOnPH9tGMnnA
         DJU0E+9cQiQoD1+gA+5wskOMaVFWE5q5ZcbT2bq35OiHilXTScnflheuqz+GqK7gOeWV
         AkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAqzdN2omWttFwK7gXrJPbSOtImNZzg6pa92J8+bn9cfe9jtLh8NNUBZUocMAMoM0Eh123aE6WRtkt0ycY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6L7q1VIj0U6fADusg0SfWBZ4eUSBFOGGwUmRqp3b0JLGF/90P
	0NiCZFxHab2KgHYI/OSaj0SUwSCYiBTEUmFgIeu89efDlhcSrzXPBU3o
X-Gm-Gg: ASbGncv1mxxTvBW3LCOgY/3BtPxyHrK2YE1S3lfQd25nDhYrd0O52boj9jOSxgLf6tg
	+ojLYdkn895bSZZEdXAmsRpuEchsOnMRTvc0+waZbllvfcbU7vWelb9l/4Of/kZcM/iGqoZ27VH
	Fwn22Oks5hhXmc0zhqBEvx60i85KUqSM1gsUvoadQ6+2uHVeV4+0W6wsfR8VnEPt8QEpUdFtW8B
	P070eFiwiz1KlQSBDW7mkJMNrxvSI21MR6QwQrR83wpCrG1nBhpZ5fZ9sg9uBzGbRarURqA4KTD
	ywKAmUNteOBtAnouZSNsms+ozfu7tjV6f15Q9WaUGWVe9aqgPCz7EKPKK+H2YV/tAqyOKe4GXee
	QY4rFQRgUmNmjxG23FARXJnaWcHqg0DcKN2Q/s87ASXHpxJPXhKH+v0ZiTcMji+fEiW7IGEONfy
	eT/uSV2v9DuY9o0ZuBJkUap1SJgOcQ8NvRJPJD
X-Google-Smtp-Source: AGHT+IGh7E5EJHj6xGewoslVxz0116ycLRiCwfgmew5nGhAiREVFuPgwsqWeaeHmfv6KFIDb6pASOA==
X-Received: by 2002:a17:903:947:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29b6be8cb2dmr349011585ad.1.1764426192418;
        Sat, 29 Nov 2025 06:23:12 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27532sm75641435ad.57.2025.11.29.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:23:11 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Sat, 29 Nov 2025 19:52:41 +0530
Message-Id: <20251129142242.3661349-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251129142242.3661349-1-tessolveupstream@gmail.com>
References: <20251129142242.3661349-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f368..a323be3d2ba2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -862,6 +862,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-72769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07EB4FBD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7DE11628C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AA333CE91;
	Tue,  9 Sep 2025 12:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLnIrqxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53DA337688;
	Tue,  9 Sep 2025 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422389; cv=none; b=rwmZcKOURU/YnJlHw1diLlC1SXcFUSmHoW/YAysC8pnAufeYDBf5EPD636vgA8gvQWxcHBuRGYPL2SvNvFz1c9lVU+yfAPRuLJPmoEs8Gj+YnN44VGCQamg/QG+a6R7xh8nTWrthc41beu9YFLRnhB48n9c3MHOBIU0AV74mL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422389; c=relaxed/simple;
	bh=5cEbAGsP1YlvyrkjjjxXYnk+i7foZpOWBI1Zyf/mXkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gbaN0rWLsOlguOj4cX4essg81CyAho+roCHC67ybRtOvOVlCRltGfLR6vi4rIXc/YO+g16ayedH9sT3Eee/do+Fykj4XXG2OoWh9Axa2Pf3LOmeHP/ZQ7KX/dsy5eFYE5E2dUCOUoEUoeHFKSVVy5HhymbOdM0GbSxJ80HdnjTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLnIrqxz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-327ae052173so3646489a91.0;
        Tue, 09 Sep 2025 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422387; x=1758027187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mybprtyHCL7zAHH4eVBnsf9J9g3/nN3rcKtxg/DXgKA=;
        b=SLnIrqxzDXPUrGoxlkYr5TIznA8emgKBBLLhd5J5OK6iXbhig2rbVIWU/E9lkTLxyl
         UKzlO7WaB+fAkPG00xIXnxkPFVqTLvdk8NHq3mMq8MOFUz/BStK8+bHpbiOKMmlxQI3Z
         Yy2X3Gkh2GTy1K5PLTyRk4MQIxEtlMBDklTcjNlChC3zkX0t0/9NAKa0yE0PKWxmgVAg
         Zg3sc84vVJw8FOW1GDsjiKElURyYKXoYTr3ihY3+v5unQHyvZhGeRs+bRUse/43PcTRR
         19+y11q7JqiKIJU0V00BGwRgAkRpPbeIwbvEiWa4vbn4AdWf6zTAVnhgyt+DEOkb8jpu
         vEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422387; x=1758027187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mybprtyHCL7zAHH4eVBnsf9J9g3/nN3rcKtxg/DXgKA=;
        b=xD6UAYCECYCcxAB9RAY5pxwh+9XjaznozGGmJv7hPmeIX8mEOfE0ZQVg+Cg0s9PGsw
         prqcl+Ekp6RcHED4bhkHatL9jmhNy7diTZdvGrrRpEVrT+H/WwnRQkOcRN+kRywVSQMs
         gL6IrQkkTajZg77/wjlDCaWkdBATuahcbNobMwQt4F+bpGnB0NeHQTQP/1zATN67pXSd
         y6AE+CGWNFfOoxga0Rp/e1ZC9O1U9UKdtCy7xxszDB9P8uFqaHlS6HQOpCYvUHtkI9Hx
         FtOeINeVOhUTzUfDMY0M0kGyemEaDG5G+GTB0nBUMBNO1FqUlVMgNqbpHZB2khB+wWw1
         OWnw==
X-Forwarded-Encrypted: i=1; AJvYcCU/aqTFPIciG2bCeLZ4zMqc5a4NMZsY0osjdRRfqceVlEdqvMB0YLWXd5h8JXgBlr/2pwVTOJPdKRSm@vger.kernel.org, AJvYcCVNN5QAYxYBsrRmuE76IVf38MuClqCdFCHaUEc863l2REnf/2IFMHlTKQhI3DKYU1jDPioGhOzLmVM45+E0WQ==@vger.kernel.org, AJvYcCXc7m59r9VVTAAdzKWBIQndrSv9J1PhgHY9QWoV5e5kphrD6tbrcrqULq+AJeMZAtrHObTJ+4VS6z+t31Qn@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQiINYVbSU2f4WwyvLBran1l5qQwgOp/ICfZDAEbbB+7WhgB1
	Oz2bzHRjI9p+xUecQCEmYQu7FPieQkeKD5E0nryyXBEF5zsBXt9s01UQ
X-Gm-Gg: ASbGncspkAMS1b73U3FH1vlLy8P6j779YAnSsCSZ0ry6uU35lqQ1hRrnlt7Q9TbLnWK
	bLtcij1aHveL0sDtexZaTJDZA2XpykSPd0Vmz7kk5RBeTzSBe3OGOey9Y/Hq3qxCQ/5qZDIpJYS
	PZmBVr3eBX9Y2ADHi2OnyiKxb7cNw+NO7Udptvd+IflkoVb0IP5BzLqzsWwCd+srX9kdSIT9sc3
	FP0Y+/QddES/1Ki9zpgPzLIvb+sz2/I8QlFyG43BxI/DwHiRp0+G5UEyihYKTjSKgTRPbZZEKsZ
	17connTI0x6nH1FHW/CJ5bXUm//0Lp7W3ax7IU1dSxX6qVyL4hjrTIsoIFaYTzKXwlsRZExTjmT
	q5/qjxAxrurQnbhwiuwOIQGavU0NHQMS/ZauOoguiSNyLNQ==
X-Google-Smtp-Source: AGHT+IGSn67r40sgIgKMxZOYNEVGFF7+aKKhRC4L+GIiOwR2118mFlBmMwUaQfcv9yBjF7H3bvnzmg==
X-Received: by 2002:a17:90b:3f0c:b0:321:752b:6c95 with SMTP id 98e67ed59e1d1-32d43eff95amr15280941a91.10.1757422386959;
        Tue, 09 Sep 2025 05:53:06 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b8ba6e145sm16326461a91.22.2025.09.09.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:53:06 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: konradybcio@kernel.org
Cc: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingweiz@qti.qualcomm.com,
	tessolveupstream@gmail.com
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add bindings for QCS615 talos evk board
Date: Tue,  9 Sep 2025 18:22:54 +0530
Message-Id: <20250909125255.1124824-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds binding support for the QCS615-based talos evk SMARC platform.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 03a7d3c92ecd..a5dbe6af68ac 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -952,6 +952,12 @@ properties:
           - const: qcom,qcs615
           - const: qcom,sm6150
 
+      - items:
+          - enum:
+              - qcom,qcs615-iq-615-evk
+          - const: qcom,qcs615
+          - const: qcom,sm6150
+
       - items:
           - enum:
               - qcom,sa8155p-adp
-- 
2.34.1



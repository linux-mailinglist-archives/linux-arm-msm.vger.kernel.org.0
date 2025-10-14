Return-Path: <linux-arm-msm+bounces-77189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E29BD9323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A9034F79AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC68730FC3A;
	Tue, 14 Oct 2025 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuUU1FOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA82FE053
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443359; cv=none; b=e6ccd0AyNZYHgs4k9nZiZiAYjJbc2uHzF9QOSkpSX7rDC7UtCgPCJ6jLd238g+RtV50xGF0G9/nZRkLi7Nx3OtZRQHiewyAQGc4/AYmjNUfZf/nRiuyIpFYe4YtOj5ua1Nk2Yj8uhxTxdN66QWHMhscclwHxzODaBSH4Pxk9yyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443359; c=relaxed/simple;
	bh=j8Hd4Iay6zYNggN2mZzljQRaAldF0uuSlvshS+04klw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uHZR3D0GHMJJ//bYGrFbzex07hTz9+1jOtxVIhfrgax80BLKt9xgsRTPqECz8UwCZySjB/Txr9R3FDjHNdWo2KcsQrHuWXaKWPGnsxOLhSmtfefohCW82m894Cx6KOBq19T8NZMaDjkCjUs2HyPoA4wGn694rAmQNbNHhp9esJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuUU1FOX; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso4633217a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443358; x=1761048158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6G7I4yZCC3xCLDmgNXcqXWYF504/swrtgR3bZf+tR8=;
        b=KuUU1FOXPTNkARbI4s5wVdCXi1sYFgWo9BL/IB2vcX1vSh2QKfZtVW8eLyRum7SiNB
         yiXjNTZhsEugRcFjDIABImZ/C68+tTGOOLQ2wKbCbRR9HnVrpNzmEczaScIgkY07iMYj
         anA/ASI/rrp7C8CXyIGZdUcPk1rkMTjrJ+1Ua2d4TdAfmqYJIGWr/Uhcg2CSg3Ktapg+
         MqNALFIdDASTx5VE5S5CcMC5GwZvifWmv4RowNMrRNgJh2usyZBZ06zlRHI4vsvG/fj2
         vO1eLDhBVyQkKJlg1NUCeBEoobf8Qusew34nR9uocBBPjWSHGGj4eSX1VEk7q8gEELcH
         sa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443358; x=1761048158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6G7I4yZCC3xCLDmgNXcqXWYF504/swrtgR3bZf+tR8=;
        b=sbU5KroNz+CE6YX5eDnCKKAl2pyazOjyBSQvNh2sevIwGbJXKuO8m8AaEuxLhy6KpW
         Mu/2V0JR7Vg6PRJLj0N1FI+9iCYR5qCPxME3bNuxEECq433zoEdz6mOvWS2jGbA5opl8
         2CYIHk937VRJmwgWS0C93dTRcxYAUshycIpjgptVUHZWAl+lAqvH6AoEX9d72FyvGyIB
         IHCNk8pzFjJjUQcEl1zNZw4fjgj3o/TGKXhQT0B83Elyw4ArcZtLJc1Q45F1FVrZ//zp
         hT5DRVbBshCjmqVXxIc+l7lQI9LyZh02dHUgX7fy4QV5qgpSrxWpNpDYOCgcBcrLFgXZ
         +epg==
X-Forwarded-Encrypted: i=1; AJvYcCVtQKtCKI3RTn6pXRmrPk/9FKADBF8rDGb/gdUOeezxxeZ+CWx9fSkIHANAR24nuUKL44AimfssDOzTGjMi@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxwcKe5XiJQrBhmfoPkv/PvXNN5W7HPr9b0Gdt/XtZZBCZqzw
	1rwRe2q/SyYL2SJL53L0T9xexSVKaRM4XIvW1XVh+YG5XICpBhj3OgN4
X-Gm-Gg: ASbGncsXenOsigA5X7xL8dtLPjwwkIb23AfyYW26RLSN8LE8acGCzcbigdM0E+aQmsM
	h0+M4wwkNX+4m7Hx4mkSCME4RXhRqAryzT3xn42m+Vguhc3kwVwf3CegGFA0kvWcIVQxwOdwPXU
	VLquO9arigccaZ+b2eS+sss3jFa/RiHBZoyNW8S/EtXo961/G0KtJo6qbuE+z6urOMeFhdkULgF
	DLcmCFtjHSMdJA060CYikUAqMKocxf7poNwsrqgnVfbAKsDYYNyRU3M1RKHsezNE2GJjCB2e5kY
	5cPpntB/l1PlRQSQWq+owm6n3taIMnNzu/g4c9OJfqPExVJxZjDh9Psw3avzYzaIIcG/+tdoNMU
	UNfYsRSHErEnxkrBNjFCEDTLPs/LYuWD+fsBAjeds0jWDlNKImYhZKz0OQZWONURvQNam3f7fZN
	Omsw==
X-Google-Smtp-Source: AGHT+IF6bVnGm+ESxRb1/rcaQKUyx2va7Y31p/cGXCJmYfYaOC9VWMsGgXgfBjvGWAXXsYrIVRnOLA==
X-Received: by 2002:a17:903:faf:b0:278:bfae:3244 with SMTP id d9443c01a7336-2902741e44fmr315065125ad.54.1760443357518;
        Tue, 14 Oct 2025 05:02:37 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f941a5sm162808455ad.127.2025.10.14.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:02:36 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tessolveupstream@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add QCS615 Talos EVK SMARC platform
Date: Tue, 14 Oct 2025 17:32:22 +0530
Message-Id: <20251014120223.1914790-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014120223.1914790-1-tessolveupstream@gmail.com>
References: <20251014120223.1914790-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the QCS615-based Talos EVK SMARC platform.

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



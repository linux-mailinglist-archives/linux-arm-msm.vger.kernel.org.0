Return-Path: <linux-arm-msm+bounces-41524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853EA9ECFF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CA981882BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFADC1C1F34;
	Wed, 11 Dec 2024 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg8/p0aR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480441AF0B4;
	Wed, 11 Dec 2024 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931561; cv=none; b=jnV5gyLj0kYB+E1PLSVG5vOYtS1t7z3v9M967R95b80Nr/cjcOCe32s7ztebqD11GOO4TgjML1veMMyVxFOCGGHezOLk66CRsPXlLl+4dcutMNuhOUAdYTqmAE31Vnbr71tyPiJaDfH9WirPDtAxw5MEF3cPR3DrBSZ9ydQASc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931561; c=relaxed/simple;
	bh=9/3chWg73F6zmGVrMVAbk9zS9eLzYekUNkzfyd+L6jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TngYMrGCj6D/s4ZEcbm7xmlE8C3DptsENuUJ/8/ekXehMhEhx7dFIeklfx3q8trkhZNHY9iGRwIDw6euBjYPtGiqKpgNTgaUt9wDpCrHwOsVl80JLmOQZo8urixz0TupM14yK/LuF9olP7C9bjiBtCrfOU0D34HLC7PZza8v/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg8/p0aR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21649a7bcdcso36163045ad.1;
        Wed, 11 Dec 2024 07:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931557; x=1734536357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvkJVegl/8Zf4yB/mN/bblZByhV2nX9SjE9t7MRjQjg=;
        b=Cg8/p0aRNc8v3OEGaZt/zFFbg0DZbnBsSKf4bLNNiUETTszuW0gAPVFGRlQTus0LpS
         MbQBv4OOARxCDQI43umwSN/+JquemKsNgzVVNCoMy4xRDHauPEUWwARmYto+6p02CRIP
         KNtD9ScAEbRLML9Dm7EFo4ug8kuPAvOWSmcnmTxnbhMM66zYJfPKrWE/cE4t+mQbSpO/
         Pkgdqc+zGktSV99pJP78XZr8WUKIHRRMIT9JCsf2UemEuYm0Jq+6W6YSeHD4VkSZqm2E
         Vf34TQ/xQtiu6kDehlhCUVOZ+b2N7dA6RFaiINpSJFtPSCGYWpk3WF2+c1PL5+PZQggf
         v/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931557; x=1734536357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvkJVegl/8Zf4yB/mN/bblZByhV2nX9SjE9t7MRjQjg=;
        b=CvLtYXloHCxFcEpdR4hFEfllEpuuMB4ndEmFC5+l33dry74xF7zYwoAMsK0cfviGb3
         RnRkLsQvkyguRpaSi/4j4M+rLFZhAPioUqAwvdfnuScTdDWw+kTxwvKDxKBG7d9nH/6k
         A4JYAcUQKu64y1Xuy12i7aEOhPvkyouEYOBWKLCLmr/6NmBuyW1GRpctffT6LVSxk5sg
         KX9v/JyRDNp4YDbcCDIufczwVQjhRyLYXx58sBIEg4UdmtOqsPM6PZphe6ph8R9SCTgK
         bru9uA9ibxXOeTcd75ZzLIaXuCO1R9KwUQqhzhkf9sxhrHgrRncTJstvHXYFUUg9RiSF
         djnA==
X-Forwarded-Encrypted: i=1; AJvYcCUALzeqPJIxjtDtnMSByurKQ1h/sjY7Ok3oypCXFS8RL/3VPHUiTeGYl756YWfzKeBvQFQtvdyTzv6B@vger.kernel.org, AJvYcCV2pFzxoh3DFPg5n7gt0Z4S7iGngcq2PECQhmhZ+R47WeGxrz+FHZka2JQ3Hf/WlIflOexaq4R3i/ys5JMJ@vger.kernel.org, AJvYcCWdaJIR1RnG3AUYrnLg39DkUvkECx4P6RIBzexbJ8LHaQjk2VCXmn4Zs27t/XSMostLSuw5JZCOhxG3PDE7gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTepXuy7mcerVwzhYIoYhRPdxiJCd8hSkcTnLOkoOv3yYgpENO
	dHOz5Qstxgl9CCt23lxQ+y+U8nJZ+30jl+1cmr4IHULbl9XvvW7W
X-Gm-Gg: ASbGncvJL4cAtb5v9cGYWO4756EV/d4wY01dh5FAbLRs/VISCfGR8SfPUddi2TVS5Hz
	ekROYmJlUlot+tADZQaMqU69dZxXXiWDdHi8LiAFtkzh+Tx4Ln0zNZh5MQz3txhv1/Fu6DZ8VB8
	BB3u0rYSdre65h+juxtrEne5ApEpG3gfwuV7hTwq6PcybK3m9h6LBxQfG9ePgLqiGzw05mF2dcL
	RG5s8r0BU1qcZ4+CXcGoUj6pe8EajqUhYoQiYZ7P+Ohlql/PYFF
X-Google-Smtp-Source: AGHT+IH/X0FhR8LiCNx2Yau++CAVLSivw3cBjfbMciVgSpJT2YOiEW+7cqKIEMi0uGDY2cgJkXaL5w==
X-Received: by 2002:a17:902:ce86:b0:215:577b:ab77 with SMTP id d9443c01a7336-2177858a890mr45725255ad.39.1733931557606;
        Wed, 11 Dec 2024 07:39:17 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163d978286sm62357965ad.277.2024.12.11.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:39:17 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gty0622@gmail.com,
	chenxuecong2009@outlook.com,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
Date: Wed, 11 Dec 2024 23:37:52 +0800
Message-ID: <20241211153754.356476-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211153754.356476-1-mitltlatltl@gmail.com>
References: <20241211153754.356476-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the SC8280XP-based Huawei Matebook E Go,
using its codename, gaokun3, which means it is the 3rd gen gaokun.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9679fed72..355b17259 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -822,6 +822,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,gaokun3
               - lenovo,thinkpad-x13s
               - microsoft,arcata
               - qcom,sc8280xp-crd
-- 
2.47.1



Return-Path: <linux-arm-msm+bounces-79095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0628C12F4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80E3E352998
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 05:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B422BE64A;
	Tue, 28 Oct 2025 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly77EvW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7442BE031
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761629583; cv=none; b=b0v4aBO8CoxZFKMhGcA5S+rNt42f0CYaSrRzYwCD3RE16yUZY2E5fNN0h3XqKTb+FedfoSwF9LXj0Bjbai1A9XzfvqqlaQ/ZvT5NHuMjmB3SY3Dat0Vckd3Q1eePhXxg7W2P4NxYhiu3Zzp9/rXwyeGEzCYTiPcCBYHodCd4Dts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761629583; c=relaxed/simple;
	bh=vN3JGKYOBAUDmMzE1usOMoD0mbol+a85CNP/t1Oi0OM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=luVUeyUg2RDTteORdawZMulIzpK2dTwFvpxqHz+Mu8DGPp64ySqeOLMB95Abi+nmU6MdO1G0V8xeSEEF4ZGI7LzM9r7oqMY2taRxW8aridpluWG7I9zjeVbsuupPV4SHu4tfUKfXAZLyJ9VCqnUgGfgEUCxn8bGqf68+UBYvbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly77EvW+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33be037cf73so5771709a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 22:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761629581; x=1762234381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAmaHM3BDp1VZW/oTEWfvvrOlAs/2vEDtfi5E2o6+gg=;
        b=ly77EvW+3mNfln0nUkEsYcgiR/hhfyRexMgN9GBlGFzwyENBl2VBKnmJ/Hjmk2460o
         VvyYm/qKoyE6VwxMxYDup8+Ni/OqWBmogfD6A4LUx1JnGcuV7Au38mo8XuOO0E/hm6zB
         0Z7QnQHiZeN/v9nLjnhAbOIzpB9TZ/0LtB+NKiqXdQT5MynMe4sCS0T747+7En5Cqk/q
         yERwFpikI9fXoTKW9tFGd+bt9wxgg2M014QRkH91IsrICglrDHMrMuNOy82vnMrxAEpR
         SdlBEM2Ex8ujLePrcSfU7ZmBAWni1jgYi1XScIyrOsUluYr7LQovpaE1vwucMsF5ik4I
         m/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629581; x=1762234381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAmaHM3BDp1VZW/oTEWfvvrOlAs/2vEDtfi5E2o6+gg=;
        b=JvImk6Juo2DPVGOgyysQiiRzpQgEOLFn52vEejbiSRi7cQ3lS709eCHJOO6kViO1CQ
         KKZWbBX7U2vP6m1VjF+oXLS8SqE8Dp+dAFg4q0jbbZmJsEkI/x1HsENZgAkIqp4Q9HX6
         8SF9bnVhyxE60URF0HrMuG/TC5nTRLkKzYJuSNdFT9+nEL7+cmcAsVeKLQT0/lRKzJW9
         gHDFFWBRShKi3h/hJ4RkhuYFicJm0V9+saLiKNVg9eT+q2qhLGoLm4xg2YYbsMQQ4td2
         taeLO0W4RRH0adH3Xh2crLxedUkZbNv5E5hil+BwrIL7S5G4ipAK5VQSAn2dvXmGcEHg
         wgYA==
X-Forwarded-Encrypted: i=1; AJvYcCWoEPiNGInI5YFL2+o211RYtqBlx89C/GA4SOv5NqfFVahLg6byIJuycHBAIwxWQWCqf89TLohSMqoh2ujz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9oKbi+hy+XY3BVPinM/XBjjRKvnebDv3EimKPufJ8cO2Tluc/
	6o8Mkp4tyruXZ8k+rOv/dbyR2MokuncbHmtE004vu9QBg9R3j312W+FH
X-Gm-Gg: ASbGncsoiWn/ynopgVoZ6Mag8mwz9qFwCDuYU5yzQvONWX48dLcj9VstP5Jk7bDyox7
	cdjO+pko7P4YEMGhLdj8a02R/PDT/JA6gZpt1J3uKin4zq5mdC+2klFB5WHnsb3zrmnXT67PqRL
	jleBs9zK/PNjDy0bKymliiBN6L/7QwQes/7VU3VsC8xQoT3AqdbuVVjYiY8j/XSG+HWWNUQwXYu
	Y5qLH0+1LsC1uRBhC/+OsBdmUUa6lNpqOaguX/O2CpKxu4KtDe2ZTRDdWwwpBf/EeGzi7AFzbx/
	vrO2YMSnvQQ8NydlKH30C+afkY2s2tJV+NoS2vpOL81lXGM9JQOREiiFCjhjz0sntQ9qy9ktwLQ
	pq+KPmaCmwC5xAyZ3FkEYO9zhoZMlOJ/yzoNHTPwhXvlQid4AvlbykXdlO5Sr+FzruB/ENk5dA3
	Rx4oubya5PHty91R6WyMg9ClKZbR03XJXeiZdY
X-Google-Smtp-Source: AGHT+IGtv3T6xzLRoc/T17G1G0UenDY4n08TE7oRtZCD01YO+/5ysGsK1isMOVRSEjqhKLtYZl35Vg==
X-Received: by 2002:a17:90b:2402:b0:340:29cf:2390 with SMTP id 98e67ed59e1d1-34029cf25d1mr1438708a91.35.1761629580917;
        Mon, 27 Oct 2025 22:33:00 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70645fsm10649477a91.3.2025.10.27.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 22:33:00 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Tue, 28 Oct 2025 11:02:47 +0530
Message-Id: <20251028053248.723560-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028053248.723560-1-tessolveupstream@gmail.com>
References: <20251028053248.723560-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

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



Return-Path: <linux-arm-msm+bounces-76680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AEBC9872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4A21A60366
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F132EAB82;
	Thu,  9 Oct 2025 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iUOJFunX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B1246774
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020529; cv=none; b=PpvF3lr1k4j7qMEhXQ37iQdq77t36EyWG/aLMmOAf1LY616xI8jdbYTbn3dOiZe4tbz9nbuasfJeT5bPWSEoWoTFA2GwgU++tBHmiXMQC6vjxFwZtwh/6vsztC0TberD6FwY5iR5h64NkjexyQzga7jsPfdYTjnU1dk5GMVAU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020529; c=relaxed/simple;
	bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uuLimSitCl2ZUbClJixUJZhmW6VQ1F2wWBe+vGHcJjIFVIRs2P9+5SmHLNoPZdTH/xvJeN44vlp7wUFcDOwokBJ8rKavwX4qsVrMCt7hRS5b45x8WoTtRb6RwREuFiyHDk01TPVpSVXqUGovoRk1Tm8LgRsmltzijUbPL2M5f2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iUOJFunX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so157041566b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020525; x=1760625325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=iUOJFunXX6SpHyVuun4dkJclFtfb1WyfNUpQ5owGJ6CZcnzRnViYgOfk5RanHIleDq
         q62E7zUIr0c4aL2dTS7YmBOEL+2F64uqojTFXrXxrzExreY/JMJXDw3raieN1HagAXug
         GtbC8Y/6xdiVkcU6wqIMGJ/+kDTEgjj6nk8u1yGY+PR03Wsz0WDwNAYCWNNeYpSnAwP3
         YImnI30IWQpOQv7V8b2stA/3r6HhNoL6hdDC0ZoayJxRGwz1bDX0mfqUvB62+t2WspgW
         WCUVmX1VVgJ7hMFyJAgxMAxy/dvs/vxLixPdk8HvDo+3PxHVX0Rkm1/23U4o421o2z/L
         OsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020525; x=1760625325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=iiQ+1FhfI8iivUqPFKEGx6eABdlAahU0wYhvxbpnw25gOXs1vvsjlZtpSrwBniIA7c
         ZXsVxIjWZ1d+E9W+djRb+Vt6ym6uLdIrKrOnRHBHrBQ2eRvHX/PU7BjdFEiB6qUS0Cfk
         QDyFqnG5P0PP8pVXhoAx4VdXaoqOTTA4HtQlyuzN3jGh9IygNgCxtEl0kd33lmsRCxeY
         1YkPgZ72AxfI5PrNgGFmH/XAJF1+/S9DyeCgAS8hSvh1lmIguiTLUHzY17MlicpJ8/lB
         lvoFZHbsonDMFyivlz2QenmpmhBxZD8PI4el7r9j/RZO4MnEfj4Gr2YZtdfQ2/VbQlnC
         CfeA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFSCVZvbvtfFITwuuFzOq/8Z4OGATlbTiLzR2O4ZFEK356cenNPLy1cQV71E+kpY20xFwsgapYaPRUVa5@vger.kernel.org
X-Gm-Message-State: AOJu0YzdcWIsCks9sY6CwxfFnVN0LhXpglsCdu+OYxoJGz0dtW0m3ENj
	nSkIm3lP27FYMA4NOH2Gn2dlnguIkIfGqpRbo5fcmEgDA+9CTzyV9OL1s0oqqPQYY/0=
X-Gm-Gg: ASbGnctDQmgP/Hr4osBdo8Knf8rrrxlME96g6mM1BYKVp8yUvAbE6VGun0+zQepJzWS
	zRll75c0mvGneTb9qHp+OSoElb2Cx0heubfySc89j2JxsxNyzaUHr2yCSnHSfLBcc/dFUgWKzj9
	C9NNNGe0j6uwzkdA1Lp81H5YzVH5kKNk+v2+U5OXqQvD4i/d/Z7+zOzgVth5VL2iqIRydvlzjfV
	xXDv0/soMJwsOXmZcm9HVLn2EXK2p5IIzbcjq7Yk3LMffGlucEtiOxnKPiHDfDn4Mg2vE91OQPA
	TiLsU6/cWAtVM8rwDF6Fse/bI7GMOcwzjV5jZUS+QNKypGkh6PtzM4gNvt7vFdBpDIsk9xeyD/u
	6M5UDXoczbSK/6LUqLD1p7m+/62dXlleVxgS503Oi+97gr0OXk63lWIk4wrv/fZEG/M1ERBSNED
	3mOw8s/JOHhLjGbQj/A6s8uHtUVehM
X-Google-Smtp-Source: AGHT+IFr+JayJiI/I7GtD5Am8LsYRvZTBEDWCg7gaW9yIcgYbX0jYmBj1aCqR/Li886um8C6i2SVAQ==
X-Received: by 2002:a17:907:3fa2:b0:b45:a6e6:97b4 with SMTP id a640c23a62f3a-b50ac7eab77mr881171466b.50.1760020525167;
        Thu, 09 Oct 2025 07:35:25 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:24 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:07 +0200
Subject: [PATCH v2 1/4] dt-bindings: media: i2c: dw9719: Document DW9800K
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-1-3c33ccd1d741@fairphone.com>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
In-Reply-To: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=839;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
 b=81CtBnB7VTEGormq+HKUETLhCoxzffogHTSiVoP2MaW1g4FKdg9qmwnA68EPe1FVZMWa+413s
 odfYumDV0MPCcgnPpB7UaEjgGXjtymenX160dy74x1jX2K9F/LfIf6m
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Dongwoon Anatech DW9800K.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 38db0764c0f70ad49295dcddc182b7e100a68b29..8e8d62436e0d0c4f9af9e52262b23881abd37cec 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,6 +21,7 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
+      - dongwoon,dw9800k
 
   reg:
     maxItems: 1

-- 
2.43.0



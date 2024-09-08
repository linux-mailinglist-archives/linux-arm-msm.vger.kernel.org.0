Return-Path: <linux-arm-msm+bounces-31227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C28970A7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 00:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4748281A57
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 22:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AC517A924;
	Sun,  8 Sep 2024 22:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/g1oUZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28816131C;
	Sun,  8 Sep 2024 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835257; cv=none; b=XnnK23uVijnlatL69eHpPdQ6p1Fmnt5xx2iWIWCM0p4hYVxtHz3FoimwPQWNRfHxwmmK+pXtnhA5wRvWZj5Al1TkFLf7nEP5U/1iRCnxu/c59hqo6ISlmGDa8h0MzihbVZ9RwwhwOUE8j8bIfP8L4p6+lGd857KxpuxmYSc+QQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835257; c=relaxed/simple;
	bh=Jak7dyDQmau6JqNb/VA5d2MAub48RBq94l2kUY7t6co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJZGxttmesA5y/TIXKlnua3Wwmi2m231dh+BFda/wiD6z0nBpwxzfsDMR9CGAbsHHHbzY9W5hUsoxjcFfJ1IVUJt7Y+PtOuHAMYEMrmSURC55PevGeVZwlwDF6fldGWivZ5IFvWc82FU1tdwqskTU3Qz2iKrkd+Gaj/Jhvy6bw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/g1oUZB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42c828c8863so33080395e9.3;
        Sun, 08 Sep 2024 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725835254; x=1726440054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3otdPc/DHlrgRIj0nxMlfvgnVqgbLva6RAECGOijiEs=;
        b=O/g1oUZBhaCyvoPRmGLnXO59k1iBYWG5Cz++HFvznsmMlxz9G4dMaDrAzxa3TBAniv
         QBTihiDG8ZUuMvN3I0fozvQ1ZVfKlBYxvtRQbIG9iES1UtiWi9inDvfHFiXp5HBIALBh
         Vh2T9uYDibSfImAokAa4O6jBtpKJXvyjtE4EdGjNUCvvp3mvRy11ISpJJv4KBF8osKf/
         StyoSot9GOCQmYWOC/0JjrMT3I6NYUSF3ld7Nk1oIspsgK66NEf9GVGABQbTY8zHJN/B
         4Y0Ev5cW9g2YjIKe9wjzC0MGu5G1CWAkEuBAdl/adwXGhMjYspFMfmAAo26g2MMcQ1FS
         eigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725835254; x=1726440054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3otdPc/DHlrgRIj0nxMlfvgnVqgbLva6RAECGOijiEs=;
        b=WcmS2FOnv8AQfUI/5HIFMIu5eVPDaNVAEG2aY0ptC/1a+KT6ciSanSc1Whk5TMB8ZF
         BK+fx2AlxAWk/Wxt5p9Js+MGwi3mLnuksXKBiV54CUJXzk4lQ6lunADymns1wOIMYLFD
         zQvH4+Inr7Y+m6CEFvromMxtrbMGPS5nFW4v7GQmKoLSBJIc3KQSL6cHaKBZdL6npzou
         s4nbodk8ie/2fXEbzyu0/m7qjgXjgT3BbQ6qZclWqjwromy/MiNbt1lSY3qLrqKLwGbc
         akYvj4yD7cvoAcBcVeLP5x6OKSmjfRgSy0ZQY36InswZcWp+VsDIZqZ2ER8n43EXQf9v
         xsMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHWqcbXXTHhP/P3f5qsiiNxJANEV+El6Zv4TVouU+dVBsfkaAjYVKynuaszx9lIyVJrsKkjj62wOJuK5n7@vger.kernel.org, AJvYcCXey6/aGNB5Ht5ykHL/aIYcK37ZKOKDHgq1QdIMl9ddLAdceLns0fTYLh3kXI8oeLEW/aZDTYcUgECliqGcDw==@vger.kernel.org, AJvYcCXmRR2zRIy1HhhlI8reUuGPgtUP8Qph2HTkx+7E1h3JfmPMsZFtSZdv3UQEIt7AGzc2CvECXsGkjTlR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6019iXkw/QfFkBjV1VtueBguNMxwUTnnCjSJETq6MFdBpsMmf
	Nd/qVdlNytJIoeG5XdU+XndxTk9MoryR6ip4x1d+OIU4ei2RNSJQCqWk+dM=
X-Google-Smtp-Source: AGHT+IFgK49r554o2z+079XMI4fWK1UYxkDLtKzpqA+ml8APyJIGz2Bxbk2d742vDbh4OBPOMWC9dQ==
X-Received: by 2002:a05:600c:22cf:b0:42c:a8cb:6a75 with SMTP id 5b1f17b1804b1-42ca8cb6c5amr49275265e9.17.1725835253739;
        Sun, 08 Sep 2024 15:40:53 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca0600651sm90883925e9.32.2024.09.08.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 15:40:53 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
Date: Mon,  9 Sep 2024 00:35:01 +0200
Message-ID: <20240908223505.21011-2-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908223505.21011-1-jerome.debretagne@gmail.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add compatible for the SC8280XP-based Microsoft Surface Pro 9 5G,
using its Arcata codename.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..114c7f5dc402 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -810,6 +810,7 @@ properties:
       - items:
           - enum:
               - lenovo,thinkpad-x13s
+              - microsoft,arcata
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
-- 
2.45.2



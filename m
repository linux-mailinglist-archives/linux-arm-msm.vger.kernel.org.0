Return-Path: <linux-arm-msm+bounces-28027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 534F7949A69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A5CB21E63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 21:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD3316F8FD;
	Tue,  6 Aug 2024 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHvMxgO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A916F27E;
	Tue,  6 Aug 2024 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980708; cv=none; b=keBZJl0Tpg0lPQtOXYvQeize6t9y6oU4iYY0fXGuNKrq4VPE9B4n3T5S+4sbnKQH+UjY6Yg9DMGwxGEOOoXnpayR2BSRJ8pjK3StJ9zMp/ncHaEjDSkwQk1ZvNQB4X9CNJN3OM4ALN3AQLDu+iHj4ioBIw2NR1KtrD7HyL412RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980708; c=relaxed/simple;
	bh=oLX8fJBiLRbeljm4ybQVrr4vJtimRblEWJ07v6kQDs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6YVPqxjtuZAtnxy7RA6UdInNUAUPcQSqmY3fWpGveAuMvcL8Jbu/Qmm+lYwiolihSQiNjm8c8P/HjFbvTOjwjnWnda9FmGIz/wdSC5XwI+a57/5YQOw0CzIBazwuqkkv6Chh6WSXHBsnrx8kmMtbXdNkbsYz0zUxSkXeGEh1Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHvMxgO5; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-825dc62725cso397945241.3;
        Tue, 06 Aug 2024 14:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722980706; x=1723585506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExF0I54rVQ6tXCiWTPMayTxL+v0amgllwXMPlStcwYw=;
        b=dHvMxgO5EzbpG7J7Lzm2ty8GjMWKngmZT04Co80YgdeMMvBiz8i9h9bszbK5lBj6eG
         BQXyhv6thInQQuyvAHFdPbwRYVfCP1T0YbxJuFv5HJpbP2/0dSsHDP2ImS7ApS7n5koe
         IkXIxb5pYmFtph//mVimRnLWBopEDkLeXvWedR0GntPjh+W1s0nQbyVuAZH4ThVSgelw
         qju5Lv8G8QL/ZPkQrsCUyHdVTlTAqZWp+CLsPP8MZ+6w/nzW7saG8OSu4NP5CD18/vwl
         YwsjqUQpLplU0mxtJWwB+R5J9/cp73A2sTPCXaxy0XGJNkFOjf+UjrWze2/7PCiNTxdK
         WNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980706; x=1723585506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExF0I54rVQ6tXCiWTPMayTxL+v0amgllwXMPlStcwYw=;
        b=GWA6eFn846jR6GJdhQMNxj14BZDXrLF404FwjrZDAYrzmKQEs93sAej1FEzvpIR4HW
         X8RR988wW3BCBNb7WLM4s/4lFRwFeZ3k7fA5Iw/0W4fW/VXA5MltpmwjFWy3fwzqB3oV
         1N+2PsjVn5XFvrHI9MDbBgVWxBq4IhKFNvbQnrS1pgJF7tITOlKNAEyqnG7ud0q+x7Wn
         +TtAksYjrvRkW/LXub7jRyuoftrAI5VwwYsloVikSGqW1vru+NAv3ir8R7oxOM3T+9gU
         xGycBjx+o4CJUf3ytuFg+tI5bmxqAWtZVek4D+t9HL6KkCOAeSRJeKdXWDBaC7UYubkW
         UQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcaprV7gCcrhE4+MJFOsyKxVeL+eIZxUN8ZL09VdMiwWvRjfDktGOR7cVrJ/o1ff4FkQcaRlXUAPFFuoe2QB9QJt5y4+DpyUIwKiwZbKs0Nqbpk6fUGLm3b5rcbREbzGG9cQ44sPwkrkxYxXmXyo4trZRezL2Y1IaxsVpDIBgi1sz/3D+efEg=
X-Gm-Message-State: AOJu0YzbnSJQZ36kpY0vWDAUljBwG2jT3ANpwxK9HoNfjnlYq4dT7EnY
	FoPy+XIh4QkzBcv5Mbgt7MelIkgz1MFKhdMN68bTRHpgw0351lS0
X-Google-Smtp-Source: AGHT+IGQSk4H+ekGkXPzhj2MglCcmJb8GS9D3JN1uOWjcxRZMa6l9FsPbXeBM6xvTE4w9nbmcmuNHQ==
X-Received: by 2002:a05:6102:4194:b0:492:a883:e1d with SMTP id ada2fe7eead31-4945bde70cemr21425272137.11.1722980705727;
        Tue, 06 Aug 2024 14:45:05 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c7b64b3sm50474396d6.59.2024.08.06.14.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:45:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
Date: Tue,  6 Aug 2024 17:44:55 -0400
Message-ID: <20240806214452.16406-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon 670 has a GMU. Add its compatible.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..1c055ba64038 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -91,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-615.0
               - qcom,adreno-gmu-618.0
               - qcom,adreno-gmu-630.2
     then:
-- 
2.46.0



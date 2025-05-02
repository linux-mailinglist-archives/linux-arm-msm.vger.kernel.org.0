Return-Path: <linux-arm-msm+bounces-56581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BEEAA7B05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1E147AD902
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 20:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F5420299B;
	Fri,  2 May 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbhPuK3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73CE1FF1B3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218514; cv=none; b=P6JTm3BIYgClJRt6WYn46V7mLr3AAVRjDICEm6OhzhwA6eyB48GbSzJNrdvDmXICSfFydWWHGxaSM3DHACHycp0KLZ7QCk87gmsGrRZ0mHPb/jnZOusy6vvArkZm2k1xi/0RTYp5Ci66qoteJz7FHejCNWgNKBFf/OGfi7BEZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218514; c=relaxed/simple;
	bh=MPvPmZh+KI/vX6v8BpTlWha6CK4hH13DLszHrBZcvjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yu2d5ZM6CCj/4dPcHiWXTd9NbVbF6jG21x4p8wbaV9t7aBz2q08QO15sI40U5caA2BlWl80QHOkV1QZRymWIBg1albwulVn7Zclko09v4eIrCe+NtUMDKDi+MB7pf6kmgZAHYMQ2Ij/tse0FHe48cbgbeEmuFtVpI7qc+zRh29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbhPuK3Q; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b11c7fddso292347e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218511; x=1746823311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPaj/4V7+OOkqE6GFuNlK/kYu1XUR9X/tbZvlr3jjRo=;
        b=xbhPuK3QjtnsjSyTlQVoV2R6uRgGaNLtU8GURPdEVkiX87/NvrHOybPaDIf8HczjaQ
         ypQ/xWpqkK0KgEj4rf5yvLrhfPvXqyz1UpwYKT4mxIi1klT04xArZeMGPdEKw/xgH2lS
         Xs3Bc0MYi93mAaPt4NHCxHS0ILewxR9cxOl5Z0qJCatKPB5Tr53+sSjE9lVBT8+RcCyH
         pgx+HSEn5b1hxEqv3ZRFobmkRxLqqtZuK7mU9Vk4Dj/Fa+i6w0q6baVREYajDe439QL6
         GAeoSW5JQncKpYKkWDEkV2/q6dRHogtzHlVhtVypebUMvgAfdwhUHtH8BL0SvOM+9KZT
         1P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218511; x=1746823311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPaj/4V7+OOkqE6GFuNlK/kYu1XUR9X/tbZvlr3jjRo=;
        b=TlGe6Gg1YHb+IR5h2taD+sNP6gdYcEmw9htUByCYeQjWk2PFRH+vFU8bcStuNShB0p
         /DXuV9X0NuozOUocPZ9pHydJFLGTlQda01B3aYg5Oo9EsRbGESuxXDF9sN6Qo9SJTH6O
         huuZ3eGCrqbbKXm5WbSgvv3q6IuCFrW4BP4ya/jTnFeYPyjTrEesVwSpKZ2Fc8Lae5oX
         WySqavyP2ixaLRI37ELwmdx6R6SWwRUBq0+9LC9roH237JuuVq6bPIQjEKeFeXDrIqmv
         +jKYpL7bX+39wfnnQ5V0P3o2OQTMdRfJR7kfFgkbQg0QyF/Tl4PEgae5v+4FoBYypjxO
         hNYA==
X-Gm-Message-State: AOJu0Yysd9FmEdqZptKfnKL5ZwxwNoY2TUyDSDtuoDRWJUjpC/B3nZaN
	XG/IkUYWN0ZewDHPOd85rRVVGEJGEb+fcgsd9BB1KvL2x+jki6n6Du7UBpUKcVg=
X-Gm-Gg: ASbGnct0LrEyXPQMcL1f59y+MWoT8ab8RZq35LN9pUmNCdj2f7WqfdOWVfBFrQqUcIL
	j4IuXlbrY7DwDSk8pmKO27RLL2az1Aq0FtaUwFWtzvuFYsPUgm3Hih9Z1raYhpTX1OfLcfk5FfE
	jBZi+Q5Dq0dhQVZVvmEb+hT0dWZ6ju70oNjMGhjBmoRUrzl4lSOxHpdmrxxiSEdtTCvwEEjqiV5
	TQccXuK6wWNJ2wjhK6FagLgjcT7PCppZ+vbfTOivEmw2yI8OhE1/MAVxDN0S+i4A9B3b7fRqhtp
	Ed0jyr+BgYeY7UJr1QeMcszqBVvBs82N5/vZPeQzicRAKh9eYVC0ZTy5noOeBTHLgDInXSYHmDp
	wYNWZ10SbhoK9uv7YnZmR9I7QAWLARA==
X-Google-Smtp-Source: AGHT+IEs3e6sj7jJlfP80Impdxq7EHKBnH+AAwUJDBb1D4J05e7jVTpLlGxeHYR91oREpm9Ef+xn3g==
X-Received: by 2002:a05:651c:221b:b0:30c:40d6:f564 with SMTP id 38308e7fff4ca-320c5701790mr4917621fa.9.1746218510798;
        Fri, 02 May 2025 13:41:50 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:50 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the property regex pattern
Date: Fri,  2 May 2025 23:41:40 +0300
Message-ID: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 4 CSIPHY ports on X1E80100, it'd be preferred to tinker a too
loose the regexp, which covers all these port names.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a99..680f3f514132 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -133,7 +133,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]+$":
+      "^port@[0-3]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
-- 
2.45.2



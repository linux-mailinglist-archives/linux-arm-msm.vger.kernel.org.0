Return-Path: <linux-arm-msm+bounces-41619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B094F9EDCBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24FA2837FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDC2153BD9;
	Thu, 12 Dec 2024 00:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkPNBuvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5FE14AD20
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964470; cv=none; b=EezpOGYn3pHgVnzDnLEKfKbik4VrmgLjhsd+xNWkZbrzofge53E4VMMtLnBdjp6IpRps4WAHVdFeFZsADmqbFJE1pSVYrwMdtUGOxgZPfz7e85Bmi44AowBlBHAbjOmOx/ExT/TLKulkhfpzKxsTEP9PXUwm31yU9RB3Agd0ySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964470; c=relaxed/simple;
	bh=g17b3O9IJFRR5zRDTOnqHhNU2ufwtjxg8brt+E441NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQwrDdzusAsrtZFAfbgKrq2gWbljvks9rugaU6ZXYwy2hgbJ4wvcx70CpUh5kEW2u55G8unq1Xxpf1fUZBsDbbefPbdr9Wv49kei9sJN1tMtnPsacSYfhQF8rCeMWa6+pYNONog/gA8U0bGn2xhT6EW2T5Y8z7OtowDzXDHW8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkPNBuvd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso465535e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964466; x=1734569266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQQpmK66T3MqtBJyloGmYZGt9Ctq4U4XpvYTcWnQiLM=;
        b=NkPNBuvdbLTxDo78CR62d4PkCVlBDmuq/swC/C4uJ+M4TkpZl0bJRBzJk+g9kXkJVf
         Ul1gquHMFYBncmaIC2o1CpPticO9a7/8Ilg1Kg5zg0z0QhieTJEzLVgyrUa3a69FsxZ1
         aqWiGk82XMRPAh3rYJORi/BRc7zFJbUFqlfLkcCcSYe/SW0jHRzS7evOf+z/YO1FKhfs
         x5Pwb+ih1gSH1Lq/E4n/kstFY2YB/Mvybbl69v0pzTAW8/iET5AynoIt4lad/AC3uZK5
         fjOzvCIdkWxOLYOyiNtLep/bfyg/B1JlGDEArtmUboN4tAghrKIDdFiMv+dmySaB3WTw
         WRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964466; x=1734569266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQQpmK66T3MqtBJyloGmYZGt9Ctq4U4XpvYTcWnQiLM=;
        b=gOTpkdFcO+O1mxHYdglTc6oeX2ffGlcJn1HSJoK9QGVHyYHt0RurKuiohRWwkcAwLK
         DtXF68yAEwvB/WPL8W/iUqVPJaIGqZxpFE9c1Y1eK7UGzk9EoOs+UExL5lCdgcSVgyTA
         ZtjQgg3Fjvg+EOiFhTJC35M6eAXF6zpgIMJaJOTT9QSn9ot7uafFxkwehqK5HdXTUjOg
         JPLuTIcDp9lQ4CTH264cVdPDkGqI8bjxZIpsg+mqzPHApVl5WD9n6X3/l6n5VTidL0Of
         VpAkW6lYB/dGpFfLveH1LCuGCKRBzKyvHw/T0TdzVxsHri+OSQEFl5W/YA5xCRfG45Vb
         fYYw==
X-Forwarded-Encrypted: i=1; AJvYcCW6r37AkKGTg+pXBBixHJPe6w7AhmBOTsmzb++csiMHBhWY8mX9c2Hr9Z3R4jyNrv+ydbiE9EHwXgqGQAxI@vger.kernel.org
X-Gm-Message-State: AOJu0YyZMMKmurKzgasN+5MLviZjmdW0vYIdx5MMkJew1by7bSWjIP2W
	eh6inG2z4wqB6TniYNjDI1qRpppxxaC0rIVw583CaeILGtgZfwV/nPLaCewbSuQ=
X-Gm-Gg: ASbGncs90xNUdIVWKQy05jIZCr4VO2tD9gL1A/wjc89gF3d5NCPko7kdnjCedODXWHg
	/A4j47i3Tj4LA5eMNu2b03XKktC8l4H09+WcTYTPuEn5Ggkn0NzkFw5rgIv2uUTSOXxiLaHNSY6
	EFQjWZi94XtB7RpoJza2/xBKYQe+gND5DX0ZsTVSr7dmn9ASSH6tXRnPubuhTXIurrZSjQvI6Bo
	SdJFxmT6nll8v8GjskaRIxwl+TzKUTAMJ3Opt4dqifEMCvBk3CYCFV+sW/6H4rn+9JMszo2
X-Google-Smtp-Source: AGHT+IHtzrN5lCLtEOpZ7wN6Vwiw74Jy/Nphl9EoXdDE0Dvq2P8eavVUVGJHmfyFsPMVjXn4QnbdqA==
X-Received: by 2002:a05:6000:490a:b0:385:f996:1bb9 with SMTP id ffacd0b85a97d-3878768e743mr1113391f8f.23.1733964466297;
        Wed, 11 Dec 2024 16:47:46 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:45 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern matching to support qcom,wsa881x
Date: Thu, 12 Dec 2024 00:47:21 +0000
Message-ID: <20241212004727.2903846-9-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for qcom,wsa8815 and qcom,wsa8810 names to be recognised
as a valid compatibles.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 2ea6d3f65478..ebccafeb13e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|wsa|x1e)[0-9]+.*$"
   required:
     - compatible
 
@@ -34,6 +34,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+      - pattern: "^qcom,wsa[0-9]+.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-- 
2.45.2



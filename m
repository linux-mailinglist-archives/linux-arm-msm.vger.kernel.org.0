Return-Path: <linux-arm-msm+bounces-56583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503FAA7B08
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBC351C0309C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 20:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C95202963;
	Fri,  2 May 2025 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYoZQyrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133A207DEF
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218519; cv=none; b=SPr8yAvbAmXvMam6CmXwUi7z5FfSO/a/Kx3TapyGseoxJuAwEBjEvIrkS/LtZGd/7G73xCTauw0mdFbrFELylIz5YOwakg/jg9d+V5EXzX3P8K4A8TCG5ZqvRM3C/kSbIbS5dj9kT4Izp/Db0ulk/jhh4v/6+NylzBUfNn/u87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218519; c=relaxed/simple;
	bh=Gor5eZeOe95pbDOvaRNjo/pq9TyKVg+UU7vzl4dpmTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shR5/vP4rT73ndWE3LUCvBBNWyz8l3j18vLckos6MzY0BYpM3iZSQRrd0pE5ASzofrHUehHpQWodC4aWJkvjXQ4R7mDUq5FAfMGSuDm8ltl+CYHG26V6JO2CiYTSbXNFuoEt9KEnvK5Vpn+tR1bg8Xp75vzmO63jYhg8RUzkAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYoZQyrT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5498cd09cbfso325517e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218516; x=1746823316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh/HB4YndctfR9aIAkHgSZCg6hCNtQ3fblG9H0OCQvc=;
        b=bYoZQyrTCvS0D/jHFsU22HGwlfzc5QrwHl8a7Nh8c1c0mEEzJMbztDxxKPofSlbw1o
         WemgjDhlDBEMjFID/VyAvpdZ33sh+OOvg5sTMrO5dvaDrzQYYe/3O5BSMUxnvQbDpldD
         wX+W6j68Q1eJHrfMdIvgMVw12xABsfPGDRzRj4scJjh82QX0wzJHpERtHxeN29+mjZMq
         Sa4GLBXb/hBLrhF0AfsLBAwob5ACFEJLch+jqD6NsRyB/g2IPftJotoM8Sh5Rd/o8/Oq
         fcjGoE5tlDjykGdKXzHzYUXeCok1FCafvAiPnby1NCRrIXeGwNLCeVsXzsWzzLxLtiRQ
         HmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218516; x=1746823316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh/HB4YndctfR9aIAkHgSZCg6hCNtQ3fblG9H0OCQvc=;
        b=ULgVgrBFPB+kPoTC2B4O9cENmBCHEMO/uAOEt8StPpVkLXXgHh+jIjmH4BVgqhCZWK
         ohLAEggL3K+ewRx62ns1r6wrxIP5DAyvjrZOU3KG7sF7QFEtY4yLxi5ErxLW4fnnJI6c
         9iITBOzTb0bvkzmdSs7dDxrQizkbd8EEvFyYvNJebvppVH6/Cn2RhEbjOMo3ZaN47PcS
         p3oISN83ra2MfhgjNyrhDLMgvTvwWetTOxGdOYcjNv4vIaDH6WwkCm1cFfve82upD7I2
         ohHQOpBUCVYpLstX1SDbOtbGVTc5ysdGez3Mn24+w3Gdh/DPW+Jr+3Rjig6LQK0wUZzu
         2fhg==
X-Gm-Message-State: AOJu0YwNywSEEu3bbDrLGOj5qY8BL81Ef0821U9pKtoNDIUp1BGvia5N
	csTRLmhCFiwVVYfmoW7Bpmn4CQKtoRAgXA5GC4476yWYljsga8KE3LEKmZ3H/E4=
X-Gm-Gg: ASbGncvWeS/LLjPvAyu5B9C+0R2bp4O7P/Fhar1Nw/4s3ZrtZx5x+nOukMHT11eQ2bA
	Smsmc9Ua5rMIvegC/Kcjuvo9G1AV+r7bljfaE6taGGh5ao64SvzSrAVhA2yIj1Is3AGlRCrIaYz
	KJRJAOTeTXhbK531eIYc/jKq4ZJBH0qS5YLpAsoz514FqYK74eyNLbMn/4w+LnnSlTK6OHnFJTq
	7YHgoegeBlxlE51VnltOH34hTKlN8Cf9A1SH8943nmVqx76rIjNVrc7J+EWKWsYrIGHn0FolRsY
	vR2/lpFZ51Xil9NJMuzNpS4VRetPST9A9HOikR7EeTPpxurBUB/8R1rHeNizbLdp6Tf/hianaZL
	aLQ5uYgzDMInBc5dvvWabD0xuJ/M9zw==
X-Google-Smtp-Source: AGHT+IEvl+Xcmxwi3YlwZ0zrf65PyUadsBHWXJ9yXMntXt5u3cTRlzR9GC1W0M0Y15MOFSmh90ma5w==
X-Received: by 2002:a05:651c:146d:b0:308:e803:119b with SMTP id 38308e7fff4ca-320c3afdda4mr4623881fa.1.1746218516348;
        Fri, 02 May 2025 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:56 -0700 (PDT)
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
Subject: [PATCH 3/3] dt-bindings: media: qcom,x1e80100-camss: Remove clock-lanes port property
Date: Fri,  2 May 2025 23:41:42 +0300
Message-ID: <20250502204142.2064496-4-vladimir.zapolskiy@linaro.org>
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

Since clock lanes under CSIPHY are hard-wired and non-selectable,
it makes sense to remove this port property.

The change follows the same logic as found in commit 336136e197e2
("media: dt-bindings: media: camss: Remove clock-lane property").

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2e7455bd75ec..c101e42f22ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -146,9 +146,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
@@ -159,7 +156,6 @@ properties:
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
@@ -362,7 +358,6 @@ examples:
                 port@0 {
                     reg = <0>;
                     csiphy_ep0: endpoint {
-                        clock-lanes = <7>;
                         data-lanes = <0 1>;
                         remote-endpoint = <&sensor_ep>;
                     };
-- 
2.45.2



Return-Path: <linux-arm-msm+bounces-109795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE7vEnuEFWoSWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:31:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B867F5D4E30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB5D3002294
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088A33DFC67;
	Tue, 26 May 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ngPBYQRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A83DA7EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794780; cv=none; b=BfoO/zYcFJCCquVzrGtB9/P33EWKIOrtx2m5A4kX5f20NxrOhr1kly/WTRb2+wRChZ8xe1UjngpRl7bPWCGe2ZnYpA/0t9JkQsgMz089JLnLB5sbccmmGljdQ1lP8qpHS5Jl6WJqZMsoSWIDli6LVSsQvg1/pxZ9mG1GGqplKVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794780; c=relaxed/simple;
	bh=dNKjpB5Yvne1H8ifySId4E2CFdpl2oBorsWQQ4hhHOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgLyQcAoGdhKCK7yUhsJJfWiuiK86YJ6quNfi+PSehXV1nKyvrmVL7Ra4Csnkw2DBR18R0Hv9hFYkio301wZuEOjUJ3hThcavpPOfrFPXh5h0TLKkI1n/FvRHf/w38YFUqGUvqc2PgqLjb6riTppYiULUL14crVWPhQkdpMFTK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ngPBYQRy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36a8ee1e28cso2892891a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779794779; x=1780399579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFBpp8NzVApWzX7I5rWeDbIZzRouP7VHUSMnOVFZeIk=;
        b=ngPBYQRyb0KpIm815HenF+otF9spwhDbNAuLfgopBSuyT5x154YyLBe5xMsmPW1thS
         KbmSDWi/NK99RWq+yoPOlQeQKVhNLRytPcy9SrEj9jELNv5rLMMC+rt7qFYfYeTNtR2l
         r04V48mk/aPwVueS1lJQOzSSo/082JVr43fMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794779; x=1780399579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFBpp8NzVApWzX7I5rWeDbIZzRouP7VHUSMnOVFZeIk=;
        b=Cm8UG9v7B9q07/xQLY8qIII79iG+vBPJI4aBIonIC1xrWsXvxdgMAnO9+n11yKIYff
         j9mPsrE2PEw04fmHaCZgwQ9RpWZqydHCaxN867PXy/xdqsloY6NeGWSG0I9RaSruRFfN
         46NC3vNqkXuCoGeuNfnPVE5m9piUtj1wFOWdceN5LpAceWTM5+hhNGHZx0ZI3zwLC5Vw
         CrPaFreW2meZNlq41h4rFMPJS3b3qJ2Jwn9Jw8PoGN80Z/HJeWbaGTZhimWDLzw68MZG
         ITQ62IyMtChRlRRaa9ra/eL1XJ+a//jkgf1IObaUy65dtEWz0vH84UQwC1nAwofFjiLX
         Bukg==
X-Gm-Message-State: AOJu0YyMiZVydMRG0Gfyt3TJcF3P6kEqm9WxdcKzk8GGSUY135/++mKM
	80avmj+NOl3tgP9S0jYyXSMVEuT+93NQMc/BdnUOR6EqCaBc4wLC8yvWw2uqqWkxykY=
X-Gm-Gg: Acq92OGK9R6o6tbKo6iH/DquTsOOQRqG8Iq6XwOmo63iHBMdgvuKrwDfmbyAJiJ4in+
	jHrupVZXu6bPGdelr1DCeEj1Gc7EsEARxCFJWwh6YroSEztow9l5KlTa2d+NsZFluJq/Im8otBW
	y/bAnI8PYvzKVYgZIlLviu2DT4KCyLRrBKyXAZ6O0TwcfRMJx6eSEGrEwWf1vIaj2woNKkia+Wd
	k3yvftxcM0TMNSf0sCWERSPeyiig/DQWzoe0/u6YmSMhAGCGfAYYrSVWSQEJAX5wyHDwxY55aSt
	AFd3u5Unhr5Weq5wpS2Q/HLJN4e/5AzbS23V94yoK3nsaObYaIPZOyXfm1YY1FGvBPcxxW2hZl1
	YEYHwisv4Rf2THXhowSiMaE38zBVeaqZobyaRl0VR4Z3WfqS8tHFxwpd9VW486QqThzhoGKi5sp
	YoUtYeW/JpZoVVvEI3MDDa30F6+OgzrPX9v5KHst+vtTxo6Hje15pX7Oal7ZjjkfuHUQNc4FQfC
	L2DJDbFMD7u3TBqIIqjHRjJxAJHqXQ9Zf5gRUUgyzdfuPU+rT3FE/XfD3rYHEdDHcQQoBz0iUBF
	9M+OIt/SOjnehKdy7pviYKXVhVxTtC4ps0kAZm4/QC719TLFXkzz8TIu/Vz7bZHiDbgZ
X-Received: by 2002:a17:90a:d885:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36a677062d7mr17000257a91.8.1779794779155;
        Tue, 26 May 2026 04:26:19 -0700 (PDT)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm12188091a91.0.2026.05.26.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:26:18 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v3 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
Date: Tue, 26 May 2026 19:24:04 +0800
Message-ID: <20260526112409.66325-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,infradead.org,kernel.org,linaro.org,gmail.com,quora.org];
	TAGGED_FROM(0.00)[bounces-109795-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[quora.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B867F5D4E30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
the fallback.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changes in v3:
- new patch (binding was missing in v1/v2)

Dependencies:
https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..813d41769c0b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -20,6 +20,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - lenovo,yoga-slim7x-ec
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
-- 
2.53.0



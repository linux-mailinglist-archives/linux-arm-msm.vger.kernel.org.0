Return-Path: <linux-arm-msm+bounces-118576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oT/iMKuaU2rHcAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:46:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF11744D93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:46:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=POmDG+sG;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C22F0300461A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E78C2F532F;
	Sun, 12 Jul 2026 13:46:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50C358D00
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:46:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863977; cv=none; b=rNlexggjrfFzsEhVwyzK/VFxL5ONpaLTiGWaxYfPx80YW7bZkBUsdYY2o9YeLj9spdOwRYVWm3pREQkClkYzRyTHxV3xkIotmwxzlT/ZFbiqPmYgoQpakLU2FNOlRBQ38KUEp9B9joYb1rrc+/xmak+v7GiXiB31pjyjXLwttfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863977; c=relaxed/simple;
	bh=745xk+d8bU62cDW9chGbuU96+vAIrE7f3vnioeAiqf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bazFf8KBD9R0SSlDKcG8v4ySiRxhlCY31UxI0SWszsZquqay6gP3GhTcLvS7NN5vf0X3U8B/2LNW7jqvVEj0s7HQUe5eVpAP7GGvEobFyiJoF99vhvk17zo+bsKZb7iH40l6le+SDZo+H1t2jcJuP+9azjxdWg5j1quQOMn8pZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=POmDG+sG; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1933405a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783863975; x=1784468775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zij5vWCaKi9JF5NLKqK6c8ikNCjMvtbTlKZgqjFTiHQ=;
        b=POmDG+sGNBoO4oCyM2S2dvC/aDGpXo2WlhvcSGvRxwq+EARfK76phSVYQUpbrT4egH
         HYADuFWq08f1ZpVncTyqiIzkS4Fe7mRHhdncv4r9eNhO7kavkzNJ4pV4Yt+9ynkQWjLi
         I1iY6uSOoCEeCY698hrX1nAKYZjlLqaPEuqKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783863975; x=1784468775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zij5vWCaKi9JF5NLKqK6c8ikNCjMvtbTlKZgqjFTiHQ=;
        b=IAQcss8MpNH4Cn/K3CW1RwLwUye6B13Mo/RNYbp50CWU3IlNxtYnn2sZnFhDtKZYEg
         paNGWIjXhrtcv9fcHohFT6qDBsEGbasfFeaDj2Os8fCvcaZxBC4RtEPpLwev4nK3C6aS
         sc7/tSp28dBtnPI7Uh/Tc5tqWel6LmKLWYMphTlk/ME84A30bUVf/ER3uaPT/TDxDO/Y
         r0eE/ApOUyxXJXa1es8AnVFCnXJ2PrjthRKAgi/L2VY1MmPNDHzVyVCXF+YCoUY3Azmr
         LOr9/6Ld/9OfUpyMZkCbRAKUpmeLMT30NRSzWWFaNwLivNdAfbUWe+MWCp2gNpNvpKgL
         M5lg==
X-Gm-Message-State: AOJu0YyySeRlwvtz6zdrZ/eyqteN57DXk80Jyi54CSk6tKq3BgAR8KYX
	ZjUWqbAMVclIRxvbr+mZGUPybgSrSjsJAyd6SviFFY5rUsR/djm483qFOkCtc7rRUJg=
X-Gm-Gg: AfdE7ckD3A+mlH3o9qFN8dDenk4Wt5kdn7Zr0Fre1DWiWnpVALQGiK9civuKf8VlRya
	sAL4Q7h/fBHejUIqB4/VjcdiYQE/MDa7ZcAw3oq++gOglA3StVIEa7zaSxd1Dch3OR2ZtRNTfho
	xHRmhLcKOXHPHOL+R4S1cKm81YRIE4+4HxXP4KiPWRVeovWK/myYXVvbz1gRGE/q3e5N5+Qmq4R
	BeqTic+mbp+fxSHsqvbfUC7vkGr1gATwmRPxV9kmZ3av2FiPf9bS9FHyimCXxj2hlq1lmFnWGLi
	ovjSsc2gE5wA1gLld+yIzQ9Yc/ECgwtPkODrJrk64fJ6/igC28tcQjYhVYwUjfnbzwXHkNqRyqp
	ZbKJJd+AESRtscU+28UvSfFOJ00yy8tLaysmx/PTWQyVBXLFXuZUfFPzhaH2+WGtuFdwd9U8kdZ
	A3OBheNG9VRAXbY6u0Gk4oFXX/MMhDwkp5YWpBsQ43kOa4Y19HHk2jAxuyth3iYDHlV0mCZGNxd
	26AT5p+wFdjAiAK8XSyQmVwjzCGCCcaB+bopEgH0Qi2hY3xmy8YewEaWfAitwTl4rTznGEDuij+
	XyE8Os6VeC4QFiuecS1qMG1JxApr7MOvR+S2i0pWvbOZZeES7SRcnw==
X-Received: by 2002:a17:90b:3502:b0:387:e0db:bc32 with SMTP id 98e67ed59e1d1-38dc7bbdb04mr5323087a91.40.1783863975485;
        Sun, 12 Jul 2026 06:46:15 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:6b00:edd2:3bb4:3b99:6291])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm2122434a91.0.2026.07.12.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:46:14 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Bjorn Andersson" <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v4 RESEND 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
Date: Sun, 12 Jul 2026 21:45:55 +0800
Message-ID: <20260712134601.99191-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118576-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rdunlap@infradead.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[quora.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,infradead.org,kernel.org,linaro.org,gmail.com,quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quora.org:from_mime,quora.org:email,quora.org:mid,quora.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FF11744D93

The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
the fallback.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v4:
- add reviews and acknowledgements
- updated dependency URL
v3: https://lore.kernel.org/lkml/20260526112409.66325-1-daniel@quora.org/
- new patch with DT bindings
v2: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
v1: https://lore.kernel.org/lkml/20260429103301.17449-1-daniel@quora.org/

Dependencies:
https://lore.kernel.org/lkml/20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com/

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



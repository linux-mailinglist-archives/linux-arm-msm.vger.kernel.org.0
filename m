Return-Path: <linux-arm-msm+bounces-111269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6keuH+7eIWoLQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:24:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69C64346A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QlG4kX3H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AE403079334
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73553E1D02;
	Thu,  4 Jun 2026 20:19:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CB3D5658
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:19:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604377; cv=none; b=eatlglHlfQ3RHkkiTqL67f1gPjP7zSYQoWQfrvoZOGoVELxY0iEUScrK1ZfczD7VxSuOp1Vq7a7F8putD1TxtnNF4/151O/KTf8uUQbeI/q/yZSvfrLkVynci2cJt2qjWlb/Yc9h88J7BtbA9Y/nlV7/HQ7hfStkFRigtscESCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604377; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM9L+LCXPHHU2ub+mdSYg+2BeewQp1tWKMEC5ktf1IE5Ma9EuY1yD6D4Bsqkk1+VOWkwlDg/IwH22CcFzX9F/wMnoKNnkshyi3n66SKQ/67ahOKT3rbPx0u79M+Ul5SMrz7z6GFCFTjcgxyd7jALm68gtr9fYKYHo5lBMhjV3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlG4kX3H; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso10294085e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604375; x=1781209175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=QlG4kX3HDQtzP6R87peAQ21KOr993NxCKGVCpGVHz/k/W+cjj9OU6xyybsL8jdgd/f
         ZC8ooygv2/aHWQ3A1o+i4Dqgb6WJGQUbboSV6NQU5YvoPdYMPxDnw9e659GuxuW8vgXD
         ioiMvivzpl9AUVE3sBnejtnBkQXqgg/v92mT18uZX1hTKJwBM6FkUySfMv/gjdzhHFeQ
         LrrjVK3oz6bfjASBKVy7M3fl+3CtJISOT9MUHAYS2VDDy/dHjDnTHjIWLNoVDeVljYU6
         /1U02SAM1eT8USoScBbVddnb/EufZ6LvVTjBi/W6XjU81cfZRd5SlpGc0eeDIjJ4XfqD
         841A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604375; x=1781209175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=TCLRADekGgjec5SZym6gegGLyAIwSlFXWh6jpoRHvtHmiPvYM/o5c2eBjggEfs9W8r
         NIa1o6729x8z40ZxRn6XLn+blCevkyMQQ9+eHiyF/HS1/54BnUVEm214BtCRWqreRapn
         Yqn/L2Wq+I4ROg4cJoTeu5P0RED8Dz56gTLramuupzbvH8ZwJSpxDWgV0TXiPVJFTKwB
         5L5nNsXk7Vlr91oJWJXvL8mdwD9K7l2nUHr8DRMNgJxSXASrsQSWj7yXyDZ63i12QmQq
         cepw7v7dXIINK64R5/+LhBxLRiPmW0Xbcpvf49DvrcsLO2kX/ME4CIBZo/RFezF3w07L
         zAfw==
X-Gm-Message-State: AOJu0YwYz2akHbBznWgbcz0KMmtnUeUE0wgEYxPIDxnsGUjBTgo6VqkK
	1UJElsMS4uK1SIlVWYXWtL0O4ULnD6VHfwnRpb1xDRNuzRC8LnI/rixv
X-Gm-Gg: Acq92OG7pNXkiNcm6R+S6zPPNwcFlbUcpKu5xm6DatwaBET6y8kg/PttMrfE588A018
	rFMk/T4RAoFY9YOGYgLYpXZDmi+/xUKb7bsSHT3z9Ycs/8u1JeLqPBpA34xPtEV2HRS7WQle2tr
	ZLqSLcxONBnJTOk0iYqwp7oRMfZUG9ytk5D15mcQjOMPTTpFJlU6mOUp1LqA1OPb35o0rmllcG/
	dV8pgK4E9420nGHsGx8pTQj0qA/C33QP1LWVfVAQ29tychS/DbuePQRYFwEQjcq5XWAWp8Mwd93
	PIvPt8Rt4XjCN/qsYJv71Sk2v4VMePaTVlNGIBabe7ajSndvyvSJ0u1ampXQMWAcE52WdVTXTWt
	Xj3REbMneLPL/MsVWEqErOyAP0lWmHYh4MT8qZGea5nDHN0XDSxk22ZJqfH2pMNnScGdnvuwUB/
	mrYbjF77uYLu1u4aReOLiF6Pw/No4ENMIQ6P8DkA==
X-Received: by 2002:a05:600c:1c1f:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-490c2598382mr2038805e9.6.1780604374641;
        Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm18999748f8f.18.2026.06.04.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 04 Jun 2026 23:19:27 +0300
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-yukon-eagle-v3-1-9e3b57d306a8@gmail.com>
References: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
In-Reply-To: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111269-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B69C64346A

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0



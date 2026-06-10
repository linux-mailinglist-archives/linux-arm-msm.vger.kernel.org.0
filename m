Return-Path: <linux-arm-msm+bounces-112372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fZzjJIEoKWrmRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:04:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26588667984
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=LMZcOLVg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD87B3060832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CF83B3891;
	Wed, 10 Jun 2026 08:57:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64A3AD528
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081873; cv=none; b=R/saggnsjPFGG+TrqBqa5b5YUcQ488Y2zBzIXE2LphHd6wKwv6VORh7wQ4jsIsDfJrCH5jjeJooQj8C4PvyXq489sIDaIkGWLv51V7XQJmiNjmF6UaZF0GgwTpJrWVo0sOGmxz9JmFlrN8i4E8Ues7Hd1SpKRYSTlAnB14bcLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081873; c=relaxed/simple;
	bh=JPhO9x7o+eXG0DD7v/jS2/9/mNNS+zlAlSvQUO5urbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrHqxVHawPdJJw7gRJ4smoV2DEGgcTpkUI7fQG8HfUwxassjmd6T0vh8ECFIG+GnVlHNlHkZkQBY+eD/J8FU2cEkc+N7D8iJun9biJzcZftX6UN7fJNpn/A9SdWPrxM2h425/66k7J9bdU9a4CbxdeHEOzJXm4lZrr+w7Vc+hs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=LMZcOLVg; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4905529b933so69978455e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781081870; x=1781686670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPtggOOglsf/NIJWJbOc45aOSt1dH8YIYoHoL72b/o0=;
        b=LMZcOLVgS9xHay/9bSWzjVLze8reib13vOvL+xwVNvFu5S94f5yXspQeqo7mQRfsD/
         shb0RB76tCtcWEB8p3LU0HZTnCD9og5NXIyxnjXAvUHIiw1fBAfTi8hW01fHx/bjY+Ru
         P+sryujNlykxCGV7Y8CNX9tn4n2bLh0gRqf7XxY8ZqmhxViBVjKxsoqdrq1gtFXJajbR
         McFQ1y733nqIIKvhwWJeNVM3uHwWTFk8xrqGjeg/hCiCn2qqzmGiubkb6SK+L7NC6QyY
         vghmeA3owTZjTIObssCFybWGcNnfu2ixGezkDn3JHv5Gv3nGKwRbS5EHQsgy4Q7mB3Lq
         WbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081870; x=1781686670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WPtggOOglsf/NIJWJbOc45aOSt1dH8YIYoHoL72b/o0=;
        b=Z2ggnaIdjQELoP5Vr8cwEUrWl6h8qJRBGa3ZhV7qcmcnArcQbvbGhv2XKxYsjUM3eq
         UYl/qxSeT+G61h5yc1nowoxqg65k0UCoR0BRx1u9vK2p+bn35aRgAfwP7b+U06OICuko
         WHJV/GuNXA7mxivuPkpmKysL/BhrwEv4ruL9Cl0munegf5mZBXbleiaeNgh0pLXcHutU
         TOUa3+J5lH5shJxZaCt1MH/XFMyNK1DqNpfjcsdcARK3XViw7COqyefkDnM3ex06YQXN
         z+t7P/vuqZem50z2qvAMpv6kZgtrkCn0ARwTI2PV3unf1TeD1nGXPQnebfyd88cDICzr
         1lqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/laTUqBAaWoUrEsJa0UTu/lqlx1J7F2Tf1yqp+qKIjH0ci93Z4yTpGl3FKDAC7D40h0OsnKYrn0tTOllSO@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTwnkLyIOIe+KUKzVHK3dE0iqUqWnyFKEl5aDDpIZ/QpWfanX
	zrg/Mv7XroZZ68DJWD1xzTSlgXiKpQrmgOV80Phwuch4YoCBrFzZ6Eei0Apb+Q3AWfY=
X-Gm-Gg: Acq92OETINuQv84AxDLYtoTgXBEfZEgecPdm7mNfbT5b6FlyvE3QzQXw1+R6nbY+aUn
	wyOVp39WvxtGs9AnlBVjMIJ6MWgdO38tO4Ozkipt+JvcMMTT/Zd1XQSsXYSw/M8RLdLMka9coez
	SL2pGakcCHZdXrA7i+vfexAack7HXwIVcdgwycZ1qiOWL6EfUJgA0z97i5aRLRzJG74D1B05v6+
	j+9DN++WV6YiQ+GjTGUpvfIywBSR0Eiqz2nvT42QzKjg73LAVAS3LfQSCnkU1N1NpNi1SSPUVD2
	Xnm1dwK6pmkngxY5Ip5a9umTDl8xjGE7yqJ+J8styDtC9HhWWg0iDa1I0FX/nLvXTvEPhew9DA/
	OgbgsdznCkcPO3Xy+T5t9aFsAIyRepTtNLZTa3s+wMEUMYgoTCnU+LTmaxVgQzcDnRT3ooT6TIq
	8oUgibeRDZYoYbGYSB3Dfjf6mu7wnT6pEMVR6Yp0BhaaWZNsdj/VnowGYZ2IGJdRM0ISBlXxdiP
	2wsDjlgCplSmAUxhrXVtq5f/bnSHT3neA==
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490c25b09a2mr399439675e9.16.1781081870227;
        Wed, 10 Jun 2026 01:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm584495835e9.12.2026.06.10.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:57:49 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Wed, 10 Jun 2026 09:57:46 +0100
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imdt-qcs8550-sbc-rfc-v4-2-358e71d606bc@imd-tec.com>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:william.bright@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,imd-tec.com:dkim,imd-tec.com:email,imd-tec.com:mid,imd-tec.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26588667984

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..ccd7b478e5c9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1105,6 +1105,13 @@ properties:
               - sony,pdx234
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-106306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAatIzpP/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:37:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B14E4EE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 938B73004C80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8942037F73E;
	Thu,  7 May 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="PzxGW4/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE13803C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143022; cv=none; b=jEQvxEhmsjTUzbMo608KMm+PzM4TOjUnXd9mCOfVAmaqp6OkH1/zrgV84E8B/YZ1gS6TnPMUNzSw7YYNbZh6yMVW5bgroeLqF3qL0SHy/quAwGO7YMrgVDvnNtizUyu8qpLQnGibTDdo5dHJo8+/AWXYoZ1etSYiMnl8Qa+VeX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143022; c=relaxed/simple;
	bh=CEkaozb1Hzg1sRymyFy/rp+fVMCBaGU5LmplVxUYO9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LnQ1Y1lLEehvBXq8BkKB5fwI8kPrFBl3li9RKHT60ybxsZ6hpYb5CF+9f319Nfv0G19YGk0aaxCQhwxQ2wEWHFXswSeJAgOjWaCB8EfWvm1O90JF7mGz3i2Yu3Ms2xrNYBbB9A8Li5F3CfHDdhcmYnCDK5e4TtgcR7j3scLrSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=PzxGW4/R; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ba840146so4732625e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778143014; x=1778747814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShX64iLRpKGOnAABoLYsyTZ62cRVF5Ndph9BJAzdsm0=;
        b=PzxGW4/RPk2OWxw4daNaHIPcl0NRl634KF5wPiHTQoHH88kdPGdIVyyfnIzepxlArd
         axgxWeL27kLAUhVg+EuLQXQBSI4+q1yEhEZxThxfUsjBBOywe/BDy4cPhzHSAGaYIcUL
         KdmV/2p64Wu/f0x3j0MmOvyctwJIhAKAyvZ3sDd6ef3G6Ub7Qad0aMksq36TcFQY8hD0
         gx6Tncxt91nRfgNZPdP7BYw306pKLI3nkqcm7Mhgkzk0RUgRGFnToQqv8caP3fXu/BRg
         lkYPSEbEtfgGVMw6Kd8nLUr7UBzJnUgd/8KYa8ahmIP99KqQLm4MB5RPcMr882uq54GZ
         n9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143014; x=1778747814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ShX64iLRpKGOnAABoLYsyTZ62cRVF5Ndph9BJAzdsm0=;
        b=ClZNNgUCWpg94XIXw406cuYQVouc0dP3dzEZyM4KOq0zyxFGAwPaw1FgQjLnsh6+i3
         oUqBOGsh4lbcUfDpviul9JTTAfYMsxzL/PLBN5eNUDO5nMNKRvDoPC4Q2IFh0fBm8u7p
         +FqhMM7K+rYrJuP/zh4Wg0Q+3gDvgSM+pWaC566+5Pxy+SxNTRQC8LA1hxWzIiw3x/pf
         hEgj8hyVh6Kau2hRro5hCUIbF34S7W2Rk/zvQIu+pQGsRMm5EJUAYuSyAdXsPa8WGTVC
         WVw8XzeAcZf6rBahMVL8iVFkF8RfO+XEiu9hOveNX7Pj7zBzdAkCZ0WH/Zt30X4u/cS8
         a3Tg==
X-Forwarded-Encrypted: i=1; AFNElJ8o2iNRk/Zh5xbljVijWey1GPQt2yKuEr4qAth0rwai6h0qEXvLBSqZvv+Q2U369pD4UdVkbgaDytmB1PUX@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdx67w2WBYWDalNEBqeCHsgc06rIhtlkBja8EW6pHr6YSxYnU
	CuuEBOsBS525pzA2ob9SIc9ETFXbfE9i90XdEKXRmyIQHey6fiSdjYPJXRuPbhMCLTw=
X-Gm-Gg: AeBDiesXoA77vigXTct73DkKtXGjOUZCw/S2/Pzg7zXxYLxD58aSIpsBNDVfwHBxHEY
	AiyfLzLthUUE5pbSVV4ZUrEfI3txhgPkIgOnL92nOzXF+SHH9cWQD/oXsPnI2cpR0kg1Q8wigls
	tF1RVOgrUASZbyhmb0YRQREiWR67Sc8IHu/N9w4bLhNOPi4+zYkA/2hwjd+V8iJ593yYZ33aYd0
	ttE8eADYndcg/TJ6v2nk+dJddyvz+CqDCdBfz6f31/xb4Wjl2IANUdDRRtiivnOC3KWWOgPB1DZ
	D3HU0gqBVeH1nv7rSjMu2tLE5TvjFh8POjfA4+QVO9Jf+eOt4UYCv46ZrSu3+Q9Ga0i+2tPmACD
	bcaYTEMrRjacTAayXHcEru87rjpvnk2DjdWdiwBQHIsfWPJ0JcSOg8bggOh+1N+Pv2Hfzt3Fils
	naoA/ErLQElMokk7LNOUuTha1J9z2hu/4SeiSXzWK/1fDXd7Ml7bJ/rN3V9vtTLShNQcuyzUM1p
	bE/rngVEzmuKn2KzKg8WW7CmycCT02s6xI=
X-Received: by 2002:a05:600c:c4a3:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48e51f46e38mr115202465e9.29.1778143014069;
        Thu, 07 May 2026 01:36:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:cfa9:e812:def6:e9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313a158sm35602705e9.24.2026.05.07.01.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:36:53 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 07 May 2026 09:36:40 +0100
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-imdt-qcs8550-sbc-rfc-v3-1-47d3d3372b33@imd-tec.com>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 967B14E4EE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106306-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Add IMDT (IMD Technologies Ltd) to the vendor prefixes list.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2db12a1cb6e1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -769,6 +769,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0



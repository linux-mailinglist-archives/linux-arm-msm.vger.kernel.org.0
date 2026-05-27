Return-Path: <linux-arm-msm+bounces-110021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCaJFk1PF2rcAggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:08:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B885E9F03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76680302909B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7543B637F;
	Wed, 27 May 2026 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC5Kkw1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881C3B6BE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912494; cv=none; b=TI/zUpHyuHjeMBAFfmZmPbWFLcwVU/82nIe6Aessd9tE3Md7c3Qnsi7qQm392HUslsL+ZPms7SeSC3KM+PgVNwcuUsK4LZidKdIEtXN5IJLTfTLofocKoBGgpc3+YGa7l2eAYJB6QjbU+hsOybdElmmGu0l7dmTHitC2YewvpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912494; c=relaxed/simple;
	bh=nLaNjhV9w4LQ19tqYh4CBqpRid9LZpY2DudE26Y0cfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIMFMDACwgxdcwYq5+b4X454IDlhNDcIlVjmzzmo2n2ZnKPGGKBowGTnmlGNlVptQpvQeadPOUbwL7kgJXGx0RW1pmhnNctL9zQisS3VIchWhATyZ494YFTw08FnWeaOla7JNEXT6zQ0iG1HmmZ3hpJYo16tyoeaKeXjYyJJamE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC5Kkw1M; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bb0d18c7f9so113726697b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912492; x=1780517292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCyCktqg53OMT1gkdMQ/Nzei9mUmVcB94In9FoeM+e8=;
        b=GC5Kkw1M13HvXZCKw8n05tR5pJ0wJBcGUIWPfnLIToNXbS6NrdwIj/oVuLX6Cix/dj
         /YKIz4W1ehxRByHzWcg/h49IUvbAEfb5jJt8jKr/fRCsqQgvaz/QiTXkGnKk/calVq3u
         iN05aQD7iyI3FwAO/0ugq4nvE9B2bnjmPbnkZHpf6eQsoyA7hErVNKpG9OdhhhTyPJS4
         nOZMCmwpHTsIQjNZVnR3yJ9ynDfDyGPG6oU9SRRA0iBbdH659JPxSHJZNtaBzS/aZhsz
         KcvxxZ6z1M7U6fU7NlKotBWYg2AK11mA9pCdMj5ti5j4CWMSzy6jaInIr8os4TraypZq
         CIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912492; x=1780517292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCyCktqg53OMT1gkdMQ/Nzei9mUmVcB94In9FoeM+e8=;
        b=DGhkw1lzph7L3vWAK9CK906SIp+WuTveCI4J7Zebm8uuWntZGaat/69zXVtp+Jxr6p
         J5BDdpKcjQq7jGWUWVhh6eQrok9jFOOPRdCROyfI34UI8nWd1PWjtYEwY1ZOpBUN6xvB
         pCIpDMZu9c0ivqupS1Ipc1mPOYMbKNNk0F1OT9vQgEz8ZtnPJPsoteiO2pNYrhyhu0+I
         o9rpyNZrT3L+Ueof/B5wbaEr9YHdRxzXMy4aPj5jW3nCpfgFzHgEDVar+v6nI9RlpIeC
         KlxRznGNhWDt7o6bXq1A40YqcCruOiMXRzK9PpgE7by2K2HDWH9xFdBPL4Bs19GuaYQM
         CdDA==
X-Gm-Message-State: AOJu0YwIRJ8fu4GzAWNJj1IzZZbbDP7ykQd+0qitpm3ijwavqpV7mHSD
	R1a4I9nYWhkxwVUKlGzoK86mvIUoT7mFXQxNyzR01p9/8WMXVjsIuzKJ
X-Gm-Gg: Acq92OH9nqD1b98j5xOo18sAlH3hpLD57/SlibHkEHCCO6hfpuoV22et0vwbyI5G6Fg
	7P0k1taQ+pT4JLkIDvIP2gJFD8Kw4ZUotHfmVQ0t+GMAm2+xs1yi922WXMsJ+L73KI0DKbSGjGV
	MEJjtaC1lO0MUejTAUslmKxyFW3yXHOs5Pi916J+C7x5ZZ9EUJtW+XZh0WEW1rc8Z+JYm62qeTZ
	fq1tyh0V4s6xwP8oOnRlgXBUDhoZcodqTk1pyzEAuEtqZi1T4lsRHO7b2ic4y/0uUkeKFZJLgYp
	10EszqdjGieomAsHQH076U3qippVM+Zp0a79nBEndW/D2x9ZCyoGd3YnvcUU8IqSDeva8SNwL9N
	uFL8lYw6fvfO6gkZyRlQuciCrlBIoAkIPb9ybyIlPEWkjKfyQp7BXRHdpDFwopqtc2bLuxUwopT
	BT0VAzR+JvTUaqvFFANhQT1BOc0Rfa7Z5bwxEvqpCpKfSWUrU=
X-Received: by 2002:a05:690c:6d03:b0:7d0:1583:4cc7 with SMTP id 00721157ae682-7d337db008dmr256377907b3.9.1779912491951;
        Wed, 27 May 2026 13:08:11 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 27 May 2026 23:08:01 +0300
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-yukon-eagle-v1-1-98119d64a71b@gmail.com>
References: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
In-Reply-To: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110021-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 82B885E9F03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

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



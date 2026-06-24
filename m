Return-Path: <linux-arm-msm+bounces-114344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6hlzKPrTO2o3dwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:56:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF26BE4E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:56:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s7gsLGzi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114344-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114344-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78962302E90F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5623AFCE8;
	Wed, 24 Jun 2026 12:55:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B50D3AFCFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:55:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305707; cv=none; b=ITz4uiyDflKwdNitBaKEL7ToshCI7ayLg7EnTUpl0LlzUW8Hhj0uEN9kUMLue5hOAIbLxZIcbGcMYTvR8TjhjGM1aoo6QqI9eLPPtXcXH/iP4pcr+/ndkrU8oMuYmryaTFbJB3j5t9TIntIDzuAs396y+EBDAVTXanhLiCmpF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305707; c=relaxed/simple;
	bh=mvbYsq6s7d7W1oouiNX7rgDJWbcpYrxcLw9VH/gGvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTtEp5CDfGmuCjfjDCOwjanoHUrBPQ2IQf22K6q5cdT7t8Y0+VsL9Y4iCaPgKM6ZZdBXgMimRbOJP+IRK/ADCqfGF7tHbYAmHXZkOo9kxneZZj7/a1tTE7Xg+8A4166rvkaUDYMxcPDh5T2INg8rzU/Uf4/WRIfB52euWygjTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7gsLGzi; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so609841a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782305705; x=1782910505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=s7gsLGziYNmM1sXjYLpcQj6x8qXaq865frHYkg08d35BtliPQztU+V3kPfTyvjmkZD
         V2kK05sd+UalqPw0HW9aJ+yOekHsHQMAN0Uc0YlkT2bZWt5QpTn4nvux//xbbaK+VSSs
         T7rd65oFyfF6Ue0Zs4rjqdV4bfxgMzVXtibF1AKG9N7vUkwoCZ8ZxkhM+NGzQYfPHugK
         R7cqd+wuE6TIlDHTwuozFdvTw23yXMkMsU/F0OK0rzMGIP37v2vBnBo0MOXvALIhIQHi
         eYa8FC0kwjpan06axJ7x0SXaOHPz1fKqm4Df43QUUQgnRlPEV5sJ5+mVDa5WlAAiZlWC
         4xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305705; x=1782910505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=jEMskMxZ/rB0I5SCKtm/6WlCLi15WutAziD4fecvI6qARdn7pGAfB8oBwlReT2twJQ
         auHQ0NFVVIA+UvM7jwj8CAAJTLX1cqukdyK5h2MtFTw14iB+2ili/UC6FOb8tTeFfA6Z
         +znEkgz4MWt8cYEMj/bS7E+Qh/CEC0iTFwKwnHowURAUAGVDSkr3/9yOBLasa3lUeVt2
         fn3tB1QqURJ4HAEb58SbmpNiJZTM7S8TxLXg233+AmsW3lcEfK5gHV9DAm3wuhID6etx
         XWTYg8Kl9+OZoNQCAXglhZdDEcAMaPsUiRu6p8vU574yYgfoap2Sa0RnTGe+PF9XD36s
         1jUg==
X-Forwarded-Encrypted: i=1; AHgh+RoTmuGHbVeZwsXlVwrB9X0WlDAK355KSLUMBLRcWnjn8qNPdK3KoHu8XTAQy/CIpZ2fFqS8bVEnr0TnOUKd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6S48YCfIXLtJLQpq2+NfkrQxR1oqh8HRe2BUfVv6cuRebVxAt
	nfiq8mcPAow4/vKF/UBKnA3b6iHKTFdc3328XS2+UxcW2uctx9cI9MXF
X-Gm-Gg: AfdE7cmpgU4A58TWfQ3gn9ZjQZ4tMPrD7kD4Q33mHtULdFQvpso3Lid4/nJFYThZB8f
	Jz0Bd6Zg7e47xtlNoV+wQEdBUnIW1rqUcJ17FSNQWjk4W5PuLUCRjowpQHZrzHLN5x6rwHQMY+T
	fSf/trEvJZ5djpi6tPZmOjM3ayfOPiBJOlkpaocDHxn9JF+0u+CsEyClLB1hOH0Ew5X9cJT0fel
	s71Ol79OUFDc1biDqGZiGFwCE2yA7CDDUWGMvLHtZaENn4Jjn5X9PLJ4yV0cC7xgxRlbfMYRQsD
	N54OstzKzK1UliqvKd6vQKS+aDPQkwM9esOj/U1hmEnbwrZYtzewcsMnu9wsQ6OsYsOPPlwEB+I
	Iqmn9FxJylrM3RwQuKbnMYmEALKO8B7Lfo4670SI7RwW7i6a/tswVa2swn5fYdQxtQE+tp52Y4d
	z5ncsa4vAdn5qAJhbumrApCgMdZaOx7nu5vy3CVdEkwyfCiJFNYp0=
X-Received: by 2002:a17:90b:1b4c:b0:36d:70c8:3a1 with SMTP id 98e67ed59e1d1-37de425bbd4mr3513950a91.13.1782305705226;
        Wed, 24 Jun 2026 05:55:05 -0700 (PDT)
Received: from localhost.localdomain ([150.107.232.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3b839acsm2984870a91.11.2026.06.24.05.55.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 05:55:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Wed, 24 Jun 2026 18:24:42 +0530
Message-ID: <20260624125443.18729-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260624125443.18729-1-blfizzyy@gmail.com>
References: <20260624125443.18729-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114344-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:blfizzyy@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0EF26BE4E2

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)



Return-Path: <linux-arm-msm+bounces-106957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG8gFCXrAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:43:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D44510726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58D03302923C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637A823EA89;
	Mon, 11 May 2026 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiFbVF/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E053FBED1
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510515; cv=none; b=PCdU9EkiiN9T+guVFZI0JfLbBuLYKgkjmleUFOGql28tCxNAixIj07vql6O9ZNfdti1XluLZHaNmwD5Y5WOwQSbFr6pyUCOtxyiY718Vu2gFm/jt6K8CCZIKqjXE+950RKTYvHtavo3pKdn5NEhY3Z2oLwJ5aFe6odlkPrhUAJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510515; c=relaxed/simple;
	bh=Uj71YxMd7CP0/+rQajvUXPXNAzpKdvAdtZ6sztvIkfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niSvi3Te3qZbUyQ8cIrQf28KNyAHivgSKFbHM0IdubNzxGUvCw39z4W40lqu7AfXw967LoIYKfH11pik8sinp4RQAcpGLvRF2x/CnVraeYcRjfTKU+RE3kfeiAP5oeDqEGmZWhsUUyXyQu14okWX4RWOEjXjWHGpj4yvMUj3mAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiFbVF/d; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1986775a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510513; x=1779115313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=WiFbVF/dLAo/F/CbBG3os0SHYlswQVJNCbl2BaLKx2lkscvK2j5gJlHuUQqAVWBx3z
         vXwGGARMR0X2oqfRY8uEnmFHY8mmEQjJKg9C5UQnLXTRV6T0+E12kc5vB5GUE5goxHUz
         nXF26ydrOa1jKXN6BqotyvbrKODd3/kK2FO/9Swb74QZl40dcg91Rl6ODfjM23j8YIBc
         Pp6fRVHVCtp4W/Q09UB5WCucvVKCq8NeXv0IfJRcdoleXL/LeVnzsRTV8u7ndQoosWj9
         LI90AQ+hT46Ao9MOp6JjcGtYK8Kezjk1JGpA9+TybArwbKcFo7oLodyW2hLbnacdh2Aq
         vcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510513; x=1779115313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=Hdtn3ZCsD0d8MWh4oFwfK7T+rAJ5O+uT6Y/cjBOJWAJm0PwevH3LDA71I8iCQn7tPg
         WS5gWiNabZSH3+srlfavnj4dAzRLkQjMey7MQ+7b2fZnZbw0WLScu6H9abYBC+NDNhqs
         329mYD3kK5dxULBsaVwoJfVfi4HSTTW0Ro7oNu/Ait8BXDvAfN3pZFj7ytHW7k0ZnyK2
         MhX/hDferN3wJEblGVQlvq5hR62d2jptvO02SKaTqTTu7DK8lby3XpxxBtpRLy7kRS4W
         UoZ3bMONd+QtMnTPv2kWrPKp/ilPgiC+Q3/7OwvbQ30ykC7jjvSXhYGxtAPeEr2cOhXn
         8mhw==
X-Gm-Message-State: AOJu0YxG8+j5E+EBiNr4NK/y5X+ESEH4dYS8efnkyqwyx2HedqzUwNMH
	MqrzpZusaTPItHu7ah9ubKsbyojqwaGgmo0HVnHxAJfFRy59yXZ8m6GYqaIbrMHn+Z4=
X-Gm-Gg: Acq92OE7tjZLt+kvWC+A4T7+u+HlYRYFIQ0e+t5mJ3+WM62FzLMIQKLBfwVF0N8NFKi
	xt7nenquliaigfYY8zOVbje+JdGtdCGVNRNP+XWHivxBP5rVIcId8dve/F0fNLSUGg2zPXG7PTl
	h78yZkD7858VFNzyNlSRU0MmEBqobKDC4N4RE1UmFb1HoLbPlKorHMjEQiQnHAcHVEtkC1oeBeI
	l595zyQN4unP9hJQ8LXmYjPGOYWco/EEph2hseMr1DVkRPeJHmxoHoKKxXE5LFURb6JOuSKJbxn
	i5iPRPfk3oz0jTiA2gJM0zxpHL0akF4WLoUhts1e6JO3vz8VY35Y7pEPC+S4YwN8eMtOSH48d9S
	vjuTOj0hWgFzYIuRtQFu4D2C/dva/9r6vaYlpeiQrj5Xg0htAmluPBIw5T20aExWe/bVx5EXAK6
	Z2enU2gOpOxc0JmEoUu6alW+gv+oleh3v+lB2e5Q4mfNgwOXhXiPmY3AbRpl4YV1lpR7zhDwQNm
	jQL4KxXJHZXzw==
X-Received: by 2002:a05:6a20:3d1d:b0:3a8:1364:2d28 with SMTP id adf61e73a8af0-3aa5a709ee6mr27247296637.16.1778510513082;
        Mon, 11 May 2026 07:41:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/8] dt-bindings: crypto: Add x1e80100 inline crypto
Date: Tue, 12 May 2026 00:40:51 +1000
Message-ID: <7630457220c3e10eaedaea6d53e1c9c9adf43739.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 30D44510726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106957-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add compatibility string for the x1e80100/x1p42100
inline crypto engine.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..a338c4a33e98 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:
-- 
2.53.0



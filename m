Return-Path: <linux-arm-msm+bounces-94861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHAiDldspWk4AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:54:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC9B1D6E86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1DF63018047
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3676F35AC06;
	Mon,  2 Mar 2026 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jslYeGON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BBF359A89
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448632; cv=none; b=sQ4ve4fG0PXu4F1NxDUUaWWgc9KnBZUnb0ze367uYYk+itTSIPOf+6WwGn5sPVrAZXpShEyalj6aKUghQhKA7WVLLqp7IrSjJPJWANe2TH4xvHUiS97YDwixE0wmZ5dHwY7ONtuQivysm2HyTfr2CmofXwt2nafxnvqJLLn+Leg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448632; c=relaxed/simple;
	bh=9bxMbM7mFlV9f4RAAhXlkjX34it3Khg4vmAogAbhbZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LH6JNMyUmYmzMM2E9o2/6ZDSLrf2TgzxleVNi4AGd3+iYb+VuvP++1F/lsdN8TB+DG2bUhKpfZye6Gl4WvXpS6DgQueoR8/sno+rJIP9RpOyHF2bHdBv49W9d4yb/FZv8fJVEK7vQWsn7sLxaHXIoNH2fAdxyV+4ZPaNNH1OiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jslYeGON; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8fd976e90cso548675466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772448629; x=1773053429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UXVi5KrGAHXfY9KZhVckbPLTWLOqhGUCqeRbt5GfFg=;
        b=jslYeGONl6vBw0Or2NFtX9gOwyiWY7DuM/R3Io28yHnmNC6aLjZ3e5pNv95BHtea+g
         fuOIhSHXXoyCTZWLt6Qdd04oDRo3O2Gwocz8ib7PhMe118BrWya5lbkMy+QUkOniNQE7
         LZgXOjDcdHXLS0EhCIbSoXywl124tOhG4OhNR8P09/mfQYMt69dyZFFV7GiXK3vb7ZB/
         cHrIM65UmvP2DnhO6wPqRJPO5MrAfjXZkbwQ0MBOKNBcp4RQofatr9xw4smFwcckfkgr
         IT7IOywN3wPjOIRWJfTAOL+mq95K9QYCPIeCCRe9A9Tor/T1tCoNRqi47A0VPICvxf6H
         We6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448629; x=1773053429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5UXVi5KrGAHXfY9KZhVckbPLTWLOqhGUCqeRbt5GfFg=;
        b=rdvM9UOuC6EYm2oH0vxLhL3YdmMjlWACWhvpGnDWuJW4dMurN793+b85fB4RwWNkeG
         1PGN4W35Z3EdUSTXObtZGo9jogQgbtzFBh0d+FFFyY76fOrojlJ+jpi7qPH9nU1wbMGm
         EP10SbLCSFIxuJalfvdkqsuq8PYl3EtHq8EKfZOXeUs8dzhSl06chT02WeU5Omqb/DLA
         A25/pRabwvszl7NCMCGLZtb3WoA6mhsJtfeCmLZe/yThkm1oI8uDrP1EWLIm+e/8Vzoe
         W2BnJ1ogDUG82wFw+1+kGK3fg6GmiqRM5VjeQ2CVQBN13JWAPQppLS88XiZ+8tE04axz
         Xf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAOxcshPwxRF7gpwQc2Kc0mKeu6AMDYxkcjRH28NBiRCN/RfHrPkjj1j5s9xML+hjEloDNAAJj+KhBw7XQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzG00RW/wEfhsOTw+msWUrawqyh4dLoNAYtHoTyIkRJOUWZjwhJ
	+hcoXEldE8GymV8ROGXoie2lMv8NTWxL40H4sb047NGJDo+xXBOl71iO36/4A4yP7Io=
X-Gm-Gg: ATEYQzwUOeBpcHeD3P3N45u4o4quJW6QQlJozXGKMIjCkYq4eSiEbQyoPsr92oRHYra
	q+T7I1W5N89lFhpLGaXFWePE0ncrT5OQdKk9VlyyXcv3476T4JKdbhCEArb0cJn0WIb4DAVUcLa
	Bzf8JiN3zaLrkELxCwFx/jt7OkYUdCDZybqeBPkEjZg6hAeW/1opOkZiyW5mp/0+H4gRtAXJ97h
	v+Lt7wls93uEgqr8xK7GvjRCHSMf9DVs+0SJPdnLLny5l9QJG+57TEndX36F9i/8mpruep0zhh4
	wkLylCOg1nNdI2xCNU5U9nsemtxaCw9DFftJOKtFrXQMOdbcJucd1UXC8F6V9JNQpcf9kamvOjc
	9HnAvb7+VfDKx7/FsRYA4KrEwGOKN/Cy9PSb4lRzNeCl4Td7QRn0lHW89dj/RIkyAQaPXWQsGVJ
	34HKHYjwMMcq6CD0PuWFSWfzIY9OWA8YSLUn5O4wWv1LwRSrky0HzFgQ87cXMfO9QQvgBggEA12
	fE2xprqXw==
X-Received: by 2002:a17:906:284c:b0:b8f:ae35:cbdf with SMTP id a640c23a62f3a-b9376554a26mr593398166b.48.1772448629103;
        Mon, 02 Mar 2026 02:50:29 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabbd98bcsm3511769a12.0.2026.03.02.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:50:28 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 02 Mar 2026 11:50:26 +0100
Subject: [PATCH v4 2/4] dt-bindings: input: awinic,aw86927: Add Awinic
 AW86938
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-aw86938-driver-v4-2-92c865df9cca@fairphone.com>
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
In-Reply-To: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772448626; l=1245;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=9bxMbM7mFlV9f4RAAhXlkjX34it3Khg4vmAogAbhbZo=;
 b=5AJIgaZcjs8SFi9VrDwLO0PSnG39onXqNSyDYMzkAUmALF7AjCnAqyCV6ybrB5ZPJyrm+dl1I
 fKjZReVm47/BoXuZYvdU46qqA90LpatPHk5pHPAEgYWYV8o459qyJTO
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email]
X-Rspamd-Queue-Id: 6CC9B1D6E86
X-Rspamd-Action: no action

Add bindings for the Awinic AW86938 haptic chip which can be found in
smartphones. These two chips require a similar devicetree configuration,
but have a register layout that's not 100% compatible.
Still, because chip model is fully detectable via ID register, these
chips can be documnented in the same file.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index b7252916bd727486c1a98913d4ec3ef12422e4bd..bd74b81488f61d72b675b5701b321b30b3430be0 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: awinic,aw86927
+    oneOf:
+      - const: awinic,aw86927
+      - items:
+          - enum:
+              - awinic,aw86938
+          - const: awinic,aw86927
 
   reg:
     maxItems: 1

-- 
2.43.0



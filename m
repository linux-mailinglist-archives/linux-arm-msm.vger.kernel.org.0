Return-Path: <linux-arm-msm+bounces-92291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAETAlnaiWlFCgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:00:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AFC10F49C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEE7C300C5AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE98D376BFD;
	Mon,  9 Feb 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RLJboq0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C260371074
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642001; cv=none; b=cwmdhg4D9ot21o2dM4dlWwrZNiM8x2b2KZoYxUuYg3htT95uwXUWio1S3HnSSxr2OmBPSurCkU2gJuy+oIkRtNNQGRMKVxBzz5AIBrm53YCQ67Y9TUyKHI4UkGRU+C+rGrtIsiY21NKTz/Z/38PjB+lw4IWnbROwOyC8ofNOTWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642001; c=relaxed/simple;
	bh=878uUL8qoZSSKPLmPkqGsNRZPfYYSiCLIPK1SBRiT9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTE7wPzD4rVGyNL9jzFeBdcCFgCGbbTHdZx6rZXXHwhnXaxiSCsEwQPoFwVhFR+lxNMm1iJx1nO65srytPwTdJDMz5hD3SuC0JkG01NvRZEImLbN+KNT/5LZgCC5C/uiSWNGAn+5sT7uoADG1X3400pZfIs2100qNMaTKQrMA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RLJboq0y; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso7357581a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770642000; x=1771246800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5neBturV3EQdGbZuvQGl2q6cuvsiRZLWzYgmw9mfdM=;
        b=RLJboq0y41+2NSTxiy+QmmYHLGs6TgwthMnjSGBvhE/vWpuICLBtF5VpFyBpEf4+4q
         18zMTbXolo9yAfYlzQgwXh2auO3ab3TCcxqsjnyCBoMrayJjJLECwXTU/k0LFCwxYQgm
         gr0vKEYVm8pC5q23Mj7oDI4WN/7v2Ei9GBm/UmoDErVgvtYdIX54VHlHwF9o90f/0Upk
         cBpWXAEvf5dHmGN8PprUtwCqdsZIBM0MAqQMesaCgOxLc1BT8HkmFRj96dc5uLpiacOO
         7sQl/IjULIhDMLZDD80yjoo9qP/wm4AZjPh1bO11VqICVhPwd9gz2e9mYlktz3iKpvMA
         bghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642000; x=1771246800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c5neBturV3EQdGbZuvQGl2q6cuvsiRZLWzYgmw9mfdM=;
        b=GWGxF1ivNcm4/4vtPAJa6hN/JuPAZ18Mw3oSxm6KIhRpMNRcj6vTphTsF6OgjjAkJS
         sHbfcrOmFCniCXXkHUv5vx81o8buytMEjNCbRLyoKozKSydHs5kJZHUECLi9UjSZ8K3A
         k1bI9KepIJo44QEls7jOwDS5z5Pfis8mb4ZExaYBCE/ZXKVY0zvYxj3YuW89r1YbRVuv
         Oqq0jDpt6GXSOtkVhooPW7Oynjg52R2zhSbJjQJI6Y+8n1ney9KbIG29G65MGDSWfrE3
         XWlawhOEnQZhiBraFK+px2sV/RgY929wM32smJOvT2yNLdHrzYFXHHV8up2UZ5IkIIbF
         RI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVQECaxDVIDgTILbGzDaPu2dOYYRCD+LfsccyXz/D+3u11oTTaCxwmi2DvC31ysCfhPen4D6T2aG5f9wBp@vger.kernel.org
X-Gm-Message-State: AOJu0YxKfVfdNlkEcMp/yFbzQ6Hohr+JFPHmZc9P3ylMZ1Y7Q3G5lz2Z
	h+u/8XA2eM9Oc6FwqWS/9lVdIy8jxzVPxi3heAAaJwUykFTogNfTMRge/z9/5f48ygY=
X-Gm-Gg: AZuq6aLcgEDCfqnhf+NwGAuRJFpHATcdTxXVVxxIvsbWKHKK95bWCLcQ55lXkIBaDsk
	x2mEIeRCCSzfMX7G6706wJhCn+Y//MhGPHt9OcN3g6sDYXNrDaOOia7J7OMZsWPOqFQqKmZrZEt
	rs8mVtZOuOx9X6GxHSbGF50ZPqtUlbWfesXovaDdXYBKrpIJBd4Vek7/ttek31cWWpVa8pSJK2C
	w/HySgkIZ51uhX07aJkDKKs/OGWcXfv2Dnr4m+1Y4BFqcjnTHbAAbAPGMHT7a55R5uVTxjnuymt
	dbKMBfhsFxvHi6n/DazVVCtr4kQFRgricVaiQ5zAU5EH63ez7unNkgUUC71zAgcf/ciMmsmSlSk
	P2u6OaIaKfyTAwtH5hvAPCOPWk3QG5L3kS4VPKe+4iwZ+2cKc/87JZFmk/HZnTh3zb2q6dKlWoI
	PhjBoc/XzMsgTt1G1RJrKOdf0AUuuSaDNCjZRRqaGcKXWozVyaDoyHoH2Pqo0/kiFZ1sFg9g==
X-Received: by 2002:a05:6402:2688:b0:659:387b:cc32 with SMTP id 4fb4d7f45d1cf-659840ba158mr6302350a12.0.1770641999875;
        Mon, 09 Feb 2026 04:59:59 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983ec70fdsm2803040a12.15.2026.02.09.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:59:59 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 09 Feb 2026 13:59:45 +0100
Subject: [PATCH v3 1/3] dt-bindings: input: awinic,aw86927: Add Awinic
 AW86938
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-aw86938-driver-v3-1-5c79cff30492@fairphone.com>
References: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
In-Reply-To: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641998; l=1105;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=878uUL8qoZSSKPLmPkqGsNRZPfYYSiCLIPK1SBRiT9g=;
 b=sBbu18kdDcIqMf3K4PzPfTpAGwv5KBM7oxxjJvJeiCRFPcMSsMq9Y+G1WHeYw7/eW3C/OzIev
 FeueiQtJR8dC2lrXDF0kvVjOT/YBuPCWPuoHoztCtPsz2IGPzEv62Ah
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92291-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2AFC10F49C
X-Rspamd-Action: no action

Add bindings for the Awinic AW86938 haptic chip which can be found in
smartphones. These two chips require a similar devicetree configuration,
but have a register layout that's not 100% compatible.
Still, we can document them in the same file.

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



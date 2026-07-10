Return-Path: <linux-arm-msm+bounces-118222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oKbUEEbCUGqJ4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC5D739557
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=oJ1OwsRU;
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118222-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118222-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CABE93022051
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893EB3F9F43;
	Fri, 10 Jul 2026 09:55:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54033F1AC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:55:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677313; cv=none; b=dpjzcLtzAKIx2eOSVG3EGME0qV9NhULYU5va6Kwvunv3HN7mxD/Ce2DDRg6EWjsIaCtqj8RjCXASUilNyTdVK97wdmCkGp7Cw8w4ZOp2ogCPuYuaF+rpvuAgowD+8qrociY3i7d8xzM6LBj2NijX+kojOBCBmQEExjyz5NGzdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677313; c=relaxed/simple;
	bh=PYaQlk7YAPrQ041M/bvdqcr1+tAUHuw1nB/hxRtlWPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ALGDRJ/XJLLUrwkGgW7oY6vNfYTMcBCouZn5qE0AsJfXqk+r6H7WgAzr2HyZagaOrpfYFVaz2Y7LU4W0i+aMaF76slVUWXM9GedpaKZraKRZPvR1K646XFCIhhFI74WLIqfkTRqmf7c3WF3XmG67UT6OZ4oqt41ZQYsq1I/W4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oJ1OwsRU; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so1362827a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783677309; x=1784282109; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Au4v6cU7MBsP2sPvCvHMdLpV1qE/Ythj9i6e9ev27jE=;
        b=oJ1OwsRUV46RFfdUQBdY1bFjrXlxV/DcYyafzidK7UlvZnEUC9TMJKqmwLy6iV7Ho9
         I8jflLJjnC7mVyIVQOQCfATIQTjzTXg+vXQ32O0p8afiYWzBEhoVgUL+KPspRGRbjtVf
         J6LOYQ+EXSZX0UcX8bTmjar5497jKhtWAqelMi8Ns5MU5j8ZsKWDHhCJ6mPh5iAZxCN5
         g/Fnc3kSa3+N777cSRfm+vuUIWVXQpH3/FJg3Txb238wZk+3FhZa0bqk5mQlnngA1BXF
         E8WIjMSlfRBGExVgQZuPT36FZ+1M4nYHNBXvMulV0dRGyqBKir6FR0xNqZShjYGraxjE
         +rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677309; x=1784282109;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Au4v6cU7MBsP2sPvCvHMdLpV1qE/Ythj9i6e9ev27jE=;
        b=Xm8HRbXYiPVG5OK6gjEekU8KP3VeJhgAIduXegN0c7WxZPnkXu2PU7vqX/ahFoeQkh
         teZm6RQ4x4UoSOkZ2LVcMsJfec5cevfvrep8/iOYWQVjNQexXnKBk/ADfUDb5i8BrtAK
         Uhy1sn6EUB24Z/J1Sde1YgSSf8ui33pKgy+ywDHYlUwCO/77ViD3Rmv83XmvDDLHpuhb
         QZIul/wMGK7fj0wMFFkY0QwtX3+2+rmr6KLvyQInzU+El/GEAGy6aC1iiL7VxDvjA9B7
         E768MHen8/HwyS7tm1CjrV7LlTNl2VS308qIBf1L7xexG7LIWIG3r9E6XZosN7j94CQ7
         iklA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0i3JVMKFnhJ1CIFt9eJ4Ih9F4m2iu4A/EmGb2GEjJIiOfsvSvUcHfY9KabYmdr/q1UnM6VQT5ZoOuJ9E9@vger.kernel.org
X-Gm-Message-State: AOJu0YxPnrMHA3IofLClIFWWWkb46IDL+JMaRsuf6dDRCuV7IM2xZI+R
	vRp+Z7n5ncA3LB89BiTbioxh0624Y7467NVhZrS1VqrDuCEwk5+WdwT5/lM/NWlSynw=
X-Gm-Gg: AfdE7cnNZ4E9ti8MYGhckAkbJprEEOSSfaZQerOlpDVFXrAujNlLfbHNNj1ngDXEAzF
	ArK6vUuaSfTZyxUKolvIVATK48tUUMI+f2G3KayazPA7pe+bFtccT1ZYxre+i8sOriZwlfpiUg1
	Lfjz0KeMCTCzrQ6j9TVSPZkHw7PtcyaRvS/JRV0s3hVF7dDV474ezLrD6jIy8XowvSfP+xBxo+e
	X9mQ9v9vZwy22HUTMaViBHTL1med69Cw0juK3wpYwBzFmuspwhxXRpfEXDH9jfHi7gQnRoQNHiO
	iy1GPkhWnyDPIHq0qFey9taAPtYIlJkieLlp9Lh3uhmlnj0cMdXevoI3JGMpu6OVKgb6267TPI0
	GQqgxX0ofLIq9MySjRve3IwOw5WznO1aJLBUi+Cjg3I/yk6FmDEhz6pE0ebh8S5GMe/wqwyGtWa
	gSaQ31/CSlf+4hPbNa/75vsFqAfnKrEqt/JVU/Mu+79xr5wF9WIVLUTHCMLXdOPLTpie0=
X-Received: by 2002:a17:907:a2cb:b0:c06:f67e:ed9 with SMTP id a640c23a62f3a-c15ce06fb21mr479808066b.10.1783677309069;
        Fri, 10 Jul 2026 02:55:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm502892966b.29.2026.07.10.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:55:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:53:57 +0200
Subject: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDuQBEylVyld1PG3TmlVMiqCe
 Hdju/wW721kSAqjW7FRwqKmQ5/hLwVJ9+xfYG2yKbgQ3dU7/upnMLamk8AJhokrRO9jKVLWFeV
 uTGh1/T3vj79trt+Q6RzRvh/v8YP/dQAAAA==
X-Change-ID: 20260710-milos-sdhc2-reset-8e61165cc5b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783677308; l=848;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PYaQlk7YAPrQ041M/bvdqcr1+tAUHuw1nB/hxRtlWPQ=;
 b=tBUxYIBAa0gg6mhoBBDXd7hHoXWxfEi7SSUfj8X/YkiBcJKxuJwdW6iSBv023QxwCayIGFH8I
 dmYEDZooJ8cDoA9dMOQgOhPC9SQ2bLu2B8Nr3kg6izhXLzS9N4BAP88
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:from_mime,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC5D739557

Add the missing reset (BCR) for sdhc_2.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c9232988953..262fa8801256 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x540 0>;
 
+			resets = <&gcc GCC_SDCC2_BCR>;
+
 			bus-width = <4>;
 
 			qcom,dll-config = <0x0007442c>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>



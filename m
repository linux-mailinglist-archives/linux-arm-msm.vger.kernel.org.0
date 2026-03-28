Return-Path: <linux-arm-msm+bounces-100546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLnWG7X4x2lMfQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:50:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EDE34EFEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCF31301D949
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0904737472B;
	Sat, 28 Mar 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="UtIgK/bk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B01350A22
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713001; cv=none; b=PZGzZdfK3gYuVBFcPTWcxrW6a4WClfHtxK9U/TgEhi/KEIaZRUuacYhA+7L7EfmJ0BYpBvz6KNghvYZDwIowYiQfZPNdl9zmwN4L79ukYtThPtk1GKCiROtVanjdqvr0oxq5KFgy0SnMnqSLnZS/ZOuYdXIfoXaP9iOBKGjc1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713001; c=relaxed/simple;
	bh=7AMiTOQ8EUJRVDLSBUYIDQzrDIXBfDzrdG6iCJ52u54=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NuIYS35Xya/O4o76Q+3+lHe3NhngPm1Od3hV7NBRh727Sv8MhGSALP1ZLxxqWjZhXwwl1fceC6YIVTBx7uoJSAJndtGxN7iH1kagxGZikL4YcLn1X/C5inRYe5w/E0Gv+ER36c5SSwFMuWtcS4QbR8dTQp3apY2bY4hLieYcJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=UtIgK/bk; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 06C013F221
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774712990;
	bh=AmGH1X8Qa83XtQH7PIlSrQ780qd7bFqezVJtPAuTxjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc;
	b=UtIgK/bkidhOqbvSEUmF277A827eGeMy9yeEilTYrKaKuTdFEYWbO+q9GACsgG2cT
	 rUlPVp0y77/2V6CH7BhfMP4wsIry5MnPcDQeDlDRiE2PMyAdwSpWFfaWasPlyWhb2V
	 AS4NDiubtTiD9z4SqxtaWqyc+fLMITWnWf45mCHULATZNksvUwA1RCAAioWe0dipkF
	 /+hAh796lHANwIL6EsjJDn2qEA2l/+ZRy0K+2oRvtZPv6zepk3m0ivxl1wKUE9mvsM
	 D7Oaf4rYB8tvgTHQnxPcqJ6h7ZYv69aJNn4tDiUJR0uuVp3+cmko7SHe7tgCuHpYwJ
	 fiy4hV47SJ3oA24FVh4IQ0mch9WZsptfLZLK6pWgXAsM/JmP7F8m6LUBWtjx/1pVrJ
	 sycb6F293GMvcWCSIoEbOkMBb5yhaARKgkRZcXlp0wu18s5c/fF1QJAhSDjKLNqUTJ
	 FWX9NIDTp74+DXSdMNSd/1mVAUThzlK6wBkmbGJNKPFn/MqmScpuW+r6b/MOuoVtNA
	 3JHqyQ6JPB+m5e2quy6304wQA3G6j0kpmqWDlbZsPujSrt3WNfpYRkwTWZXL9VHelk
	 guTNEwt/IaI4rI4t3d9xjt0LUiboEbRKTp3ep9YLByUrfHGA1uHO1qJSXgwiqMHslm
	 mHq94XTVTkGAB5YUT+iIs8DQ=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48531e8ae62so22192975e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 08:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712989; x=1775317789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmGH1X8Qa83XtQH7PIlSrQ780qd7bFqezVJtPAuTxjQ=;
        b=fuOLeakzJUzXQvm8huAU/wrQBzbUaiU4i/OFBZr7qpa/odq9lUejLJpjFzG12eAqf7
         yIjxKYsXI6s5/8j7pKJIviiPVDo3PhgrZ1o5d5E8fvCoZIv/aICEqDnDBvSXv1e5u47b
         Xxcz4BwyP591e0ukDfd1KCd29b/eo+SIapWFCUsYhLFUdRxTX2oYy9tSUoMEHLDbI5iG
         bXfOHtJMSFr2wmjv9Kev1cxl+Gn0nV2zWChuOlNFyu4natnIaA1FjmaOYQOOZxvoaFL7
         GxaTAviRPgRFxSqk0jbS0kC4J0BmjccMQW2Rl3b8p3sbjgJUqezD8RzHtowSBtdFYivL
         OehQ==
X-Gm-Message-State: AOJu0YySct3B4JTTGy0xrdNqtn0rxSn3S8CM8imdZ2XSdCmgHIYUbFGI
	l7mT0jpXHvV/FqJc1zzoUIF0T1pEkTnE6SIryWie9sMahW+HLSMREyEd7jnJOBphzpnTNBrYBYO
	z/HV34h+9wAJ9eiwTr8t2MAVvxjmVcJhUmv+zgU1c9QJREprRDJsNt66iIk5LYLWizq08VMxd+J
	miGVOhnNbayxX3PTePrQ==
X-Gm-Gg: ATEYQzyDnQhRcTOZgBpvESilHWXguHdt2igYKbgCQ8ctWa3iWQjfmgOTGF4BkTXYy1W
	UTopLLuzvP8QOfzK6XhJtUQDhGsCfCK9rXAgP9PDqIs4tIvt0GO/9rJJ3s1SQjvmEZcx0V1K2mz
	M3piza5RNSMmijUyWYs/M0uUme2AQUb9q0YIozac98cJ67YZD9EK0K7UlMdJz4p7N+OY5jiSBDR
	vg3zYRDDndc+Kc5vv71MojcchRIa2xrYWL6vhqBA2+WrwpB/sT26l804Rj4WKbV9/VZl0ipMFCI
	up9uheI1Ls79RXpSVueQZEoXXQ33kZYot3KMnY3LVQH/5KaIqTEKYFzCgwY0ldSLkJslFmtlytQ
	slQXHYUNMXdV7HeT+BgCROhsIydug1UfGDDo=
X-Received: by 2002:a05:600c:8b51:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-48727f1f47cmr130344325e9.30.1774712989558;
        Sat, 28 Mar 2026 08:49:49 -0700 (PDT)
X-Received: by 2002:a05:600c:8b51:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-48727f1f47cmr130343545e9.30.1774712988366;
        Sat, 28 Mar 2026 08:49:48 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:35ad:2701:1e88:df3b:5eee:779e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727192012sm38011165e9.32.2026.03.28.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:49:47 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Subject: [PATCH 0/2] arm64: dts: qcom: cleanup remaining zap-shaders
Date: Sat, 28 Mar 2026 16:49:20 +0100
Message-Id: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAID4x2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3arEAl1zY+PktETT1JTEFAsloMqCotS0zAqwKdGxtbUAmP2z2FU
 AAAA=
X-Change-ID: 20260328-zap-733cfa5edad8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tobias Heider <tobias.heider@canonical.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=7AMiTOQ8EUJRVDLSBUYIDQzrDIXBfDzrdG6iCJ52u54=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBpx/iVIsuUUVIx+Ovf4h+KGZJdlf1pbNG9Rh/tZ
 /4x1U3j4WmJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCacf4lQAKCRATSY8DLM/p
 2jawEACckiJgteTaeAiNRpOq07VZsfaqwQWhehlrNh3kjPh+36+A4VjjLqb1ZMjuHKK5Ve6947i
 blsv6sWGOTlWFoBGpna0WwVwbyep2g4PBcXypY7XHG0cXy9C6LnkuC9hOOABMsTgfBzg6gjezyC
 Lwby9+PPpsBCzOHpKdfYXOIIa96QrasM6YT8GPh+1MmbG2xXSx1kWqIZ4xAb1q2zsVcDC9/MwKV
 N85G3022QEzaHr0W9y0H+PvvnnIkbLx88GpzBRL1L4vWNO5vaLCkzvxcnyTRGxWFSuewVQEwRIW
 lK2Q3ulKlC7O1cx4lovqndjNHla/hnWFQhRbkFyrLgzPrnYlw0K5n2Fc6rU6FHfLIT8JKtyNXp6
 fyDc0d4ngmih8m8rT8iFIsycQfrpKTp+vEDR0OT+e/kw6bMtzF4RCwoH2/ZniA4q0ZhvjtLa5m+
 MCJWPSy0sI1T1gqt7Oet5U31MNrMm2omCl9LXts3kO5/8+DWdiidYpJ9narMV83GBn1UORjck9/
 /mrr3f6L+bWAZCVWM0R+PxW+XMumE5kaw/jt9XnYZs9CjH6CNHAZB3t/M7/ZagkoohTWj2GyUzt
 RMF9JcWtGUj4u8EvdkacTRW/DgTp0VvF0Qe6x/nOM/azN8M/E8ylPYzhaPtnZcTb6xaBcFhYIIy
 aldPsBiYO/L9HGw==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100546-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,canonical.com:dkim,canonical.com:email,canonical.com:mid]
X-Rspamd-Queue-Id: D5EDE34EFEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In commit 2377626fd216 ("arm64: dts: qcom: add gpu_zap_shader label")
most of the Hamoa DTs were converted to use the gpu_zap_shader label
instead of patching &gpu directly.

This fixes the remaining ones that were added after the
original fix landed. While there we can also remove the redundant
memory-region property that is already defined in the original
node.

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
Tobias Heider (2):
      arm64: dts: qcom: fix remaining gpu_zap_shader labels
      arm64: dts: qcom: drop redundant zap-shader memory-region

 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi           | 7 +++----
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 1 -
 3 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
change-id: 20260328-zap-733cfa5edad8

Best regards,
-- 
Tobias Heider <tobias.heider@canonical.com>



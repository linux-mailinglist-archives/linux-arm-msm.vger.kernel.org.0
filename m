Return-Path: <linux-arm-msm+bounces-101676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPZlFinYz2n71AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 508CF395963
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 486A23073373
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 15:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7854C3C9EC0;
	Fri,  3 Apr 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y+4HhIng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CE3C944F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228439; cv=none; b=hslY9nQWoF/txX0Gm7omniyN224glj2mFMk3PXpF35/jC4SEERx9bsdaL/gajiOzv/kBN0LTPwqoYYJ8KeCfXW0NEwmwo25cudYggd5tkj7q5yTBpxApWEzlHekkQRV+5ZWvZIdghbg+DzPvFN9MzwhBAXo8XBGRtVhHSEdfryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228439; c=relaxed/simple;
	bh=xEcUg10QJs8S2JPaCimsNDtQkFrhjDiTVcW8ztlhHno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rI/kuq6oTh41+fVw5yrWgxv/yP9Tew6Yo1vd9U/KJ8kbccyvZAuvWGvW7t9TyU5Q2kz6Ax85AUZkp5cI2VO1SZS7icG+C3AoWkeqMf5sQLtuuaZVI4QUVO7Npxvi0XsSq28COu8HCth6T41uvs+DGXwuUedreXmkmHKqh8X1vNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y+4HhIng; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66e6d9610d8so192415a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228436; x=1775833236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsT3+v0EI1c/NqAMJW4AmWQ7Fl9ive+Tf4GhYkRHbCk=;
        b=Y+4HhIngxSql7BmZnRNevpr7KeD/2Vuu0I/A+U5uXfKD5illzIL1OwYfKIRkPZ2Xdt
         Ued+iCV/OCmU7BRV0dqiEuKH9O5J93hvdO4D+ei+hhQgOQ2KZMb3J+yhXIe5sC7lxewI
         OBVDcwqOvyBKnkvwtZFKuS/mPDnEvd3eLP7WtMfTWQAK5clmfIgwd5SMjd/JSUK33uM7
         SyARz0hGlRvl/i1zzARPYKiSGzuBOcbAOveiRfwWzHMSZTPpJGU5lQfsh2NNFG/LbjR2
         vZ+zZoOJWxsKMVsVPf+h2WUrUOwiSxGZ7f0UvZUdBiJmfB0FLNsrj9ZsLVPP+R9Y4gtQ
         boUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228436; x=1775833236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsT3+v0EI1c/NqAMJW4AmWQ7Fl9ive+Tf4GhYkRHbCk=;
        b=Q03M/WYNpnJlZ3hIJw9VdH/dHijpn0mMHcU/6Bd7tN0lomahdDOs6GxEweP3e+LdrM
         oFUSbayL/LXf1nFwt5RXQEjR1791bxCfg8pS/Hz4qKVZQOlw+QRMYBWZgJvqurBrxIVx
         BdGsXr5iRGKhhhe7EOs91FyTGPbwxVHx8kl5VDZk1yi+X8hBSPZn9MRNUL6XHFPnH6/X
         a3VzMajxx8m4+IwM7X69whCc7c70DLikSvsQs0RxrJw7ZGdzTczcdTAAu8ORQFeEfRpi
         hdpYdEFhpkLpMefkYwMXkFCcUek/YCr+3VWwp/Lo15uBGviocHigUCA1t6JOBzBmsf/s
         1V8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEtC/2k1KD6kzH1vo7vyKa30R6VkNfuoOe3//BDrtFJvdd+uJVxqOiaUWB2zsKrFCo+Iba1EKtTIOpnLmH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6lZeVM/NOPsIejM8Z655TvsYVidGTSULGUfaXLkEFKf+Xt9Bp
	pNP/p4QRzZoPfsHHK+Iq/97hKSrni7BVOTAJ1nA32gZvJQvXCta4Kna+KqRgSEBJVGo=
X-Gm-Gg: AeBDiev2qGjNnbPzDf7hpVsfuddesrSoHWjJXoQoRWCp84yvHl+ANO5EJZT/msgm7k/
	M3cG7M0uiueZUmQgWKmr4MpRVgYwWmPvFgwhIY7tGR6cyD9dbkKZNW5kJ8kkC7Uek7fgh5oUPbD
	4GAfrTUzAhebUKv1li+ISXoAoZFQBp87xLGdJ3ZPEULUxSAY3zLLQ1RxrUqKZg+eWeilwM8+xia
	VyEpuFhYO35DeqD7QhgQjkrNNuaNn+/bmux5bxA1hhqFGKuSWkWchUy6QSKdjdhiRMWdoAksQS8
	W19eGWQIEoikR4iUazuEMKm5LWelJUI1KT7nVC4hz1a4GABMGBTWv4/hhS7WZFUXF3wfvp6Vrx+
	lkyUCcgvPo3Jx3AZhx/N79zRGefwRcS23Im/0Y+6SW0hZg4t3AiMDxrkANOI6J4CY5ujVtO1DD5
	DrKRsGVFVfWf1CRiM1JzcoFSuIDdEAULCVfG1cYC2ODzXKKO4ng24SNXqvATbgqlax2snBl48ss
	hTWIFnO9rPZbOi8T11RNYBnBkKrPMo3yaCTrg==
X-Received: by 2002:a05:6402:210e:b0:66e:55cc:3156 with SMTP id 4fb4d7f45d1cf-66e55cc3284mr1003237a12.24.1775228436269;
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 17:00:23 +0200
Subject: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
In-Reply-To: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=733;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xEcUg10QJs8S2JPaCimsNDtQkFrhjDiTVcW8ztlhHno=;
 b=eHXcAGeGTKKVidTC9LLJh5TgHssAi6gn6dvlaRSpGWwMzxeU+QHCxxnzf1LRaOMTULHEuBYT5
 0YWKgOWHCKhDzzZJZDvMTcM/kcAtTYoCTZ7dRJgmc5bfK/8h7CpTKL4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101676-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 508CF395963
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Milos SoC IMEM.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..38488e28a6b4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-imem
           - qcom,ipq5424-imem
+          - qcom,milos-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.53.0



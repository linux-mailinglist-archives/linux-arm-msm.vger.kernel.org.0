Return-Path: <linux-arm-msm+bounces-96414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKt4MtFjr2mHWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:20:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41222242F9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9855302DF97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C6B1A9FB0;
	Tue, 10 Mar 2026 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHHU2RzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D056A1C84A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102022; cv=none; b=aEHWYna2huYolXkI1gm/EUnGk9zt6axSC2WnCmETsLEb8umEtQKtnaxxxWHhInoXspChxIoD4qBy7CXsQX8L++WYWmQgBynNJ3AFCcB9KEd/zZRxy/yMPWNx69Pw/UWd+Y9OHeqY8DsvZpUBN7E624gOP6GAZ3PXoLUj3YXqrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102022; c=relaxed/simple;
	bh=YKU/DnmNIxKk/G4FaBPJrYaaIFx5k+4NkZwdBNpIKdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qhhd/NopdbNPF0TRgvk8wosIc7sZhLPzmqdlkireLCqPPImJGTLTWj0BR+o8cyza0MOD1VvM3aYHhJ1Oqzmjfalc4EFk8w2k9v7gwAnfIh3Nceaw82DGycptx2L2s5jrlbJR4f6xh+aPXSjSejEP/mIAXSldrKuh429X5a2G2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHHU2RzS; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd7aab92dfso267223185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102020; x=1773706820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=SHHU2RzSC2Mu6YlbBUcacrRXuPhA3OuWqD91DYfVg6Vt/E7rmzH2ScCNRSkM5Gi9p7
         26Kq7akmT02jkDG4ZOj4ECsc3OExDNHLFVpVPUnsV33O852xJwXuPLAfWvNFbcXLqXJS
         +slJlNnRvRVO29l+Xc/k2fClgge/Z5d1ZiOa3s5euFwZCTi2OQl2nMz/wb+9gT5YbfA3
         S65C9MUNrLmN49sfhEGz37cQkQpFXeKD4ZPHFej1+45r6K+wBSPQmAfMiYm/yamOgXZi
         fPe5rlx1A6I+NWpvrFo5b/4rRKTAFfC1Rhcu7W8zh9pvM/1EgWIpCfHSx8CqQzDlzqrs
         NE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102020; x=1773706820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=k5oEvqNnATBS4dO8kyThpkOoQfvr1bmpXLP9gIB9IblCI+CkHGiSRsNMRaGGbpS7SB
         AcRpd2KKnopjTkwOa3al3oiKvwV/daPO6mTfB7QSnjwGAdmQN7UStygjnfAEGJUlAvsz
         kmgO2jimuPR56jzo//2KwLAVybst3l0j5fM+ajP3SUueBJEGV1JZVdzLTDH0QhXACwTT
         w3wSb4kxaJ5pbHO7EKX1iW6xaGBjHEPmNnCBwt6wc1qHQ2quHKREJ5wNJMcPwQSmsBK6
         JrBenu//Ik8rYI5lUs+ZkgVNHjo/wGZiUyXxiQlmaWnbvWVMlVTuO7yU0BeBc1E2hPh9
         EG4A==
X-Forwarded-Encrypted: i=1; AJvYcCXVUBBdWPzBLRDuSkKIhpkP2Ll26IJ2xjmc7oJTO1SnOall5HRN2ikoBMuT+r4zSmbwBFRVN4m5nHyb54iO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RE9ha+lDiWBT3R15DQFF0eCLKp9XZhIdlO6yqhVMwTP1F5Fg
	en75nwFYXXiONzLAnDxx3xpdAryWHXI9Wj1y7ifhSGxZilqlSq+yrfo/
X-Gm-Gg: ATEYQzwpOnpw8ilIJV5AhnqllOyOVNHSgfv6FdEwhdHVGj071M7yPGAdg8pld8j7k5u
	XWuQY3Eyj4Yn8cm5V7IlANuWUHD/QYamuaUhelvRpXN3oaczkTB5xOedq3u+WHFaWCa+V9jcUWy
	2qoqkPmOINogYLEaH/+EWwth7GhBhuA8YmebRJyD1mTvpC/+qwFVKovUKd4ft3xMVMxiEMW9Agk
	W5soMgdlog2OcEqAUFfFA4Q2gV23jZsTI3nWjiGLpSoj4QyL+h4bS08N9VU3D4lWc0+xzXqRC/k
	J4a8S6yT92jqGzPTOxy/ts+ox40SSIOQ87gJm5c8V0IS/6xxJN19hpRjRH9WFTKRr0UDe66lib9
	+Wocu/IeqgdNhRZ9HrSoAaduXJLHim1zVUs2y5DkjczZ4rNcgo0y6Z5GyUhjN9jUG0Npxb4zaEg
	ICnrEl4Cb7KRrSKgEy6oc5UJCRrq5NFgImpujcgeXOGcG1NGOJmed1v7wQ8EumVY+JxdM51rrOR
	OXLiPogmApQftQ=
X-Received: by 2002:a05:620a:19a6:b0:8cb:5566:c947 with SMTP id af79cd13be357-8cd93b75c2fmr191017685a.17.1773102019844;
        Mon, 09 Mar 2026 17:20:19 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd870433d0sm330913085a.22.2026.03.09.17.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:20:19 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: thermal: lmh: Add SDM670 compatible
Date: Mon,  9 Mar 2026 20:20:36 -0400
Message-ID: <20260310002037.1863-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310002037.1863-1-mailingradian@gmail.com>
References: <20260310002037.1863-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 41222242F9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96414-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Document the SDM670 LMh.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index 1175bb358382..ce72347e29d1 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -22,6 +22,9 @@ properties:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
           - qcom,sm8150-lmh
+      - items:
+          - const: qcom,sdm670-lmh
+          - const: qcom,sdm845-lmh
       - items:
           - const: qcom,qcm2290-lmh
           - const: qcom,sm8150-lmh
-- 
2.53.0



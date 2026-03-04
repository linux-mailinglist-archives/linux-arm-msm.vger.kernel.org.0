Return-Path: <linux-arm-msm+bounces-95236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHE6Ln+Pp2lKiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 02:48:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8C1F9AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 02:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C3D630FE8C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 01:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC781CFBA;
	Wed,  4 Mar 2026 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdFFDf+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454D3195FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772588727; cv=none; b=Ueb4xWsuz74xJ9XKC0A+TOxtNa/sidiFNz5zm96OLi7d2c1DbSv+rrR89TgYHrcDf4aotTdQzubcaupZN+ImqmsECNm/tX+XXZwaRl3oC1ehP037FfmHcQ2pUaqteol+2tCfDsJEcf7zrH7vtWWsP07B10V7A2Loeb7yGUvUN7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772588727; c=relaxed/simple;
	bh=YKU/DnmNIxKk/G4FaBPJrYaaIFx5k+4NkZwdBNpIKdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6JtTUsMHOQdOaEScUXKnEyan9k0ZLY0AQPnsRvws22fwjT4V/BVyU7K1kIuZe3kTPg96LTiAaY/LFzXVx9sW8mbaaGzi96ny7OzSd1rcKekhexv+Wp0DDT4NezkJzxUO2VN/CqfUaKjJ9U1kANsCqc9OBzxIMN7kIJR6VCnXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdFFDf+z; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506c00df428so57983331cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 17:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772588724; x=1773193524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=HdFFDf+zw3ZhK1HxZLzNEmQoO1FWmJZjY8CtCkviGNF5PyEIPQYhmElmeVfU+uKbNO
         RK0L8u/T1TauB3SnP+yfAKQmFqG/SKRtg1ZPwyLE1JSqbRUnbk8eFHwMmD14qjhUQSCN
         ocSCI1DbTeKrwiHFPKSe14FIbjZ/eqOqp/EpGhkgsuYSv2+eQApWbS6DzKA01miJ5BJt
         48atPiU/fhivNhRRafxjXNHbAqfQHRowTiAyuDXcQknrHy2f89Vn1bH/fWkm94xD5R1L
         ydFuiLO9F1T90Xcs52xAM7d5DVluO4qOAvgJLSVNxTGKxLX+abYLOJuTC36INC0JXpnM
         1+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772588724; x=1773193524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=KApJeSsU3JHpjmfog5RvZdO6Fr5XUEPcolXvQbZkK0TYnmNoTbRDJlhc4uljP64kLw
         pxAPAnJyW3d84rARvroh0tHvXlUywaoY5VXWYhx1byAL4/DHExBXksLyhMO6MsOr1ilK
         47HIJGtKBe/t7dpfZR19t4sasGu/Gv1w8I4MTkOsXLD8A+Rn+ZyZruoiMwX7jE6JUyIP
         KPfg1hkHP0ZaFb8y+ctbZ12q2h0tCJ2rS5Qp71gRZSMkKOS7pv85mguO3x1is4IYH4pA
         TjNJaUwvRSmdw/NDG3nd431WlVjHK5ljQpa6DVHtF/4OxdKg7986DSLgLkZPMFCqdRXI
         sIHw==
X-Forwarded-Encrypted: i=1; AJvYcCWLgDNNSPS4pSy6fPUSKO/l4prDKOkuvPYf5g4R3XORl/Ma6dvFJlu6wWS+3XKZj+iZfG3LyPZm3bK/G83z@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCoaMpyI4sFbAzejgp1MQclsXh0WUn2NM59FrPL/koPSHuiw/
	GV+f+gxvPqJqMvxBTOY/CK4VDUOH3FflPXddvONky9BQSs469q37BtQm
X-Gm-Gg: ATEYQzzqIdQ2vF0wcwU6BTHmuyxROfq5/GJLPGZ0ZghaW1vbX/NXqEZ47rn87qxXiyb
	H/823x9v1kD9wX/sE2xsOmXUTWBBHH6FTkw7Ry9XKaqzTx+vn5q6UttJFcfrjhsci4N0bT8VpTm
	lAL5Q/op8Ajq979eoXZInr9YMS6rBCgOKth9XEt2+KZ5+XmWC7NerwpDiQP7cFlutrG1KNnaQqd
	ck2uwL0CUwHB+tmUVsUbVagzbhCee2Wk/qELP5ifPX4SKFewvwb7wTwSu524dL0TflZFQn//BE3
	1JgwZqsloqloQzNBHgn4r8enEdIHnUR3WsSRyBSZgwysOlZVFgRZ5WNuCvsmXSJLRflQPHDyb3o
	VQTRiJV+zAgC6RmyONr4A6HMvcL/BKn/OFYKyjCQLElqipUXr3OpSdQhKxT5yG0sq60qlKUScGa
	mZO1WI3RhnPXr5y+zSJayu66jrMNha+1qTg4Hy
X-Received: by 2002:a05:622a:14cf:b0:502:9e4c:2670 with SMTP id d75a77b69052e-508db2ed117mr5799891cf.27.1772588724614;
        Tue, 03 Mar 2026 17:45:24 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374e07sm145443306d6.33.2026.03.03.17.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 17:45:24 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: thermal: lmh: Add SDM670 compatible
Date: Tue,  3 Mar 2026 20:45:29 -0500
Message-ID: <20260304014530.27775-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304014530.27775-1-mailingradian@gmail.com>
References: <20260304014530.27775-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5DA8C1F9AAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95236-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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



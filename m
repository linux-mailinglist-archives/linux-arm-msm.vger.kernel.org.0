Return-Path: <linux-arm-msm+bounces-110493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MqULU0HHWpUVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:15:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8F619648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58BA930158BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 04:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8691231E830;
	Mon,  1 Jun 2026 04:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="NZJJzOKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364F31715B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 04:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287294; cv=none; b=X5xh3lz+E4EdEKM4FiqeG7St/K4/7F2vVu6bl6eeBRFOJszcSADE9M78Ibuegk4rQCFvLFGlRH6o7fsUvAXjtulPdihJokF5nOLmv/9LAr1HKaSFmDuHH+cgYhw7KgNerr5yZ1wwNBqgYrwbO5wTApt2tO9OOANrJMCszeGxN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287294; c=relaxed/simple;
	bh=T/BAgSheZ6++v61mRY8etZ4qi9u0C/vqxFaS8N3TgYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQZTPSEjL31A+O5g/owe5hL8DvnbFc+EdZNBzjNegREXLXkMCCysmvmzwr9a1wuJi32NrS1V4JVCgZJagJKseRTdn1ToXDRoqpZZkFcAO7YesgO2Ql5S+aQ6k1jfSqPvUOnBzp7kzynn0GE/kL2paTeN+dgsnnXHxFS14SHYZmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=NZJJzOKE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso5520095ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 21:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780287291; x=1780892091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ixy0XYV4dscvWnpDYcR6EMlE3fKq9U56m7Y4N2kjc8=;
        b=NZJJzOKEk1vucrcGq+I3TiTLr4ddAPoZgLfXaI7ceYMZ9jzTXv3jYp2RdUFHWiuz5i
         dNiRHSkfDP6hSKiI2pP6gD+kiDq3dGxWbt8SkwsIt9DK4GRsgWtHw4GTLE0QNtKQZEHL
         gdetCfvhhTA52gnAnSEHkDektbUyOEho5Bviw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780287291; x=1780892091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ixy0XYV4dscvWnpDYcR6EMlE3fKq9U56m7Y4N2kjc8=;
        b=MKr8B7s6+BbrHZO+QKSBOKDf5LqTrvsmuWCCFho3NiPtdnHKBpyJEtZf9njwKZG9PL
         EekAl49JSvnTFii4m0O522gfpj+N7bCymKa7tqQHZTNoT9jy/K1O2ZKQKNko2TW3ib4W
         JK7yMl6MQZPPgvnIlxWEg4SOJ6KJxGDjsn2/KFrw2TgM3P5EpwbtjRaHakgMlZZd6X7y
         IxfMxj4FrETZ8+hr4X4+wDdPoMEVibim2RptstEhpBKtWSX+HsiIg1ilTV9Gv0e4BFUc
         WSiht/Wtqxzilw5j+ynJt7HxM4dZr1ichK5zkzbLnXJvhdHK09CV9RPhheqK4JACDAV1
         M5IQ==
X-Forwarded-Encrypted: i=1; AFNElJ8b673mHdIw+22IKojSa11kQjuzMFIj1KS4VkbTs2yEYPIw7FKdL4H3TgG7ca4Mr4bjxwXbsAIbG3Krwv7J@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBJCIKiOgjRNP6zICYB9Mgn38IEZ0LEd+QGZo5Ih2RpqAcaCA
	qFXDqT/U5Af72cOLL6eDzpcuB35aroCs8fdUfZDQdxIopw1jP5lGbtLUEVAR5/hnFCLlPqe3Lwe
	glOAXN8ViwQ==
X-Gm-Gg: Acq92OERXuSTzFfF1NjmtZ4l+eiv6Gxa2PVszEYrixchksw0tz5duQUZ+eeptR9nIhl
	oaDo493L52QoQIQVqr8Ms4aHoaTkp7/CXhbFs2Rw7+i+MT7w7NCmGMld/c7na2iTRhAPmR+I16q
	Gu4ahsFqaARKVZFmW8UNjEnw99z/Iie1ceKhpSCSwuL3WcRr7ePQuTmbtUg9L+15OQa7kYv7o62
	d6YPgGv5jQS3PHtT/JGgfSiy5SOl69BH3bt5zl+77V5QcSvq7Hfso3u6jp4CYgC3qpRjUH5i1eY
	hpTsisAfS4TOQ/+lCckfhGqfNyDwiCmpyMzhDrVOJNTWJps+NNVvJxhCaXkaWajDGnePZNptYL+
	OCLk0orxfXxLzZyc7/6pDpUMc1fjqkYo5AcFQ89Llk56boi+HMtVkOiNKXOSx/iK6WHYi/Ll8L7
	+/zkmULVyd4YlMSfjlYtjCOV3VpwyE7H7szfUihOLI5tOmD2UTTXKm+6iBUZqx7Hb19iSEcFTyU
	jxjDBvybK3x4u6wlH+LsBje6ZD7Zo4vLmyOl4anMslc1Wu17tdBF9RvTsvEva79V+CNO6SkRAv1
	RRT2EIb8SA3lAw6RZkC9Sy7lnFdRtovKBKyQDLh/Q8+cg1xv2YCAJXWsDWsj6Kxs/m/0kpUnXF8
	axVc=
X-Received: by 2002:a17:903:289:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bf367c93admr101535725ad.15.1780287291239;
        Sun, 31 May 2026 21:14:51 -0700 (PDT)
Received: from aegis ([175.176.67.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm92980405ad.76.2026.05.31.21.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:14:50 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
Date: Mon,  1 Jun 2026 12:13:33 +0800
Message-ID: <20260601041336.9497-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-110493-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[quora.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1DB8F619648
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In addition to the firmware-loaded codec carveout, some Iris platforms
need to declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from IOVA ranges that earlier
firmware stages have already mapped through the SMMU.

Permit a second memory-region phandle for this purpose, and describe
the meaning of each entry so the ordering is unambiguous.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b5..6359e4953d42 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -80,7 +80,11 @@ properties:
   dma-coherent: true

   memory-region:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region

   operating-points-v2: true

--
2.53.0



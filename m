Return-Path: <linux-arm-msm+bounces-108254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH0iGhFNC2o7FQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:32:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1900571A44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3B073010523
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40611382365;
	Mon, 18 May 2026 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noNR+DU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68431B80D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125461; cv=none; b=a1N2HAg2t1TYF2/OzElzTqSXhBPIQDLSIzLNYGS7WWKUBlOywk1bOHmY4+bppoyigp/pD/CcY7pP6ty9Ld/elDid2/KB/P1qNQs7LLq2sP6offm3PtVvz/Sw21XIYURY9XXcdZ/IY+Kp6yQSrQHtWIHUFowq30VCyublK+8urOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125461; c=relaxed/simple;
	bh=sWXGDROdLAAxc1znU3J1G6LN8LWLspEasEGN1GIDqlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2GbarF383VgFcd8h4MUgZUDnGWDysy1C6gHxgm6ISr5sHPKKYLFSpRi9y47ZF+6NYr0ZminxsfbD1I3LZk9lQLe1Ff9KjH/rTp0UKKsY0+N8gKgmqxN0iWDb35dlhv/uWQA6yVZEKJwvAiA1VIY0CtiHVz/ScoiAco3+XWDbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noNR+DU3; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso1010475a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125459; x=1779730259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=noNR+DU30SWirYe9geS3sNIm1E/JG3FOt+0c0zJYf+SJqufbHO2QEeeaiXqiUZ2jIC
         Z3Z5VFG3oiKZtRS0b8GMyA0Ah3raYbxhdaApFHKTRI+ZCOwYIY5D8cuVX2JXa5ShUV3F
         jwN01WzJqY4x842Emp8ZJIepwIW1NALFaJJ1qYMD3dWCMJUvYWwCJbjqn24hbg5yAAwE
         LStz6+BbN2IdRB65KunwidcGuHhrVrmEeiTs3H461mL89uQFCiuW+kA6xb5U8J/coZjt
         thbtQxsW8HyHKYRhECXULxYJxvBe2LumCgI+becdKZlmX2HYdqng56J7n7TSe17O9ich
         yaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125459; x=1779730259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=igSZLx6qK4xInX0IA8r+1nLYdVN686hzgUqjPDQ4eKTWrd9apb9YiPEYZzn/qPZBAQ
         lL28KFMRrCf9cIo/xBZKrqm9vbdYS1/YPz32+EbA7xFErCx1oWRf85MPujil0Clu0pYP
         CBl54wxJjNfVQ7MRpLfWM1eaS/bxtDzt1YRTaH0Wca/DnRuGUOOtR6vZ5xSlkYCTm/1r
         UVY/BtFJK2TeA4pKcBPz42uY6sbJokUg5rk+lEMdqo/HcZDvs0MAGXqUQWdGP2mRC+VV
         gF1DQrfrJOwTtbeq4pGoLfUjhMgES+ZPydmRVnVckbqgOhb53XUQNSk58kbjYBzMELA7
         HY7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gyefHqigDszsDTWIgALokONVYWHXHgKY75U9odQHar0AUogzwTR37hFlJEPKDgtXIFaUPXR6KMgReYE+H@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJ8XGtf8Z9asEkXdOV9yQdXSCPFmqNatM1ZlRYFIVGaZSu09h
	5+6tyMXZwBlbG4j8IPScOh7TjWOhuEOyRT+/e2HlJ5aZKXvU0GbINVct
X-Gm-Gg: Acq92OEPwZtqkw3yaYbBsfiDw/nUUy445hT7E32P+sTMfTNEck4ZNmxjoNv1nQgKkj9
	yoPJtyteLZvMd6YRDzbRMLPoGT82uTZK71CGPxpIEUwcTuFilanb7HLe7bNAtaKv0W5A2c6dtna
	5EgyHrohEzqTK60Q5Z9+DR7FI6cbq+LaPuYbgZyC+tMp8hbVSZM7QXGBbMvsxnWawIFtQrQsGSE
	THLwf+nHWu8bKgbBg2Dkw2DvDVsIctRPdmUw5Lx/V65gldIiely/WbXiEESepSQNGu9IBAEqt+X
	h9z2Tg98QX/etT2yqTZME+KkFWSe57jx1zf9yzSdWsZ6hZFiP+z66Jy6aIeVRBwO4mZzrYAD/RQ
	osty0ZFCOL1Ct+6cSo3Us3BKH6hp2T2uqD0F6PPLiNg3zJaY438Y8ackT4vKTJIyZkF2JNC5Pm3
	xYbms5FFlXDw291dO8ZOg9Lx+x9egynHLHWc+bBD1toQHj5QGix0j9CyywNFlO153QxSuy335aj
	Tqt3bZYgg==
X-Received: by 2002:a05:6a20:2594:b0:3a8:9dd:75c6 with SMTP id adf61e73a8af0-3b22ecfb1e8mr18040124637.51.1779125459382;
        Mon, 18 May 2026 10:30:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b5:f305:5cbe:64f9:8c32:7cd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14118696a12.25.2026.05.18.10.30.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 10:30:58 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 23:00:38 +0530
Message-ID: <20260518173039.20592-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108254-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C1900571A44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

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



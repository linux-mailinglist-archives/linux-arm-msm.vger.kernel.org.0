Return-Path: <linux-arm-msm+bounces-108169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CETFJbj1CmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:19:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25156B699
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7226730D3786
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1088F3F23C5;
	Mon, 18 May 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS2YrdSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10AA3F210A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102313; cv=none; b=UJXrAdl3sxRvsBkWv/hOWJ5DesjMZkZ3LZTIIGu/Kl9/Gu+9Uzg9en1fb8CAJ3SKuGI1Y8v7nvewCbw4ROHEBOd5t91lgf++pe4lWg7bOJHa4cnN9QL7ElqLsXnBFCzDIAT8Mm8CMOlxuoIYFMmQoHaMFBND2FFil2DRFzb8iHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102313; c=relaxed/simple;
	bh=sWXGDROdLAAxc1znU3J1G6LN8LWLspEasEGN1GIDqlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgRAUMB+5qgetX/KWYCx/U1m2GOT/bNyCR8UhHXcOI37Jol11re1jb/DLh0pUczd1WAOIAnZX1ieMPOgd05V6pMOrvqDE1H9hJ/sJJY/ERDtWHG1sHSxyIicDKKAt8cvlPwvij9f/eGwdFZLDSnwsJ7OCYZKQXYM22jJAqSGcjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS2YrdSx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-367c26471f5so1214309a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102309; x=1779707109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=CS2YrdSxRIgVSiU039ZZLmwwQ9XD35ZcN6avNnQPOPtLxDjo4+6k3fF3nXg8P2qWYO
         nrgGPVj/YjMSSwyRtEku1g1etV9cY5uFEjj9jPwAOngKc7mUTcqpcCHW5IhzHJkudvCn
         P454rpJB11lX9n1Mrq4fQuDiJC+9OJXEivoI8Wu47FW4g4DVos/ATJj+e/nbwM1AJFvg
         ztVnl0SLUPLQz4rSaMgQZ5b5B6S5k2RACKbMJ+OudzrfddpaWKcqCos9GiBIzA21So2M
         DINg3IrvS/Cgifb527fzn1OUkVPvBGmWAmDJkGRAGzBvFQCsBhi7kN+d5qDMuQqZE4+e
         dCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102309; x=1779707109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=SjnPqdON32JezRKyT7Dnjwl9KvdjTr1y7r8O/Mzg5WDbORGQ7dZrdjJIdupKi28fvV
         tT1pTPXj6flvr+v8rl0K0zvtH03Oz7WZdze1Zt62AyELfFov87+QWAkl5gGjrfMkz6oW
         +2hlKjYeRYo7zpVlKJeuAVvcGan/iUlZD+VrNaBt87HZlUeA1eONRHTPXzSWRDQeXkRQ
         hcGtWPt+jFOcOBVGEUBBnWbZPaU4AbpifhzEsju/kq94w8puuyCfAMr1nM/UHTA86VTA
         Ie7tBAOtoc4VX7Jsjf/ZZBMdXkft0HY7AsAlfBYJNKUI+y57UXDfjOWk6pXQCPdTvc9z
         UVJA==
X-Forwarded-Encrypted: i=1; AFNElJ9tW+9xNrcsdbzWG0ZKanj71sttN5irKAnRK6zZlSOxdgjBi4AJ5Aj9GxrVXoZyhThXJC0KJgJo/9zH0GHf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/NYE/29BydzwidJzS1nCuQdOZWh/7bZ/G3TGnuw/QHwIocZZ
	yIa/JvwN4QdPbC5yasAEDQm08dQggYtWhZntSUMMR25+C2mQljkHMS8c
X-Gm-Gg: Acq92OHmInCN6Tzan7qznDSFCRRw+UTjlW3J9UocHTzQnPffEGxOmhaefuRAGReg2wW
	hawWHx0/D8bywNafyUJ6cysKpR5DFaRMAtnmhxyQrb1XmtgD94mxIz4vIKoHmTBtpuYxYZYMfV2
	2vIGbsvdJMriD2xKB0gQBmkFg2DNqiYn3S/R7/aZuRyWVJDWBOwCWaIUeVGNv7GgAnGmeEtI64e
	24u48PXSu4T9UdiHflwTGPNfKadDZasjmucSEZQjogn20m4YSazN8A3xbFHvgEOf7co6sjzetr3
	d8SBryZ3S3rz2GquNANCPm1FdA/iGuAFMoLKcdwnkz1ZK3jWBwfKzaSXQGNE2GIstMkGV7ft3aK
	LSBKnV80Mwy5mB+5fBWr8A7IX2ZKjnbGlIJR9+z3FUMy2xHcVKOqLLukpTYUECEAUpJwZ7Nwq6p
	YOx7dvRVkYtQqQ1iGqTHIIcsePyJL0e4vK7nHuMqSYYlQ3PWarMUeE8g516w==
X-Received: by 2002:a17:90b:48c4:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-369519cc92amr14285532a91.12.1779102309169;
        Mon, 18 May 2026 04:05:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10866313a91.7.2026.05.18.04.05.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 04:05:08 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 16:34:34 +0530
Message-ID: <20260518110435.16262-3-blfizzyy@gmail.com>
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
X-Rspamd-Queue-Id: EF25156B699
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108169-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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



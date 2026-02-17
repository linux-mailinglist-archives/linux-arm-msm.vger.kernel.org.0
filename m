Return-Path: <linux-arm-msm+bounces-93111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPaKNxdFlGmcBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:38:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1D14AEC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DC85302DFAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89105326957;
	Tue, 17 Feb 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSD/oyfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6332695D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324684; cv=none; b=aoSRCEyCGCXhkSLHrCOgA7JrnCkPwe92uvgxs94hLav/m7Y33CXOyQRbKF7cp+VLh/+buwt9diIPeuAo7x3WVJ8SnN9fpQuskXw4IDcXbEcVX+396lfRsOFS3yXWO/X3n2xW4CjlqAEw2Y978VOC7mCVH8ECYfBacWLNpVM7PVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324684; c=relaxed/simple;
	bh=hUYScQaRX0QfzkUatVOP/WusQlNS1mD4mV/UULK5pUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NCEvSBbdrg1ka7pNjfzxMpji68BD6KgXeTJwKbq6fJ5wnLdFYs5AmWIwNb4eNwtMu/wgoLFefHhr40k5ZU/ew2SB4kuXaCRobg0FbIRaRi/yzpZSo0LijdNcgczRwO6Ksk5YV2ap0atK8WEnXW3jRSolacqAHHW3GinAWTX/Vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSD/oyfp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8230f2140beso2470022b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324683; x=1771929483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=cSD/oyfp4NaKxlCNSOViwbxR7X/sXCZYXzhH2x9VZv9qGSisskhzZjdy9PjNGJ0qTT
         bCqKKykjrhqzfjSMnIMoOQq0jQrvDqmAUDu30hB1HavNcZuzjwGXFUf5I0qihqCUtbsq
         9+4T+bNNrJvypa5HwxTnQH0CU+R3i6Zy/2JNg0IPG1l0Gjm5P+Pr5xTrSlJOPUK7BJzc
         QYpEyRZZB3rtuwB4EKAJmxrcjg7EG8R1fACF9elvmiMEBifajo01Lcz1v/lQWYjPeD9I
         W9LP9Xrw62rtrNKmkOHvQ0x/jluvAwHeO3vgMd3n16CxLid7ZLvV4e8dD+41eN9zJSMU
         DPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324683; x=1771929483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=CH/ekQs1AeDAgLiy5O89X+TuNpDK7IdPjNezu7joSc6BsSSDuWpb6aZ+PyVqTMnpdY
         U6sWg35JHjHoVQH1vUh9Kc3mpJASmTwy6IEIi+qbrYCywfOWeA8oURSp7UX4zGqb3tVy
         uCM0r8tPnwXDX1nT/10AzyJdoecNYPn30JWqXjAnSD9NVw8Lgf3tK2GE5QrMDaVdSifs
         MhU1uwz/bKce1i74Dmy6rqZVJPsbAlHsHHbbXvCCjRJLQ9tJPdS6a2QELaJkjwiAOyzc
         RjEBZ8A9zalu1A0OYX58JPuaDjAvozdfbT6OtLo2Z+PdhaK1VN9JE8aSGzaL/8gSgopG
         UmCA==
X-Forwarded-Encrypted: i=1; AJvYcCUynxhoQpbN18TuLQvq3cNRbbnbSyEsIIUUKbhs1mKm4NLnUoI6esIrfVbRoGfLQpTs2e84mC00H5Y8iZHo@vger.kernel.org
X-Gm-Message-State: AOJu0YygLilYnlduU2CzOMcDCOxO/73M+HXJJgd7JztXvAwdJDtunVCg
	acGA9um2iScshnLd53vM3cwbYCZRjsQkhV/rpZKjfykQoMFF5YM34Y7l
X-Gm-Gg: AZuq6aKdG03RtMw05H9iVkNeGD5R9NROAtLYaX1NJSBG3uXH0GB5ng9XDK1lzdzOTvm
	2WfkMjhxrp7wANyhzZhSzBv+MVoq5c3TG2ndpI5YeznjjoVwE2MyKpbMKnTn49jSuNRQj/GQGA0
	iEbbApihYHVjwor1qU9c8WZDrpU0Az8kOeKY/KOyI7n9XF0id5sx84XEqU7LFpKFcxwKGPuBgCF
	C5We0KXzwzW6ge48DAOnMH/Eb4w9YNkpCouz+DN5bWrcmgAezKhBa5Q+ch9Wr4lwNUkMuDCU3eD
	S9qMNnzI4CcaqbpjiWb+hrULrk6hw4AOesWWN/TZf8842MEZQp8DVLpJJJzI/+N0Kd7tEgXODUO
	z+/ePZavSzpH91jqAL+6JxCuH3h2WX1sQeKYQKSwOtEekuDqiAFENB0w3992cnFj/1OW7XQ1yLc
	bgkXJkNpO+cs5g/3Pb95A7jhQnT5kswh6pr9ouyoRTiR+7Ewvg
X-Received: by 2002:a05:6a21:6f06:b0:38e:99a0:1057 with SMTP id adf61e73a8af0-3947f03a6fcmr11654195637.34.1771324682901;
        Tue, 17 Feb 2026 02:38:02 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa21dsm94337205ad.12.2026.02.17.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:38:02 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v14 1/3] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Tue, 17 Feb 2026 16:07:47 +0530
Message-Id: <20260217103749.1249718-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217103749.1249718-1-tessolveupstream@gmail.com>
References: <20260217103749.1249718-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93111-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61E1D14AEC0
X-Rspamd-Action: no action

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4eb0a7a9ee4a..c081746636d1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -876,6 +876,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1



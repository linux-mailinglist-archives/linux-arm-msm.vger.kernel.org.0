Return-Path: <linux-arm-msm+bounces-95701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH4lG2EjqmkPMAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 01:44:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F20219EBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 01:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 495B330358BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 00:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D919B2E2EEE;
	Fri,  6 Mar 2026 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQGAv6Hb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E972E06EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757842; cv=none; b=Lbo0HnH4yuvyVZu6j1huriTkUlUa5MEjMec3MBujIexuLpBz0pHPC3XqGDsTdfUcTrwSXlkn8fukcMtH4yejKeUYKKlDraKSl3K4QMDCo/AwadQLUmbnBUELzY/2uo/05RhI+QyiUH18qX+ofGDITyXSeqyxOo3viLBoKAPMjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757842; c=relaxed/simple;
	bh=7+7vEfBpNq1FeJYJEFDLB71C+eZ7mjue1YQ1Lz4VM4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+AopF/zFmcakvEbTHVnHn5OA6kGBOHcsvTiJm+4DGpHMwkwl6ZqY3WaYVvIFmWAv+qlIw5oLAftpX3qEm2fI+BZ5dB0ao1PK3hprXoMY1L+T9QQlA3MTJYrabWbnCn+J5+Ng4dnLP3VkT2I4dSOdTmVBbQU5dpoqdsM0xZ+aec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQGAv6Hb; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40f387a688dso2998002fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 16:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757837; x=1773362637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWzAa+zn92+13s1CRMtvzeiMVSLB+iLeHsYqLdK601c=;
        b=JQGAv6HbUQNC1gjJ68whaYfxEDPpib0XsPN+2anKdPc28e2ptzxcM3hqxmzT46NpY2
         PPtuI3H2L6L59816oobgEWbYekvQP2LfTM4/sRW1h43bIrp07lcDsuNfHX44FU+ehV+i
         +LCuYAodD48FRk+5efGiYRV25gV5RJev5yGxBjEQzbFTQcVjGgDWBCKI9X72iLKSEKlN
         n1/YRSCeps3tX/DcIBPfWGtCi38EX2GETIYpKuMTYWiEy8bDaISVoDKKMjvXOERox/U+
         sU+gUy3x/O/tdjFtGYk7BcXTjEmjCxTpHSPjZRSpipJP5lzvymZQbYSrQHs54BgHDuuP
         S1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757837; x=1773362637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWzAa+zn92+13s1CRMtvzeiMVSLB+iLeHsYqLdK601c=;
        b=QLmziIlv6hhVUXA2z3FhFSc3r3ewMmmv1ElQ6zrRoXyrvunq/PhkI/yxpwGuZKBZXf
         0ZmX5aAKV72/GxLtq8OnjGRnlXj+VqN5GIPuL75i0EgLSX+AFpXEtWhqVVNlKNbri9bm
         Siq3N8ZT57O6IwgNmXjaBXI9Uel4pkbPM8RHch/y26WvfaHmwAqML3Lqev+yuYQT61sZ
         V8yKmRlgFWP2Xfgi5zXlSLiJAokICAWa1N3jYB8bzZpdPifmvQkJwHBMQ7G9fsxNjT6B
         87yu3VQV+xhI0N3PXHNNqbkqmeWK1AESS8akeLuTVLlpqzYZIw3yO7p5fntH3mt20HAS
         Ei1A==
X-Forwarded-Encrypted: i=1; AJvYcCWoYVUFOeqLXZjqJ0ko+tsTobIhwEMIwIO8wbZg4+DSKC68jaBDMxr5zs4PM4C/yV8zAFQ0KIdQYaJNTDGu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8rBmNWlzfIIUU+GEo9CA/WFwlr7e/S5MlplsQlaXtxHNB/FaL
	E4cse1RjH0K3LQ+DkJxlBY76czQbAWld0+hrnlWiw0/dIILhzGhZ0jpw
X-Gm-Gg: ATEYQzxTv/lOFi9Ywl2GjC6SSJHXh2ysY8bKL2vS42dAjz38jMiu8w8lThWrD+VZZkT
	pMKgLp6F5D2bNXh63ad7hE2yCg3yN8LBAX9R6XYKeyHU0lGHKVZI8hi0Ss7AXe7hnZdmgJSFuDU
	oYyIL62MWkGCLD+FJ9fHiCm4Tjs6QeI6F8UEqJVe2tlKv1Wmk+xprsyYw4WwEjfZAOIHtYOhhYy
	j/okAU8UPAgmpSGRP9Nkmgq6BpLpfYDNMS/h+fhxgcWuJZYEDcv4Bc/CrEOicEsEZobqKupnb0+
	Bw0y0LnMEnXWImgiq0RBSQn7KIK1PAg/5FEfl6ZJA2EEUeS+S/C3Y6w83arRDAUs/CRhSLKYgCc
	6H61huMji3/tg2/fK49Z2x0X/7BFKFi4m39a/kY8nD0NcIQm2O+lNQTD8o0hS0RnhheHuz3LtWZ
	q4V+NWRUS6ZYj2Q5f7vWj4cjJdSvr6sc8gMPCOSBEG1A0Q2YNCJguXF0joWO+XHeZ4MvmqcSXt5
	3HohDA8XpLk/amGq9FL0jRja9OD8O+zNnxnQMcX7zgqfUV1Z6sI
X-Received: by 2002:a05:6870:8252:b0:3e7:e420:6229 with SMTP id 586e51a60fabf-416e3e6fa13mr252903fac.6.1772757836776;
        Thu, 05 Mar 2026 16:43:56 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm69335fac.5.2026.03.05.16.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:43:56 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: Add wcn3610 compatible
Date: Thu,  5 Mar 2026 18:43:42 -0600
Message-ID: <20260306004344.10968-2-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306004344.10968-1-kerigancreighton@gmail.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 24F20219EBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95701-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The Qualcomm WCN3610 is a 2.4GHz-only WLAN/BT combo chip.
It's similar to the WCN3620, though more basic. Add a
wcn3610 compatible for use in device trees.

It needs its own compatible because of chip-specific
configuration done in wcn36xx.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.

Changes in v3:
 - Describe the hardware rather than the driver in the
   dt-bindings patch [Krzysztof].
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 117fb4d0c4..018cdf5177 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -109,6 +109,7 @@ properties:
     properties:
       compatible:
         enum:
+          - qcom,wcn3610
           - qcom,wcn3620
           - qcom,wcn3660
           - qcom,wcn3660b
-- 
2.53.0



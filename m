Return-Path: <linux-arm-msm+bounces-95436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDSCLgKHqGn2vQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:24:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829C20708A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 851433050205
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1F33DA5D5;
	Wed,  4 Mar 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEp3LPr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742773DBD6A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652265; cv=none; b=WJ3pXhlwd8EoHlcJ1H/RCdpQxlVobhTcHVQrGJ4VXyJI9BQYTgW6bJR1woSc48Pj8gPJ4aH2gfOlXTAYhPQLiLYw+ZU/1TLeX5MbTgmlGo+iEX4JamJkl972Iq3xTfOHacVdE0gYOLSSVfJjGGED6NKA+ZfR/BEXsBOcrsrdQTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652265; c=relaxed/simple;
	bh=eTpf8Vsj1twgoqcMO4yuaGpGo1vNlv+UQm9PaoC/e+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcu0s80Ze6j/Hfj0bttit+wmchS8FCX9X61Vw4cJoQjBWwf/hU0wdTnHK94Ql4y0Zcinga7BjxK9rOy6V8OucnfZps/bUh58rwSMbwyrtgttLw54SOJZLtVwfBq832pjum78uPsUTlN6lSCxmPXWailw7ADHFeloOPn83kZoNw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEp3LPr/; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-679f980a239so3393256eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652263; x=1773257063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKd1ZgsaUe4wWSBNNBKtsv2kKFvW/83dcciLxcaj/4Q=;
        b=SEp3LPr/aPxtpwZtmz1By2CPLWQ00u6N41cEprzFIOh7G4weTMissZdv5INkTKU5h+
         FkIe1s4fXPLY/hqVvAC6WEt2AvHhtm2owKv/20sBZWuG1iaWpiGwSDFXjA/TSwI4asdo
         ZpJUTHopoKHPMsE/78gbZ2kztoldTm54/S5xJ0UdTXidf0f/OEcSlqdclL0oOOdfhRfc
         nl2y60m3OJBGvbQ4SHiWoUh34NqaUPpJ/j40J7RNcLJyKe7TNoppK5ThLhndpDARK7Jy
         oUNawud9+rZUySEbNo7ABV00izn2VrsrccTuaP+tVMI3d35cv05yfsXdfC1BYElbUsQ5
         Lieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652263; x=1773257063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKd1ZgsaUe4wWSBNNBKtsv2kKFvW/83dcciLxcaj/4Q=;
        b=Tl31NC00hY1xA8Nhqp9Z3yoJK7HFe0yFJtOo+ht9f/RccpYolWBBMwOhOUyX4Mr+68
         Lhd3Zmct02u1DtaZ2T/yQaNrf2G9QXO1hYQ/NT5jxaHw8UwyH0npL/LI0dW0HQKdY74C
         +LuCPeQkKDrRARzdisuseSQ0yuRdjZ2U4OpFCVHcG2eNveGFDQJaIoSKV7n089F5S/sX
         LMdaz4p0v5zO1ySdh3RtrSC1lKJNWNmaNxlRy4u9ttIMw+tvL3f8h4ini1/UIvh49ze/
         cMxnxZZVyehqtR3Vzanjj6Om4cjkHv3LuYewpll0Fry5BGf/JTemN/WhLmUw7P2lJO7J
         dpCA==
X-Forwarded-Encrypted: i=1; AJvYcCW9fLEZdWc2JtWJ/CUN74V1djynEp9kUS0Y+5XmcdK94Deoub+PNjiLtZyJcT/EPHVeQH2mCwPRp5VVKK4X@vger.kernel.org
X-Gm-Message-State: AOJu0YzIro6N9jbW1ocY47EpVxAKikvrh2Yb56Xx6zD/LIpW3UFnWHNL
	p0E/b4302JMpadJRaxr/pBKuYuWuCw835f1ETu3CUGNZhODj9u2kh3x8
X-Gm-Gg: ATEYQzxqveP6amgSBd/EOVbRdthDLqDvbwyd0w51R/tHJ/iL7b5Stm/ZNj8cBTGUYhs
	tqVzSQQqy+z81D8wVYqmkxubJ2wve8IrWDY5oLu3jJMMzHxVeXsM5/TTH98kNqJJkr5MUl4g23d
	bxEttSqPkv2bgD++fD1BIWSn1nUFgCyaVS+QetVFZr1sInKooKYm4ZQOwCj2ofKoM9Bb+Kx6mLP
	m0Z8Hkmg5mz/Y9chmihq5Wz8t3urTH8HjSvaV4nPsRuqOPtf/FZMJ56nKnagLkGOGv2dyhUq6yK
	gbUDQClwt4eCJyFGyrWJ3d4SPzoQLwaTjttx5wCqW9286Au0t/gL01Azer/H3aZha26lHinf62p
	zTOHH+ijOAdqIIVjdBrRwJfa3ant+nWeM0OZlexTz4SaiovA83K+HWZfNTuDiQTHyfXZs3GDe/8
	aJ8ngSR4Ce1An9+zPo/xlYVSqIDhADurl5J6jFBqryPgRANZW576KuTODXvD7RZQpvHg+Apg9iL
	aYcpdj/bfVYVzlFAV1JsMXZxUBr65YBYCDF1t9nFg==
X-Received: by 2002:a05:6820:f06:b0:679:e750:6c10 with SMTP id 006d021491bc7-67b176f173emr1909516eaf.24.1772652263389;
        Wed, 04 Mar 2026 11:24:23 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:5b2b:e942:c11b:ed62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d85297sm13294165eaf.11.2026.03.04.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:23 -0800 (PST)
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
Subject: [PATCH 2/3] remoteproc: qcom_wcnss_iris: add support for WCN3610
Date: Wed,  4 Mar 2026 13:24:08 -0600
Message-ID: <20260304192409.927562-2-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304192409.927562-1-kerigancreighton@gmail.com>
References: <20260304192409.927562-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1829C20708A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95436-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add a qcom,wcn3610 compatible string.
The WCN3610 shares the same register configuration as the
WCN3620, so its configuration is being reused.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 2b89b4db6c..e58b59355f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
 }
 
 static const struct of_device_id iris_of_match[] = {
+	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
 	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
-- 
2.53.0



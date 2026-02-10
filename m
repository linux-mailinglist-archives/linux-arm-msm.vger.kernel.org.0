Return-Path: <linux-arm-msm+bounces-92386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG1cEcGVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:19:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A280811640C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3355300D0EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A47F2D3ECF;
	Tue, 10 Feb 2026 02:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnraYHwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4812D879B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689981; cv=none; b=ZJj3qC9D2RVhtPa7cWlb3XUHMEBLZwHmJLb6B5qOr7cOgmwHsDkzHjuZD2QeiWjA/BI8C1YBQaPawVKbi5QY2x6spZ7uXlRjOSPRyc+F240SHAgdWHBpo8G4UefvfoZXTtIqNwN3vHEEuDreteb263DkipyZe9bOQrGPVGsshB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689981; c=relaxed/simple;
	bh=JuEIdUklwEG+RzPHMwpT310LEVYhx3Cs+uWXhr5CSP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BM1gpAd6MnLmMdqSu/h4RSAjpvfrh58c2cEMUclY8L3vuyQA8DBb+AG4tSjx57x4MltDVISkzz63t6zCwChY7trS3nZUl6X8lh0ZWv94EelBeDJL36BQJ2YG+hu4KEEeuLr4If/EtjFZ5J/Fyho8foITxEzQykx6hs3GGOZAfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnraYHwo; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-895071c5527so47801896d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689979; x=1771294779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trICzJbfAGRUinFxpIlScezsbIN1wIpZqx7ryhwMH/k=;
        b=RnraYHwoKVdI/e8nLLQpq4asTRd2sgUdqNNUFd3QT5gR24lIavrhZ5kyu5NBXyw/Ep
         IyIGv1B+10JN3lujuokawaSX61Jnq5MjlZ3HhodWrUb8fm3zUHnvJePgblieW+fws//p
         OJu50qzOH8LuVne6ULohpsAwYoYjttPWYpe8+DHOpkrI8EW8kEJgM326pLm231c+nSvM
         pS0RKT3SMgWWF1VZzc0KMqZi8h5xWsBrvlrJ6vmVOk3YEifmDYKI7kvv2pgf0GsxjU1z
         WzNAt3s0nMLtzqmyU8tkigvAJqHB516D1KAByjdL8GQ8MDZTI+6cnpDYOVAj9TCMv9AA
         mglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689979; x=1771294779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trICzJbfAGRUinFxpIlScezsbIN1wIpZqx7ryhwMH/k=;
        b=es/09CRliMzG22ZDpIsuBHlsGmNsW+4r0gR5ybp5K81ID/hzUw5EL8rgr5PG3S3lKt
         3mHAuZvugkQqDBwuHvH2iO6NNi2SGice9injhTbfqcoGdodfQyfHvA9Md78y3gg310fS
         +QHkLNOgzoBLnzXDwRd9UvBy9kSKn2wrGpLgdijNKup63E+myORwzb0aJTOI8kMAMrKc
         3FZk2zMw8JIejInpLFMcFw4DwFwh868BMKn6f4HMSZQpZAaJYAVPqStJncohD0fvvtBR
         wf+rpaWfXdzgDzwCmcnliqzl1rJVn2VLF7wraXnCheDxeMs4ph8xZmCFzYJl25BuCa17
         xvHA==
X-Forwarded-Encrypted: i=1; AJvYcCUfSrnmahMEhzt2oUuV0ccMUIx2JfbmazaRcR2Re/NU/MVaPmu4HvQUcqg0W3mcCCTiqEP7q1aIQ89KzMOm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6PnSGX/dbBujxZKWBDM94jTTJAyhAlS9hE12/JaVLHIRnWvKr
	//jHT4Z7wEzXo0XRsuaHUl4eySG0V6DKn82b8VFKaaEZvx0S1KTpHMsn
X-Gm-Gg: AZuq6aJYw0OVE+rV0QwOXE9w4Vl56fesqsCeVG3bQTULuzNN/mMLSp2613QCzmxGCxb
	4FevclTtiBypdhUK59a6Xx2RGkwkLcXAi5MttzMkIMO/KUZrttpPYFZyo2f5iMXQ8S8GfIE1Kxq
	ZBqkNNeGV8bXPx1D5qSBklV5TBG9grSy8tCOOhhmK04uOr2dpiQAiysv6W7QeoPhJApKwwsMm67
	dWCCw3wDC6TMtAbX2KcUkyD9tns1OZqiKhi2uyvIBqKpgnuqKlfPS8eDOs1EGx+/8DPoutH/L5T
	m6Qby1d6+AZa+DcZaGVexgCcsDhi/GueIbZTojFMsJJb8zXw45+ma9xMjtE0Etjra+vGSpHPuyD
	7q1nkswYaaqVzwQ0NTJZYPDQ95QCAQBn+V2kjtz7Y9nKT0GBYTcvFPUBBHQi2VjAlqO/CgJ6yo4
	bItY+YCiNP+00IwrvxvLSxwDlsGzBOWcqGMiu36BBr1fsrRdUAeF0q4WvynGhYcNN2eYic3Wqz+
	UgbuEKSMnaKIYw=
X-Received: by 2002:ad4:5aac:0:b0:896:f47e:fd51 with SMTP id 6a1803df08f44-896f47f052cmr110932636d6.47.1770689979374;
        Mon, 09 Feb 2026 18:19:39 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aeed8bsm964810885a.20.2026.02.09.18.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:19:38 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670: add llcc
Date: Mon,  9 Feb 2026 21:19:57 -0500
Message-ID: <20260210021957.13357-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021957.13357-1-mailingradian@gmail.com>
References: <20260210021957.13357-1-mailingradian@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92386-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.21.14.160:email,0.16.200.224:email]
X-Rspamd-Queue-Id: A280811640C
X-Rspamd-Action: no action

Add the Last Level Cache Controller (LLCC) for the SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..b5f832ca42f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1130,6 +1130,17 @@ refgen: regulator@ff1000 {
 			reg = <0x0 0x00ff1000 0x0 0x60>;
 		};
 
+		llcc: system-cache-controller@1100000 {
+			compatible = "qcom,sdm670-llcc";
+			reg = <0 0x01100000 0 0x50000>,
+			      <0 0x01180000 0 0x50000>,
+			      <0 0x01300000 0 0x50000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		mem_noc: interconnect@1380000 {
 			compatible = "qcom,sdm670-mem-noc";
 			reg = <0 0x01380000 0 0x27200>;
-- 
2.53.0



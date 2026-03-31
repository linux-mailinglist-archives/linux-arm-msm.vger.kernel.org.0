Return-Path: <linux-arm-msm+bounces-101154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMctEqglzGnuQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:51:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4AF370D76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DA8306D379
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D909C3DEAEB;
	Tue, 31 Mar 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dP6gLtul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58574376497
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986239; cv=none; b=Td4zDdaLLM7NPhRW7jOIsc0Yx0oIFMK3wy+XHcQtGH770zZcbb8k1xo295ZEqCAsJZrI8wSgqzbmWMRnjQPneDx7+de6v6gFqXb/btRQlIzR1p+5in5IblJIpIlLVjVGfSrygAw7Jg1bvTZIlhkPi32FAU7VUyAkzf1+ETbxWz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986239; c=relaxed/simple;
	bh=CAjUME/AsJT8A/Pl3H28E0ZFy9j0BTNKFTGVCJ4aUUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/p72ES1nXHg7klB1kQ1V5mDGne84G1KNDLxwh6v7KjKDQInOP+Pi97wANKSBXAfUGN9Xhu0bZw8Guwv5K7zyamF7MNQBlJbksNMOY99yD5bSehk7rffHBe26dzx4kq2VkZYGtqnWlvYraOTCDkf2NqyzJHz/FdhZdFWDbj/kQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dP6gLtul; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb20bcff5aso611802785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986237; x=1775591037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=dP6gLtuln/IZSDxo/kWBz41QZgJX+/7sqtBbwV2cuAq5Bf3rUGfa9RR3xsbDVDNldT
         dW9EDRPEN1z2WvWV/ONGSS+68g05llkuZYMKIZ2X7mLaC/oJ7MsqD4b2GmUQ9H5Jeb7e
         dY+F3Ceekmur1iItQPwgX62iErJBCiCTEwtzbNmz6vyte+CLQvs+KEgUBncoco1PHWlo
         rpeIT8TbW1X+T8t8ozFZGIji+pNZ+EQMb7CCXvEfeeliC1TIieJ75LQtZTl/jgg7MlEH
         EcI/au3Hz/VAIIi0GojmhUArTherpYcPeaRAdmhUeDuiz5KKm68aoIRTLFbndJpmsG6M
         vNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986237; x=1775591037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=TjN80GZU3EhInw2EFaV7jX3eeBWMI9dEmovUK1w3sFQEj3YS2vURZs+7yvTYADr0LO
         sp7H/UTc7Wf9yIPFPba4mFhVR5O7nyJ8HrTwlaQHXh7PZxDHl/1VMyZ8TV6TewCqglrh
         JLGRnSJX5SeXrCHqIX3tx7zw251zUNuuZp428ZW7Dfz01JlrN+RuSBfss0cxDtLLNRsv
         TIImYsVZh0GhLcfF3JpWZTdqSemUj6ntHWJ5vT+8k9JkOcFNfUwxpLi5CX4s7tmCtQSn
         6B8NJcdoiElHbyzAbWxc4mKeF278SH+9Nbw+/i10Fw44WN4AWd0c1kzQU+dXqkQHPwsN
         Y2kg==
X-Forwarded-Encrypted: i=1; AJvYcCU5lzsMm8/iA1fSX1tIyj6ZUeryXvpuk1PKo/YtqRYeg9geZvuLLxdiTMkjpTXMtte3JAW9EBko7DYZxpEM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07IKeyRsayCh+eo08RVfFiHB6nb19d6WybGg4LOZsJrdLUTKk
	PNqN643O1f8V3tbQcmxU5Dcuc2Rd98osYkXxhHZCSXlewwqNyk/qWHtK
X-Gm-Gg: ATEYQzzPBzIR1qdmfvrSXUzRfiYDeRAFNTFy9Rx512Mhg64eve5rRkAnzpdBDySUNKr
	9fm2ltLD/dTtwB2IWyP3uX8oXWEB2HH8zPCqHCbHYNcMDTnpUteL+sPzY10IxP/M7JY+z1YbFdu
	UH/83CET4stzBbTopAc2+LyF4tC0E3Z5cWCgzzvWzs+oj6+3+Q2i6aTmihSU5G/avDE9tkQvNJf
	lwQ3PmhSzbQ7hLQxjSiFu7CU3wAMtti+naqCoQaUi0850R39xO+FUimnGyAqzyObcPKG52iuce7
	8ovdREPo5OgnEHcosX+5TTEgjOmhPwDiMseSvAkWHb+eheSOAfujb2o++t8lUlML4IYbWyYBmGp
	FYt6aK5r0ag7/aeN/RcZJMOYcSkMUl9IPgtf8y5seqYd9xS29FnwP/hgNPIbmdppNSNZanQiecX
	3fYnCb6ygEMja/9uEN5J9EL/6F
X-Received: by 2002:a05:6214:19c6:b0:89a:649:f88c with SMTP id 6a1803df08f44-8a43b50f422mr12425006d6.52.1774986237402;
        Tue, 31 Mar 2026 12:43:57 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbc9e086sm99969476d6.12.2026.03.31.12.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Tue, 31 Mar 2026 15:44:35 -0400
Message-ID: <20260331194437.41041-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-101154-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 9D4AF370D76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 746e9deba526..fbd16b1f3455 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.53.0



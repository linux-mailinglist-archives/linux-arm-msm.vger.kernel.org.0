Return-Path: <linux-arm-msm+bounces-113621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FvAZII2GMmr61QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:35:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E14699212
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:35:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QQDlkgfj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5381C336B9A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456A13FBB6C;
	Wed, 17 Jun 2026 11:24:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2273C13E2;
	Wed, 17 Jun 2026 11:24:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695462; cv=none; b=AtqGp9eLE+uAgE6D6VrLjgqWsZIE1SqDKhpwdOazCsA28HQI8wk9HRKdIQ1rJ5RGgw1/X60voeD7GduSAaqI2FpDxb7c33Awr6XxxWXPnQ99IflN4WG+R1kqSXojRxiiO0sdAbZEpOJaHMxrKGWeoxPjMPKJHlBfWpRSCiSMXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695462; c=relaxed/simple;
	bh=kJznhAsAIoUPplZeSBc53gfszz7QFOud6uyzz8FYHLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXawt3AcSZ4XnIpbCLxzk2j8S3k46IrDWOCKbX1sHstCe9ZnnzSy+KrjfjwiWHo2B/aqhunjxPpl0YjLCHLzZ4a3yhsozRs0jPlPYMaIsXBzjBWAcrXKjCcIyQdHGPTDIcg18N3NTIbiKEbaupfXmDGwKz3+MGJV4QISV2VI+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QQDlkgfj; arc=none smtp.client-ip=80.241.56.161
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ggM1s2l5qz9t1H;
	Wed, 17 Jun 2026 13:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781695441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0DwUTq2rLnB3z9n23jFo4+tRKz4woW730QVRFw/7ngQ=;
	b=QQDlkgfjLuq0b23L76DrNNnzMr69RuAuxPzpbnSehHzZeyKIdHSwGjC8Jq5LXW7Bl8qjyX
	eGOi2xt0cvGZV/POpBy36oSF4VvLqZ3x8VjBzdis5MTl1x9byFuMNhEIFiP383JV2VsMsv
	o8J4J5z90+L/ZX9PA35MZmKSpcO8UzoiZrWlaQm2dQRoa5dRblqL4X1E6wJitWxuaqWXoK
	ZLYcoWAU3exZQs+OgrctL7jf1Gh3ffJ+u6VxnFF2d2l9WdGx8A15gXjPS7uTJ61n22BcXM
	mHRU/KcigXMjs4HOPOOuKEqqQqlJL6BXdwK4iYG7WfTutrX95OF/k8zzr1pEQg==
Date: Wed, 17 Jun 2026 13:23:54 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Maya Matuszczyk <maccraft123mc@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/6] Add driver for EC found on Qualcomm reference
 devices
Message-ID: <ajKCupui1WILXnxh@tour-anthony.aruhier.fr>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
X-MBO-RS-ID: b8d4d4c08c8a9ab286f
X-MBO-RS-META: 8wmtbtcc1pxi9rewx5nkkk1reg86sbyu
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rdunlap@infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113621-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[aruhier@mailbox.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aruhier@mailbox.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:email,mailbox.org:from_mime,tour-anthony.aruhier.fr:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6E14699212

Tested-by: Anthony Ruhier <aruhier@mailbox.org>

Thanks, I tested it on the slim 7x (2024) on which I was previously using the
first patches from Maya, it works great!

I confirm that the following works: keyboard backlight shutdowns when
suspended, led blinks when suspended, keyboard fn shortcuts.

For the Slim 7x, I needed to add the following in the DTS:

---

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index b5247fb91299..423bf7340b83 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1070,6 +1070,21 @@ retimer_ss0_con_sbu_out: endpoint {
        };
 };

+&i2c5 {
+       clock-frequency = <400000>;
+       status = "okay";
+
+       embedded-controller@76 {
+               compatible = "qcom,hamoa-crd-ec";
+               reg = <0x76>;
+
+               interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+               pinctrl-0 = <&ec_int_n_default>;
+               pinctrl-names = "default";
+       };
+};
+
 &i2c7 {
        clock-frequency = <400000>;

@@ -1487,6 +1502,12 @@ reset-n-pins {
                };
        };

+       ec_int_n_default: ec-int-n-state {
+               pins = "gpio66";
+               function = "gpio";
+               bias-disable;
+       };
+
        edp_reg_en: edp-reg-en-state {
                pins = "gpio70";
                function = "gpio";


--
Anthony Ruhier


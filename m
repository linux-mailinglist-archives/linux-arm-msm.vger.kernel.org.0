Return-Path: <linux-arm-msm+bounces-93023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIOUOKmqk2lE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:39:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91459148216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E2EF301BA44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ECA2DC32A;
	Mon, 16 Feb 2026 23:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="tMAJgSO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98062F1FEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285151; cv=none; b=j4hI7U0O/ag9NDUZPkiWKMf69T8DnTm9xk5Ge65aJjVWeFzpf4jhcAJKFXeJ4dnHj2ZrM4h74AtzzhQi9oQxGG2qBv/XcgCD1LWODR4mPzmoZ7Wa0s1A6K6SwUZvaO1mqUcLhzOVOYj4Z7v3dNRdi46azd5WnON98edZxo5URt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285151; c=relaxed/simple;
	bh=FzEDqe3HBmxO9tiERGUD5CbndWbXj8cTA4U4jJIIxwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ettEIMF3rLkEf2u9dmDA9xZXiT1IYDTjIn9NeMmKK8N8tl75HB9k3MOKBP2c61bnkYlnCwW9RxY57L0Mw6mw3Dhu23vWFr33ybpfQHIcOm3KTCcQBxxXU+tTKUOTOc/xo4fvzA0H0EkpE36/X2k/7Egs06/Ov/xxRtwkCelwdhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=tMAJgSO1; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jw6LbuJdUl80cdrWG1FjVnPEOcj3kz8s/yDqaabuano=;
	b=tMAJgSO1aAwqoEJfxiKKa2h+P806coUwah+cWnqZSlnPnp4fiqAknqtSZJM+Kzkki/Iw7X
	jMX32IcQ/AvJ3VWI2mqFVrLAOwrnf2++7364cjpJorOIM5wjuhevrIlgsucEW8jUHUIIla
	VHo8oZkVtvsnwQ991NjE2feVAneOpNFGKr9qjCYPW2g80A1F+2pYaeXV/q/odVrKr5AKZp
	eiLfIaTCwr3aahD0sK3rY8huMfWyXhc1u6TlslMjmRbEFoJCp53A5TvmLBbaWDd2VHp5Ea
	BHdBXUn9d/A+ZCvPtQnvXm3GhKojxaTg1fq+/jPgZF0kj/IwubIySoQQi5tG7g==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Date: Mon, 16 Feb 2026 20:25:24 -0300
Message-ID: <20260216233600.13098-8-val@packett.cool>
In-Reply-To: <20260216233600.13098-2-val@packett.cool>
References: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5f00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91459148216
X-Rspamd-Action: no action

To make sure the display subsystem starts in a predictable state, we
need to reset it. On closely related SoC (sm6115) this has caused
DSI displays to not work.

Wire up the reset to fix.

Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 80c42dff5399..a22374e5a17f 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,6 +1238,8 @@ mdss: display-subsystem@5e00000 {
 				      "ahb",
 				      "core";
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			iommus = <&apps_smmu 0x400 0x0>;
@@ -1437,6 +1439,7 @@ dispcc: clock-controller@5f00000 {
 			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 		};
 
-- 
2.52.0



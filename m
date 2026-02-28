Return-Path: <linux-arm-msm+bounces-94640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKTkJOxio2myBQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:49:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2261C945C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DB8B31C7DD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32AC30FC2E;
	Sat, 28 Feb 2026 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Icwlohg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2F3019A6
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311671; cv=none; b=Dd4bbefhx7ZCKrrFShMHPAMHZt4joK1IVSwh9qtrCMr7B6/ZtN883t7eBGi0SLjZkQ91FSTjcvQPzBQ0LZhK5Yuvjy1OcnqGs8AnElfYUOo2LqatFTFUr1/4/QOmSFDmy2mymT5xWU8IM1eft26npNA7t/XyYdDW6e/3QUqiF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311671; c=relaxed/simple;
	bh=vN79aVq15KJmINuT84+yvI/rNP53bO1GbNxLL6+n1X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ii3mARjwD0MW2S4YDqS9yHpZKRai8WUOYUbVuS2S8G4F6BrlDmW0/IBSbHGsAcESpgS2JrrS2PUsQO6OJV7KLm9TJgHvAU2YT8fGIhb6YpidDIUxMW4xgQcDYD2M29Ih4+z9pbe7ugKpcRTo7RvHj7ka25lBzOSzJBw926++sQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Icwlohg0; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RG3ZEWSeGQFYP6X+wKEUzoO+lwsoqVPpKdpIj2KNtZg=;
	b=Icwlohg0Z17tmo7s/HYVjyK+RfW6dGxe5tDSC9i+9ENJBpTt/nPaSjriHhFcf2WQv8pbr9
	7OoydCwIcgMRFw9/Ga5h7cIVY+qWLRGjOdWPqghYqEiCGgI52qVdOSA+/jUZ5GQ4VBYT1S
	o9vdyF2j0NWekwY3A0trkI9+1/rHWdP3nog643kVTRUxp6uP8+hgBEOetsyCeX3V0PpQk4
	4Dd0m4KTbdMwAKj6PLYzaYrhCRD9OHH64lWtRbqwBEOJKv0el8T3KpDpdpvptFCsc4FcIZ
	/cNQpvZ34SvclVDfzUFQFNPSSiOCzoAqEBXOysrXNb2fwbADbLkIuUxIZvs+WQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Date: Sat, 28 Feb 2026 17:41:32 -0300
Message-ID: <20260228204638.11705-7-val@packett.cool>
In-Reply-To: <20260228204638.11705-1-val@packett.cool>
References: <20260228204638.11705-1-val@packett.cool>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94640-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,somainline.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[packett.cool,vger.kernel.org,lists.sr.ht,oss.qualcomm.com,gmail.com];
	DKIM_TRACE(0.00)[packett.cool:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,packett.cool:mid,packett.cool:dkim,packett.cool:email,5f00000:email]
X-Rspamd-Queue-Id: CA2261C945C
X-Rspamd-Action: no action

To make sure the display subsystem starts in a predictable state, we
need to reset it. Otherwise, unpredictable issues can happen, e.g.
on the xiaomi-laurel-sprout smartphone DSI would not work on boot.

Wire up the reset to fix.

Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Yedaya Katsman <yedaya.ka@gmail.com>
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



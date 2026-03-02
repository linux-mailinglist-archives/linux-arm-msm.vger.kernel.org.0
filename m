Return-Path: <linux-arm-msm+bounces-94863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJkqHS9spWk4AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:53:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFA1D6E38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84A803058E01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1F035CBD7;
	Mon,  2 Mar 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hAT1LYva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E335AC27
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448634; cv=none; b=poI2xeI7JSGgp5fgrug2i1tB3jZJJZTNwayZp1WNh3CBSXyfLJfZ5FLs0S5PYCOP/A/v/O7M35Ph62GDLSA73yaSCaTMDPgOE+pngFbhpzqAaPbwIt7Bi8WBMdxcZChhomX8LamRvhYrytfF7OnkkVDuOunXYHpBVM2imWVF9VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448634; c=relaxed/simple;
	bh=qfKnEcsoVX06QZzEM7/4cC6HPLmj8y0sO6sxJasyjlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omYtS7mfyn199vn4aTDTv0P0qgDesxWYXVm1xaDvTf/tBD9D/PFIfJxgTTrMyVFOEy6jXgOckLwuPb9jGrtsg5ShHDPxTHGlijuETQTi6yz7PXRUqQLYgeZfCRQZ1l3Nq6eezG60QHQzgWmpppb3HBLV0T/oFPlmY+Vj946/3cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hAT1LYva; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65b9d8d6b7dso6970541a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772448631; x=1773053431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQRQHvtqeyxSd6xSuySaBNbpnzY0H4KkdhX34aIrxhU=;
        b=hAT1LYvaTiGkwA1DQLIjiQHG6/W6EeCDkHUdIXcXsnHWmLXCJNC+5EL+AjOQGdPbg6
         T6egcUGhTXMkRxnYwuBZJloG8yEXk8sX8RHc6AuLgzUMIabQfcpjtUe49mFzEoSm3Roz
         6VKMhkJJZ/3g7MMSgJdO2BM0+kkg9Go5h2zvzSBBTqN6LWzKS6qDslKAxBxMMWKiwUsd
         h9JW3M9QH97GY8DxJ5+ndtyZajmMjMtJ34r+oJ+n99uk3zCXlpoTesOrN28IannM5bCc
         jA8FJV/hoswIYx3fiYXVaIILxNfzDuAAq0IUnEYQRcLikmbxWh2pnuZSAjtqzQPZTseE
         GLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448631; x=1773053431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQRQHvtqeyxSd6xSuySaBNbpnzY0H4KkdhX34aIrxhU=;
        b=dUmBJ1sJ9jfJjzcPGWZ1FUFitRNggsmpfRMaQIzTLUE9eQkoIL7G+0TkcJNQij46C2
         s76joY+6Q84Iz9uY9No7EMxh2kdnICrARRAzw/HbFx0IBx9za5O9ETVqFfX76f6+HjYr
         /A6x6IkIYYPld0jq+HOeWql6CbrImLo962ZUOEdxzQRr0v/EamE82W17Ert31/it4S6h
         ty/HRecwSxBzjH/ob8N8g08W2DbQ4C3hQimw4WWdSWM7MG+BgeLGJISOn09RSopEhFcP
         XU6YMBsdEZDBabY77J6myKRLzf441/c1a9kUJA3Zabl5CPjHn3KBf3fCfas1bNTZkpRY
         /fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNHmgUtMF/3938XQ6ep7BpXIb7ipNac3kLZGK+ceruxVHv9PrHOT9qea8UTBE1Hw24bdW+neNERBIZJAck@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IUopiYhG4jrjSss1JiwHwoD/VZCmLTREkwMcx662kLolSdmA
	EJpDPhx7VUl4tCeYORNd+krNYYm1pSXxA23IffDxmskIOkXDFlTxy4eQClNSEitIm7o=
X-Gm-Gg: ATEYQzyi7tkdFsCI2d1pTKW8IpWyXHIdcBN/akSzp3U2jGTQ+W6RV+YO5bNwH1Jvmuw
	BJPa1t/RJGHYuuhW6oagJ0u5N56730XxzcR4I49b8jqRDG9QTeR0ZQ9IfzmoODH2VttxRANoRA5
	hYJDJF90b5axp4Nbuoxmnkg++ltwgHb3x7vYjRPnMofNgHjX/HiV98CTjzD8wMyKy1zIvQCl9dy
	XNXl9Ju29VJPU5bSqcz3ropefRDVXWNSgGEQ4mw++wTZEci3EKpR+NkwvmZs/wzrq2bI4+YJ6gW
	+Be76ymVeGxFNl7P/PsOkUurl8XDUYEKnc8GD3QFnoFugNFNmQdB2hHebi2UWPgffInnMZWoUf4
	4gkvyM2ix96yG4AioyacIDrPX2U9P8blHM/v0SiWkFTvM0MR/wIKhYj4M4DkIV1kDj8CmrmQIed
	K2+UUGrfmn672OXlzVr74JMU8+sbxAozQhxLMN/ZE7wnQXGKaP0tyA/gecDo5WILi+OsfbI1Idd
	QP046u/sw==
X-Received: by 2002:a05:6402:398b:b0:65c:2af1:b7e2 with SMTP id 4fb4d7f45d1cf-65fddee587dmr4742714a12.27.1772448631462;
        Mon, 02 Mar 2026 02:50:31 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabbd98bcsm3511769a12.0.2026.03.02.02.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:50:30 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 02 Mar 2026 11:50:28 +0100
Subject: [PATCH v4 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-aw86938-driver-v4-4-92c865df9cca@fairphone.com>
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
In-Reply-To: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772448626; l=1662;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=qfKnEcsoVX06QZzEM7/4cC6HPLmj8y0sO6sxJasyjlw=;
 b=CD8MrPX2NaW+cddjb6pIzw4VQffjeV7qC+Jfx7vwUkfptL/drfQGxZeVF0rp/mWLz02lbvFU3
 Zw5SSxZkMpmAfNx8ptsMHqTaGjsmbUkCUtVYYwgEs2Me4gpbRczIfpR
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94863-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,5a:email,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: DFDFA1D6E38
X-Rspamd-Action: no action

Add the required node for haptic playback (Awinic AW86938)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa117aef6822df230ebf644e5f02ba..324d18d9900881a840806ada84e33fe9664296a0 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -625,7 +625,17 @@ vreg_l7p: ldo7 {
 	};
 
 	/* VL53L3 ToF @ 0x29 */
-	/* AW86938FCR vibrator @ 0x5a */
+
+	vibrator@5a {
+		compatible = "awinic,aw86938", "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86938_int_default>, <&aw86938_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &pm8550vs_c {
@@ -755,6 +765,20 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	aw86938_reset_default: aw86938-reset-default-state {
+		pins = "gpio78";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	aw86938_int_default: aw86938-int-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

-- 
2.43.0



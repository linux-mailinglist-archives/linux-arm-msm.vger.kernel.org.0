Return-Path: <linux-arm-msm+bounces-109796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC5GDHCDFWoSWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:26:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 376985D4D8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65D1A300138B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD493E022D;
	Tue, 26 May 2026 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ieCZi6Fi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE98B3E0246
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794795; cv=none; b=HI3KNPonSuiF6O7ZaxxtuhdC0PURRPIymFqix9lDdbvNx2lIem7/ghxIa88oDY3l021nBLqQJpQ7NuGHPo/P8o87aclyJ6fIRhUEEij3L0/RKGUlj+ckfLOBfvtnyVHItZPC+FV4L5PYWL2Zvl3kmesLNFlzzs3HU/221wRmKsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794795; c=relaxed/simple;
	bh=IFm8Dx/iXRffdnKm8nRykcQLPzVQShjAiSz4mRtDJP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Laz6ou0qzHj/0qMOWrKdsdiqlZh850K5Fzc14yN8KJZtXI62kdX7AlytRA/jbH0MkkEMHitOxhsw/yE0E1wEfnyiCBsE0tcFInlWY6FDW5mtxCfdd3mK1jEFyP0wk4j9hFjPdnRLZzMwc+HOCRMfvY4uN4tEeDn72rPqtll7jf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ieCZi6Fi; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36af4b7840aso1048347a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779794793; x=1780399593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9Hma8PgXDcu3st6AylvLJQOw7l5KSEEmW11TEw/EAA=;
        b=ieCZi6Ficd1Cy/CzRFl0FAxduLV9M4o8qzLXDG6Vj9liAst4auoevInya8EQoDK1+F
         QtAIZCyMwrmVbC6db4Y5vG7GFPXHN0+1tTQZvI2aiY+VfEP9Qcpz/rniFiUZr2v8Vc66
         AODwlOiY5wisEOQYKFnlB+4gLY/qBnrvVCtNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794793; x=1780399593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9Hma8PgXDcu3st6AylvLJQOw7l5KSEEmW11TEw/EAA=;
        b=DTyFWIrzXdc6X7WVfEyg0A90f3HrKdVJN8M+txLdIzk/rqMpabLts+GOky3vzMj4C1
         nDi+hf1LaQWpvvYbdOxiM1/yqi2Bbt2roQa5+hkXogOCwims30gTNr8q1yKvUG3KWHSN
         BvQSS0lwRAEW7pAyUxE/3Nz/PuRyTZAaDaKmXfkg51NAChHNkXN4+3C0kgUpzj/9shXK
         W1xxPnpy7fCPnw08+63pI94l4UMbiiKmE94MkfR0zvWApGKOw4aj+W2dGD9Tb9t073m9
         5Nu/P0PddfWkhplLNUxLXQMuY2CCafmcdrlfaOhIxW0B9RQiiIUJHeA0NHoDchDV8XjN
         M1dg==
X-Gm-Message-State: AOJu0YzbMm/92QbHO/PRFYogcOqMzjqFziggRnZd8zYT3Xr6AzeAjNNk
	VqyhjkuflYJ8c6mjihYyHI1minHoAt2AbQpE0jEHTZhgAake4utjW2dUoFuRvqDBvts=
X-Gm-Gg: Acq92OFsWcQKbmdhGbcCYCMIZJ5iIiV4LkpphzbTdXz+c7bbBqG5qGDWcWT54JWI3pE
	AVI0XXc3+hFchbmrMdrP/fVEgIpYZnvBPs/fpwZzkHsJt4QZprjGzeSgi/PA+ALsnumREtsDUqA
	GNZB0z0U1Ybzwaxt2/pTuOGlhEokPt2mC030rA6/xjLsKTDEsqX2AQ7PXm+o2uQQSeUcMqRWi2t
	8h+z324/LvIGQjFUCTxsV3C4sPbjoJ+YN0R+hBYwjY7fV/o6umzFjZBGinZZjweRRCNikP4QciD
	5Sj+Z8SGrYCebJiT+oVVlz4utbpDviPKgZ3rCyvUTX1uWn2nD5bFEZTBwca6jFwMtkMg8+3k9na
	g1bWyuihW4RawNTN/+gkiCfMu3ZZDSVebcf67dq1IjcOX746DDYaqNdHiv0xaJ7Kc93lyM2zyXK
	78VbanIsEvtVoAowPUWxU3DEud+s0KVfYOG6vwOQiQZ/RDTw3vSmJHUfjrmePBejzjzsZHPK7iw
	rjOaiz52CtXnM9TBemoqmoitDhIdH7/HWvPQFfV9zshQxg1YHvBdQo+xJEWSAGMFFI5W1Kc/Jv5
	LBmKHezZIOzUpf7tvSgUnsVc2738CsB4Xhy7cEAk4GSBrmpQfPMWHAau0CiK17PKOOiW
X-Received: by 2002:a17:90b:3505:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36a671ddedcmr17594019a91.0.1779794793227;
        Tue, 26 May 2026 04:26:33 -0700 (PDT)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm12188091a91.0.2026.05.26.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:26:32 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node
Date: Tue, 26 May 2026 19:24:05 +0800
Message-ID: <20260526112409.66325-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526112409.66325-1-daniel@quora.org>
References: <20260526112409.66325-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,infradead.org,linaro.org,gmail.com,quora.org];
	TAGGED_FROM(0.00)[bounces-109796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[quora.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 376985D4D8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
introduced by patch 1 for fan control, thermal sensor and suspend
behaviour.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changes in v3:
- use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
- v2 link: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
Changes in v2:
- corrected DT compatible node
- v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/

 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..1ee2a2296129 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1352,6 +1368,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.53.0



Return-Path: <linux-arm-msm+bounces-101140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOg+IrUjzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:42:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ECA370B4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3088130A561D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81343DEAEB;
	Tue, 31 Mar 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzC/B5i7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2453DC4B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985955; cv=none; b=Rvoq1r1gzIL+roCmm2SUSCwdZe3prqFrkqRr2tbl2m4sQ19KFxP5ScBW0WSfQBLCioEPph9adf4YQJXKJ1SFCA1XqkPfZY88YDRpQKJIbqj2GmsSkR2/5iycvJH3elWZlFVztk/abOYz2WLhpKq36f7LoxGQYBQMJR8fZ9Lyqkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985955; c=relaxed/simple;
	bh=XoJcRcH1qRXDO2rt0HAsSwjISCQOqSy7joomJfQRkRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMXurR4S5ivz8chPLTeGqTXo66oR76IU0IQ8gLGXyzvSIGGCvdSin0HgJ6mHB0UwV0RPiJkhl/XHOrzNwkfnqNjGrXzeNPRKCysDAfqVMtd0HQx5LK/Fv+zB38tDTOPLAQD9n32Z8Uu5/nPz86AD/W0e9j30Emc/7R5sm/QdhcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzC/B5i7; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cfc137464dso814948685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985953; x=1775590753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGaSVusjTdCGe7VyTkv2c8UnvdKBcLIofqJcIfpcrTw=;
        b=kzC/B5i70YXKgBo+cXrpzeyCAJGiza5y/IWdjPrqeWBwLveatXeoRUylDgC0huPIFV
         ONr6vOiMj5AQAtM9NXhLh9S9kdwfB8fmtpC9ImoqgQy22bl7Gta468J/Ev4ASNdkuxdt
         9EkRumk+AHxHxU5joEO+SKUvWx5ROfxjgcFv+tfB6y5s71r8McrlSgbKsGXHM3h4o3qK
         bCo29PPunM57IHM6MSQYfTj6woWPxpbGtliFZmhBDSNiPziTzYHTrmYdhOCUGsAeyImO
         VIKc6o5UqPIboX3fyYMoJTUIt3ENqjGPtEnPsPtbk+9gbvfQJ6oRm8nvGMnXlrHi0WPs
         QNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985953; x=1775590753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGaSVusjTdCGe7VyTkv2c8UnvdKBcLIofqJcIfpcrTw=;
        b=DZSNFkIfclWCaYCbrLbm7mtZnlWGlsVzIxMWlLOvzGTCIKbTFavmFxx1hdlG3OV58A
         pMenmp8Bzwf5/o7TfrfB/xsJT0vhLyXGBP7ISz1GY1OtqBkiqWvh/msQOoOxTA1V/8rK
         gVdn3yV1uUBcfIu9BVSwVBGIythysOjNP/GHSDE4VHFj51X+lnc42zbeHaY67hdJEelW
         s1RmhclUvPzx9x9wFuhWPcgTVMSp2CtHam/knQksBe0A8chgw7KpyQojnqu4+mUcE/vH
         X+yT8Tb/Ojo4p7LPR+sGcouaRGxb8CUIYmFgR/wRAnOw/kxw89e/9Q2CuBAtiC94/i0c
         g8pw==
X-Forwarded-Encrypted: i=1; AJvYcCUmisa8Vn+D7FwQJa3J+rqJP4c1LVZJqNyZVNao5dMzkYv/R57FSisy72eGmzHLE5sCERiMea2AnwlabScX@vger.kernel.org
X-Gm-Message-State: AOJu0YyReCKQG+ybVs4LqlniKror0qhZh85DnpuRM9Ai7Xj9Zjs6G1aR
	7yuz/3SW/RecMA3sowetaGeSR7hcLcTLTs2ewp2LTVjE/nkJfXi5RRyX
X-Gm-Gg: ATEYQzxyhtIxVZ3LmDg07O7J930PezULAxQqozGsRlOZ1IpmlAK5VtzRJpnA95a+3Mw
	O2hqHrOpxlfDYU4OCuDyxthFrliXKsrBNs6LVXeC66SiIE5RAhFbkEcVIfmwVQCd3hx9NArCgS/
	w1UP3kCSei3D2Q6r3ZDok6GYKd6auLaXSluXiNTRGLx8PgtX08ONfP8xtwNjMTq7QGZ4XxjHTqi
	rbozU9MXvWxFZmV38YjefQ83qEfUOLqgX0L670YoSVmJyM/lf6jxSShXglpq5WXPS+Y1QzrMizd
	ehQ8AiPHIexrLaYYKikifKzn0yHdICZw6nUEpkfYuy+E0gTHmHZAohYEip1HK7KUyFYup14CKc5
	9+wKMaMU0McB0Qh39eIREc+OWSXVKmeX9HQWJHXEZ5GXZBIiDlqUpWznZfpRAQ9SDPdRFAj0zYw
	z5MX+j7oIg3p+9QJVoXtpcniZe
X-Received: by 2002:a05:620a:2a08:b0:8cd:93b7:ebbd with SMTP id af79cd13be357-8d1b5c40efemr153898185a.60.1774985953297;
        Tue, 31 Mar 2026 12:39:13 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb7ddsm918603185a.9.2026.03.31.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Tue, 31 Mar 2026 15:39:28 -0400
Message-ID: <20260331193939.40636-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101140-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49ECA370B4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..074a20cda89f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0



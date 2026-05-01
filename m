Return-Path: <linux-arm-msm+bounces-105493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAhvAl/H9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9E4AD8FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFB47301ABB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D305C3CF68C;
	Fri,  1 May 2026 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAcse78M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC83B8D4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649498; cv=none; b=PDx2YRgKvBRwPhHVzvLchpQlHzNNxyaths20DxBFlKYIORJ1LEleyoW/a5w8Gyvejo41IFwxoaH4m0itaF7r+6uGfDrVThn7+pvxF8hE79sbESt0vaQusA6UPoWCk/euy+KBKqhN8wn8fnnc3AsYJ/oOe1y6LbQmQBPVxJHZMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649498; c=relaxed/simple;
	bh=sZptyh2YnTUW11YXeW5s0iLAeCrXBy0PXfU8miqgtMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F66LvQYA6dZw09GydYHnxnyXkbNdCIWXjMeVM3ytShy24BSbhEtgppfQvlk/TnBXczNWNb78TrWF/dRMAMs63Jkv2Tx7Tvw+J6gkOfV/k2kGxrLkv9Ss9Ys44T/KWr2jYWOpErZfruh5CJSBz6XGd91rZhC+p0uyoGX5077yqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAcse78M; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7b23713eac9so22413317b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649496; x=1778254296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=MAcse78M15tyfa+Z1eS/10jPTj5JBIpkHnTsoPrp8TLGau2ywADmawOa512wIlZZaX
         r68eWKCMzW2W9StOrnx+uD9TcRhETQ2wTMPKjLnlQY/TblCkzUA4TFfWvVfHTi3siNCN
         6LhpmyEJQCP+bL2VGQRXtS5cT3QvOxlVywmNc5jyCPKKw0IsaqLljU9rLSqHELajglrh
         Rw+qyIEnNh6yCU6YSExLVlkFMosHbWykv4T9wsbkUxuuhF3yFCdT8VrtWS4keQjjzT8I
         XxEwFm2ifMnVnF98PdY6Ol5LOoTHahsaSSTSa2rWQYyAFY3HWp2xvo6jodm2Y2aUr2BR
         /Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649496; x=1778254296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=mjPBHqmZ4Iam4CNtj5BA+ENcOHyjy1HDkGcgksfibkkBiXdatMUd+tTpksK/MnVV+w
         4UOmn6Ff1MqFtwJfTH/px3GQy3zN+UCbLEzQ0AuhXA1kCFhtfSbF8qNSqPZ96h1Gus7Z
         L7a2nc0XZXlo7osCA4IO9o/T3u01QsbBkLLDmvN2sqleCxfHduI166pMtZzyQ8WRY9EY
         BB23JasgB+Oc5J/eNF+41n/37VUFhTEGQoktW11qikxohAUEX2xm6oIateKw6X2RdjqD
         tsj1Yyo6A7UHXhzmU68+xAkFalcpu3CtSthwdgfiwbizZlZH2O4G6HtFffnfBDn0CZTs
         clCw==
X-Forwarded-Encrypted: i=1; AFNElJ9Btcq2RG7rrOMByzvu1NzQMzgjLG202L9sXX166npH/YPfPzJrdhiygeK1yWWv/RWrBW3IxmqnE9v+H0PW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWD825jego8vSdAq6kLPLoeuLv8JbPYsmInC6xMKAEAk9Wmcce
	luBNw0mOyEfZFlU0SpzozIJt+kWzgU59CPPrnExY4z9wb2MbfzbrHBBI
X-Gm-Gg: AeBDiev4V/7TktcehFPSKHwAaBIrA2yNvSwaNYB2kPMY4ubIZgofMFJ6AcAEVWkjwCO
	HavDjBfc/iPWrTKtHP+ftDyaGBKu9jI2xUzgNojAC/EVQuYJiyRMF8s3NdiJRvCDtsODD58pA3W
	qb+D1+xkY9IvT7HguB0UkymQGH+UkwSznX+GC0PNANGJtj/EhsL6plcY3NcpnUsJr62vh06Az62
	DHupna1n5W0Gf0sCWw97/6mNqehTfLalkIIeK1AY9hQbv/QTM2KXNItqvt3Gnino5lwc1gR7UNz
	1DghSv2cDYhJDgLf3VGjtidw2jPjXI0oRbDZNesAwuBmZyM8vWAiSrWNBerIDmnJwZ2f8mkf62Y
	gWCnJt3M6YkciR7mp0j17XvPEaJ5FU6u/l3NkkGQSpAwEcyjZIRZWc3HWeU6upjFEBfBpgRcWS1
	YF+fjOgij7klgoFme62fXkBFsKWwBNwwd0ZXcq
X-Received: by 2002:a05:690c:6989:b0:7b2:7dc9:360e with SMTP id 00721157ae682-7bd5448e19fmr70151347b3.0.1777649495949;
        Fri, 01 May 2026 08:31:35 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-510408de8b2sm19702151cf.2.2026.05.01.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:35 -0700 (PDT)
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
Subject: [PATCH v4 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Fri,  1 May 2026 11:31:18 -0400
Message-ID: <20260501153128.8152-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5B9E4AD8FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105493-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.54.0



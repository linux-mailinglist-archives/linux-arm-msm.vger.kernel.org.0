Return-Path: <linux-arm-msm+bounces-101141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK1BKf0izGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:39:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8DE370A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD136304BCCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F20426D36;
	Tue, 31 Mar 2026 19:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YarCvP1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9F41B372
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985961; cv=none; b=sbOKgpntxaP9xzCWA34GTYGwc8GRi+9E5YAnk8XAXjyJ+02WQUR+e1Nr3xbumYjOZQv0/c8CLmZYi+R7EQD2AntNkFEP1mM3eBTnbHVbxPEazJwVQMzvYoq6O332/oIJmO6PAGi+PnrmiUhYtar91jXwqoODFrujDg3PRKtJ96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985961; c=relaxed/simple;
	bh=lR1IVDRMJkZXoDslp4/dph1T2GakLoRbrBddRQrqVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iibpfEvrXj3qUOap8PJPLrkODdD2HbX1YAZKZjihL5gtuSotP83dpBCckhJSO5YD5nQAWQLblR9ht25Lw9Rl5BSlbpWo1Hsarf/FRG9yHiXDAnv1LXIVMjR/9YP01m0racBjzVD+eUEPVzrg2Im6fk7nHAsr6THP5SguzQFe0ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YarCvP1g; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd8a189f44so533935485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985957; x=1775590757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=YarCvP1gUlFmVvf2hCDW3A0c6+Yqx3WeGnh//2eJbIqaLH/lgArtmXpeuVU5hNE7mJ
         gCmjvri4hhhroIuOta3NgC1/DcOyxiIzDJsx3gj+Q/RB8d6am8hFfUDz73218N8ddHNp
         6f0MRemboY+gLHfrCHcjiC854qzJKU3QPl4uG110QJCWlkwhK3x1/XaLRo/8h87WOZ70
         s8raU1WLINH33vUHuZj9xqKE5ytGE6GSDrfKzv7W7gvSFUs3u6ZLaxej0Ui4HdwmGQIo
         v6oAmbOFDKSV2OBHoRz1di2YoQ/s3z3gCFYtCI3yajHALyN3BG8OmZffDOt4UiB4hEwE
         pPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985957; x=1775590757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=EyrvWaPRClVsxWvUY4x5O3WDqrvnURLILOaEWJYyDRl/qJyMurD26yCxORde3LrKjs
         xTfLCxbJ7j1yphNEmS2Hdkm9yKDQt0aEp6FiXnnH6hrlORkQPbGz6jsvmaleXscYelR4
         +CE5jZcOkGpFmlVWFfuWXaXdzIYknhj+hKCIwVfgll8TQJb85BjVwiTMRufDZXiH3zNi
         3e2aWKG3a4RYIYuQ064EnZ+GDH46xcgJ5QT5ZNcG4yV8T9dat1tpPOojiCZWIofoDuRF
         pygaIeKjgIN3MqM/nTaZSUlyfQ48tRPOztjbnIbytDMBdZ/2Dw9/moXWHKPdbaPYlLm2
         oHfA==
X-Forwarded-Encrypted: i=1; AJvYcCWgiFI8AwglwvcGUw/Pw7JvxoX4/rLrUXqL94ikGJ8WFjEKu0yAzGU+fM9YLDPiQJFGaiLhnqvI5K2rAU6E@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIQRNOzOBf+oY3hQjDZ4s7rrrEYyrNMb6GjBA1p3bjlRzQFpX
	F/GLF4C8diwk5oG3xhgW+xqibD27u9JrVSfEmBkW7WMOgdJMSicgkNaL
X-Gm-Gg: ATEYQzx7pQunhxs/jhqK5lgtCDclgoX1Kx/WTo8tDFhSi5uaClOp81j06wphvbJLJJi
	4jSqHoruu7NEj514TOYXJ0zckVEO9+bW3du9OyQ9nRphWxCZwbp3Af1PqyYlNIVwhSDhu0N4EN3
	BcRKNrFPxTHKeThjgjsAYuj3FsS7q2Isfd80BJMA5LrVnKb1IA1qC6jX90kTgEnhsSuzZOBeCj6
	SOjKtH26bArWfGdpj52IapDQxlwZ0ViGkQaUWkgPiw3TQYKGZ+jsAgV+Ds+5TeMjkIK34aCOUUi
	xcr9kp17iafNwQIlq+iJHdcRC9l8UyIJpduQQYz6FIlA0JHQJU9J73zqIqqSekCk9F/mTczWujJ
	mJo0kFota3IDxX+V/lbX0s3XF6TMY7CLcltjtTfRFnm3yoHd8LjzM9Q9v5meI9smrrjV+aOazi5
	+uiPOXSBEyxhi3kDXHg0585e8+
X-Received: by 2002:a05:622a:4c84:b0:50b:54e8:39a3 with SMTP id d75a77b69052e-50d3bb92d1emr11419271cf.2.1774985957355;
        Tue, 31 Mar 2026 12:39:17 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bcb86b9c6sm83566501cf.9.2026.03.31.12.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:16 -0700 (PDT)
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
Subject: [PATCH v3 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Tue, 31 Mar 2026 15:39:29 -0400
Message-ID: <20260331193939.40636-6-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101141-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8E8DE370A5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0



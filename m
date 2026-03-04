Return-Path: <linux-arm-msm+bounces-95443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CVOLO+OqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:58:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B8207513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0A2B3029647
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49E23DFC60;
	Wed,  4 Mar 2026 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdnBhTxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440C3A5E9A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654314; cv=none; b=DQVfiYeJbtGZgyLoaTfoJUcmoKqoHoJJ5qZ92CEDr0S+pz2zFiICIGXIorcBg1zcwwIIRfdfFyWcv2jOIngGKiOiX8WJY1YV0oeGyHu2Oi9EEThPCONPc4/laCfD+uiJTPqcW1cczqvJT9PluIx67nr5L6bnO/Oz4KlgySwLdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654314; c=relaxed/simple;
	bh=lR1IVDRMJkZXoDslp4/dph1T2GakLoRbrBddRQrqVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjgmiNhLWF+I7yceO46YIKlvc/Cj/1EDJ0Fo45INrBNBRcSkTMzq1b7qJVBSrfE4nALPoxpy0B021ChsYsZB32BVk3QXozbGEcfgGH2O78qTbmYRm3nv22ufMDmwOICfW3Rhbf1HzqNbzfL55hyOsNnjpl98MhFOLFA5Rz8+63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdnBhTxP; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb420fbb5dso430365085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654312; x=1773259112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=cdnBhTxPCJBXnwuCRxUefZS95lD/mleI3WbAJWQWAe9GYoccK5AWzhtdYXvxH7bqpz
         L69EXRMPuA8XjVUSV7GpuiCwAP69cgBwnJx27Fok7aoHspSCekeydoficMZZNv7Sllvz
         gC6IdSOvv9JbjNd2Z4xHCJ35gkqkuWSdkCE0t1662eIDz/zqPUaI6oe4e7uSak4u2csA
         TpjKoVqAEcaRMVJ3bv0k3FjeqgOWrV/eHAk5ZHIZGOZ4rrw7wJqXt14Fs4jSGYiMtoBg
         reWbiOZKNNxKdqhfMlFCZg8W1T0+YF1YThWriEU7eaj/kO3FdqZ6qecgQCPP+tMd4I5Y
         cDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654312; x=1773259112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=Jb3wh+pNEIie5oBjOvX5wbEod/OVw8hca4ZGnhuNsYz7RezMwEH/4wcLBNYgOkUycK
         bMAIPedkjGc6IxTxfQ4Mr0+viXKkkFGFRwqYxXA5Qr7tO04bzKHH6kmcGgJl5pRzK6VK
         7/0tXVFX2OcuWWCifwdFVvvkBXmq5YVZdYEuttCCUz7lD9jk/GndWgCUsKlZYpxlxasj
         3S1zQ5GilUt7omzuxBPHzPktVU8gh2oWlmt356kPO2QzmwEOTEXUA9q2i2yY14L1R2r5
         HqeX67S1sNbt1n6mOHE7BNuBKdN5mYJtj923x7kLmCN+LQl2ej82EDnYW6QUknlwOhcw
         8sBA==
X-Forwarded-Encrypted: i=1; AJvYcCWy8mMCmZi1BRZJEL1ELxQyjeVHPZkiERRiB8eNizAbIc4Hp3yVInvw0XDiR2glKmTBMDZWdJ83fFH0PYWl@vger.kernel.org
X-Gm-Message-State: AOJu0YzaP1PQwHZh/iuzY4fobPtj3WqruQFEquDuM8oLh7X//sePLGcs
	2U1i4SvoS48hAmRYFVSync3OYN9pjjTYa8WZJs4heOOPvglP2/LsszOO2eW9yw==
X-Gm-Gg: ATEYQzwpy4A6pXtdAk5mncfLVjCKA8BDWGfnXFdXi+PQKLVvr/s8sTjvYqUPIga09xp
	KgtHDrSYaLdh01omaAyr0Wr0aJwpayaaVcTOg1Npw3KpIQWsd4NIFD0OWnRx8bIebQNmO5ycbgn
	ZLecDPN0wmNG+JluBTyxLkMh+JHbTaR8oQI+c60ZFdjxiDS7WlqvqBJg02a2vEKI0KY59xCjYgi
	HPp17i0oHlHfE2ZBjWBmXG1zsM0w6Qi4oPISD6zaddx0Wj35E0e29gxZwuwU77wdihZjl9SA/BL
	TQjc0wj9oIQm+UPe+Fn5+uabHH/vJIUpFkAKXH9Py2qBSHouLqKsXKwdj3z0t7m7BERMfxYG5KS
	6w4QVUurrun5Rrvrn5zhVud/eMv1iXPGMO4CdMmdXiTckowPbXgosppw/iqSrGvdXROQFHBePvc
	NnI0iQpRv/PnkhcdYq8uWxo/jZog==
X-Received: by 2002:a05:622a:1647:b0:506:217e:b0e5 with SMTP id d75a77b69052e-508dae11dc3mr45067131cf.0.1772654312337;
        Wed, 04 Mar 2026 11:58:32 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm1678845585a.5.2026.03.04.11.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 04/11] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Wed,  4 Mar 2026 14:58:08 -0500
Message-ID: <20260304195815.52347-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BE8B8207513
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95443-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

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



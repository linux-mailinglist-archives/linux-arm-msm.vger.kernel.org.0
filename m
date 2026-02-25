Return-Path: <linux-arm-msm+bounces-94023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJldFwyNnmmPWAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:47:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FD41922A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CBB230ACF03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 05:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3C82D6E5A;
	Wed, 25 Feb 2026 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOCJCBBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904A2C15BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771998379; cv=none; b=XT59SrWBkjCfJeSHM3kjxgGL19ToR+lOJhh+Ob+ul6pc7+vuu48H1WvzIoe3PdzBHSZlg3kNsWAX7B6CBJ5C/r4Li751Yep2YUksFErL3AUjnAJld0i5NtpdedsEcoM6ZJkC5HPv+6j3i4Cuj28rZ9SRaxVuydMsG50pTnz7L8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771998379; c=relaxed/simple;
	bh=Oph1MiVl0LZG797TrmI5vXhHO5UUltZ+0w5/M+ZLDwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unXBTaGpAE2sB1SwQxoN5iB8+g3Dm/qRiLMUdmIWCGLaUANOXaWZKv1zq6I7j6Gi6rsDVCZLWMUJbIz1EIQZRZ676+WCEarJibPodlNI64OQlXWWQxHptreXZjeYj6KpV+pJnlMlylscjx0P5eMbcsZEUeqDH+lxvYMmQIn7T64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOCJCBBU; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a962230847so60414095ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 21:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771998376; x=1772603176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
        b=eOCJCBBUo894DYuag9Mv8xuj7VpJwVRfQpCADSAz1EOonpBiT/Ok0FkNizFOi1EWwG
         o4D9NP/W6KoG8qKHXxKwp+Sj8n0aygV3bkSLrQK9buVYuU56ee2sdyJzz6B6mvN+RMtr
         iUqNk4mhRA/7j88Ry9Jx8EtbptPeu5obVulzxzOnWq8g01moz3Ts6QhE60u6WY3PUSrj
         96m1vRTnoTDBV3O0FcynTKzUJi3MKzsj9wilNtGAjcKSfSVMMB9pbbr02WsD5bE8VBOd
         KWGrFO84eGV1gEWvnza0KiSLj3DlSkwAptzyc1+Ed6Hgq7kRqbQe8x8xxOBXtuNUYWa7
         F4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771998376; x=1772603176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
        b=g5z+8Na01VKmxdQk+0tyRjUUAljv1mBO0WzeajkFu8P7prFC5kI9p1a4K5pmaSIsFe
         gKm3fwyJyg0E8Fq9scs6mJUV5dakG5nIg2QeCMxP8EMRRvwY4AbsF2imVUUTN2vb2cSl
         wd7ouvmt0FR4v+pg9GyACMjHIKha1cHTeRr5TORdPdtFLgvfUPwG69ThbeXL274YXkoZ
         CAXrJjeRaNq3Rbt0i1R9L7EkRyTYffjx6lSbKTw7lCZ6JCl7N1kmQ6ewWiSO32PFcqP3
         wJE9rJsQOAiztDpa0UJIf+UtaTy6ZLKwCKBjh2wLejYFZJ39AmMTet2opVu66c4D7LZp
         mlLg==
X-Gm-Message-State: AOJu0YxMQmq/Id4KeG3YLsnBJd0D2wT/Yd1+tM9glok8jowh9ax+kAnd
	bcrZmZH4GH5DdT93aKPlDV+wIaaZKzL2QFv6dVxTym0h56kDSinRh+yb
X-Gm-Gg: ATEYQzz+s1pvkz6wYGWmMvOyItrUGtBWNtMZ/6ytEsFKi4FCCwbdYK1qeM+ljZjjoP9
	Qs+KHIzvnYD7eYdzJz7gfui/sHsns5rFuPKX7G0GRFbIAHAlU7G9/RUetZ2eOerjMOJ+/beSJOx
	aj5YRa6TQgQWjywvLzRdqGoCan4WZD6LVpPcHk505H3HqqG2pC7tsVz5hiNRzqP6OXAFJ64a5by
	SMhj+BxSv4fT0MhBJq08PC52C9pwCidPjjOTSOHdomNPPbzNRqJsP626ZbbOXDA8z5yDiF7++Zc
	Z1hu+gEsi+h85r4izSj+d3h/SUFtuluUgf2m3qxWbvM5j9nphHi7mJToNf1g0SREaDCTigQ7jNT
	8KEHQsQK8XfHcBN2ijzs+2tycOGOj24gRk/Inc0Rt3tsg3KP+I7+GYWRzo1qYBU70CL87GkrM1b
	j1nYhuGA==
X-Received: by 2002:a17:903:8cb:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ad744ea5d8mr125882705ad.27.1771998376243;
        Tue, 24 Feb 2026 21:46:16 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 21:46:15 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 3/5] dt-bindings: display: msm: Document DSI controller and DSI PHY on SC8280XP
Date: Wed, 25 Feb 2026 13:45:23 +0800
Message-ID: <20260225054525.6803-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225054525.6803-1-mitltlatltl@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B1FD41922A8
X-Rspamd-Action: no action

Document DSI controller and DSI phy on SC8280XP platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index af79406e1..a710cc84e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -50,6 +50,22 @@ patternProperties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-phy-5nm
+
 unevaluatedProperties: false
 
 examples:
@@ -129,6 +145,20 @@ examples:
                     };
                 };
 
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi1_in>;
+                    };
+                };
+
                 port@4 {
                     reg = <4>;
                     endpoint {
-- 
2.53.0



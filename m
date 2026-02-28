Return-Path: <linux-arm-msm+bounces-94584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FVWLm/Bomlx5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:20:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 721351C1FB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE306301B7BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 10:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A6441C2F4;
	Sat, 28 Feb 2026 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZY/IzRVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970941B378
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274029; cv=none; b=lqQ3cSo/3hup2DPBzhdvX/iDsgGhtfRREYiajIy6xQ8d5LlyNFUxYRzX2TLS2uONRGvLzR0fCzBVt5XKw57PMNgIdK54j2KAGgZu6VZ2jtMQJETno5K3tKqXqjGWkFo9ISf17ltK7yWszMWP90X6supn/k93gRfGQ6uG2QKfQ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274029; c=relaxed/simple;
	bh=Oph1MiVl0LZG797TrmI5vXhHO5UUltZ+0w5/M+ZLDwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kS7SFInGimgrJRUQvfigXVLkVx6h3yWrzc5T0hRgIEsRASeM13ttq21xlua0C39LmCWFol+iof+eUI/KM/YXUCYsFtiLjjgTfL5WqBd7nSp//WLEQux30LuzmUsQ9yJMkTl3S91gElGzuKl7OT2m0FpLOSDwNtF17ImGX/B/AF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZY/IzRVB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6e734ba92bso1380440a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772274028; x=1772878828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
        b=ZY/IzRVB+ecol+llFa/FNvYnwuDdldpCOKJKtQZydQ5s8S9/zAvOglEPpet0SEy265
         +dXWKwMAJ+DH8EuttmXkoZ1qTN/QaS0gPxZnbhKgGKYxlyafhLka8DILrGq/sbRXpvpj
         iqYFWQzbxKuQVLAVtsqnM4LCE57gIZlZZVMvI6Ks4skY2mLmCfcbf7JSgsEZ3kRBBGp/
         uLAwf/IyTK94qWsqn4AEdlVqr5Wd6DHECwmOsDoJiptKkSiAzBe+U058orRhR1oWQ2BF
         ceTxhKWi05JTZBd5GXqAoQco7EFrEaz9rd2vhxd5Sn6uyXJb4uzVX/ZMAldmWGPF9CIs
         8zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772274028; x=1772878828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
        b=lt8D3Q6RymeO3h0vAPr4K9oyF0BO2pziBv+N0c6lEGULzg4WaQXMO3NfvI/1kUUraM
         ghU4G0W+f0VSCReWeAbZ3BysBCbxNihhsK5uL/IM/yC8LUq+ZfEcYWKmTTkwEm9Ux7Eu
         uift06SHMqIBYlbV9gHxiz/4jy+FDOcdsbrtSV/3psWNKFR1+bsVi+QL3jZiLHXJSb16
         iU4WhJynS2+vDA5noS3Qw66fZDh1S+HIe6sgVLQppFH4hko3rckOUSlSN8PmhV2Yl5jJ
         S05I1L8cHBrEVx0wUdtwb2GIYa7AX46ITAnIvPVHkgzGPsUTdE3x2lSAkZ2QbsGshvzM
         8aPQ==
X-Gm-Message-State: AOJu0Yyt5RGCkMNjkMP0ZJIepdqGexvUKRTkI1RM1CdG54c5xCDTg7Yo
	C3dmdd/7KF3w4MtKPcqLzWCBQYIM5V3AGJYcLVIuUtCdcl/pMT2y6wXX
X-Gm-Gg: ATEYQzzHaEcadx1Bohe/oswNoyA4A70VOkSThECoK73DOuo98DZPwFAQNCInUfrcFI4
	n/zVcUq0hYkHQxqY4NB+9Nz426Y96KzC0r02Oq2dP/xD5TCLEr5hRxvk8fUUpHOrl3ZnO1lpvgF
	ptMKYPLkZqS6vuC61W/LqgD4u5FbJSsaDWZRTFAbYev/NCjweGrgZqpZwCNM8Ak+otqQCKgxLDS
	STzCC+wgzsioMg16jFV5dyfdm0nXtftJ1io2mtj6MjX9gAzIw37t4kHGunKQt3lMEPxDf9XKqX6
	CaaOuvf31oh0F4KIAWxOkJ+jrlcZcvJl0VDYdmNYkE1aqLksrWgm+6sABxDKAGMQnsPAclwBV6i
	lkskgml6gT6PoT4MBt9dFUcNalQd30pCRL/oVE2zseIoBUv78s1pg2b4+/xDioSt7C2UzIUrqVW
	GPXwUaefoLhsJUTcDj35UroQ==
X-Received: by 2002:a17:902:e30e:b0:2a9:5f11:3a26 with SMTP id d9443c01a7336-2ae2e3e7061mr41831665ad.7.1772274027740;
        Sat, 28 Feb 2026 02:20:27 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:20:27 -0800 (PST)
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
Subject: [PATCH v2 3/4] dt-bindings: display: msm: Document DSI controller and DSI PHY on SC8280XP
Date: Sat, 28 Feb 2026 18:19:06 +0800
Message-ID: <20260228101907.18043-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228101907.18043-1-mitltlatltl@gmail.com>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94584-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 721351C1FB4
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



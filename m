Return-Path: <linux-arm-msm+bounces-94611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2T85Kk/5omkZ8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:18:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937D1C3801
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CD6A302633D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734EF371048;
	Sat, 28 Feb 2026 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O53O3dgX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568622EA754
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288333; cv=none; b=fRYXWAGGik7aopOWRetaPvFjMUqL2bSRzu622Pk/Z0aoz/CNRyTQbK68AY+qJQc7ryC2TSchd0Pbxk33Xz1oGvJSDYW+imzxrrS75hiU8MOCm4Gqlfq7CryP6LZQqofk+yIUwQ5Qx/dVUZz307NnDgcUIpCfnsA/WljKs8zSQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288333; c=relaxed/simple;
	bh=Oph1MiVl0LZG797TrmI5vXhHO5UUltZ+0w5/M+ZLDwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMh157uzVN1pmMma4LowYrtU9tIxwd1Hy57AZweBtDPLAbvXZWpbEu+ZmYkUo3P5EOVcsbjB22DN3AO+MsFZdahGNjlVnE0eV2LTEnQ2uoVZ19JVaNTi4eYKVmEYexR8dTsSBGz/cxd9BqyhiH/k6iIkOKQhdTOMtRTk7lIazNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O53O3dgX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab232cc803so15429465ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772288332; x=1772893132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
        b=O53O3dgXpJ8T2iGl7doAHdFJ2y8RXyv9U38fxfzQRX/0hifoS3nug7KbRugyreFmKc
         uRWIBL1iilngk+cVjYpVGEOQrR0Z6sFHWRwFu1JOhcuJSw9A1LCoLBeYdZB4AJ4kW0Du
         QQ9o7UinmZRFqIcwDeoWHYWuJ3R9BHlYFIhRyK/VAmL9jBx2pF85HWdyhPmUX6gd6wml
         QMcLI6V+9UA2l2IQ/cGnv4CcVojnKbqfcHGFE8xWQoBc6UQcAun1b8VsC1WpZkF1qqas
         cdHdOh6nnOLFQUQcyNZZxWPcdEpDIpAj/ECF0ROfwgr2y1BkgBTrAHjY7PtQPCoAkqeh
         MEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288332; x=1772893132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
        b=EZFlTHKLfiqRDk9dofGUuj/1B77di++OIT773vGArZE3vF0milhoNI0NcYPfn+J12o
         8stcfKI0SIZD6i/SLGj+KLzPg/jclOqLcqTFapboNL/Aac3r3Ydqzb1x7kceRUXGeO6S
         zKhYtWiP3n2/a56UDPwbhyQgpsnp47uXQ9IOdmgmv94Dbqr8JqlcWTgGpgKPF/6z4W2z
         qExNS1GR4AHOug0hFMEJ9Wer9pcYzF8ut1cihA+sJekoWFcaEGc+IwWX7R0aSRiqryNz
         ODEUOkxwQQR1tiL564SOZgf9ovy9PVzUmYPmgNeXAezesgQfEz00ffwZ0Nh8Uo59VcvG
         8ZIg==
X-Gm-Message-State: AOJu0YyoVfv221oQzhT/hkAw6zyHT1mNkgPio0ap351VIQJcT1enEYtp
	2T8UWf0WfOAGNn1M2wK4PPsvcQ/wCxnBG/AL3ptHUHZbmrY6815Fz6hg
X-Gm-Gg: ATEYQzwv35qBKWXMgrwBdsIin+sIXgtvj4Xv2EduHlr7aHevfzJcmzF5+xliDx8VMkS
	kIJIKW57Bo9Mg4zn57vUzg7bt2J8hivJXuGqqjkEDw0DOcjbnRznVSf2kH4eE/jHmcObGKx8JTA
	myN43BeJBVnsaeHvlPRiQYT0LHaIkPbnyrMYHk8i2vuzCavfRHEezVPQNfjjE1MpEYHocy+YFto
	7ghe0iVJpCUGQ7SKm/Kzl6fShLGL3Qp/+Xw5wJe/PyiHkBhw822HHPlZKa+z541FHqdQQ8NrPAQ
	vU5RDJA3EkPPtcy9IuQJAagV/xX8EVbDn8rGnsbGvHlNmTapjwwI5EqCsaAecptK09PquBSNRjH
	IftA6+ylONlDtK/DacZoeroZrOHI0tJqQJ8E5F5FnZZbcqB7ASag22bdwAyfFeo4v4o39OYbUvJ
	jJndHHlauQwhgHQDpkzufDisBpy4jID/s=
X-Received: by 2002:a17:903:2f8c:b0:2aa:e570:6e6d with SMTP id d9443c01a7336-2ae2e4bcceemr62639155ad.40.1772288331616;
        Sat, 28 Feb 2026 06:18:51 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:18:51 -0800 (PST)
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
Subject: [PATCH v3 3/4] dt-bindings: display: msm: Document DSI controller and DSI PHY on SC8280XP
Date: Sat, 28 Feb 2026 22:17:14 +0800
Message-ID: <20260228141715.35307-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228141715.35307-1-mitltlatltl@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94611-lists,linux-arm-msm=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.4:email]
X-Rspamd-Queue-Id: 3937D1C3801
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



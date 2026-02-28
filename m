Return-Path: <linux-arm-msm+bounces-94583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJVWEWLBomls5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:20:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 795441C1F85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17F833014A34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 10:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCFB41B378;
	Sat, 28 Feb 2026 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcVqwmgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C241C2E3
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274014; cv=none; b=iWWuDUNkrruRO+vBraHTlxIsfpDVpzKGMcEgG5UglSEoYkSJTrU1LS4MuQSo1VmpkXdRzgxcLmxSViKa4lQL3CTOgSnxYAksSRIpPKtAzzdQiaCbCvYYvDCNLZ6OcKnRtrlGtTMcLkWmnylueC5q371E21G4m/uK9jEYDVvzi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274014; c=relaxed/simple;
	bh=1x+yEo+WJPeaUg2iqLovDoJtSFY7lrzzMEON//GNxJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqElch1eT2yVcfr6JlXBpHVWQ6ha9/D+7Gy9Ie0mGP7ozsqgibad+Vh8EwNlmPjMXMlFNXiD56rGClO3vIOvrk0JCUH/fVtMZJ/eB+hPMY4d5sCA0U3vh9ZKwOr56MeoinmXV3dFF9fsJYceLzUEJNwGZ9Cj0u4hR8pW1/vUsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcVqwmgI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad21f437eeso21900985ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 02:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772274012; x=1772878812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9q4+vzHqt/9/I9Wl5SgvfIE9/kAMERYBCx5YTj2gss=;
        b=ZcVqwmgIxhZzWYXhsCjUulWFRUFc0tZ7KR/SORwoUSA/YITsO0cm+tU6GzmQjz3H9G
         K+zboPxdkUHrqemz+NUheB/PF0U2/rmulwthfQWoDHvvX4ZV8FEtiW10pJIWKuMzddYZ
         N6a7dsodLuNFBnBaw0NCNqdTSy4zWU+aYMh7mcDxPvs11MveBi++jCGE6MyDA5fEIPAW
         o9ViVVPa3llw/HS9wPyA66nnOC15v6+hOrYPwUVl5mda8z73TSvdQVRKIh0joBGSnXx8
         d4Jl4+2LGRDqZpROK1b1ngbzSR1jovFYeHPY02qmKXv3Z7YFqwomEdSqgwG5qeA9wjeN
         ZKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772274012; x=1772878812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9q4+vzHqt/9/I9Wl5SgvfIE9/kAMERYBCx5YTj2gss=;
        b=YpZm8nNUt1jGSBiAR9uwgLSq9EJjtpJyjPoeVrI0goNGW0lKfU1AU9HhFEICr97N/B
         B7C4t7l/uKvR3+zGdPWr2SnPHavFDZVNusnMg7YDsad3n0Pk12XbfblcbcXkGJM8ZxSk
         YIyvHyQ3JVWPxAtalGJf0tPhJyIfL4Zt4jKKLnZEr3y80NbsBwhHiYGrkT4hPIcEWE51
         mJXIZx3Sx3njvdMqmnGg+nzDxphIZUFt6afcpnSMXJGh5TYlA07e09fp3hGyiumXDZ7A
         Vn6vVTgBSvKU5MafUXA5XDqh6hCITOGmUeP3pKveWHr5cW8/HyIuwYXCe7zvxNHRnQNe
         yL2A==
X-Gm-Message-State: AOJu0YwTXcCYm8v9PMvz6fkUzQ8Lo/5aBRhgnCtAKsb7u6MU0Jn/ZN2m
	Hp/NQsW2/bjIfxKEcPWhO3V9PIuUQ/ZIv1RyGqmmGaL34b+lmXNFgakz
X-Gm-Gg: ATEYQzx/BXO8sYHdRm4wq1cS9t/CfFpCCg6UZcb4mYv+sCoZpSYXf6wyj0g6vOqnFlA
	DWdX54YoS8b7g+rlHvqrjT6GzOR2RbwCohQhj47By4gGMFE7IdfLEF4a9nHlLxHd18tL+hUcxVo
	7XsstjWudoKH1TSwzI3i5pyqmeP3fX7t6LeoVjQXazi7vKXPp2xbqpU+boj1sI6wl4Q0vmvCzeT
	xqmq1VZ/Ojf9xd8krC6htEWMAB6ZP9Wx3phkexrk7JumTtYh4sU4xf9t+4bqMAIurZmmtEbfzvS
	Tb39x2URw52PBmMZUS/GKnWtW6/fcR3wuc90r96tNNxco6b/S2F2qA0qDZHdi00GzOublwkF0U+
	0WOKyGrhAGQnFidSKimQSeSktGyJKEEiaETa09oIc4LdEamZTE/GnLws6oMxVgBju3dTES6ppw6
	mv2IeO82QK7Z6j5nk2hZKCcrrPme/1XiXA
X-Received: by 2002:a17:903:2f46:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2adf78db637mr98480975ad.5.1772274012379;
        Sat, 28 Feb 2026 02:20:12 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:20:12 -0800 (PST)
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
Subject: [PATCH v2 2/4] dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
Date: Sat, 28 Feb 2026 18:19:05 +0800
Message-ID: <20260228101907.18043-3-mitltlatltl@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94583-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 795441C1F85
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same DSI version(2.5.1), then we
fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dab..617dd110d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
-- 
2.53.0



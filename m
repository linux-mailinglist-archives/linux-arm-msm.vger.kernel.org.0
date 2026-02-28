Return-Path: <linux-arm-msm+bounces-94609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKAlGEj5omn18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:18:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C81C37F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E5E0303AB51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD543033F4;
	Sat, 28 Feb 2026 14:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwe/vGj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748A1EA65
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288308; cv=none; b=ZW3lYi0i91J9q/W88TLIpyhF9j8ryxDcmzTWpAxufqgOMAOTxOjsgy7KDltYhZkqLZWPRluraEJLwcc8ASkYpWe+mrIDTEmsxtlEiuUgweAYt6GXho7DIiQVpjgZwp6OFkY7Oz6bY0/9h4O1mKscM5lqXQGr4BW/RQSmlyXH6sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288308; c=relaxed/simple;
	bh=RWQyBn1FSHsoa5cyD1Wi2Kj5838ft5vCv8mMkb3RhaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rqt2EFmzJcqlxkSE/gHRj0d51Afy7+6danW178K9/bO6QPWz8a7yRpCcd+dGGFGN/rxwCGB/gPe7pksCsbed1ssKFp4cFPJKBYscGLrX5Tq3bp2wsgRqcvfowL64CQze5t4G+IB70w8MeDPsIIyHB9wU5/1eCc3z9ImCMO/9H1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwe/vGj+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad9516a653so12926455ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772288307; x=1772893107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRK4ytllLFpElYCVfnglLAksecVZvWpzoSUosFjJO34=;
        b=Nwe/vGj+HsQTZRT6lTQVGxIpK8h0j1aCXrfWVWzYf6wecGWgJLLPuaGsVW3aQsyVgo
         geybBje1gUlxjPOHUISp0DZ4xQqrBXdPik633SxRs2gdwXgqQ72c3WRluzBzkw+3GYAi
         T9znMvDBHB0CEw5mpHmtQorcQ1GZw882/QWLQBrZCDmxaaUorBGpQDZb+A1AcgfW4KnR
         Wd9GdncXfBdCRBgFUwfc/utRHVkA6Ww4sZmn3vjsHVYyHoLFM3QWv9xEcXfsqve2rRvc
         /hfw4ECSkEcJGpX91vwZfsPm/XoSQ6Do6Xvl2fh5oIuS/Zhe71SCHUSe6Tip21AyWJij
         eg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288307; x=1772893107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IRK4ytllLFpElYCVfnglLAksecVZvWpzoSUosFjJO34=;
        b=WW7yPd84Y/PBEwW5/ULMna9B9iTtOlzdpQnMehUbznMh1x/9Fuiz0FLViYZe7gWwob
         bSPvByxUq/uRKRq+6rcc+cEgUbNBkGMaE+/Dy1SGnomwwWOcLIJYcfPZWCqpHlTOh7SS
         r8Gg+ki59IGgH6kWeA0db61LhY1kVrsXsxFrIe7tjyf7rKerbb8YgEmyDUlCRm8b17Jx
         BIPHPTkepKTZVdTp39l44TUnxdqaBUwbw/BEj98MbBcByz6SI+aiM8NYK8U/Ay0C2O6J
         t8IweG8GnxCtsgW3QAI76+N35D0EzVqtMuFSNRoa//pcs5GDAfEOnpdoBIo+ycUB7pfF
         thjw==
X-Gm-Message-State: AOJu0YyHxl9reYg7+0y3i1G6z9TAie/W7IITZCDzKUYxBTro/Dt9Tdv1
	aSbfDcq0ws8l2nwSx9lgdbZxoawNijBjdI5v+qCdosKnpQOI58Lg+6p3
X-Gm-Gg: ATEYQzzMiHZtlOI7tzlEeRlu23H7P86Av7k5sf7+x19Pi7btSdl2fYVuCaJEoVO0M2k
	zIh7LzFvqY0SsDSa92VjiCR+lYG+t0Mg/qLiZ58uJrvfOO1Q3jCLAIsLWI1gW8ezzaQueMMZ4wM
	ab+c85XEfVGcjad33q4xW4WqUipc5OZDBtXoHXerRA6UtX9yIT8lqHVLae7vrS58WwbmLBsOUUP
	cBSpNOZmxX5b4u/h+m5DbDzQ1xKzrTSIi6N4FSkOEocL9vcJ95Co1sKVouwpAilkL0yiRN4fQaG
	h7zO6iXz4TXsNx/Y3VkEhUHky3q1D/v4V4DwJOhCl62N3yNhZ6jO4gOFo0eEEci1amK/OwPBtNx
	HgKysjpUpyBscPMOQ5YL8BwIQbS7jPCU6cWYSlX54s0OPFKe9G3bkjXU/UsKqy/plpqDErjWqx5
	y+isZuburo+rm8rGg4RxVx
X-Received: by 2002:a17:902:f68d:b0:2ad:e535:36c5 with SMTP id d9443c01a7336-2ae2e4b55b9mr64065355ad.40.1772288306828;
        Sat, 28 Feb 2026 06:18:26 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:18:26 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Sat, 28 Feb 2026 22:17:12 +0800
Message-ID: <20260228141715.35307-2-mitltlatltl@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94609-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B11C81C37F8
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same values for the REVISION_ID
registers, then we fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4ab..532f37182 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm
+              - qcom,sc8280xp-dsi-phy-5nm
           - const: qcom,sa8775p-dsi-phy-5nm
 
   reg:
-- 
2.53.0



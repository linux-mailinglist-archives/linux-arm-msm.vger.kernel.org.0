Return-Path: <linux-arm-msm+bounces-94582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJH2Ll/Bomls5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:20:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521EA1C1F74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C8653031CDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 10:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951F241C2E3;
	Sat, 28 Feb 2026 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZfKwZAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFF37E318
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274000; cv=none; b=OhxKc09YAWIKNfCiCU1bo1DQXZVGcTI+K5JZPIJ/m+nJTC3yBcm+fIa6keYVu0cwTFMdnb6fffnyehEVAp1tpde6CZPjy5z+JMZF/8jNBe/yH/ffWFDVHaUPVeOYicuA/wkrXJBTd4jtjtwrPInv9G04ZMT9h8+UA8WVww0Dz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274000; c=relaxed/simple;
	bh=AuJh8jGKKBIFa1R0JpyMLud10fw6HX79HrAVZtflHTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BscLtgOLo06/EgEzs6Jts50ajcnYYNUK7L5my+f6iJOyTPWYDCJGmH0Mbi9FmDtPri4Udze+8b/y6xQgFFwfsSfHt9h575qebz1od8QpY9/vB8tX5UTErKQTsVqjuCYi+irfwfoNK0zn2JAeR1B1FVKJIsHULN9xUyFzOdlPnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZfKwZAt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad4d639db3so13972095ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772273999; x=1772878799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W65pIjxoHigfzhiWxc71VWPJjXP9A8eJwpMfks2udRU=;
        b=eZfKwZAtbGh3FJj2E3ZQLIuKKPP1NcTPJUtGXS4M/haBSGNNYmauL+oZmKjOf6FzOA
         OpD4MK95dKbqW2ry/ba6mVT7FFNA5UZCxPcozd167lm1VNBspp2XJVV+4fd5GdY5dnUt
         0mrds3XckHECJ9G4v4zeKJompjn8d05Qb5SqLDcKeGDUYVRrCUd3AOdCMuBV+Fz0CMXt
         k8ch9JLAFVhP03oVz+m6iX7fkg1KTF87khUY/RyhteHIYxqrBylXrvuYh6Oicou4uyM5
         73Xaa4ZYYKXZlr0ntSnP29TAr8zU5J/IU8p0e44GuC0t07/hVWwrprzBeOx2kEmUdOG6
         k+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772273999; x=1772878799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W65pIjxoHigfzhiWxc71VWPJjXP9A8eJwpMfks2udRU=;
        b=eVDepbC7LEngMrF9lFaFNUVpV6YlowogA6lnEQkvbqcJyzya/0zGHfF0qcxU6Aer+U
         QpJAeAE3MCsO/4dJMdTagw1A2HGkiLwjyijqZJDPweC4NrJJqqynJ5d45+3NXsU63BDr
         ZbPLideEIPHVBWkvj/NwCsDSO2mVkleQEFGQ2gGPFsjv2KJmkAvoaFvpIYuGCdGBmIgg
         OvZlsIHBpJjz8yjT7yN1z0XdGic2Pz6GXsHXMX6XGg7b6zh/y3x669gRsbsSy40CU7VT
         +8dk6fVfeckMAxw7qxCIutp08Y9AP/6NC1uVeUtDN8NWBOkfu8xr0ygJoRcGx9vDvcPD
         BPZw==
X-Gm-Message-State: AOJu0Yw+GEFdA7NlVMcVls91BmC6JiqugpABtyoxhKcJqxoZj7Jv9l56
	nSjoHD9p6ATr302SEkO48rLLWOwQAnZWgWzYSFA+5amBMaiyUlXxXiZB
X-Gm-Gg: ATEYQzzQ9Prz5MVLu2Qq3ByX0+kf4J5bCVHYyfXLTdBpxpisdw6Te5qTjUufOHfEV+t
	R9Pwt0tAHs683NH1SYh3QKB6j9EFuGklx1hXIrWn7Z7GioGcvFznfYgN4Msr5umAsoVQZtms93q
	0s55FkjZa9qF5dMl4EbN/bzqV4dfsnCVqVWyBXfG+jwqnqj5FVEtGUMzIP25ToONRir2w1EQ78U
	4+2XPmUPCFRp3zYMvKvyOb4G7PcBAEaiucRFjBAAmo/+NWG5DR/jk+QxM7/K/kx6pqWi/utRjpr
	TWCEnVEH3Een2Drt7GHaHCJGZOGxfMC8kFtoZmPQitcqEeo8M9T1y8AHLHc9QhFKAJWh0scWnLi
	eWQdIHy58JswDJG4sTMXxFI2jF/6y+PRHk8SR3ucBZ8bW8na0HnBwwFME8X5V9pxbSuzBCBPhQt
	nDyfGh1TtS3c9yr1RxInnh4w==
X-Received: by 2002:a17:903:2444:b0:2a2:f465:1271 with SMTP id d9443c01a7336-2ae2e4bd049mr57192275ad.44.1772273998754;
        Sat, 28 Feb 2026 02:19:58 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:19:58 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Sat, 28 Feb 2026 18:19:04 +0800
Message-ID: <20260228101907.18043-2-mitltlatltl@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94582-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 521EA1C1F74
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same values for the DSI PHY
REVISION_ID registers, then we fallback to SA8775P compatible.

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



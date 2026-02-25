Return-Path: <linux-arm-msm+bounces-94021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEYYIcaMnmltWAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:46:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D844919228B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DECAB307AA38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 05:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A758A2DECA1;
	Wed, 25 Feb 2026 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2P9nswb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC119E968
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771998360; cv=none; b=dUHS9gMdFyUOpSWUMTMg0/AKt4+7kh07dinADSdWDbMuUGU86U43Fmff1Qrnr9X3TVHUlgJVcq9HMsPCzC3YPHH1K+gxgVbDHgVu5RcevALyE/DImWSJ/U1f554O4BPJg6fabQOCyiDztyz+wYmNPv7I8GBmXOEozG4qnZpch5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771998360; c=relaxed/simple;
	bh=ChNvtHrH4EbYmvN5ivxVHMr2Av3mczy+XB4D5qEHwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oi7B1MP1IqssKCmeQoufE/q54Q4zvfRuMB0GgMXz2g0CiFNVTSKIjwx+ZclHTOKAl0Eammd08u5kRExTVOJlKhJyBqn6o64CBW1pUqQHq0Gw5BISc2cXBonPZDV0U12hvr0qkxGiEJETH6ovikkLZwAJdvQiX53lbzUxkozXHvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2P9nswb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaecf9c325so3451515ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 21:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771998357; x=1772603157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcwLimubQBfiLX8st4sqZlervVty0bzM6m9RsnitoWg=;
        b=W2P9nswbpjQOTBp88Gm3ul50souYSrbfd87s4nNLtOERgxphT0Ne7sdes3sPJ9+V0Q
         U9TMak5nlj5UfgPSIPLX/8uAMBhKWvDxsBM4mt9Wk8WSRuiwy8wATBpUMTW+55AZYVjE
         Vfg+YOb9MT58Ptiqarb4u8Q6F0mbzFOatsymXkzC+SylDlPZqKO4ii/CtKir6k9ytJDL
         vlHbVIoQiHGPzobQ8hWU0GtbhuRlxa2BlvZBF2wLiNOg4B1Q7ghkQLduZXaXpa11kbIN
         R48DcXJILCggv+dtYOpOb5dSCZFSoN5itxkTuVfKYilLpUm+onk0x+WBmhntKPvE2+Mt
         bS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771998357; x=1772603157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcwLimubQBfiLX8st4sqZlervVty0bzM6m9RsnitoWg=;
        b=JxM3dl568f+/r317CaN2d5OkxQS7jHxjKxJsjM1hYEYZARZRIFJcb23RTrby7Z+YY9
         WFzgq9pgj0qdWc1qFYS2ltint0Ukbmpx41FDVWSc4oY1/d3UR9QOa1DXShgkfoQgdMmK
         EdxuEP1jGS0hIs0OBE+zTeMYhzpA5AtsU9OX+AkrO8Yr0RMbcggYrqltjyoxN/na86V+
         1M+iUequCzmUa7KSj8lF80rFcWd5wX9ZILIxD+BM/RKR/TTay5obgb4UlBOIpzPFNZ/i
         Xip/ZTn/m6Det8I1VjZSAoZWFKw4nSK1OWn1AsO6Zwx82WimKmcEnw6G87sJKdQk18p0
         QESw==
X-Gm-Message-State: AOJu0Yzo9CSdwf9z/TDokvOiJf58f67XGMl6VEt/yM9OLUQGdlDti+oi
	JLfeICs6tXqVelAEYWaG0j4OJY0InlkU3f7G/NNKmGDTK8ZY9DjT50o2
X-Gm-Gg: ATEYQzx1LMRI39H6ia421RHEcNVkedHTjI78wc8nRLs9Ehs9qfVt9iJd10xTbshlZJA
	czjmLFvLKEYMhyWmQsyakEL6zJvFZwVFAjRQjFlh/8WfqGYQWiylwQUvPaBZSxl6NDjno9O6AZ4
	DYcd0KLw6g5cSzL8DoaFRy0jUsT8HO+NDUm4zHY1TSK493QiclcD/FU8U983fh9YHQVamSBknxQ
	Xs/hvsWJA/qAWQjZuo0oLO4+cFLuvAYs8qQqw7E8+0sw4TzBZCg5yK41hpWc5jnQPobsbTBP06e
	c2lAsqsfWt30pcdSYDb5I2JF4V1M9MmgrSjZsWc9Q3izv/Aq9l95OylP1LWoO8p7ELMZk1m4Iwx
	kG09/cSsHFZvAyPF2LkH6zVwPfq5QLK0dk+kPt7TUCG1KkGMSY2GadZ4QTsP9H+RyUzjlnzGda9
	/Lnk8VtZGlcW2yZuUe
X-Received: by 2002:a17:903:acb:b0:299:daf0:e044 with SMTP id d9443c01a7336-2adbdccd7a7mr24913605ad.18.1771998357542;
        Tue, 24 Feb 2026 21:45:57 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 21:45:57 -0800 (PST)
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
Subject: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Wed, 25 Feb 2026 13:45:21 +0800
Message-ID: <20260225054525.6803-2-mitltlatltl@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-94021-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D844919228B
X-Rspamd-Action: no action

Document DSI PHY on SC8280XP Platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4ab..9223af1f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm
+              - qcom,sc8280xp-dsi-phy-5nm
               - qcom,sm6375-dsi-phy-7nm
               - qcom,sm8350-dsi-phy-5nm
               - qcom,sm8450-dsi-phy-5nm
-- 
2.53.0



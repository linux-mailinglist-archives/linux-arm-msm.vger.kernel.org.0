Return-Path: <linux-arm-msm+bounces-96014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AqEHv8brWlzyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:49:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C522EC46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85D6C3014BCB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D614D20C00A;
	Sun,  8 Mar 2026 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlrdrirx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501B265CA6
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772952559; cv=none; b=Hx1rjR125Ub0gITswR82OoJIaQnTq9mmtaO9O/t2z0NU90y4gXR7dc77DGCc5OUjUfQ+HJMKSnivUJUSKfHrnJhfCldk7rTdlvkVNlwjng64S3bqIPBGhjmzhufz00tkcZpwl81SIrQB2kHwFR0RmjEu/0Tb6bdfXZWn0uZ3S8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772952559; c=relaxed/simple;
	bh=MVtGXnM7G3y491pqRyIdk6hoPyK5G7GpFrYYbOMqOEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hO3/m8S4YiRhZcHa6fqww/zG1cWLkJi42r3M0PxACpY+CoejA5NMnVPGj04CgC9z58NN5gQgXow8ZZ2d1dWNtpgSxB6gk6YJ8ZLrv0YS+uxGcMti+hpiRZ+DY/sMYpTzTSlL1kI3dK3HoZd08W3ulZIVGwNVK2yDXUU5h4+UvlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlrdrirx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae5636ab04so72146355ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 22:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772952558; x=1773557358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htFMdi0PCVoInWxpb9fYJOUgvIOz96/javA4OzFNMiI=;
        b=hlrdrirx8/SKkqdyDBE/R370ChlobXm9encGSRD0beFjuUB5dIx/tj45hJY/oJlz41
         wBbN0pdzqS9lqsxJ/L5aZAmBaCuQtVlq089vgfXi1iFCafWxGux3QoyWY6FJZl7MwcNz
         AWgyLoMzJ8nezZSFAV4P91j6nE8FMXcifPyC6tORudTbC9GlqRbk5yXmo2j4df1GNPC6
         yUBQwOFChCgy1xRyqe45OSZdIn6+7+c+LEIdjM3e1GZ0UZIWLQQFCEZQLY2YkV5ptwXm
         gyXfPM6qgjVD51T4phlZZC1oCO1joSSXfxOf97WG8c4YLn5VfjGs4vNj0TdjR6i+arIs
         9FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772952558; x=1773557358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htFMdi0PCVoInWxpb9fYJOUgvIOz96/javA4OzFNMiI=;
        b=iIvQWAhY0JwLpbBTl2GXi7mLbZ98Ft0Fb7O+78U6rWuOQjRAoG4PYEzjVDZoSf9H8y
         lnhzaCQH3fxXECTbROs6IlG2bCq9LrVcBWDwjTm68Jvq5LeIGvrYO9VBXgjFt8YRx3Xz
         mQX9FWqvAS54R6qjWZsbU/Dfv+95ssla8d6MsAuzeWKAz88rR3n4SOYopeJ6MJXzRqdo
         WhRZu43uTHUThnbLohEB7t0zbOmAkHqQq6jQLgCV3GmNu5MXpJJXD/MC0SlsFLrwno0p
         8uBgh+7whEP+CNVLj03Q/XVdCE2SADH0fhYxZ9PgYza0PY1p9w4JDD5WWBfudxAIw6/s
         dD5w==
X-Gm-Message-State: AOJu0YwkPipvuL9kekiA+d5wjz8WLKw0igSp+0V3hp2R/yLP1PmbATSN
	9ihimtQnIT1T5kWTv9ZpGIyGxw4LPlhDbOsTfiY88c7fG+BVJ/C2nYu3
X-Gm-Gg: ATEYQzx/psv+uqqIEm9Tf0mgq9Y6YumtEpa/Yq5XnOK9kODjtUx2U0iKFm0ZY0CDnE9
	y7g5oZFLr7RzONLO8JQNw9GvyByC4or3PoEiSjcTy712h21srbUKnNYoZmMv+m+lSZ/47vGrCwP
	cQgBv+ObVeWvR4QEdplndRC3LEViZzjdnDwDZucquKSYWgXI2c6SCANBk3BtfW7DmpDFGzbucYu
	GVSBILRcvVvAOTOBmzkeXXiBBTLgnQMvyyG2/2B1pYWL/LjxRFRwmcajHQNFxI7GJK/UVhE+1g5
	CT9j17b6D+iidyUx9mNM7ujpf8/mJ+Bd7YJfLCDXJBUK4o7zFLDjXpag2X00BnZMs2LIS3yO/vb
	fmVOU5lUucLQAnaoHjzhNrATe0Jto80IQ4VFSsFePRNn2dxf2Uxz2vLQoaGhoVX39QI7x/64qvU
	parH6jeicZ6dOHEgdONsfpg1u6CgUz
X-Received: by 2002:a17:902:c401:b0:2ae:4f15:1aba with SMTP id d9443c01a7336-2ae82443f7cmr78483015ad.30.1772952558001;
        Sat, 07 Mar 2026 22:49:18 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:49:17 -0800 (PST)
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
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Sun,  8 Mar 2026 14:48:32 +0800
Message-ID: <20260308064835.479356-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 020C522EC46
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96014-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same values for the REVISION_ID
registers, then we fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4: There were no changes to the patch.
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf..532f371829 100644
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



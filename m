Return-Path: <linux-arm-msm+bounces-95464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKz7InK7qGlbwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:08:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F10208DCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07201304C611
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 23:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669B6382366;
	Wed,  4 Mar 2026 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJRyUQDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10113793A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 23:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665615; cv=none; b=L6fM8JzQnt7XTUXqIgLJBhKzGR8bqnbaOoicjU/MxgfL9w3r/3URG+KtlRmP16j9ceItj3/cyZ7OlfIEuE5vJzQQ2aigHrG1DYzCi7XB6SgRNtbrlRAiBH9uL+HhsZXux8tNQJ2hh4gYZzrn1b+HKAkFpmLfkeju8QwgCjK1YcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665615; c=relaxed/simple;
	bh=3mXMuLOxk8zLGokqx2S/V/n1q9jDGACUh/JO53uci0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qD0vVsGuUqM7hCqNxMesKljAkwQ+4wlxulke0yChxeieNvycPt2puKQgp8n0FNBLD1OqLIJE6XMBkMRNNjg0nASLE1C0sNaWTtYC9wB758QfyCbBdbnS5Zuge0YXunulgamK4Z6FcYm9u/C9vKGWZhhi0cpvOVLPNO4ktDToofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJRyUQDc; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82976220e97so649331b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772665613; x=1773270413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nuwkc66SGtvVybuj3enJtzvT05yj+40BgPg9Oazhc0c=;
        b=bJRyUQDcBdGxL7RSsjLNAesCp28oZ/y18Gd4lwjtPe4naNgZ2hiDmdUEKxXIBFZznb
         yP4rki6uuEdCz+QlzgAvs/Hy7wCKooQDb8S+Ogyrb3D3HgOcYlJb9tW+nhbei9jGkJRu
         o3ZkD6mgUdiPlhciwdpttLSUGr1+b9r9s4IwlJp4Sd9IRUoIRi884r/CaM4XASm2mlpm
         R//mg0/TmpHHYqXq7kZ92qpCPfoFRXVsZUYe1ZWqRU4j5dpwC2F0cFKWymfw03rdl4SQ
         dhTeAZ65yaB3AnUwGQleJe4ljS+RfFTD7pOHFNmTYC9czFYZwfc+wVzgn2Xy9miEjXvs
         OuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665613; x=1773270413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nuwkc66SGtvVybuj3enJtzvT05yj+40BgPg9Oazhc0c=;
        b=E6vvJWDvyD4PLKcOvv+1kiXhBig3EL3heREkfjYsz/6x8Mm7HCarT7416suo0rvK88
         hSU285L30QZMHtubEyN2/gSLTorG+W8mYrnRceKhS7CsFa2/3i/cOHzPUEfvwa9e+NSr
         hcGTHQm5qpEg5etHtmhyH5rRzHoc2ETkWMqJe6Rs09eqi7nwGGoHIxU2EyrgQKK3RCWC
         RF9OIIBBoPeSkaUpZzv3q3cPcQlzNZqqNx/gsobXeZ8rBH8NofGwY80jzGUBCJOCBDsr
         gLX6kwd5GOxSllZeZNk9Iz+ZQZBzB9Odc8hBgTX4s73dW842iMS8+KoaVJkerEG1HRGU
         +eRg==
X-Forwarded-Encrypted: i=1; AJvYcCWqxY5XmqwRTJ28GUxhj6o1oQkgJrcdKVak4R5K9EY6HnC1lnqVQfShDqt3656nf5Bb5DYwIcO85M2I5jjL@vger.kernel.org
X-Gm-Message-State: AOJu0YyU8e/Le++WLq0PJ9DJYqupEmyxy7fF8QD0Xbacux0H8EhYSLLp
	VG8xuSadoFM5TpDj2V2xMezCGOrYhg6V14rziQpm9Tj5NM4TQKzWst21
X-Gm-Gg: ATEYQzz2PGGY7SnAk5sGRrUPMqtQf2jL9mF3V3XtUE0RuqkvCK0860XEjxblXHSMvoc
	kvh8ObRAX7JEkLCmPrHZVZyv2dmoWrtEd5/jwv+7sOpegSy42ySAYZGTbz15G5MycOXsSTGyRaC
	rSr7i3UaZmL9Aa7ov2w5XKdwYQ/kaT4iLgob8qTcBmlAYwxhXyLWlbZ88MgqBUfCrSxu/H12CDV
	8fxOnFNDLer5OcoD0hMxDTd7BSYNVvC0uOhFICVr9oMtQvpVErTSao5PeYEPc4g0gbgj8RSQ6Xu
	RKOsB6xZtOHLMexg9QpkVnkVj5EPQY4jPNpTABr0o9zzH53/uzYHlgwaBE2NC7qbGbP85Uqyyxd
	XgErZD6Ax4hGbelpl0pYQ8xkWvJwOUXy1gJPSilgyQl/4TWgsiBQQolAsQU4JbQm0/IWvCllQEB
	6QHyUmVAsXnPDxBsTQoCfQi6Uy2ui/IZxr0TvAba2TJLnUUg9kRsy0qw==
X-Received: by 2002:a05:6a00:94c5:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-82972d5395amr2252997b3a.66.1772665613175;
        Wed, 04 Mar 2026 15:06:53 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm20511087b3a.16.2026.03.04.15.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:06:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] phy: qualcomm: usb-hs-28nm: use flex array
Date: Wed,  4 Mar 2026 15:06:36 -0800
Message-ID: <20260304230636.27808-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 37F10208DCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95464-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Allows simplifying allocation to a single kzalloc call.

Also allows using __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
index a52a9bf13b75..b2ea038a8f25 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
@@ -56,13 +56,13 @@ struct hsphy_data {
 
 struct hsphy_priv {
 	void __iomem *base;
-	struct clk_bulk_data *clks;
 	int num_clks;
 	struct reset_control *phy_reset;
 	struct reset_control *por_reset;
 	struct regulator_bulk_data vregs[VREG_NUM];
 	const struct hsphy_data *data;
 	enum phy_mode mode;
+	struct clk_bulk_data clks[] __counted_by(num_clks);
 };
 
 static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
@@ -309,23 +309,21 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	struct phy_provider *provider;
 	struct hsphy_priv *priv;
 	struct phy *phy;
+	size_t size;
 	int ret;
 	int i;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	size = ARRAY_SIZE(qcom_snps_hsphy_clks);
+	priv = devm_kzalloc(dev, struct_size(priv, clks, size), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->num_clks = size;
+
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->num_clks = ARRAY_SIZE(qcom_snps_hsphy_clks);
-	priv->clks = devm_kcalloc(dev, priv->num_clks, sizeof(*priv->clks),
-				  GFP_KERNEL);
-	if (!priv->clks)
-		return -ENOMEM;
-
 	for (i = 0; i < priv->num_clks; i++)
 		priv->clks[i].id = qcom_snps_hsphy_clks[i];
 
-- 
2.53.0



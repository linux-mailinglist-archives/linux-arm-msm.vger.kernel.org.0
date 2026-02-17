Return-Path: <linux-arm-msm+bounces-93026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPTSF5mxk2kK7wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:08:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DF148345
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3A10300EC97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43501A5BB4;
	Tue, 17 Feb 2026 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWu6N/v2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4577184524
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771286934; cv=none; b=bJMdkl6dYw+zE39hPGcrQIJ9P8g8Ip3fR8+ArAkZc0AXh2afaGzTI032hALRJ6dj9RdvPjwMNibUFxMaOsH4U0jk29mVl2V2WR6s3CXgwqTjaCJDqW6IQafhnddBz85hkz4VlM5elJKvr0WVY0lLTNDwzITVqFcOnpkEBsojCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771286934; c=relaxed/simple;
	bh=Mwr9xilZhP1ekJ4/MGltrG/12/eSsM6/Bnf15Y+na6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCf/G64eMk/ya/3cOaz7ryelLG2an/3NKcuYJOMg9QBK4VjzeqcNvNdTpZcE7MPNZrFf6mF+gjn3eE3JvGLYpYTNpnCiYk5C5W2PkSKuEpLwqZrZV2tDIPd7IL0GIABQ19BtCf1/f2UcqmqR8hgfHkilTZR6Rb1V14h1W5BrKE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWu6N/v2; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50334dd44d2so44795111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771286932; x=1771891732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfrCcwMt9Miameh+PUap2dL04J6Ma+4K1r37+UmYok0=;
        b=GWu6N/v2SXCrufTa61Po94dyh8+klyc7cICf6wsapVzCvNLcIqdkWoW++14krGy7na
         sSt7HobiQsprVretv2qJjx9EUo6qwvUSsPHUN7oI2lYR0UGMgBbypF/sYThbEFSFqhEe
         us/936NWLUL/xkdWo3uvb3mw/8dodQM1Pzq5qmz7WIpgmLF0DftksrheYYls1RL+h1Id
         dwN0JuN3vH/zmQhcdP0GpjU1sg3QWHr7hAX7xd8WFUFB75F2ggEZvvwB6KEPr7lR5+fl
         d/A/acZtaqtY7FBeov4R5xIO57aVKqscrKxn0DJ1vjiPdjFdaUwQsBwJIcRWCa6f9vgT
         4qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771286932; x=1771891732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfrCcwMt9Miameh+PUap2dL04J6Ma+4K1r37+UmYok0=;
        b=nHTIzq4+AIJ+RLCQXxqgEuBpT9n7yJA3gVay9BUHw64c4pHMNRnQU0VMVHsN0U+MrL
         cC9CDsnrfDSSY1iF+V6FDAYnMzOEfzxzkqs0UUi99KMJhWmgzZ7NrMzBQ6NX6OxKk0wg
         HKhRw5dhE2RDzOgz5aIkyn3yg8a9xIal1X8UD9i1+cocUMzSroW/IKaBswfdfGCEFvq1
         a7mBsGaBRSFrq7Ld77qH1pH3EMPcYZyhA25nGXtEao9e+pnbYNgUOVjz6ZYFNKcCciFO
         0yYGtYxKnuRBKAj0cRkWDdXgLNxn3As9baKkXIOB/dY9uKXvHzgpOmpGG9gg3Hc1MclJ
         ipgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw6ajZ676HYJprZLKeL1y2+EAmaX/H6bzBWhGZNL+BPqW0i7TFnGzNYC2ykUMpWUI4H+aEstREL42HTLY0@vger.kernel.org
X-Gm-Message-State: AOJu0YxyJQPcWQwUSxAt9xd/IYYiGJmlE1fIlx8/1akHkyV4gOOcQpsN
	orQNEtuDXPHs+uz4pXUHMgb1OKUNhavJXoTSrJgJ75oFame8IGJcflmW
X-Gm-Gg: AZuq6aLK9NjJDJqBo4B6Vkb/m11uD+A6PDzXE+lGkTPpiDoU9iyt6FhFi6a4ECYoEiA
	yfIEkBBZl1IAh82uWo+57pBS3ZRRHiSrcJ57ysZKtj+NBLQjt744RdjgjlLxnx4mQaNZGHceLUO
	3S+o8dfwJsPzMzIZIQiYh8//xxENCmXiIehO3yOCO7xw/bjHtJZ9Ye2RxY1zjE+ucEpiCKqg4mr
	JVBjWH7AohyIHI3/GHwE3r/ZNDetBbg3GacbS4oRgEtP6YQH1FYhTFi91rkZeCq8fdnG3IEZWZP
	ccmFD0OjbjwahJ/tl9lfOPXsdBLCK826n0dN10WRdapWVv7lyylxx9j6THcM7nU4H5PDUCUKpzx
	PuRtB81rEubr1z6ksSBOcVAJfih5yPiGBw4y5QdBtXQuAe3fWNPaKQGwhYOVb+MiBl8OVLVa39c
	FpiJUsqMf3nF2W2Tz+SDNIPcSa5Gw4pQ==
X-Received: by 2002:ac8:5d46:0:b0:501:17a9:5ff5 with SMTP id d75a77b69052e-506b3fa2151mr131086721cf.21.1771286932589;
        Mon, 16 Feb 2026 16:08:52 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb45f13a61sm857362585a.7.2026.02.16.16.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:08:52 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/6] dt-bindings: panel-simple-dsi: add nt37700f compatible
Date: Mon, 16 Feb 2026 19:08:50 -0500
Message-ID: <20260217000854.131242-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93026-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: D31DF148345
X-Rspamd-Action: no action

Add the compatible for the NT37700F panel found on the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 8d668979b62d..e56865d2771b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -49,6 +49,8 @@ properties:
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
       - lincolntech,lcd197
+        # Novatek NT37700F 1080x2160 AMOLED panel
+      - novatek,nt37700f
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
-- 
2.53.0



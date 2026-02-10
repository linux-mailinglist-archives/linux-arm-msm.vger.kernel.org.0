Return-Path: <linux-arm-msm+bounces-92389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N3yLMOYimkvMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A278E1164FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE247300D4D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8041F09AD;
	Tue, 10 Feb 2026 02:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+OmHyoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F72DF3EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690754; cv=none; b=HOCwcYj+RmrwlDXTnX1jimM76hXV94rcbpyNXE2YWHickHwa3i+9N5h1amq5ngkvTUZjEHS3+pKTvTdGEHZjgdaX09FfaqzWDgl71FbcGp/ui4jrxFQBIIvkIj/NTiJ6L082BN2itYgompFLxVJLTSFXFRVHROWVfbIKooXsgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690754; c=relaxed/simple;
	bh=CGVgRF93HcW2AHUPhAOHv6DbXwIP/SjikR/DSk5SQ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbVT4Kt/2fV/wkiyRnfjsqA5Ynrk2zFukM+sOqSSj5KDTIZ6tEfSKNiXfQo5pfSog6G0lVSMM0dDw7YlfTI+OJLlm/AsPyw5C5PZSqNADnS1xkHqLzyhHlNl0xGTDMvjDtfScS2cI943FyV/2u0XYmDrVbeGVOD6/jh9YWURP8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+OmHyoW; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-896f5af3d8aso4513766d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770690750; x=1771295550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwMu+F72u7N7yLtX52ANx3B33oLmrGPjxc879zIDdAs=;
        b=Y+OmHyoWGEEtBIsKheYl6+IRWfuFCxqh5YpxMI65/hE53s9mYwhbh723r9Yrc0wCiO
         YFq395lUTp9GD6l3zuQdpST9Rpk0PQel/fKYZp2F9pB3wAyuKZR/i9jPsX3PFMa0ZCeA
         a1NFGZoVIGxWAbcQl7Q8Cf1Xz6IvK77TCuDNbPSTbblMhYOTG/MiY+go6e1xbr4kVMCP
         rHgqB4FyjYd5xAL2xmS2cSRbMsezqAxwWIN20yKl7p9YsQ+X0A8n8aqW3UaLpSbyp4gP
         QyaczJlPiwCBJfRJq9Ut1Fg9XnE4rX+KuOYQlK7cSIygVp3DF4zOJ1U5WRhCPDCj/ODq
         XBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770690750; x=1771295550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwMu+F72u7N7yLtX52ANx3B33oLmrGPjxc879zIDdAs=;
        b=weDVdtBRTIzn0hquQVbNHcqK8RNv4aUezTrrGF+dGWHCLxxpummFxr2fvas87D7AdB
         0AIN3jTAsJldQwlAEY5/El5WADAF7G+F3qk+4uO/YTkJjYRlY6NKrmcVl6o0Fi2wOKoJ
         kvQQPviIYA1RerTbSHvLmGYKJJf9BBHg/9FIzAKh3j8HJRx7/Mg4/shKwQWQYIghQreq
         9zO6LUbVnJlcO+mXFLeDgrxbIekroxiz21UPspoBEZWjGl+WzDttmZHLOvXNcyOxNJdu
         EVF8wEimgJJx+P+GSltvpYKUzFTzD0tRFO7uhORjJ4S7MKfGPJkn7ky5YZkGFz4tI+Bm
         zrLw==
X-Forwarded-Encrypted: i=1; AJvYcCXE6ckwFeWb109c1UZuwlc59CPvCskPChy+JHk8t6BC9DR1VFPUZBljKgdeiTdJfvitCwNLhVe6NCmvyBh9@vger.kernel.org
X-Gm-Message-State: AOJu0YxnrpdA3uUq3kou15tYJdYm8XOnktyKssyOwDjvSntJqSrpeAGW
	4vKKsxO1poZkZApkPVngVPvj/Q6tGtjZ3qgsvaGmJJZqYs2Q3B0da9w1
X-Gm-Gg: AZuq6aKKN9brkkUoarxXn7cHoBlhFCa4gjKqyIohkA9spKaTLQwbcPp5UFgUeLEXlqy
	wYCver0DHvGmHNmwWdos719QcDvHbBPGdOe6uq7qD+M6JbPcAUE2VMxyPDSIRwjLPbxSOIkkQ7Y
	ZBHOSjGblc53B9mAoLO7wXMLNviBi0LZOql17MoNp0ovWyIwl/VSNdruSxROWLecdMLE/ZuIEhI
	F8tfglDYk/sub9afrEcYeCd26Qfy2AcpvWgHE928Pco5GpZVqYb4zJI0SicN82V3LBy+MH/zMY3
	nfe8ElDiBrDCX5dKgwL4N1kDea/8N7Y8NH8JJvErdAx2MIpUgOzwzIR5s/QsGiLwss/WWeKDgXe
	WXoeD8Uem8dr12726it63LJGtBo7EpZB82iIV6tayGqWQY95OtPFMRGV0ACrcSkSZTrunF8Ljl8
	GFpKEW8kBvFi5q9EjF2gixjg9ISkpKzUPrnBfoekmjuAZvSWjDxcP5mF8p/JKnZeI9nWx2lxRCU
	DSL3prkjhMMAfo=
X-Received: by 2002:ad4:5c8c:0:b0:894:610c:3a22 with SMTP id 6a1803df08f44-8953c805d13mr218451556d6.20.1770690750570;
        Mon, 09 Feb 2026 18:32:30 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50640c60b3csm90470001cf.8.2026.02.09.18.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:32:29 -0800 (PST)
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
Subject: [PATCH 2/6] dt-bindings: panel-simple-dsi: add nt37700f compatible
Date: Mon,  9 Feb 2026 21:32:56 -0500
Message-ID: <20260210023300.15785-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92389-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A278E1164FB
X-Rspamd-Action: no action

Add the compatible for the NT37700F panel found on the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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



Return-Path: <linux-arm-msm+bounces-96418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGtdAxRlr2koXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:25:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980C24301F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DA0230234EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DFC1FDA61;
	Tue, 10 Mar 2026 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msRV29QA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2D1F30A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102350; cv=none; b=lVarjaBnB0HUzvTstRRJL0jtXjvoaU7EuvBfqOuGX0NnS23I1h/PUhTFvmDyWdV16Z9Hu9oW5dxTplYTweMtKCUoq4Qry9uOpuM3eeXwnbuXzfyh4pg28HJZl14U6Fhb3a7uIhjNlfA/T2EZ1pY1Faf4qQ9la7J3dW7nbYvRJb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102350; c=relaxed/simple;
	bh=e/7gEHtpwiXu5WZ4Uimad/U9BkJniCf8g0CLOuaSlJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cX6SNuJlRbqrjID/PoH4lqlssbib0Wz/Vij+x1wKvgXVGU9UwmJuAI/nTLky21bRncCFTkQpQiBPwaJL+RxtyKS3gNkpHR1ZM1eVbyIWRr6evpRmnd41dDlOWoDXJ/7rwLv4ZQDnUMyGnBBI4kOqP20arbBfUIWOfHe96Y6pDIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msRV29QA; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cd7ecedf2cso204525685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102348; x=1773707148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFBNJW1MGZfGu0QG/7Mnk9/1KLG5NOJNUh2Yxtb+sgE=;
        b=msRV29QAEVO1XQ5Lc9fkcW7yEAIehT5GQkGm+I0P3eJFE4pvKgsBWLG8coWW0jp5e7
         HwDZNia65IJdJZBN48AoLbaDB3ybr8KV9LZ3vqgeEqQkzVadR8RQVrNYtKwMqeJkfdIe
         DTH0fMHFEP+vR4ZOZRoTYl9oHr+J19OA0oJS9UhAVy2NfXnY34T8SN7Pvatdyx1XbXFd
         VtjGQbGcoDHEjYNIHtBI+2K3ZSIS3zBz0pzcpHwo7EXyncSTqa58SQF7gOh3EhiTICX1
         vX1iS2XFguHnoq04/JYlBYbCHANidFRjc8VpyzwqEyVRnKAplSPAspnOd8iUU2pndAQx
         vI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102348; x=1773707148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFBNJW1MGZfGu0QG/7Mnk9/1KLG5NOJNUh2Yxtb+sgE=;
        b=KlhRelNiXAAoX9K9rLo7WxZqlVlWtExz5fNyYDAwEhL8Yel/B1UU96gZ+ougB8ordj
         cqVZIHm+C4io15EzVjTQ7UZLgmKPJ5JOrw0FHivh+zFrsr5JwfJ343T6PClDg8xhwn4z
         OBtxcXilcpiT6YbeJNRZxtqK8hZ8UKgQQzkfsENhjbcZO1n6TV9TeOC38ObTg7Wc6ssP
         DDz9ki4b6YxooxAFJhjHnWzeJuYFElG80eV6rQ+mylZxoMVQuyQC0t/fl8BiV2pMgOVB
         xSNtxr6fAGlkN8sve/A2unEedWS3borNRE34Fb9QcDwu5SyHPSiZjsKXPM0MonfWnk6R
         wwyw==
X-Forwarded-Encrypted: i=1; AJvYcCWPgKKA/B/ucdj8ZLQOPoBxEYBOsiy76/+kk1gBk8zyWZ9JbmyI35NtM/QnVmbs8+T/GzWfO1cnV1hu9JZu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2+8B/VjMSeIlIyrZKjuQ+UXLBRDEbY6CftLeOxkAiT+6QvEGs
	SWIVaEYZESvwVuA0qXRR36Gwe0CmPby5zrF7W8U3QrCdMpQOfU3mLKeC
X-Gm-Gg: ATEYQzxABwrNdAO7jaU3GN+NexZlC1dPwmZM3vFnYxW+YHelamV9ZHNHeknajyRugcN
	KAKqCwS1juTbhMIfSAb75k9aKGOWKn1sr1Q6xBo+Hx0LHEVpSMTmxWZqsq4YtXZdMWCLbuD17yo
	LwddPndZLADFg3OAmy45OHblKl9qH8bMSJJ6bBYm6xqCOYPJdOAKXIKE629ZOc+5GbukVJkhKM9
	C7HGrC5swwHhKuoTieGeOKV6nn+TfIbOc9nrsYNLtWX8sQGsYIgdQtBu3tIqi3z+Ly4W+gNlH4n
	AtnDA8FqxxF8sTR5yQC+6hF8/kM7ddChsx7KvskfSIvvvk1GKOgZUCCVuBGwpuM70SI3QjKIV9E
	DVrVTUmetTMRBjd/6eeEq5LaicGFatsL0W0/ucc0oBKNctGeEfNpYvgWO46kyiNoB5dO6s33phO
	YwAp+HMy7GaQr3aSNDBp/446dqgy/2uqtMt4GaTHjBWiRsCyHsfiGVkxgIfDS43Hpi3arhZhtdR
	w/TCI2ix6dupD8=
X-Received: by 2002:a05:620a:4694:b0:8cd:8635:c04f with SMTP id af79cd13be357-8cd8635c58emr707782385a.78.1773102348291;
        Mon, 09 Mar 2026 17:25:48 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7ea02664sm462704385a.5.2026.03.09.17.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:25:47 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: panel-simple-dsi: add nt37700f compatible
Date: Mon,  9 Mar 2026 20:26:03 -0400
Message-ID: <20260310002606.16413-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310002606.16413-1-mailingradian@gmail.com>
References: <20260310002606.16413-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7980C24301F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96418-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Add the compatible for the NT37700F panel found on the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 2f90c887b7b8..cc8d795df732 100644
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



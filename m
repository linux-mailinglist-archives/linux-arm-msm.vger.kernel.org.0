Return-Path: <linux-arm-msm+bounces-92367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLa5Cs6Nimm6LwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:45:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 863991160D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2552330107ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 01:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EAE35898;
	Tue, 10 Feb 2026 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXJUmduc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560052773E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687942; cv=none; b=dopl/oyVF6/LoYoUGNS8BXXnAlKvLczc9KZ6s1uVGlsoJnst87hmOXquRjEamiq+9dM0CWeBZ+EBx3q2+Op7Wevvt+HHImrPJ/qA676ORvN1UNbKPyreBFJf9hFzL7LshCdoTjD9ly6t+xGe1ZLhnveDG3oaGLk73iFEmtx6mUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687942; c=relaxed/simple;
	bh=pp+Ua6cMWDlekpgxD5YUJxTFrWxLxije2lleE5h3ptk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=di+ehctlAcyDwtyH0jl0OjJgja/SjQpdxnXZozJkv4lPa02MrVrhsy+qK1ShUgHI3HbXYUmw+vXlIxlxIWJ4cWCbQR2izcAWWLrAcey6cQWZGdVEisacfYBpJwUoXeWWPoTgRuEyRp8nLskJc39Rl6SgO3+69csVOAXizGrCE3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXJUmduc; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6a50c17fdso368972685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 17:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770687939; x=1771292739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qZS6xma+Zqre7AlmNOzN/FqfjaONWCLXqsAywPf9Rk=;
        b=lXJUmducuoBahaCMu2pyzmevJDgsyDZJjWaFgtyJ64ghAKu/fjf49Gh+VtuS8GkMRX
         KdG4c8mbHk0AVeKbh4E6Bl0qbQ2SolkLJ5FvCIjKE+OJw1YlYDs9YZOKuTVBI0SoSCdc
         xO8S2fcC9U7rWVATpAXjaNFP3IghvlYjBwOcR1Cd4MXPxwg9/pjS37UDN9LzPN+2Z62i
         kw0w11Fywdsp/zPJ2eTFFsuk+ygg0Hdt4hSChrf7jQ25Cxo5NH3rST5lrO78XQdkLwAB
         SljeNADNSh8SBasrNBonUm2czjvxXIztArpim71i4hWN/QVQvQFd2QU/3mluuWEW1zE/
         hBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770687939; x=1771292739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qZS6xma+Zqre7AlmNOzN/FqfjaONWCLXqsAywPf9Rk=;
        b=NXRA3NZ82hx8qYVvneZ9GMGBEZMEuAA3Er0LEu1mIm3WbGzb6kujhD+jIiBaNT/OK1
         xTRXGBGynAXLe2NGgS0wpjC9D9FSBXLv1iGiaKo969UtpOwsdxr7AGS9q70tXUmFftg+
         tLaAMNxy8XlO2K1fDDMuisSVy6KaT/JSHG7jsw0fkVODlid6RykefR8Ijb6Rmfuspm6D
         dkFvy75EhBuiSpFsRLPr28x2ZawcBnCoPsxy7d5kIxy4COpqZUKGcZW9BO+Wm+PNii+h
         RC8euhju2ORL35PZ+KsVocECkEZLxND0vwSsJ9H/RbN2g6Z2gbAz1NOzDIMMGQMAslm4
         UCoA==
X-Forwarded-Encrypted: i=1; AJvYcCXEvtJVrx+GDlL5U1m7YaBC+ch2zuIp/H71jJR/Z87zypeHM79j4nb4vqwuUlwDRGcZbgvazac5QZVtbNxk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5V1SxuUr57JqU1Mt7TJBHiJX8P9xcglMW/QU74RLHReFkvd4
	Pa7+rXEtwJiVmw4zi34qAZERZysF0lqW2GAyNdYwJwBlE9dMDGp39CTn
X-Gm-Gg: AZuq6aL8KQ+nKmEnVzc6ixu4ZnusVICic+A0jZ1qbEUuFufjgb84DavVNzloGB3OLCv
	pRymr7nPoLiNBjgddWaOqGa11dAnWy6ccaepKywGbm5K9b4H8h9zAlPe6qRnDYHCvviEG9f7CCm
	rkKcBF1lORj3S1snzWVhHWevXEFvbatdctWVvSMAYsFvCo9Te9DkoBz1/XJTozWgU/1gVsoRU4o
	HZ8eOXbbc1GCut8mkVSPmYkik2U41N9HTvCOIpzZJT9Hjf5bDBmknauoMuI6jhcLHKYT6iDUAUi
	NpIhE1hUU5hL/eaI7QwEFYwFPSUTFoLNBjBzTPiiCp5Mz8E3yIjD1hW2zD5oe0sunqALsbRhf5m
	QEP/oAu9hW98D9T5lOJu54v1iZe/mustw0coo3xfmMfGCsuCc5qK1e+ytwGi65aO5/dOOpt5Is8
	l9BU/ahgFHGjR9hBNrtKe+qQJGzlNA5FrRP+IMlqalffEtzyxpeT/ZSdbCl3HHczczpXzPlIxCE
	4rHVNIGC1HoZec=
X-Received: by 2002:a05:620a:1902:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8caeeb4e8a4mr1816696985a.5.1770687939183;
        Mon, 09 Feb 2026 17:45:39 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aefbc5sm915309685a.17.2026.02.09.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 17:45:38 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/1] dt-bindings: display/msm/gmu: Add SDM670 compatible
Date: Mon,  9 Feb 2026 20:46:03 -0500
Message-ID: <20260210014603.1372-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210014603.1372-1-mailingradian@gmail.com>
References: <20260210014603.1372-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-92367-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 863991160D0
X-Rspamd-Action: no action

The Snapdragon 670 has a GMU. Add its compatible.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index e32056ae0f5d..93e5e6e19754 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -91,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-615.0
               - qcom,adreno-gmu-618.0
               - qcom,adreno-gmu-630.2
     then:
-- 
2.53.0



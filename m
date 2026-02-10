Return-Path: <linux-arm-msm+bounces-92388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 40jcAciYimk8MQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A75116519
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13CDE302F7E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9261F09AD;
	Tue, 10 Feb 2026 02:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnU/vG82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE927EC7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690750; cv=none; b=Jxmsz65MUQxMBR62urfHEHVw9oUMCp/SNGPxTbcpt+E5uhEbAXIQ7lhmJOfZGGRjKKiWRFbQxdWP/m7S0/1PjhM9qlMXW4POHmP++MAl4PQ3aCehRWsOzfPRSaO0WOKzuT8QiiJhC6B3F/P4jd/s4EO7kLWYnruBcwFSkRDA02c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690750; c=relaxed/simple;
	bh=Eb2zgn+6RBhcQifXbfNbQ0ldeGm2BnnZTi7QG5vowJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/HPqQAY8zYsWUkcBcrcnKxhQEnJTPrj59ilUsgePdxWxEfOpmNof4g7WWHvYMf9OqYoFrAVkfmIYkcqUYYwGkBwX2+rBkVi9yJzltO4OfyHpxYFkp5rnjtz0tCSy38PljuMNNFithugGNsQq8uViOEVUsiMmR+zsZZN0leJhK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnU/vG82; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-89473f15ed8so3209356d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770690748; x=1771295548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PSoxtKDAWbmBnHW0acUqKVLWDTWmJDzblYpOm4IMQw=;
        b=BnU/vG82OFxLpzoIFbzEbbAx6B3BNyLg8p1+RAWwoRtWXe++/ZvNj2HrLifKDvW6Rv
         xb/3aHeRe4lgVFj+0Q4HwncqH8OnFblH573JD+zEJuQK80TFWW0cl6p9zsUG0ljMXwF2
         zzMt6SdfzTArWjGf0QbIOGefjjBqCP4DT57IITTFIGFENK8QzQqbe8IDUI/EL+4eJQyt
         Poc708e4qCRXHffDBbmgAHE3rSofsWiheOePZuFlQOn1NG3GZWWi5lwIfF6GaO0oJYfl
         RD4Rr/f3nfEpJIcT1/hWsdasQi/IEhTb+4R9+AK8JEbEiC/7pSm+uZvt8tHd2X8Ir9y7
         id0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770690748; x=1771295548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5PSoxtKDAWbmBnHW0acUqKVLWDTWmJDzblYpOm4IMQw=;
        b=EUJNn4bCToDuf1nyImQj+KLU1F3VCm6kptYBRUMda+lV4QZj8EklhXXXvymFkNwY6a
         BvEATi9zu86+UoX555Hwdh8OHPQitoOoRZkHUUEDACF/9HPQuqox49Jerp6z2kTyNNmm
         e98s8ezERENc1nh35e8+RhlHyXCQufNyCT3/Z30g3EA+WSPzSwefvdrRQEUJm1QlvhiX
         pss6TBobtqHxAzfwkFFWvO2gWyD5lB0VewyXuGV3kk8TN30dRIw1DK2VHHKWIBL9I71b
         SlXAUQmvFlZCVLRA/L27oDja/N4LFjYYK8YI9o7SJFQcMYKLHSQ19Kg9bqKPDD1gJ+/n
         hscg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Gmky2S9NELwD0S41YyR/Hk8L+wBNumfP9lHF6wuNbzWF1cVvStlmGaEJpip9Ca0eKZyUzN32AvkLYJjE@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhqEb/eJ+uyNpBevYaVy0KqSjhTPLmMfoAUu/tiL1AUUdRQWM
	MuBoiCWZESZVuyZ1XS22OMaKnxSTGW2Piml5N7QKA2KmnuZRFRV3o29/
X-Gm-Gg: AZuq6aLDsOfw1TNLD2rW1ao/CHo+mpYRVHyEkWlxpQDB5/MM8D3ISJAGh1aZ44TM3/A
	kvWElEJhm6xiJuReHo432ykpI2xDmEEivUAWPhxeoz8LAPwf4FdmzoIC0TnhaWNbJbdHVlB0H7D
	I5RXHeB30BxtdTIObOjsLA1vSFCUelM5tsCYfrKAvYjLQch6chwoBR6GvGPpLcI0oelTVk0TSaf
	F+DGvM5xeQAWInuUkz2TVkgstU5LYya8470Y7S/vl3qDtbUOqX+UCZMLz0YhApSPXR3Mu3IN4kB
	hjhaCHqNewI0HbOaOwqEVLxtapjv40Y2JsN9bGiuXeEIRmXs8T/sjsodfw7O/OT9GEczmMarXuh
	c5U1v2ZwYFtMMK/2C3Oxnpbz+elgrY2O8BJLhC+ooWat3MqSwdVZl0ugAiqKavbsckJv/yhViur
	iacJk3IRWxZD5FrC5gdZfOUdxTpV0/122qrhuf1IsPmPGtufkNSGelSpLUgl5AFq3IPokeCOWn/
	fkZy0vRbbyuLoc=
X-Received: by 2002:a05:6214:cab:b0:892:e3c3:94df with SMTP id 6a1803df08f44-8953c83ce72mr197156876d6.28.1770690748508;
        Mon, 09 Feb 2026 18:32:28 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c0574a0sm92056316d6.40.2026.02.09.18.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:32:28 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: arm: qcom: document google,bonito-tianma board
Date: Mon,  9 Feb 2026 21:32:55 -0500
Message-ID: <20260210023300.15785-2-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92388-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78A75116519
X-Rspamd-Action: no action

The google,bonito-sdc board compatible represents the Google Pixel 3a XL
with a Tianma/Novatek NT37700F panel. Document it in the bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..59118faffb02 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -831,6 +831,12 @@ properties:
               - google,sargo
           - const: qcom,sdm670
 
+      - items:
+          - enum:
+              - google,bonito-tianma
+          - const: google,bonito
+          - const: qcom,sdm670
+
       - items:
           - enum:
               - qcom,sdx55-mtp
-- 
2.53.0



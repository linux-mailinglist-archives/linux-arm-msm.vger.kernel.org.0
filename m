Return-Path: <linux-arm-msm+bounces-100368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E7rGwutxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:15:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0D034747D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C84B83022B0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9141A346A07;
	Fri, 27 Mar 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I0olmsWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9932C1474CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627956; cv=none; b=r1T1eQFyrOZ/TFSH7ZnhrTaPN83yrFGm41LZTo4OkSeMg7UhpqTinhoAnVmONrg9VxwHeOMnrsiSGT+rbtO7YTJs4rQTyq9ZoR4uloTiDcLqQ4OBsV5Em7KZP9YIQpmAJ4His30Ca+AdkQaUkEXiBQ+PEn+gCpjRhJ+f4QXHK+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627956; c=relaxed/simple;
	bh=/iuE8Of7PxtUN21ThxuyRVaZpwkJ5NvVO+YKGCgqQ64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikEEyZSzqygr03rj094641Ifsv1AhSCClIn5eCqT9HBxKyzPMAV9mTv3iEEn3X3s6rokSWPa5f35OKvEf9etE5bZZl8GaJfliwEs24la1kZsaD6GgkjSA8w+7YJwZvERTJfTwkq5ZqgWaAFYMeard0Dz+gE0ulQk5YPmX0j9acM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I0olmsWo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso304089366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627953; x=1775232753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMi8pPc1nu1OwZY0Xf/EDRaYl50oxCMJcLrOAypEPLo=;
        b=I0olmsWoxpRstCu65hD6A96pnIQoLAgUICUYl8cPWFFInW84P1BbJvpl1MPxPnt7+u
         BexgOiQ36XOJaG7smjtrD6hJeMs1sb5NhOBukp0eAld1Kjq3upW7kc66eSKzvulg3wRk
         tgcXvCsb0PPuPntDyzPazArt68HGJuMG/jrC2KBVj2R4y5EhdZLB6pt+eW5NniEMCCQt
         4a5fCjVF9iCAR/MSCS9RGjO4vV49iJVPrULDuXrHl3bGb3lUaFB5w5nZxVLGGrVH7LlP
         qatvBxzPb3LF6R/td1zw3/hJ9Uacu7ISidcxi/3jQjBt+kizPQxFefjb7V6jGrjDeMsC
         kfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627953; x=1775232753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMi8pPc1nu1OwZY0Xf/EDRaYl50oxCMJcLrOAypEPLo=;
        b=S+S30zM4gBLlnPR4m+6bpjZESTMP+u7+0OdKecdXDRZFd2nwhPXRojxYtb5g6QP44z
         gFFCTKIklPflQHx4PReaDcTmrVf8fw81Mb/NtnajUNYp/ZHVL3ZCtRB/kJPjDydd+OMQ
         N1u2ZLWHS5ekG6KL5Ph5HKOLBZmbISa+hl4hdt7zG2TFEv6OM5xhbh1C9sndrpuhiVQp
         okfA89/fNqlx3tUBCetQtrDFffdGQj2ex+0ccJlKmPF0KG2YDNerXAZ09zBJPVr/a8mR
         nAqSJM8W9tEL5XSy4WV09qG1TnUz4iiLoHhrl/UPTjyK+vZQJnyT5kO+6HzifIiLTzeR
         2oAA==
X-Forwarded-Encrypted: i=1; AJvYcCUKRdsW2dAZr2vvLZ72zoceMo9pm+2OLkAGIIWmWc73YdtFra86pjjOovE4uvyFGMLP73qFfRgnqW1rk8Hf@vger.kernel.org
X-Gm-Message-State: AOJu0YxabxO4B0v12FeJB6Lhaw/rScZmLwE2JeCGpgQpUC3+JINM9DAt
	PZzvHAGYgPSHw2AaFKZbHBsEA7RoQkwjcfvlWztYOw2/LdhPQecehOPZNJfFq0qA6iw=
X-Gm-Gg: ATEYQzwx8uo6H10hTyBAO0RS/ewOR+/3BD3DsBlwvrefDKBZlPGk+28/XnAI9Orgbwk
	uLEouZgGCS2cnN4vk4K2wv8hf0L/f+hL8Bxkb8IKssrWUbQLXnMzEGUoP3aH3CaJ3pMK9QP0/+E
	j/2/tvxzyEBB3QURf0IKXPHVBwfdsUhEITcSLaAd+TCq6/8eJETTO8vojomQmcO7D7KYlZSz2Wa
	88ETbSI+pfUr3RS27JTl1vpC+zx0INLgSAvUrdX7+NOD3FdCcM4QDz+dFOOS8qU2h2ioLA2VS1d
	oe6+l1C0xgpWY/E/GXxh5EfNOY6nxplIqKEQxGdMou6SZINFzYiVUkhCGZRwZyHdh882myl8opg
	1YaCT73vSdTTS752A+gW6OFK79w0+lrNmb1+GhBQ0wQsjqusUvmnU1OlzoX+E6KmdnJJrwEleqe
	BGhJt/ibGdfdSE5sN0K2iuag/di/y05Zo1ddyGDzZuZHZ3bgdUNAIA3exSmDv5og6vO/MN/9hzc
	QaRRQ==
X-Received: by 2002:a17:907:1c0d:b0:b88:58e5:86ff with SMTP id a640c23a62f3a-b9b51647766mr196269266b.0.1774627952962;
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:21 +0100
Subject: [PATCH v2 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-2-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1141;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=/iuE8Of7PxtUN21ThxuyRVaZpwkJ5NvVO+YKGCgqQ64=;
 b=kINHrIcgMlj9z546raEXwcP6A0Lzrq1gQjA0FLzEM+5Rx5oXlRJ2E4maAJbpBS6QhgEJ6hZFp
 rLOVKD1c/CuAO+zU1Y1Cz+Jhso56+ar/zysDEdXku742owa567YKbMK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100368-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF0D034747D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the DSI Controller on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a24fcb914418..dbc0613e427e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - qcom,apq8064-dsi-ctrl
               - qcom,kaanapali-dsi-ctrl
+              - qcom,milos-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -339,6 +340,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,sa8775p-dsi-ctrl
               - qcom,sar2130p-dsi-ctrl

-- 
2.53.0



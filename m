Return-Path: <linux-arm-msm+bounces-105441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MsUOB5T9Gm6AgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:15:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1254AADA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEAA83013260
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F73624A4;
	Fri,  1 May 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nsTz5jPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A234364047
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619728; cv=none; b=hkUdAYI7Y7P8/51pJtZ7ACp3eKMVP9T3yCQ1YplsLqh5Fk7QuwOD5Sg1Dnujc4kUx2m8FXV+L9ODLZe4mxDXkilrhI7VMNL/BmZQMvAjHiiaNidGiCy3g1zjUUmHLPcNGEMx9CcIj9ws2bcrnQj7DTSMGu+NW1tlhP7DTSFghl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619728; c=relaxed/simple;
	bh=tlOAtlzfL1F+UAY6923+63QtzSr69t1x2DwkX2ImYg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EX33zNXrnb/Mp6BUZmmjYz2jdSTCThJar9G/DHggw5gbqKXceMKz0+9dH8Mj8xHdv2/1bfPRJMAt9FkLaV1bcO8QFRW8a2vNRBX93K2BOCm42amncq2d9hWfTFDccvdCa1kcF149a+AqYluwKwkmH1oiYwfcqEHFTg1lF7tmyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nsTz5jPi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so16320195e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619725; x=1778224525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq9Fg7O2OJrY+/g1EvTIvGirgkQPf+eg+wmXlLWm4ec=;
        b=nsTz5jPiupJqdJzcSo8ewZ2tIgrEb3kZYfoOWVwHKSDNgsC0QF/pDIGkrlXMW6aUQ6
         xazc9YJPmdcDLdnVETsc3xExOdw/JsuA0BunegWgSo9Lcy3YM0bGyNXSQz/aDv4T2dpE
         jIAl0jUCpEKKnnj4dBbnwH8bo1DL6v+2jSVb83iqL2iwMJre9K3GUP62STSaXZ721yeG
         X8+CoVD5HoHQQrHiQqyyF13LmB2B8hxqJuHxhVFUlXEats7uJzG8yh/360iZNYrU/bcz
         qepg+MoFjlYy1T1EEAOUw25mgbKqAm7U1aVQ2QLtgAPD8hoZJSdQN9SegtKNdrdiV7YY
         Ro0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619725; x=1778224525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uq9Fg7O2OJrY+/g1EvTIvGirgkQPf+eg+wmXlLWm4ec=;
        b=spT4zCuRW86pXy2RBsECqvjrCVMDRoVQgUx2zSxO94RZRi0Rxmf3XucV0+x7PgiP7v
         BwgOm6Rtz0jD/y5kha+GO2V4ikw4++EaSdI2MoGariuWeX0I7MBYl/jCPAGlLnA/lf2R
         jTpNWTIKY5Df9sE3PjE+LqM/90TLmZLyEzNms/tjR3zaxshlU9Ak6KDnTycOhSVvfeh/
         qodxELm4wH0skgK0Mwf82q1wkKTeOIJ2T6IW8QBrw7VyKg/6qW/V/675p3aY+HdF/4s1
         i+GiCSUeUBh6wBQTep4vx/F/hRRMnc8uBKBo7G3p7fy677lKS2DPOMPk/JId6cUMFZAu
         9YzA==
X-Forwarded-Encrypted: i=1; AFNElJ+jCfNoQUD7VtMRCCuQdOnrJiY70sB/mUNQXbGdV9P8QK1N599ksExvI5DshxauKiug/ukTqqP9jMshr4zA@vger.kernel.org
X-Gm-Message-State: AOJu0YycmY3GprnDM6besVE5RrCeUqmCdpn5GuTzdiSfH19SuvnT3IGN
	z94kWzK5JT/Y68nO/cTM1DcrMSCG9sVV6ZctiSLIM50Lu/at6de4BvqKVNgBFuFLaZc=
X-Gm-Gg: AeBDievxAVCK0b//hlBiA7JXT5zeQ6dP7PbYsPsbg/4lraf/WISOFlD1gCbsVDhymn1
	FXCwTpn8now2bBklP6VaysLkTFBgXdT2nKi64N0275rR5/L4JdsZ/mAZkGEgKKIRT1vZcrhQ7Mh
	uszF6KWz0XTXeiqDHhHEupThrS+zAhG/bGMz+xBaYkcDKa2afjacif7Nzi1Dbl/g6rUrHHrYpSD
	MRtHzsY2NLDdT+gUtmS4CKKnXTnhKbZZPGbZ/vrTS40Ari4633Ox4lMgXAwhMcjaYsmdTTiVQnZ
	oUQLtdgEvYR7S4kwNS5AuEkS1JSW0lNVGallFQit0YLYS73Ity9gS1jfE1dRNV4JiXAC6Ajfl7G
	87QjxLlmUqUOiIoEZvieKwAJKXuZw7e2cqGaYS88s5vxKXJ+dJGT2Do83+ywyd2s4ziXowPypLp
	G0sCiZyKcBn8auZcfHW6uuucToLHPJkSJVZ9d04AoLfhl6cdmL//ojrqr0nZYhivC36z0lio4WK
	wIDHluSB/KMPZwn79o=
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr100806395e9.8.1777619724709;
        Fri, 01 May 2026 00:15:24 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:43 +0200
Subject: [PATCH v3 1/9] dt-bindings: display: msm-dsi-phy-7nm: document the
 Milos DSI PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-1-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=903;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tlOAtlzfL1F+UAY6923+63QtzSr69t1x2DwkX2ImYg8=;
 b=laQULaAfc8EYK86r34quun+1G5b0TcaS4cM1GnEOiCb5Pdj9nYQBetdc5qYDEZ2hKy4ccSmM0
 tNuCVFDpAklCmj6toTgXK7Z2vsTawUWdb7/wVXasdTc+WvdDau5oM9c
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 6A1254AADA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105441-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Document the DSI PHY on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
index 966c70d746aa..f397ba3fa84a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
               - qcom,kaanapali-dsi-phy-3nm
+              - qcom,milos-dsi-phy-4nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm

-- 
2.54.0



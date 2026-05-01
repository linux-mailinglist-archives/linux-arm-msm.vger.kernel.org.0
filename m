Return-Path: <linux-arm-msm+bounces-105442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDlSBjtT9GmsAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D754AAE0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6DC30262F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2B5364047;
	Fri,  1 May 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3mJcU0Y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8763644BE
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619731; cv=none; b=iMzWWgpSn7dfIXy1wH4H+JgS8Yc9sl2mu3za8bQOdEilz2qfIMzt8PxIx+q9E5YBl+7C5/5+ipX8LiAa3bI4RRdoorFe5C+Vn3/0qT/Fu9P/pslbLu7pWSrqBFGxcBQ7599s04JH1TTawLWm7Dxfgw2oYSIi6WplQT53a3nr7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619731; c=relaxed/simple;
	bh=BCj2FLTcOJgjzO48MJefQIMPqJBsSoeL9qxaR0JSpFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfEXB5z6Dd/P2xu5S/izsD1AVnZm3vaxRO5FAN9aMe9U2Lz5fAmbkEaGrNHW0K0m1VxdW0q7zfzNqBcA2lkpXrrQmqrTueHqhbE/3BHHll+JSNJN0iD/+fFsG5YpxyPum504oPnjrXN2muN/mTBLydxdSaiEsnhmnAvv9erC2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3mJcU0Y6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so18051315e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619727; x=1778224527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9cBOyPysOTRVWivLRI31LjBpVlIJ+dTPcG0HTJLV48=;
        b=3mJcU0Y6z+Qkkd5fHiSbrJBrZg/uWaV7LHvAJJT4NWFQPAAh/OjWh7FMmNAFJt9tmG
         CFrODfgM4JuPpMXaWWE/ejnQLyfQBQbb7HdPXbOHmYPOG/liieoRK0je6OqkjRaLgh5z
         LUhvl4lCTYVsmLs819IaIQgoBpmMlrq6LIMBh5V+9xeUh4vRb09vSz+D+kyZKUbC7RPH
         gybTWcU54hSbM04ZWhS0cs1il3a2q5/u4i7NpKR/hhtZN5QR2dceg7H3V/l416O6pVAf
         A5WgFpAcZ/gyMvmXv9msnLP2pgxz/wenvrVqj/sjoPLMPSsv8Z4YulTV/tbUwV0hE+EJ
         u6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619727; x=1778224527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9cBOyPysOTRVWivLRI31LjBpVlIJ+dTPcG0HTJLV48=;
        b=dZOeiINXtdb9ACFvjdRB0kRwOKHLR9AYwLwt698r3Y6WmZo48D9XA806hXFqadBmcj
         E+iBf/Tj/gYs0lvCzwUyQCX2DEAi4pubjwnD5eM8pmkA2jg7xtx4U9a+HwKRYBTS4JQC
         uXHwfmxe6g1UPd+MlgyDgB5/KSEhVsxQubXwXQTIABFRZ+9hTJTSEHiN19PYvPJtYETL
         p7ql9rMuLMVghw2wFwNdSoyTpgIaPP3ehCueCrJtIYNxf5igCh5J+V28uYPxzJshPMxo
         Yjwgycaf9h+qagnBzeJOSbssZQgALliOqQ7TiIiThtPQh0LINfK7ZqWAj6EP4syxuJXB
         918w==
X-Forwarded-Encrypted: i=1; AFNElJ+F3mt6OzQ+aNLWflOo+CfhPZ8/bPQgIWMtEA6/Q4xVrMM56Y/NFo5B8oUV3W5ZIug1ymyQ70f1+ZC7bxsA@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxw8sRjttYcLT7SEZKsDzpfBLxYjPu+Olzdj8bmHnomD95u7y
	Ga0yZtpv1642TzBBzVeuaD/AnVI+fFuJ5M0EjpHKmXI6Fru7jyEJuDJSkZZMMRVBZ0Lq2pB1HRe
	kWqoso7c=
X-Gm-Gg: AeBDiesNrCNh2sKJDnnmBpzLEtNnhCfb+4RQgVA/lVLubibUzJZse9z5jvFFByzkN16
	HtYJrftwRK2Ct8MgrQtTVDV2mcpZzFjbSx+5lY8LHQ1TbIL/azyK2n5vm5JsPotRAtv9cubIoQG
	J4hDIqcJPi5FRqasnAmEUnPRk3m700OejHldD5vr1pOEErJbYQ1XylpQSzmkPS9QDDMXIs76tvv
	PM8t2imFgKlfXYAbs7fKAbzvTmB/rcWsulXRqqE/JG1EMHBz0qBTJkbAwvDnJa9D9tOCPqKYuhZ
	eFsOR8Zeiu+rEMhuUlZqYjlT/F54OD3gSBtStgtirWOdrTOwd3VEVjuS89aNWdm7+zT4vZ+xRuJ
	IhpbAKVT2LSQjzeyq24VQ8jQCwSsPmih0xu24KTg8UXr6Ejqhm6I3pd7Lf7/XTYtMeQduvytVu/
	soHEzYeFuw3HN8bOpgE+gLnunvlWtM4YUe66sTFDcPqJfD1N1nrXi6f7gPzSBisl3Xj7jkmGuIG
	PwPG3mwX5tsFVCEAX0=
X-Received: by 2002:a05:600c:8708:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a844e4a83mr97816475e9.3.1777619726960;
        Fri, 01 May 2026 00:15:26 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:44 +0200
Subject: [PATCH v3 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-2-58bfc58c0e13@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1188;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BCj2FLTcOJgjzO48MJefQIMPqJBsSoeL9qxaR0JSpFI=;
 b=aX1/waVjF+hvivOAF3HL0UFE6nbkla3myKttlbuQHoweT7fKoatB5FZR6ILx8LPMNgVvk1SLI
 ENhaEJDidHzBHLymIm0/WL8AWCn/emn650yUZt9JQQroA8ZM/bzUE83
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 96D754AAE0D
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
	TAGGED_FROM(0.00)[bounces-105442-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

Document the DSI Controller on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.54.0



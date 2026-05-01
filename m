Return-Path: <linux-arm-msm+bounces-105446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH3UIkpT9Gm6AgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103624AAE23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDC42304811D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B035F36921B;
	Fri,  1 May 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CiZxJz0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF224366DB5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619740; cv=none; b=CVJWPxRbDdI+4HEtv/HiyEUBCQ7llT2gap/+sa59itisBRnlZbwC7OvuH13+yAKRT7ntOG+c3uVV0nmRYk5+t++OsDx/nG6mkP0bB/NQoh1mVJ7cJJ/V6zfbsf+ymarf66zqqJTZlQqDyjmp8osf1/M0XtOlx2INBQlqaNnszlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619740; c=relaxed/simple;
	bh=Z9bS166QYqGuxxGdDpSdVqzIGY06OJ66UfzmgQnotbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeEs8EGfZ/xtAz3636Bw5Erg1prd5kqWGJie2PTryN+W5cdmVV4S6ablCdMlILdkEgQ/fxcl1Zn77jFVfEvNBjnzdRKkUyWcHqzDlNRQnL3zbXQLIlM+Ih+tYIpsUw5XBrUlBWrfyWqUznztSN0mv+qeHRfoCeVe0ckUikanvLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CiZxJz0+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso13938725e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619737; x=1778224537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsX2W4L4Pc+PK+L7HBoqtgzXsJuoR5ute9g48CW5Zxo=;
        b=CiZxJz0+43I2lr87aFzDQpqO1wbMvk4y0PAMyB6d13ywDOpqR7Qn4xmLDv2PCnwKwg
         c4TpgH3UaZCtgVhKEggnhDh9btuWfbZLl6RdAzDo6c8jeUFLLeTPXNIIJ78Bu67fgJ8d
         vqQRWH/AwWs63qEDiYtqcIUXoZSdAHeuwZsd5z7ssp1y9gQxK30O0x+8FrZlYx/6LVpl
         1argW3M38W5268SzUqcjJgcFp6QE0SVgkSejlYTyTyYAjrRKUhWA+wY7MuU661g9uGSB
         5/sByTJfrW3jzSOiYVDY2zdEwFkfn3FdVTL1zcL8j8YoeAHHc/nJ5InktEXlJurTtUn9
         sw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619737; x=1778224537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsX2W4L4Pc+PK+L7HBoqtgzXsJuoR5ute9g48CW5Zxo=;
        b=l+Cc9QqYOBJ/pNk25oi0uWmHj0gZ6Ee0vDv57NVM/FyY0g/dntf1YC2vYOv9HxEWMn
         FDDpAUCjDZ6pH+VGaq/VO2xNt1fny6XnXtWfJshU+1BGVdNfsZ7obNUYNvSnW5EKxCUz
         uPgFILvrmvgs5f4nRh/OZhoapvW9xHSGhmBXbbPszNWNb9RAIBG/Pp8Ztc/leMXQ6zTf
         tTyyyNNK+0OHlgGrlKZ01zkR/v8JWxKDj/ryiISJDJcrTo9Bpah3/wOt2skS0mF5SzGf
         CgFnYHAkgx6o7AkUPsxb3sEyB6Lhnlgta3hZKboeIwSrrF6UoKZJ15jpQqcyqucVE+Tq
         sVIA==
X-Forwarded-Encrypted: i=1; AFNElJ9eEwJmj7hwwu/dBLHYZlUKcAM3DQig8AT4f48uO6lBZmM4A40IqztaSsaQ/4pb1VKGFmyXgIXAdLKGyYsQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/2oJU2oT48CslQn7OTc9RjCf3DAN1M0eDrSKVbuvHj0FZdyJ
	5TXv7rddWctSk0DoHRwEbXaAuCgqp2MboELabDL5eKE4gaP0cIlULsPB2ZBReuCNFSQ=
X-Gm-Gg: AeBDievWPshgorZ+xV39n7gV2sPky6XvklWBaG4Y0WodLzZ+4ucUOlFC6znDLFRBzFK
	dasDl8fs19iWsUeKF3ulFS6frz6pnoWhmKtW+0OguzwYRJV5z+6XPt+/u9Nv58mmreaJutw/VGZ
	PWq6QzUuWHr3nCuT03myAvAkSbZBkuFi7PeCn5+jnrMjypWcmi4o9kFSMDmlnbXanoXd5i3ienn
	ZgOH0m2DiPUbOgiyiLEhDrOVmvCTdG08D997S5Bq5BuSyPrUB1IfJe0Mma6xQBguqJZQeglXTpg
	aJ4g1z1SnnrrA6C31hWS9tw8LLeN7G7yAdMVnR9OYap/PlOi91gTZz5QJy9rdhVTHrCYAiJfS6f
	BEjaBtEh6LgBPR9vue9vBTzyH0uziNqF2AsRgVOyLkzrR4UJMf90Lxsz4LlqbpPmpLhDmOdXzs3
	0LnpG3Et2XtXUP3//YSr7ym+zL/mxFrJBxhUH1P2U/uB+2ufujjK4omupwtrU098iT/CNguSfW8
	czbcoxD
X-Received: by 2002:a05:600c:19c9:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-48a844526dcmr98733175e9.18.1777619737268;
        Fri, 01 May 2026 00:15:37 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:49 +0200
Subject: [PATCH v3 7/9] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-7-58bfc58c0e13@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Z9bS166QYqGuxxGdDpSdVqzIGY06OJ66UfzmgQnotbY=;
 b=JpEHF1l8ODIp8MebnEB3AbFVnv0KVA+IcJJ32Mp5KyhODYhgLLQWK9Ht4vJGZz+QkWSZhhF6T
 yXb6WAD8kMuDqu9cW70IpWCOT1FDTY49lbMcQvuFFZ1fa1WcLUnHuMw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 103624AAE23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105446-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add support for MDSS on Milos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90c3fa0681a0..754ceef38717 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -550,6 +550,10 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_14k = {
+	.reg_bus_bw = 14000,
+};
+
 static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
@@ -571,6 +575,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
+	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },

-- 
2.54.0



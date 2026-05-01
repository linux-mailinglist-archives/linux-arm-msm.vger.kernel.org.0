Return-Path: <linux-arm-msm+bounces-105445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLDRIHFT9Gm6AgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:17:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2195B4AAE8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E5443038F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D8536402F;
	Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vDnDCMfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBB35E947
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619738; cv=none; b=iDyFp+ywORrVSzZBefi+3RDDyC8OkjpH0eSN1ztArWcg6gBd6d7qa7oOREQrLVNoOu5hmrWgrGcMRjjvTtOHk/JgHbs60Xs25wx61RVzTDYot7YHpu2aG/UiYbHFiin4vF7CryBiAA86Uu2LD6WUPpw295rNBfuJkAf4quSwSbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619738; c=relaxed/simple;
	bh=M4levVKqvb3E1M9kQrx1UfApgZmV6eS0fxmbvwGU/sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oq4sI9iqEupxQ6ougkKaT106FZJ5CmppWyLsON2XFoJsj0EadzqElBQG8TQ4igLZmQKrRxaJ7nAQt1y8hqkVoP3/MDU/eBGRhqGrMaW5lBIY5JR3fmMfbWr2gYHzRxqDVZw0jwLfmTzRLm5/7MqcOEUa4HxQuZ5IyYAp8y1fdDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vDnDCMfV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891f625344so18175795e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619733; x=1778224533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOClhrJ15xoCIS1DoMdb7YME2yq0/VJyl12Zk7EZgH0=;
        b=vDnDCMfVj3wqZhNvyAkBmWrcnhsB+sgMWhfTBzDfLo5Bl4ie6Nh3leO3iWn322K9SW
         4E69tYyi8W3G85rJShywSt6+El86zzqLDGN9EvQak4lpQ5WehRnBfmt4LboZKPqxu1pl
         M7JEna65nhNmZbEag7hh7gyZ/C8lfDL3NKgOlWUJezkwl1JxbhA+pS8JXBaPfeqAEfJq
         5PMIPuhskm9p+e7Y/SE43jlZ5J0bWZsainy5qdA7aekSg5+D/m6aNsruThNhgyD/iHuy
         0hV6naFMrz9UFUMqYXoZDv9K4I620L5DmF1eRGYE7hUARrmmTbbyY888nQr1eAqTTD65
         8LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619733; x=1778224533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOClhrJ15xoCIS1DoMdb7YME2yq0/VJyl12Zk7EZgH0=;
        b=OETCTCN0TeltnZNY/nPCKwUyYyDZlOSlbEU8nomqQYpqDERgmEXxU/Edk+XcbyzX78
         ZV+mvnbZV7vnWQi+IfO4X1FqXLSnbohWnsYseRvYnv0NQ8ix15rAEpq6S2zpRmG5LVWU
         FUY5GOV4gJUZsEW6V6SXJe3GSo4WVs5gHoxjPtSlW8sfrtTLNKAwL8aySGCiC4Wu3Nkf
         Q5os1QlpffnzwKXxqKhXTUGCaYnsOOCUgImRqqtcM+OMbIQHIp4/FE7mxBLWEIQgriIR
         1Do9+BskdWTtQUqhclLzwHQrJ8wDh0mWh54bfN1q/5p80otg3PHvYLZB/x7frfc0ZL55
         MtfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zyImuXqVNT2+Lif7dIg7JFLCXAjKKO/kfiWOmGMJujlkKsObG1gSSM5ZqjuHNXHFH3KtEfU41y9ZFkSg/@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGH/jUonf+9dbqaPeDlDiGlFIfpTb/rB1/5K+kGhGeBcJK4yI
	rUDAp90IhBiEWFEV5YjL1jKUq3pFhsjF6KWD1RuCoBuH36TChOYPdERk4lhi2JOH6QI=
X-Gm-Gg: AeBDietP7qG/VSFMnxmiidnetya4bG7hZQPgsbep6jy+3p2jLQgrTs+F6u+00zJSxkv
	TvAh0AzxcuQubAYBbz/Cab1IP8SD1uKy+SYKtNZtnW2pOhbQf6VzUClBxfUj19vvmryQRL9CV2G
	E/UJs9VJsIyMjLXs6rg4dQSfASQlYeg171K0IH2+IFo200LccJMW5vVcnoIhC852Vfh/Exjr+i0
	wWvizs7TeRC8FCox23PdzlGm0dFFtve+Kiq1maziAnVtOWqTS77EF9Q4zPIThxba2mr5Q+MD5kR
	g/GNfPx86q06AgZr+1OPKv5C6wFAWkkl3ALDyrUbr2TZ+B5IgZ8hhA3x1iGAtw7+Aq5tyOz685j
	tYyDIIwgi9NN0/06/hnHQ59AuT+oNsYf6lJToPCTrXT2W24HEHeUlKYMvc7dGzb0sUq5U2a+gh3
	JAFRIDRmcm8tOUVH6jP+7674l0IbWQr0cpIItuwb6MTcYSVNd1lwyDviNI4b4jmh9WKB4JzgmeZ
	bcVLVpD/d5uQ7eQAhQ=
X-Received: by 2002:a05:600c:4e8e:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a860758c7mr85960465e9.10.1777619733040;
        Fri, 01 May 2026 00:15:33 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:47 +0200
Subject: [PATCH v3 5/9] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-5-58bfc58c0e13@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=M4levVKqvb3E1M9kQrx1UfApgZmV6eS0fxmbvwGU/sM=;
 b=ACM2ohFxIVpVweQ73Py4edYjMY/+UctWWAm6q415d5l1h+x9zkwG1+1YDlS7uWPHXVnGqVgvg
 70I2MgwnnolDWVS0T80Y9qdtwDKYYSlgrRpbeRegXvb76KPmYt8sMpI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 2195B4AAE8E
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
	TAGGED_FROM(0.00)[bounces-105445-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1551f270afce 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -37,6 +37,17 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.macrotile_mode = true,
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -247,6 +258,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.54.0



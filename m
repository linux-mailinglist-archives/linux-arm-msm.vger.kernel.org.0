Return-Path: <linux-arm-msm+bounces-100373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGapNGqtxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:16:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D94C43474A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86522306A203
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E5D353EDE;
	Fri, 27 Mar 2026 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3cHS9G2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2EF34CFB7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627962; cv=none; b=Be88qLifX/cmg/Q5ThHa/Hg6jjmTg9JMna1rMZWv7sc9PR6PRNu/9G2mPcFD+6sRO8I8n9JVsjxFHYvBWDyT2fupyd0qKVNKEEQFOaWzsx77HnDKnLTAbFoKDkrJyeOU9butiY18msMX0fUOiIjELu4qIOVDULTe1OnrB1FYy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627962; c=relaxed/simple;
	bh=toygxQND4Dvsy39S8g07OI0f5dr6V9bZ0QRD2HmiADE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0PWwKxZ9Vbk+BWQcubRNcFkRpBtOk4OBm5Fagod/H9mYvt6QAhXgiFckRP1dJeZ9Id49a94BFkSP20LSGbRRYFGuhxYENBiqfPCd3DSqBJhLMsNcGmO2iHIIrhHoV0VI0fPBGdzQvSHeCa8wRsLHU+1EiqV1NEO8sKL2LXMfgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3cHS9G2L; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8d7f22d405so377044266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627959; x=1775232759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCn+lBmcgEXVlegTG5stGMNFyfFJRP/RG0o4ix+DR90=;
        b=3cHS9G2LqzlmXga/sudQKfvId8kdyE2BoH7vpwO9/aSmOBLhz9b1Nu69x0/zZ0vJQp
         0ZFZwCo3GrEHvr/FkT+KH3E5V5l4uQJQLjdNAHjg+tSdQC+CyeTYZDuFkhd9758IH4Ov
         AnwlbLPbezSXCr4OVDSCFKEWXoXutQwvS4qyf/UgQhyUzBZZsFN2/Qn9ldeUuLwK8CcL
         T5f400Mg8q0ZGzsHKGLK69nOgwAGLbhv4ypu4Z2CJN/0pUqGhU3xqhoBR+88VANypt5L
         u7JKO6Z4IJBwt8VdXDcOSFHKuo4MYRtMJMAvM//8qM6juyKECiHm4JacLkfhj4LNwesY
         d7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627959; x=1775232759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lCn+lBmcgEXVlegTG5stGMNFyfFJRP/RG0o4ix+DR90=;
        b=fWfTn2Pwn+LaqFgskppUA1fXgteV/IQBWONeAZwmKPKTsjjNy0oZ+1LAB+NkD+7foN
         2b+Kenx2dv84pnxehmvErb3MC8eR7shWyA9y4RwrgrTw7UP6dAWbr1xAAn/Y3k66pzAR
         htq8QOtuAQDvya/+FcIBTZ3lvA9mAkwpcFqHhR70/KV+Os/HbK1OFweDANkSM1J2CJS/
         lv2nPFF5Nu0gS43UL55EiA12HP2lpndp9Rjv29fJcriytEiij9YkGWHcGJdE/SNLlh5z
         z3r4hU/l0NqJMoQGm5fL1BHaJH+DnJrPyvkiaVeCOtpMskTJrJj1fKDJEHHkJ0X/KvPi
         GCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJO/A4NOhJbTtJodMM7paHc0M4+Cjai8TTGflITfIgxyFhy3AQNGTpJkXOA+hI0M+PXqIaiYK6CYdh1ujg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hs87IJpUXsK64f74HZXHD6Ox8P1dqD5R67gO7QeZ2Uva5CrL
	ocoG5Cg3PQENNDShgMHVC8bWM+2vzAe9m6mkp9Hr5rZj3/SsD5wStYGoQXj3/81hiKw=
X-Gm-Gg: ATEYQzy5QxHcuZjMweRxv+Q7ADDT4aXFYoIHYYiuTykFW9PTZZQ4b3+2GdbJTDLGmp8
	Cp//GwiOrC8LJ4zE3ZxWsrHE7IfTHhdvY3vSdgois4U41BQJhfR4DW2TY2izsFF8fdlOpyAMsC1
	dikpH5bktCtE+ChDJuIzvtXjFp0SZcY9l87IGCWYwL/hA1RxWKI3Zoqeh4SYN+1bCDd8sJnByZR
	qn98di+mUn8Y+wQTQTMvzM42NWCDccQ7NaWUbOQPcwG1PCdGfyGtrjz2onoCiISVutJ2fruzloQ
	g9p9S0dlhLpC6Mdxz5dsyGDwrztTsdtSL7oJYVnZBJ7qlBOoBKO1R6T5GzphdKvIs3me/HZSIqB
	tcNwWcjyAzoWDvvDR/RHEoF38iXinUWqymyiXx5JWYKw3p0us23V1O9Vw6CGS/Nhi1/1DixRPv/
	yPtDsO/ZzJGD6Qg2D4hOEwG2ndGndqkRWAy44txDIhQbo3oCJ/YmYDdCpibByLmNfn2enh6fMdD
	dSb3w==
X-Received: by 2002:a17:906:4795:b0:b97:2a5:8a48 with SMTP id a640c23a62f3a-b9b507b0eb8mr213828466b.37.1774627958502;
        Fri, 27 Mar 2026 09:12:38 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:26 +0100
Subject: [PATCH v2 7/9] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-7-bc586683f5ca@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=toygxQND4Dvsy39S8g07OI0f5dr6V9bZ0QRD2HmiADE=;
 b=MTo0qnVzdsDxWJw6LPXjTeAFhO1XjHbxDt9eTdhNKswtYL3oWLKUwMh414oCixoltSCdD3INv
 Ta4gVCK2Mt8Cy4DLoMIVZZLGJiG+ZtoSJ01hm9y9sRRduDaP2HNEDo9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100373-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D94C43474A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0



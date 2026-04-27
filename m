Return-Path: <linux-arm-msm+bounces-104803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG+CFvuk72mvDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:03:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0EB47815F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA3A9301D153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9BF3F1641;
	Mon, 27 Apr 2026 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzglCDF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62953EBF3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312771; cv=none; b=ntXsofdVuZciFubj3FUKv1p57gmP3UtSE4ll56RpJHpgY5fhc2dYCSpWdE8lU+lfhef6qMCykE1pzp321vH6SQnhC9aNefhNw5d8ktpqzUEyiZR+ZlmPiZv7ujlD3Z132XaaEBmPt21J0DWaLI5YmDVIw9D+ssgg3mB+fSTlR+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312771; c=relaxed/simple;
	bh=W/jdrMMOR+FvAcaLb6DCGvMLoN/HdffKmNBgDjoCT/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXdmtehYNMWE+AhZxHDaDEm3sDs3I4k18EljZQ1F+vCDyHpQ8iKUYxGglxNV5SdbBhuiH8V8ffuXDqW6YilqSkK4QNv+HlUmwLWxr8zfvkMEkqPX1EhR/N59oVrdVtLEEvLayLk9P2TzLtPaTiY4xpVhZiCpFd2nXtSkbSAIGbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzglCDF/; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79db5e18ac6so121515077b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312768; x=1777917568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+ZGKTVkBXN8ikP50VcfnPbIIQ0Oi7+ClKejUhvLkNg=;
        b=RzglCDF/2/eTn0QGiJvDO5T7C3ClYwr9s24SDv4PCVNGiUOYSW4U3q2iSdWTF6OAm2
         fq5CzZ7cl8jWam3ugovu//q9vcliZncLWMU4EE+avV535MJRoOCsmvrHFJcJdwnqF3P3
         LkQoCnU02shXIWfBjZu8ioueiZbfLWO3J9CTPjkJeyla7TwKKaVOf5eIMvXYfuEuicnb
         AcsJSzLSR0dVgWg/NQMk4Ej7/IcrnZU6e/NoFxAjsxV9Vg7L0rq1MbNy+Pq2GI9Yzc9i
         ZX//2ANNOlE/bmmgVlnx566kEsEd23i5MMffPRmm0MVOTQLVpdK3SQaPlNoCHwAW82fb
         aSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312768; x=1777917568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+ZGKTVkBXN8ikP50VcfnPbIIQ0Oi7+ClKejUhvLkNg=;
        b=ncNkKr6vrmqWLexyEdgny9x9vM0ZtlAAKmI8T8abA3VIAtq64WjxCjNVspENrjnRjj
         yACPnUnSOiHrIdCmUWBiZLJmmzM6IQ0LheEufls+CcDyKyp4xpEaU4Ew4DMZc7ABBBCl
         aY9NAe9/Jo5gFML9Nr0xAaq2o0pkmqO0jBpvpFCdU4Ngc95cBJlvCG8iF4i3KvkhGzvV
         FX+v6xL6bX+agftnlb8DZZodN0Nd2OLYwd0WKPFkGmgGNQs3y004uM43UJLkRt4Y5vIv
         Glw+s/olhtDbdZJBYSahcuT6jNQLbtMIcd8cdLHL+Ors4q2s2lKkUXnGzF44st/1pHCy
         NThQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RkU/DkMfkWK04LnxlloUWsW/k1ezI9WSe/dwRg8XTHE8blCb9Qc8yJtpA8+NX8yydYXHFffg4tPuOvm2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxS7WHgV8MwvhwANOXS+nrjfnUNk4mJVzDX/3wPfYBZv9INBJ
	VQODQAH7Ognw5gtHwbldMIpcj+9w3oJzLgdaE9WQZcJ6qimgk+Zeuh9aAC/GbtHX
X-Gm-Gg: AeBDievQp9nL5GReUQm998vNrqTR6HPnM/BFOvQaG2wMsB1DjBWXsa5WkdE0P7rR54o
	PGFOZgYfJL0TobKmZMUog8jttoU3DbHOD/vkCl/mMeyxa5pBeDfrc1KcdJky11+nUVUyiNVx+nP
	OHRKZ1RMtlXWLbMgPqRtGJzwca3j8t1lLEbxqhAwkNeGuFJw6jdk58n0r8hxpRryyya7I6TEwx0
	iS48RcEe8fam/lmEY7IIRJz5IQiF54UjRF6Lv0mN3RvCXtnKTEmYeERzBDc/hcbNaWyVgYaWXrt
	oTZEMhbQz4rQECz11hBr94pWq5r3jdDDpX3AtJuyu4zGym26eLFYze4GKldt8LtO5q9UMq0mBCJ
	XVXytgN0p24krZXfRS4r9wn9CBVoJe32+eqFmg5c47U6aSs0BZtMb0xRxzRSVDO9Y9VoxSv1J1y
	XW1gexAx2+wglNEOpIqsyYowlh1tcS9zGIvfb/
X-Received: by 2002:a05:690c:6609:b0:7b1:9036:a23a with SMTP id 00721157ae682-7bceeadc0eemr1800427b3.14.1777312768435;
        Mon, 27 Apr 2026 10:59:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:32 +0300
Subject: [PATCH RFC v3 10/11] media: qcom: venus: add power domain enable
 logic for Venus cores
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-10-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 3C0EB47815F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 121 ++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cc21a4762188..41272c194a6d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -246,6 +246,94 @@ static int load_scale_bw(struct venus_core *core)
 	return icc_set_bw(core->video_path, total_avg, total_peak);
 }
 
+static int vcodec_domains_get_v1(struct venus_core *core, struct device *dev,
+				 struct dev_pm_domain_list **pmdomains,
+				 const char **pmdomain_names,
+				 unsigned int pmdomains_num)
+{
+	int ret;
+	struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = pmdomain_names,
+		.num_pd_names = pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	if (!pmdomain_names)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &vcodec_data, pmdomains);
+	return ret;
+}
+
+static int vdec_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_dec;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec0_pmdomains,
+				     res->vcodec0_pmdomains,
+				     res->vcodec_pmdomains_num);
+}
+
+static int venc_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_enc;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains,
+				     res->vcodec_pmdomains_num);
+}
+
+static int vcodec_domains_enable_v1(struct venus_core *core,
+				    struct dev_pm_domain_list *pmdomains,
+				    unsigned int pmdomains_num)
+{
+	int i, ret;
+
+	if (!pmdomains)
+		return 0;
+
+	for (i = 0; i < pmdomains_num; i++) {
+		ret = pm_runtime_resume_and_get(pmdomains->pd_devs[i]);
+		if (ret)
+			goto err;
+	}
+
+	return ret;
+
+err:
+	while (i--)
+		pm_runtime_put_sync(pmdomains->pd_devs[i]);
+
+	return ret;
+}
+
+static int vdec_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec0_pmdomains,
+					res->vcodec_pmdomains_num);
+}
+
+static int venc_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec1_pmdomains,
+					res->vcodec_pmdomains_num);
+}
+
+static void vcodec_domains_put_v1(struct dev_pm_domain_list *pmdomains,
+				  unsigned int pmdomains_num)
+{
+	unsigned int i = pmdomains_num;
+
+	while (i--)
+		pm_runtime_put_sync(pmdomains->pd_devs[i]);
+}
+
 static int load_scale_v1(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
@@ -331,6 +419,11 @@ static int core_power_v1(struct venus_core *core, int on)
 static int vdec_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = vdec_domains_attach(core);
+	if (ret < 0)
+		return ret;
 
 	return vcodec_clks_get(core, dev, core->vcodec0_clks,
 			       core->res->vcodec0_clks);
@@ -339,8 +432,18 @@ static int vdec_get_v1(struct device *dev)
 static int vdec_power_v1(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
 	int ret = 0;
 
+	if (on == POWER_ON)
+		ret = vdec_domains_get(core);
+	else
+		vcodec_domains_put_v1(core->vcodec0_pmdomains,
+				      res->vcodec_pmdomains_num);
+
+	if (ret)
+		return ret;
+
 	if (on == POWER_ON)
 		ret = vcodec_clks_enable(core, core->vcodec0_clks);
 	else
@@ -352,6 +455,11 @@ static int vdec_power_v1(struct device *dev, int on)
 static int venc_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = venc_domains_attach(core);
+	if (ret < 0)
+		return ret;
 
 	return vcodec_clks_get(core, dev, core->vcodec1_clks,
 			       core->res->vcodec1_clks);
@@ -360,8 +468,17 @@ static int venc_get_v1(struct device *dev)
 static int venc_power_v1(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
 	int ret = 0;
 
+	if (on == POWER_ON)
+		ret = venc_domains_get(core);
+	else
+		vcodec_domains_put_v1(core->vcodec1_pmdomains,
+				      res->vcodec_pmdomains_num);
+	if (ret)
+		return ret;
+
 	if (on == POWER_ON)
 		ret = vcodec_clks_enable(core, core->vcodec1_clks);
 	else
@@ -905,7 +1022,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -1023,7 +1140,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0



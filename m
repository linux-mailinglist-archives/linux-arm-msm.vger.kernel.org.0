Return-Path: <linux-arm-msm+bounces-103430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP/kFAnq4Gl/nQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:54:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C354A40F3FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DCEA31BA60F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6773D5659;
	Thu, 16 Apr 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykf/7IhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754B3CF048
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347100; cv=none; b=Av058JnG/ZfcfeOf1pTuIPgfVa1lIFgZwzspdrd7MiLPi/bx073qH2X03ejVyNln+ioAEyhmwF6ho+3ed9M1UXD/OfSlkOMfmdW0JgtdcCZ09RVYHNYhX8NRMZnal7a00hMK4kb8j5LZ7S0aIBq7D3AbIxqSUiMMQOmC4/0nvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347100; c=relaxed/simple;
	bh=vtIGSIpIcd+tHQ1s9x1vDn3s2kMk6rnbl/B/P+v06NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOIohkK2WVCxg2mDj9QKm7ig1qv7IeKBjK33xyW5vs8B6t5ZI5ivUAFIny7grTKf7z99rHExAsjZt/DiKP2/KYct4JsNqcna3ULCj/jEle1rmOQDXhkQKN6mezjW48ylQtcjxQTeKQTRPyIiyA1hqZlBKJv76uzWT3sJhx4pCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykf/7IhM; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79885f4a8ffso85614587b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347097; x=1776951897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNIA0go7fCTzH+URKhqccPwj8Z2XEocvaUPiivg7nnk=;
        b=Ykf/7IhMw+iF89lAZygChP3vb0lqwz4e3+bi1GeyfRgjHFoTQgM9bJlImgpsbRu32B
         Cieql4PzZrzB0TEi4ytFBivTwPZjN134HUTKL/jwEhLR/oaLZtM2cic0NRbutERnh2G7
         nqrfxQBsjUnjS+lz/C11fOo8Cn8ZQOeLpii7Gd61RRBD88t1fnn0yh9DGGHQyoMOFSnK
         iBYmySJTYKR2j+/YWKsBQTPVwGQ7L9SuuPonx+qEPvvOgi5vtg/p3x5w+MB7mXgps+Xl
         QzPpfxaLPp0nlE2sk8dCtNAs+RIaK0Y009veTWwd8I0m7hSwR+zQSe+7WTBjVGblffi6
         OYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347097; x=1776951897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kNIA0go7fCTzH+URKhqccPwj8Z2XEocvaUPiivg7nnk=;
        b=IIoMz2KXQYmT8GPuVsz1D6LUJMDc7BgaetrEW1GzZ9Rrnf3HSphInML8YXyVevf/t1
         kt/aJ3LWhq2/u4O2M9Kb+g8wL6oJ3a1ZmMJeecvC+iw/IVZyWmPIKrevIbwERBn5UOuk
         yHqGEZ+vYTZpqP0GztQA3K8qsMvWOlY1JNqhQJZJN9SpRDIXy/vRyjJ6dCmDM1Xxwzxs
         JAzIH2y01zq2TDtI1ANzhcv2k4Ar2FxfNmVJiFrimAXYim4+sG5P7dKqvpCiIl3uCPU+
         Pz+8lbe1wxcTYR49EgH7oFbsIadOy8zPEt8kaYd31v9K5ftDXIUKFg7paR7AeL8+nw8m
         Pvgg==
X-Forwarded-Encrypted: i=1; AFNElJ8wSN3ojNDKcQrBzRWd8fpdDLoaUMI3vFeJEjbvG9axBtTJLElCy2Ip/n4OlzBO9uYiJgVwPXqeS1jO2XA9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2qwQKIefyBtmiXCaFXbRc4Gf2ouJRGMM6iQzfTcSRrxraObz7
	XU3RfBRN0TmQ6NxvwCrX+m6ESWUgi8anIupZvV67g9tFb2MCE8E1blZl
X-Gm-Gg: AeBDiesK711nkQs0oZ8r5AFQTIQF9xNNz/y8R5QNDkOLNtKlA6c287roBgYnb2nzPmx
	dnZCVRMATosyLbB68+v+9a1tX7M+9UwbhjUIJZ2Mgxr0pfye2J7/axMGdlsRn+QYV2mHfdKWBe4
	GFlC/WyPwBTGvh2wwAG14e1CrzQIcETQeu6S3hXi48qVXHk/+NSzCxq74kuLQVQ1PkC/9N3ssus
	2M64uHNyRQIf8gtJ8n947hDDg7ZycMVLG5OOZUw1wwBN5N9Lzm7eu5YKiP29xwMth1ndrRCAvBR
	ev2Ppu9aP4y3jKgrCqZdy8f9BsBp/o9T0woBGhmqgjDvZXY/L0DZ6qj/h+NDifT56NytCACR0O2
	KHUkYmDwyvsMtYoZhY6msOwti4mVMxaRWb9XB+cmSLe0ctkO5Utz3Hfnme3hKdAhqgaV7XYahIV
	3ER0TJGDGJCn5gjfWPpFG8lWW7fQ==
X-Received: by 2002:a05:690c:81:b0:7b4:ad41:4831 with SMTP id 00721157ae682-7b4ad415700mr140405537b3.16.1776347097361;
        Thu, 16 Apr 2026 06:44:57 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:56 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:57 +0300
Subject: [PATCH RFC 10/10] media: venus: add power domain enable logic for
 Venus cores
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-10-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C354A40F3FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 121 ++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cc21a4762188..713812421c44 100644
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
+				     res->vcodec0_pmdomains_num);
+}
+
+static int venc_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_enc;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains_num);
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
+					res->vcodec0_pmdomains_num);
+}
+
+static int venc_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec1_pmdomains,
+					res->vcodec1_pmdomains_num);
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
+				      res->vcodec0_pmdomains_num);
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
+				      res->vcodec1_pmdomains_num);
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
2.53.0



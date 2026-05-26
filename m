Return-Path: <linux-arm-msm+bounces-109840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLKKInCiFWqmWwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:38:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDE5D6A76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6232530C41A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852053FBEA3;
	Tue, 26 May 2026 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+/jtJTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B13D8101
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802320; cv=none; b=uPjBf999H0XzGGVaWp1Pwch/lQ8Mgo0EpiLwT/8C7QMEa7zwYWPb3MNtxYHMkPxUs6nnr9LFLnOYOx6kK1ngnG94pbUrMziUCNfWMDl4bRxOJH5C+I1CaKpY0OH/ExPCG+cOqCkcjeVuo/6l19tEKoXGNYBUVpPIx1hYayGJb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802320; c=relaxed/simple;
	bh=ve5QswCUqMNw/19+nCfSVDiR4F3B0CHIO3H7j8FQmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dskrJZVSgA/Jq6PVOgKo4GXZ8Upo+/Yb5v5gvF2dDXsUNFqJgRTdAZ0CUM9jQVlEFdEyteU6c74OFW6QlCjfkYO9XZvoNAY/igSJg8VEIUNz0akAnymIouKiL1fbEyCkH9r5zsiFhNm5oSmfbEYReXaxCmcPXFcdh59D+6SQ/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+/jtJTD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73422431so7501396f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802308; x=1780407108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wZDIcxhNgq8EiTwrgXOkvw460/44BNB66HgpB9Og4E=;
        b=E+/jtJTDFfXkwtc6Wscv/uN8Q28hV3le2QuDw5XmbKzkKddPQoOf43u1Sj2E40zxyl
         vZbuZ4D6tGWdMBk78MTeH87C6u8dI2k1//tP0+ioOuYvnmqGVuTD25f1FAZksYlELvNp
         MKqV8obUm7KtyE1Idhtv876CIpjKMkadpQfLVDtpA07CZBDkJAfaPJLGkAyD8XoUEPtm
         ByWbNs6TmkRBwyOldLT2ZmXEd55NGKLlSm7B8ZQCOMT4dFlCMHx16RXI8+VbbMV9Jizi
         1YbCQvw7yMypT+jqhzAS1G03Ef30vMZglRpxqyaRRv2QCe8Hl3Sj7HAJ97OAPtMcZMpi
         dyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802308; x=1780407108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wZDIcxhNgq8EiTwrgXOkvw460/44BNB66HgpB9Og4E=;
        b=cHp3dC+4tgGwRBHDTezwP8IgadCAsSmhvZ4fmS22NgdZtvpM6zo+29yx1PA3+nzYtx
         DqXbGwtHp8wIiZadg1UJHYoXE12rBIYHxRLI7QI9yWw1pyHXEWzJVER64WruogWd2cO5
         U4MWCiU+fn+JCJI3ow653mBzzA2M073YiPimuuEqD9pF9ETMiY1VVdOSgRrMKc8Iip+t
         kT+6MoVshRlZW2Oa8yIHE12Z4QDRbZPQNq6QN1QObB1CsnqJEJ0Ffvyj8fU4aq5sVX94
         lyUe2OerOuiNk+j4MG7NTpZrxKhRoQLvtAD0uOqCY1e0UB22KtNnSll6XCjQsuMiL0yF
         zVEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z/DUlIlZ+2XhwpINbF/SDEDjookh2SCGGfLKsVLc4bWEiDd5O//GzTadSWE+h0dAl5saAtKMEd9KtuMY2@vger.kernel.org
X-Gm-Message-State: AOJu0YyplzaXbAAaUPFFFrVBarHTbVPDGsCNz3ezXiqP3L7TE+QDw09E
	ny3GfxlSR2J3vqTcEy3T4TrlJr60ePFfIt9CzqAfdyHWOsFYe5/G1h3ZVqmjJA==
X-Gm-Gg: Acq92OFV3ZlAHSiQ8e2uv3RtJQu1yWRhMhpg3qz/Du4lFUu28tIx0W+xzUBz1M++aAt
	oeKKFSMSFJ4NOMJGUumU7QyWPCbuAZtHhcn5saWK9U5govPcCU3zc1D6rRZ4feb9+9HiHoZT14c
	Gpy4BAEUMEU6vUElWv1IMXZFnv/2vom0dn9fKCoqBGiv4jydlphBS6k3KPPDcmQrEUYsCdQIsbL
	fHQkVOD7Y/v7K9SPB40wqygUScwCObub2AI6jIaDuLM/na/U+CYWxuKsxF1wZYY1gknJD8si80P
	Hld0quIz7n2FnQQIhqUmw8FSmlZE97aE+vV85aBu9RXUGXGLTVDaiqi4FVWJH77X+08Zb93N/R5
	sZxkanXiPX3tTUHx5O33GPcNXMZFNzqWGz/MdUqa5kpwN7Ppmr1bfIqoPJ//iqQ/KztZWdtucQO
	URdWHTMB2doehKa0fdBoFRZHDiiw==
X-Received: by 2002:a05:600c:4511:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490686947bemr118650025e9.30.1779802297866;
        Tue, 26 May 2026 06:31:37 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:37 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:26 +0300
Subject: [PATCH v9 3/8] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-3-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E3DDE5D6A76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Vcodec clocks are added and enabled to the core Venus device both for
vcodec0 and vcodec1. To ensure they are added only once, introduce a new
property "vcodec_clks", which is an array of clocks which are enabled
both during decode and encode and is retrieved from the device tree only
once.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |   3 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 146 ++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 03804c30808e..c1603eebd757 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -79,6 +79,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -143,6 +144,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -197,6 +199,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 14a4e8311a64..be1cbd5cfe84 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -89,12 +89,23 @@ static void core_clks_disable(struct venus_core *core)
 
 static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
 {
-	int ret;
+	const struct venus_resources *res = core->res;
+	int ret, i;
 
 	ret = dev_pm_opp_set_rate(core->dev, freq);
 	if (ret)
 		return ret;
 
+	if (!res->vcodec_clks_num)
+		goto set_rates;
+
+	for (i = 0; i < res->vcodec_clks_num; i++) {
+		ret = clk_set_rate(core->vcodec_clks[i], freq);
+		if (ret)
+			return ret;
+	}
+
+set_rates:
 	ret = clk_set_rate(core->vcodec0_clks[0], freq);
 	if (ret)
 		return ret;
@@ -297,10 +308,33 @@ static int load_scale_v1(struct venus_inst *inst)
 	return ret;
 }
 
+static int vcodec_domains_get_v1(struct venus_core *core)
+{
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	const struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = res->vcodec_pmdomains,
+		.num_pd_names = res->vcodec_pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	return devm_pm_domain_attach_list(dev, &vcodec_data,
+					  &core->pmdomains);
+}
+
 static int core_get_v1(struct venus_core *core)
 {
+	const struct venus_resources *res = core->res;
+	struct device *dev = core->dev;
 	int ret;
 
+	ret = vcodec_domains_get_v1(core);
+	if (ret < 0)
+		return ret;
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -309,7 +343,77 @@ static int core_get_v1(struct venus_core *core)
 	if (ret)
 		return ret;
 
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	ret = vcodec_clks_get(core, dev, core->vcodec_clks,
+			      res->vcodec_clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+	}
+
 	return 0;
+err:
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		pm_runtime_put_sync(pd_dev);
+	}
+	return ret;
+}
+
+static void vcodec_domains_disable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = res->vcodec_pmdomains_num;
+
+	if (!res->vcodec_pmdomains)
+		return;
+
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		pm_runtime_put_sync(pd_dev);
+	}
+}
+
+static int vcodec_domains_set_hw(struct venus_core *core, bool is_hw)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = dev_pm_genpd_set_hwmode(pd_dev, is_hw);
+		if (ret && ret != -EOPNOTSUPP)
+			goto err;
+	}
+
+	return 0;
+err:
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		dev_pm_genpd_set_hwmode(pd_dev, !is_hw);
+	}
+	return ret;
 }
 
 static void core_put_v1(struct venus_core *core)
@@ -320,11 +424,43 @@ static int core_power_v1(struct venus_core *core, int on)
 {
 	int ret = 0;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
 		ret = core_clks_enable(core);
-	else
+		if (ret)
+			goto fail_pmdomains;
+
+		if (!core->res->vcodec_pmdomains)
+			return 0;
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto fail_core_clks;
+
+		ret = vcodec_domains_set_hw(core, true);
+		if (ret)
+			goto fail_vcodec_clks;
+
+	} else {
+		if (core->res->vcodec_pmdomains) {
+			vcodec_domains_set_hw(core, false);
+			vcodec_clks_disable(core, core->vcodec_clks);
+		}
 		core_clks_disable(core);
+		vcodec_domains_disable(core);
+	}
+
+	return 0;
 
+fail_vcodec_clks:
+	vcodec_clks_disable(core, core->vcodec_clks);
+fail_core_clks:
+	core_clks_disable(core);
+fail_pmdomains:
+	vcodec_domains_disable(core);
 	return ret;
 }
 
@@ -875,7 +1011,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -999,7 +1135,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0



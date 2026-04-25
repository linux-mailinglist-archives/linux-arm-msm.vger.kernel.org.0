Return-Path: <linux-arm-msm+bounces-104539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHcIJsQI7WkEegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507094674DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D13D83016D20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A40378D98;
	Sat, 25 Apr 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrg9nZ2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97D13793BD
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141901; cv=none; b=Zp3zmDnB80gETbCSUYFDkRhjE3wj3jK1qJB+rba65N+0RyhLIxIshnjeXoPJQ2IfcfLqGeDMHiNNcbpGOsZfYxOSKL1a+28CJsjOZRWicGTjIe0mCUj2e93LVlQufvBsiEqPPO2zQHoDY8xssqw2Ct9U901m7ROLQPKpoi3A0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141901; c=relaxed/simple;
	bh=yEAoBevnklvr751YiPv2ruAY/6bNGQFrrHJ3uHFmatA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTE9KpJuohPP3KMWLC8QE3bC4Lw4E8NOZucs1RsXtVz/zNBi1jm94USrTsxCIp6pGROtLm1gDamUrxuMJn+0USzrEB0d0hL22z4mPSr5AlmWDKD1kuGOiQdHddWNF8BbN+7VOzlh5KHiCFGvsjNNSZlwVQYzIOQ+jeimxLlJKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrg9nZ2o; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so63866335e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141896; x=1777746696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=Xrg9nZ2oVuCLyJa/xI5QEQqJhXznqSmyn0SgsSZdYIp5rCOR2akrLBxAhpPx7/sQ2V
         H7LyvGk2LtS7137BxeIrPWfG6oiKNYJJLCgmCg6wpQNYplgY/XQKulu/tG/0y0ILK63f
         I5e7HhjQOIZygy33CYQDRjPRHMi2HI4G7Os5nPZISZsGnk8DM6k1jxJOkIavhXGPUpTE
         SInPDx24ZbnB8cgIQSz548JA+uAsk0DReys23W/4wquMfrz3pLIaX8xWePs0sZCHe+Tn
         XeBjyFZ6RYy6LkGvClVwcG3suIFJXumr5oiNWBNSQ65EWi8ye3GQQQfYaggZRazW1GLu
         +4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141896; x=1777746696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=NKtPTNLepwI/usQeBW6ZuPDEK7KNhOKs+8SMlny2ZhFIbCJxBwrjce/M+AUK+RPh71
         2eF5tnwXHMiXhQuwyazAfgCX83vbdrUuCEJgeFXl5HBLVqAUNWvp1o7Bi+SJ4qO2HxzI
         35ewY0HWAu/mvwwtnGp2zT2eP/bkhIy2B74Lzbma8p92zEsDbzzkhCtruRCUG3lmm1Jl
         XgRDoW7BSxs4Dd20GqqR/0spAerYBpDoJuiK16eeynbjPSGO/lbkFRpAV8QVyk20vLsU
         fC8QoEQPJWhBzYeHxwEa06OvLXoHDIKE5M20RCQEVkAFSZq9/ZKPMVdiJmg3Z0MW2nEP
         LYWw==
X-Forwarded-Encrypted: i=1; AFNElJ95nc2wO9QQRUp7ANPONeNY60VnYuwDHkXjeDekGTXsCrOJp/Xy+P1y9Oj0RE7O4/uIBGDNyT7as9RhwbUc@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHgGh0nhURXk5/KJYa7cc0C8rBaYqM7RlgXfKfvnZ1Lw8JNt5
	Ztu+OwMu8fqympJXn2Ou6fV6pXOpHP4Ig5QSRPz9ON4u8xr187lRYL+2
X-Gm-Gg: AeBDies68m0oS8gkB+2Xx42UxR80INsl/1brohwq3hoIVrei2Xm45GoC1oegDZt7yhi
	hyk+/vYfN+6+XlJLTPorUlho7YrqNhoiqU4DuKeW+AeQXJqu64dKyKlvpFyarLfSklPomLn8RME
	cSuWcIeTY9KZZV+DDpvk7Bv4FKDzi+HO/p6tmQRFOKIWrcQAo4p6R11dVaD81Y2LdtfUcDV9F9+
	LrTVN1DNlb0a+NYhZIKSwCyJDpufYtVVrsENijUmuNXI6upvU0cLOUCaOeGogTXItt1H1gWTMHe
	RZArRBBFWN8+mLi9lrTY0h1BK0nbddliIKRmk2+YixsdHVx9hT2qpP8tIyc2MuIzd/tsPntoBfs
	gP8SmYgsk/99haIy1e33OMhx59QSRd2nZTlKTZdpkjX4Us9EKGX8X31fSptoQDHrbHZbY7PRdnj
	0/m/CxDaBn5hG0Eo5GC5OxOZHl459YgxT8RGkUe7t0P6aLnA==
X-Received: by 2002:a05:600c:a30a:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a581c113cmr215288305e9.10.1777141896039;
        Sat, 25 Apr 2026 11:31:36 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:10 +0300
Subject: [PATCH RFC v2 09/11] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-9-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 507094674DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104539-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Some Qualcomm SoCs which come with HFI v1 like MSM8909 and MSM8939 also
have dedicated cores for Venus, like in HFI v3. Move methods from HFI v3
to HFI v1 so they can be reused.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 66 +++++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..cc21a4762188 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -328,10 +328,56 @@ static int core_power_v1(struct venus_core *core, int on)
 	return ret;
 }
 
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec0_clks);
+
+	return ret;
+}
+
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec1_clks);
+
+	return ret;
+}
+
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -351,14 +397,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -376,14 +414,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -405,9 +435,9 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.vdec_get = vdec_get_v1,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v1,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };

-- 
2.54.0



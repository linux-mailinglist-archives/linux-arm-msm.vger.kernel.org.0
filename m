Return-Path: <linux-arm-msm+bounces-103429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPGOIX/o4GlInQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:47:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED140F1DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FAB030813EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687F33D3CF9;
	Thu, 16 Apr 2026 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjvvvtL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB13D47CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347094; cv=none; b=fJQDwb8mZFom39JE6Ur6WXGARVL1211qF2OKV30HQ7CREIZFj5X13ZmvF/bELFxS50OCXvEeRKeWgnCnY56UYJNjYp/AibKYownrzNBS+3SH6HR4lsRZq6m6HUPE6GB68+csNZ6cOGWgomSmg6oFfYwWEwq4iCaZ5RupUoxe1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347094; c=relaxed/simple;
	bh=V83toJRzq8U8D4mGDj0lJeN58s6MqU8MQGaAbFH2CNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4idEXEJdGQyV9b1Osjoa4W6uAf9i2pV7RACZl+/YbHD3casZl/SUdozYefAq461N3C9RkPp3x1tfN1fvQkn5rtzFvUAQJ64x8/6OFUTKGn3g4smTO1UQjhwkhg3SaBsXMWhcKkXdukudqpzSV5D9ffox9uGSSDwLPpyXrGg4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjvvvtL2; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7982c3b7da9so78636627b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347092; x=1776951892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtnVA07z93Sa3PHIsBwQ1JskBEYwpeJ7GU4WtOXVzaI=;
        b=SjvvvtL2e+RJbFO2GiwZ+xRA732PLucVmcgtxnuG5gvNlzwUGeXe2pbxDuGnEn3G3r
         7TFDz/u9sPLcSCf/I89T8MNkcASNU3jKzz8vRSmED4CdpLQ5ny9ZjGytKrLl0M7Rxr7n
         X4I1jLr3iUVVeiPv1Vl6frD5sHdq5TORiTs66sPylMZPUBZJJDCROtk5jQE0OrgtyWvm
         xQjYFH8OM1wKCk3gZ1ET30iE9OBmSpBOB97BbYnXr1WgjmFnSe0gn+r2enNMB7VmsFUL
         76NcdQG3rnWf9kagPWDXJ5BNUI1XMuHHkqX+2d6JKh7te6+LwYcMQZyQ2itN5qcZskeD
         VAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347092; x=1776951892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KtnVA07z93Sa3PHIsBwQ1JskBEYwpeJ7GU4WtOXVzaI=;
        b=LQrBA7jsvs8r0otcs+oAMXwv+Mluh5uzreXBKrUqkFYvvdNPr6pivlHohdwJSXY0Rk
         t4ehbWlR0s/uB9B2Y7ufHkTMT3Y4zHceTVXOfqdrFw1NJnmZi6xj87Oo3ewe3ihkK9qU
         aPYCMZ/IPNiDwTxbnetINx4TBoZcDaUez9FG0wl7YvNARiCb44KH3jB6GsY9NaAAMZx2
         rW2aPJmutZ1trZFhWHEf8AMdOT1RncvjDZscgvUNvbkn3ldxI6N2mwb2KBG9PucHwt/0
         RSLqkEyFKfeWtGYJZKA5fz1p/9uUIpwUrglDIQ5Wbqo9v6+mnFXcjRico74lwPjcrZ0w
         Iscw==
X-Forwarded-Encrypted: i=1; AFNElJ+J11/xYxnkKexx1blV4peK4IIP4+NRUT9q66ytYIe85cd0ZcWga+MvHwvYq0uGwEJBqoNB4E3+T1zhb3Xc@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLHaAdMNBcKahyTK5BjT8vncEA30wfQlNEt3OzYUzICj8s0kP
	5XFLkvlBcgtKgE3tLf4NiZbpmbavKDFDFhkBdmy1JvWRDVdauELmDPA3
X-Gm-Gg: AeBDievlLAHjgOtbNcT2EQGIBdXH/jI2OHN64y7RI9B1o3Rx7wMxNRvaOfQ7oRdCcN3
	MuGUgnW5kIUxS8zd9B+VpWlaUvZv/jOv8+32w8YNTl7pQoMO9Wavg5D6c0Guja4AG3M7E8nbujQ
	FNyEekyTREY5HiAUsVmaXPYGKRS3uCRIevUJJeF4m13MVglMgJXC0vuPKKCZimSm5+xmixQida6
	b3Zi/pt1Im2e/DZWHmcBKQxlDf78cieBJD530hTC08oVV+uqQPsOKFFOSaatqtfg8mluuHkT9q1
	esOB0FCvVTP3SYbuiglMCE38/7bSNecWsQLmlTzeS1Jl1LDi+8FmPRtkXbxTjfuujif2MCGluQM
	LpM4RoRyRNHZcYR4oTuvfs9Kf4LqjEVJtC89WZj1+IYiy32S6NsXK8UwaE7rU24mnYp25fedVmz
	tj6QX+tIwJS31USKlmKOpwJNZZgw==
X-Received: by 2002:a05:690c:6983:b0:7b4:378c:f72d with SMTP id 00721157ae682-7b4378cf8bamr136828277b3.42.1776347091671;
        Thu, 16 Apr 2026 06:44:51 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:56 +0300
Subject: [PATCH RFC 09/10] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-9-a09fcf2c23df@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103429-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FED140F1DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0



Return-Path: <linux-arm-msm+bounces-101636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN8bBmqtz2m5zAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:07:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76264393EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0368A307BF07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D9928CF77;
	Fri,  3 Apr 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RYmwMj3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19C36404F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217861; cv=none; b=qCzKCLT6p4J4JLpxpQWDJjYmHmBevneUJ96hc7Mn7r24qBUhsVqqAmBke4LOjnMnhPbelhi0f1tMCaFYi8xqRDlhvCeTTmOxEt6GBbmsldS6Qen4dtJblVfoBhH2mwaKmgMDH+98v/+bYbrGIloT7Vvmcs9XSaBiH7dtP7h2PPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217861; c=relaxed/simple;
	bh=BwXLHFNYLRV0NDjr952JqfGJ3eYoCYyPIzZu133hrds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChskTrXj5MxklPnX0+YuIi29bElU78cERGKPc7ZzudYn5whim1ii+Wsx+D2m43BaIBpVlpJBBZ0zfFyJ8y0svLvDeJr6Ll6wzQ4QfsfBVDrNRzalJxaNHhnizWUcDIj9Qx0V8Rc52Uc7i6+bEXxT12K3E11PifM4tb86HIK9Nf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RYmwMj3O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486b96760easo21160825e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217856; x=1775822656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bxQmMvsQvjjCBqN8BcQZeFluIkfqmLXersnmxU0RpY=;
        b=RYmwMj3Oi18V+6AnIr8TGC+/BJ2JP77Sjv2H2bm5JkdF/T1FIVna98aVg4dmdGAb5h
         xhT2yq5v/+YXlPEthRSvgg5X3Pp6+0b5J7YR8aLoK75hFY5/6NZ1tMaFnTEDyT6vQMuu
         +CfbJ009aeQ4e1L3vjMOH9uE7kQZ59kmNo45SEu6TD3FnlMzt3CZrgfNxQuecG3skH5R
         Zg7IL591j39kanVPB/vMpRzKXZtsn0cQSPZ3nGJqQ1k8Lx6siTjIvqiKu3sN52ptiZrA
         mNUHFJQ7ACQK2VEcgow4zT9tEkq7oZGQ49oPUbH/7yUOeJx4vPHuTd+lcmcJbZ/jjQFu
         YPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217856; x=1775822656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bxQmMvsQvjjCBqN8BcQZeFluIkfqmLXersnmxU0RpY=;
        b=e+OPSt06SbkgaLwleqRBur/FcpO1iRHYKPLzK4DUJ8g5CO15uhWR0HnoxAb9J4mOSQ
         8bis8PvzGszRst8yDWD8+h0AUjhtV1FemqOJjQQxLdm3GICak8lXj8IRCRx00R9q0x14
         IfoVBhjtL8G2H7UHOibrEiQCJCS5yYTDfZ2whaGFcpnueNlNDCXsrJzLcq4wFL5ePh+v
         h9bnCkwOYPh59iAO3IRHZuDq6HydKSxer2evge+PWOSSkSf4GpIReGO9REj8kIZuZqFw
         OH00nYIlqachAu+c1DhTdiLQhUYmzBP5grcx/ZrXbVLIYMYI0kwH3pMDPxubLV+kKo/W
         Lufw==
X-Forwarded-Encrypted: i=1; AJvYcCUV4PfXwMS/rbrPUFmfhiK0mTN7euciwAFnR2+sh3YRXmcO0imxo76c0II3I6GpaQWZOdbgJeP/HRtJ7SJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmCnd6J37zvo3fHp6hQtUtoi6PgdWlwWNcFJ5OGOyYNSbdcc1
	6qlTRphnq8wv2M/iVWYdpQOo3jHx8/AArGiNAQIeBwUZ0SUBnZSLmM5LgNwq4Ta2fJ8=
X-Gm-Gg: ATEYQzyDcvwUVVcg4rDvVtreoX6jg1YYRGYQyGlo8KXRxxbgpW+nqhqkEnl9mtYaYJ5
	tbv+GATXpb57p8fFbRYhh8X9H422wR+SJB+RjPcP+NLzJ5bzXauxbS0z0fTvDym2x+Bfa4/PlGo
	wSOrhcq9Rp4sfuYyfvXXsf95iH9sECTP7odtG3VI3zOZc3jdkTdpev6mmNJNpsEQ5XDmwCU/Ebt
	40YqXQ1PDg3T1SU+2dgL23N7NCT/XjWa7zV6war7J4D72Wn9KVAizw2OTuwTMSGqSvxhAn8KUPJ
	9KxUx4SN9kf+EVp/g6Rmfb3gow+jVM5mCaAQSmR70AXA+8DvJi0Xjbd6z2QeVn27aEoaEpp8lYJ
	4DIhI3MYRS7ADddps6ph09UKp0l3OqUL0zdG39GIogIDX9JyIks4Tok4cZxNabyWtaJfJnc7R/R
	RMTJDSIqLIv03MA2DtTT9DyD897Kx0Balazg==
X-Received: by 2002:a05:600c:4ec7:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488997ed834mr42353285e9.31.1775217855719;
        Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:47 +0200
Subject: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=2000;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BwXLHFNYLRV0NDjr952JqfGJ3eYoCYyPIzZu133hrds=;
 b=oK+n+UfVPUvAs3JqjYta0Wct4THXUio5bVmhJJzJIwOMs3yp1pA7dhAV/2ySBKNvNtMsVo7dN
 rOCjSo/YPbbBjEk9MuhEH4X5MfbuYAfiwbQ/AtDaNqOLsJI9mIUq3yA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101636-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 76264393EC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b818fd5af8bf..13e7892ba39a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -187,7 +187,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74..7b0af0ba1e68 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ .compatible = "qcom,sm8750-gxclkctl" },
 	{ }
 };

-- 
2.53.0



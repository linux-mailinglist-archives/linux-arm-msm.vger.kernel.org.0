Return-Path: <linux-arm-msm+bounces-96274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EU+KS3crmm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:41:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E214623ABCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1E5E301CEDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFEA3D34AC;
	Mon,  9 Mar 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOKoVrLU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lsjrm3d3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF63D333D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067169; cv=none; b=G7Fq6baa+yNBTpQjujGLmAoa4TjSnPw9T6bx2JL+0u/xNmvKLoN/4eGVYHuMPwjP9O1jhk+vTYcdpYQadKTOVbG9w8T5Nk2JZ8LOfBIEpBIGgcduOg1u9vSUS/ey756Atkp6dSM9HEd06aGISZ6KGxh//eo5OicY/zxbL8K45cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067169; c=relaxed/simple;
	bh=cs+bYMwjQyeXRJYn9Ukf0L0Sx16lkh8uvsSX1xdWPjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvkDIINc1c9M4q8fXl6xQ2kX7kKD4XuJwPiom+vMjVfOpku2bM4nNp0EcmXDh8ZIjJfQY6m2qgOxrVVhIhI/kC9ZoFoM/HpU6DG/BvYOeWw1EcAAHO92e70f0wRsc0bA7Au0U1kXE0FKm8PFQtTkP8J+IgGY2Xrzhab/4doU6Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOKoVrLU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lsjrm3d3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5awK10415MrJyZgxJIpgfvMNalFSl2XKXr9RBN9IsuA=;
	b=cOKoVrLU0DlniiTAi27O1jxyI4f2Ommw/9r5iPEWJQq4lsWI2KN/VSFW/hOCC2yCE6khmX
	+CSELNVfWYWyF28gCyWiM/a4xC3DQw7As9mqBcE/mKSeIGQmr8C5zgzerRsP3Jr3jkLQ6z
	z/pGkgtAfPgYUZsNbpMjhAGYsdeFqWE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-0RzzfvhQMYWicKrk-P1wUw-1; Mon, 09 Mar 2026 10:39:25 -0400
X-MC-Unique: 0RzzfvhQMYWicKrk-P1wUw-1
X-Mimecast-MFC-AGG-ID: 0RzzfvhQMYWicKrk-P1wUw_1773067165
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd858e8709so1071572485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067165; x=1773671965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5awK10415MrJyZgxJIpgfvMNalFSl2XKXr9RBN9IsuA=;
        b=Lsjrm3d3DIFW5778Hw9dP2B9GHSpg8hJeEnhPKUWQaceaUlJJcw2rN2LV2TjBSgD/p
         DUo8blBzsEEdooNsp/zp7yszoURo5o3MGp6xIe5eh7GP6LWriKB67DHKCu/qUfscQmhf
         MW4WL+YFQ/w87jBxAqfhea5c0lTjpCf3KVAFVLwL9WaFHLfyUoPrYytITeoIDkqPA0KL
         ltk8D59+XFXfIGjUpBph4+0ZPbNkmkI2hbpZsetZxUY4lXM0WWxk+2dMd+i3g+8AN9ye
         Y6f4LB8AhzjTDE98ZnCkXIMje+38puMMiss/kkD5egl6O+sg2dMP110x7ftprRkR40T5
         dTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067165; x=1773671965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5awK10415MrJyZgxJIpgfvMNalFSl2XKXr9RBN9IsuA=;
        b=ZsFO5cJemtGjnhwlYFWcpHclmB7oLEAc4/AM6LeLW5nmXdVPXVqIj03IowU8pnQb5e
         lKZvl7Zdy8InLI/oxGN2uwPBYeATkulruiEWxPcye81gVbfQA4mw3K1BJ610crTX0wzv
         P/rCuPvT8yVCiQQLi8cjAU5y30ICZDnUqzL3zs9zwN7CgzF8RS9yFD9/H4SOeXeg0umV
         r4Ns6pYYkVADn8gjcLQ0NSk3RI9zPQTPfoZlsyg8sm5RQl5uqyF3mY7mIFf8Z/psUJCA
         GnTmxp6jDdks5J6OOcOVyluZhPHi9baYKOIVgFTNTzzPSmT9Hve5nVKNbNF61GT+ZReZ
         9YYA==
X-Forwarded-Encrypted: i=1; AJvYcCWqICTuFd/W9mggjPR8PaDCEvfsgWudGWjjikKi8YVCvA4F9mk8Q83wHE8ugAtYlN36068AjQutCi6IpnNa@vger.kernel.org
X-Gm-Message-State: AOJu0YxAZEuXv3neP6hEepxi1ZjEQbppep5cUSNj1mmmIie++RZYjkp1
	fyxVO/bzZf8L6l+6aBFjAzWR1wxbGdGFOjmxRQNM9kgUSUb3I/P/1+/rJ/cpIRTS5S28EXyS912
	9m0W9c9T9GEY5Lo0kDUI2tJ/bmWdVq5rz8Nx+ncCQMjZ4Jy22ynvOrN7UV2QScZ6JsUw=
X-Gm-Gg: ATEYQzx/rW0lVMNoh//iPxVIW1G2HC63oxOWzINcU9v5aJ43tN+5YlRn7Ya2J+a1itz
	qFskZboyGA9yoynpkD64/YVEZ0c6V2IiQw7ITOQ6arHkhKbMn39t6l9dK2VRFBKDiJVzGHrWArl
	sr1Qrg2C7uOxAXuZhjvx91Jl1gQoozOaJYpX8CD38ryWDp3nWgqx7HyKf6EvNAraMh3UUPNdnF0
	Nz25sO8Zp7Jde0c+wo6agh4yWua1tzc5vlb8A8JMY+slBKEzeDnMtMO7Wu84xbrSr7ucI6nuwd3
	AA3v5JQOYAu6W6GBKLsXL5peMhNT2QTBpLPE9soPpRczk16/3O81iPBqUCo0G1+3n7+xe+WgxtN
	h6S5nbS83Qkxm0jARQiWewI9mcMHmuH1D/n6uE2LTcOW7y+zmsrqls95cGOJiOA==
X-Received: by 2002:a05:620a:4004:b0:8cd:9365:f27f with SMTP id af79cd13be357-8cd9365fb75mr10086585a.51.1773067164481;
        Mon, 09 Mar 2026 07:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4004:b0:8cd:9365:f27f with SMTP id af79cd13be357-8cd9365fb75mr10082185a.51.1773067163991;
        Mon, 09 Mar 2026 07:39:23 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:40 -0400
Subject: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5325; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cs+bYMwjQyeXRJYn9Ukf0L0Sx16lkh8uvsSX1xdWPjk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e4p6p/9/bRNG8unhOh9XV2dEmpOUoW/50S2Rqxte
 F+j//poRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABO508HwVzpZa6tR03/JGIXf
 aTejyos0jIqOe7jkvvJc6Tgv/eKWGYwMH+fp9f9nyOc88HjKPo8NE7jtpauuCUyWu7v4pMrJrks
 hjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: E214623ABCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-96274-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

There are some clocks where the determine_rate clk op is just an empty
function that returns 0. This can be either because the rounding is
managed by the firmware, or the clock is capable of any rate. Add a
new flag for these type of clocks, and update the clk core so that the
determine_rate() clk op is not required when this flag is set.

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Frank Li <Frank.Li@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: arm-scmi@vger.kernel.org
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
---
 drivers/clk/clk.c            | 31 ++++++++++++++++++++++++++++---
 include/linux/clk-provider.h |  2 ++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f43690d7dcf75a7c4ac3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1557,6 +1557,21 @@ static int __init clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
+/**
+ * clk_is_rounding_noop - Check to see if noop clk rounding is used.
+ *
+ * @core: the clk to check
+ *
+ * Clks that have this flag enabled do not need to have a determine_rate() op
+ * set, and will always return success for any rounding operation. This can be
+ * either because the rounding is managed by the firmware, or the clock is
+ * capable of any rate.
+ */
+static inline bool clk_is_rounding_noop(struct clk_core *core)
+{
+	return core->flags & CLK_ROUNDING_NOOP;
+}
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
@@ -1589,6 +1604,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 		req->rate = core->rate;
 	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
+	} else if (clk_is_rounding_noop(core)) {
+		return 0;
 	} else {
 		return -EINVAL;
 	}
@@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {
-	return core->ops->determine_rate;
+	return core->ops->determine_rate || clk_is_rounding_noop(core);
 }
 
 static int clk_core_round_rate_nolock(struct clk_core *core,
@@ -3528,6 +3545,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_ROUNDING_NOOP),
 #undef ENTRY
 };
 
@@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
 
 	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
 	if (core->ops->set_rate && !core->ops->determine_rate &&
-	      core->ops->recalc_rate) {
+	      core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
 		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
 		       __func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
+	if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
+		pr_err("%s: %s cannot implement both .determine_rate and CLK_ROUNDING_NOOP\n",
+		       __func__, core->name);
+		goto out;
+	}
+
 	if (core->ops->set_parent && !core->ops->get_parent) {
 		pr_err("%s: %s must implement .get_parent & .set_parent\n",
 		       __func__, core->name);
@@ -3920,7 +3944,8 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
-	if (core->ops->set_parent && !core->ops->determine_rate) {
+	if (core->ops->set_parent && !core->ops->determine_rate &&
+	    !clk_is_rounding_noop(core)) {
 		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
 			__func__, core->name);
 		ret = -EINVAL;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..33afef9403b526976af80881461bbfe1e4b76c77 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* clock rate rounding is managed by firmware, don't require determine_rate */
+#define CLK_ROUNDING_NOOP	BIT(14)
 
 struct clk;
 struct clk_hw;

-- 
2.53.0



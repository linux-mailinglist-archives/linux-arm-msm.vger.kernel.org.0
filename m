Return-Path: <linux-arm-msm+bounces-116920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5k5TAAHgS2p3bwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:04:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD60713A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:04:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ShSnTQy5;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72B9D33D0DF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED4E388361;
	Mon,  6 Jul 2026 15:03:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666183839BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350180; cv=none; b=kIR35FGfFSO7pw5/6fC/UyIzqTsPmmPKbeNQOSA6isuGA+IRcG7VCNCOo44NqL9LYH8HuJTPJypvxL1SdVwFmnvx/WsZimVtfB4lZjtE331oIlE3ueABp6ZhyIAqozs6Re9fmzepzvXnADRVKRvbDgOuS5mhcqBaFD/ovcTIgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350180; c=relaxed/simple;
	bh=5azZ+o2bh9EVMF7MNU9aAP6q9dQc7Ln2kbE9ynYU0qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIBQEQ0OQq2kqyhn3QtfrM1zdrMZ+tK/DiAkWOWbPVH3sGGoFRdDW6JRZiTb4JxgCbYxgFH4HY/UM8XtKNWpk487T9CH2yI/537Qf2N6rhVAU3KfoEUfdmdC8xihnIU4fc/igyUeiPr+69vLvAQLW0CoM0WcOxJCOKCdegqI9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShSnTQy5; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so31573615e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350177; x=1783954977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcv8ineC8XwKKlGwro/pXww2q1g4p+cuWTkpuzvIux0=;
        b=ShSnTQy51OZ7dnBIIXK/NWUqCKc79VWUYASqIf6pOVQOC18Ug9ZvNtrt9tK0yBeDZc
         GSd69S8BPX13Xcmes+UZ89Lyh/w3mOaRNefGCmoVImgCZRKOPBg5ONvLZEFyYM6dUXuI
         ahDu6H+cX5+gq213dG0tbM83OTMtCcsuRQ5VMJ//Dlnxx2jUThMRKl1fX90LC3qV0H0g
         S7tjNXBb6FLBAT9rGTBKhJFfJMbj+rof2ZnwDK1h25B/ClMq0FSl1HRLesjlZHftTMKN
         VkS95o02jwpGnnbrzBt7+6CHbixodWPPgmnef+93lwCuKgz4ZK/18mNgabmapTexDi7g
         f8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350177; x=1783954977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcv8ineC8XwKKlGwro/pXww2q1g4p+cuWTkpuzvIux0=;
        b=hE/YkDjerMS1LJZex9rm61OEZ7NtwOMjVMHXxd5FLssEzOaP75z/GihrjtttO7xi9T
         PvM8GDNDKF6UHaxM6p31XWyYDwwixzG/S7N5BIB3wzOGLxq+o39uaZMsdYIvPokiUXYc
         /pWPBIXMthPqQeghyuaFekVT/U+naJj8qvF6T3Ew8hLWPqOXenOhR1HQ5nT1UvBa6MG0
         vuHgSFwBfBLMh3vB2fR4RIzR+gMD8Bt2Aa2FmFzHAZkbvPOCDcCSmFDnb4444xMMFyYa
         Czj2xD0po8bNRuavIJPdCTb6iqEFFhKHFNQAZHp7JMwNZUwTgaQHmFGe3zY1zUtp68At
         TeWg==
X-Forwarded-Encrypted: i=1; AHgh+RrJxM+ZyA91Q1xYrvPNlF4VmQhclzilWxqWK+R0zvMRth46sOgyfKrfbx5vOaJGjWrWihKi9Zkiw66X1kpm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WQaqXzD/7PbshvI0sIPgnfm/iZcwIKmIYR5tpUDKfwwhXTi3
	eqwG7jbVcIPwjqQrk6tP4A9Hk3OcQVZhKBs67Bzvbn1xfVmGSdgPy5X6BWj+voxB6q4=
X-Gm-Gg: AfdE7clzSe1nsJk+UqPJGjYcNKQMAuHiEc2VATD5854FMoA0bL4lPsw88FygQBFxY4E
	SFFkxmiMtCj9/Ni0NrPlinT6I0uiiz5qb0DUryPA5QZIbZoUFD85CIM00Pkhrr9M17Zt344TzTN
	QZxMzvQdkFUC4Iqkknod+KR0gcH1ExalNpcrmVvuklcQ/3xJfbSe+DOFMz2bnXnbWA9REn7VYyr
	3+9714HCPB7Q3wgvvXU7e+WvI5Vjk+ttz89ElJHmHgwHCWKgMRGgxmzJLt+egQUSMaasjZCYJhx
	4PkF1zbelhKC1m/7H9heBXM/uz8Xea9mjnL+EWtrBXtXAXA/lE2h+9ucv7mQIbZB93LCyIONrRF
	tbxxdIZA3WhfuozXWcc+Su7xNjy32wy6Fm8psWKWVFwe/2SFb1UNirjcqUQ2wpD9AnIhav0uB9s
	Wx8Fhp4QIg5TMGU1/WntVFg5BW7Q==
X-Received: by 2002:a05:600c:3b03:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-493df0a0271mr10545975e9.35.1783350176643;
        Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:12 +0200
Subject: [PATCH v2 05/12] clk: qcom: gcc-mdm9607: Increase delay for USB
 PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-5-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116920-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gerhold.net:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FD60713A79

From: Stephan Gerhold <stephan@gerhold.net>

To conform to the specifications of the USB PHY, the reset signal should be
asserted for at least 10us. Guarantee that by increasing the delay for the
USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
qcom: gcc-msm8909: Increase delay for USB PHY reset").

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index feb91e1fca1f..092076a5a0c9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1568,7 +1568,7 @@ static const struct qcom_reset_map gcc_mdm9607_resets[] = {
 	[USB_HS_HSIC_BCR] = { 0x3d05c },
 	[GCC_MSS_RESTART] = { 0x3e000 },
 	[USB_HS_BCR] = { 0x41000 },
-	[USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[QUSB2_PHY_BCR] = { 0x4103c },
 };
 

-- 
2.54.0



Return-Path: <linux-arm-msm+bounces-112197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XfKCHPQhKGoV+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:23:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065A660F76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:23:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=wRoQKp4J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112197-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112197-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C451930EA3C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF44B348C6C;
	Tue,  9 Jun 2026 14:15:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A1349AF6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014525; cv=none; b=Sq8E2OUoeG815YuRDXA9UICuedqskrb+BTxdhyreRh4xD5Di4tC/L93/fIp7OnUjnCuMIKIQQJey4QLEQ+NSRSOl8vHGBotLn0iVZ6VkvCm2R7gG/AwpiAVt+425elrN0wgekIASGr2CAl9ebQwW5/YLRjfCMO+A1URD6hX87EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014525; c=relaxed/simple;
	bh=A5RQZXdK76lJt2J1ilsEmaYiiIZQId4ou9RP4QENTB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbkbU1efjCmP92E95w/WDC4k1Cm7v6U5IIdHgUoBfNsvRgAXGwRDNSzzPEFxEwnCnwtKrXDXBULfCVo93c/VvJUBX+HpwzZJ7fwfl8ouu3xLYE+5+Gk2aTaVqlXDk9IxX+1Ysx1LNQcVsOgVJ4fTys0yieYH0O0IrCJXBQhZQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRoQKp4J; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so27860665e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014522; x=1781619322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYmYdF49mLEjNdBagNOljeKdmXeXyuwsViyjQ5L+0Dg=;
        b=wRoQKp4JTDBrFgCj1ZAkCfqp7i1ELScQZQ7yJi2uOC1XLCxzF+vnYodKFOTtvrgwUb
         IvczgrMyUcsr2PBjUbh1et0t1bZRRAZPsJezpvsOhKVxz/nz5Ng137vnD4ySAwNpiG4d
         Tyqf64gYfwUxe30vQs0PiGuGd/UXgLZdf0wb/GH7GZWcHXNOdBQ1O8Q4+w8oLiyq4cAY
         oUSc5ilgHrkgID0Nwcf/sF9Y21vwD0aTvVtQD7cVI2eQz3+QM8b7zFErmQHvIG4n+OpY
         D3/yD6ZdkJ49K3LuEXcZfv8AX1BD8Or3PkO8hKC9UWoWezXJ7A6xJp72LspW/z2nJ5dQ
         37/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014522; x=1781619322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rYmYdF49mLEjNdBagNOljeKdmXeXyuwsViyjQ5L+0Dg=;
        b=Nk1g7HVbdSUqCpoLfpU9B9yRKHN0CtogthU0lNVU8VXObhMr8Uop2JrH1pEwxSTeDX
         fBGFs0kySqTSKxoKtvgevysiDVTViMmYE3doIvpcu4jg97eB8ZR3vXaiI8/7dTqcpSjp
         hnln90vnGk3Jw2MkG7pcOy7v3+yGcJlzap66KZi4x2Q5ME5tfMqozJqBVuaDDyp5K8hU
         BbsOgMe6GAkMs0KcG6WKLNnXourt85ez/0mGKGkW2/YHbQsIv/VMPvK4uhRMCS6nXDVT
         /qfKAZ0+LgwC7/oCWbvc3oKOJDHeNezHwWC59bTe7BNx2jmFzTtBAp+IsrAS6KzJ/SjS
         21zw==
X-Forwarded-Encrypted: i=1; AFNElJ/Gt3yyNdry2p9J1cDnxtkAIBO775YuI6Jyc+F5j1s1voygWTy50QmQo+Makc60P7d6lmtk9H1Vp+ZksgcW@vger.kernel.org
X-Gm-Message-State: AOJu0YyEiOGS9nrRLfRY4aE3uA5BrDv1vm9DPCHdsdVRn7xpjmvR44vj
	GgDQREttIyIUeajKAb66z7WQ0VF1ZIQm8YeuQWj/vaFKvjHe6ERth9fJO2z99O2Y9Y4=
X-Gm-Gg: Acq92OEF12AkHuf2oRN395ha9sQoiwwLe+qdKMnk0ALGqCtCR2VTrp7o/h7w9ZiYbSx
	+2hrYvk0hfvBbYXiwjg8KoVn+FuWlEWfqwAbxBeCRg6b3OieH7cxCf+0+/ZVCFoJgFsyLGH4gfM
	ogw6WC6YCQryC8CdligntTqmRZEbENWITKvqTSGtGunJu10kAgmUa5JeIEorynQEd53h3U56svL
	YW40t3M34l3rLI49+DpXA+wQpmQr04+mDedLflClFk1CQRhT+QP8eYF+pqNHfPqLUTdGwUC2nNf
	h4bnHvgtllN1oqweBc4xeB7+nP/Q5vAYymcrlOWBdj4zpDYE5Nde62yLgnCH+k9b7pQTtpa7lub
	peYmvOWicvPUkiVzgy4uePEpxw8PS/k8ilAD9jxkzy0wjbhrNo2RfPjW/EszP9k9WbrvxnHtWy2
	rnaEEqEfCquN590VfoQCeavm2QJA/J5dz7uLAYIjbcxNQ5ChM=
X-Received: by 2002:a05:600c:3b11:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-490d9d05211mr27027635e9.18.1781014522040;
        Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:42 +0200
Subject: [PATCH 06/12] clk: qcom: gcc-mdm9607: Increase delay for USB PHY
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,gerhold.net:email,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2065A660F76

From: Stephan Gerhold <stephan@gerhold.net>

To conform to the specifications of the USB PHY, the reset signal should be
asserted for at least 10us. Guarantee that by increasing the delay for the
USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
qcom: gcc-msm8909: Increase delay for USB PHY reset").

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 8fc3ff2559f0..7c1890934fe8 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1571,7 +1571,7 @@ static const struct qcom_reset_map gcc_mdm9607_resets[] = {
 	[USB_HS_HSIC_BCR] = { 0x3d05c },
 	[GCC_MSS_RESTART] = { 0x3e000 },
 	[USB_HS_BCR] = { 0x41000 },
-	[USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[QUSB2_PHY_BCR] = { 0x4103c },
 };
 

-- 
2.54.0



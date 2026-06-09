Return-Path: <linux-arm-msm+bounces-112200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y6r4DjkiKGop+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A124D660FC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=OM+IelwK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5597930D6568
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0943546F4;
	Tue,  9 Jun 2026 14:15:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B4351C35
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014528; cv=none; b=E8XArXqBML2Pb/XfUkt1MnS6jAL7sUCn61Da9Y1VGhXvoIJ1dtgd10TQD6H0i1P9bMo79znkWr5tEmZ27iLDu6kVcDR+ullmdHQe2M/DeUaNykEB0z9eIjN3IxXYED/eG7txloYjyPgCLPBATfUHCilesEQ+ek02+AsW9IfcYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014528; c=relaxed/simple;
	bh=lFg+F1HUzAIVKFEHpDSN0ieuO1JF1dx9VVjzKFZEWoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxy0gNZ1qu2sYSIgci8mfV/U0krtchcH8Fgpk+AXBGIpNq/mh/tjFFgegn9tf+1+XFkJl0+Kp42pjF5BrdNtSxsXopcLJf239/gyZErON8zTLS1ywF6rsnPX3vTwElTVBciQkxLIUv7Yl3lNZ896ds7Yw2J58nTH+7BpuQrynkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OM+IelwK; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so37835365e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014525; x=1781619325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVZsM7CRVUQ8fV8QGfF8shrTWLN8ATYUgZug9STXKt8=;
        b=OM+IelwKtEVUQ7qjgFibv/dX7RLYiRtoBU24GGNrdfchk1TPNSkc9SG3G14yyR4wfJ
         a3Lj1Nk5Xcw8phNTHUSHIOYlukAxHgDdg2w8gcTDssNCaMluT+GVPez2JRZ0T1M2+9aB
         s6e8YG4cSD209tqmlUt+UFsm9IvciLmKJLNwSjvfDovtwKzmbAhhYS6u9kcAs6BWL2pg
         Vxfzm9Wd3KTXcNdNlTliC8qY1WDbcUYi2oyIhMmeckRxfrTVyDp3SDfV62og30lEs1Zb
         lku6Ahv5hA8IarU/AJD0H0Z/Dkwi2O4DcBV1/kOexKlZM1DY6k4Z7sEqsuTyNSxAVluX
         d4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014525; x=1781619325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVZsM7CRVUQ8fV8QGfF8shrTWLN8ATYUgZug9STXKt8=;
        b=ggujHYUuCjUVWoIfmOW3zQeZqdvt68s/kdeWjWyjcG3DAzg9+HpHHLrw+2gvJO2Wkb
         XyWkdywzVZuIhcVDL3mHzojoxX+1vxIyTmd44MBktzJgweSnf5YzPwWocIdmmmpiuA78
         NQJsiK6RNmlPS4nZ/OCtoPly0KTU5GFZpS549LXPSY33fm9ajMO/o5qYIYo8o385RaLT
         iXCB0UYVDQv7ZeWdEeH46OGOg/ZAK50gzmdx3Wa+afV8R3r0NY1UwIeMLL42hTfGflmF
         mgH9J+pp9zRUWVXjxlA8BZQfbqqAgU/uahOm7lflVL4nx2tnfAoZci/NxFFbjwleimPG
         nOKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qZiMZ5ZJrPTObMW4NqsCeEbs4CjLvmxrfUcIodpFBHOBqiD7UvpMUOEprXglfS+lh3u8LosGafSw7Tlp2@vger.kernel.org
X-Gm-Message-State: AOJu0YxSJxSWL4XS9uTpZZG2J4qMqcP4miVkI5l8sN/hF3u5XxCJFVd7
	f2SON2hNvf7JLR97Y+38pJfFZH68JG6Q8Vo6IaCSdE1ogfnIU9wiTOVGY6QJwZO1oVk=
X-Gm-Gg: Acq92OGP/AjXddwtsogcY5LtZHO/aqT4sszz/jthwP8lte+Dqox98+gPu1YyA9XQprW
	JKVPjJPAWMRkgLZ6YJyNHxeLcbolOyhkpHjtQbQDqlsEaH9a/g7efOoXpZcEaPsvUJzYogS8Wbh
	9IxKAFz/4s+J8slZlMOsBqLTcl8yUdwdQr01L1JU/QsqiA+0J4c5+sJckCSfOlowcLeriRxd0LL
	HQsd4ecFUn4C6tg2RXukEAGjReJ2xyitiW42CTrzcei1UVpydjIEZbnNbn6qr5XAuDqy59U49YF
	9beSywypkxzXzlEpxcK0SkxsxI6GnLCSP1wAuddfscWb0wZzO+29IsP+KsTo+AJE0x0Zh1hzL5o
	y9dumo9VxqiBPjZkgxQ9NsuIr4aM86MqAGoDMXSvi9KFYR30T1PLasVqhATAFjQT2l+Q6WwqdNx
	rXirqwG64iaj1njj8FAicq85rN6vmwiPXEFojN0WBYBZed1fM=
X-Received: by 2002:a05:600c:8712:b0:490:958f:2a5c with SMTP id 5b1f17b1804b1-490c25f17dfmr361700555e9.17.1781014525495;
        Tue, 09 Jun 2026 07:15:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:45 +0200
Subject: [PATCH 09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop
 incorrect clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-9-5e9717faf842@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112200-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A124D660FC3

From: Stephan Gerhold <stephan@gerhold.net>

These clocks do not seem to exist, they have no consumers and
reading/writing to the registers fails. Drop them from the bindings.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/clock/qcom,gcc-mdm9607.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index fe4c15be3781..23d15179107d 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -13,7 +13,6 @@
 #define GPLL2							4
 #define GPLL2_EARLY						5
 #define PCNOC_BFDCD_CLK_SRC				6
-#define SYSTEM_NOC_BFDCD_CLK_SRC		7
 #define GCC_SMMU_CFG_CLK				8
 #define APSS_AHB_CLK_SRC				9
 #define GCC_QDSS_DAP_CLK				10
@@ -38,7 +37,6 @@
 #define PDM2_CLK_SRC					29
 #define SDCC1_APPS_CLK_SRC				30
 #define SDCC2_APPS_CLK_SRC				31
-#define APSS_TCU_CLK_SRC				32
 #define USB_HS_SYSTEM_CLK_SRC			33
 #define GCC_BLSP1_AHB_CLK				34
 #define GCC_BLSP1_SLEEP_CLK				35

-- 
2.54.0



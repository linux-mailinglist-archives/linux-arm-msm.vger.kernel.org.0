Return-Path: <linux-arm-msm+bounces-112202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6eeGIR0kKGq7+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:33:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5366113D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:33:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=OHT5513B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 109E630A9FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C8034DB6D;
	Tue,  9 Jun 2026 14:15:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911635676A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014531; cv=none; b=GpGA6pQoP8vW/9zhS/vy5B418t5eXF9KNeH9StHt6j18AOZ3/x6kAuzowde2M/1lnNh5KSj5Y3DUyiBQiqSMQzgm+k1tDMmj5shQhPLdm//H0nC/PfRWEwxsXFW9lG7sVnH5XG9QT8J0uu20+sBLkoEg7MR+EYDJwRQH8u9ie/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014531; c=relaxed/simple;
	bh=AYE8/yTvZRcI5dAmg8Q5FrVlVGaGXYkprn2mgV5S9wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShHqPK4FkJ7KmvdmWjpwH9HBrJj3nSblwkhpUcOvVbu7jh08rzPjOf7/sYsw07zWemMhPKXUCM1zSqkQfxVof2jz2Vf+qJmgrKKFbaxEpr94K5o+VLt695cets0fgsyDJeH4BvTBMN//ZTXGxAWj8YL7jxBKu1hPKiyU8v29mso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OHT5513B; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso44279755e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014528; x=1781619328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgvmtFO9MyKbYJX4a5Py/me/oMsrPj1RpQs8PD55NQU=;
        b=OHT5513Ba1Kl8WmDDallQaLp9HH6tMSOjBbBFweVJ78T94QJLuLpJ/REXBRspTkcVZ
         NbUy6s4oPsUeCneYrM0R0ZkbYcl8nZV6MTP+6/a879eWobRhdwovmVpBHoV31BUelMJt
         wQhNjWCIsmUKsK8gAMAhu3aOVxX7uPQYiDFBGwzSX2w0G3wlQht8bZUCGPCiCmP7krXl
         8RLMJeyorQuF0a3r3DQ7p8WFr5MOxKmVEK0mgWQ+TCe32fwE86eVcca2gjCi/L3aSPr/
         0QeEp2Y7gs6cgWFhVkUGIPLvgEzJCD7I5UuTfsa4VJ5Wwn/tWfvA8OBThoRRKoZJun7V
         G/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014528; x=1781619328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgvmtFO9MyKbYJX4a5Py/me/oMsrPj1RpQs8PD55NQU=;
        b=kY90pg5QTw0RNoR35XmKq8Vaxeizg2wMWd/nSegdb/uZAA2fRPjKWZbYmLGzQ+y5tD
         PGjKYnXi0koGU9CGt69SCpGNp/5axi/IkUaOsFZUlAOwXFqB9vUZ31KzdpOO9UypUXE2
         Kpk/uH9ZNxH5LI4KKwjL8xjS8yLo/at09m83eg5abY9G7OTJSySIaEbzelmbaKTsdBYY
         Nizl0uOG8bo5tpzKz6rGdFHa+IImoJLI5zzU3KCFTZmK7v4MroPXuQit/t5dv3t4335R
         rHlHYo+RIhlKo9nhVgsE61HaPdx8Fyox7XxxzCogolC11sfZBvuDJ+mJfjGGaBci5iaw
         5F6A==
X-Forwarded-Encrypted: i=1; AFNElJ99VxtKMFATIsvtE0rTmy16oLTv2UcLa3X8Ro+iE1sx7WaQ7KBijqdo064Ghh5gZcyc3WLlooEaDNo8dlgk@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFUNskXWqd5VQcn37yQyN+P9mjT7TV7r/nMR1TWiUhjDrPJDM
	n+09AJ16NKS2VlVKMtNBBe/8bec7sxsgJ0vPJ3RCIsWEYUVZxI5uelWyxG0G1YyEtIg=
X-Gm-Gg: Acq92OFX4jLzWycVe/K+QFwkYG3S9tQNPe6/lsr6jLwgPSCN85HrpI9Xcf/A0yBN9pu
	lIdBjOys8qU5DutWazn7Fn6L7VryYvQzgKOr3zd2OOS2u9CzxrBzhlz+rQmhXPbmXKr3xTj0IPF
	U2Gd4Ub/l4UlaUeh0vIc/rvOk7dEAFa/EoDcrKuZikjWlsFKcbvJ8FayzAvR9bYK++jc588E/S1
	JxzvIWUP0GjsDnUFl5jck8Mp69MdPRyB6ZusTCjZDcvJhgdZ6o93hgGoJFOcA8W/STPBJN6D8Om
	sZfE1JtXoZxMAT6ylNp5YbrcZ4ZoobcH6OrakQcgwVtyWJzesM5TLFpTNf5RxVglh1QR+mzmDes
	dEyw12l/yedEL56V8v9uzsVmWsKIytZZ1XtE19L7M585xB0FQ36pOmmbRJHsicRFsdoWu6VXeol
	EYynNM7bV23Z3w80ejP42iJdJ3dsejqKak7kLOHGp/e7v4ghIqRg+yu6s5fw==
X-Received: by 2002:a05:600c:6388:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490c2d1412emr262186125e9.14.1781014527983;
        Tue, 09 Jun 2026 07:15:27 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:27 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:47 +0200
Subject: [PATCH 11/12] dt-bindings: clock: qcom,gcc-mdm9607: Use proper
 address in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88D5366113D

Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
well use the correct memory addresses in the example. This does not
affect the validation itself, but will reduce confusion for readers.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index ef4b274b5c09..1b0efb1526a6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -45,9 +45,9 @@ unevaluatedProperties: false
 
 examples:
   - |
-    clock-controller@900000 {
+    clock-controller@1800000 {
       compatible = "qcom,gcc-mdm9607";
-      reg = <0x900000 0x4000>;
+      reg = <0x01800000 0x80000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0



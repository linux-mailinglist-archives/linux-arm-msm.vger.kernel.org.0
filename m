Return-Path: <linux-arm-msm+bounces-117440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aKMIBcCUTWrm2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:07:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F572089D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:07:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="D1EPHvZ/";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117440-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117440-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4F64300A58A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BF11C3BFC;
	Wed,  8 Jul 2026 00:07:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5A8CA5A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469234; cv=none; b=E0s3GS0u3mbezVLMkiaF/dXg7t5XamECfAy+UAbaOaq28ETA4VEbhJL5m9TLDxXkFShwEebuhwf6t3LD1OTscY0TuSVtO6zSLsW4x5WIjjDXI2V9XHDTuvRr/8MxIClu0QVywtKe19h4EVUopO1sopsZWCLOc/pqnOATD4pMlJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469234; c=relaxed/simple;
	bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIQX9jyGoO3Vc/0LbI+zvT0JhsVi2u7Pe4qqg9AMiwXSLTTiiBnxUfduAk9cpCBMUUjP5hBD7+QsOLnjgfO+SX67fg3ptf1jT9dOs8pO6w0nVBQfVbbuqzP80Q4FmTtCIIXBY5idpZ83W7R1TPkLqCy5Ds1S9afTfyNN4PM3ZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1EPHvZ/; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47dec32798aso91551f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469231; x=1784074031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=D1EPHvZ/NT/AMVFYpcNh+7Je57VtpKVVQ/8q5qOR2McxQuClL1ddOXB3LT6DuziCil
         o5To30SJO6kn1O7xnaP5I0IkyUtzPtiVIG0G97+gz89QwL23b+y9h1lXihtz1Fa0R6zo
         2F7wIWoYTyeqHOpPna7dChH00vIA6pa4xQ2lRNXI6fgp/6yz647I4AgckGOfm6BsbRMv
         55pegILgzWTpkLMNtcYhOJIit/NfI07a4UaTs71bwvXl5tFLR3b9CN+fgUA3EUpj9Wfv
         9UlFQ9tdlf/5/qL4IFHzKUcYn7C8agvUDOZY3RdciWOdbjOO0+etkoICXcCimCGqOQGD
         JUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469231; x=1784074031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=Sw6M/0cMA0cwK6TFYaG9iOloF1XPSDyDqS52uUl19aVQuyeF49oVwNj0IvM8sBiQaV
         yLKUZoXfoze1TNqA0NQQ/v5RFpiv3jRLEAR5sSsFzmO7/5EtGAAQwHmwaDg7RevOoP8e
         dgJMUiwPT3iDen6jGV0LF4lPcDC8vsMn3WILoytOU7UwLf29JPgnQbeFOh+ERKfi/VFZ
         +CVB+0WiEJxi9WfXi4b6gSL5ZCJb45kSsaCAToujQyaNfsN+HNgNjv+Om+pI8QqAZ8Oj
         igaY3F8U+vxOmdULMWOi07HXOfEj55OYEGFolDJTxp6YRSWp1R3Kg3Txp6EAlervJFc8
         rdtA==
X-Gm-Message-State: AOJu0YyGYIBDMGeVsStXhaOuBoj0UP6rJah4hx91iNXeHtmAoX7tepVd
	4u8jFwUtc060LRHTo0IEX/iJIKjhXdgFwtuojxtIHKbBzQe52NtJfe7ZAdi8R0c3YTA=
X-Gm-Gg: AfdE7ckZiSM0KqGQ7HE1D2gO9I+1bIklU5HK5c9GS8EbDBAGI8tYPZUOfmwKbFz2z2F
	Y5LFcb6xTL3PsvAHmdfgbjQqNFf1NFQNW/LQOgVLYPf5uWUswHQTJM6eTAQxVuZLbfDzJvM+lpF
	fnHAZS1D0xE4PBR3j0JfvAUeRiOfk5R9UFjmLYlGpZsZ3Qazik7CweV9rl+wLdO2/zYjodZkwxB
	Gjg72pOt8XYih/2RW3UhyQ97T48ONiaejbHQ58J3dYpWqdwPc+cfXDGJ4e8j2mXClv2jjAdJMii
	sirGzmq4BMgdUq2M9Bx3Z4QjdB0U+1SeMiBO/teU9dWaZO85HmfrLqsPci8FCHEja5iJ/Or3HCH
	m5uiXKfYF3MYAY22yq1iExl4AykeUZ0T7+KJ9orRpCnbwN3tuMNISwHLci0a80hXVFQtddNAdKt
	yYTcrw4ZxsEoS2g25dHMBSICU=
X-Received: by 2002:a5d:4a0f:0:b0:473:b32:ff28 with SMTP id ffacd0b85a97d-47de6644b7dmr6101950f8f.34.1783469230847;
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:57 +0100
Subject: [PATCH v12 3/6] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSnIwO7RDbt7xUzJzUmsuvZjlPXVORNHmcV/
 zBgF1OqeC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 OrzMD/4xiHaBTiPb4JG2qSnj5fgWTIEt3ZtLDoRh/CetULjYEQPLBH5hsjsfk0e6btpOXPrQxp3
 lnKGaVXA+2mq8K4G0uRkw8vv65xIN+qqvYbdMiwYsgTdH8ummxk8W4tvRuCYlW8MPhTNaXpHpIf
 Kk528bQGZr8aGYGlIn8cFXAALnoKlBwBB5NvgsgTlL3xn8CCBzW26hrjQE+a3yciLmx/B7XC/RX
 7NdLCcibOfTP0tnhMD7WYFTZsdVbK6vsrxTI86U7pIkf4YM23VIs57WNxflt9wKBZJeELByfKia
 7GpVNmHaoYG9UlNtf2dFS2mWbxEDgtG2uWX9HnDMQrsFaFn6hXkbx/FZ8qCzJWLwR1GadAOIgJC
 Vy3EjC3uqOz9p0aqRyMd63fTspTR72mo3ok5HjNercfM9UabdbvWeznuY6O3ot4EgVNpi60FzLd
 +4N1cBTSxEDQw4LC4lF1XFWmkjpNs7OlrNg/mVVZTtDnZ1xUHnrnTyLf43rP3lB/JFxSjyqe4Ub
 b0yrfEQBF2e5nntp5pEGHj9ffr27htrWuYqTHrb+7ADbxz8YccYlSWbaz8OBeYarxJFb1wz2duF
 MevatqeiXXLujqmn07kLIv9ATDKUf1zH7TqNwjNwCfUCv/vXD8B5TVImtiXHeTOEk+3DkFjhAlx
 BOUyKECCmiofnUg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117440-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE6F572089D

Use devm_of_platform_populate() to populate subs in the tree.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..95e655a8b6aa0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.54.0



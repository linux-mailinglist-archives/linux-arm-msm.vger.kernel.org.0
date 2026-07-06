Return-Path: <linux-arm-msm+bounces-116926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xZAqAwDIS2qXaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:21:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E257127FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=q9+9NZIv;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDAAA3173693
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9413B7757;
	Mon,  6 Jul 2026 15:03:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6833A7848
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:03:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350187; cv=none; b=MPa5zGBXMKsOK/7YckCfcf4449lZ0BiUp8IbHcJPTiOE0dksbTsEIKTn5VpydWKhDsbiW2bR3iXI6PbUdKtM5fGNxp6Oopi/EZF0Fa3KH4SkX/wzt28QcMO759gZzjOjFffkQvyMnignuH6i5nSPN0vtWx8c1eDkL1IiZmStXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350187; c=relaxed/simple;
	bh=tGUpztyp0tohTKWZjC215EyWB5KJSdZpfq0WVjwZLFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2J5U1B4UVkbS/vdc1quARSqIoEduieuMG0mA0rXlnucKNYTa1NiLXZVOmuZjdftWqn8c8mSM91wPL2sC/GVGD5q0k279ln+SVfduAb0DY0WRhI8DzFh8CbOJviRRmBDl3pdwuZOFT1mSVQpmVGnGm1i0SLlLt2gAxy6fhWiLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9+9NZIv; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so23993865e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350184; x=1783954984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDGBVdju2nTTsocBvnoqIfFjlYoXwPS22bQg2+7uzyg=;
        b=q9+9NZIvawAYWbM/Kr/ZMIPWSkOldZgmBQu9AbW2wJsMsCpnmNR481L6otEkDvxMc/
         if1HVwCRWHfp9lB66n5L7W2oSgEq/+GfYENT9/+qs7ObwSJHELQdcSnQZDzsMdKKe0av
         JssmJ0xIVkQU+t14NX6iUtD3p5oZCdWKybgP52tMZZLba6E0RuSbkjAahzI7e8TEbTLl
         bhLR1F0m6sFpShpGzqI3NMrQNSwrXOU06ZGyDHRVqzJXTyylOu3CJrP3QSObmEGkwVl4
         fotPUdL7Su4nyPgavTzKu5h1E9ZP0vXoEwmI2cxvAygvhePUUESWqX+sQEQ7N4lFbpV3
         3sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350184; x=1783954984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDGBVdju2nTTsocBvnoqIfFjlYoXwPS22bQg2+7uzyg=;
        b=Zixy2vxZWZeLTb0p0LNvOwq980FBUC6L154qoMO7Soz3AIGoeSctvzec43vTWu7Cj+
         5sKqO7NvJDuVgVETMbBfCsP8tdXDKXuhMqvEdP8iiYQNKXmohAYPKI5X6HxEkN7Z0qn2
         c+lKMxW9VTWbgBLTAjmGMWtfIXRcn9jY4eD25l6SG1BZMvzTrrXPVholG8dB4sG9oDLZ
         OusU9IlAj18CaVRXp6MxVgojWsZEMAm4IcWEKnzjiJw4ncqwnx4IAnEDech9hcLgi8KO
         8qLL+eH6kAMHjFeBLrleW1nPb89kTemTfbz9f7QczFfo1LGiNmbmDFyljQYkMheC5rYg
         5Q3w==
X-Forwarded-Encrypted: i=1; AHgh+Rpsc4/wU4b1pFiQ0/yeuyIO9y9wwO3K0yUaO2mel3dy+WUUjYWNn3v/qc9Nj989wOgXn3ckr/IRrPH896go@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIfyrNdJcd1EsB9chAvfAJkBnf/TfmJwxw/fguNhSmJD4oHFJ
	o0oO37EiYQkkJEVEqCIB6QVNhhu+heJJ3iE5VsQTqp2i7KGOAIRoGjm6qBMgkOQ2Cl8=
X-Gm-Gg: AfdE7cnQTTr0R2+dtfT6KZsnXfArg0W/tswIvVERZsbCByOhY41yaqkmvct2biFzagP
	dd7rTTce/Edr0ePf4HRY76kusDFPfPOLMoSoPTO20gUmcE+LZY278unjDjz5zrAnqqSDwJcYGPK
	LMWyrzRqNNU6kfTLKsoV2rZk4k+93dRI5O9QgXwuK+DtMTCT9HVEEk+XxNfuc30EKI512MowiPm
	Hyn9Fcp0XImuBvT9DUMgL8mFtIf+cmDg17cwpylVWZx21vGi8x8hQh2vrVVrBS56M8hK02B1S/K
	rLZg+YabFaTSRnKT0n418J1OkuqhKv88CrXUVibrcQnpFkKX9zNbLqtJY8V++TALRzizVMnmb4/
	XmE5MO/SbLCk8ODf18zTxZU3uPU6EavZ0fpeGM/IsOh4XRUsMmQGhyG8FaEhoIGPQT6LB0RyXGV
	hvfBp2eSGKtk2TZXEMpLVj7VRQRN5EYcXMAjbM
X-Received: by 2002:a05:600c:46c8:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493df0405a2mr10905835e9.15.1783350183567;
        Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:18 +0200
Subject: [PATCH v2 11/12] dt-bindings: clock: qcom: gcc-mdm9607: Use proper
 address in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-11-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97E257127FB

Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
well use the correct memory addresses in the example. This does not
affect the validation itself, but will reduce confusion for readers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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



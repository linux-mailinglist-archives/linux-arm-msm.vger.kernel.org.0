Return-Path: <linux-arm-msm+bounces-113238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KML+A3oxMGrnPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:08:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C815688B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:08:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="qXXmx/7B";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24AE13138CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B9440FDAF;
	Mon, 15 Jun 2026 16:57:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0651841325D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542635; cv=none; b=Din/FG1jQVmc6mIvO8SmrTzVllt244+uJhtRg4Y8IIOzfPvKvSZa41nHNUiYG1l/mSbKZbOQIlUCrZ/7p4gO8MTINyCKgN+Iw7awRiQipDFa6HeDx/PnNShKDY3oEp0m/W+NOzGZ4K3vjrvcalA4n6w2YiqHaVFIC/wmzHpMUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542635; c=relaxed/simple;
	bh=ZhQJ+ATOf2/e3697dcikBIUxSOgBzQ+mxpxycGxbD4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y44t5/yze9Ko1n2qjdQiGgOf+nD0mM7IWotd/jiYmUKD2Zp9Qk9kcNeycOkdhOiKDrRtnjGq7lT2E0DuUbXTYeTwx8ijnNGZhdpT2HsYJCT+mQ3TVbVVlvZx3RCEVu9U96Ywm3ybFoawkGyLwOOGJWHgOvKoaIlkKzDkhT/E9yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXXmx/7B; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so2726783f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542632; x=1782147432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I8rLZGGWdJ6oX3kTRdXuUSAnTgsDf8zvHp2gM2ybK4=;
        b=qXXmx/7B3KWpmCyqdpie4GnYxBdUHx8+i/2cLW0QqTobanzWYw/AaOp0vqwtiwrQNg
         eA/mJ4HQLxPRRiH/S5ZtO4cnufs4Qy/vsWEYb5iTBhmmHxk5JfG/moK0iCIi8ngL3zHA
         wUx/aWJ0BtrLBQ6QB8DVrtZY15xal9LlZE90O1FE55KRQt6kXTAd/f40iftCmCFJQY08
         qTq2zzEh6qusJ4yxz4wtm3vJGQCqqyxyhB2FOFS0j3LJPF4bovzHohwgNg/2m0iV/qU4
         h36c693KBSr3/JuGqFPSnxSqh13de944plQkapsuo08RV5PJ5RyU+o1ReFG6z3OXR3iw
         PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542632; x=1782147432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0I8rLZGGWdJ6oX3kTRdXuUSAnTgsDf8zvHp2gM2ybK4=;
        b=lmI9zyxA6GmmtpEjQWl+nyEzjk/jgPusdAkRb61fUkhwC9jtasKQcMBcJPeJaxCRkf
         1EEpGs+F8/k6DiQ9Ms2gi23oL9pU6M1hrjq5Rn4r1zb4/PQ7L2gBtBH6BkbFfVQk1cd9
         SP3okBb/Y5/STrbkflBizOzdHlsvdvtfL97v4oERiM3In/C7wAklvxX7AJqZ1jIMwxK5
         zvuhlQ2vTtCch9EUxDwZxLX/N7glKccHHvT1X0SWvVwVaXhA3ysK7/MuCpvDvxp0NNWZ
         wj8fhq6RtDeA5jcB47wqQH5o+1dWQ0Ij5eCMv1B/NCcu8TJDu3mbl68oClrWfCwgHgpr
         jcFQ==
X-Gm-Message-State: AOJu0Yz70dfdJPsluKX3stAT/wOJ2L/5bmfLCMU0cnFmxiNAT1Yjt2Rk
	hEoVZV+u1EMN1oSk8ISR9cVh0SQvENXnl8huJA7KthiG8IUE0XF+qivarcHfUUToF0k=
X-Gm-Gg: Acq92OGuTJmDLy8Ngb92uhh1+pyPnNnYwRGE2VPzJu+HvaLXJ6lODpUOS0PpLDWei8b
	nyolWeAU2AGT9hey1IkbZuoUDlPBVrIZpqg2KaxvbknWksee8STOlWuGer3+p9VD7c9MIOBvVNU
	ch4hmgU/XkASaGpGds9dmgWdo3dfaOb2n2nhB+8OlJB14PAg02YiYOvPxm1ec8KHMr/RsXvg0pj
	RTZadXanpFYp7Koy5cMilVP9yrzTzKJMennq/52WqUXVgZYgomufHL+utK/Hfoxrrwu7Ip2F9jj
	dRrEHbLuiMFF/EbFPat0hwMFLEyCo1Hz50Cdg45vYmr7AoIieyuY7FHNZsAsqpmmne7MYSQSNMP
	2INma31LBKBuwuKzA7Tb5SYdT1bmwAJB8o0UusZYNwEo5pGrQt4cUVF4GTdxED/sf3tGkYGY/bE
	qq2qQen6C0ZrqBMhYPgkVV+gwfCQKgowqHeYd0QFVSYZJOyh3WULDPhqk=
X-Received: by 2002:a05:6000:986:b0:44b:7ec9:2d76 with SMTP id ffacd0b85a97d-4619f383d22mr399414f8f.7.1781542632403;
        Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:05 +0200
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8450: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-4-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZhQJ+ATOf2/e3697dcikBIUxSOgBzQ+mxpxycGxbD4s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7hdnvmiCaAWFycnN5uwwBUPwSq/N4H2zmhVTVS
 x5yYXoCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4QAKCRB33NvayMhJ0YIqD/
 wNAx8XYfbprrC2nmCfTTHFJFFhzfmcY7mvR/9fhvFf+R50NXugPczQXsCV1cTbQ/C3z7qX3OD5oK1Q
 MLLD98fJZujWpCH2GmPOpgN50YLnTRZaJwBRrtXVh6X6/Kx2eFL1B+yoUASt7vzwNMgQKm9tUmuUo7
 wqzFIvYH5/+BOAVjvJhObG2W5dU5xAhqS6Q9ojOSrMezt4JvXYE840goJj7KJ0q6gAHCEVMPqM0515
 Bec6nUImZJ8rwcjCN1h+yeXHUn9LXihtuOvQbeTddA3Cg20ndZFaemcaBC5G7q3V8uvXEa8N6MGNsB
 c4njivR5vLz/DXUdhC1nmxjynyNnSY0KtK/qjRErfyPzAc9cQC09cPr5d6xJ4zzmYJk8JNrYOyCzDa
 AqUWHGyDW1zXB+CFzdy2a9SKhxTZ5hAinjWF6ibHNPPWLxduCSMWjA5tJmv1AXQu6W73p6/jZZ4HSi
 JDO4CK+x7cW7I0ZBYjMd9uVsmeAgFeIPtAK1yjuvIPn9wv4GTdvjS8r5Nz68cNKK6CfExNK5IW7kPj
 G8cHT4qfXzeRM6nzAfY2pYelzzCVaofWQ/UAhCJQHDbwt6HcCgepSeky/x+IYDj35v5MF3w744qu0S
 rybTLBQuN6pZUYd2HBupbUn5eOqKO6dkfBSSTwScJ5JPxZFZU9Ym5YbzK/+Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	TAGGED_FROM(0.00)[bounces-113238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C815688B06

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..2639790307d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -935,6 +935,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sm8450";
 			reg = <0x0 0x00100000 0x0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1



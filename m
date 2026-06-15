Return-Path: <linux-arm-msm+bounces-113239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tYRLGRYyMGoNPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:10:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AC688B58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:10:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HcHbnnNE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113239-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113239-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EB8A3048002
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA80C4183BF;
	Mon, 15 Jun 2026 16:57:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A66D413D95
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:57:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542636; cv=none; b=ZpIsfKd/IAaLX/Q8vMfuwTjDeDuxOPtfW7esGVKO1qw3bjabW6ETVR/FqMou4Ryalad4s8m75G9+rGaIdnZ5d5z9Sjytm1KJ8YbA7M3l/eL1WBUpYlejDIsKmjW2Y3xoPfTQ+JYG1v8neFplV4sG1ki/ugqxZcjAGzSRc5s3NDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542636; c=relaxed/simple;
	bh=PCUXhod+G671w4vUvWFPXNpCLPlsoblTqqTprXc2Vkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krTkSr11eFXNVIeonXGJbS77AUrhdl6ZbtfD47OEjq50ssp6Bpf/HHgGyG7zYaMxiaaws5Dv6itOY0RW/urygxn1gWqIbsOFrGfFZthJY6IVvjfcmbD1aO/hCAwKDu4Du2AMg3OhgYg+VwsR70sdlW0NHD1iYNNcS57JR8Q83tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HcHbnnNE; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso26854635e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542634; x=1782147434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKlRW1qlXgDZgdi+0feudhAKynCZkmS9W38oGOlcoOI=;
        b=HcHbnnNEXK94JfyTX5C35PLTc4HN9/tNtpNyn/6CyWMSJCXjItpvjF4S+StNAxUewi
         gJsaTHX0sNXPs4B9DgLtOZqhkyt3Z6/qbwJAkSpn+W2ddlxuO3WqptF7tUHqn2E78x3E
         t8fW2qV5WwKJpKO3K3JQ5UGSpvTpm5NZOnPEYJpKx1ahHClhhhaZR/IDIg6ioKDC8+nm
         RiajWa4S5ZKYKGxSpeizgR+jV8nmBjB6XhzlFrGveDOeNKF0NAAwAmQQDPp9Y1rxuSTo
         rB24R1HLn6fclTo8cZKKTiYuWldD1wNgn0TOV7WQ7b5vO8e1L2sjdgVkGN+WpNWmJCpN
         QR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542634; x=1782147434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKlRW1qlXgDZgdi+0feudhAKynCZkmS9W38oGOlcoOI=;
        b=TDlAstR7ORGlwgwWhscuCTheVPD/UcF4r0fcCE6V7Kvrob0CdbBpRrh3ljikLLYP07
         mz3aECIszD+gXmTLhcoF+rNw5rlamBnCMOmiE5DH5MA0MV2u+5SxPmZMLnBwSb+6GOzQ
         E1gFqRnrYy1bqMIJOfL1J3NR7MtnK48GH6RA5JZenB0wCfKdr9QbLUuNWzbg4cR0xd+7
         0jtRunAYHrNRlsh5p2njMaxPbNf9xB+orcJ8KElU4nBg7XeDb1+DxA7f01OPA3ddATfU
         lAJEOuAWiEAKLSiIjYpQIKqIfE7ki5ISerhvFuqP0D/KWQHHPhX1acQEDMrHLA9ZE0a6
         XVYQ==
X-Gm-Message-State: AOJu0YznUGFjkbpkoUE/z+QYTMUhLkL5OL8ESVq4pvXRAMyI9+jVrCUG
	uUaU+nTsm9lIaJHulFEzAu1SFOOC15523VtS/bc3IpKmqb6Xt3B+hLzl36EKg2uQx/k=
X-Gm-Gg: Acq92OEIle3ozqub7wK9RRHNkbjXSiphT7rzb/kjrl04T5jRa2AyAXSWMlakN0A/wwl
	V+iSugBlMttINb9m12Ivr+8swnFILGdu5cIkCyUFbsRcy2o5GxLmlWLw9Hers7SG/+niUc12bDJ
	nFG7crrg/JxaAlZOPzkSAhRvikWN53yG6hCsqCp0GGiiLN/MJcTeUX8belst/dLlkAMCvrcf4+G
	J9HrZLOnZPnINJq0V5EUwOD6QWt/RzXYA2YV6JDPPZF77474DpRH6VQZcRGURJcK8FiYnNJS42h
	qPVfHOmgaNYmjD1aejgYUg2CgApp5jImBmyHNqJlQXmMfvSBIrO38SEF0j3BnUa3bVTAwpk5PYW
	abPx+6WEnsgMnAniFGJN9wAEnJWSOEu0Jwfgk43yyye+zf1zXx4olZTlbIcxVhZbfLEDxrmBFEj
	DdA0moJgFu9CTCfOY9rlsPFGH13/4Ulsn8l4zMHB3qZ4dF
X-Received: by 2002:a05:600c:1392:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-4922ff8f4e5mr321065e9.8.1781542633569;
        Mon, 15 Jun 2026 09:57:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:06 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8550: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-5-6b5752dd4747@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PCUXhod+G671w4vUvWFPXNpCLPlsoblTqqTprXc2Vkw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7i4+nuxTiSlWuoxId+PwSbeQd9NP3UQAexdLt6
 z/bMD1KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4gAKCRB33NvayMhJ0SxdD/
 9areyZ0bJsyGJXkq/cgj0jyfNVuuPFhUeAPqdIFBdpUTIONT3roVsj6XShy7wdsb++WpSGal+x2Hlb
 nJuTOPcYINi7BEt1chiuUl3CrWF0O3y3Jki65TDElJQ0G0CRjf2qeN+R2SleMohKk9BZa4OrayiVHb
 bNW+l3YDUBjcJLVfO88wIeI4FlR3kA+iByQ9yqXw9ce2Cr9+BIR3POJLGIl5elZRKvFXc6MHPx1NHa
 DazoKngSrXzgXRJViucKv1EkPImLEO8d9j1p9FMT66DyuCuKvHV9sYfcdSDf4YmYlyjUYqcZWso7Z9
 TmcqJTxrFy4GWpNbyg7ZHfaiOPWc6F89SdmquiY04DWGFPngtN313SuTr7dqxQ+OW/+UIbXb7SPaTN
 UcG/MEFts1yMz3ZKm2x2gW0sYgjrcOrfgx4dhUV+JAMbCEIf2ye1TT2tElrz+8eOelT1xFPMVzNy33
 bkjOkbWmStUZVE+y5yPyNoNjZ7LcxaS/Ojh/RZrOwjQiqavEeam5xJJc6ybhu+vJ6+j+aXQrDJCLvY
 o1C/HupigiYdZQoiop7BXXWeP+O8mrlauHD0p616/xwp4UkIJNxLG6qkG91uwYXeh45OICXzgkjafl
 XYxzI1/s04k1aZ8ilHHwDBC36aUNbtUUkUtrFOEG0NyK67r6NxPV1OLG9B7Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	TAGGED_FROM(0.00)[bounces-113239-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 506AC688B58

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 396201905ef2..2cadcaae9e01 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1183,6 +1183,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,sm8550-gcc";
 			reg = <0 0x00100000 0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1



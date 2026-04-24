Return-Path: <linux-arm-msm+bounces-104404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBjuJn0262nRJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AEC45C1A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3184930571AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D391037E2F4;
	Fri, 24 Apr 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UEVnzJFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD5B38757B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021688; cv=none; b=PNfvRRet3R5wHwULXsp5rfH9xAdmKevw0JP9qZ3XrjjLCMRg8RWRsQPuo9+C9CqPMmxFTXjmmP8urQedz+c/jY7Ccyjpqx295qMHsUgv00k6Pd09E9b/bzfTiP145mXuQe7ILSqmG5mPKnrZUlCmpKpgZCKsnGmXPSyh+PB7xJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021688; c=relaxed/simple;
	bh=j7NtleaVCinXTUAFMP0whiJzDqo6TZ1ijhgG+B3VZaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7fkf52cYWTDzcAiDQLOM/G/tvlo043Pn/8IG7gKFe/+Q/xWylPG7VQ5vyhj6Y20WdvRWsiOBWLaUbW7vM3Iu2cjgNn7eslpDB6/LhVzMNWuRfMz02z8dwyg+EiblYEaRhyoRcNjf+3Hav5ZCfnhQUUEc9yw5ma6h7Xmt427eL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UEVnzJFA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so54483345e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021685; x=1777626485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxcapfBloQ4ir8+1izZgHg1QyEWnEacJaQHdUFb2iyE=;
        b=UEVnzJFAuBE22m1+MaZvxctJ7px/SGESUc0djs4LPAM9AGcJ5brXUkRQoMxiYL6Bqb
         nvQO9xjKWc2jlodet58b4AcIACu3LzWPpaPUyccdnd/BkiDmv0h7InQuVKfyZxX7qqgS
         V4BSBR42gSOd2rJV2DQPGq26mU0DkCwzjBtDMQK1H2IvCZW3GqioHLVWpqDetEibJj1e
         TZDZqojALtO7Gy2CD+vCmN8RqQ4FZ8Sa5/V9kmlZcT6nzP37+BfBPUJdtRD4HMAfvu77
         x0OB4IlJFX/AMuDq9uAudBfjjHeSRZzuMD8OWL7IWsPMM7sHrNRBnKsXV51i0i+oY7/t
         ZD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021685; x=1777626485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JxcapfBloQ4ir8+1izZgHg1QyEWnEacJaQHdUFb2iyE=;
        b=sz/hml7GXuGChU5nwgV3qSHMZMVVN48aACg6kENP5hPOpb1dFMpKmkgRkZ9EMHjkAc
         SYIfLlgshEihD+SPczcKTRrdm1WuAFlMx/nH69r04U/P5VXabsBc6AfOP5TFmMSu6ISx
         HeY34AxPZsJGi6COrqkPogDeZYRCV6b8hlyzil91wYzdkuOZcNrOhzn/hvShjX7vURv2
         foWedV/d1EnMctLQy7KxhAF9zwXj3s7W4gawUj/6PlzKa25XKxVb21DftsS4Zhtbbpv/
         JNrfljLYZ6q2+2WQolHjUv3ybe0Rf8uWha5e/4b253WGlBprEEmMeo+BDaXsGqB4scVj
         c50g==
X-Gm-Message-State: AOJu0YzwKUlmMldm+yDfqXyoCe6h1CxQI2/D3z45QQWfVCH3G7M+rRtD
	snNmhGKpnQMoMCez68SDUDf1Lool+IWOI24XHB5Alqiy02/awFsbwYvl64cgHs/o+o4=
X-Gm-Gg: AeBDietZMclghFrAW0YMOlS577NG2nqda4iZBVeLs0BYy7D1HKEoFO59DSvKtj5WuDD
	BtnrtW+MoYk2++hYAEAUCw75c+bsTwp4ZmKmP3PjLhr2eRCk2w8dNYx+eAogEBt+lccgzguW5dL
	Uk12J9NHrbXZD7uCRTyl/7gRgndykStaA5IuQgXHeiUaK9+zEdAMLgpFknHNw4uBmG0KNklqBTo
	gUijcAO2Pmg23coh17AygLO56m8WI6sO5CX7Z7JWQZic1CQWBlG68KFPw2GuMLTIuOmVk1vxWF6
	cwNCQwGxmIzuoPOQ7mMcKV9im6Rgh3c+9D37fymldAsklU05WiztouKwVyL6OmXknc+TLrCsbmW
	6NgKnMLBojF4t0QtfDKp4rYTEijHQtbcsK8QtW5BseG902Iw91X1Vz5j0G0z4bLmUlbeVnpf/s5
	eaSL/QKdXP5AdG22YSn7F7Vuv8J6GpGQjAcEovO8KZIkRE89Seb+AZAZM=
X-Received: by 2002:a05:600d:8496:10b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48900a4e79fmr247019705e9.21.1777021685000;
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:58 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=j7NtleaVCinXTUAFMP0whiJzDqo6TZ1ijhgG+B3VZaA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLu88GwdHdU6Rx/b82G2QLgZcyRA+ipeisjqhiI
 LzTjAjOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7gAKCRB33NvayMhJ0UYMEA
 Cr1HK+dZ2IF7zakbgXlZZYJkKJHSoPi66+EWmMrTyHt+UfXJKxPLxdm4nY1cTftGw995xqhe5RVUz9
 8yiTRy1Kr2o1XeZMwu7UxwvO5UzN0W7bprmr/NuTKpFGIGw29TeYGKaPFoyO74jLvOHkrtHkw1aP3H
 nuC5hSBhQ/oba7RQScgvhbmpPL1hX3yn8BE+PEG5rM8k69XtU2M8dLsHLmx4DZOerjuGO/v+SEj7zT
 uiU8VO652cCmyGbuFUO0dmhF7kXaE8qopn2pNcB1c9AJF8cftGZR5TWn33sJ2aMXFd3wpt78sdDeHz
 gqkb4U19IIuvTKMI35ndpPS5oVkFyR2g0TIyhzSEWOj+ANRHBBv5Pmt3ryhiNlCwoeL+IsxQ0jX2Hr
 VZvRPafqJ+jHX2tl23Vt22humMsj6V8SlNV9RZAc5DrFO0i7KTeznfCQm1QcgqGi4jr1Oyj1KLJf8M
 TLG1qEq74DrZwEQrV0Hm0MY2+U7tJjdCoXTowSLKuRbx/yezhfabIHR69LCwN9YHwxCRHM/gtzZjhr
 ulZySR6JZU/yxBdyrphmx7R0OgdJU1hTwgQPyHefBY5S3SyTwG9v4NbcbujdIvQuoyOYv6A5aF9PQz
 wrvVyZ1i6bAK0KSkpKeVBYk1i88yGgkDo2T7BqkxXmmQwEPojc70tM/oI3Pw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: F0AEC45C1A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_FROM(0.00)[bounces-104404-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.895];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.1.134.160:email,0.0.0.0:email]

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..5aba162a952e 100644
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



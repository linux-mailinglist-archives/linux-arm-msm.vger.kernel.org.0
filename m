Return-Path: <linux-arm-msm+bounces-104405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNH3DoI262kBKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:23:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A626245C1BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97DAE305BDEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD0138759C;
	Fri, 24 Apr 2026 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPKWvahR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE538735A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021689; cv=none; b=bTKL7jWTyn+/7wkOOJVWWvTFyPxf2+DPqWbE3HnDEh1XgJzlHV9z6/lHyq2ue5LxPLtNJ10qb9QXn3UpYnz08a+Mx4d6twsPcP3KdJTQyddYVSBrgxasbJffvsFl2G+DtMdJdABOyaQrQRHa11BhhKDhKoNndKbxKFEhY8F6mOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021689; c=relaxed/simple;
	bh=8UCqKS51w5RlR7Z5z2QLTaDqXfPwDG1/feXb0enazX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuofFe8JOyTO2il8UHq01HfufE4Yr0kArFKxd6NvHYd/bOOHw6f/gOcz+KyiuFZeSqmM2GSgkzFHs2g+UktJFDgz+QC/NCAEzDY/P6CP+iz5IVn24vZoO3UGHtGZUgMISCYMeTdQ7UfXrILz4ndZ3lmD+ZjzmpV15aPVD2iaD0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPKWvahR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so68671525e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021686; x=1777626486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQrbXesEIOG1EUuEQC/o8Fu4R0n53iSwERhl/LZDWYU=;
        b=WPKWvahRzfWoC7R6dC7k92M9/d/I8f4edHU75oc0LpV07Un6Z7YVmo9cpvFfZQOgcR
         VJ/EDVEvNcE1es/UfLLXnfnnWwrx+a2WAkqMTwImAU8BSQMghrU3Ua9Qk8O21J1/O1R2
         u00tQL18OYxGW92ujLaO786GDh6viT7n4yfj+ZidR67PwYSRvLHXd7mHOhDW9/yPpEnN
         eAcp3FAJ5/dEBUO5+INpAULhfRqkSnEl/GFnSL04Uj2ZLeBPV2RuDKB0cVTHF2hWRMtz
         CL4zzL5vYhJZQ+ST468iTqyhBh48iIaj4srlnYtf6reKKfETX4gpiIS6vK46L6gWoK/d
         Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021686; x=1777626486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQrbXesEIOG1EUuEQC/o8Fu4R0n53iSwERhl/LZDWYU=;
        b=QaUT0Gn0F+/hK+AmJGXw/Ii4pDBkPrnj41FxvxBbcjkceeIuxW2+aXw5sGT9hsTYwS
         yEm3rKIB4wmJU1f7YHb8QmY1ezKerOayMpHSJVrs9X1PU8yi35S9dYI4kQAeAvaP5G93
         JTbVbSmIL7qyt/uEzRpBTEaxxoCJ+3n8AqKUdG7X4ymt12tfVjjW9JV4SgC5CDzZcI7j
         Gi4qDoheJYJowcftgo0vA9kKPXODN4xqlFaVLCQwGAJqzE6izvVtFvkXXH6dMBInALEv
         YvsePOfxcb6wEFGKBo/lOTAp23gyoZb5e+Rzi7t9I5ia94gcpB4IM99liMYOit2hiv65
         n5HQ==
X-Gm-Message-State: AOJu0YzAYA3rXIxLf9MTSt6+Jarag3dkgrQ7QRGjiRKgd8gZDW1XUwtu
	Om3hKtdXxXHL8sImtj2gNSOX3mPwk/2XcUTaMXAraqI+xycXTQOYXwdlWm0WxwSlkao=
X-Gm-Gg: AeBDieuRCtqfw+cNGks6t5H5e4g529Txq+UoxffogFHpAz+dMZkT3gbxcDh3yzqfvEb
	iIlbhWDdZI4ZetX3SNXGKDXGtGxDHArnZnqAG7xfxC0EqpyO4GeLg9EqUI6uMaeap6gzcS3SmKi
	UCi3ThjwIrPAYlb3AHXRcizSXgxOFpNU+XXjGA2jQIBn3ECkKa2W14rcyo096bDCe8xKQso6UZy
	9OQLwHgNhnfeIwLx8XxW+vN2Ca76Wmx5vX4z78BQBVbpQfvCA1aj0LhU6+73H7QCYBIbZ4nMyUY
	QP/8xkQQlCz5XH7SVIAeOv1xWBV0LNy1zw9iPWI/WXV2NOwNuOyLcTd7M+ZR5DP7gvsd4Pt/TOs
	tBUEv8x+HkP3EUi5UfPrBW77Jt8dv3y2+0Xn1JDfgridbSXW84Sr4cOIZ5pxqHNfKK8voQLhD5x
	g61pLs/SeYVqhC1nNs+5peppi7Slsm61A09SNEG1IlKp/Arb7zVI/1VMY=
X-Received: by 2002:a05:600c:a106:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48a58ae9fbdmr130325715e9.18.1777021685898;
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:59 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8UCqKS51w5RlR7Z5z2QLTaDqXfPwDG1/feXb0enazX8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLvyBrEYR+ArzyGkPCEiEmwtaEWLvFZBUT1TvPm
 yJlJ1y+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7wAKCRB33NvayMhJ0WO0D/
 0YqTqQstSGrGRomLVAS62j65Ksgxddo0d7wwfv+D69PT2/hFkSpbOY0CjA/UYijLV4+LJwG9uTNlQE
 +WDMnFND3Zwh/0FeGpfg97DVHD/R1ot9DZn4+ssfUganOBrBQXgkQzAvBFX++Yxi6rORtsf6FsGkr/
 ykMX288/kj51VkHDB0bxweKQl8aNmfId5HJXc2EhKHaTgtDV1YA8gzaq18zvwQ6zrwql4TZMaPxLam
 JrT0a5qG95CMMV3lZZhPQyt6CdoNzCZJvAt0ZeBGeiNbGSaxceYkijALXXEmzXNvRfLJ+qW/UtRPJD
 RRXGbLmUm9W8782bGcaehV2GUWmZWNNcJ4+JctuMnpxUQrnvvMFIaaofe5SgvA1d/6mUrX87h3PE4c
 uXlCqNNk0nMWpmchm0o6o6H+KUV0vIj977slU834IhNT+TSWnmy/Y+EUpy5k/SJTip2nvkD4qSIEyj
 AZO8/IyuG+J9nJrOcHTknbyi/zI33BiFp4BUY9MAeunIYWX76wLlYBH5TqqzpPCGDfws/coLj0afjV
 9tWpfl8COuk1e4MP0IBV5/Wmc+M7D0HmXbWrnuhA2+cwqyY65SBg6zLREWWXGCuk8UftO3SqRtBRzs
 hgwrpMz2cQSJYXHsmmu9IuS0fBaokIk2TvelJSlsQoNwMdzdlYk66a/1Puvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: A626245C1BE
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
	TAGGED_FROM(0.00)[bounces-104405-lists,linux-arm-msm=lfdr.de];
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

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..bc97259b378a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -826,6 +826,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,sm8550-gcc";
 			reg = <0 0x00100000 0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1



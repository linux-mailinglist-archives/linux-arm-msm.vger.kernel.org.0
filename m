Return-Path: <linux-arm-msm+bounces-78555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB340C00B91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0AAB3A7279
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6892530DEBC;
	Thu, 23 Oct 2025 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3buHssXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D530BB82
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218958; cv=none; b=WKxXVWk3e02HtzeF9oAe+ynWZJc5COH7vOS/ZQ1KSE52zaA0FV0XJJZLT7PgEAhwGhY8RqBL4LQQHFKg2veid4p6vD9xhnZ9Rrc61av4r6tuHM3/Nk/aEgVN3ooQX/Fx+5Nepbn3Y4cR9ERslSXWwYMEqWnMomEEkKvBmymwLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218958; c=relaxed/simple;
	bh=Ji+2OA/G77HU1f1xpLuadVpNWAo7bT6AM6eYU0UkkOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2rv61y1qHG9Zuzx5RQfjhyQofgsvq8jAexfTf2xX0XDh1AaHoY4kq1CpGpi1gVa+ZP/SAMG+cw1xASj45a0rdvORhl2A/L7aD+Edd24hn5S9fL3E1q3u7kWWlAXi2LAo0YHbTWu9DjYLeC+KWDCbS20+v7gpMGhXdIg85/vpW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3buHssXf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so1439358a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761218955; x=1761823755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvQpSe6/vMPCasxVcuAk8VD6h5eBPb8DgHD/tEJPhZo=;
        b=3buHssXfCjKtHP2jmBKtjffuO261NkP3J+UMUSAWZUCljSduxm0LdFlhCDyv+BHfsm
         d4nYP7uG1hIJAHzuxFm5x1DSGE1owOwHyBFDcKaumCtZRvOlUb4p8M7PSbx5ACdjMmuO
         TV9yMTR0FvnNpQZ17dxXpPBcokgfQiHd9MUyOArCLzUwFdgTnNIkzJRLMAvKruBzPzY+
         nVacZXVB9/omweqwtxUNPCcfTUAszhL25MSrvteXcV7JIqIfz7t/kR7Aktwr+d7o4CsQ
         BFmNFJHKYYMmxgI5xVVY/RKUXuQAVLCFvrVJrIbu+e+L8SEX4YJy2TH19a8Pwl0k34YF
         uu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218955; x=1761823755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvQpSe6/vMPCasxVcuAk8VD6h5eBPb8DgHD/tEJPhZo=;
        b=YOKnp+kvZGhB+kckEYUGV5OnLGspO9S228LF3tIV+dTXC6/1OjP8aanv0d6G4yzFlh
         WPD6bs/Fa/4a18eQq7Isbem/Zy2+Z1DtANV3qFKRTB1bu3+xulmNDjh0nQll2mzvNDYd
         Rge+yD/xi4COfdTlD4P0ypeHj7ADfZdqVAf5TOybrnHzeinIYYB7IK9+Jrt4ISd1TDDn
         CaMxMkWPu5q+TWNBopyvuK7epWhZlBpx8zeSZVeK37UI1RDJJ/oWIe/LEXK2ppLmJzMQ
         WImQAS80tXVByUXLxpRI6zp9zf09TE1KS8xxhq/x0l6IxurgVZx3rzzJqZP/CHn5X1SF
         3Jqw==
X-Forwarded-Encrypted: i=1; AJvYcCXfqxWVKoRrZ2REaVs2QC+dX+tAbCWuxkPltCc9xf4It/5CwIQrjSDh1JXfRtEKm7NHWuNiDw5RyzzaHf0/@vger.kernel.org
X-Gm-Message-State: AOJu0YxLoEsTQ7tZHiRRU9QY1R6rEpUddIW1r9hkm46pNbkJ5oiUqShJ
	AC/983Epys70nAzLMDsB+S/UakN9lWBC9w5W6xwETav1oT9ErHtScQ9dc8MLP+kgB+g=
X-Gm-Gg: ASbGncufDSsb0/+g1PrWFnC990XXQXaz4vrg/LE6m0QqewCefemB7I/mhyVI1mTGic9
	6AZ8WoQeTC3HppJ2DeHL16Sdo/jEu/LeifmxJu9wVJcVMaT219c2lFqJ6qO7XYtzL7BFxJkycUa
	Di1sYaKL1zIBRkfa4oIk/R+J/cHx3QOKYDiYeB+ub5+CB9TFSfwnlQhHBljrjlLLjMyRDF9/qjz
	APJv/HyHF9dsfSZt/1ouJOzYn+62Btigt+xq5zjDSQC10USqxSuxYO2KfbuumKEUrCrGTbu9SOG
	LisCG4smZXZp9JoHFiC7lJBsRhGolL1RTUuFzk0Mr31bD2APwukzd8/zIAj3YYzKLGjt37G7/n0
	ddtq5WIuk3FyQ3RoFtqQ02AXLEK2C0YzRGdiYMOQyIa0Vl2tANDz/jO2cGChb+ILsa+Yom14rHa
	YZ3URkeOOZSmebOVq/B3DRGxyGhK/497Lq9s0SBvWdA1Yhrg==
X-Google-Smtp-Source: AGHT+IEAiF4kvYBagBPtSGcpjL7Owqx9cK2+EGyXrrsdo3qMlvN5hXcuHy79E89AMKx8P7LbEH7kPA==
X-Received: by 2002:a05:6402:5245:b0:63c:5f76:2d22 with SMTP id 4fb4d7f45d1cf-63c5f762da0mr16853069a12.21.1761218954952;
        Thu, 23 Oct 2025 04:29:14 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb328esm1439098a12.5.2025.10.23.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:29:01 +0200
Subject: [PATCH v3 1/2] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmiv0104-v3-1-27f1c417376d@fairphone.com>
References: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
In-Reply-To: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761218951; l=836;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ji+2OA/G77HU1f1xpLuadVpNWAo7bT6AM6eYU0UkkOo=;
 b=MPKa1d8RVu/ZBgt2nQvrDkRsX8rNCMnUMowVQCQp/HH5c6TMQ2gQE1Hwl53Pawo48fFQEIwpm
 if2t3Ddqt+ODHFqy/zXxyPgmOzEHTD5RJ8SitlU0LY656KQMBe1XgEW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..c416f25c90d6 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.51.1



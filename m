Return-Path: <linux-arm-msm+bounces-78574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99EC00DA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E296E3A44B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027AA2FF668;
	Thu, 23 Oct 2025 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vGBqCB4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEC30ACEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219615; cv=none; b=Ejc7Sdfi681cK/5cAXIxtAtf4vP1drkZa6hi1IE+a9zq4bH40BsIMzpnOd0Q1Lt6R6RAeuV+ZCLzNP3dWW/NLSOs7tet73K2YmgMdKz9nHE+Q469eo2wpy0LGwfPKqsorw9PRUgyBTDz9Vo3yPRsh7t2wB9crjFxpZ0WfKNLGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219615; c=relaxed/simple;
	bh=mOdQL1gEA0sDveYqZF59jTdhyi6R3BOt3m/pryB1k8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtGWKCf0q4Xk5qZ6kdgEOLzWKeyLBRKU+GrBdngbIjiuztr0z/NOjaI4sowulk+RiXKNYuBASvwy/aI6Z79+d/c+oGgsmkReER68owhmcACI8qPO3Bfts2BtCGTjoP3/c05WEhxCX0Ogz1CAE3g8BuuM5r73qq3I/36jnVpAHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vGBqCB4c; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso128219366b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219613; x=1761824413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqaZdRm6596hrpgIfe4f6IaRd+GA1qO846EqRJ45Rvc=;
        b=vGBqCB4ccxWyVAU3pZzCslMMgzZotbTA9BO6VYQRdn5sss0Axnv3ofhXPjWYRRPSlF
         rtapqclTI/KdsyLuRnQFnuRDODVHFj9FOX1mcrn+jnAqTUzh7Fi4pA/aCDmbKKp7s3CF
         zjUSpB3H5ETKlZGpTl6NJJ3zj3zjaYluphscVpKTV0lwPTkAshYauQxbcVJAjqB3w1Gz
         K50xnFeRR1pBmaIrlP13JIGWCdg6WdOIjGva0xhBh4nC4FhF/tYZvgWv3AMZtDAro9vy
         tUSrvmphEVqIFf6fREqb71fLbfCGg0xWyGxvACb4FqszlwPpxLR0D/Vyqlyb1e5ADOf4
         4KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219613; x=1761824413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqaZdRm6596hrpgIfe4f6IaRd+GA1qO846EqRJ45Rvc=;
        b=Mtj15NuRJu+wME/HhAyA5PIZ2nwfZTHVm9kdEwLlUaFoaD8bDANcya3+u2mFTs08dX
         oFPyerlrauHPWSFUTzj9NLRsgrMpdJkak+vatPgejBo0hwUwWtaciaTA6tu5UY47bS76
         XpglBk1fjcgE1Fad4TT1G41cEgzcT30w9Gplgq70R4R+4Zy2kINITCfe1uUX6VBLcdKg
         5VzL5Vf9S5L2Za+RiLvvqNR9acmsRbOTJF2XfUFCpGWW110tXufFQC4T4AM1liwfZCL/
         p8L4C4rWes5FZwrhMp75CgiG7A6Bbge/+57iDwPHXkcbYaqfFm2IgKjdqUXYzgCAoh+V
         ZbTw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3Z61kxw4MFCfNOYl9RNERzEwFMzn5gGv78kfc+nkxupenvIp++jueddDTNRLk0jBtejCDfdpuk/wkTsF@vger.kernel.org
X-Gm-Message-State: AOJu0YwYuGlqz0C17/sxJYuH1Q/zjwR573yYLMB2Hp410UaN4EH3LmL1
	AV1z3IBmGY2vfqVm4eWyyrCbffCm+pHkDX5pBEzVWcormraEA8UyTfDzx0XdBboZJoY=
X-Gm-Gg: ASbGncv6qg7beupx9PHOrMekYlTjjV5A33EmtzzkYpIQxa6GrwtOHLUzdvEPAzDJmOM
	e8LGl39pCfxl6RZ8E6tQqARph9eClPdDjem1joAFmR/df4g6SweNzrVBoUUcdcG5ybOwjk0z+G7
	OlL8tl/2aBJJoCfpe976oAGlvunewRkBYoVeNLhrPuignuxVa1fJfC/ZAu0xzxIG523wt6z5mHh
	/0nhICIo/2iWBt66K3JpiFqpsh4YtCEjHSDqRG57DQXn4JFUq9oMgNYUTgqfIxU223TrqfsEjeV
	jQNu3qXFqxOI+aaVacWJEKqpX3kHNPmZV7O7RqPtwpM9hggwOVeauTTUnfgZszqrW8Lf6wsN7Og
	tHJoysATfcqn64xDJjoVcB6P6dGBeWNdO2ZGU5jL7CXMG0E+u1lhnQk6M0f84OYoi+1AJvKEDEW
	cJmfIvqbGlj9RfRgZyrcgwiU3ivzFOREfK/Im9d7o9SZ9jOQ==
X-Google-Smtp-Source: AGHT+IH3p84PJmGwvI2f01P7O38tZI9K0OwbqpVO9/74/g6JJiwjHN+D0EAPynMe39kBO0m67vhIJA==
X-Received: by 2002:a17:906:fd87:b0:b2b:63a9:223b with SMTP id a640c23a62f3a-b6474b365eamr3224940566b.31.1761219612666;
        Thu, 23 Oct 2025 04:40:12 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfbcsm192518066b.56.2025.10.23.04.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:40:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:39:26 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v3-1-b68b74e29d35@fairphone.com>
References: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219609; l=1104;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mOdQL1gEA0sDveYqZF59jTdhyi6R3BOt3m/pryB1k8s=;
 b=NCjA1CK8e9d0aUeCy3cGdfqVTHyko0drrGnsVMBqRTZVSMlkuM4GnexZJZlNUg0ij/Nsv9VFw
 SauSJBL7lv3BIvn7xnvQ7AhQfeGtgraNKQviqsTWHgSqoGVmyMBsfkV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

During upstreaming the order of clocks was adjusted to match the
upstream sort order, but mistakently freq-table-hz wasn't re-ordered
with the new order.

Fix that by moving the entry for the ICE clk to the last place.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8459b27cacc7..19a7b9f9ea8b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1180,11 +1180,11 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<37500000 150000000>,
-				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<75000000 300000000>;
 
 			status = "disabled";
 		};

-- 
2.51.1



Return-Path: <linux-arm-msm+bounces-64951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5AB05347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BC4918834AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6B72D4B5C;
	Tue, 15 Jul 2025 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mrOZAhN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D427702D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564595; cv=none; b=NDrDvSTdA8oGaSwvUo1Td/k3hi/5abvW+uXbNU4AwVqMdjenPet49aLnS7qnS2KVF3A7RXhxeWDDQfOtjDOrFAg2f0iTxnxfywtskVjg14q7Wpxmk5h6bNZdrJeUJHTZ5Rstb+cxbOQnP5VHbn2Ek2zF5ulcMlavNU+6GcMAOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564595; c=relaxed/simple;
	bh=wYiuInhT/0IBi5aTMYTxCqi+FJtCIlWWKNx/cq1PoSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGu4RkTUY1A9j98hst4RttGbtr4KF94Ikt30TXH4vacXGQbsYkolp9+KoZQI1NNgAVd+Fs0o9z1bxEmdN/hHdDRyqAcs7WqX0xZogMogMLWp2NmRR3EwfoFjd4BVQiJvQpKekMhz5vh9yv0RkgcyhOwLQPRURV0NMcFz5uIroSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mrOZAhN/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45610582d07so16013945e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564592; x=1753169392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igRKmJztcKVpdUX+y9lchuje3E9fuLqSjyB5RDorqw4=;
        b=mrOZAhN/JBf97h8GH/wpRTOpBmTYvs9W8SDdHwk+LdOXwR7YbAE0AKeYq94bC2kdPo
         e17A5pIf460THXSJOtar3tioKrk5alP/CzNGBcBSW3mERg0ySRFPhm4ii0tO0YqLXfiU
         /s9j8/BpQL9I+3HO6gjZ072TLl92gPvkApl/Joqnedb3qlDJ6hATet9tkdsWyvh91TF0
         fwgKkfwnX7TeYxs1RLRs3cn96i8LAYkJGp+5tBe6T8MmcX1aaXjIRHQkX8otZ979ciQw
         2+IKPq235+d/hQbt6kG+kBSE96LWxFTvAlwB957vziyYfIlgKTJU0Mg11TJy8ccF77iZ
         Li7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564592; x=1753169392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igRKmJztcKVpdUX+y9lchuje3E9fuLqSjyB5RDorqw4=;
        b=ceDV6k6PlWA7vjdyw5Dz0HH+GFhLfFPeAlo9tEPv/ETrmPX4fYnmJqES3mkyw8TS3z
         fS6hTmUmuqeT8iEyd2oSZvh3AQDLET4tIm3dqqcpBzOYNmm7yT8CNFGMD/Plb3v5eP58
         /8SZ4zcZNf2l84XjJXbqbt4KD/427UoU6wkMFTSBmiDqurFmUMqEOWeyeWihOyR6SFLl
         /EkyfwF/80ZBAZgNPgdDkckfK/hceG89dfppmtEOdP/LcSGyzZoP4ug5l0E9tSo3RK58
         a/sjTtHsWlTxvynRrWQVrn8J5/9FE7Z8oKL1+haAkktL3nhT9XQOmKaiRERoPx40XPXx
         620A==
X-Forwarded-Encrypted: i=1; AJvYcCWUeUnU1YVa2eHUXtRb63xtkBcxB51Ncy20NZ/uHpsiWFU5K/C8ghGYhoN5lVgrOmeD8J5NAMc4gPc33BDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPZSqZ5P2T+Q3FgCJgAL16DUF5/ByuNcZLxydrlwhximBsIfe
	VO1L+P0fC5OI40oR534Vghje3PIdphHT7dTe8AatFJE6FLLMWrybz7GAaerrGR3tCK5MJR5QJ4Z
	tBA+X
X-Gm-Gg: ASbGncv6wECGZy3XFDnNwMBaTtINPkc2YaSP9HobcMxirzL4zMtYQNi2t00lHDED3lp
	6b0V43bh5LrHoDLe0eg5sstF1ccpAsJ+xHkQyVzn2Semk7oMMRjRnlOZoZyp1CFg1rffXM0Q5JU
	MplPFZT/z8NlG0Jzst369zp6ZJJbKcL+tWDpe6G5dSUl0by8C8VlB5ppDYowKCGF+svYjupKW/V
	3QB37qqo/1izAGYS6xCN9AsfH3MKzK05E+zADCEcCkp41HJe04DgxdILwEl40W4Zop5/JbRHKMF
	aEgk7B4/aQT84v9Qd8rd1dwk+SaQl/dt8A0EIsYiuOHKCDXbrJA7Aj7MEjouZEuy7i6jgKC4r6J
	z1o5dt0BoVzGitDt5iDsojm7KkSw0AkOEQmb1JUyvXu1YRwVRADFuvmBG
X-Google-Smtp-Source: AGHT+IEOswgcSDktjdBdtB5rnegG/4cAp7K55K7A8UnA371xrsFvPIVkAf0I9oWpxgphOBT3WowzKg==
X-Received: by 2002:a05:600c:8714:b0:456:12ad:ec30 with SMTP id 5b1f17b1804b1-45612adef9amr76669595e9.13.1752564592119;
        Tue, 15 Jul 2025 00:29:52 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:36 +0200
Subject: [PATCH v3 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-3-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1183;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wYiuInhT/0IBi5aTMYTxCqi+FJtCIlWWKNx/cq1PoSw=;
 b=Yd5Rujjbob3CnCPjRrUIgB1geUfHyw5dfBFoS8gbMx739dw0yhhLnWpk15eAQh/7MCWe03jQN
 M+taRvi0PcPCziUhIAqZCZ+WtyBcBNQO8ZKR4WMbJL8aW+96LRZGqNk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
sequence is missing setting the CMN_CTRL_OVERRIDE_EN bit back to 0 at
the end, as per the 'latest' HPG revision (as of November 2023).

[0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329

Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL, 0);
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, 0);
+
 	return 0;
 }
 

-- 
2.50.1



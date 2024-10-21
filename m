Return-Path: <linux-arm-msm+bounces-35251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB99A68F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 819CA1F21EEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA1F1F5850;
	Mon, 21 Oct 2024 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmeg9EGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0280B1F81BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729514797; cv=none; b=WMuZUgt9ItgrES0oHTdxqO2ndsG/vK2WoepEWOtK2QAwJWvIjHRxES/KV/D35WiYFugc3NBGtdc9su83zbooohx5uEIK5LDvnWWp4XX2ABmcL+7+wTra8jsEQCly1FSvtJDJNroEwJjAkmHlzg/t6xkVdaRG4WhdMW/YCFII+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729514797; c=relaxed/simple;
	bh=y77wJFpZ3UjOC8+X1TAadIhkOYe0xdFWOmEEz46fJdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dLQv2IELjbb2bXNwtkx2EgEaRTyYS07akW+a46GiC16OasfPBKw3vaDnOLEkZyZAE+ThLM4VtoQh6qRklocdUQlQqnDDuYCYjp6FsSVWZ+Ot5WrZPG4nDzWpZTqn8Q+iV0QgYZCWE/c3IPJW1VxjJUGmVHuNQ0LWYJqJHjh/2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmeg9EGP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso36069205e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729514793; x=1730119593; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMhK5URMSsZtw7ULiqbMgHL6EoB6FZYPqPuipW9HKjM=;
        b=tmeg9EGPo137ECL1CquHxNrSQDTA4h1rdk0tiFQjCU470kjdG4ny/BiNKxb8AnPZ8S
         gfo5giBBlc5FouoS+nFnktqSfsv6YV0YDVXQYTYumpsZuDImGSa4glP1o7KO5TnazhSz
         VHNv8P2B5YVXG6LqXxx17Z8gbDZi9K5hY+VRyF2/7qvtpT0Ilco14gsGdvFaRtDDeAiw
         2sLy2N/8lCqlPetbB/ZeXKv7r9laZnNBaM79ZuYToS9SKiehZyp7qY+77NDwe5XoFLbp
         tCg0s3saOR5gRYbwsFYAyj++94vJFdRjVOvV1EtFyPVfe28n/FMQDdMYc+qW2n7PY4J0
         QDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729514793; x=1730119593;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMhK5URMSsZtw7ULiqbMgHL6EoB6FZYPqPuipW9HKjM=;
        b=Y0sV/hfA7cO/xC0BSbKUTrDePtzX1oJlhHLj8yQt0Zz7dKSOH93dgjvqVV7FyPpcX6
         D8SH3vqQbzGeKvETMCiUpvaR8UZ8rXHQBPQnIQ3/u5CkecWPQe4ZH5LouEq2emb+GsOA
         IIbhhIGYCMhg7ARSoTI6d3vMNOruCGRrv9t9vYEwOnTcc+2bN+u1QtPagXAWGbZD/gbI
         PNa8ZmtBAwORIe+xcKJbcwSFRmmfmYsAFguw94SomHzt52UhjoEcLCF+1x9eOZROVxuY
         rw3mYKb7H3CSADeEmWlukQFH0Z+RquwKboO+Vzj8v89VVS/GEEFeJSFAFSyNqYKeAZHN
         lUWw==
X-Forwarded-Encrypted: i=1; AJvYcCVugyay50N4onR4NwtlTt25qk6UukXJNUgHt76dMm/szajQ1txGQB5TVm4MmMSv9LkbkBC2octmALeL+Uqt@vger.kernel.org
X-Gm-Message-State: AOJu0YyynYMgAvt1LAYqLYfg82D69l3OBFrcqvMW1OOhn1YNdz7sHAnT
	2hUk0mM7yQXx5Joifd4JGH+xtika7lCCTQAwbwPeWxirYjeD4CiD+dc4pt2YGT4RSmufXX2tObP
	X
X-Google-Smtp-Source: AGHT+IH1sAjyo/WBTOjqBNER0j6loIWwhXiHBU4iLvjepISdYC0429yBvUc6Du/En+qHsgGmIjXDuw==
X-Received: by 2002:a05:600c:1c0b:b0:431:52c4:1069 with SMTP id 5b1f17b1804b1-431616314c5mr83997275e9.8.1729514793206;
        Mon, 21 Oct 2024 05:46:33 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f570f89sm56459945e9.7.2024.10.21.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:46:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 21 Oct 2024 15:46:25 +0300
Subject: [PATCH v2] clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts
 flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-v2-1-0bfd64556238@linaro.org>
X-B4-Tracking: v=1; b=H4sIACBNFmcC/6WOQQ6CMBBFr0K6dkynIhJX3MOwKGUojUibDiKEc
 HcrV3D5fvL/+5tgio5Y3LNNRJodOz8mUKdMmF6PlsC1iYWSKkeJOSxIpUQpwQxPsMZA5xZ4cwO
 vAKFfwbZsIHwiTwzdoC3Dha7YNVoVWuci7YZIqXM4H3Xi3vHk43pcmPGX/mObERBSWxelkaqhW
 zW4UUd/9tGKet/3L+wKR0DzAAAA
X-Change-ID: 20241014-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-3e51fba26aa4
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=y77wJFpZ3UjOC8+X1TAadIhkOYe0xdFWOmEEz46fJdI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnFk0iL5wBinBQ3wCgTm3kdJrM8ETzHTztd0Jn8
 /7lElTLYr6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxZNIgAKCRAbX0TJAJUV
 Vt7vEACtYOnPdfP2BDOdRNP5faNd/B4jjhK0A+fQO1ZG29f0nY8Z49b68npfRvVSPhWVcsvF0y/
 NGjHuMQ1wQV5eF4wH2Tfpqf2+XSHVKegToeMmHwOopn+Z3CoJMvrSS4hoB3drVpKoo/7oI8cptI
 JDnB0550opiqqRbk8erokFDtb4GPKV/C6zwUB0TC3dVjktnE7BlBcvmHJWoZP7fJO1aqjHsZzZA
 biDLowe0mN2/QSfIMVYuc+JegvHHD/zDRQLvsxcPOm7TgEJFWTrI4UU1CcgGP/t8hQvmMoPZDlg
 rr82wd94u6BxEuDEgSaxpSakQLNln3s7Px8RQ2UwUyRk7aDUBLlxMkyCs401Hsvja+30ohhah86
 oJDA7BSyaglJGZDQKo67t4qiqBbBDoLfo1tnSNlNdj7PGiOl1ma/4deesYBPIykWHKNUZfcmYo7
 zx6BBgoYacAmMr35j0CGwAnrLYWXw11b0/5juMdanJTKmyqgnLglT7qEzZgk1fYtYZRHN9ZlcH2
 LWcBMzO7JZ/LWwWzt5mCC7MI/3m8Ad82YzD6Cw0SXCBVUVlCuWbuVlcDfF+6qd3fDS99EUMnoXn
 T7gyhIZrL9rntjKr2RBeByV9EYRpGfJzVnkroXb4cpE3bzDO/nZyg3K+sPBBbQkSNwHqfr/iry2
 8k/f+ukxMyuoJ+g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
configuration on machine suspend. Currently, the QMP combo PHY driver
doesn't reinitialise the HW on resume. Under such conditions, the USB
SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
RET_ON. This has been already done for USB 0 and 1 SS PHY GDSCs,
Do this also for the USB MP SS1 PHY GDSC config. The USB MP SS0 PHY GDSC
already has it.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Fixed commit message according to Johan's suggestion
- Link to v1: https://lore.kernel.org/r/20241014-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-v1-1-241a68c02be7@linaro.org
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 0f578771071fadb0ea7f610f04c5510a85a8485a..33afad9c878d30f487f63b311bcea6296d0653fd 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6155,7 +6155,7 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241014-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-3e51fba26aa4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



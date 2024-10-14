Return-Path: <linux-arm-msm+bounces-34341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66B99CBFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA6A1C229DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B4E19C557;
	Mon, 14 Oct 2024 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JFUbfera"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789818638
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914128; cv=none; b=LOkD/JEDAuCnghcBcqGbt4rQQrrk1dBAeGvYE67YKi9cgyFkILAQUGIhi2LkeGLkqKqPMKV5Evurfe6Cz55ptZ1Xv0G/5vdMbN6pTgBa0xEm7OaGDx46SnXASR4NBAPgbs9oUSCpzkkfjCqCb0K+De39dxfPGOhwHenlU2LGuaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914128; c=relaxed/simple;
	bh=NGIUHcjVkpQKPY7o+OZAEBnz+K2Zb66rg/sEoqDDM+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CnR3s4HIKRLUrUk4nN+Af2avlKFfkWU3dbaYiYvFStIuF+hUkAVEZEhggc9lQ4ihwgJvUf1ysChTqjOYZj6clwn4BpbZSVqiMWvuWy8A7iPkm3YvLlMG/CJ6ozcAgJxcMhBfWnn17PVlEEXxzyBmUzU7jY921Z6nqHAsoYiVTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JFUbfera; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so54377591fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728914125; x=1729518925; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT33WYXqsllYyguobGF6DGdz65+Y8fB8rGrczUSIDkI=;
        b=JFUbferaTkoUMs4LbaqtI8p58vgm2hQED/nq+7H9Uh03E2W0MH4KAubA3RGLy/aC8+
         0ApzcxyBxVvtFQpglyLlCKjC01XynFoVHOsA1LmYtJspuwgZVtMCXHpVTEHPLq2e/dCM
         mkn4r3FcA1Rcfi1S+R3GXml2RGP4KL2ap9S1CFOp555jWOXSp/MaeL+VMIq8jb2hHPvX
         6qSwAI1ZMgEsjtvfZb0VUgm4es5c7CHNqGZobQMQz7iGbk9nfWYMc0hInt5VliBuL+hF
         OH8oJu+h3ux2mk1QM4FmSrszh3SGJx2QTLKKqjditR175vy/ZFhB8FfXg36mhbV7epmo
         W1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914125; x=1729518925;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT33WYXqsllYyguobGF6DGdz65+Y8fB8rGrczUSIDkI=;
        b=lnvG1fd19jpO9pZqGBFebdoCczSE9dM18agAlNVId3JBAPC4i0zJBC8khDjut/dEva
         w2iXUXDCc8al8QbXUk8Xvso3PMlkiQglJFbb/MhPetvbmpVsUa+SUWAwJ9MYM87Ipx7C
         RkXOJ3sOZJ2UMK4Bjc53iVAawhAfJTEXKkAKh/YtM+Ru7lbx++m/F0PqNz/GTInfNcOS
         Bru2cNEBXTz3QX+ahumrIlQZP02bPPJRH2fK1QHZimEZQ1PitZW1I/a6eP1T30CmIKXx
         Ob3WDXU9G5Ef272mdw5whRN5ga5iOZ6HQlRnCQvuFbxvR9LeYtglo3warl/omxfPcvlE
         zD6g==
X-Forwarded-Encrypted: i=1; AJvYcCWge5pGhyJ4zbOPun2kVTeMWDpM6Jl58Zqa8X3pTlN1MbAggjm++bSJLWFQUVFQXLPulAGyeANTyQHQwPfU@vger.kernel.org
X-Gm-Message-State: AOJu0YychPKN3kg5vKyVGYloXgT/L2CNDBAxKWQJCheK2cgCcKEuTpmw
	RL4DlXl8qOuub8QSJKHP/0odKJNxT1p03KCqjnH1H1rztA0rE5TEqa7itReT/Ks=
X-Google-Smtp-Source: AGHT+IGKSOU3jpjbunXC9tV//rjUN36spR5d4fNX2mpMXNmp/3OA3As1wVMgTqJ/dMj6t4XA+aRXVQ==
X-Received: by 2002:a2e:bc26:0:b0:2fb:36df:3b4 with SMTP id 38308e7fff4ca-2fb3f2c7231mr40187011fa.34.1728914124933;
        Mon, 14 Oct 2024 06:55:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb438c06f7sm8039641fa.55.2024.10.14.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Date: Mon, 14 Oct 2024 16:55:19 +0300
Message-Id: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMciDWcC/3WNwQrCMBBEf6Xs2UiTtNR48j+khzXdtguayEaCU
 vLvxt6FubyBebNBImFKcG42EMqcOIYK5tCAXzEspHiqDKY1VtcolEcelEe/Eoc5Kjdjby2SHTR
 BXT2FZn7vxutYeeX0ivLZD7L+tf9dWatWOTpNXdfeeje5y50DSjxGWWAspXwBEFUdC68AAAA=
To: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NGIUHcjVkpQKPY7o+OZAEBnz+K2Zb66rg/sEoqDDM+w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnDSLKspHgnnvhllB+AgI0EeCIaGlxtXGxNHkON
 nC6OmULEyyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZw0iygAKCRCLPIo+Aiko
 1V5tB/9rmFlo9KKXviiA6KgOmxsQhasXCsCn1VGx/8lSrsc1PrMyKiKYmqAYlUhs8LMcfD10A28
 U7ZAaxxdCoa5cWf1AFdV1HGX/GsDqE6EFa08ZjgTejapXDUaItpgZnPe8P+lytEI9W7nUR+aFxm
 gA5xSTaT5mDFkz7ec+1JRoybiXUMZOHyMgeChqyjDt0GaRj74TQltoN1/MrY98TqtqWIiDCTdBq
 H+5lpUlRsHl6YDzMxcpnknQUoLLp/ohl2bRWmnLTz8su9JbBgDlPr++Qb7kwbP8Ji3P3fXx0qUG
 AfL3XC5vS+W5B+0elGBFa2+etDDYKJuU/QBkOOU0JkfPo63/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the ARM64 platform and implement simple cache information driver.
As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
limited to the ARMv7 / ARMv7M, providing simple fallback or just
returning -EOPNOTSUPP in case of older platforms.

In theory we should be able to skip CLIDR reading and assume that Dcache
and Icache (or unified L1 cache) always exist if CTR is supported and
returns sensible value. However I think this better be handled by the
maintainers of corresponding platforms.

Other than just providing information to the userspace, this patchset is
required in order to implement L2 cache driver (and in the end CPU
frequency scaling) on ARMv7-based Qualcomm devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Handle cores like ARM1176, which have cpu_architecture() ==
  CPU_ARCH_ARMv7 (because of VMSAv7 implementation), but no CLIDR
  register (because they are ARMv6) (Arnd).
- Link to v1: https://lore.kernel.org/r/20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org

---
Dmitry Baryshkov (2):
      ARM: add CLIDR accessor functions
      ARM: implement cacheinfo support

 arch/arm/Kconfig                 |   1 +
 arch/arm/include/asm/cache.h     |   6 ++
 arch/arm/include/asm/cachetype.h |  13 +++
 arch/arm/kernel/Makefile         |   1 +
 arch/arm/kernel/cacheinfo.c      | 173 +++++++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h        |   2 +-
 6 files changed, 195 insertions(+), 1 deletion(-)
---
base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
change-id: 20231231-armv7-cacheinfo-9fa533ae371e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



Return-Path: <linux-arm-msm+bounces-23594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9829127AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F04A4B288AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421AB208A4;
	Fri, 21 Jun 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMGuYvwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C9622EF3;
	Fri, 21 Jun 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979991; cv=none; b=i9Z8urpvcYOABtyyORAlvNj0jx3McOhvZp1M07VNkeABTEBR5gfF8Y6+QP3+elF9iguRvYxgtM6Jmr+Xkq6eh4dT2fPegOSUEet5qX6Mlx1ocfbrLl3lqSmZ8cfbe07qzta/BOkyrK2IwBrVqp88M0WiuPqPC1K+z3zPKpuxFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979991; c=relaxed/simple;
	bh=tvHHuO/BCSRLG6rPE40hQw1VVA3fAhsW8KG0I1YjU9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C7osBu3HG0NWpUJY6+QMxiw9iCu69/qqbgxIVZr3/x2knyE3jpoVZVYU0RHPw1CQSiO5ds5GSZGqzms6/Jrj2zVoidGw4LlNl0YyxJE1BxZnX6WtZaSa0sibfktiJifasfuL4zphVqwYbGrcPKMLBvvtAZ3Sl52Imxm5073gtV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMGuYvwj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b78ef397bso2765471e87.0;
        Fri, 21 Jun 2024 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718979988; x=1719584788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVXXvLK2SUZBN/O7yt3THbrNfcqJYITD8QMvF/flJds=;
        b=RMGuYvwj2smZreTYF71/H9VVLJMAixW1LEZvtYGpgBe8aKZ8YIBQ61IjYtVOfYMZSl
         ZSevz40QlOPKBzZH9hJcSQKWliTGa1CMdCZxEk6iGWcdziiq3jeaKYk2NX/1EivdIvRH
         k1hGm0u/tju8GMpycQUZEup6uaWhn/r00FbY4Tzc06HPrirGcqveORppxwGF/GD3PKWj
         TUlHycMxEai1mggqGGJ5wJt1tqHg6mSqzZ+e2R8n2TjV0yasq00Dcgxzf828al4TFxJB
         7GGPEqqyBiaP8kKJdFNjgEjAA1OVn1rpwAnWiiw5dxbJk3dwdgS6CqAGCR1q2Lti3kTa
         EdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979988; x=1719584788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVXXvLK2SUZBN/O7yt3THbrNfcqJYITD8QMvF/flJds=;
        b=g3bzAJXw9WKTDfc9PWM9PbXE0ktajdVZAOmkRq7P1KE2/oNjXuFHoKAdGEXu1MO8wV
         wFUdhFBMQ27IRU7bDXzTZTqbG+mYx/8q57NBPVvRZ9GkPHDvWzdzjJuMkD4cjI3tsW0m
         lLOt0baqk1Vhvp1VGWn4gAVbQ/iR309VS5PNo9eq4wJc/ZqUSmfVaP1BVxVkVqRDffGI
         +Yowd13H4EwblSXghHibOUASqcoCodmHt+WZKRYJkPIUfqq1C42xCkSupczSwkgutoH4
         WqeBmYwi67br787iYSfc45MWeO6yvXoVu4RbhxGuj69WtyPhrahNXqXEIrhm1k0Yzs6g
         H5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVQBKJwADTOlgQVHY/LwNTmDsjfVjBXUL2Z1ExETTuN0KGy1T0gaKhx7RW5TBw1KUt2jWVWInRqZH3BmEGvbbAFYuf17F4RxAara5dA174PDfxx+Qn12xTAFcVCtJMh0ne0pdo+SSvxiP+xM1Cl2fKwWRFhcGiW3YVsI76F8qgFqax9VuoF
X-Gm-Message-State: AOJu0YxfbKJy0W2YeRoGzaAIvEklcDPVx9OlaF8JE6mBfmB8+uPDJi3Y
	C7kJl8OGY11jvi6vFM7TjtQwaRfZQeB0sgREkYoaBx2s9DH6VhjScaNGbQ6rEjU=
X-Google-Smtp-Source: AGHT+IE97O3KqXdCaStmRgNECBJpcvCuk+oQA+RtuAspu2WyC4kyl34Wxr/qEMf2dlRgL1HeZNA4Bg==
X-Received: by 2002:a05:6512:1050:b0:52c:ca8d:d1c with SMTP id 2adb3069b0e04-52cca8d0d51mr2505448e87.2.1718979986970;
        Fri, 21 Jun 2024 07:26:26 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6452602sm210890e87.298.2024.06.21.07.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:26:26 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Subject: [PATCH v2 0/3] Add Sony Xperia Z3 Compact smartphone
Date: Fri, 21 Jun 2024 17:26:41 +0300
Message-Id: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGNdWYC/02OQQ6CMBBFr0Jm7ZC2wQquvIdhUcoAkwhoi42Ec
 HcLuHD5Jv+/Pwt4ckwerskCjgJ7HocI6pSA7czQEnIdGZRQmdBKoB+HGc3WwcycK0tC20LWEAt
 PRw1/dtm9PNjR6x2d03GEynhCO/Y9T9ck6FQKdFbCFu7YT6Ob90eC3NO/Tfm/GSQKrGxT6Pyii
 1zQre0NP9IohXJd1y+oqbSF0QAAAA==
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=tvHHuO/BCSRLG6rPE40hQw1VVA3fAhsW8KG0I1YjU9M=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdY20JZOj4NxV7R7R6FeBOJ+NvEKKtjOgKlcRs
 u+T4hXrfFeJAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnWNtAAKCRAOCbsK84IN
 WlZtD/445YWs51MAT36+axIx5fgDOHQuVEjJsdyyUuzgzVVYK80tuR6wfgj0ffM4tyUfMNDBU4e
 OTa1WWCK6G0mswmvEoqHuJITRVZdjAytOrpWyTk+2WYchrSHMplwYizmQbKNG3X493IKxc0vAoC
 xwPpn8c8a03qgox51GmA5E/uD/BNTiEViNJPK4SvGT2SB2K8tQC8y9cLtB6rKlMF01VgcLqTGZY
 4kHUYca8R/2Egzus+WfzWotvOkvVleKN9qjl9i7ZU1iJ1ns/XwQYdcI/3rrNq/KUJAcVAvJbsuF
 PsXKUXZZ6dfhR8OXtOh9IIDW3moS7+prXOYl5KVrubSr6kKUzhK30WwVY60+mfEzkEcoxv7oqAa
 7lOwOUO+q4uYhSvxB1UknTCVP3jkxogsWp1zLaxcLlCN50DhLw8F8aaqJqvdj5BYGgywHNIX/P7
 7AteZy2Hwaf61tlrey+p7KgQGkGvSuZozFxMFb30Kn7y+4FeBHz2xQYhbyGXB7DtWC7Herz+rOh
 RbkisAW/zHHqcaGj5bI7p9H8SWZ3G1jUWe98Gsl0id4zrswMld4g6fDmpwz2WO2MJWPnkLbYkU5
 NnZ9PJOK8gUXrm/va6zaqNHkFWvJVeuyeh06K7GQmXvNh/89SEvzLb+gOaNoB3Gi/nRr4AuK/dk
 ZRFmaji3b+4iIJg==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

This is almost the same as the dts of the Xperia Z3, except for the
battery charge limits. 

The current on the l21 regulator for shinano is also bumped up
to stop SD card errors.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
Changes in v2:
- Reordered dt-bindings and dts commits
- Link to v1: https://lore.kernel.org/r/20240621-sony-aries-v1-0-bcf96876980e@gmail.com

---
Valeriy Klimin (3):
      dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
      ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
      ARM: dts: qcom: msm8974-sony-shinano: increase load on l21 for sdhc2

 Documentation/devicetree/bindings/arm/qcom.yaml    |  1 +
 arch/arm/boot/dts/qcom/Makefile                    |  1 +
 .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  | 44 ++++++++++++++++++++++
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi |  2 +
 4 files changed, 48 insertions(+)
---
base-commit: cd214efd16e30bf1aa40ccfaaf9177f47dd21fd5
change-id: 20240620-sony-aries-4a5bce06c91d

Best regards,
-- 
Valeriy Klimin <vdos63@gmail.com>



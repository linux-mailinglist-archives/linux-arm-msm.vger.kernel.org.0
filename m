Return-Path: <linux-arm-msm+bounces-59352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA68AC3675
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 21:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C338B18947DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BC125D8FB;
	Sun, 25 May 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0gH0rhG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F9154BF5
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201174; cv=none; b=Iv7EPro7Kb9CGUq477MnelK9NzshucdP6LDm00BKUS369j4jt75fpJACEMK/fOiV0i1V6Y4PotVfgo/jIFLjBXTEYOGP+3MOJo0Ou054QboZjGvYFiurarf0Mi6tz3Eptd9cfN7WFTv33mN6USd5ymBORZcWOZIa/dbN9hkNV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201174; c=relaxed/simple;
	bh=jE7IlBQlM0F3rIIfVaJxXemnfRPX/+Oc/0OR0K58/Tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TiG/pzyRa4KeQfav9wJV0PTfFoZJWb3fBhruXbFNk3ySq/lySdt8xQ+CCM3qemTJxSk86WTHPj4KnKnIrnvATInFW4O0HNMFRO63L7z47tZHXBgbJiqk4IGrf9JAshtkjjm7cEza4zRUlw6go4ngao6eyuiwXVkF0kMBV/zQfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0gH0rhG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso347345a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748201171; x=1748805971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYX2VxTDW3I8LwPElWAPGFQp/0/pEA9CwguT2DQks9Y=;
        b=r0gH0rhGMr+1FVNQ68Flvrf0W2kPz0akxB3UVMJtJbgWWQK8qP6SxMqKHVrmIwgj7k
         HiOmPnUWK53GR5jy/wW1lp8BcMc1BOowSeWuRfB+7aOm+i0r6d2pfvia9DtYPnOp9Wfm
         ciUiq86UBte0Ro19dtLG4AwNJ+Hwk5GDyDFqK+GB4ss/kOdtQIiqzxLpNP1SNy1FPluc
         YytPbes7tpHvxpIxrh2Wq8NZCafk8RmvPToSWnqminbp+og5aiPJoPXI67D42Qz6HjkN
         3JyJKPUmRrKULsOVp5xRUxSZU6s/jCvOpntd8wrw346lyGlyMvdpiSctkeAiq6zMI0ng
         Cn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748201171; x=1748805971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYX2VxTDW3I8LwPElWAPGFQp/0/pEA9CwguT2DQks9Y=;
        b=EBfwbA6xeRJe6WAz3pA0kYYxAdgiVXWjowhx4/BLGxhpZzrhpCNfcJLbWyH1m/ukO+
         n1xeTblgy1/sLXtFxpbSeWTe2+9ohfxzRq4CatnjrvBkoGF974XWCUmnc+Et7kgWGAti
         4NnULKMJlPSSZmsBocNWK1kYAjbsp5CspHynkhGYGUWB8BIZqVbGVvV86QI4W8/3k3OB
         SSKmLuM0hCp9qoQOjpY8YN1P1nMACtVwyLqmZ1aH7GUaVNYdKnN0L2ZcTfrExQqIbI9b
         /TOHio9Acv8wjfoWXrLaoFR+uJppynTqc29B4KLbPRn8z7rJOzEHZXjYnCllWI5BzugV
         FY7g==
X-Forwarded-Encrypted: i=1; AJvYcCUmxWoelIHAO3luAx7WfSWbd5cFe8wBM8Pst9fGJYhiO3/aqx2pGFFm2FtW/r2gAZws2pfGsJoKrEExjJdT@vger.kernel.org
X-Gm-Message-State: AOJu0YwveBIMMDiRCDooqbcmG9Jir23KE4VHlEFEz+KHGboNwTSpt2YW
	UgP4VZWdm/82rHwlPwFH4v0nG0I3hZ1GLNKy+czdxv0b9tUI2E7dD8IAuhDkLKRk0OAdYZJ5FP4
	zDxCM
X-Gm-Gg: ASbGncsNfJM8lXgoTAu7+rvWR1iYEJsRNuJS/hnr55l2ZMiZ/9R8k/3n3X8KPPiwJMe
	4s0/Cj1dC0oXMeOsRDj4PzQYN+Hwbfy/5nfieFOl7U+HPvVT+WEQzFi6pH2QftkuytujWGdjMvj
	yEzVKgWe2X6fjAfgyEBd3Whv6I/eIjjHJufd1qKLBuaSbS3BYYoixaYM0qKQ91SCC4A7WV7tJPq
	lMv27s4Lv2OYALMrao9btABdrs+rB/k5SNODWkdIY/+QnQPcWmQV3cXtklnF9QGCDZ9nLGHopDQ
	g4+kOqDqMib85jcMGm9nFFX/F9Zl45SEpVKKdU464ADcNW8y/aMTp9K0ZR71uFPHIvmmd5o=
X-Google-Smtp-Source: AGHT+IGY5IBd1z66/du4TlRG+M4D5MbhMOYD3sYEIBAG5BcmYK4WZDTuR9Zx90TCb9Ox6R+6iJuIjw==
X-Received: by 2002:a17:907:1df1:b0:ad5:2b38:aa6d with SMTP id a640c23a62f3a-ad85b2ba866mr163136166b.13.1748201171003;
        Sun, 25 May 2025 12:26:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1578899866b.19.2025.05.25.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:26:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dmaengine: Minor fixes and cleanups
Date: Sun, 25 May 2025 21:26:00 +0200
Message-Id: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhuM2gC/y2MQQrCMBBFrxJm7UCMDEKvIl2k6URnkVQzUQqld
 3ewLt//j7eBchNWGNwGjT+islSD88lBesR6Z5TZGIIP5CkQziVilpUV/UTXnDhRDh7Mfzb+Hab
 fxoMbv96W7McIU1TGtJQifXCV147/7AXGff8CnALkdIwAAAA=
X-Change-ID: 20250525-dma-fixes-0b57fcec5f20
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jE7IlBQlM0F3rIIfVaJxXemnfRPX/+Oc/0OR0K58/Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM27MQSnocEls/HhQypawyfu0BaUs0u0+VFH8/
 /LERg9+uXGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNuzAAKCRDBN2bmhouD
 1zf3EACNIKCh/Z6bW2K+8696jp9c86f5Qs4KVSWacPTu2cHmrNBJIn0WXa5/WYZcbiC2lr6sBaK
 k+VkqgovuPRqo9KI+SX9nkZlYDV9k1qyFvTxznPWnfgkwYi8XK7Dn9+OBE6Arpc8PKM/AtHONXs
 NWHz/Mtti04KKnhOfalOUfCtQDoHvlMhpzQlSczCdyWVLT4EJ8tjPkWkAkhjUI+bpKhafYzDq2X
 IzefUKT8V0k2cALakyGpcCIwbPsMksym6/Iy8yr6Ie3hA/g6hktIK+AUrEOGZjUIPpikxeFSFtY
 hyKyE6s7Bz5HqDqcy1d9NrVSeVZJaIwStYfPuHKy3c4E2o9ZqBPyftfQPwAhR93dkamRFWTLCKf
 /DAVoPB7vI5ao0CtQCW3Sf7dCy5PBhlpK9TiPYtssm3isdrxuGMOzUyAfxYHfsNZT35G8hlUTlW
 /tmKhhniJazrUly4qWvzW9WMUU3Xlu1e5VthTvRqYfxHnUHXpVGIwn8A87nqm3ZIiZS5RyaOjUd
 U2BIg8e/2eiL/rf7oNg9iF3+hqTRpOQ9FSHz274Xf3GTE/Oz9Cq7nKxo3K6hnbuX6ZDgtWsB6of
 W01lh05oTYSiFRn8fVKSnfx19Z2BX0INqDhjcCRr8KTuH7PyXHMqnhtS2fhH+cBeT+QseEBa6Gh
 YNKMsau1w76OABw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just few cleanups and fixes.  Funny thing that the reported cast error
I fix the second time.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dmaengine: dw-edma: Drop unused dchan2dev() and chan2dev()
      dmaengine: fsl-dpaa2-qdma: Drop unused mc_enc()
      dmaengine: qcom: gpi: Drop unused gpi_write_reg_field()
      dmaengine: fsl-qdma: Add missing fsl_qdma_format kerneldoc
      dmaengine: mmp: Fix again Wvoid-pointer-to-enum-cast warning

 drivers/dma/dw-edma/dw-edma-core.c  | 12 ------------
 drivers/dma/fsl-dpaa2-qdma/dpdmai.c |  5 -----
 drivers/dma/fsl-qdma.c              |  3 +++
 drivers/dma/mmp_tdma.c              |  2 +-
 drivers/dma/qcom/gpi.c              | 11 -----------
 5 files changed, 4 insertions(+), 29 deletions(-)
---
base-commit: 781af674a40df73239e8907d5862fd6fbcf01a9a
change-id: 20250525-dma-fixes-0b57fcec5f20

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



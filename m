Return-Path: <linux-arm-msm+bounces-70329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB4B31402
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AF7F5C35C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3772F3C27;
	Fri, 22 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbYnqG4A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDFE2857D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855573; cv=none; b=Y8UNYr5bpY9gjjq6gGC8wgKRv/hcDcIdYgys1KLfm4vuzlnekILIK55XUrdmJwQa54FMiEQ3JCjyFI7En1t3hJ8vEnCQYdbB+NcmD6JG2BcMw3Ekze1FaqNCH/tQzVCX4zaeW5+XHyWT/IW2xo/WDhkza3Ury/TsyS3l7jDYQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855573; c=relaxed/simple;
	bh=IVLr7G5CNd1mqLrgQvVKCpA6gBxqxPNhBzSeQuBgqi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgpaeHS41ZHdNADtfjSbPfnTdPtepsvK0ste/HSACF06pBq4dazdjPIUDHs69vhE4ZcQGU1JXSp553fa5Oco2s/d/jXgdqGfIjJo1sGUUiRvnN5jQbzpm9ec8/bFrg7Ry1PZ0ylaOB6CN620bapELVdmg+FCzjrbq1uIEitc3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbYnqG4A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso15090755e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855568; x=1756460368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHIXsS+Alr8U93l1XOYaFtoBwmCHuYPMxDTFbbYlAd8=;
        b=kbYnqG4AvTHrAjGpl7xEoG5USmhfp0K8WuD1uQ69kgYQTX0c+HfJakxcRcm7Txd/Pr
         8yJXsKgGQJM2TlkfqC6M7zd1yPk3TIHhTXNEhab1esSe1DeN0UGn+YwIfXw1rlCx22XT
         V3M4BTr6ehNlzEpOLqShmgAa7++sqoYdrhXbmaAL2Jlitt/nRNnAu0ttzSy6nM/kHpgS
         2uXcVcCO9RMhSu20lyuM9ak79yJy5Fwfu2hJcOXcDL3ShOLV/nSdrXBD6f7WXzFJvHEJ
         QOtpt1werHVNeZsHLCieUrb11C7oz8hWIrG/w9bzN3D7ijKpGxlEoyLs9vwQRiEWTaUi
         QaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855568; x=1756460368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHIXsS+Alr8U93l1XOYaFtoBwmCHuYPMxDTFbbYlAd8=;
        b=nadhs27KKYXQLidUoswGz3PJxGoAySYZGD32Q7VMFgr2KzIxEbZGZ1Ocr0MH5x6HIA
         xmLk0db7K72r0T0fbHZWF3gX9kFAXDTlRCmq+juq/xg+Kpwg7tgzpgA1K0F3kmkrdzsX
         KZa//EsnLF8t0ha9MkQMnkn4LxiouVDeC52ebJqUYO+eIbsxMDIUeL4FV3xj7J1qcxXJ
         USGmjOwBqTGKgNUKzTVdyeFCcYz2auKuJPLcdaZXJeU1Y7eNriHR6P8OEw3m+3KEBsKu
         T+YFsUhdWwdNvJZgQNwo7BPzEzCnkdaZvzm8mCcJy8qphuM7X8lFfD+iPxky2U6HItvu
         ymxg==
X-Gm-Message-State: AOJu0YyNT+12ujW8S1fWLhiodz+ENexA1OM46/6jgeAUij5/8YSU4fTE
	iT9G3Y6iPnpXWgWUFdBTeILs8vm0+LghEAtEOOggwEtLfK1Dhjg+pO/sxe9UG86Sjyw=
X-Gm-Gg: ASbGncsM0SLZQWJc57LO6CBsa7SHKDsQtMFWElWWzUFtWrG10Vsr1TN5I+PqwNHBNI6
	ZY1yzQjecIWilRc0EkZ412qGGDuzjH5NrQ7a/w1dDQj5FoGDH8Pc4dccRjOcNBEfmK9eFzir54/
	48t1NDQktFwx0AjCu1iy9ufstyQWEei4UbRGYlVurmx/Spg6iL+rxnTMtcrhlVFbJeVmA0mFNrm
	HRAdodAEuMZR3hl3sM5/nr/aw8W2HlS3Aic7WW1gavixwY/SF0AnF/aZqVCPDqaVjPmdP68dYuJ
	ry6ryXCiVKNcm0hg41KWFgyRctGTq0zm/EFuzkv31pejdcTHxKMbbQApI+gkUGHV3sILTOFDNVO
	aF9LMH5QU5kjPJZwOTo0WjNEVm+hflqIWokDKr/FIk7E=
X-Google-Smtp-Source: AGHT+IEfZNR0YczZ6ueKNvaEDwWLUmdVBx2nsk21YsqEFRkij5/C3GhysJVqrTLvlLx+EdblKwR4Xw==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr19119525e9.26.1755855567580;
        Fri, 22 Aug 2025 02:39:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:21 +0200
Subject: [PATCH v2 09/16] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-9-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IVLr7G5CNd1mqLrgQvVKCpA6gBxqxPNhBzSeQuBgqi4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrFBWwNFJRuZ+wGXn76jklVMu2OmpJGTRTmL+Th
 LrDbCJGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xQAKCRB33NvayMhJ0T33EA
 CawvbNbNt8lOZkEpTY9GqGM/7FaChv1XZFpeL2pBkXyWCahuSZxpUUS9kRJ3CX69vFww7k1rzGQxy+
 ufKxxK/iRtQLsN+a1OWBek4Rul0gg/nzaMkG/b8afaHVeyMI5OCvwxXg08/WfSEnOve2wtzS7sfG4S
 S8AY/3+PAXVcp1uQhPMjy1OElm5AgzoYewx2oWtbqKx4PiC5Nwc+5Hto8ehDKTnLa9G+J3zJbzepsC
 yrnYs2ob5pn9OtSkuuwuXN9jC2CCun++KeLFYG9E1W0/gl12ioKfiy+Z2n3tcNVh33MP2J5ki1poHu
 lJuWhtW/nQV7476HcI9M+cnR8aQ/rMtBpKUy4l5IEtJzezJJIFbR27NroFMJU7kSKG6MvKlSyegitR
 V7b4hJfFMcMRUzPwlrNKSlmtCVDVOOFKqM003hCsN7Kq6hRg4xERlIILiz2hwWJbFaweU5TZq2MviE
 A2v8kanQ+sG9Ql79Vt290w+dzmBSDnVCAcYHPO3DP3f1UyR6ojBSFqnun9XGFIdOgRP7uWt6MzGu+N
 VWZ851Lg1j/yRyMhOR+rAKKZ7Ff2AoQpqj1V7DMiQCSsGvKMjf+P5SqLBEr+5Gyzc1tjFGHjlZedAO
 PYTDpnnVEZPVRpdPhiPu+igBu2fTaWgftagMHUO74ObrleCjxAlJ768uyLnQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..9f965a5faaa9b687ad0aa609fe42e4841c7f7d63 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -994,7 +994,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1003,7 +1003,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1



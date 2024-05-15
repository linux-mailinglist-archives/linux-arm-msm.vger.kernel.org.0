Return-Path: <linux-arm-msm+bounces-19888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5178C68A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 16:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3F25B229F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DC413F44C;
	Wed, 15 May 2024 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="iHRUJyUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBA13F450
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783270; cv=none; b=TVyqeJ5IW+a1lovtLOokFf7XFAprM3fZToy2BC3cVL6JC6V+zHQvz1c1uRqbrFVmu1SDW8zpE42Z1IbDuS64yq6m/ZtmJd/JVQtpTGjq6/p0vMHh1gTVSBsrMDP7XqX3bMq8FnKNynOlunJs0wTzwUvCnHfpDNBHCu2pEA/BG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783270; c=relaxed/simple;
	bh=ufi3YrDv54F61sup8uoy+HeDe8EMFvJXwfuvctHSBqE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=dFlAcqhdbrI+Vx+XUhzBqRN6UZogPhfwJ8DTFDVnQqdThMzGYsVRri0z5K9SQ+m8hIYDrLwBkgz8dVKmMPB7uuATH+Z3MFdnYYFVb32hHOsClpwuD2868YxUYoCObbnwLFZy88sgEefjBz+vHhqyVJ+GOZVVKWrfawLLJzmfjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=iHRUJyUK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so68305465e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715783265; x=1716388065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HxPoa4NQhCeMpVCVW9Zfj831zpXTVZAZVyPlzQIJ10=;
        b=iHRUJyUKnEK1+c3qujuIrjUeJe1DuzloJMUD6okWG+nKh+rpMG545msQsSNg0W2uX0
         cZTHfHVxphgV1eSwlHQciq2VYXni++BNRhUypeulYvmWhvIvFuSS7i9eTSxNJK0pm2JC
         EM/SYhH/AoulP9OLaj9V9BXfWiCEJT8Z/PaenA7IutpkP432FBirAiTdb7VceOBphAoJ
         PQQ+PPkCu/ZoMamUqOhXSYNSe7d0ljPT3bE03+t4mj1oVIbPDGsnJR5+ZuprCsb2sU4X
         6Y5/F9uzX3Y7AI943WU1nqX5ifhOEFZ7HRcSZKZu2cTawV50P+mJ5jWvVrtnRq9uW8JK
         H+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783265; x=1716388065;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1HxPoa4NQhCeMpVCVW9Zfj831zpXTVZAZVyPlzQIJ10=;
        b=bYZKv+6gjEAkDL2g8T2qRmre/MrZ2y0Nnl9UqElPzqgKIZnVDqcNHoHuvTu5TLbIAo
         PWGtx6dFppdyEa8ahiLSq5iNG+zVsid3snBprH6vR7nCoAvIveLt5IyJSjJCn9hXRTOP
         ixjvO6A9qu03D0h/O55p8p1u0+bIPFGz1zHVJf20EvVVAKphAnNGWQC6YEOHeoK2HiN0
         RBr6kWWSBbIOKXpzpsivUKeOYX9s8L3qAV6BJTSXLTdIfFF7QniujCs/qoaQru8WFKQQ
         1XNC+WNnjq32TuIK0AyyH3taxaEh75tRe5DsVjGBfrIsN5y3PTnNVdDXDI2lZdb8sX+I
         bZIg==
X-Gm-Message-State: AOJu0YzPJNC2wwQvjQoq0u03Kfe3QZLcPWv+6uSd8R6WWPBkZZcWN4ms
	aqpU8wbq9N5yAZEpbkc24dkjQ6dcNZPPmuosJ+FknZUQiZNtBHWKFJCMAEY6OUwQxkpYjSUN0gu
	U
X-Google-Smtp-Source: AGHT+IFIMkUB3jdsXdDaj/pLEq16XlGdkbO55sEQsBTeKbrHyf1fwTl3ZOHdEt2yaaFuYLNWSfBSkA==
X-Received: by 2002:a7b:cbc2:0:b0:41a:225f:becc with SMTP id 5b1f17b1804b1-41feaa44406mr148324755e9.21.1715783265398;
        Wed, 15 May 2024 07:27:45 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d? ([2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce1912sm238592105e9.11.2024.05.15.07.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 07:27:44 -0700 (PDT)
Message-ID: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
Date: Wed, 15 May 2024 16:27:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2] arm64: dts: qcom: msm8998: enable adreno_smmu by default
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

15 qcom platform DTSI files define an adreno_smmu node.
msm8998 is the only one with adreno_smmu disabled by default.

There's no reason why this SMMU should be disabled by default,
it doesn't need any further configuration.

Bring msm8998 in line with the 14 other platforms.

This fixes GPU init failing with ENODEV:
msm_dpu c901000.display-controller: failed to load adreno gpu
msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19

Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
New in v2: rewrote commit message with input from Martin, Bryan, Luca
Supersedes: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>

Maintainers, feel free to drop the Fixes tag.

Failure log:
[    2.756363] [drm:adreno_bind] Found GPU: 5.4.0.1
[    2.767183] [drm:a5xx_gpu_init]
[    2.767422] [drm:adreno_gpu_init] fast_rate=710000097, slow_rate=27000000
[    3.003869] [drm:msm_gpu_init] ebi1_clk: fffffffffffffffe
[    3.004002] adreno 5000000.gpu: supply vdd not found, using dummy regulator
[    3.008463] [drm:msm_gpu_init] gpu_reg: ffff0000819e4000
[    3.015105] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
[    3.020702] [drm:msm_gpu_init] gpu_cx: ffff0000819e4180
[    3.028173] [drm:adreno_iommu_create_address_space]
[    3.054552] [drm:msm_gpu_init] gpu->aspace=ffffffffffffffed
[    3.058112] [drm:a5xx_destroy] 5.4.0.1
[    3.065922] [drm:msm_gpu_cleanup] 5.4.0.1
[    3.074237] msm_dpu c901000.display-controller: failed to load adreno gpu
[    3.082412] msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
[    3.088342] msm_dpu c901000.display-controller: [drm:drm_managed_release] drmres release begin
...
[    3.197694] [drm:drm_managed_release] drmres release end
[    3.204009] msm_dpu c901000.display-controller: adev bind failed: -19
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3d3b1f61c0690..edf379c28e1e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1580,7 +1580,6 @@ adreno_smmu: iommu@5040000 {
 			 * SoC VDDMX RPM Power Domain in the Adreno driver.
 			 */
 			power-domains = <&gpucc GPU_GX_GDSC>;
-			status = "disabled";
 		};
 
 		gpucc: clock-controller@5065000 {
-- 
2.34.1



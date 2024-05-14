Return-Path: <linux-arm-msm+bounces-19849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3678C5A0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 19:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B48D285E22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 17:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C083A17F37C;
	Tue, 14 May 2024 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="nxDuQkhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177C117F383
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715706250; cv=none; b=emlHErq6+55jTgcM41T1RqGsPBocS7wUqDpW2OKMnEpbm7oLwM9UUoIzTEvm/CfoME7/U/9Nyt7lhjySfHmlu/E/4ymCrkWm8iJo08iyI2TMYI7zDYMxXikB9VhbqG+Vgm1+2kDwBeCS9oaTByx1TPjhx23ICqb2VYHrQCMOkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715706250; c=relaxed/simple;
	bh=T6sSiqSrMnWrysmJSPGDSgx9qQiLjHdfzT0cczf2lqo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=uZoESZpGN5C+BeAreYTsnnm8ZQ8zDbOIuCVPPc57FPJnmf0Tv+0OWk3Vo2IFAUtNbrP4o8alGgiShqW4kaEnMo/DBllrWFxpFjBVF/otrjHxVPqZk0wGuoayPU9By/W6jse9O+L7x0OWvbM0FcO5B+5en5aKQS9M2j49LmVWkEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=nxDuQkhU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-351ae94323aso2710850f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715706245; x=1716311045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYQY0YoKnLOnzqTN5xdIK3wHHJXxqITzL2nxzY6rvdE=;
        b=nxDuQkhUOxcTuxlQLMf84a4mKf6K1e7L4b6EfqlPS0q8itMyTmlBkQTX3W9a3o5g7B
         qTLfxWvS4iNjphYcLvDlFs7pAxnArTmpShyosszmA8s1u8H1W4WdNEJgZcKohLgwaMY8
         t9j75VC2vH7/ozuddPGfNBJwjQvSxwaCREJBPfZNWZSMZd9XLOJMFcFhzwfFd5Lw2hn/
         RfJMqjblCAxVVfqZZ/1yyCGKaot2FJ7De99tl7AuyZgn4cp4vD4dkq+3ksj13hWxmJ1d
         pyewhoSiiHxyoFcy5HeuI6ia7cfVkirDSUVpaEQrcndBw9OA6lZEVwZ0clw7bnGEM+XT
         rfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715706245; x=1716311045;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jYQY0YoKnLOnzqTN5xdIK3wHHJXxqITzL2nxzY6rvdE=;
        b=oQji30Yi42xbT4HJnmlBZPSNvjVOVoJYoQAbZZYLypML0jaCL6NZ8Xfq/Q/i9BWrFl
         b9ICwdDqTvg7PRG9CCCOJQS5nts2osPioZCKqgnGwKYdk8bZCrw1SQr1c/3mZ/KyX/Vp
         R+EKHA86HVb/xgLyPloFqXs0w85WnGeEgKbG83PKbR9QkzRuF3nsj+U2NUp0jtD3yb+A
         a6+2Dt1FuqN3xtK/xEa/A/ZiipHOaMLsT1vbf2dwzJ7+CYEMtQuFSCY3MIzemF3qsWjx
         0NFDVpOmKzkqMaeUh/9akWq4MgPQZdz0NDV/67as3UEdq1sU+h9JINNYRNN8/Ie2eJTQ
         y0fg==
X-Gm-Message-State: AOJu0YzuQFTbmu/oC+HuFYqzGGnklwC9+5gRGz0xrTRepBcCcsHDZZYX
	GHpjsep9+r91IleeGh86SnJLxez7Isn0P6aPKVRyzmb/l/TpAs9Drr58Sscv9L8=
X-Google-Smtp-Source: AGHT+IEV3CCALGxg1n6GpD07zE47h29gJ/oYpBfSqhV831Pj4Hs51H7xJtLjez+Zby19gXdTsc4jOQ==
X-Received: by 2002:a05:6000:180e:b0:34d:b1c2:65ea with SMTP id ffacd0b85a97d-3504a9689e9mr9656408f8f.54.1715706245266;
        Tue, 14 May 2024 10:04:05 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8969f0sm14216276f8f.28.2024.05.14.10.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 10:04:05 -0700 (PDT)
Message-ID: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Date: Tue, 14 May 2024 19:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] arm64: dts: qcom: msm8998: enable adreno_smmu
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Right now, GPU init fails:

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

adreno_smmu is required, so it must be enabled.

[    3.220381] msm_dpu c901000.display-controller: bound 5000000.gpu (ops a3xx_ops)
[    3.235503] [drm:dpu_kms_hw_init:1053] dpu hardware revision:0x30000000

Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
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



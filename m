Return-Path: <linux-arm-msm+bounces-27283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1F93FB87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 18:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B59D2826E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 16:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6772016F265;
	Mon, 29 Jul 2024 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="MvsN0qwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3E16F27D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722271228; cv=none; b=Pyv2dWGn/qjhbG491J/GqtHpBq1Mt1RS1f3JxKZGszmcuKpz6b+ci3xKr9Rbm+7NbA/HnfJ32yYjlmWQAWeAnO+UZCDul+r67nTxHCkeNgH7itmjS+ZPlyu6x2EC6fTHGu9rRbbwlAAJ8qXNvW5XFZiD/hhwvsi/g0uiR+txIpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722271228; c=relaxed/simple;
	bh=vh2e8htsdmGHxvRnF2xyVo6oZJcZgVMk9kgH8YrD2v8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pzZuHqEi5XZqRfl2l8EM7idL87WeNPTBrFEP5F3a45oKdMSm6uvmaMwmDoxJxHui9bJotY7InblsB9VyGSqVT+CjECuTnzd4/wyrM2O0+S5bR2lmpNpPGimjllVoVDU/zEPjHG7eLGIzz7BLjbn8C03PUR2HuBME+Odtx68Rh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=MvsN0qwQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428178fc07eso16008675e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1722271224; x=1722876024; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQQKcyxF1X9jveC68u0xnin1As9gpCwnwn8cZt60uhA=;
        b=MvsN0qwQH5Z9uXnkLKarvZLLLxpBpv/7uTs/0ISrwspKWpWrx5L8gxY8GL7lnKT3GU
         lsZBAPlrqOQ8CJNNS/ah7qCzdpFm18m/E16VDJkNAmdlX+k9sNIgodEi5SlEoGTN/76L
         jv1dNR4Ymxex9Rl50gTlPdPSbpunuUsIXf5JqzUQkMxe6OWl5zX9SslKBAPpHwQL0k2c
         XR/eMgq+vtoJZSgdsvbpdjbvynC17vOHL8whNj73fu3TZbnY7GoWQ9iStkq6oX407Ue7
         uf+PVmBkhZv5GKiFLQJnNWGvTK+nHc2uxNnuwUhZR4kj7bj7DbQk7sroruc5GISF9p1I
         kYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722271224; x=1722876024;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQQKcyxF1X9jveC68u0xnin1As9gpCwnwn8cZt60uhA=;
        b=eCEwps21xe+zWP3Ieqri8kz1Lj70OAwZwSTbdeU6rFXeV+CccpD2i9G5s3WP5oxby0
         zMWMpXwmBJcRFJ3CH3r3kdF9+aUzAVq32nc98jzh65y2C6ORkN9WzoHN7bKlbwIKNCW0
         NG3VZ/nstswvoxNDEFN5XcSOSXsJEB3U6eqcw8O63/oh5tYpa3HM3sSE6yaZuMcZinaG
         ZJgqQ3FNbDqDWJfP2wyKm4S3bjD4GrhORYiHZlwCxt/2L+KbH79n+3o8/unhRcBq8H4z
         6/BRv5J+rnZVVb+koMHnofNqx6SwLtGIaBqKRwj0WoZTzGftQ0LoacCZ4NMdit0L47s9
         MCvw==
X-Forwarded-Encrypted: i=1; AJvYcCW8vYI00iMUGyRAXKh9uxowZ+p6l31qp/MKd3R6uqMBE8a9z4AXkmOuR6OXfYijctzRHVYf/a6u81Bb2Yk7S26xLNU22NA11zqGBKCDkQ==
X-Gm-Message-State: AOJu0YzKirYHmMSaNQysBvvZaSv+6V1PUYQAVR9x11/I5C78qq702YUc
	fHEmJ3J3pJ77QrfhT2RdqaPg9zZgVgBhUrrDilWta+/Lz70bYB0kK74p2UMgwtk=
X-Google-Smtp-Source: AGHT+IEN1z5oI6smt4nnILLYKtRLiyeR2NR2yztIBF3PBef5FB2NIQiB8yvT+E7XqVTz52MV11XCcQ==
X-Received: by 2002:a05:600c:5106:b0:426:6fd3:1547 with SMTP id 5b1f17b1804b1-42811d73680mr55211005e9.2.1722271223821;
        Mon, 29 Jul 2024 09:40:23 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057a6283sm183074515e9.32.2024.07.29.09.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 09:40:23 -0700 (PDT)
Message-ID: <b3ae8239-4e75-4ff0-b722-dda0b940a5fb@freebox.fr>
Date: Mon, 29 Jul 2024 18:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, MSM <linux-arm-msm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: Firmware / Hypervisor / TZ kills Linux for touching at context bank
 registers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello everyone,

I'm running v6.11-rc1 on qcom msm8998.

I cherry-picked AngeloGioacchino's patch adding lpass_q6_smmu:

		lpass_q6_smmu: iommu@5100000 {
			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
			reg = <0x05100000 0x40000>;
			clocks = <&gcc HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
			clock-names = "iface";

			#global-interrupts = <0>;
			#iommu-cells = <1>;
			interrupts =
				<GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
				<GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;

			power-domains = <&gcc LPASS_ADSP_GDSC>;
			status = "disabled";
		};


System freezes & reboots in the lpass_q6_smmu setup.
(Firmware / Hypervisor / TZ is zapping Linux for daring
to touch to reserved registers)

Specifically:

1) In arm_smmu_device_reset(), 

		dev_warn(smmu->dev, "YO %s:%d ctxbank=%d GO", __func__, __LINE__, i);
		arm_smmu_write_context_bank(smmu, i);
		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
		dev_warn(smmu->dev, "YO %s:%d ctxbank=%d OK", __func__, __LINE__, i);

Linux freezes in arm_smmu_write_context_bank(smmu, 12);

(FW reserves context bank #12 for itself, probably)


2) thus this fails as well:


		qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
		dev_warn(smmu->dev, "YO %s:%d ctxbank=%u GO", __func__, __LINE__, qsmmu->bypass_cbndx);
		arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
		dev_warn(smmu->dev, "YO %s:%d ctxbank=%u OK", __func__, __LINE__, qsmmu->bypass_cbndx);


Linux freezes in arm_smmu_cb_write(smmu, 12, ARM_SMMU_CB_SCTLR, 0);

12 is chosen since it's the last context bank, but assumption
that it will be free is false.


AngeloGioacchino has several patches to deal with this situation,
but I wanted to know what would be an acceptable solution?

AngeloGioacchino's solution consists in
optionally specifying in DTS which context bank to use,
and a list of context banks to not reset.

In my specific case, we just need to avoid using CB 12,
because it is reserved by the FW under Linux.

What do you think?

Regards


Return-Path: <linux-arm-msm+bounces-33569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D1199508E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 15:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67C301F24A56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768D91DF27A;
	Tue,  8 Oct 2024 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="OwQNCci7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC58B13959D
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395214; cv=none; b=L1c+n79qH2ifVnvI7O/h2qla8Cfm6EkvAV/+XWk6UPk3OAThWHD91O1hAxSI826KL4E75wS7en85sgBd45Ij1rwQEC1w5uQBQBmV1im0cUkir/2MpnaU0sjrQS08XWSTsWcnfRSsAX5KMD9clJIqZyOkI4zGhgzW2UjIEj2mh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395214; c=relaxed/simple;
	bh=gYyTwuFOPveTqzCPR+7oXosorQ301hAsytc6qm+lLG0=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=H21qTZlliBGCLC+O61V+OdK7V8j6WelVWIiM7ndoTjhGv1MSg7HSLDNbXuIcaHdpKc5Oi8A7bqcl1+7tir15w/LifAdrocxbAaqcWVU6z523CXDeP/o3gsZxBDsWiNkqaOxJCTR6xNukS5LFMceFHFumDO9tKs2MAxlLOccDHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=OwQNCci7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ccfada422so3403723f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728395209; x=1729000009; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNj+ypVkSyt7jiM/LioLTKbsA3AEP1m549CviHpF7I8=;
        b=OwQNCci7LQXI1bZIXbfG+kTR5j5ejioqttzj5Jf5gqXhOHclcn+9rIpfpdOIJj1aCE
         CPdtGfkeOjlknn9IwvwMBK3PKlIP4zwKiGH6tOFCbycgmKDCEBh+2nZpeD7jvk3HDn79
         i9BPsa0TuXQbNlXhJAB0WmE2GF1mafuH5yyTCh5vR7rY7KgpNT40mr+7IapvF2HtAUmf
         SCqxvE8CBW2Pk8M7AWIbGIfzCnSvWRb6OhDKbKFQBUvv2wkXUjt0v43SG2CLzK0rPbQx
         bOVdOdZ5JIy/Df6Wa5z/y7lV/DGRGwmN27MmjFg8GT/sDaXNc9WzCs/V5++85HJUUkuw
         0a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728395209; x=1729000009;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aNj+ypVkSyt7jiM/LioLTKbsA3AEP1m549CviHpF7I8=;
        b=Z/gSc0e6uYyw17Cp/f2ipqpTVhKpi8u9Gn2Te5KTPRUXewLLQblZtpKbn9/0HdOEYf
         VhW9bwHhrnVZ2mISkTEr+I8bpAQwik9e3QOGZRy/TrqJ98ZTq1gUOBnrWaERBEvtJwK5
         j2+rrZkfjiM5AaJR1Ww/HCvTi73xzOb8xHJuVdj8Lw1vxDmm5N2ytKNpESO7r+rc/zbp
         IFIIw0bsDTNXJKwuaPoS3b/tTEKleNJ3TfzkWzp0Pt4yvLaFmiuENQPFyTSi9CL/eInt
         fQkY3dW1ao+CInytmVXRD+wddbHMDPd0STYEA8onFHYJS+a8peA4s5eWATKuPgruqBgs
         PUgg==
X-Gm-Message-State: AOJu0YxZSqyCtJGJ0USFeKcpaMhIFop20aHCA3kvRRSl1EqhW4rhXkQB
	K6ezWBakOSCyV3a806wK8BRU6pJzCisRm6hbzTa9byrZW1pDNBlqZw41AYBSCjYHrMm9KBcVm8A
	B
X-Google-Smtp-Source: AGHT+IFXJAO33Zj+DFr58UK5lgT5fq7UQv5ImBMcovO6Aa2xa7XVbHv5N0QdLGDIabHiqIscJAIj5A==
X-Received: by 2002:adf:e546:0:b0:37c:d2f3:b3af with SMTP id ffacd0b85a97d-37d0e6d31e2mr9564900f8f.5.1728395208700;
        Tue, 08 Oct 2024 06:46:48 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16970520sm8201247f8f.96.2024.10.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:46:48 -0700 (PDT)
Message-ID: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
Date: Tue, 8 Oct 2024 15:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MSM <linux-arm-msm@vger.kernel.org>, alsa-devel@alsa-project.org
From: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Working on audio for qcom apq8098 / msm8998
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello everyone,

I've been trying to get audio working on a qcom apq8098 (cousin of msm8998) board.

Code is mostly based on work from here:
https://gitlab.com/msm8998-mainline/linux

This is the diff I have on top of v6.12-rc1
https://paste.debian.net/1331666/

Kernel log after init starts:

[   13.311201] random: crng init done
[   14.724797] atl1c 0000:01:00.0 enp1s0: renamed from eth0 (while UP)
[   14.895978] Detected VIPT I-cache on CPU1
[   14.896041] GICv3: CPU1: found redistributor 1 region 0:0x0000000017b20000
[   14.896113] CPU1: Booted secondary processor 0x0000000001 [0x51af8014]
[   14.949128] Detected VIPT I-cache on CPU2
[   14.949198] GICv3: CPU2: found redistributor 2 region 0:0x0000000017b40000
[   14.949272] CPU2: Booted secondary processor 0x0000000002 [0x51af8014]
[   15.025271] Detected VIPT I-cache on CPU3
[   15.025349] GICv3: CPU3: found redistributor 3 region 0:0x0000000017b60000
[   15.025423] CPU3: Booted secondary processor 0x0000000003 [0x51af8014]
[   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
[   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
[   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
[   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
[   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
[   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
[   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
[   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
[   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
[   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
[   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
[   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
[   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
[   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
[   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
[   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
[   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
[   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
[   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
[   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
[   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
[   17.727724] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
[   17.727923] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2
[   17.736928] ath10k_snoc 18800000.wifi: qmi not waiting for msa_ready indicator
[   17.903361] platform a800000.usb: deferred probe pending: dwc3: failed to initialize core
[   21.512409] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
[   21.512619] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
[   21.522450] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
[   21.599761] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   21.599935] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[   21.608221] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 3ec1ac4b
[   21.657531] ath10k_snoc 18800000.wifi: htt-ver 3.44 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   21.713363] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
[   21.713577] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
[   21.723404] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
[   21.732374] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
[   21.737662] ath: EEPROM regdomain: 0x0
[   21.744356] ath: EEPROM indicates default country code should be used
[   21.748148] ath: doing EEPROM country->regdmn map search
[   21.754648] ath: country maps to regdmn code: 0x3a
[   21.759986] ath: Country alpha2 being used: US
[   21.764605] ath: Regpair used: 0x3a


Does anyone see something obvious I might have missed?

Regards


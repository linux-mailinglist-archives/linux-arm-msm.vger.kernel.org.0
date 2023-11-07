Return-Path: <linux-arm-msm+bounces-121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8AB7E4B21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18AA21F217DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3612F84F;
	Tue,  7 Nov 2023 21:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+wMWFOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264A2F84D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:49:42 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F4810DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:49:41 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507adc3381cso8000289e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699393780; x=1699998580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8pS5hKQg/5kecpRqyqfokh7EbTkTJHg2rMuKk5mt8E=;
        b=Y+wMWFOxnMlCZLmvNkW2QiwixXP5MnXMs09ZmMeCLQN+w8HsxvAj6D4f0BY/xb+3F8
         kH12YAHaY0mUrrdb4bRHfMfVCN04xkuaCNY9bRZy6gL0BidVMVTWJFN0OfaQkN31fDuj
         Okae00RyqUG6wwC15EHhD9Atjjyjl7LZjjj3VqIk7YQ6VXFnOnAhdRwXoVVQNGCoYOX9
         XdFVf4Dt4nVtwr0pKKncJD+y7WFCmb5zc1cADlloFiORuJdk0G8VFk4Zqh1Exs58YoMy
         sr2jTujU7rMBisK1PA9FS0GGvp3RgjAXWoE2YXQnI9lbp7D1XNjzqGAik80ShnTEnNox
         tCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393780; x=1699998580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8pS5hKQg/5kecpRqyqfokh7EbTkTJHg2rMuKk5mt8E=;
        b=vv9paOqG5E6Rg8Zq/SccWRXnVeoY4YRPqpYxdtWjjIIKagpmnVoRJbouPySQC0I4kn
         kvBq54TAh8tiUoD/KLc5C0NqHaBw2QmTA6QbcNfTFei4DkrzSFUesIeyxg2pmIrIuWue
         H8pElsdI65fw1Nb74kNcnLA0/qp6RP6URu772omtLpwnL13phQksT2WkiB0nexcDE/gK
         g8jmMjNLRIWI9Klcsv1caagTPKyCfq4ZHo4Hubs5PvELXwxghxyHfJWtlIB+UKJOsyDS
         ulYpoCuBK1jCCjIar+4Ncs4Lt/xZEeHwHBuv6/E0WRave1ZGYLDJBovG/nlEtA8zfuOm
         nUlQ==
X-Gm-Message-State: AOJu0Yzb9tVSBg6cXVVeQ+AHJivixMgYdT5uQJzpbS4R3WVJCt9vXofA
	kMq74molf6nQWrY6jgUesxYopA==
X-Google-Smtp-Source: AGHT+IHBcXLrIKyFvL28v853iNGL7oXQjFrCew2fC6rIhb9bRHNIbRFWzSc/QngXxfRrJhDnBPuiyw==
X-Received: by 2002:a19:4f42:0:b0:507:a40e:d8bf with SMTP id a2-20020a194f42000000b00507a40ed8bfmr26037135lfk.7.1699393779771;
        Tue, 07 Nov 2023 13:49:39 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i27-20020a0565123e1b00b00507d219596dsm465396lfv.268.2023.11.07.13.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:49:39 -0800 (PST)
Message-ID: <ccfacf11-20c5-48f9-a5fd-6c2391786741@linaro.org>
Date: Tue, 7 Nov 2023 22:49:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: add wifi variant property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
References: <20231105102018.1546057-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231105102018.1546057-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/23 11:19, Dmitry Baryshkov wrote:
> The RB1 platform doesn't have board-specific board-id programmed, it uses
> generic 0xff. Thus add the property with the 'variant' of the
> calibration data.
> 
> Note: the driver will check for the calibration data for the following
> IDs, so existing board-2.bin files will continue to work.
> 
> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1'
> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120'
> - 'bus=snoc,qmi-board-id=ff'
> 
> For the reference, the board is identified by the driver in the
> following way:
> 
> ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
> ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp 2023-01-06 01:50 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
> ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> 
> Fixes: 9692ccc49583 ("arm64: dts: qcom: qrb2210-rb1: Enable remote processors")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Initially this patch was sent before Konrad actually sending the WiFi
> support patchset for the RB1 board. Afterwards we didn't synchronise and
> the calibration variant wasn't squashed into the relevant patchset.
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


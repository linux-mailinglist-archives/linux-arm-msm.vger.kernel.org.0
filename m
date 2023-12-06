Return-Path: <linux-arm-msm+bounces-3543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF1806F97
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D289F1C20858
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38C3358BC;
	Wed,  6 Dec 2023 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtQocJpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D3C112
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:21:58 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be4f03b06so4632869e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865317; x=1702470117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRL0Ao9tIX2xdAb4wLhDX52vA5hRbA+Mw6I9EfOJmcE=;
        b=WtQocJpdLVrigO/G13omNs/Os1g2g1S+iP0JIhiKcl98dJcgxm/HO6bwBvptvChKaN
         m58l0n8So6ECFFZHZqpImoASuE6QWcw5yoJKgiCYx+ThXv8/p0106XvyJXBBTnF6Ribf
         ZwOqrRagbXJ+g0tDZEJ7/j5sWx/ud3+4EjQAo6RR3PCtxGVrIBHPNU+UU1GnJ9MzM52S
         m8RXaAah/jqmMbl2qVSPQsVm7RTB9neanDiT9Eaub8XrFPBujOfAliXsybbdHTl1bqET
         uXgeYlagGO2HDz7g5u3Tb5EtXAhlP0zZaROQxnkOO8bJIw7QPfGpPH17Io8pKSCkm458
         aGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865317; x=1702470117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRL0Ao9tIX2xdAb4wLhDX52vA5hRbA+Mw6I9EfOJmcE=;
        b=bCeG2kY0hZxARmBwneD6bpzrvGuBOjfLcTxHl9Xk9+B4G+RrdDWZO0e88b1bju1IZb
         +YQol0vp3yd5ba3PmeuEP1u89AiHd4NNKPvbQMVM1JnK/98lWWjamwtihN6gYNRXEaI3
         y5194fzvzsHJjpOUW/PQ8oIyWuquAifB1BdEKSRCA4Qbv+h9K/3VQTlolkx4D//XO3e/
         f0BxhuRktV7F7lRv53J/mmfGMEekVlb7/hmmqV8B8Gk7Q9DW8sRJQpTEbz9HvYcAHljj
         4F/t9BKvesSnPL1mRAFLa6IChXFR7ygpHuHnjBf7ePoSX2h8/7lrHuAZ+XadNVV7DcU1
         ilaA==
X-Gm-Message-State: AOJu0YwwItYSH2YruqhopXCt2NnHa2Ui2kvircLgbmgMJsbeGiDJmGHQ
	NGrJ3tZ/yjubVFUhNffJTAD+rA==
X-Google-Smtp-Source: AGHT+IE3pfFZZOuU8lGP2EAKE3UZF/LYWmm4X3XfFPC5NZ1C8IPxZPF5bLg7IqYGOHCvotUcQN99wQ==
X-Received: by 2002:ac2:46d1:0:b0:50b:ffd5:cd32 with SMTP id p17-20020ac246d1000000b0050bffd5cd32mr390466lfo.175.1701865317051;
        Wed, 06 Dec 2023 04:21:57 -0800 (PST)
Received: from [172.30.205.186] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512309300b0050bfc6dbb8asm755053lfd.302.2023.12.06.04.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:21:56 -0800 (PST)
Message-ID: <335ac19a-f341-4ab9-8ff0-6e25add21fd8@linaro.org>
Date: Wed, 6 Dec 2023 13:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: stats: Fix division issue on 32-bit platforms
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>
References: <20231205-qcom_stats-aeabi_uldivmod-fix-v1-1-f94ecec5e894@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205-qcom_stats-aeabi_uldivmod-fix-v1-1-f94ecec5e894@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/6/23 01:44, Bjorn Andersson wrote:
> commit 'e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")' made it
> in with a mult_frac() which causes link errors on Arm and PowerPC
> builds:
> 
>    ERROR: modpost: "__aeabi_uldivmod" [drivers/soc/qcom/qcom_stats.ko] undefined!
> 
> Expand the mult_frac() to avoid this problem.
> 
> Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Thanks, I keep believeing mult_frac is generic enough to work
on something else than arm64..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


Return-Path: <linux-arm-msm+bounces-726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8927EC8CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29A92814CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438382E63A;
	Wed, 15 Nov 2023 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tC5cek2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C22FC32
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:43:46 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F91A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:43:45 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso9918581e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700066624; x=1700671424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKwvuedBc9zWWjZXrz7fOSDDi6eG4P0hcIfiBzhjapM=;
        b=tC5cek2YDqCTVA7H4+MDJUh1ywgVPMs3NPLSrIaoxCKKM8XmfIHv/kbMhGLziNjPQn
         86BHDyC9NqzN6sBnV3Bz2Jj+wgbkD6suOxeaq1qETrcK0ZoX+TgsrRk0yJfCrPzBfsWx
         Ek3ZnPqPFhhfKMQ3wF/IE8XRqi1n6rkPQ6mTDtMf7it+5eFp//1ncEOUwpylyBfuv1W/
         XPr4AoeFZNWwP8H3J4BOw4gZ1seDYp+89DBlrpV2oTLb+mqa1GoAN4sZBFyyiJ7fN1F8
         T3w8CkQ44j5xG9xNNpny3DDx4v3+rYx99v2nes+Hq5Gjb8ZZcgGyUZ81Q4txyvUGRM/j
         l+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700066624; x=1700671424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKwvuedBc9zWWjZXrz7fOSDDi6eG4P0hcIfiBzhjapM=;
        b=a+O5DRVMR3GV+3n1aiFTbTapXsabu9YqBtwV5vCc2o10BSDLDXWNZhUgPus596b+xJ
         HM+fpECnZRgmBH+BrHBA+iq0W7X4tNZCD2EKp0IyIwzJXbA9wXGDJj9KgCiD2B3yJ4at
         wOQrWudixRAaZeyrIgVpINqxQzviI3d2P41fHoi4Sb8tQVhQgE8crIm9MgIRo292R1bX
         MeFUbnyk2maGjtk/3wbCmzaGRXjmWKaZ56VkhJky+FKuegVPvKEG6pb5X53Dkup/JK2J
         rDzy0o5p91CpC89ATCSZHt7b9+RCCMc3KfobfhW1SN7jX+/FADWvP1Ywh5JVsUpXwEZL
         N7fg==
X-Gm-Message-State: AOJu0YzL+/7VCYZGloz8T07pe6+V2ojrf8DQJpgNpxsxTaz+LvySjSWI
	TaqqbHQ4HwP1CqiANWeDoWfgvg==
X-Google-Smtp-Source: AGHT+IEyO+JuxqtD22IlDEHQfvtuGmYUZnlYNdcdmZAwd7aiUoKMqvknqimL7DYcdHAQ0SP/2ilgmQ==
X-Received: by 2002:a05:6512:3f1a:b0:508:266a:e85f with SMTP id y26-20020a0565123f1a00b00508266ae85fmr9820326lfa.1.1700066623747;
        Wed, 15 Nov 2023 08:43:43 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d27-20020a19385b000000b0050a026d3a26sm1705739lfj.227.2023.11.15.08.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:43:43 -0800 (PST)
Message-ID: <e5b0d8c7-82cf-4a3a-9a6e-28e7b468df8d@linaro.org>
Date: Wed, 15 Nov 2023 17:43:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, dmitry.baryshkov@linaro.org,
 a39.skl@gmail.com, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 qipl.kernel.upstream@quicinc.com
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-4-quic_bibekkum@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231114135654.30475-4-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/14/23 14:56, Bibek Kumar Patro wrote:
> Context caching is re-enabled in the prefetch buffer for Qualcomm SoCs
> through SoC specific reset ops, which is disabled in the default MMU-500
> reset ops, but is expected for context banks using ACTLR register to
> retain the prefetch value during reset and runtime suspend.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
And I assume that goes for all SMMU500 implementations?

Looking at the 8550 ACTRL array from patch 2, CPRE is not enabled
at all times.. Is that because of performance, or some other
technical reason?

Will this regress platforms without ACTRL tables?

Konrad


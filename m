Return-Path: <linux-arm-msm+bounces-1534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 046037F4C11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 17:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3721A1C208F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8289F2137E;
	Wed, 22 Nov 2023 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tc5/2/Fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE23D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:13:42 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507cd62472dso1101251e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700669621; x=1701274421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63C0tA6VUDFssxzahNxzAEpcgZHhsFJpENPr7LEnrCo=;
        b=tc5/2/Fa1CxUxRNyR85sbPivvg2Jkdl4AAqKLy38JG61xtJQQRaYDi8/0E4mrpOMhl
         wmLeYSWnuTJ0kp51RYwucU8jn2ZeJIXcV+khFJzG2tLO5qMfrjbqS3C1ynYGSXFwo+P/
         Yw58mhu3a6vl/6gUO5ZkeLiKaYI2rYZ8LK3T4GRI5mM1AE0tO3RFWmT8tkjDRt2HZ4RG
         6mdAm8lSZLVvev49jMtDPl4Ld2BSleXSq95rFfV+xnCkmH00FynnVhKHD61dxK3aT39m
         CLvqkqWe85wP+Yb5qXFO1PQRErlfbQUgIVzDriOMhWVW6fNlQZGukSQYBa+OWUxVEcze
         G+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669621; x=1701274421;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63C0tA6VUDFssxzahNxzAEpcgZHhsFJpENPr7LEnrCo=;
        b=wLbcNWuOdSPXN7m9jYqAtj7D/Bv0czZFZd481mem9mDWHe/TMouRyDmaKfvxRCbt5N
         olzNcw6Jfw0caJNSqoQlMusOk1dhpQbBZ2LDfZiW3jx8/2PeQl+/lnzwLQn3Rv1u30Bt
         W6q4pQ8fZcdwksRCZ0FDWhUqRDpxYSFWFX4UvIRs/AS1l/i9YjbOtcZXmTmdo56qDHI3
         k7tT8HCgbV2KLHfLqk0q0uPHMnmPoRhzoFtskPAVISAk/mpi+LqhVQPpbSaHtrFYx530
         02UYSiwvfpKH6TycgsE6wAyZJ52h6rd/2z8jNUGdMfwD/Vb2CquW9qZC4HkNqZkm1foJ
         Xa4g==
X-Gm-Message-State: AOJu0YyX0JmazHfQ74i7sBQgT0fNcjImwtTSdV8dlbKBEh4yF1/Afvi4
	ox8QRE6IDa29urkaBw5mtuw0Bg==
X-Google-Smtp-Source: AGHT+IFA7F5yavPPFK+duxLNncV9DIMf4kjfUVwLpHh37aK0OUYwnOVPaDl2Xm2PA8R9dLlFKPv65w==
X-Received: by 2002:a05:6512:1243:b0:500:d96e:f6eb with SMTP id fb3-20020a056512124300b00500d96ef6ebmr2584849lfb.19.1700669620818;
        Wed, 22 Nov 2023 08:13:40 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id br20-20020a056512401400b0050aaa64cd0dsm1297322lfb.13.2023.11.22.08.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:13:40 -0800 (PST)
Message-ID: <a255f8b0-2f1a-4f0a-8eaf-28bde7616929@linaro.org>
Date: Wed, 22 Nov 2023 17:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: deconfig: enable Qualcomm SM8650 SoC drivers
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231121-topic-sm8650-upstream-defconfig-v1-1-2500565fc21b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121-topic-sm8650-upstream-defconfig-v1-1-2500565fc21b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 10:51, Neil Armstrong wrote:
> Enable Clocks, Pinctrl and Interconnect drivers in the ARM64
> defconfig for the Qualcomm SM8650 SoC to boot the SM8650 MTP
> (Mobile Test Platform) and QRD (Qualcomm Reference Device) boards.
> 
> TCSRCC, GCC, Interconnect, and Pinctrl config are marked as builtin and
> not modules due to boot dependencies.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> For convenience, a regularly refreshed linux-next based git tree containing
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


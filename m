Return-Path: <linux-arm-msm+bounces-3544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA25F806F9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278961C20831
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E0B3589D;
	Wed,  6 Dec 2023 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggWffWZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A73998
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:23:27 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so3654593e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865405; x=1702470205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DzoPfWTSCdQs7IBgaNCNhvytcrfnmBWz8SmUAIpH50=;
        b=ggWffWZZE8syarCQnPoiLlt+LrdjL73MRmMimlOv0gfzxcfnHaPNTGVUqWTKlLhqkl
         VTOirlZ3uf8vDkiMiIBoe9QHCs1WrBH+8653noE6NHcmoPdQExaMHp2i2ohn6UkhFxCu
         pG+tIqmhkwU3FU7PNBMG3OC2bwwfLlEjE3SY76OgrRreYZYnmvAbaXuJC+jjWDMp5wV9
         NLVhl4p1ZDRN9GskyKCVjBV+4iZPq3hU8C5ZNY8YJv+A4PkNeQaAJzj9gS+0KCOUAQei
         1NXTvYDmpcmdOumS4oVz6TepYoFpYdEIAlY53Bfct36VzurKVYqKwxC4AOjcqBJ+DFPW
         fsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865405; x=1702470205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DzoPfWTSCdQs7IBgaNCNhvytcrfnmBWz8SmUAIpH50=;
        b=aEWEi1RSWpMdluhAtdzED/XnpntcSLqB9I6TDO7LXvqJeQXDdyAbJr7W+7KAsu4UXL
         BurGhtSkQelwHzQfeYVcw9piqPfFPSTxI5vKPD6UNVd5EffoiZzoSgBKhrnBEI5XkdzA
         Dqhz4ZF4RA/DWPn79/aiQjkn/7TLR6ZfcEBsKpHYtUnCqUQCOoYsCVWNWBUuCws8s4zm
         l/13WIGsLJnfjn+3ourz0V81GgxqPg9QPZagPjhk492A2wI6P3h79gwGY3tc5FWRXbvh
         fkX8pDC+bW/yKmXMyu62xL1YchO3qtvUsu9FbSXym4nDTtEwI9k03ZbKqBo6J2EnGAiI
         2ZLQ==
X-Gm-Message-State: AOJu0Ywt7cYCvER98iPqM8m6I/Ut0V/Jefsgt59+YUXpmrwwGbA6nriY
	V0HJuff05Fj8y/WOdaqTctf5HQ==
X-Google-Smtp-Source: AGHT+IEHcut6JD7Iz6Iiz3DWN0UgHPNJrxzg3ZHmF7UW6BWBbcPknaYhXwQQ+JjJMy0hNTFAHMQ9Ig==
X-Received: by 2002:a05:6512:3986:b0:50c:bbb:e3ce with SMTP id j6-20020a056512398600b0050c0bbbe3cemr614570lfu.112.1701865405360;
        Wed, 06 Dec 2023 04:23:25 -0800 (PST)
Received: from [172.30.205.186] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512309300b0050bfc6dbb8asm755053lfd.302.2023.12.06.04.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:23:25 -0800 (PST)
Message-ID: <e8fdf6ca-488a-4ccf-99d9-ffa753d35067@linaro.org>
Date: Wed, 6 Dec 2023 13:23:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: stats: Express AOSS QMP module dependency
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/6/23 05:38, Bjorn Andersson wrote:
> In the case that the Qualcomm Sleep stats driver is builtin and the AOSS
> QMP driver is built as a module, neither the implementation nor the stub
> functions are available during linking, resulting in the following
> errors:
> 
>    qcom_stats.c:(.text+0x33c): undefined reference to `qmp_send'
>    qcom_stats.c:(.text+0x8a0): undefined reference to `qmp_get'
> 
> Resolve this by expressing the dependency between the two modules.
> 
> Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/linux-arm-msm/202312061258.nAVYPFq2-lkp@intel.com/
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


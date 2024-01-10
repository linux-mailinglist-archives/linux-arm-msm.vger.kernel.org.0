Return-Path: <linux-arm-msm+bounces-6885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2528298B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485B91F29AD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013CA48785;
	Wed, 10 Jan 2024 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvE7HvGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D047796
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd0db24e03so44849491fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704885482; x=1705490282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcNCnaauzUsUbaXyAc5ChLkL0thXS3/4//R1zfX9xcQ=;
        b=RvE7HvGvRQgaAO6dJF0C9MGgj4pJCTAdkx4AUYJYyw7AvAwxLBuh/DyUa0784x2SUk
         uxJQf5GEOrqxXRUREzyyuYRKSKlovoRzEcsAjiV1j26YbFaN5L8+BSzFEuVGXI2f6YjB
         YkA16naAgsQ7lFJ/jZRBWMaOxZHns8em7qsZ9EWYYO6gQ6Pvk2lXk+ycLHM9x0So9Siv
         F8BtxUhbVYySjsI03MgTFxCr0lv/eMqRFNEYhr/9I+kBFe5Fmm9c7j9MStQVq9nNAteU
         zpJ983pZBmXnfa5bOEc97LZ1DqVp1QflUWkJEAWcHZJz+rChU8ayFKlcMgt3G7flRhQP
         gPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885482; x=1705490282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcNCnaauzUsUbaXyAc5ChLkL0thXS3/4//R1zfX9xcQ=;
        b=qTl84uybRq5C1OrbUouV+xN1M3VTUnfBilzVuFTyA6kgGyuaFgTfYAOQ2RRg2HuO3M
         dSB07sNm206Yv2cdZeJaX4jtpr/QSaTO01157mXfkfevnQltaok/J3NIYX5RRUh4YZA5
         7PwH1J5Ug2SdTbdmRILDkEmMFzdI7zBCXkpW8ddCtH1DjsbMWJsawDt2U4+BDDTTQskc
         I09F1YEqZNorBNUY7jbBLwB0fDkqSxUr7J1T2Xs1HrR7kr4ME6KvnzZKlssjR7o0V/4P
         X6blokCqoIIF8lup3eoo1D4XLpbLIFKPOoSVxnG0b3GgX+ELfQ4JFuoMaRW8fDNQS2u5
         l9tw==
X-Gm-Message-State: AOJu0Yx/hAfZqioRvt9yE8eRYEgh/Ccxcp0YOTHKxpPl6F+c/JQkagQo
	4Pmh7tgy40VVbYR6uJv/hSgQBAN5x8b+Cw==
X-Google-Smtp-Source: AGHT+IEpNDoakfFKO71dz7YDEEON9o6gE2TjcVKZAPyhCEdRacTDIhFfpwOdps3PdWwT1A3jqUaB7g==
X-Received: by 2002:a2e:a0cf:0:b0:2cd:8ef:5c5a with SMTP id f15-20020a2ea0cf000000b002cd08ef5c5amr227117ljm.40.1704885482174;
        Wed, 10 Jan 2024 03:18:02 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 7-20020a2e1547000000b002cd187bb0f1sm766479ljv.49.2024.01.10.03.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:18:01 -0800 (PST)
Message-ID: <e22be6e6-4018-45ef-8be3-ac87bc3c3463@linaro.org>
Date: Wed, 10 Jan 2024 12:17:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] drm/msm/dp: remove PHY handling from
 dp_catalog.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-10-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-10-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> Inline dp_catalog_aux_update_cfg() and call phy_calibrate() from dp_aux
> functions directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

That's some hard-to-digest spaghetti..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


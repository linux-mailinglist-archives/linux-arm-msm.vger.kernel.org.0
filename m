Return-Path: <linux-arm-msm+bounces-6887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108088298B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2271287F9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98B348CC5;
	Wed, 10 Jan 2024 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OytbAi7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4148CC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so45727171fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704885530; x=1705490330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcO4gBJx3e4McdaiZldwo9dIP2JA04PiyxdJMpCdUtw=;
        b=OytbAi7c+BQrVXGCVz4BLcgFnBz8AxEkpwJHN6imvo/Wwg5PrPCbu27helkslq8Gmq
         IDqfe9GeZT4Cmx5WGuIYMzE6Ixw0nlpl71+ubJw436dlwmrNqtY0G67dSyzg3GOnYpc+
         TLwtG2u7Z2LEQIc9Fxc0vETKS6oEgwerg1d5WJBvIYRG7yXMpDFK/kOxToDJ0qFsMnNP
         l4ksvX6rZVEUfHkIYqikyMNAoh6ofSGj6ec5PCJn1f4KIvaj7IOOGMDUy/4tA0LOWthh
         /9lQShmf3MRow5q58N+TF2FnkPbWETQKB/CZmT2xXj8bSVwHKyT5DDce9jkQJLMys7Fw
         0Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885530; x=1705490330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcO4gBJx3e4McdaiZldwo9dIP2JA04PiyxdJMpCdUtw=;
        b=B5hc+dgFP4Jivcy2qqTH5UK7pnaHr4cE4rkeWlsTpS4ZvwCT7/eFri5L38CdYnCcTm
         +L7XUCnJ9a/1Yhyuhg5bzDu8S8mesCsMbo6JiOWVixjLfpQ6r5hwkJRfXc/mR2fxCMxK
         pIwE9yJ0+jNbigCZODfq44ytW7cwWMhHN9Zqeq/g+JWmSoK+jWsn4U0bzi6calRJe+ET
         1yyFXD7Vt3n4Qfcl+cDvPVm3DoN+hqTSiRbaO8f2HjBNEwaw88aIMI/WFGRUxUUQk/pz
         Ggfn/3yg9rLhnPrjl7uNpN/RsX/CQYoIWjWda3CdrJBRzeP/ZsQx8ctUc1C7FkFVeO0U
         3WAg==
X-Gm-Message-State: AOJu0YwRDIk2juAwQ5wlIm/eZDDjj9eIBxVjjRVTQslrj2CoKge0vXjk
	0JLdO3MxELNByhgpl79FIaJp4R7q8y/SYA==
X-Google-Smtp-Source: AGHT+IF0Y6kRaVPDQ0DXIz+A4fR/pm37V9HFdU0rCQ+T1M4iMdg6sPbZ7rGbhSzx6E9jb26UYIMHqQ==
X-Received: by 2002:a2e:be0c:0:b0:2cd:2838:78a with SMTP id z12-20020a2ebe0c000000b002cd2838078amr563012ljq.88.1704885530069;
        Wed, 10 Jan 2024 03:18:50 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 7-20020a2e1547000000b002cd187bb0f1sm766479ljv.49.2024.01.10.03.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:18:49 -0800 (PST)
Message-ID: <5a851f9c-a228-4720-9e21-21dcad5c8a0a@linaro.org>
Date: Wed, 10 Jan 2024 12:18:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] drm/msm/dp: handle PHY directly in dp_ctrl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-11-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-11-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> There is little point in going trough dp_parser->io indirection each
> time the driver needs to access the PHY. Store the pointer directly in
> dp_ctrl_private.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


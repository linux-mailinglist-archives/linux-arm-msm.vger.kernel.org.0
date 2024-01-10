Return-Path: <linux-arm-msm+bounces-6879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 367EA829886
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5B3285F06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9D941746;
	Wed, 10 Jan 2024 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hO3867RC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486647764
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cd7e429429so3457441fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704885392; x=1705490192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvNu0hS2gtTrfUSQddmhew5sv0RLzAxZIW7xh6bWghI=;
        b=hO3867RCgPID+rOWY9iji44aecVCGeItZrlErH96BuoxLqxTA4Hp9pabsfR9JWzJ9l
         56/0yy0mBHWijgs9KwsQh2qhUeKmQIGy/Q/xMcZbE3VbQsmwRgNz5uaFBxnFEIRkS9vc
         vcuGrTUnRQ6ru3pHxrxi8nQsTsi6aR/kMv2VlrZRIzNpLtZ12VpaseaZGn1MeLbqSRme
         oEg8wEoZMVOc9kK+acyhHer4STNCED7cyY08PvXs/+TO653uU/Uch4shPX8WVzBaHXkH
         TSZkbpCObAU+kaGolxM3W+WDcyHhW23aSM1ThE+AxvBCPqqI+vdJtOHw2S8ZmYWUiS0u
         cXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885392; x=1705490192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvNu0hS2gtTrfUSQddmhew5sv0RLzAxZIW7xh6bWghI=;
        b=hIP90Wcm1OUiQTF1qMBf0CHeYuKK8zboJ5En4GdNm9+U7jjAyj0DUQK+cZDk9NE3S4
         aoGwrJl/UVaUva20HWCyKnrjwknQrotmCgIJ5IkbDGccZ2IL+H+YIsac6UN9uczvK0a7
         3KBEJybO6A/Mx3TF4FouAubn611057neMuMfQuoc60GtDCNGBLvFikEU1ssMy/4MnERb
         2K7CaDllWwTDQryvnOSEz9K/4qg+vG+rwq8oAcBNQJHb6RLDlTaYCsgLJJsjBdm+DgK9
         0yiJr8Wo9RZJqQ4nrxK3vilrZMsidtd/a5FBoG2aov0Xak4QD1RJjefLKVwvcI+8Wx2u
         KdUA==
X-Gm-Message-State: AOJu0YxiKVfnsxneBKchcoEl8jQy+O7NB7c9tHyv4HqnDPkDR24aO1nL
	/asqL8urFan+hZur3db7BA8agRhEu/oLeQ==
X-Google-Smtp-Source: AGHT+IGhgUfZ43c/+WfGHdbLhaKwjKuq51//bDK18QsXvhYG7HJGBLp8/XCMO+4qjzFpQ/vjsFQQ4w==
X-Received: by 2002:a2e:9dd9:0:b0:2ca:30f5:7e02 with SMTP id x25-20020a2e9dd9000000b002ca30f57e02mr495554ljj.78.1704885392183;
        Wed, 10 Jan 2024 03:16:32 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 7-20020a2e1547000000b002cd187bb0f1sm766479ljv.49.2024.01.10.03.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:16:31 -0800 (PST)
Message-ID: <7904dd33-6b6e-45af-b1bd-9d14301dba33@linaro.org>
Date: Wed, 10 Jan 2024 12:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] drm/msm/dp: move phy_configure_opts to dp_ctrl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-9-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-9-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> There is little point in sharing phy configuration structure between
> several modules. Move it to dp_ctrl, which becomes the only submodule
> re-configuring the PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


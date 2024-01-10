Return-Path: <linux-arm-msm+bounces-6898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05B829901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832391F20F73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F42E47A4F;
	Wed, 10 Jan 2024 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5cCa0sQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13B347A48
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eab4bf47aso3593350e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704886032; x=1705490832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8fqLJGB4BORM/e+032bZk6rSSH31yu0kVoWo4ILNqA=;
        b=b5cCa0sQK0C+7YY+b7FBsOy5eaPoMxa2uiZsKcDVMy6PAhK0TINkZMYpVC/ZQRJtit
         kTcmIxpWzH3UCY6Lz+cbT/AejHTXh5UcN9BhOpnr68jEEepKp7WZ7RsKqhUU1nXb0Ah8
         9HtBVoU+9cMV9HcqWQIB8hfv3aqzVRwgm0ItYtjnv/ZIPwj+kCL4qYynZKLqIMMBTwm4
         zAsLYdzfInrqlNQ1WxVx8JvGOSaxidmRZHXCL21XrGvQxMQr5LTDuAyLAJQ2PdcH3bEZ
         Wj28jPnX+M+biBeh/RuzP7Lr8AcOr2JicFB4NTQ+sdqmaHeud9HCjAZMBNxmX9WkQCdG
         aCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704886032; x=1705490832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8fqLJGB4BORM/e+032bZk6rSSH31yu0kVoWo4ILNqA=;
        b=nsNljuxUL93/+BO27QWw7SakERs70Mka7/n7JIOUbY4VMJo3WThG5mtHxbe90QJhab
         CThi5Gxdtl8ygfAV7WHz1oYGRy04+S1mr/PXkDHmYONevhvbuVRXYpSoy0yp0AQx3RGZ
         6fL/1rHgE6+/YgwnqoowyTz2RLmLXK2Gn+vcMp3c1i74KDVzDyu63j9OQT0b9Oq4nWD4
         Y878n9uZXvwYaV4aK6qpAYERfqrRBtQv3CxFxEANNgWEsXbYzJ69kDAd//EpNJSBeULZ
         3JgO3S/ZUk+uWaMuZ/7A0wQZcYtIEGJaCknHXgZX8ikieoQ/2BQ0ZM3OJNEIbxgk8IsD
         qdFA==
X-Gm-Message-State: AOJu0YxaE1v4B2l+E1NU3E05z1IKga+DStmrnYX6e9aHA2FoOFeUxI4z
	HqCX2gGNC/FqVXNSZp0C3eaYIAJKmA1nVxEw110qU7MyB8d6+w==
X-Google-Smtp-Source: AGHT+IFMzQJGktOuWmBl23WHZe2kgD5663wQfDGQ9NlnRH8dRYMaZKwgzVMCv8dUK8l/Na8BqMxgrg==
X-Received: by 2002:a19:6453:0:b0:50e:a436:aafc with SMTP id b19-20020a196453000000b0050ea436aafcmr333897lfj.9.1704886031779;
        Wed, 10 Jan 2024 03:27:11 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x8-20020a056512046800b0050eb7941041sm632908lfd.297.2024.01.10.03.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:27:11 -0800 (PST)
Message-ID: <0c77e014-9f08-44ac-9495-eb2a8afaac80@linaro.org>
Date: Wed, 10 Jan 2024 12:27:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] drm/msm/dp: drop dp_parser
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/23 01:44, Dmitry Baryshkov wrote:
> Finally drop separate "parsing" submodule. There is no need in it
> anymore. All submodules handle DT properties directly rather than
> passing them via the separate structure pointer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


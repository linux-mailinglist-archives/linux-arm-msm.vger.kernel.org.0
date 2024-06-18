Return-Path: <linux-arm-msm+bounces-22993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779DE90CA00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DDA228BDE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261371586FB;
	Tue, 18 Jun 2024 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEcvZMOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADCB158A1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708914; cv=none; b=ZPDDrzawrPzoornGRVdJ4a6WKP9GOx2LoVNlgRZvBVoe/4lQ751eFm9ITjIrUVooaNBxJxli8G9rVyh1IxPdj8pyr1HfQYGCd/CHhbbnTmJ5xFUrpF/6qIBQzXjgv/cPZMaZJcXl0mlzmSIQcZcjUZCIb3tA2/SIYnrSr8NnKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708914; c=relaxed/simple;
	bh=2DEddTNVPP2vZlXXyQ1f+AkVMj17m5QUW665940mq7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUIHc7WjHtiQ0NeYfI9+BfYa4jdX71XlZpOKDvM+9zwr0DAHFimPJ66Wv3ILpK5RrBjhqkZIRr9VXcrta2QjyrYdwPs6FKv+LuLKhtAgU9SbqZwAcGi9u6ZVN0r3v3uSHySMOCQmyfTiExccxmKOXazE8yijGbMVDf/SxFvdX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JEcvZMOE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cc129c78fso1267515e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708909; x=1719313709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rx8LaT2iJCWh9sAWiRO7uFEZyjt/OGNDwxdgEioegZI=;
        b=JEcvZMOEGu9FoZeESQOv2WWVjJHmxtAL0Us5vdnE0L+4T5Udm0SxDp8yyqG91WJRwN
         OkP97NwiBr6VfAN9fzMW0zXx0jUF2Zaho7QEoZaLlukX+OPFlZRwhpGeIn05SyqNR1kO
         7REWi5NT4V7Nf89e0V++tUMHQOCV2lkJ/1Xsp4IpeUAPGZQh0hTlM24eVunpa/2scIiM
         NOy9ohh1ju2AsYAL0pzN1C5jzydvLFPHLdwS8kACh6NpQnjSkl3aodnNqjcugP8XNyfM
         mN2fvNbtRZMFbZ1QkWlZBraAj0ZXVpcWPEEIZB+FcNbPu21oEzjNaGCwhEHQphpC7Tfl
         /2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708909; x=1719313709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx8LaT2iJCWh9sAWiRO7uFEZyjt/OGNDwxdgEioegZI=;
        b=QFHQvyoRNrbCu4CWTZXwWy+emzph/vwKHSAs9/Z25EuPGeG3Vi2tBHGML+5k7RMlk2
         /NkLww88eDUiKf6cdTiVS5gXhcA5NZzjvR9NmKFlHYhpkreD+Fl2stQsIXbRcHJCPScz
         IR0kRvEW9uwCFz5UcR6tOu7MqZrPv7B9e8FNQ2sfZ1v1GupHFqxshp1Eq/TVInSHrg4Q
         q13K71Fcc3iEYdrsm4Zbzf/scgXXHTXgKoH/fHkdHDsahYNiqWIMyCYw2G9Dt7+V32Mk
         g4dJstpCc7MBI/dK0Vt0Dbi8gNurPT46CqAsPiWOvbZ3ddhQq/gxS2y55SVX8/qdphEE
         PdPQ==
X-Gm-Message-State: AOJu0YxQsS3VXuF6Y7+mN6nqIMiM8BadSOEu3f7AZwH6DZza38YIvkCN
	zO5GA7GDYgu+eQrzNaA/NMfMWm9Gw2T+zWrOX93Tvw4depbeRsC5ZLXih4xahUQ=
X-Google-Smtp-Source: AGHT+IE8iLnoe7evxfTRQ3fUk5EMJX78UOkrfeDZUvup0x80fKNJfWmM6oYILoqiwu1riUTXQrFZ3g==
X-Received: by 2002:a19:f703:0:b0:51b:214c:5239 with SMTP id 2adb3069b0e04-52ca6e9f465mr7402205e87.62.1718708909384;
        Tue, 18 Jun 2024 04:08:29 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288858asm1485694e87.289.2024.06.18.04.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:08:29 -0700 (PDT)
Message-ID: <f074d638-ac47-4324-84f7-b7723f18ba8b@linaro.org>
Date: Tue, 18 Jun 2024 13:08:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-2-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


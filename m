Return-Path: <linux-arm-msm+bounces-6969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B4829F68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 18:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F66F282A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 17:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C484CDE3;
	Wed, 10 Jan 2024 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqkkL4Rc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B01E52A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cd1232a2c7so52439821fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 09:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704908444; x=1705513244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hh6Goy7NRtSRzQyxaJrI0RtgCTicSCtruZk0IoQJBRY=;
        b=nqkkL4RcRCH5ufNXbHWGnxSoi46EXvz3Jq65MvlJ1rvX3fliG5y/SWj7ez4mPYLGfH
         DDzG8KohbBUkqdX2KH+KSVYUSWV8rPUbS6gISFAuul7d7fuzHWiQUwkMSJ/OrUUCJVc2
         yivCWneWJQM1jWYM+34g+ijczbZcn9u8S5mXShHS6pmuaVqXB3xFyWU/Lmva11LuhIn5
         Q8c2jbT60eSc31nQa1pwqzgERbFr7e+Q8MN35+3iL5jBdKmVln5dNuSQE35KXRN/u7p9
         u8Yfzr4moganbFSKFIIGwHzpJkzdzeNnoVGjL+1Pk4aLT2oLGpqKkS8E2aDsEN4sctzL
         V+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704908444; x=1705513244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hh6Goy7NRtSRzQyxaJrI0RtgCTicSCtruZk0IoQJBRY=;
        b=lc2GZNfT6sYpS4wg/L/8xiD+Z+pYvDl3QVkbHbxkX2YwLBzzivXBwYl7NcvYFzhdZM
         KLXyIOCTcK1+FE8LazyCzY0otBBhmxqlnj93ZsyLP7YQtm7W0KxijYdrV848SXkLtNoX
         3LCRgMKEpAh89ZtGjE4796jszrk4sAKOuSnjnwTHrf1F/r0JFznxIUSJ46Q1gw/bdKZk
         Fvdl2JI6701kbKdk/pnXG2NpRHrgPcMHRIQv/j45xWrdY25JJSd3QChd4DlJx6MeYTc6
         WiX4s19ny5wSxJWjvG2UDjPhb1R5OSmr/9CePE6GPM/VAqEdEcuMLT7SLURDEehQCpU0
         +jDQ==
X-Gm-Message-State: AOJu0Yz2MWm+7ois5YIvoF8XYDtjW3vMeKdqTmPT8uzkaEt9dA4Qmh3s
	gOjy6IxBXb9V357/USMrr7DsujT1eSeIpQ==
X-Google-Smtp-Source: AGHT+IEYAF/qKxWaXqzKRy2E22Nw/2yDlQi3jF92SjU+pffbCOmE6KDgmi6npRBp4cYRZGyr+gEJkQ==
X-Received: by 2002:a05:6512:124b:b0:50e:7410:d5b0 with SMTP id fb11-20020a056512124b00b0050e7410d5b0mr731181lfb.28.1704908444428;
        Wed, 10 Jan 2024 09:40:44 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 09:40:44 -0800 (PST)
Message-ID: <dd06a04a-ba02-40a8-b5f5-0457085c202b@linaro.org>
Date: Wed, 10 Jan 2024 18:40:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Switch firmware
 ext to .mbn
To: Luca Weiss <luca.weiss@fairphone.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240110-fp4-mbn-v1-1-45e7e33b1834@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-mbn-v1-1-45e7e33b1834@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/24 16:21, Luca Weiss wrote:
> Specify the file name for the squashed/non-split firmware with the .mbn
> extension instead of the split .mdt. The kernel can load both but the
> squashed version is preferred in dts nowadays.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


Return-Path: <linux-arm-msm+bounces-12896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52386B5C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 18:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88271F26AA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 17:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA093FBB4;
	Wed, 28 Feb 2024 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvIWBoMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4783FB80
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140815; cv=none; b=n8nRSDwKbmfvpyUQqK/9k+diBmc6jNBQ/QdarMA37Owr6chZVu8JjOHSd+lNHKbYYY26TfWcTdh/NyVzgnvy3fxnJgTv1fv34qzccuu37UL7ELJJ8Zh7Txl4SI1p7ljuVbPiUM0XZ666qr0gbhifKRRzn7yXuly0dvcJKBo2zI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140815; c=relaxed/simple;
	bh=YnzcLHGhkoAnnjtHn3JWKUjRsN9NYTibQCgM8LFyDQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eg25C/8SdaW5WKmDOyQx0FcUzIjR7UwB8WKB5sfn15UMYyXgOs12AsHB3KIRcymDFi52x9CNDi/vYEgGU7NHF+yHcIMUcLZPP/FEd//QPpS6TjM/7lXyp1xLJFnQ8eLCkd/duIdXBjoIOSS+DJOYdwtX8ARCcKV+KRRR8jLnHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvIWBoMw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512b3b04995so5758965e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 09:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709140812; x=1709745612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTtoNXU05+3x+sA+PfVAb7gBpkSmywqkYgS428yH0a8=;
        b=YvIWBoMwm+rYrDHW1F18DPLLczGjwByh35dD7m5Ia/9zRaCvVxnop7ibeOuXTU2oD/
         YQu+POX5nMqAIOdopgiv+3T+88C9JegP4YAeumovX9DDN+jFOImKc1C1M5VV5WeBQoN7
         vuBX1tKmKpta2WfXXDLfa0bNC2Q3YUl9+5Y0hPfsG8S6gLa6Sgzlgz60Ofe8rfRd0uMp
         ZFhxdgldv9Jlj0Qi5TkkxQpU6g5RkdHXsr+s61yHxa5epaSzgnYv2DLtuiSKELf1j6cJ
         0v80Bw963yQ2dJYCfI2GoNJqWQCofJgz6HpzQCw/wV1ks2yCRZZ0LVHXhAxrVviNq6aq
         JukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709140812; x=1709745612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTtoNXU05+3x+sA+PfVAb7gBpkSmywqkYgS428yH0a8=;
        b=HLyzcIijCxsGColWUYiRTggR2Q9MjgCo1nERWIpJUEWx2JD9yeh2uJBOgmT7v/bdHn
         ZZFTbjbd7803QyQmc2RcDn9VohyeqZ52Uujm1MQ2YDSNh37AUMKpxv+vc2qM8g4hXtZO
         sEroICLz4isRcJLU/WFE74k2Tc1zlb3Vgdo/YD+ThhsuYiFgtGzl90AqosSqizRrrpSN
         DC01JYOcv/N5yEnf8yIY7pA8He5hXxOdmaQRh4KJaeYJVHwgtcq0NdRI+kxhDObPx5Fu
         6mB9MyVHk7UbUmQBREvFsppF6JAMcGjVhsrCWkObTdDqJMIvO1fpVZx6WQVG3CXKMzBX
         j58Q==
X-Gm-Message-State: AOJu0YyNF/n1DHmEGT4JefceGnGlaRxs8geylAiYIRHTOfgOIbhDDe1V
	0p+hPoryjrGyIq0haC6HyUu3eTENf597oLzEGOKyQ6zna5dL0ADiRl0bI5LiFzg=
X-Google-Smtp-Source: AGHT+IFOd+Zu7qeZ6jYL8j3/S+KSJEaWE5dSNrBJp3nEw+bc1IMqD2pna0G9xWgzNH2yGakVHP+ZWg==
X-Received: by 2002:a19:5506:0:b0:512:d06b:2804 with SMTP id n6-20020a195506000000b00512d06b2804mr193921lfe.33.1709140811931;
        Wed, 28 Feb 2024 09:20:11 -0800 (PST)
Received: from [172.30.205.146] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j5-20020a19f505000000b00512daaef13bsm1593760lfb.102.2024.02.28.09.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 09:20:11 -0800 (PST)
Message-ID: <04b1c7c5-37f3-4673-aa0e-8c39fb5fce7b@linaro.org>
Date: Wed, 28 Feb 2024 18:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: fix duplicate return in
 qmp_v4_configure_dp_phy
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240228-topic-sm8x50-upstream-phy-combo-fix-duplicate-return-v1-1-60027a37cab1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240228-topic-sm8x50-upstream-phy-combo-fix-duplicate-return-v1-1-60027a37cab1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/28/24 18:05, Neil Armstrong wrote:
> Remove duplicate "return 0" in qmp_v4_configure_dp_phy()
> 
> Fixes: 186ad90aa49f ("phy: qcom: qmp-combo: reuse register layouts for even more registers")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Somebody was just trying to go up 2 levels up!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


Return-Path: <linux-arm-msm+bounces-15414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B245D88EC6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63341C31774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 17:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA79414D717;
	Wed, 27 Mar 2024 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdyLBbuB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D214959B74
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711560013; cv=none; b=LlGc9oS74cLNhxwKRsNXV3yERzoMXJZLVay3PbUksg6ybU52PSYHGKDaE3dlPxaJe79CW/BblVGmnah2JVvhK16y1ZEySFgJokRGWbEzv3dIP3xpelNHdpMt6+BGdMf6CUgrULwb1Qnus4ukGGDj3TMm3H2mHwISKdDvI/QIXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711560013; c=relaxed/simple;
	bh=b1687rpAmd+CA+DtIsgw6l9KmmKcmQNOGkEESDQUdmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awtVczGB+Vkaq1uu/0gExb7ixMqpSCPX1vUYdgGoVFxXQlCCzdN8DkqeSvNBc9+SwoM2PEFNId5c70Pe4Jo+D2NqWpTipFPDCnNdtsrhy9CjcNib44eUHkr+B37dFkYNkH4J3ALFOy6dhfdTcDqvKiq/XwNCf3BRHqN1yC7u5Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdyLBbuB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c441e66a5so97305a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711560010; x=1712164810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ExJ5wh5I1dTixrGrRnYji34L5NbC73O2OvRADrwkpE0=;
        b=kdyLBbuBWqjrjKvAQ7B+JQyWuqZwerxfm9zLb5HDc7GYVX2IjYgH9bdQrGfH1BRY6R
         0MS1LhjrZ1/iERwxcHXuyxAy6kpwrditA8H3K9dErUbJmSa8XnebLmdNNlLXBSta59Jj
         +k8BC8c4mO8JxaRri+Hbs7KjKLMYqnaZ/E/Qy6g6b4RF4tVDTdLcGUTwux6JM+fK4ER6
         eCzrDIIGyD5+7z8BO0rkchGT4903qdsx/HpIr3uzwPX6NJSz6l5z3rP4AXolssPX5ctU
         gVt/ys2ZVlshGjknyrYQxtoIQfK/H4SONievPZ6RS/kIMbS3lL0keuvcNy+yQs5cV89J
         5DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711560010; x=1712164810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExJ5wh5I1dTixrGrRnYji34L5NbC73O2OvRADrwkpE0=;
        b=p3cJhpoREYnIFTtGSDqjxrX4LJ5rYc02lohjluqtZIV67jFf406BPQ4dVbAq2lfpA1
         yVnf1+eMThUO4O25JAy4y3OcJ7zr8FDGazg7gGxRm7wl/67/XGECP3eEHDXKMHeCGRyJ
         z09mFEmPIZ0da3c/tQJN31vELtPWXyj1R/aJ00vHsE2CMeIw9IRfw/6E8EiKQGrmJ6jz
         Z6n6xSHj+Ff2ValoI5gsnuaVLvZXzHboBVV4Cc/8uM+mWDfMsd/oUwh87n8QM1dABnLN
         d+1xKCtON+ptI6xTepRF9x3ttffC8rrTgHnwyjuEEf/rh4wbyKrvW1upTY2aipI22E2u
         DWKg==
X-Gm-Message-State: AOJu0YwbtKvzhxoFJ2hh7SYirphe2Vb8AUlolKwFRCpxF4BTMWLl0A6p
	w0lLjkACYSwCaj6jhLSXDZswHm5EG860jDEwXHONqnyXb6znnzjQNriGzO3js9o=
X-Google-Smtp-Source: AGHT+IEVTgJDVCVux7Tw0ca/xyHkbjhF1MreL/bno22+h7O6cI9uHaklDbeu4GyNdo9kMMmAnpgmIw==
X-Received: by 2002:a17:906:da8d:b0:a47:533f:2d0f with SMTP id xh13-20020a170906da8d00b00a47533f2d0fmr84843ejb.66.1711560010289;
        Wed, 27 Mar 2024 10:20:10 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id v14-20020a1709061dce00b00a46be5c78f4sm5733712ejh.142.2024.03.27.10.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 10:20:09 -0700 (PDT)
Message-ID: <71648dcf-c340-4832-8a38-a85444b8da3f@linaro.org>
Date: Wed, 27 Mar 2024 18:20:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: qcs6490-rb3gen2: Add DP output
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240326-rb3gen2-dp-connector-v2-0-a9f1bc32ecaf@quicinc.com>
 <20240326-rb3gen2-dp-connector-v2-2-a9f1bc32ecaf@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240326-rb3gen2-dp-connector-v2-2-a9f1bc32ecaf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 3:04 AM, Bjorn Andersson wrote:
> The RB3Gen2 board comes with a mini DP connector, describe this, enable
> MDSS, DP controller and the PHY that drives this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


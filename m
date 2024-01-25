Return-Path: <linux-arm-msm+bounces-8222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936A83BE20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4781F268E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2738B1C6A1;
	Thu, 25 Jan 2024 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayPiKa1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7201C696
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706176743; cv=none; b=creoa7SVy6PBqsKTULBA29xA3jS1sX1SvQ8g8FKJme48U2q7kJX0jlQ1LK7B9+AMeB5NE3kG1kDncO9uylbUooqInR0kAEacbY3m5+WDSodjN1u47B+4uqjXN4OQQdXojttfKLRz2hRYmY3pGBeIskUt7So1kbfPfU0eVi6iP+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706176743; c=relaxed/simple;
	bh=WKpvg0X+iL12WtuMds4/SdTYP/Rq0wCzwew5aiXY4jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8UdVPHdESkgHQL8aDhZInivaz3BFrUBfXM8gLSlNYab4ZWDHU2Gnr+5+Xs1T5WOOJ0SVvkIu4AB/f/vixYy+RqFyDhv3LBgoG6QlNeIJh1dTc5lFr8boKCIF9trEPfCAhxm0SgQjBLx5k3Ln2/B34sdgASX3iTA3wZINoVF1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayPiKa1V; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6818a9fe380so38546806d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706176740; x=1706781540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79PYbjK8bosV8v03uRxryBv/M1N0jqOVv+qRTvu/Lno=;
        b=ayPiKa1V9dKP6lRTLAZxRV4ljG22qpiUX3TjTSajZFcvf/0skpB5IAxbxFvBt0oWoA
         gW7bEcl682Xm4FXztOLFtpJGo1HfbBx52YT0cvYFJPyzZaZfZaIjkaJ/DGudMPeuF0ee
         BNrqR+xng1TlqL+cfAS81OvSs1KsaMJtvFKXYJUHRHoh5fkn7epeL1G/PH3sFtqfcC+s
         7Q9w9H89EMxLGlbml27qX21Dfc00yHu+j5/JLQthrui8itozHSCxpmJQaRj+4wLgtIWH
         hmVQL+1GAr/E+zq/RLIje03Qnw+VvivPB5T3KAMDtjqTEOOFNeyO15QZy/EAjAgX4tbL
         UsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176740; x=1706781540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79PYbjK8bosV8v03uRxryBv/M1N0jqOVv+qRTvu/Lno=;
        b=jAygGA3SL0F11NVl6KvURXC6TtWhSBbpI7B4EC5JREJUAGrq3SnP+A7APrCE2t49FH
         DBeAWpmDzE1FgWfekmai5STwhdqw/NOudbQR17zdxH+XtRqsO1SNj7UJqgFbXRJnTZ8j
         8umd21J5oWbjcZUicE9anYkGJaazZY6m7gps6jEYOyOoYf+FPUu+Hr7uAvhmC3P0ZNFO
         PBHDOLdifcI3KYykH+/3DYPDQgH8ISGyFLn3+MguqzLG3xHQVAFJJt9JUvZW9GlyRnn+
         /55ojbr+OTXO2DwbX8GxgKy1zkY5z54rvchctApmEbqG0X93WvvVo5uroYye00AqHYM+
         0Nyw==
X-Gm-Message-State: AOJu0Yy1+KEYrv0t7dhuruTFf0R65AjlyKfOrEdU+3m+n1gpBonNFl9Q
	mkwvad+wiNh9Fc+R9tvVNjUlI95JjuEcwcYCQoku2VNtyO0oANP1hMWEbsvt61VnSqqWNwhljg+
	m
X-Google-Smtp-Source: AGHT+IFX+WJUjKVyMoF7VIqz7lwHkgo+xeYgCH/keHCQa06QjpPB++UCo/heJp7KdhTg47KNUQpu+A==
X-Received: by 2002:a05:6214:d65:b0:683:6621:c006 with SMTP id 5-20020a0562140d6500b006836621c006mr828558qvs.81.1706176740540;
        Thu, 25 Jan 2024 01:59:00 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id qm17-20020a056214569100b006879b82e6f0sm375625qvb.38.2024.01.25.01.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:59:00 -0800 (PST)
Message-ID: <91c047da-aff7-4e31-9fd8-ef4c3ffef27f@linaro.org>
Date: Thu, 25 Jan 2024 10:58:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8550-qrd: correct WCD9385 TX port
 mapping
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 17:45, Krzysztof Kozlowski wrote:
> WCD9385 audio codec TX port mapping was copied form HDK8450, but in fact
> it is offset by one.  Correct it to fix recording via analogue
> microphones.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 83fae950c992 ("arm64: dts: qcom: sm8550-qrd: add WCD9385 audio-codec")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

That matches what I believe to be the corresponding part in the DT!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


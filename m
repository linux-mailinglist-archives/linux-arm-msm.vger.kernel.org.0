Return-Path: <linux-arm-msm+bounces-22532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80C905E3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 00:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C20282841
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 22:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030CC12B177;
	Wed, 12 Jun 2024 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rxn08QA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE5A34
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718230005; cv=none; b=LDs+Dj0YmTlrHn0xnRZ5GG+JLsPzNEPc+qlfDgY0JnJtGQSOQ39QraILNnOA0o3LypaHPBaEkzsuAkyJ8Lz8URmZGlcJv8hO/hXhWnWKnuf5bRp631DqAy+JMym9ekcSQ9EGKT5iFZu6ivjdiDEUw3ikb5UYRAG8zttD4SMdJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718230005; c=relaxed/simple;
	bh=nWQB0cxwpb5Nyp9W2Aj2B6qiyQPIg/qKQY5yKA+03K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtHjEz5Gw48qENwgUq3cqpydlrGPluU5vuEIq9k5F6SYATaFc0K9BGVzlMq3P3U39QB2kMFfyDaAFLqdi4EiLngUCG/qpoY3sM9Zu0LVQJ51FjKcpfqyETAZbuxyi51KgWmHcL6EHkAH7JK97Ngbi19xtwG2r7U137Ju7trHNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rxn08QA6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c8432e241so58676e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718230001; x=1718834801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHMkWh1GJqApt9wvbkQjpRZMa0KcRsUTuqWe6P4okXg=;
        b=Rxn08QA6bw+Rp/CPNBTBe1zTm9vXDUWsV7Uby7e1oF4TyL17o/CeJV0ALs+/t7PeWv
         pwugLXNreBY8DyBo7jOcqWzqDVBmgXhlIFgZeUW0t2bMjv+iZmjTUzjwkAsHgVJnaX9p
         UL9DY7b7MxtWgrVIUntHyQq6dfSAFOsev3QSajDrozf111aWRJjatg70HNVZpTo/pyMZ
         9MfwthRMHWmgIi5exv5WiXdArtV+beTr9NurrBqA6bFF59SJuWpPnWMmkdnSfOmkpG0r
         tdhRnpR0+q7wroUVHQuy8uJBIS6Xk6MnuI3/WIO086mIYe2ByKuHaSdI1WN7TGWeJqnl
         pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718230001; x=1718834801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHMkWh1GJqApt9wvbkQjpRZMa0KcRsUTuqWe6P4okXg=;
        b=QwFiOBrWeVJF3uQ+U4yaDLWs7kMk4pJogEX7MCp9ffswsOMoC2WN0KMZM6cGzkI9MR
         oCAAWW7U3Xwwyh29rx5+npAqp3Z0pNnw0a1dTPluH3o9JK7DdB7q1YMCe8mAPIsbYxmS
         CYBg7seCo+BP0CifchkOzC6xZ4wLxTqBZi3sLLFsJBguzWY9z3QCwNLhvrEWFa1QgG3s
         KZxizu6wJWLe0ml3tww8M37Sp2/LbcEP+5rdQJtpkiCYkgL82gsr//ms+ZLJ5RelJust
         TfZReyNCL9fztwUSzbfN68wmzoklOgcNq27PcbUWZ5hmAA6HvLwqmFe0nr+8qk1uUKIE
         T5Uw==
X-Gm-Message-State: AOJu0YzDtqUz9nPGa8l09KPdu/kLeivdoq2agWnZAfP7ldt5h9kSGbLo
	C5TOofVSpPyTCUvAQ2mmIzfgzwFQimV106iy9zTf9Ul8zhiMGW67r7I8K3XwFOQ=
X-Google-Smtp-Source: AGHT+IFGBDcnsnGgnH57GdtLyI7Cp/okDgOWixyNLiELylSt9euObSqVLA0Bs7EZsFFRS0f0ffmkBA==
X-Received: by 2002:a2e:22c5:0:b0:2ec:2f8:f4b0 with SMTP id 38308e7fff4ca-2ec02f8f645mr4542301fa.0.1718230001010;
        Wed, 12 Jun 2024 15:06:41 -0700 (PDT)
Received: from [192.168.1.3] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78556sm76301fa.85.2024.06.12.15.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 15:06:40 -0700 (PDT)
Message-ID: <e974477c-f451-4c9c-83d6-31437c52f1bd@linaro.org>
Date: Thu, 13 Jun 2024 01:06:39 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/8] dt-bindings: clock: qcom: Add SM8650 video clock
 controller
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-3-quic_jkona@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240602114439.1611-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagadeesh,

On 6/2/24 14:44, Jagadeesh Kona wrote:
> SM8650 video clock controller has most clocks same as SM8450,
> but it also has few additional clocks and resets. Add device tree
> bindings for the video clock controller on Qualcomm SM8650 platform
> by defining these additional clocks and resets on top of SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir


Return-Path: <linux-arm-msm+bounces-23203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBC90E97B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 13:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D247D1F2459D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 11:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07E213DDCD;
	Wed, 19 Jun 2024 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fG9mzoR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1631E13CFBD
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796724; cv=none; b=q1KyN0GE804FmueZ6G9oD+SdM6mn8iuR+oKr3FZZSFSvjWjV/6OTsxo+EKffgC04nPmCBQHRXQrRqVPIqATO11AtbXrq+fhX2IjbEaq7VIcLkpQtnwFTPAlrqAFaqqQtAFB7KAOkC8L31V8jWSJkaZMRqhPnkhRotasv8tyJQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796724; c=relaxed/simple;
	bh=G9s7/39SAaCha/Gb6/TvfL2LDBIFo42TdwmiOE0eSbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXsDfPu5tbkDPnGghfhG+bTctI90H1/cbQ/xjjxfdxFJrhDFw90sFLWubs8ijRV6BXlOq1zbGU3b9TJNqdA1+zCKolg+Lf3gtps8pPXirYDFytsBrACnMBV4VtQwe0HQ1QVS+Cf5XzUf57pPHSQgP7z/UXbTpS/9qMr7947Emp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fG9mzoR3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cca2298easo62486e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718796720; x=1719401520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrZJ+jfag4mrs/6y3l9PMepTZEbpXG78/iWf/2590xE=;
        b=fG9mzoR3B4ekZ9z6tVZuejBOMltyEaRRUuAqsLBzubLSN/k0FWwYvZzk8deQwZjOJO
         4LtYILPsxgPp9JQZg8J5RM/7BsK0K24GpHHB8xARitNZiVLvO+udKrkSNzWVPnZt65VM
         piiEpyYnqisw9LWyqjcHE1tGA0Y0eyi+kQ6gvzOOrh7NSuCWFtTj557wroTt4SyxIrou
         dKBXtw7xsgx0KevcJ0Ju1eDfDytG7tFVt7TmwpuysxobW18a9JLOQhFaT0nnXipzkyO9
         9yKmySvoL9kQzETLBrbIGc0FYSQrY+W4kiHrJewdmROnrIVRyxMfRZJIlcNc2LWLYjrp
         UG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796720; x=1719401520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrZJ+jfag4mrs/6y3l9PMepTZEbpXG78/iWf/2590xE=;
        b=dV57OQSOHhLP07dtDEO2/W5zQTMdA2FNeymd4NAMqMXFu7woLaPm6LMVsDpuKpybgH
         mFMAEd0U/RdrqLS7Ypoi4aU7B8ng3tOEp33SdjZPftLWYl2EQtApC5Sb83QFEU3Q7E4f
         TPpqVkBTv+FrEfsQpvx5j7jNnwwSNuoDjSY38gI/k6PGHTWhAjnO9j4wILz2RSxzGLWE
         jvq5goBozKT2qy+HwlWoHanpDi58bDBVzIlyJz/NyKg8PNiuPWatKSmLZMke9ipag+2E
         35GCWk0G8fegjB1lCWWmakizUk5W7o0r49v5NG4uGpQpnfhZuxL56rLLq9RgDvHJnkFW
         uV0g==
X-Forwarded-Encrypted: i=1; AJvYcCUd46KlPhwDgIg834xmkNRL6m6RFS8Fh79aCtx3Txf41fsJ0bTRu5QV78zxmCi9+tr+G/STugEBRJsYElutRnfhm/Fy4aXkgzHRhaQG0A==
X-Gm-Message-State: AOJu0YxOY/oldmEt2xct0QKkOcRO4Zi0jkQCyQe0g7VpEr67NTSrzgzl
	oo2Y7VXa2gLCUBR4i9nSVRXwfTUZRx+SLjhYkim2YCeGO8DA7eiNHCQCZ6q1byo=
X-Google-Smtp-Source: AGHT+IFqSpuJazzXtIXmixGX1v6zw4GP/mYamPi/L5REMZv7WfliRiZz68u0QlFghzrjcLt4hlfqpQ==
X-Received: by 2002:a05:6512:2389:b0:51f:8ad:673f with SMTP id 2adb3069b0e04-52ccaa7ae43mr1356015e87.5.1718796720170;
        Wed, 19 Jun 2024 04:32:00 -0700 (PDT)
Received: from [192.168.1.3] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288cd87sm1738309e87.304.2024.06.19.04.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 04:31:59 -0700 (PDT)
Message-ID: <3b723807-44f9-40da-9d61-215395637064@linaro.org>
Date: Wed, 19 Jun 2024 14:31:51 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, neil.armstrong@linaro.org
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
 <3ad2d00f-6b5f-46c5-b95c-c8d68e8be736@linaro.org>
 <fr4j6gignu7ll4nhur65asj35rbsbzr3w4xtxq55jxcfcmb5nh@l6l3qyhk7qmw>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fr4j6gignu7ll4nhur65asj35rbsbzr3w4xtxq55jxcfcmb5nh@l6l3qyhk7qmw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 6/18/24 17:33, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 02:17:23PM GMT, neil.armstrong@linaro.org wrote:
>> On 02/06/2024 13:44, Jagadeesh Kona wrote:
>>> Add device nodes for video and camera clock controllers on Qualcomm
>>> SM8650 platform.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
> 
> [...]
> 
>>
>> And add the missing required-opps for the clock controllers like
>> dispcc.
> 
> Unless the opps is required because cmd-db has lower level than
> required for the functioning of the device, there should be no need to
> add the required-opps.
> 

this is totally fine, but then 'required-opps' property shall be removed
from the list of required properties in device tree bindings description.

--
Best wishes,
Vladimir


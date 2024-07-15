Return-Path: <linux-arm-msm+bounces-26214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B38931933
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 19:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0961F22378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 17:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B0045016;
	Mon, 15 Jul 2024 17:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HXWjlMpt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDA2421D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721064354; cv=none; b=NUjMN7xNIcoH4j3u3BojdN6ejSUY3ehJ+yf63eT+VRCZThQMTxaO5+YAE/GaSHRzvmiefl9apjufnOeca3nxb9zMCap5PXkkKBdYmVtR88xJFuGJf+UYBIQv7T+ozuP2uzsYYWtlHXSYCwRVN3XmJnQOL4ogJcLvGe0NXHnGJRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721064354; c=relaxed/simple;
	bh=goSLXmsXGpXGjrFmKSO9P8Gt3eGZNeTf1X6YYEoC500=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSdlXnHcgmSfaNCX7bd+SEmhvITk9veboCiIkWYov++tE1D3uqQLtp6mBaw52odM6R1lWtniz9dpnlChK3EtlrLVkIik6ilsofvz6s6uDv34/pY0D1eLItNowRSRwl3/8/pYKFJ/BJLVdGOJAPa4oYpqOKzqM1bhi5Rtm4ewvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HXWjlMpt; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso5253822a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721064351; x=1721669151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JtAbcL6PGNnRT/IhPrrhpRoweiv9l7X2S0PMHFzV7G0=;
        b=HXWjlMptMPcw0MSFJbY3IhDIsjog+Hq/A63+O3100lzb2ZsVMIxDkjXFWKe61nQLfC
         tKm+kulGR2qjwoQpNAFGj1dBNp4C3pQ0yIqYPVqTeZBcOLlG1h68FutRNdRa7UYvHP+v
         W1bSyQQc2hpeiSoXiyxJpt0PI7PNzGuTg3IEIKeHqSVH5n8hyz2WSGLDrn0GxXDA9i/i
         YT7odh7LOMwCagplcNLVGpCslg46+tosom1cBxP+OHu1v3fEpwYsiPz7FQeumewbW4UW
         LM0geNwnd3/Td0SitilziuDU+j3EXbN5vHqXsyK/UrfWxmuKYtGiBQeCBHZKhRkiD4Ku
         G6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721064351; x=1721669151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtAbcL6PGNnRT/IhPrrhpRoweiv9l7X2S0PMHFzV7G0=;
        b=oxjz22qcggzz1QWx/WJePJ8cAJdRG2NGD2KgNqKLKu0QBsuaSvZyY0dU5Nlg4l2/k7
         MmeDl3fVc8KUfk+o9cnPrh0tDShQJg/SIeOHUPjDuq7dZvriwWl+YTseSf+ifN4HRvex
         lIiAbEsTobEvcWRZcHg/AZfqTfUwvq7L9jwI7FS4b/bg7pJo6EzEagxf5tnQAY9x2U7v
         3Jg66DFQ2UOwZq4e2EcEAhOt85eomyjamR2spHLPpUMm/8CEL8/jzzL3kkga2SNgphol
         85p10r5w2C29H0LQcGx+D5GHWsIBJr5NkEJdl1llMd5YtMRC8S1kg/D4LEPLey0FQDnL
         NAXg==
X-Forwarded-Encrypted: i=1; AJvYcCUADlpT3omtRlWOOk0NJY0mA51pHSaB3oTsZiZ8iG467LPB7PPHhHZFz3zl0KueEalNQlhUmgIgtUSIXrWEimnhQ3AgmOz/1TZ2NoyDjA==
X-Gm-Message-State: AOJu0YwAoKvzRookyzZj172zZErOfb0827EPOAM/CGd8vgIYNW/ZtWzw
	bn/FhkdFkV8DZfU23eNfeEsM3DW4O+nTX+PHyF/NN0oruRfvLKgEdgMNM2JEcpk=
X-Google-Smtp-Source: AGHT+IELW+XiTO+PTmru/MvNHU88Hiz2B3XzdMbE2ltd+g5gwUZQV4KklqnjHbkNjbiTAm4GSjEpLA==
X-Received: by 2002:a05:6402:5250:b0:59e:a1a6:11bb with SMTP id 4fb4d7f45d1cf-59ea1a61705mr385526a12.0.1721064351237;
        Mon, 15 Jul 2024 10:25:51 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24a76ee1sm3605585a12.5.2024.07.15.10.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 10:25:50 -0700 (PDT)
Message-ID: <51feb2aa-adfd-415d-8329-0512e817e9bd@linaro.org>
Date: Mon, 15 Jul 2024 19:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: disable GPU on x1e80100 by default
To: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org>
 <ZpU1vxsYUdVg9VGv@hovoldconsulting.com>
 <CAA8EJprKTm-FzDjUFwi9jKaHJ121W2m655-GN3DjzB9rSOpJ=Q@mail.gmail.com>
 <ZpVR6vR85BiaFtqx@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZpVR6vR85BiaFtqx@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 6:44 PM, Johan Hovold wrote:
> On Mon, Jul 15, 2024 at 07:40:22PM +0300, Dmitry Baryshkov wrote:
>> On Mon, 15 Jul 2024 at 17:44, Johan Hovold <johan@kernel.org> wrote:
>>>
>>> On Mon, Jul 15, 2024 at 05:23:58PM +0300, Dmitry Baryshkov wrote:
>>>> The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
>>>> file is signed by the OEM keys and might be not available by default,
>>>> disable the GPU node and drop the firmware name from the x1e80100.dtsi
>>>> file. Devices not being fused to use OEM keys can specify generic
>>>> location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
>>>
>>> Please enable the GPU for the CRD as part of this patch (e.g. move the
>>> fw name property there).
>>
>> I can not just move the property, as it is going to have a different
>> value. I think GPU enablement for CRD should come as a separate patch.
> 
> The GPU is already enabled, this patch is effectively disabling it
> unless you move (and update) the corresponding properties to the CRD

Right, sorry about not noticing this.

Dmitry, please do as Johan suggests here, taking care of the commit
you sent to linux-firmware moving stuff around..

Konrad


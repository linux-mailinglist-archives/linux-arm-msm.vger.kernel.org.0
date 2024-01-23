Return-Path: <linux-arm-msm+bounces-7891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 811718388D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D781C24AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 08:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212B75674E;
	Tue, 23 Jan 2024 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uvsh9iQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800F56B6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998329; cv=none; b=bkVYcPTyFZPw/iahVrMZHX669wnTSaPA9QNNpkAEMq7/Vo08BugMZcV6f1pPODqMdn/qLHwuzmGpd7o/OVBjel3mh6tExA8XCWr96Z2a4oXzfgIMwI//kq3Du594Cb+UI9az1usWg2g5yXA6K2BDpBdFt7xilHFiQ9grZZ7RDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998329; c=relaxed/simple;
	bh=VLPWRTePGeeAnAMDO6JWxsfnoKa21Jxlm6UG2n36eYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAXJUkJCLH6C2HqmSK7QwUVB0YxZVyLJqd+qNJNGDmpjd4BIkpthFKcriCLb/Kq/jiFjjBkd8kDre2/95oSXkU78xzEsTgnNVY4lkPkuzioJwOvVXuo67BOdkSw1yaz7L7Q3e9wkCsNax3ENQTNuFVO+wT8iL+pbce/QAIYyCqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uvsh9iQE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e9d4ab5f3so43616045e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 00:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998325; x=1706603125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxBVK1tJbu9DvvgHsDgxg2pgzx7xyGqaQ4fEtaVXiOQ=;
        b=Uvsh9iQE+jtpcwpnD0+7HxvMr8R+Kwb7hcgRR94GCiNayO3nWU8zYBeuZs5H2yp6/i
         ul4U3sJdkLnPkfzZ3rhNS9F+2MLbFtFEKnIqtSAqAjaPaUW8Of0oTy/ljSFY2TD8bheY
         L7XHHkKpFbF0BAmKqSjTNOADYB27AYYiwEc/dtUj1Blor/FRhcQymY5SYYBROt3ayamv
         N7M4ZfBCjrXY2Zz1OtZ2nhblVlT5/xHv/lbxl0STSSkQjLHJq4cRg6SQmZcR1j3ZHT0r
         duKh84d1kzAUC2tbdx30lT6iD1b5DooGphb/ztks77QoOXoUhJ7B4MlKF8ueTy9PsDHd
         OTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998325; x=1706603125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxBVK1tJbu9DvvgHsDgxg2pgzx7xyGqaQ4fEtaVXiOQ=;
        b=SV4+WnaE3+DQ4Oy2ZFgGSkPCfeWSqJQ5MIzd5NkUhaKPusd4asQ2KaTyGF4nYtYHEH
         tVZY9rDlUKhj/zftkB5ujGZ8Ntcqeh15k177+DYhNj8ldYqijNYFGjbM70PqxhzHF2W9
         lbsO99ox/43pTxR8Bm9nfOjlYsOVL/7HKpmbZ90hx1TiiZU+z5PxGmLJfDIkdosAwQS2
         01+fKLo5yqHSL+8rZrm5bOmc1lgxaM9xmIu948CYAiB/jlqzCHJa9EWGuSFcfTJj1ADP
         weF2QzOuiFiuunv6HrhHkTROxvCHf4Cneuq3oe/y5ZAQhtcfwS9ZyAo/8f44c9WGRpMw
         TNpg==
X-Gm-Message-State: AOJu0YwjMpAzX07I9O/lYmTjmHCMpAHQrm4u/tArG4To8fHGdrIUy+Rx
	BeoSOQjypZo5pxSBxHT1BCCkJgSnTFbAvRnbuqOOgW5XPTvTpxhhM9K8A9PO5tQ=
X-Google-Smtp-Source: AGHT+IFbkzvkaHM+7stVgdOy/I0lmgqcLiu86BVZwiDUap3SxHVXW/+/y9qDny1lV6D53GMrEOKZ0w==
X-Received: by 2002:a05:600c:2288:b0:40e:46b2:24da with SMTP id 8-20020a05600c228800b0040e46b224damr288327wmf.71.1705998325687;
        Tue, 23 Jan 2024 00:25:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b0040e4914f28dsm45174001wmq.18.2024.01.23.00.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:25:25 -0800 (PST)
Message-ID: <55b09f5d-1d90-426e-b2fb-0fdf073bc7b1@linaro.org>
Date: Tue, 23 Jan 2024 09:25:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Content-Language: en-US
To: Brian Masney <bmasney@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com,
 kernel@quicinc.com
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <ZamJ1wSXzJSyzqck@x1>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZamJ1wSXzJSyzqck@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2024 21:28, Brian Masney wrote:
> On Thu, Jan 18, 2024 at 09:27:11PM +0530, Ninad Naik wrote:
>> New memory map layout changes (by Qualcomm firmware) have brought
>> in updates to base addresses and/or size for different memory regions
>> like cpcucp_fw, tz-stat, and also introduces new memory regions for
>> resource manager firmware. This change brings in these corresponding
>> memory map updates to the SA8775P SoC device tree.
>>
>> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Krzysztof: It'd be nice if you could submit this patch for inclusion
> to the stable trees since the system can crash without the updated
> memory regions.

???

It would be nice if you could submit what you want to submit...

Best regards,
Krzysztof



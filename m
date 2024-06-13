Return-Path: <linux-arm-msm+bounces-22624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F19079AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 705E41F24D48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C7B14A4E7;
	Thu, 13 Jun 2024 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3iiQebH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2004914A0A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299236; cv=none; b=NBQUA9oOhMVS00A6UEpptxxJ9x4NNsMlI3vTgqcQPR6VaTHGkCuLdoWuyFu+2zgEMZ2hVmz9lQfpYI5DEdsApAfXtbKPYzGc9yaqhLrJPeGVmQhMazY8PT+QnM9pTvbsNfB3EdVDi4udGuizXDbAdAJER5M95U/LIogEwk07REs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299236; c=relaxed/simple;
	bh=vX4tZlfdMiDbAOqyzjLKdId0wIu+miOZ29FnR8jsohU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nugKfMpIuYVgFJpcsw0TbULVK99FoFTcbKBnS3i5t7g2HEcWl2TKE4EXJZIcY1fxyCtbDffH9eCLsVx557/G5LauixYpfmtuqWva0SFZnKpJ/iUlRk5/DyJ/6TKfRmosU6SsLsP0T5ZBvBB4OxPv7uYMaWOujac+oS3YfZ9v7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3iiQebH; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eae5b2ddd8so21214811fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718299232; x=1718904032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmCat4yFzakLoPqsICLGJKZ86qrL9CrdVXXkrAz9XWA=;
        b=e3iiQebHT4EK0OwiMj4owv5tcaaj3m5nUDjIFNNYwjZQcwWx/r0Y9RbNgeqjRkC/U/
         nv1RMkUDeQ6jaCeIWvWS3bKpN87vLZo5G0cBOChYrBGfCDCiYpXJBU2V3qucfEaFLPks
         /Bla1sMan0J5Hnt5sq+FDbh3VIiFQC6jXBhg326Fn6iuulw4GQh4cCrHk+T8MUQQDZcb
         D4+2Mvpg+c9wZlqdFii4EwNTYk4J67fqZyCi5T4/Lq95CTzGVt3nuXbqAAc2NA8AqVDE
         rwI0Jv4CnqzFRB13olKxgFGoNlh8lfK/xqIaJGssOdDLPRrCrCZ/JJqxLu9gJMJG2EKo
         s2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718299232; x=1718904032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmCat4yFzakLoPqsICLGJKZ86qrL9CrdVXXkrAz9XWA=;
        b=MVoVRYLUIn5K+wUGBlzCc66yUpsbw7QMNyYjCzD11lTWC7Ig8yjXOBRf8pdQPztBLl
         mfomPDB0qQp405pw8ie5l683yoYWxnQxEMqnUeQKx/MNnndoSDDc/ENR/pEkjrMZ55HD
         5DDt7XN9vzjaaTp2/WEPohp/eZHIvjzOSOKNu/PQH9tkpSewL89zXH4J44GsjAmjy1X9
         VpXOi1mpKonOeezoym+/JShhzT0iJIvL8hcieAIlbwgT8sGwjUNagoA+fsOXc7woSAae
         P1EEHkfBxcMG/Fzfzge3sniT+9Vx/McZUbYgsd/OlEzoHCTVPoI6upY7bx1y11YhV0AJ
         2HPA==
X-Forwarded-Encrypted: i=1; AJvYcCV33Bex8kaD/wM7L+0WHBOyXHvjhW0DB7sD9N5DUZFswANqITpp3f43TZ4QMn2x6Blm7uu5TRvsRAEPHyNSHMyR+drYnVPIgAztbZAJuQ==
X-Gm-Message-State: AOJu0YzFG8+kJt6F3D4NdgUiJVH3bjlepY1VA2gOUEj7CoMLCgNYOmik
	+fzi8hhxPezuKxC5duJtWGkRD045QjBQfIGn78eRwqBQ5fsJp0mn+swEby1yLJrWFrvHgQqR3DM
	LsmM=
X-Google-Smtp-Source: AGHT+IE4j3HMxhLWYVU29TQZzIBVMZHRaQ5xZ54nQ/SRi+BohkpWnbIsKLlp0bKYqGHndxwko/uGhQ==
X-Received: by 2002:ac2:5183:0:b0:52c:8daf:da1c with SMTP id 2adb3069b0e04-52ca6cb877emr133289e87.20.1718299232137;
        Thu, 13 Jun 2024 10:20:32 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2887effsm295391e87.257.2024.06.13.10.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:20:31 -0700 (PDT)
Message-ID: <5e916d38-7dce-43d7-bee0-a10842faabfe@linaro.org>
Date: Thu, 13 Jun 2024 19:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: motorola-falcon: add accelerometer,
 magnetometer
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
 <2b39d763-5b79-4b21-85f9-22fee9f87468@linaro.org>
 <Zmsp8kPRCE/fIPQk@standask-GA-A55M-S2HP>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <Zmsp8kPRCE/fIPQk@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/24 19:18, Stanislav Jakubek wrote:
> On Thu, Jun 13, 2024 at 09:48:26AM +0200, Konrad Dybcio wrote:
>>
>>
>> On 6/9/24 13:05, Stanislav Jakubek wrote:
>>> Add the accelerometer and magnetometer that are present on the Motorola
>>> Moto G (2013) device.
>>>
>>> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&blsp1_i2c2 {
>>
>> Consider setting a clock-frequency = <>
> 
> Hi Konrad,
> 
> checking downstream [1], qcom,i2c-bus-freq for I2C2 is 100000, which seems
> to be the default. Should I specify it anyway?

Yes, at the very least to silence the dmesg warning ;)

Konrad


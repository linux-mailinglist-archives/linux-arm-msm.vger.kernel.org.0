Return-Path: <linux-arm-msm+bounces-37851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2C9C7D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 22:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1914B2BF0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 21:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96A420899D;
	Wed, 13 Nov 2024 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCcWoUlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21976208982
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532487; cv=none; b=Dds9tSt05QreyyHLC2P2ljIBEEG3V/4eWlaFngKBbLPPreWrd5m2wPUSe1rLx7qRH210YYLbFk1iUODOZ3e18ZdcmDyPG28r6SblgHHImY61+eMP1kQjEembwCLuPkplcHCm9OQUd8W671/Ot2h89C32lBatfe8i/kQ+zXtFja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532487; c=relaxed/simple;
	bh=y+NzpzejYDg4WwOMqqSlho5bizSCTIJ8a/DFv7RBwKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhiMsKepWFrSl5EujUZRKYNx1AL1BbfudexppZ/RpBGQeCE8CHJSkvZkzBaxd19kIXzz8fN4ss0CthR8L29oUDB5DDvHeM2ArEULcEIWl/L+7JdL+ZVQmJDF9qxOXjJ0lNR4lVISr/nhzeBwH6IWPNXtFfxydP+jf3b7MJEYSaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCcWoUlO; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-539e4488012so304246e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731532483; x=1732137283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MWW4xpmzM2Fe1J6uTpcvQOhcfcmzKCMrCiJfOhpikeI=;
        b=jCcWoUlOSIEJzMqVqVAuyakW/kOeFOdvmx8GIVxu2F9+/s24CVonHzZkwfnOeeYxsW
         InJofXlAMa9XGzNA/xk7pQWbd5spUUWNUPKzOMoPQckaEzyE/pHJz23b9n0ekaMjqHeZ
         0786W6P2v7+swdBTtxiZrjp32yRgCQK113OX5hW2fpdS3mvpF5x3i9UaB+MM3Bvdf+Hs
         +SYBDyqpvOn7VbWZaM7bP3dF24hfkgLslcIuMjjsKQC03ZDSi6TfxWcC2vjpu4cHEFM/
         Wf5O1wTVl3mn/VGtoMsvNa2GbnToLDojkCKgXPG/0ALYaJpF9lbYkADiNf8+ORLl/So5
         adRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731532483; x=1732137283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWW4xpmzM2Fe1J6uTpcvQOhcfcmzKCMrCiJfOhpikeI=;
        b=CBmxT1lfL3Tg5gEppJMUF/+PRUVh4q2d+vGTSw/ieODQMX+NN93EAl9Mbt11U2JKgi
         Y725jyv12XH/FXVm/fMRnVZKm+GOzNQebtoOr51SQUV5nHH9T5xqfOFAn3UN5gfU9QCc
         2s2+Ahy7IAANg4tS5TBdA0/wIPWNyoC7radHznXK5Nufwja9m4Vi9mn6oFQeYcGTlUpU
         GdQw5s5nYENrXhmSMQRcXAM60JRPVqbmDsCGZ8APGGUnlQgYibcRRj5P26ZabvFBORFc
         aXcA7anqTPGSOtGg1816aGeqRsqy2en4D6hTCj0alSfnY4bHTAmMfBhWQpsIEx081RAM
         t8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWjtaTaEUwZJUXpTb6BLzVOO8pWxK3Nwt/CiXUKoDVjxSBMGm6bf5yUV2dMHdAy62HCJiqaNo/c35Xv+KTt@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJuAKXp6PpuWchBVPhu2KLHGQL3CQz/hG65xmKqAV3V+4DD+w
	R36xSeiQKu+2pUIbtHxCnpDbkl13+9YlWTkRoru2Vk/kh6Ix5hKSBZ3ejJtP5lY=
X-Google-Smtp-Source: AGHT+IE/abjEKPW1/bwyS2SME/i+tt3LJv7ehOsjOAcpnovPFLmxI8e0bu/XOCMufARKSCnFQIPMNQ==
X-Received: by 2002:a05:6512:2387:b0:536:9efb:bb19 with SMTP id 2adb3069b0e04-53d862628f1mr3057095e87.3.1731532483168;
        Wed, 13 Nov 2024 13:14:43 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826862f8sm2297338e87.101.2024.11.13.13.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 13:14:42 -0800 (PST)
Message-ID: <8f07e440-8a56-4315-bb79-b630649a9116@linaro.org>
Date: Wed, 13 Nov 2024 23:14:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add MSM8953 resources
Content-Language: en-US
To: barnabas.czeman@mainlining.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
 <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
 <6833ebc6-9210-471a-8ca6-5f3605155f33@linaro.org>
 <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
 <67d014f1-9424-4b88-b031-096a5596c5c8@linaro.org>
 <eda3d0ae-50eb-43b2-a234-93b209fbcdeb@linaro.org>
 <ffa2a863c8a9b99582ad6648600d372b@mainlining.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ffa2a863c8a9b99582ad6648600d372b@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/24 17:32, barnabas.czeman@mainlining.org wrote:
> On 2024-11-13 16:23, Bryan O'Donoghue wrote:
>> On 13/11/2024 13:28, Vladimir Zapolskiy wrote:
>>> So, we have to rely on the documentation here. Bryan, can you please
>>> check, if VDDA_MIPI_CSI pad on MSM8916 and/or MSM8953 is related to
>>> CSIPHY or CSID power supply? Thank you in advance.
>>
>> No there's really no indication in the documents I have how the input
>> gets routed internally, CSID, CSIPHY, both.. not clear.
>>
>> I think Barnabás is right, the best source of information we have for
>> this one is the downstream dtsi => CSID.
> I have found the regulator also in downstream msm_csid driver i hope it
> helps a bit.
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/drivers/media/platform/msm/camera_v2/sensor/csid/msm_csid.c#L73
> 

Agreed, since the documentation is ambiguous about the voltage supply,
the best deal is to follow the downstream code here.

Please fix the review findings in the dt-bindings, and rebase the driver
changes on top of the linux-next, also please consider to add CCI and
CAMSS device tree nodes into the msm8953.dtsi file.

--
Best wishes,
Vladimir


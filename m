Return-Path: <linux-arm-msm+bounces-82823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 622FDC78CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90CBA364D56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A91034CFB6;
	Fri, 21 Nov 2025 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIkOPlmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC734CFC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724479; cv=none; b=OEwwI3Qrl+QlREQ2SLP/OAVe+0Qc48nQId9j1//IOKUUyZlcwS8KqL26/Pcep81genj3LhDMjq7ieVTWu8MfqTF1Wzr0aTmEqJ4pTIjR9eMQRM6rMbkqXBokwYrB109RA5/CkrwNA5wGZMz5V+u2yBZnlTTHp676T8ShMWgR8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724479; c=relaxed/simple;
	bh=FR/l64BfQtWcy5AmGa/x0Kd+BcD5MaBGaBHWSqd/0I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/KRx1KYs1IpSZbaVUfqb4YHj32Juz6mKDIdjZGzEktBqgSbYFYkTQt1HzCVQbTgKmPX2DklD3lcan1fyTWzP2ZuoWG1LdtCgVKE47RlOqmgkTh2XnG3NW8TJVu/jgTf9BoDVhgQPQ+UsBK3dW3nMpnf3r6WY+eiPbTxBigBKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIkOPlmJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso2882835b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724476; x=1764329276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1R2yvLJT9l2sebGa7bGBLAEk2UsFTKZ/XGXxsCh1YW8=;
        b=JIkOPlmJU4yMwEm0Q/rJCsJtNZOFHhTRj3qJeP3miCbTw66YUADhTzPObPOFSRLgCs
         PPnINZ3RZHjy0IE39DxdBC8ij2J8Crvp7TP7iX7Aq7EhLwtHBzpzLHnPkp+9Vmqath6h
         2X0Iua5WmymRsU6U9gtI+eXXyjFtcoFRcRF5da4U77DCBpoymEO+0jJ0dK9w6IUKCVQQ
         hfMP3EW/mPgKi18kd+CDNBYJznZ5CqMVfvo3tYLFzc+sNEsYpWQKJDZE19BGinY2ynPr
         hGmIijDurGzDoUM4Xb4a+zbeOrJFEWpkxy0/AFkUEC5cazs9NAh5YbKjPvSOBIJmXbr1
         iRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724476; x=1764329276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1R2yvLJT9l2sebGa7bGBLAEk2UsFTKZ/XGXxsCh1YW8=;
        b=o71YFu1isZE4BMMRCORfQ/u+E1d/M+4GhdHTvxmEUTry03hlKxmjbqQ99iHkla00cS
         ZqGB6BazzgHu71W0NKy5WNvzKt6ttxrjp7qf8mRZzlkzFg1BJZYmSTnaqhVT+aNMDG7O
         Fa/ZVMQ292S67EFKnpV0nVdlO7DD1axhEcQVP14ql2IgPzNRIGax06OErB89yC8fcgK3
         6r+OBtkNMvUemMzxKMxOi3EkYQzRH9ioP5SXNK5TqjaEc6MToqyg/iWo8YQUWEicniiQ
         9jhl3D9bECEkM191yxcnnNHh0CQhnTkPZ4Be9bWW0PnrtB5blE9LaURinwgH8BuJlAwx
         dqlg==
X-Gm-Message-State: AOJu0YwjHhttdZTOJGpHvsL5KpHavW7+QRL80G/+jNjnXM7aDtmKSFrd
	LDGIPl1HacYC5W2WZwDAi3hKJym3edJHdF4u8nffJhBtk463kbThAsLr
X-Gm-Gg: ASbGnctFH0JZD4Z4TH0Z/U7T+HuqclJDHVOtrsvFd5yFsY+bx26/bCob7nFOW1+d0g6
	eUFereNE/wIZDFdul20YISLydpySg1wOrvfSn9P5u4W57eA13enzmtK588vD3dv1muR0fqJCrXB
	DZIowscUZP4B8dod0iw7Owdn1PzLwbnLfuMUGvjZqPZz9zLnjDpoeHXgRooSFfcFSgHNV1fJVAy
	K3cmvgw3Yf49iXbH0mE6ZnyRAzZ0IeRiJ0HvtkePYLXFvqXA5xXWaouyuo6yO8Vbeyg7axNQwhv
	oeSOKK4g3HNuRMHaod3wOyWrXfLu0tAAE58gw7JbxXUNzKnYRwmk5jsfQuSkQeoxJ1+nenU3atM
	83BW1K48SBrKNqNn1RgEpKD5fpQ/qqWa3x3DnovCSaI7CSaTQCWZ8cm4a/JAstHcecpc/18DkLf
	Ts+V4aoO10vfzApfQGHgDTtjqAHat281qqxHnCqkHLJz4oeDRQDr/aes6AnrOKz/gL
X-Google-Smtp-Source: AGHT+IGx1kj8XCwGhrb2uV3Nnb7QEjcdqvgrN3fzzNee0TinoDaJQazabZ6HTuolBNuWue92taBcWQ==
X-Received: by 2002:a05:6a20:3ca3:b0:35f:cfb:1efb with SMTP id adf61e73a8af0-3614edd7f17mr3004978637.29.1763724476323;
        Fri, 21 Nov 2025 03:27:56 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd7604de4cdsm5274052a12.20.2025.11.21.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:27:55 -0800 (PST)
Message-ID: <a187acac-d2ec-4fc9-9a5c-178590197f84@gmail.com>
Date: Fri, 21 Nov 2025 03:27:54 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8960: expressatt: Add
 Light/Proximity Sensor
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-1-636f16f05cf4@gmail.com>
 <742601dc-32d8-41ff-8e2b-a960f6fe77ab@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <742601dc-32d8-41ff-8e2b-a960f6fe77ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +
>> +	i2c-gpio-sensors {
>> +		compatible = "i2c-gpio";
>
> Are you using gpio-i2c for any specific reason? Would GSBI2 not be
> connected to this pair? (I am not sure FWIW)

This is interesting! Downstream uses i2c-gpio and I (well, Claude) used 
that. Seems like downstream doesn't define a GSBI2, so I guessed it's 
structure in the dts and it seems to work! Thanks for the suggestion.


No GSBI2: 
https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/src/branch/cm-14.1/arch/arm/mach-msm/board-express-gpiomux.c#L411


>> +			amstaos,proximity-diodes = <0>;
> Try comparing the values the upstream and downstream drivers write
> to the device, maybe you're missing something
Yeah, I'll continue to try and do that. In the meantime I'll send a v2 
so I can get further comments.


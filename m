Return-Path: <linux-arm-msm+bounces-50747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE3A58406
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 13:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76B13ADFEE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 12:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FEC1CD205;
	Sun,  9 Mar 2025 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug5jSivZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB52A8C1;
	Sun,  9 Mar 2025 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741523288; cv=none; b=hkHbnF8WyaFJlKVFEbWAAbjUqwXERu7fEWdVaAiwqnsjaw8U8hkCrJ8czlgJxzW9UOE7qOCdw4rBNB9C6VjOtwXR5HD0Fcj+LiUaLaZW8aYoeD+ug4iVWQLLRTvy7j4NXqrLXJluApVIQ5jd6zCa3DhLjU7b+8Kd6J8loSleSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741523288; c=relaxed/simple;
	bh=Q/8ho1ZPlzJ4nVNZTI/wYYtiJyJFUkXUDFvNcQZFKT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOmY1ZpvZMCfTlyqC1UVq9GskplgIAplo0lbJNOSpPFmnHGtm/2bbpgkus1F0L/GxdLx4sMYXvrQSWAQgpQeeN57a0nwBtgm9uZPhvu92pu3XS6kJGJVWW5QdZvLpiMmuYAg7/h+M40WBBFntg4D4RwBwTOO4oiRiMNcsE9JaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug5jSivZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso19464385e9.2;
        Sun, 09 Mar 2025 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741523285; x=1742128085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaCjmy/2wA14pbhhG2CRaGe/sVh+09XO5wxJxcfM2WQ=;
        b=Ug5jSivZhQcLu75xxMboRSNZglpyiFdhMo/3aGcZxTlCzHT+yBcUlaIyFHynyVEjaE
         Og1TNZp54dXC96HZs4aJq3bXbmUJvDjKeckudAIf+LylqEbhBWlH2LI6rrKjXDhZwyqS
         zFb+l8GczhKpEI1nI04kps+XRnkOaGWoslu/lv4iPNPYTofdhxfr7tWmaX0MUDfwL/KA
         XXl7w29YF85XatNf0pJK9PeWiAP6S9WmNAYnBfX4wew+gKIjiyPJG7LHS5ZUQexvzBAe
         ATDWzrlntLtEa0N9TQWVA2OY5HzZjoCrWbqckk71knqD9cb3+FmzW0OYT83R8k4kfl4W
         mZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741523285; x=1742128085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaCjmy/2wA14pbhhG2CRaGe/sVh+09XO5wxJxcfM2WQ=;
        b=TXva2XzkTibuMqMzbTF/7df3NJzF50TaEmeBwL1AaOnC8ZzZrsxxLC0kzEOTBjIgvz
         C0Z1psM6DOcu30WW0JgQm9IU7MrKB7hlqweLGvu1lQha/0ZIevD29gXtbxHeyTNhB/kp
         gltHw8ko2hH2t7048YlPqeKwZKIdAFi3Jablp+U0O9Qgk64BkSujM9ht2Pov7FxHyDzl
         0vGMGupF1biCBhkMQP1UR9PHohncIuMnA9YvUR9tHcYYQCveHYVQu9wpgLKjmsFMhJgW
         l1gBzVjTi0f3oFliXygW4nZQi8hh4wGatOWPfWzFSx/NzBOfOomzRWhyo0ZLNR10gOml
         gizg==
X-Forwarded-Encrypted: i=1; AJvYcCU3kjCI2ABHWCulAh1aTbCKz4gSgmBhvkMoLgXQdzC+DlIBjFrGBNE7W3m+jcUZBB+5dWteHDDoNyhnN447@vger.kernel.org, AJvYcCUn+QupypbKCXLMq0id0IeW98OBZoVQ3x58bSDCTwiI1bQ2jcrwWrrg8k5VyxgNcDZAbO9iRAOI0DGJnp9mZw==@vger.kernel.org, AJvYcCX0NzcaN6G42thjG34C9pjZRsLMCcmdPbsr+8/EUbK04eQbLwDTHbdCvkRzf7hsEsJeBS5Yin7jEPwA@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZJXtVZ6pyiml9+3JpbJxUF5GdvoNeCy2fW0W7kFObGrtsRe4
	snsOgkkQmF39pOpJYO/6+arZKvYIa2wzTMQQgdHdgeLIL4BXIfPZ1wvck3o=
X-Gm-Gg: ASbGncvsIiyPPQJxkQkzmdcbAEd72N7wK6wC9NOhg+a/2V7Xe2f0+Z1i+12T7HbnK8M
	pVQo8HILAlmjq4iO4fDxRpYfvkl7oTOfPIWmD76GT6qjpaaI9aEvxkkJ9CmcRc+NPiDEoWUspB8
	A/XhCxX0yk1WZ8syoaL2s3l8FpmAqz+9qoMKN/agWDorLYZhqty/a0DHD6v7dOHjP2xpqzINOVp
	f0vYNtCCLzCkvsFtT0d5jYCk23yDHsKuNZPC19iZl9ZDsSAS47fThA5DMHR4LLHLsZQ2dkap0Fc
	MklAljUDLBRyf6ZXLkiWnaT6WxN9BSUy32GsrrqYibYjn6SU3DK4wvi64Z+zVJXsjYa8pwaw8p0
	EE/hxQV4gjeBYJFSBFZiTdg==
X-Google-Smtp-Source: AGHT+IFSO5uThCc8aF0617UoNV6mIu70QgwC87l0qV/cAQ+YxnazTbkI0OmibCRClFRWINwkmuItzw==
X-Received: by 2002:a05:600c:3b82:b0:43b:c3b0:56af with SMTP id 5b1f17b1804b1-43c601e1314mr71367915e9.14.1741523284803;
        Sun, 09 Mar 2025 05:28:04 -0700 (PDT)
Received: from [192.168.20.192] (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce3f573f6sm39528065e9.0.2025.03.09.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 05:28:04 -0700 (PDT)
Message-ID: <33b00810-2fd3-4a38-bfdd-47f543cb51bd@gmail.com>
Date: Sun, 9 Mar 2025 13:28:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <ea9344b7-6646-4329-b8f6-45d2b51f183b@gmail.com>
 <Z81eAMoXb9li4lba@linaro.org>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <Z81eAMoXb9li4lba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/9/25 10:23, Abel Vesa wrote:
> On 25-03-07 23:03:07, Aleksandrs Vinarskis wrote:
>>
>>
>> On 2/20/25 18:42, Abel Vesa wrote:
>>> Since the driver and dt-bindings have been alread merged, it has been
>>> agreed offline that there is no point of holding on to these DT patches
>>> even though there are some issues with plug/unplug during suspend in
>>> both pmic-glink-altmode and ucsi-glink. These issues are being worked on
>>> meanwhile. Merging these means that even though this will provide external DP
>>> and USB orientation, plug/unplug during suspend will give some splats
>>> and render both the USB orientation and DP broken. But then, other
>>> X Elite boards already have these nodes described, so lets bring the crd
>>> and t14s to the same level.
>>>
>>> These patches are just a resend of the ones found in v5 and dropped in the v6
>>> patchset of the driver and dt-bindings.
>>>
>>> Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>
>> If you will be respinning, could you please add link-frequencies to
>> enable HBR3 speeds, similarly to [1]? Alternatively, I can also send
>> fixups once this series lands.
> 
> 
> It's already re-spun here:
> 
> https://lore.kernel.org/all/20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-0-e5a49fae4e94@linaro.org/
> 
> Waiting to be merged.

My bad, somehow missed the respin.

> 
> Lets make the HBR3 enablement a separate patchset as I'm not able to
> test it in time, if we want external DP to be part of 6.15.
> 

Sure. Will send as follow up once its merged.

Thanks,
Alex

>>
>> [1]
>> https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/
>>
>> Thanks,
>> Alex
>>
>>> ---
>>> Abel Vesa (4):
>>>         arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
>>>         arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
>>>         arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
>>>         arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
>>>
>>>    .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
>>>    arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
>>>    2 files changed, 785 insertions(+), 10 deletions(-)
>>> ---
>>> base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
>>> change-id: 20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-325cdb7b097d
>>>
>>> Best regards,
>>



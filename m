Return-Path: <linux-arm-msm+bounces-87045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFBCEB2BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6712E3008781
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6293A1C32FF;
	Wed, 31 Dec 2025 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJm1Xwll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8D2BAF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150504; cv=none; b=qsbzzPHxiUEdjwfqKghuRdWlOJJK8w6z5oPJ29tRnqYG07Ln4qsDSuPq780g3w9kfjQZ0A6eifTAAj8mNuuJvtyI+hjr+Le36rrvJKuNUjf2kTVNcb/6XpMEUI+rNVp3bhgeG5g5sqQSEs6n/Xyr3bg34v3YJ1KGvHLYYsJapSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150504; c=relaxed/simple;
	bh=3sx43rh8mcNR53Meq53VgRwAyMlpmTjQ95EwjtXo0A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttvkv6lmgWJwbDRQYk9d0hPMEkUlPq0HkqGpHQ2MsMWfA9/0rXogCr6g9tNEmCA5oCWDIUi04f17EGLoDz16z0MJ4LC/Q980lN+PHDE+N6c+hIdLToxWqy4EHeKVGm1fL9J/ZKP5LQMT7PEB4rMccT7qoqCO0JWFViLF9iLJtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJm1Xwll; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b727f452fffso1804822466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 19:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767150501; x=1767755301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP6kF2QdO8rxuPn/APFXZNudnHAAaUvM0ZQESvBspYA=;
        b=UJm1XwllDKuBUZspsU3ieGl3fjuXkLTC1VYlDhS8su3ZN4xCKjGlNfwvsyDdK6YwN7
         DR6tW0Aw3iyvE5IGxbUwB7PEWuZzM/wb+OORyoNrMz3fwgqm3tExqFyRSHtU86Mxat3g
         GRovYTchq9fdkYQBSXdtMwwdB9W4hJ697Vu52B4Gt+WeHlBZ5IKzBIAotFofRp1TlAsy
         vFv7WgZt4MFhJhTH49JM8KzOxr5NsQNN8sydWFGRnO+xPXnZ7nzZ5gJTjAKaazdxzgDT
         UtzLmiovuqOvHTkEJJXb1zJVIDHpGhLUeiTwuVy0rsjDAWjcrg11OmSv4X7v8dIO5T79
         MNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767150501; x=1767755301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP6kF2QdO8rxuPn/APFXZNudnHAAaUvM0ZQESvBspYA=;
        b=FlKlR0DQyifC9akq3hQFfoT2mfZFxmT1M99nZtkBgHaqEeciDlfPRmpQaCZzNnzmRx
         VI3AzO8RPpQI4xYmgQAnu8FkgKk/TzJdeo9AujQDJoOwZ0IlGJN3he4Gt4NVPOK5KYYm
         xxhHSWxj/bk8D0mhYwn9xNJ3zbXpJowKTCTL5JhU5ZS6OVAcgWcHlAmSk21YlVwZEYLw
         cOklfV4q9nXz/cJb53TIy2J5QQAfORLbDDqz6DMsux+WLvDaVWDw3ZNCWVRGhQPoV0An
         oSfkd+Ep5HIH56OFrnOd65zjyxIUsp23RHYBQDr7DtClKNQk5Uwl8baVxLCAMOVd+nHd
         lcuA==
X-Forwarded-Encrypted: i=1; AJvYcCXQFNVjcJD2Y2RXq8mNp4q2rANnLU+wvpumr5vw7fKLKnHkwTFPBFBe6ifojeuIkVZwqzWgrh2IlGW0pMXZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZF+Y7m1Ywjb/X8ZMRnQdDY5VanJ/Eh4Rl8ll1LyR6V03pWGaS
	hqseFB09EzfnSk2HKzWiBFNfI84btZtf1jPcqdGuoWPQ5apaYgfo9tJh7D1y8jWmcac=
X-Gm-Gg: AY/fxX4nUb/lHblTWlO7eaTOt1hMG9aGBZBS0j0tYyf5rqSOaTa++sJ14IgJuL0Qd/2
	A0G3qtbTGbwRrZV5bhzSTfFxtxr7tlVYVTZYesXeyg2KCzk/6INvaHz4ct7b2WpC8X4mLKc3hnq
	QAe32I665kkgNb4hzxkO6JgtARp/30OFcKadG4XWlIiSAphyja3NgvY++RgSTPEsNmdGQZEEkIR
	9GHNphHap4cH/IFcA4xRy/m/JPGGv7S+YloxDpbZonjBdZdEW+KsVwdgyW38CsLBCuSHLCSwwIE
	aSSQmlnLEq8wY9kzK1mbSUCJoHb9nU42+ikuMP5zM4dGSGkNClvF2h5/sUdAfoPspocNWwsg+KR
	WPqcr8w3yo4xnh6kmLCtt0ry7BnWfxyxEyO4KYV94VTyV4KZSPRQHsIvREdXv2KH7maBOkxHHLs
	+g/2NaAyz2TDttOnBy681/a9sfQCfhWsJTxdS9zUw7bTrI5+X9ayNX+4okweoakYWGzevSrbAc4
	5dAdyl/SKLJRj59XLiXQhiHcoBPyBHRYN+MLQSHir8k8iYrbDIWXwzrnucaskzzD8NJkgQxcZix
	Mw==
X-Google-Smtp-Source: AGHT+IFFpUF7ZjEwtHXk0tuyF4jSLrh3YIHWP9ArjJT2zyDy0sVf1xmbFLKYfgn0U1pYhORgJ8TrQw==
X-Received: by 2002:a17:907:7f01:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b80355b2523mr4497803266b.4.1767150500979;
        Tue, 30 Dec 2025 19:08:20 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de004fsm3889829766b.45.2025.12.30.19.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 19:08:20 -0800 (PST)
Message-ID: <1edac691-f20c-498e-8cc4-37776469ea13@linaro.org>
Date: Wed, 31 Dec 2025 03:08:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org> <aVSIYAC3DTD3dneW@rdacayan>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aVSIYAC3DTD3dneW@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/12/2025 02:20, Richard Acayan wrote:
> On Tue, Dec 30, 2025 at 09:40:14AM +0000, Bryan O'Donoghue wrote:
>> On 30/12/2025 02:27, Richard Acayan wrote:
>>> This series adds support for empty endpoint nodes. It is currently RFC
>>> because it continues an ongoing discussion on how to selectively connect
>>> some CAMSS ports to cameras and leave others disconnected.
>>>
>>> The SDM670 patches are for a full example. If agreed on, this should
>>> expand to SoCs that have CAMSS.
> (snip)
>>
>> I don't think I am 100% understanding what the intent of this series is,
>> i.e. at a high level the problem you're aiming to solve.
>>
>> Can you elaborate a bit ?
> 
> The point is to move the graph nodes entirely to the SoC devicetree so
> the board doesn't have to redefine it. There is an explanation in patch 2,
> but the next revision can try to cut some of the rambling and also
> briefly explain in this cover.

Yeah I think I understood that part but, the bit I don't get is why you 
want to do that.

i.e. what is the objective you want to achieve with it, is it just to 
make this structural change because you think it can be done or is there 
some other endpoint (pun intended) to the change ?

---
bod


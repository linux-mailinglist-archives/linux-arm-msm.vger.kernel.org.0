Return-Path: <linux-arm-msm+bounces-36827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5CF9B9F6A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 12:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D23A28225B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 11:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAA117ADF7;
	Sat,  2 Nov 2024 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hs+apn1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D6140E50
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730547666; cv=none; b=CrBp893fuxfulrs8ExAA0H4BQsKDNwX1uIx8Zs1NaRD8arjOqNztep4rLWQUzXc8o+jWihDwPEX4JKUOr9PZcTgXGZeCmMflO6rIIzDwyK3t4lfxUBomXEFP72xe9V5GA8Yv5mkxQMUiXghdfnjQJXAcMmfdpY1l18JHmagTmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730547666; c=relaxed/simple;
	bh=GMLYsyPr4xumLfGGfYRjRM3ZXtmHZmJVFx7uijw7R9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isU1IiFttdhe4HeNPb9CwpQrPe5QbgcRpBceHgTpO9LVoW818AE4QPQrw/lAx6FNv4firLpprqXIlbrIkjCv45cpjQP0iFlA5cWp0rLl9cq+nZrRuEsdWUM6X723Mb0rHlUtOVJz6eR5SIW/3HHeXwzyadVHQJDlKut1hPpFhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hs+apn1o; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d47eff9acso1789292f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730547663; x=1731152463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMLYsyPr4xumLfGGfYRjRM3ZXtmHZmJVFx7uijw7R9Q=;
        b=hs+apn1oEkYHALiFkALDU+4DsKeI9p1q/7abUILcNjkgFniFTr+tSgxOyU7EkBxuiQ
         nIeJekaVIMMjWFC9WpmHGuTTOt8bqBeKfs2xoBRGLxXLbTSW1ajbHg3F58dMYRs9qUAW
         cd7zWeCH1jHRSttgzSTO6sytjUFaWP7ESxkEO7fkTREEPBgOtwxMf3j4NsY2n+zktI6W
         GFbS6GUZrZkdXxepPdLZr47fxWB6M+PL5NM73oO6YZb6Hf8ED1GyhQiFLstam/MtXnbr
         GIeoacV6EzrRY5dQdhNMCgYDV6LCw48MT4cnpxkedljoXKFZtvAKt3k/aexDb9w+gEGh
         FbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547663; x=1731152463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMLYsyPr4xumLfGGfYRjRM3ZXtmHZmJVFx7uijw7R9Q=;
        b=U9RH9hADVf3eLSEljWH1IVYVlEi+5FkKXHcrJubLpKbG2jk2axe9Vh6o5Qc3gC1UPg
         PKckwAHy1n4rKh+KmATwQUrmp3V3GJhDHt1rh3IdAe698m+CErf2uu1aR+US2mc23UK1
         TfR/0BUfOgQAmP24GdBpR7/CohbUYWi17th3Z5ilZSkL1HLEWqvyAbEHWggjKO6koN3o
         N8Gu2btuuWHkF5xx/Xi8WjwrqiT7M7a9UJZ49fO/nwC3VZuHw+NpIiwgY5fT73Ic936I
         LYxZ//hkm4y8FEcEJ2/IstPp+sG4ZKDdx2lwYSRpQVRlCVie7vMTrHcVCubFdmk3Cxrz
         cxSg==
X-Forwarded-Encrypted: i=1; AJvYcCVz8ZapSfHjyPYPTxWXPz71h1vIB8KkOmxZ8O6L89sIB1y2eayd8cSO0CYqySUmQ9mcQ5QLzTPp+H/UdecD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdiy7ydOjOQQeznOldll3S2LTF18Rz8BejaaAEMaMfs7SwmCk8
	w7fQ7DqLU0jYRheYOGxOYumW93nlB38UpKFom3JhQQnkLzGUWXFiuqmhNhwe1W4=
X-Google-Smtp-Source: AGHT+IHGujsdxA97CT882qkCpdMoVH8GsT1n46/t2DVN9orVppO/tTsrbNq0fjx3WgBIeTcFlLazow==
X-Received: by 2002:a05:6000:4029:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-381c7a476a8mr5356689f8f.8.1730547663353;
        Sat, 02 Nov 2024 04:41:03 -0700 (PDT)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e694sm7879785f8f.86.2024.11.02.04.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:41:02 -0700 (PDT)
Message-ID: <1d24c5a4-5059-4420-ad69-a72cceb5657a@linaro.org>
Date: Sat, 2 Nov 2024 11:41:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: camss: vfe: implement pm domain ops for
 v4.1
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
 <20241102-camss-msm8953-v2-1-837310e4541c@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241102-camss-msm8953-v2-1-837310e4541c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/11/2024 01:32, Barnabás Czémán wrote:
> have to be power on/off explicitly.

"powered on/off"

Pardon me I missed this @ v1.

Please amend.

---
bod


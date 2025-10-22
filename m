Return-Path: <linux-arm-msm+bounces-78307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A62FEBFB43B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 944984F9A92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77187322A1D;
	Wed, 22 Oct 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3HfUkcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF2E3168F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127092; cv=none; b=eKJRLfBuDbdy1AlXizC8H0vg7kpOBE6MdNAifWCzShY8pJxq0qiFt8NJAD8gDQIzPrBJ2tlCR49v7DvlBQvQiBQK5rgnHIFxFZEOQIkzoUawCs89/fgVBq0j7VqUQinz683+/op16hTNCRQt1dWczgi2bzuxYBMY9M8XJT8pb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127092; c=relaxed/simple;
	bh=iCmVveW8K5itPlbSWwTOzhiHZIezfFCVearssnUweJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LuMPuFv0mFYk9oM6HQStheuoTFKbwnit2TaeqjThh3pVYywbnszDbrF76oU8YsM/tyNQJ7zFV/fxu7KbZ3IP+oaWEYOa1i79G+UhacSzjs9PK4dfO7pKYKZb+UPnjtojHUdMlQXSPbUHEDESO+PqFJ76SNHRGHMhTAM8CPF7jJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3HfUkcl; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6ceb3b68feso137786a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761127087; x=1761731887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tVActZ1pq3qGxGgqPiqLHf62BgsT71eBUBtJsDoDR9w=;
        b=k3HfUkclhG1vmrZhEWR2EqeDhV0LKpTiUj4Q0WUqSE7XJY+ZfZA/SqouPQDC4HzsmP
         iilKt3wPVgbzpHTF9GiQKZDBnhbB59tnxQV7IEo05EwXvftT+sWzpg97jyLloTgk6ktL
         5viFKX/mpjK4kWqbPD5EdZP2CUXnL3EHDnztsa3W41ZCa2Sz5RNIUpm0oR/LkbxNrRJo
         FlR4Rlw/oUqWAdUtDiuZdkuApNT+Pb9K9vq3/z7Sm+gxrLorT2QIgwmR8vFM448y9Bx5
         LgzKqLlH4taMZqnVM+kpruKovTs2kypl3l6fpcGWm+wnSMmq4mJ/ARao9JR+DIb6Mp0y
         7sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127087; x=1761731887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVActZ1pq3qGxGgqPiqLHf62BgsT71eBUBtJsDoDR9w=;
        b=D6wgcxkg1SkQD0ZA9dKyUSvXOCbWCh/ZbrJkmv/Gd3U11Vx5DZ28on159q/zQhR8T1
         TO5GP9IdVQFqBAKgNIJvfi1xhJ8bA6XWtcRSHGhCq2rGoYrFgNzYaynvEZdrXMkBYQWP
         aVfpUCGUtlvwDndBYuN+/nVLe3BWjA86YzQzCJkrhc+O58Xg8A0JxJCAUcgGCwVuiaHh
         9HhkG/Ilf/ZrtxHc6JkduxGeX4nTAvHGbAMNDtvYacFWwS28lDEZmuj3IZqE4CMwfoRr
         BM4VLrm35xxc4pO/Sf/aHtEoeSSR9Yz+lvA36f+J0xXj2At8E9WWLZ8wV0LUDhboDuc5
         NZDw==
X-Forwarded-Encrypted: i=1; AJvYcCVEszzby7In90utdwUdaF6TkQ07lEoMuNXQZ4s3BYLtELDaU9tkNqBmpfZqkZFQQ+xBptUssPxxA9MWwIUv@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWu4gb6KwjXTttN/HUz4VsqGKx5z2VcGSo9srQHM/WW7Q9rEc
	139Si8QqMeIp9wg5aUYR9Q3uCGN0yxYL8WMl28GWnJvafhOn+locSfD2
X-Gm-Gg: ASbGnctMn01qQfvaz94vObJ1dOXx5ZcmiQlWP35svpug1NIEegZUEB41f0U0+7WCX6L
	GRA6K1J8Bw+O9+si6Qu/aW29S29RLPXAvklXG2fcqRiLhCZZrzEj2t4e+P4Tq6N8kHV7NQUbvqU
	UBs8NtijaFoe3hU1/uCKvBH0d+a1F5rW6wy7wf6btW9AgWV2uByWNdhzyEgCERurbf5ntIsKVVf
	n4HYUoGhmM1Cip4NavljnNE+hvAYI+1AvvbZXweqZBMCWEiJSswB1Ekx6Ftda99pgwlpRWBJ1pj
	oMftSJRyp/VFZquaBVZjK58hqen7iQx4h+FTAHmgcldA5E/nm9GEpu3KeCjAnZiGLvZ08pE/Kso
	7HPfap9M3yZO7kB85RxkxL/XnzjWockxosjv+if/qCtC4SyWwqWWtXfwlnml5ApESMxdKL42pIQ
	6XadOKvj79/m9eqsvtuLvNM+4=
X-Google-Smtp-Source: AGHT+IFV4XcWduAnqV52GPPuakAlxK8oM1cbQ3QP6ivAnR1Ti0B1TTwmp6oM3qqQPkoCo7w4j7H50Q==
X-Received: by 2002:a17:902:ce90:b0:269:7840:de24 with SMTP id d9443c01a7336-2935e0f97d8mr9472685ad.21.1761127087202;
        Wed, 22 Oct 2025 02:58:07 -0700 (PDT)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dfaacsm2086905a91.10.2025.10.22.02.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:58:06 -0700 (PDT)
Message-ID: <c6bdfbc6-d9f9-4039-8b05-5f734010e3d6@gmail.com>
Date: Wed, 22 Oct 2025 15:28:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Add QCS615 Talos EVK SMARC
 platform
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014120223.1914790-1-tessolveupstream@gmail.com>
 <20251014120223.1914790-2-tessolveupstream@gmail.com>
 <d145f298-83ac-4829-8302-501c7ad97b8f@kernel.org>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <d145f298-83ac-4829-8302-501c7ad97b8f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/10/25 10:43, Krzysztof Kozlowski wrote:
> On 14/10/2025 14:02, Sudarshan Shetty wrote:
>> Add binding support for the QCS615-based Talos EVK SMARC platform.
>>
> 
> Nothing here nor in DTS commit tells me who made talos evk. Please use
> full names of products, e.g. "Samsung Talos EVK SMARC".

Thanks for the feedback!
Sure will update in v4 patch.
> 
> 
> Best regards,
> Krzysztof



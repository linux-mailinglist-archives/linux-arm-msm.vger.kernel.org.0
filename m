Return-Path: <linux-arm-msm+bounces-59258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AAEAC2A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9FA1B68230
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707ED29ACCA;
	Fri, 23 May 2025 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="QOM9uUV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D7729AB02
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026724; cv=none; b=S3zsm2mqxbO5bnsNVlDDhGO6OfagkmecIaJhc95CwnTn+Zbpfqn2xBy+Sn0rGy2yOuhb64qqaS4P/kmcyUclxs0IhXXtHLcJYd9js5suBn5GHZdQdATXuFcqBbAdAiWYGeqAevgFPKNLBml0rhTnZ6xYZV1Nvm6bS7oU66TwZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026724; c=relaxed/simple;
	bh=LPX11ulev6vsiZzUTJlFx9XAlmtcK4qqUesuzNzoNS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBAjjSkzo6bJGyv0IB9+CbIlEHOahXDZZFDpXzyCQgpgqIA3/7MGOnI3BjQxGwHU1EDm8GL4j3ioMPoVJhNNzC7qKpsj5+2zfWSUMaMtrMM8jfPwx7AsYygsjEbK1oKPAyFd6U2yQDhCSSYml0GniFqgu9EvIS2ebKTR9Jz/rrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=QOM9uUV0; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3dc978d5265so1148655ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1748026721; x=1748631521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9H9/06xSR/EO0urvzhakeUTOG7Si+ArWVJ43pvHHEg=;
        b=QOM9uUV0WD6CeftzAAzSAKvQq0AIicTQCFjBmWcx4Sf+gPalBml8w+AgauJlZQX03Z
         2iJ68gYGsEdOjyeQ1zsvYTxLcxBWSNSpdfRjIIBedIMBeEko0h6NWCVDxuwAys3rFGgk
         AGTh6dxiQpQDGPLZhYBnZk/QeiakHx5VZQ+vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748026721; x=1748631521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9H9/06xSR/EO0urvzhakeUTOG7Si+ArWVJ43pvHHEg=;
        b=TFxx3VA9Az4CZrwVtapBjItpHuiMts/gZfzryDQ916xzJDlU6OYu47s6IWNtDHRZIq
         LEhjipu0+4T3vrOri1CFkeih3J/9BHTO5g7NB25/3/64CBjIX7Ebok3+bxmKvf3rkGJ6
         L0lyASGn+7z13Q6GhUCoPxt7LWSjDUFCO+LNjjvCLOVlUT4uLwGoO+ziE4oV0zR76hat
         Qc2QBJXQGwgha9R2F2xXapkvWVc2oGnJZAD3Sed1lfoOigWCOZP+/WimZhUBoBTZthxn
         49qKJbzA1wfz+J53tHrGegxX9zjNSf8icUppm6YFUJR2Q17IltbA15oOpmFNM4YwiQ52
         Q4eg==
X-Gm-Message-State: AOJu0YyrWtvyVNuVspDsU8hfU+qrUTBllMB+TSx119lNRxCdCS1kJVeT
	6MluFTWYZNwS7hb/yRDmU47SSm5neYxHonauKkAcSPlQcBu3Njjs3SEHKF5NNreIhg==
X-Gm-Gg: ASbGnctE8qYs+tZ1mAv78zJizK6bfDXYh6k0RS4vraXSTJnm+o4WCyCMAQZKCSgoaeC
	45nFxnKd4vWr2EGiwE6QpOMMoE3DrtzOQtAEq0uzVNhYpGYTlBbCjMasCxmuxipAEaDWGkEVaJc
	GETmxHk5SaJiLfefJySQu6eqmw/L9dY6tZCOxYRCdmTNjKtQ2zdq/DkrXgIGI/sTBHrqI6pyawI
	+8emA/J1jLglV/sWqyWYM70u9fe31RocDPAIg5ro0jL5YvMVpSjs8kRRJ68rR7KHdqbYSh3oQbe
	+/YOA/Itz89SSLIinFA0DcTxh9FoheY9JpFFMTDW3JiTx3aTML4pD7AyYgwJnZwIha4NeGZwT02
	DcYiCaEI2Ow==
X-Google-Smtp-Source: AGHT+IGg84kIi0IDmJ6WLUU9PxQzn/IS+LAqvSr+ETXvi6WXzqyA+Lt8CEs5YfPUjKQBchbbqZ6n2g==
X-Received: by 2002:a05:6e02:3802:b0:3dc:90fc:282d with SMTP id e9e14a558f8ab-3dc9b6e5684mr2325875ab.16.1748026721187;
        Fri, 23 May 2025 11:58:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4fbcc48c8c1sm3769482173.90.2025.05.23.11.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:58:40 -0700 (PDT)
Message-ID: <a47ceee1-6530-4f3d-971e-450069ede557@ieee.org>
Date: Fri, 23 May 2025 13:58:38 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wojciech Slenska <wojciech.slenska@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
 <7d33eed7-92ba-4cbb-89b0-9b7e894f1c94@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <7d33eed7-92ba-4cbb-89b0-9b7e894f1c94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 7:25 AM, Konrad Dybcio wrote:
> On 20.12.2024 8:35 AM, Wojciech Slenska wrote:
>> Document that ipa on qcm2290 uses version 4.2, the same
>> as sc7180.
>>
>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>> ---
> 
> FWIW this needs some more work on the Linux side, the IPA driver
> currently hardcodes a reference to IMEM, which has a different
> base between these two SoCs.

Everything currently assumes the IPA version dictates many things.
That works, so far.  But a lot of these fixed/hard-coded definitions
(per version) could be changed for specific implementations--they
just haven't needed to be.

> The IMEM region doesn't seem to be used as of current, but things
> will explode the second it is.
> 
> A long overdue update would be to make the IPA driver consume
> a syscon/memory-region-like property pointing to IMEM (or a slice
> of it, maybe Alex knows what it was supposed to be used for).

Yes, we talked about this last year, or the year before.

Konrad's patches to put this in DT is the right solution.
It doesn't matter that it's six months later.  I really
appreciate the improvement.

					-Alex

> 
> Konrad



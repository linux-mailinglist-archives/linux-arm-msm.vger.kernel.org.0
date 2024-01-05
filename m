Return-Path: <linux-arm-msm+bounces-6524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6148256DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 16:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57959B22F75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A57E2E829;
	Fri,  5 Jan 2024 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUx1MEJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACAE2E646
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ba9f24acf8so66215339f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 07:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704469357; x=1705074157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kocgKItC0IS/okz56zDc8wgSz4UA+wBZm5HvX6FvXg=;
        b=jUx1MEJ7aYTI/or7cNTWjW4jEBAMHpAaUvmh72G9oW0DB8W6WOQL8XsCSgVQ1WMQuD
         sLqfoaF6dGrcExblRvd63IQMA/yaY2r+pmaJM1Yp+cIpSM+SA316ETrBjJqhkfyyfWKN
         vHmB9NHEODu4GvYIY7PbEEh0XVv6MZ4NC7FsXW+kkxfUSD6+hl9qUX/81ZYCCpV9OSOV
         pfXDDvdAfCh4oT78xcG4BZ5NKvryV/VwJUu0if2fELzcX7MrwNv+37Ex8Arj6Ny1L2zd
         n5tWghvbf9mHzIrNIKJXNFSRtPOM8BsVe1+n2tNTVbaLhSYe73LHPkHxqlTqn5YvZpLw
         lBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704469357; x=1705074157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kocgKItC0IS/okz56zDc8wgSz4UA+wBZm5HvX6FvXg=;
        b=azqfUb24nHgAqJ8O/hoN2T+muniY+JIxXiFLVcqdYRmvdplr251KOcZgW2ShB7QgtU
         jFrI0IFrNELdxtAdWwtYHIAyPNoHPSr6W+CDwygY31PUDTMnC7bvpD7bqxNynbRoHbHT
         s8f2fHfblyC7Day5NIZybHLAMJACbKQZ8GNm7rmT1gN2T9WvPWhwXhUXljPCCpm5db/9
         jKXwU2KUBxWf60GPxbrp6x6yVSr5E0nXblUDNGAv6PSr0EQ5lGAO81Yecj5PJftSHS7/
         96P10pxtJw6u1Jg2mgKl/bA/OlhZmtNnTE/uUJWgyMvgVsFVafdFNPXMvXAM4ZBW/CnW
         7LPw==
X-Gm-Message-State: AOJu0YwxqJ1CX5FEq3nSh1CW3u3UZrYC850oRS8tjM0VRHehBYfQP1UU
	QurcpcC86+7cveOhVSbeK6ABhZWNulfrTw==
X-Google-Smtp-Source: AGHT+IGZd+fCU9GJbpAEXew+kwHNd4/2wjUkByI0dHgw17PGMaF+Rvf1B2B2yeQj09uSXoaeWp2oFw==
X-Received: by 2002:a05:6602:e48:b0:7bc:1437:ba0d with SMTP id gq8-20020a0566020e4800b007bc1437ba0dmr740378iob.13.1704469354695;
        Fri, 05 Jan 2024 07:42:34 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id 25-20020a5ea519000000b007b42bf452f4sm462064iog.33.2024.01.05.07.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 07:42:34 -0800 (PST)
Message-ID: <84a06035-ed88-408e-9441-d36de9fbd5ad@linaro.org>
Date: Fri, 5 Jan 2024 09:42:32 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] support ipq5332 platform
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Jie Luo <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 hkallweit1@gmail.com, linux@armlinux.org.uk, robert.marko@sartura.hr,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231225084424.30986-1-quic_luoj@quicinc.com>
 <a6a50fb6-871f-424c-a146-12b2628b8b64@gmail.com>
 <cfb04c82-3cc3-49f6-9a8a-1f6d1a22df40@quicinc.com>
 <dd05a599-247a-4516-8ad3-7550ceea99f7@gmail.com>
 <8ef607b9-1fc6-485b-a6fb-a8d468cc1954@lunn.ch>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <8ef607b9-1fc6-485b-a6fb-a8d468cc1954@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/24 7:52 AM, Andrew Lunn wrote:
> On Fri, Jan 05, 2024 at 04:48:31AM +0200, Sergey Ryazanov wrote:
>> Hi Luo,
>>
>> thank you for explaining the case in such details. I also have checked the
>> related DTSs in the Linaro repository to be more familiar with the I/O mem
>> layout. Specifically I checked these two, hope they are relevant to the
>> discussion:
>> https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4.r3/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4.r3/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>
>> Please find my comments below.
> 
> Hi Sergey
> 
> There is a second thread going on, focused around the quad PHY. See:
> 
> https://lore.kernel.org/netdev/60b9081c-76fa-4122-b7ae-5c3dcf7229f9@lunn.ch/
> 
> Since it is very hard to get consistent information out of Luo, he has
> annoyed nearly all the PHY maintainers and all the DT maintainers, i'm
> going back to baby steps, focusing on just the quad pure PHY, and
> trying to get that understood and correctly described in DT.
> 
> However, does Linaro have any interest in just taking over this work,
> or mentoring Luo?

I will reach out to Qualcomm to discuss options here.  We can
certainly offer to mentor, and I think we might even be able to
take over the work.  But I won't be able to get any resolution
on this until next week.

Jie Luo, please hold off on further posts on this for a little
while.

I will report back once I've been able to discuss this with
folks at Qualcomm.

					-Alex



> 
> 	  Andrew
> 



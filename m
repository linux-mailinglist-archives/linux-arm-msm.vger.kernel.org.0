Return-Path: <linux-arm-msm+bounces-84268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A0CA2075
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 01:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36509300F184
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 00:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2683A1684B4;
	Thu,  4 Dec 2025 00:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StwBcJGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E412CDBE
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 00:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807602; cv=none; b=Px0kKavF6JL84N9fNtDupI0cADaFen/mVo80Q0qCIsog0zFt8ps3JuxxuZFEkljwaS8cvqdDPZxI1ZnL92+yz2hoUM/uFCpkvXcR39Fyc2fnJjt5dcemIOoQ0g/2RookSOUFxeokWSc0kzCaOn693n+/HAHzBKZrbex0FnHnV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807602; c=relaxed/simple;
	bh=W8JDpJ0cszJ31H/pDOqCniqWJfMlgyzvY+vNNyzFof0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIAFI5OQmPXVvGcvuEmr2NexsT/iR9k0Rw0GQd5ldTl/MbbS/bvlZeIGjX27Q4hEJoLUwLdZMXt4xwThbNrcJfWzVw9uOF4jcF2GQLpQzp8DzXLmOrSNtZGE9ho45OIuv6UP3BaDU52zWDp7kwxe0gc7iseq9rtL+lkUtmUWEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StwBcJGL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779d47be12so2825045e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764807598; x=1765412398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sy/9CGo8NUcxokw+wp92Xk3pkZwIb1w5SdSGUoemftk=;
        b=StwBcJGLcJfxTssaWb8uykX/xbNE8K89oLTIURWcXQswGIujc+q9L7GDbTeunhGmq/
         LBF/LmqaIkHhSQKSUPUVxe4cKnbs2EZvPYKikUjehxJoKYxZHim0cofRSvIc8NHMcu/s
         UhLlYJ6IN3zRbWIOw2vMiX21NULxRNnUiKkzTYFurXir/b9WoiXv1Q9Vyr2mpG8zaBeL
         FrwoCw72h2ucp/cBrLQJf7KBekH32J1IwAVFuYjc32hxOWQoSf2ojQ0L1YS0L6iUosPW
         5wXk0/BvsO1CjGWAI1StK6IuJWJOJk2jR0t/HMHUNJNDpxO13bodEXI5BR0Q1QayNblD
         +QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764807598; x=1765412398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy/9CGo8NUcxokw+wp92Xk3pkZwIb1w5SdSGUoemftk=;
        b=SSHBBLIsXu4LocfNa8ZQnYAcjK3juRgsoqX7fgiZHlbGrrQRHho3N1qFwqil+EwJpH
         LC2nlb8N/2WANN11bGybJSA/yefrC1l4/KhAHKtYa2woLJsW90GTKwTcZwOBtJU3kVS3
         gtUURGl0uGCmRrGyz5mYHTqgu+swqpEs0ff3sD/jXfJCGrtGC3/23XmNHrgdNueO2EZ4
         8z3Qi/dx5Hw8mHQytnuIPrsiiq2wd1Nogm/VzgaLh4M4mIiwj4t01g6cWorD+vRvNrrf
         VSpeT92kkFEoQ6B+rnpl4121veu+zkmeRpp0PIFvpxxSbhUefE7y3LXmn64rdOcM4GHe
         uBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV93zYkFFVgqMomSgvX210IEnN6aTGQSX8i0kP/15gI6ofJNwA09/8+Xt98XzVMZUb9WagwuiAOUG56bZNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdthyr4sjRiD+Ho3WJvZmbdCvydRQ+uOXSArT129gF6rWTcgsp
	oIoONB2GlYYXqygc8iBpXyELWMjge/T0RZh5ByN+ly3g8K0pQ6Vm9vdTck3T2j8K088=
X-Gm-Gg: ASbGncsEGmi+/bnr1pXV3NCygKYXRl1n9pGLuLxS5WLc3qI/GuzBTW0eTcPS+aaqATh
	tvnc9O+hKVEWf0OYgB9+IG+1ILZKkfEh0rdsxFIf+JXGCgze9SDevl/G6wjo+vTxjD7XX/NIuio
	lyjrxyRJKkFBqHGmeaUCntmqihsd1JLTrpTfZ94JCPWLB3qJgbky8tN1bTlIEW9YkH9IiDQc73s
	3jyzuZ+kR6TMzKikwjeEHqcSwTeR7/UlWkz6ZOJNRnw0UONWGYqJeEsl02mAtel1Nf99iD34Zy7
	PAhOFTUMRDExx4X8l/GPIDV0Q5AjsWJqUuKq4Motx7AWE3XMQlfgA4sbCDuidsAUqwpuSn0RI0E
	VodoF7cqrwU9S4mCaNtQSzvX8b3MugW5yw/8alVw7Jvr1m2ZHI176azkeCGO3oBObsbFMUlrLHk
	emuePszKGzfViIdYI+PaGRb6ItynRqXUX29IjIwTxQMRrPNhg8s/KA
X-Google-Smtp-Source: AGHT+IGctIUBDJ4B++ZPZwfzieuoC6rE0jEla7NQRIEMiwCpYVYx+DGWozaw5tUyDHsHwHr4Gj1ARQ==
X-Received: by 2002:a05:600c:190d:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-4792af43c8amr45511535e9.35.1764807598460;
        Wed, 03 Dec 2025 16:19:58 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930d70806sm2382045e9.13.2025.12.03.16.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:19:57 -0800 (PST)
Message-ID: <65414d04-3db9-4dc2-bf1c-1e260713b818@linaro.org>
Date: Thu, 4 Dec 2025 00:19:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Andi Shyti <andi.shyti@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
 <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
 <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>
 <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2025 16:57, Andi Shyti wrote:
> Hi,
> 
> On Mon, Dec 01, 2025 at 06:18:51PM +0100, Konrad Dybcio wrote:
>> On 12/1/25 3:48 PM, Vijay Kumar Tumati wrote:
>>>
>>> On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
>>>> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
>>>>> The current value of '0xb0' that represents the offset to the status
>>>>> registers within the common registers of the CSIPHY has been changed on
>>>>> the newer SOCs and it requires generalizing the macro using a new
>>>>> variable 'common_status_offset'. This variable is initialized in the
>>>>> csiphy_init() function.
>>>> "offset" + "common_status_offset" is confusing
>>>>
>>>> Let's maybe add some platform data where we store the actual offset of
>>>> the registers in question and pass a csiphy ptr as an argument
>>>>
>>>> Konrad
>>> Hi Konrad, may be I didn't follow correctly. This is consistent with the way we maintain the other SOC specific reg offsets / data in the CSIPHY driver, in csiphy_device_regs, isn't it? I seem to think it's clearer this way for the reader to see all the offsets at one place. No? Thanks.
>>
>> I thought this driver was a little more complex.. anyway, big
>> changes that will make this prettier are coming so this works too in
>> the meantime
> 
> After this short discussion, in order to get it in, can someone
> from Qualcomm ack/r-b it?
> 
> Thanks,
> Andi

I'll pick it up per nomal.

---
bod


Return-Path: <linux-arm-msm+bounces-28778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94519544A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3B91C21C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3316137923;
	Fri, 16 Aug 2024 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSiksUgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B02137903
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797725; cv=none; b=aSugsDpiLt5DtZhGijY0pwFFAZbeG26MqlGPaUjUcllQaiquLSl9aYyRanc7L/3DFrScFhJeVEJXsraUpbhU7p69TFF1rpJyBsec4KvkDfSwhqoOZFADk4qYafmqLm4NPQSb+E+zSyZWd9jwhRQmW7Z6DVMT84mXrDrvUwGPxe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797725; c=relaxed/simple;
	bh=n3daW060BpIkPDc5xEPApFykExBPhBzv1Hym9HGuIz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFnbhh2ifV45XkZXzZvX7aWj/Li39Okj3fBpqXbx+f4iVC0miKdI1roJ0nDwn//vBVbIXbG83aYwa6tCj9UAQfe+bA09T2a3YkKWstS7gUZcrq/vUDEBqR+amKXx22Eqt0Itj9Cuyfzu4vJSIzE5/2+j8xlMXjGuxMgtC1JIyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSiksUgY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37195f88a17so237249f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723797722; x=1724402522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rlzzuztbI3K2OQhNHN1fIvbR/jGvneqxORdTY6Xrev0=;
        b=MSiksUgYD1CQVxT4tsPCSx2DuzvVjXvGB2BPeo0jK5D+WMA+oTL/zkMz4sfHdYZTil
         frvrG1K9bwQr6QR8XAHyGAH/bdN0ZrGTXn7aXXxkgHjtOA5zp75b3Atng4wNN1TbfwLX
         OOcOSUSkc2C287IChpyQjCC2PFSrJG2xpiOxU9K9XgoCE1PqJbqQwL0ADw33kAiADoRZ
         OvedpkZRDMMzJbCy5SItMTz+bisC3KXN2U7/GPvmJ7QZBn49MnvZeQThjqzCS4vdHSiW
         tBbuMKG/RPomH5Z8AIOjTrvIYm78iMGwO1skPb1KJfoRfoap1YiyEJsQ+tAKFvSU6i0i
         42kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723797722; x=1724402522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlzzuztbI3K2OQhNHN1fIvbR/jGvneqxORdTY6Xrev0=;
        b=Tvi8VAj7QfQcn6FsS7CTO1C64eKR1d1x3df/MGZ6mq13bGCKoQ12DdFJif/HDO0Vj1
         EbjD4aZjArR89yk7lnbM+KYY3Aagwe7qf9b6bkHxYM5mgbcHUhnWPk8ezhMH+VMnznXv
         AsJicGZxkYbyy7D7t7FKeeNiiPhVPzU8rzqiL3iohJ9UuLUVXRiNhrYCdtZAxKkw2g0o
         Ck2higXDSRdLkY17k8VQoIaBg2E3myfzHEYdg3FuGKh8b/gcyvP9tQkfh6diJb/3tW0D
         r3P2/7iaPF6ZmhwZzbKwTQWvGzfLrbiFnPzJbStnXS3wViE9JdlJ5w3zng7kZIunzKZ7
         XMiw==
X-Forwarded-Encrypted: i=1; AJvYcCWUlzyd8ZU2nhuDOiKiVSI5TEopljphP9mfKk0DrcjBvqMaMIGrfd4H3k1l12ogW1heV9rg37uc7nuNe08MmdZG2F1lefdySNPu5BeW2g==
X-Gm-Message-State: AOJu0Yy9EGL2O5/qzk/9WFy0jYyd14RK++AwAYXi6IXDHgYnY9Z3gxcw
	Dt7UwmqG592HCQ83qdObExa+iz5PaeowYLLgAQbymb8xsMwpRIwVGS0nWYtDLfg=
X-Google-Smtp-Source: AGHT+IEy8yvFXp+IjacthXXmn/Kmsb3ujjbsLWxgTsBUVj7E2AWFCDp5KVyRKOOyF0dx/M+3nH3AEg==
X-Received: by 2002:adf:e60c:0:b0:368:4b3a:2022 with SMTP id ffacd0b85a97d-37194317348mr1183834f8f.6.1723797721931;
        Fri, 16 Aug 2024 01:42:01 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed6507c4sm16946095e9.15.2024.08.16.01.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:42:01 -0700 (PDT)
Message-ID: <7fd85a5d-125c-4d52-bc86-94d98db6de7b@linaro.org>
Date: Fri, 16 Aug 2024 09:42:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error path
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sukrut Bellary <sukrut.bellary@linux.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
 <168656748193.162074.17313550564907901438.b4-ty@linaro.org>
 <a301b77e-b833-482e-afa1-5306bd8fc8e7@stanley.mountain>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <a301b77e-b833-482e-afa1-5306bd8fc8e7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2024 10:25, Dan Carpenter wrote:
> On Mon, Jun 12, 2023 at 11:58:01AM +0100, Srinivas Kandagatla wrote:
>>
>> On Fri, 02 Jun 2023 04:36:02 -0700, Sukrut Bellary wrote:
>>> smatch warning:
>>> drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
>>>
>>> In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
>>> fastrpc_req_munmap_impl() if unmap is successful.
>>>
>>> But in the end, there is an unconditional call to fastrpc_buf_free().
>>> So the above case triggers the double free of fastrpc buf.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] misc: fastrpc: Fix double free of 'buf' in error path
>>        commit: 5b3006fffce89706a12741d7f657869ca2be1640
>>
> 
> This patch wasn't actually applied.  I'm not sure what went wrong.

Am not sure either, its now applied!

thanks for checking this.

--srini
> 
> regards,
> dan carpenter
> 


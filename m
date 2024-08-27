Return-Path: <linux-arm-msm+bounces-29568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A78829605BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 11:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3238C1F239FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 09:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1658F13BAE4;
	Tue, 27 Aug 2024 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLv8mbeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21064149E0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751416; cv=none; b=GP65NkzzonNIPkjsje7u2/3OZEZ1RptaR1MmMR+8pak1dUNSt0aMpX0StlcN6Hp1lH97boYXUOrvON0n9xtID4R9IfGjc9yypSrgk5fiMUDmpEfmVukZPHdgKDk91KICEbbcwuFKZE4dZmMt1c4vca3B5zx3iax3qK2RJxAb4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751416; c=relaxed/simple;
	bh=X9O+EYBPhG0oPp9gn2NEJ2N9MNjQHqi4I2lEEvzDuPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQBnnzLAGPU5ebrvvN/Dooq1Ka6zEWXPuUXLxEglQe7DAZPHIWkfztRej76ekp73lwTrgw1KM6XkSqqayknGbLbYMZfvC9HKLMbA9ckWLOG8EC7VAV5YFzJRzJzJDEtzaMs3Ka+vAa0908RBYUTR7+6QnU2ogZEK/ImGBHgXYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLv8mbeo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42802e90140so3400675e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724751412; x=1725356212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M4PoEhpT/1Y6hj7d27Ubo4PU4N3vsMKBCO+obqQicug=;
        b=lLv8mbeoqdmmFBv8uR9hS5skfyavMp+VkIuo1qTQbreIkDte+e7Q5Gg9MtBR0HDr7A
         gINpyGEMOLm7PGoElMw75b2ffijz5NI/kYCYukRP9Mrg+JgsOk2TB59e68wzFQaCeLK8
         hdlF0lDPgZ/Jaovl06Cy0hq5adEvOhSU/+1ZHyjDp2TrIGt9AHqBEqhfD03FSq8OvK5p
         KFexYoB1vNxP25ZkLu0vVqSi3DPG+3KltMObjzlsAb84MrGoMx5O2sv0tHGlrXAtnFjV
         sAJozjz31d2LsGh6zL9DwXb2qRjVBo3PCmD+KfnAFdW1TuU4KHEAxYKXk82GkgsJqis6
         W9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724751412; x=1725356212;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4PoEhpT/1Y6hj7d27Ubo4PU4N3vsMKBCO+obqQicug=;
        b=cy/jQyUGQupwA8P1udByxlQqT2goYIXKZ+RibQA7/MTI0Jc8LIYqrZfcbVcS45/7Gi
         9ajEPIJn5IWLq5nEEZ6eSeGchmh2A1nID/axpSToNlEimEGBdlvciQDxFiL8TI/9uvwL
         BUEb4G1jEZzgNR6m+uCGOu0gjbqolNPrdlBxjpxyDi16+2qvzqjh6hPtE0EEN2/9gxZ+
         g6J/M3bzyL9sA9x57Gls3HkZP+prK9xvOcW2JPqY8j/CSoooz9L3eCzS9f1agJ+kmCHU
         7HBlPaj24Pw9+HiCdcH0+raT+O3SWqKEZ1HOOtoOoov9ADOGrluKFxLfMD14B2mzmZDO
         PH7A==
X-Forwarded-Encrypted: i=1; AJvYcCXU0BBRNlc5ZAQdbC2HGtRvKWznffT76A4BpPKcbBDfDGMGRstRjElLvpQ7bJsw+oM8tK0MhVTbISBwsal/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FnBFRXhpWOABz2DYnFK4Rbt3CFyYmZ8HYD34cgUq2LfLB9Ve
	yge0i+XYffJQCZxuEjwXE3hpH0v9oNRUIamizKHutf/4wpWQBEW33fz8CcWAffo=
X-Google-Smtp-Source: AGHT+IHhU4n7XJX4hzth7pnaIq3GZK+7CE/UqwPlLuVNRXMquJGOS+sHoUFb4pe+02lyEzmmhouFzw==
X-Received: by 2002:a05:600c:3c99:b0:426:668f:5ed7 with SMTP id 5b1f17b1804b1-42acc8dd868mr58502275e9.2.1724751412223;
        Tue, 27 Aug 2024 02:36:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee86d5esm211917745e9.15.2024.08.27.02.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 02:36:51 -0700 (PDT)
Message-ID: <c9f11ee1-382b-4742-b558-c2b0801d8669@linaro.org>
Date: Tue, 27 Aug 2024 11:36:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] usb: dwc3: various cleanups
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240827015935.bzv6nevcd7ec2uu2@synopsys.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240827015935.bzv6nevcd7ec2uu2@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 03:59, Thinh Nguyen wrote:
> Hi Krzysztof,
> 
> On Wed, Aug 14, 2024, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> The first ST patch depends on my fix:
>> https://urldefense.com/v3/__https://lore.kernel.org/all/20240814093957.37940-2-krzysztof.kozlowski@linaro.org/__;!!A4F2R9G_pg!eFzt54pYSEl8wrvrH7yQSwFRzbojnRSyelnYjxlY8RZaU6oZCVeui2f-DHQ0bk8Fdy6gvJoSWLeAPz2w_3F9ownOFLGUoyHd$ 
>>
>> Series makes some code simplifications and cleanups.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (11):
>>       usb: dwc3: st: use scoped device node handling to simplify error paths
>>       usb: dwc3: st: simplify with dev_err_probe
>>       usb: dwc3: st: simplify pdev->dev usage
>>       usb: dwc3: imx8mp: simplify with devm_clk_get_enabled
>>       usb: dwc3: imx8mp: simplify with dev_err_probe
>>       usb: dwc3: imx8mp: use scoped device node handling to simplify error paths
>>       usb: dwc3: qcom: use scoped device node handling to simplify error paths
>>       usb: dwc3: qcom: simplify with devm_platform_ioremap_resource
>>       usb: dwc3: rtk: use scoped device node handling to simplify error paths
>>       usb: dwc3: rtk: return directly and simplify with devm_platform_ioremap_resource
>>       usb: dwc3: xilinx: simplify with dev_err_probe
>>
>>  drivers/usb/dwc3/dwc3-imx8mp.c | 66 ++++++++++++------------------------------
>>  drivers/usb/dwc3/dwc3-qcom.c   | 16 ++++------
>>  drivers/usb/dwc3/dwc3-rtk.c    | 52 ++++++++++-----------------------
>>  drivers/usb/dwc3/dwc3-st.c     | 38 +++++++++++-------------
>>  drivers/usb/dwc3/dwc3-xilinx.c |  7 ++---
>>  5 files changed, 58 insertions(+), 121 deletions(-)
>> ---
>> base-commit: 64b429eaf21be888cc83e9013e25897d5fb03a75
>> change-id: 20240814-b4-cleanup-h-of-node-put-usb-93fadfc77d33
>>
>> Best regards,
>> -- 
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
> 
> Thanks for the cleanup!
> 
> I wish the mixed declarations in between statements for some of the
> scoped device node handling can be changed. Bugs me a little with how
> I'm used to parse the old standard with my eyes, but it's not a big
> issue.

Maybe this will be helpful:


https://lore.kernel.org/all/CAHk-=wicfvWPuRVDG5R1mZSxD8Xg=-0nLOiHay2T_UJ0yDX42g@mail.gmail.com/

https://lore.kernel.org/all/CAHk-=wgRHiV5VSxtfXA4S6aLUmcQYEuB67u3BJPJPtuESs1JyA@mail.gmail.com/

https://lore.kernel.org/all/CAHk-=whvOGL3aNhtps0YksGtzvaob_bvZpbaTcVEqGwNMxB6xg@mail.gmail.com/

and finally it will reach documentation (although it focuses on
unwinding process to be specific - "When the unwind order ..."):
https://lore.kernel.org/all/171175585714.2192972.12661675876300167762.stgit@dwillia2-xfh.jf.intel.com/

Best regards,
Krzysztof



Return-Path: <linux-arm-msm+bounces-31193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15F970104
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 10:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A25E1C21C5C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 08:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716FF14C59C;
	Sat,  7 Sep 2024 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHlTNK0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29E14A0A8;
	Sat,  7 Sep 2024 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698947; cv=none; b=DrxR9I38/JenPnho4QK7gBhyp+Dr52Kfr7Ow53j9Omwm7ylxYlElEjy8zBgeASy2n1mBcMfFBZxhB9/0iU7nC31escs1amaZZZT0mhIgfeuSFgG7bPxV1cdNLk28AqB/QuNV9rX/EpHlpm4EfaGOwuiwpAgJy/IRozXHdNImLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698947; c=relaxed/simple;
	bh=GsoRJJo2DovteJwgux5pAslpP9M+k1P5bnIdIwLRxiY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j2bH3Bjv8qtgNS8c34s5tYdsjIqiiPqsc9mRxK6KLWXj9yt9nWTQSlVHQ8tSj3TKARZ9bzzCU660BuMtvCIP/amb6ILPmcAdCA/khRUskjbNJgmmXqIyC1IbhxouU1du2KwXSwRcxX/UDAw39kgzFq8FRD/ssXZlNF7FbxjRLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHlTNK0d; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d5119d6fedso1502679a12.0;
        Sat, 07 Sep 2024 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725698945; x=1726303745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BH4+XkdgytSrJblSRrneWrEK0xYxzEsMEgsFyL/DakE=;
        b=VHlTNK0d4Z0vZxgqSTtwBNsZE2yxbA0/hJjRCttIM14PPB8k3RpXrb3+ffh1IbfhVN
         hJIsgt3DksqOqVbmor4OblEE+fyVPfKyktwQX1obbd4BTOe96LJsp8Wb2YWopo9e6k/J
         Sr5HyW4IhCGNtOYbRn2dvhFjGmEPfLxsuU4VJnPMDwCB0vtcGX93RDjGIQWAXd3OsFUw
         V4oaetLE/Z6WbDZMMI/T5w3vJ/ythZ4hPJIKhtb6L8ieO8XkHqeVELste33v5NPMZpzd
         nRfKdi0f7OXP6CdKmvIBh1yB6sBPybCOxteX9EwEGnm1B/atsjR7LiC5DIfhv/VdVCtc
         4GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725698945; x=1726303745;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BH4+XkdgytSrJblSRrneWrEK0xYxzEsMEgsFyL/DakE=;
        b=hevrcGl20ePA5UYLc83zlndU3hNaRCnIq6vrIsIfNFvOzI/seF36Xve0vXEx5fmqzz
         XXKWiW7h41Kh452ODR8lKVeZ6M4Mp8enSDRJb/7kXjF9XX6Rn7syuBsr91Zz9qNcRE62
         zxZdUXo9V/rwDEL9jGRd/Pn1tRUG2Fq3o8TEGFELgePacGVj9pIrdfcZyLCAD/ukZwMg
         amOR0V0avv8VTHgHE8v280UhuyB9Tqnujy+HLorIqqXkp6+nYz5JTcxkfpEnRyBfHOMj
         Rap9pEm3G9oJeZi3hGsTOIISXLw3y4mbAmS/sLs13PQ2z4VsCjZ293kDJ+nV2tQrFBl+
         C3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgc2xmfi2BDIpr/b9rPqM8e22eNFRRGCWpNVCJfxNpqLn35A5mkesyFVZ5XjcnXpo1tc9gRYxsBAfhfB4x@vger.kernel.org, AJvYcCWGVOA1XUKxni4t9THOJ91pQDZuUjglhEgZN1P1IcE8JqpgxBKlyVFVJ+EIjKmAPnSpEm0KyfPG3OkgXxbp6g==@vger.kernel.org, AJvYcCXS5z2eZeNo0wCQKY7NWLV2PCjOMqgMRgJV6kGT0vCGb+mS1NYsl8QyQ3yvW8geYkpjYQ6H2lRe/FVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJYY773cVoOsx8sL8iHX1TiW2LBK8MahUKLtwUCllljRsh9cf
	kkEIVmtY3+OervX9Gt9LZn40yx3e0kwXGhzVY31omajbOb11PMky
X-Google-Smtp-Source: AGHT+IGCGj8ZHxZZBVZ5qtVU3o3i0MvF8PEs2OGGek2eT1vVe3uzcBcxT+hQr2L/GhZcLEwtMSq4tQ==
X-Received: by 2002:a17:90b:4ac7:b0:2d8:3f7a:edf2 with SMTP id 98e67ed59e1d1-2da8ede7effmr18570786a91.12.1725698945158;
        Sat, 07 Sep 2024 01:49:05 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:d6be:d9ff:fe52:7e82? ([2601:644:8502:9460:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823cf3b60sm615133a12.28.2024.09.07.01.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 01:49:04 -0700 (PDT)
Message-ID: <68b0476f-dfa1-44cb-a01a-f4afbaaa98e5@gmail.com>
Date: Sat, 7 Sep 2024 01:49:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
From: Rudraksha Gupta <guptarud@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: regressions@lists.linux.dev, brgl@bgdev.pl, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
 luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com,
 elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
 <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com>
Content-Language: en-US
In-Reply-To: <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
> happens. Can you confirm that the QCom SCM driver probed correctly?

Thanks for looking into this! Please let me know how I can help!


I've been building the driver into the kernel I believe. Here's the 
relevant line in the config:

$ rg -i "scm"
samsung/expressatt/linux.defconfig
1615:# CONFIG_ARM_SCMI_PROTOCOL is not set
1627:CONFIG_QCOM_SCM=y
1628:# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set


It seems like the scm driver is being probed:

~ # dmesg | grep scm
[    0.066438] qcom_scm: convention: smc legacy
[    0.362543] bus: 'platform': add driver qcom_scm


Also here is the complete dmesg output (Had to paste in pastebin as it 
made the email bigger than 100 KB):

https://pastebin.com/4iWKvZ8z


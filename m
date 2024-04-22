Return-Path: <linux-arm-msm+bounces-18260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C048AD8A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 01:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58F591F216AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 23:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476DD1C0DD0;
	Mon, 22 Apr 2024 23:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMaRmnZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878291BF6ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713826854; cv=none; b=P3LwHAkiEEkPQANAl/v/RkyNfLRnriCGuU2IXn3iqbtf0FReF1svMj7JoWmFz1TrtMZxNeyOesKFBXRyCjF7KyT2Z4+beCXXQEW5eTKW2/rLM4taG11yi65N+4xtmcSiN9kDLqQLfkFtoOqKyD69DmL1R6ac4CvRG02pMttYpPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713826854; c=relaxed/simple;
	bh=/jci29mGzzIavqEL2qT00cRZYvwPd29ad4CaRDp8/n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nvecNzNz8OU/MAES2hPKmoRnTs1Fi94Xj4i/Gy2fgHKQjoThzXn0nROuIRJxOkG37gQ7X0dQbpZq+CPdQW4m45gT6dIoV4hIWzTzhhm42ICg+h/TOfanHas+1DU1MjAtA6DcXLNg4zX2DuEx/g9xSccoR4u0WYsKeyE686keAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMaRmnZX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-518f8a69f82so6018705e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713826850; x=1714431650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kk8RZ3kIPMume4l3zZttutOgAKIxylCidZY2eGmr83I=;
        b=QMaRmnZXt3PXtMtQbha0JxDPw5DCEdF7dazfdKvpRdh/098lw1OODIEPMIBqBkJgKI
         ViV6dNEPJ8i43Y8WXXhDGJN3yjMbdyljRD1HKpjmr/v/DS7cPL8pyTTYeDTonLN3dq2J
         iC0tmz8HApS4FJpvniTgH9UcfJ14wUc/9lnNRU4twe05eZeZdJEMCknmzmlTQzFiv1s2
         T5JNkR3SfZWjCM5QHA3Ndk9XOJGETWxDbFfN3rstOViq8Akbjr1o8khQyQyGHZtcYQEF
         ahNBoQ4eheCQt4qvTzkXov1vTil/ka0dDGquS09oOTzrdWcq4HNcrIEcmjEs5crjkNrU
         VzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713826850; x=1714431650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kk8RZ3kIPMume4l3zZttutOgAKIxylCidZY2eGmr83I=;
        b=rxXSRVGDUCqTuAi+giQ9yyoWSJRPLkvFa1ct+0unKNPeTgOYehCyF1vUeaK2Vu53fv
         mLbV02I8l6Ixv9Kzr03q43rlDRRj9bTsbl5n6c12d6DYzRL7s0UVCS9HLwRQ+Mj+DAxl
         s+D2iXlFWBWK7isbSGqN64CWc/J6DyqLStgh9U5SHTmcjiDwSaGL+hiqA7+5R2IHzn7d
         sCKfIB6ZZdWv4ZiQ19Lte/rDeK70hoyco+EmdZkO2q/cJf82lr5NYJVDcO6Q+3muxYy6
         z7cBEVD9bInLnzWCsbf0UdwX1e4s80hnH1xf8PvGUQ3cec2hYG15ZuTDEy1XBBXQsFIS
         zp4w==
X-Forwarded-Encrypted: i=1; AJvYcCUbP9Su0gaNptzCZLtlNo1LHpQIhUqA8AZNM969n33iMXRS20xXj4tNSArpnyLX3dcSF2wc8V1rbaW3uKXDFMXOGGvB5w6GDvDJy2p9CA==
X-Gm-Message-State: AOJu0Yz60ZSVr7fuuVwlu2PWGMPMGDoWH+QV1dl7O2Dmipk46UorOXAK
	ylxRWN6fXWwEKwXt41KIS6nhtntp+L7uyjqzcaDAQokzoWVKIfGzpRyB97lj1hg=
X-Google-Smtp-Source: AGHT+IEQ2a2C6x5MBOQkua4NvRFyZgVGrHQKhZtpBWTuE/jycfIwqTASlvwYmTONiFAlMbc33a9Fsw==
X-Received: by 2002:a05:6512:e83:b0:51b:64c3:8cfa with SMTP id bi3-20020a0565120e8300b0051b64c38cfamr2469243lfb.13.1713826849758;
        Mon, 22 Apr 2024 16:00:49 -0700 (PDT)
Received: from [172.30.204.103] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w11-20020a05651234cb00b00518c057e78csm1830167lfr.159.2024.04.22.16.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 16:00:49 -0700 (PDT)
Message-ID: <da8fc783-6b2b-495d-ab15-be297b0fa435@linaro.org>
Date: Tue, 23 Apr 2024 01:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] interconnect: icc-clk: Allow user to specify
 master/slave ids
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 dmitry.baryshkov@linaro.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240418092305.2337429-1-quic_varada@quicinc.com>
 <20240418092305.2337429-2-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240418092305.2337429-2-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/18/24 11:23, Varadarajan Narayanan wrote:
> Presently, icc-clk driver autogenerates the master and slave ids.
> However, devices with multiple nodes on the interconnect could
> have other constraints and may not match with the auto generated
> node ids. Hence, allow the driver to provide the preferred master
> and slave ids.
> 
> Also, update clk-cbf-8996 accordingly.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v9: squash cbf-msm8996 change into this
> v8: Per review feedback, set master/slave ids explicitly. Dont autogenerate
>      https://lore.kernel.org/linux-arm-msm/f1b0d280-6986-4055-a611-2caceb15867d@linaro.org/
> ---
>   drivers/clk/qcom/clk-cbf-8996.c  | 7 ++++++-
>   drivers/interconnect/icc-clk.c   | 6 +++---
>   include/linux/interconnect-clk.h | 2 ++

How is this going to be merged? :/

icc-next? clk-next?

Konrad


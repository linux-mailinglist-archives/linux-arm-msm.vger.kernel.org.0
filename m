Return-Path: <linux-arm-msm+bounces-14638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA48811A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 13:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3D9285706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F393FB97;
	Wed, 20 Mar 2024 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5vZ9Oxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DB3FB84
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710937765; cv=none; b=Wu7lMvBsilIGGeyADvMF58ntmwPp3ABtvqWzdCBPDlAtr3/xvWFl6hWlaCl5z5ut7i5+Og4Z+6Lj2mcGuYpaOi6J44Uy1aLwYUHrwTqf9akOnQh2dxtXNg/PrGn6p/hqIIZKbRbQugSONbnNn4l7WTcsC+gjS9xJDfprXzAH/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710937765; c=relaxed/simple;
	bh=ykaeCwGFN314yllM2TqPdc5k/xh5z5Zbpzu9ntjIRa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv5Rf0FWZewla+Y7q1iY7KJTFn3zG0Z3uf6HKSqz3+H9WZa7ZC5sWl3ijbSzcs2R7mkDtCYzidQDniWxHN2A+8DlARQgk9Evp4zefFVOReDIfve9hUsPQYSKneT65rawxWl0nuNII+jPnXCsTQM8GR3ftPYRv3d8p98rDkZpHhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5vZ9Oxu; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d485886545so110970261fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710937762; x=1711542562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HggMCzm7A3w6vJJP6DRxSrZulrULTZscQp/MVjKZ/k=;
        b=e5vZ9OxuBUd667MTV3rVz3AyrKnIN+kb46FWJra2xrB5Ss0z1jmQBuPJXxiaXP40zw
         QVWuDjn20i5JK+GdL8Hpu4v2jGaZJfaEP8RuMBmsPZtihS+pn30ZmEjOWt2+6Bpbvwiq
         VAeZPrqe4mOa9ATdPtMbzDM5BDCi4O9YVoWaf1htky7B/V2y0oDG0YUOj8VILLwePqUN
         LuoNCQW//urXnAaCjCu8GbYBKlb9fMFQWsMa7CjhDQ4sSaL0JdJ0WP2xeQnvh3m+AwKA
         TU3dyGtY/JK7GOVSQsoOoX7ECmyOKu2cz903l9yWwRkml4T+vmrFR1uDukrSxHWLZyyY
         acGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937762; x=1711542562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HggMCzm7A3w6vJJP6DRxSrZulrULTZscQp/MVjKZ/k=;
        b=l2DQn5Tk4G0cp306/yY+q1rvwwIn2V4yIOHyo0Us62C0s60+SN0JMIclkUgUFQCipr
         7H2KusKUGcOw/pFidwjC0MNDK5FOQ5i0AulPtmIHlow9e+TkvxLeyYzHiozF39R24uMX
         uxKENfbE3OIhBo59UNB9nY1uaoZyv4iObpFH6ESip6aUWff9gbtvhbThVg0D9cHK1xJi
         xqAHXRAUagvx7uNnbRspUl4JkLeGjHEbFF7YH7DnxP3OqP+fAfbd5jZx1sBrhLsj2dQD
         SAJp/xCrDWCzcSXj2mJobHg+iJxInBPhykb6s7W2J7xH/JPCArYgDsB4QSLAemI2cdd8
         gBbA==
X-Forwarded-Encrypted: i=1; AJvYcCUs92OMeVx8Nl/tW83EcqJ1fvFjaMqQSWRLbzB0XAalGI/m0to4QwG6syx5e24naYO0HqHekSXn+0finIojShC4KHLoN5ShIq0c7wo0rw==
X-Gm-Message-State: AOJu0YyCEP+jtqtCuFd5kYltAnv/hnVykRNFW0W2Zo/WVOAoUj6vCSR4
	bSaN7gIHjTMNNMACN9Qh0gyBOix8i7W3/QxkSL4MWwksikKdGVmBEWcSXlQVWEU=
X-Google-Smtp-Source: AGHT+IFC89BZ5QnuMlne0HWIODfH9YZ5KhvPId4SDvMTXDpt6Z1jYgoFMGBJvM/RUPRRhPDGAW/hBQ==
X-Received: by 2002:a05:651c:2106:b0:2d3:5ddc:b949 with SMTP id a6-20020a05651c210600b002d35ddcb949mr12334805ljq.2.1710937762107;
        Wed, 20 Mar 2024 05:29:22 -0700 (PDT)
Received: from [172.30.205.3] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m18-20020a2e9112000000b002d48d8e22c1sm1753267ljg.35.2024.03.20.05.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 05:29:21 -0700 (PDT)
Message-ID: <8c815d0d-e716-49fe-9e94-4c5636380360@linaro.org>
Date: Wed, 20 Mar 2024 13:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: make pcie0_3p3v_dual
 always-on
To: Caleb Connolly <caleb.connolly@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320122515.3243711-1-caleb.connolly@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240320122515.3243711-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/20/24 13:25, Caleb Connolly wrote:
> This regulator is responsible not just for the PCIe 3.3v rail, but also
> for 5v VBUS on the left USB port. There is currently no way to correctly
> model this dependency on the USB controller, as a result when the PCIe
> driver is not available (for example when in the initramfs) USB is
> non-functional.
> 
> Until support is added for modelling this property (likely by
> referencing it as a supply under a usb-connector node), let's just make
> it always on. We don't target any power constrained usecases and this
> regulator is required for USB to function correctly.
> 
> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
> Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


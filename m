Return-Path: <linux-arm-msm+bounces-8274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4D83C817
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 17:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1A50B21333
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 16:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5B212FF93;
	Thu, 25 Jan 2024 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWgTDDkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5712FF7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200405; cv=none; b=T5ER12gikhIchKGEzkeIXdkCGNliaI6SUZZ94AfFZfLm5Arim5OGCer3G9REOKc6hTgCUweyTl3aIROyjeG3c/qCI2v0bJmqz54w32kVUX6Gz5GrxhV6Gb6KsxLt2ruP2QpucqIHlDe+uVhTnDeBoia9Y+E5gAiM6cDvRBqJkgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200405; c=relaxed/simple;
	bh=ihxgyFrcT7s9Ma8Y8p4UwpKyfv9bS7pdvN44uW1TpUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D40WnaM/W2Fo+G/Wg072Mj6OiRh+GvYIIHxTIc/K/Yw5iUh1DGopDcX018f3Iikk86gOctD361SSiJs9a3Gk5WUlhempI2zInLK2QRvCW8GmXCKiclRrDCIM9qUtBztxqzjX3iWn+fB6TEVMngFSZxBtFlGyqkbHVv1+vvAIqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWgTDDkd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51021ba75edso430132e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706200402; x=1706805202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/d43P/Uy9I2J/v93EDqYhmotAxSPv+0TR7ioE4qk+MU=;
        b=FWgTDDkdZApQhW9fKDO1b4g1HC1UvH9oEMDLEbH1kVABjLcds0XVVXFgz9NRhTYJdM
         4jUALiExPUp1yTd9Zb37vXXMcnyQVRXzuEK0qvug7PAFqtTQO5p+NbhLC1n2CIFBWF7M
         y7eTCFS2E4iw5lKK9R17J2Fs3/FPre7U89zfvHH58VZRUDMioBZF0wt91VTBH4TaaYXw
         QAytzvg8T31NE40s5zcAYgQz4uzDAEf6SKF6GCyWktTGTw8E0+rAtezK7pJznydfHu6Z
         n7zcEkLDAjXhdSvY+KmubONvWBourwmAhFQfIcrRtSIqh7x/zphbjPcepLekKEtxxABy
         ax0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200402; x=1706805202;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d43P/Uy9I2J/v93EDqYhmotAxSPv+0TR7ioE4qk+MU=;
        b=dQhxeHfeS8AVkQYPz0zOfAsivrRYZMbgN772hUYy91KD//QzPNWP2dVpIvoNBtsw/o
         iTgUndpopm806D7mupmzgJ73uWf7m19y98AnQCRFWncEeUYUWrF1guSMzly8aIpitDcj
         fg7Hx+vBIfnKqWFe3OESoS28LwfRxG1Bwbw9xx+fOwDAzQk27S8iDSOXGREikLFys8Al
         tHgKToqEYXavTRGvAqaYPZoSAAkfYyOG5wG6A1n5wacklhjJYQqV7uKRgdypr74P9tDe
         bV1GmgOKj1FXU3eIvFKXaGvGQneOx82lJAZnelcaQgYYn2b6v6tj4qxRmA+V0NNHpsJk
         HacA==
X-Gm-Message-State: AOJu0YznsuOmNDS2EDrtfC77F6Ij7J6GXaokTsTGi4lSaXxsX8TE/5El
	90zlWAqJhOlY/3IDiSQge8QXA/tpY0bqq+NwKHW4TwJPUf7E6qUKn/x8fLpXJ64=
X-Google-Smtp-Source: AGHT+IEYTYENdHeSvfHhnFZbKZmLfCsG6DgmAtYKpsA+Uw4XUd5FxA/ypZmxPjbApkGHB0vOaPa53A==
X-Received: by 2002:ac2:43c8:0:b0:510:f58:e646 with SMTP id u8-20020ac243c8000000b005100f58e646mr21658lfl.129.1706200401623;
        Thu, 25 Jan 2024 08:33:21 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050eebe0b7d2sm2931938lfs.183.2024.01.25.08.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 08:33:21 -0800 (PST)
Message-ID: <554d8d03-fa8f-476e-97a0-96d1ecc8e158@linaro.org>
Date: Thu, 25 Jan 2024 17:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8150: describe all PCI MSI
 interrupts
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/25/24 14:06, Krzysztof Kozlowski wrote:
> Each group of MSI interrupts is mapped to the separate host interrupt.
> Describe each of interrupts in the device tree for PCIe hosts.  Not
> tested on hardware.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

There's no cover letter, so I can't batch a-b..

Could you please resend, turning interrupt-names into a vertical
list?

Konrad


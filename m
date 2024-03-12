Return-Path: <linux-arm-msm+bounces-13881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB9878BD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC9391C21137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE53F20E3;
	Tue, 12 Mar 2024 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PHhDC2sf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23031C2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710202443; cv=none; b=ogwL53A8l7WQkRrStXzZaNmKGgy4XyB2IhKBHOC7LrpLgs24TNM0F7AdxFIG7JtdtY5EOa5D5fP4vNPPLiktAkIRKFK2FbeM7akvMaggiQRTb+WKAg+Sj4Zzv1X2cL0jDkZjZjeq2UzywYP8gA7n6SqGm3fzI+uSUqKvwHa0wds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710202443; c=relaxed/simple;
	bh=TZTFjad6w9R/A4c9QK4bJhaZRfOkzkbY0KMoh1WV0Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nbps6Qj9FiJR5msEW4Deah9l1X33t6Y4naQGVE608btLi+qQUIjUEhSf8MjmrS5gmix3Yd2gCIQrmXcxP7We3/6VPpRC9qADuQToEY5ASNWxUrdqTkhbV8BWK9WeotP0+V9pelxL4P3Dh0UGNLMhrFf9AlmCYkevD5ajl1Byyg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PHhDC2sf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d3fb16f1a9so60071601fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710202440; x=1710807240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sX3f9yGyYab0yOk456EndE47zdI6JIzRTWi8Je071cs=;
        b=PHhDC2sfuHBuCBmoc2/RiBE6Vr+bdjz0Yl/QiFzEDgAZo/zA+ZfPSAmvgESijOGfmY
         lAtiLwTZP3rDqX7GOORFvgAfN7PqaFkEs+0E7IAkf/A8DktD6uRZN7B8gFt/YBlPS7Vq
         c9uSvZPotur95L8Qo2DbCo0WzvN2RE3i/Jzb71HgA/8hDsuAnH7KQBJHKFyn83+HmXcR
         lx1cMiBdrJ5RYLfbzGFBOpzj/sDhVhHukOKbRdq+vKQ1iqNjOIBe2SId1rorTDYXejL4
         Y6i1jLUsOyYc7P9+1CL/XjwOdWL58IjC/GERir4MnRR7R6zxqhXcYyeUXSfeJo0SGh/V
         M8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710202440; x=1710807240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sX3f9yGyYab0yOk456EndE47zdI6JIzRTWi8Je071cs=;
        b=k+vdLOzSLfHSja66rcq0W3ZehcaeSfSSuLx1eGXxmO/HB8ozfKA4eN/aozU3xGc950
         WNKmgYvTg7R+Q8UXQDayughoPQDu3M1FEB0MlQIh4/mgczGeWqdTz+6h8j84s1f/VACW
         ZtnMVTvyMXTEp1IizMONC75wVeMC9/rHO+xAFNRA2l538sgzcD/QDvwTb9MOMbVWf+yo
         BVa0V8VZwZKmCNjG+C0NZvC1lU38EhrHy0NWb3Eob2ovuSxjPUXSM+QbYfi/DF3f9prV
         YM6w/3zc1nTqDiA+v4GWMa9SXejsSzJd2C7y+v4Gp35ya6AIpg9s3r8X2zLjdMSTtC2x
         uiow==
X-Gm-Message-State: AOJu0Yw/jXmnAIZaIsxsIbteM09NOK2Bawx4w19SYIvDvQJMrcLfexBO
	um+KvnieFm+7TFC4uFNaa0xasbbd3cXh6JVUMZS+RSe1recewHnJVV0jih1Q02DuxHAQID+LcPB
	zj8g=
X-Google-Smtp-Source: AGHT+IFSP0vgMmSJK2RcLkt/TA0YFOfGHvh6uKZayMl6ahMenA7pBLqxxgSD3eZ9uJuin/YYmNhLaw==
X-Received: by 2002:a19:8c1d:0:b0:513:200e:cced with SMTP id o29-20020a198c1d000000b00513200eccedmr3037840lfd.27.1710202439987;
        Mon, 11 Mar 2024 17:13:59 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t22-20020a195f16000000b00513a7962930sm807970lfb.89.2024.03.11.17.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:13:59 -0700 (PDT)
Message-ID: <5ddecfb7-fcd2-4df2-95d9-882939a1637b@linaro.org>
Date: Tue, 12 Mar 2024 01:13:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: qcm6490-idp: enable PMIC Volume and
 Power buttons
To: quic_huliu@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240311-gpio-keys-v5-1-08823582f6c9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-gpio-keys-v5-1-08823582f6c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 11:09, Hui Liu via B4 Relay wrote:
> From: Hui Liu <quic_huliu@quicinc.com>
> 
> The Volume Down & Power buttons are controlled by the PMIC via
> the PON hardware, and the Volume Up is connected to a PMIC gpio.
> 
> Enable the necessary hardware and setup the GPIO state for the
> Volume Up gpio key.
> 
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


Return-Path: <linux-arm-msm+bounces-36400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F20759B608A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53C2284162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31601E3787;
	Wed, 30 Oct 2024 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKzAJtl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990F21E1C2B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285632; cv=none; b=ZVc5VsdlGu8wdbXuDnEfufwrpwWLncit0CaJH3ndW7zEEo0NVivFo1PdC4ny8ZjxQr9keeb3YZdGN0MfBTx8l3EwIsx602vgchWgaBFL6Qe6j/rrdURQfyX5bp9J8PnUcO6xO1S+X1Witrcaeqol4lFmkv6zAr0pbUBzuSH7nEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285632; c=relaxed/simple;
	bh=KDU1+7ZnVtYCy9gRBggHWB94leu6oxv4QpxSzLT4cLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USN2kzGB2GwtpVtjvrs+GnsZ0rK+wtrH4AFHsNGJrAR7DpCir6v48/BvagXH6VX/CjV6ESnghfzDsJCmfKUJygj423y7tJLM6KG23ameuFeLMzNUtP/DOwIlSTW0JhS11avLOu2wCMlXIFc4IuBerd5ElkAZgiBhfjnZHcjgjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKzAJtl6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53b13eae3b3so847181e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730285629; x=1730890429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r90YpozeaoCUvndH8AD2U9m1kd09qNk8K+E3W0sjRsI=;
        b=fKzAJtl6J7foWoUIsIvQiEkAdmIXIYogNITdAOzsdKRalaKg8QcSEofbFgZTF4gDz1
         DaULU6TiYEOp8X8ymFBtmw5tuZTMg+AMRtCSJaux0CvJ0lHQQWSOzvKANluusK7Pk1or
         h7Sqm8KbINxsUuMbBmGkO8AUNq0NuhAuuElsBFTLcF7p6vT93IE4fbF4OG/PYDyVJzcR
         55CClvIw5RREEI+6dLW3zj/0g7+/QwW0CwNOW13VoyDENZcXoYJ15wRIyXmf8kcHlYBK
         cGq0kKomn0BrnJQu/OpgKIhoTl8pSZowD6rTEEb9PkjTpdsRa0X7XqhnvIBEcmoyOfKk
         4bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730285629; x=1730890429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r90YpozeaoCUvndH8AD2U9m1kd09qNk8K+E3W0sjRsI=;
        b=jGB/SZSWPLVRZUvx87SQPhP37uFF70WN91WQFB5GIjvx9Qmz1fRDe1s6Z2PfMcFR/X
         5/cve7A4JL1FyLVbsJy7B62X8yTnXBsalwTDW9e4Lm+h1iykqyDLvyxgdC/TVeG5vQau
         FGHL93Dbx3PPlYmou/lYXqyjLKp3iRE0bq6WiWTBdQDJ/usNKGgehRmakkZ36NKQQ4+e
         EZ7ifn067iRXJH7R0dy7D/Y1NAPUTvju/V0/e3ZwHC/QXjlbuVvElWYu/nkPUK+s9y6i
         xN0C1lDCKDBBl2PtubJ/hU5uiyCL1RC6g9P9AS9Y+WvmV+EWDFtFQbk/A3aEXA0uC4iW
         U08w==
X-Forwarded-Encrypted: i=1; AJvYcCVFd8X0SzTKWwAKQuKT+AO6JruAE/ewe2FOSfYM/l1eGafza0l1soTLNS73jsgrs3d3Z5JT1hW2QJO3Deq7@vger.kernel.org
X-Gm-Message-State: AOJu0YywCdUrCBbkzV0KuH8voTEdQWEsJZVz6V3dDgx1y5EpSPwYEB6z
	D1CspIdoy3q5pv/eO0a/Zwuv83SvdLfWB+/9ElzSfTuwc8Tnaqp29IqKmvhFXLY=
X-Google-Smtp-Source: AGHT+IGYv8fqW9j0td8pyKJ/XV0vhPCxGKBeN/I4HT71o3DsyGkxaEPZa0NHC4ebYcOXKS9xLYt3Bw==
X-Received: by 2002:a05:6512:104e:b0:536:9efb:bb19 with SMTP id 2adb3069b0e04-53b348c8a1emr2185606e87.3.1730285628678;
        Wed, 30 Oct 2024 03:53:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d7024asm215292e87.293.2024.10.30.03.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 03:53:47 -0700 (PDT)
Message-ID: <f5003f25-6a00-42f8-a130-5ce3c8761674@linaro.org>
Date: Wed, 30 Oct 2024 12:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, loic.poulain@linaro.org
Cc: rfoss@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/24 04:09, Jiapeng Chong wrote:
> Variable ret is not effectively used, so delete it.

Variable ret is not deleted, the commit message is misleading.

> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

With the needed change to the commit message:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir


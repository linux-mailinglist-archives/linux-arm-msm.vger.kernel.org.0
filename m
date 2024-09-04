Return-Path: <linux-arm-msm+bounces-30745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F075C96C13E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36D0280D9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD071DC75A;
	Wed,  4 Sep 2024 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="vUL5bGVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B31DC1A3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461104; cv=none; b=BtJcz1j6fbHWCOm1Je2wJ6XDrQ96RbOSK5roGsOwVkcv+1+fzpDNA5NR4WhwNE9vz1iBe+tqwHTmd/r1ZGGHaXGnG3HkTfuYuZkO+TAfJQ/euXuVXUQY7pBz0/28gkt7lo7V0YIOG5UuK+JWloDIiv5+8nz8Xq5+WiNDTXjXRUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461104; c=relaxed/simple;
	bh=B29IRw+UCEYcVNyBksrJ0DRzaF5TIW1T+MkONM+dbsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LioGRHoV/VzKIjiz1hEKsrHDX/cAAH6NUB+hsFYH+TzVoMbzGn0DxccwvIVSPeBXxYccMQ9DhQK8otvMSo8IFU6DVmI1CChrG2T4y7ABdcYPT+Rf4LJ5YaJWfJ1duucbeSf3MXM/Ezcw2onaCrvhFo6UFDjXNJ1bnfRwoMm6yUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=vUL5bGVq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a1acb51a7so310316166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1725461100; x=1726065900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/kYvp33pxGDjRpRIJw+Cd3vyUH8fk3GhcxNhxFr24c=;
        b=vUL5bGVqzN4huSqkARkLY8w92QbvWcAp2VpZfUlNjPa3AoivPpmUisuOqLe9BCdsWQ
         nYsEUbXVquhhe/ptxUgRKHg3wcYbqAul0BUaBTKkJFYJxugJDqxG554v4CunyCVk6RVd
         GruByJnhWgROWRfqfOGrPojyW6Sl+pte8M/WVHgI4KJAlkrBkFexCLSRoHIY3LcBfjF2
         kW3s/TERvtIqBWalp2sls0VQSD8JXXbKRCfflDWACeqnjcQqRz9MOMEvYfpCr8w7GOYn
         RAQpV3FFOjIsbnhMZlshv9J6RK4OeIdJ5WCE0bwI29SwJ/aXfsoCxxdrzCZDNLd8+FjX
         EN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461100; x=1726065900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/kYvp33pxGDjRpRIJw+Cd3vyUH8fk3GhcxNhxFr24c=;
        b=aOzsuT+038+8v19eyufkjMVtT31FcyEQzRm83U46eHs0cOXB7MaG1UTAm6xVHgQ+NW
         T5/ksnPV1U5PaIn+aZwUDsEHAc7mDCP66bM0oiF0cYnjPje2kC6BgH52rUqYp642w2LI
         AvUXVidcUxn1KnYwqxgajAjDdeEiYxoEzEm6kvaLI3dlmWn/7wqMoUep0uu3QPMhhjMN
         b/I0dU+8JWEjFlzWnWoWnm6lVyNq38w57PuqghLjT9VsUQr+Lfb9fChLmWe5qEO6I1gp
         u20J0BC+7XFyX29WpZpvnEOfcvwy4aoUI9ezwKW3P3R62weKiJ0IF/GUKtcvLShe2+oj
         m7/Q==
X-Gm-Message-State: AOJu0YwfTn/4DBEjy4Wk8JwmfGwLt9mvxggqT7oO3fwH17Tnf+iSdmW2
	+eZVoP9Ax73nB7xEDuVycDHSdv68ioCqxTGxPBdcIobM29vqDVXzEi2JslPuT7g=
X-Google-Smtp-Source: AGHT+IHKKGZCOMTNOifmLU7XC2AAO6pro54NRxIGJ/Wgh6Uuq/ZCIGg4bEYaQf3nQEl+RmcJ5Bxizg==
X-Received: by 2002:a17:907:ea5:b0:a86:6a2b:3e57 with SMTP id a640c23a62f3a-a8a1d31ef60mr526331166b.29.1725461100004;
        Wed, 04 Sep 2024 07:45:00 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a61fbae35sm1592066b.34.2024.09.04.07.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:44:59 -0700 (PDT)
Message-ID: <f210bbce-d133-4376-878f-586e6f78fcdf@nexus-software.ie>
Date: Wed, 4 Sep 2024 15:44:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] media: qcom: camss: Sort CAMSS version enums and
 compatible strings
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-4-b18ddcd7d9df@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-4-b18ddcd7d9df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2024 12:10, Vikram Sharma wrote:
> Sort CAMSS version enums and compatible strings alphanumerically.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>



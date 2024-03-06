Return-Path: <linux-arm-msm+bounces-13479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A80873650
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 13:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A985DB207DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 12:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FE680034;
	Wed,  6 Mar 2024 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cb+cqJ38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACD80026
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728134; cv=none; b=W9w2WMr/7WBTjsaLilDMFBj2Dqn8UHjoPi7cGjD6e5Tkb4gyEke7DXyZeCIbbni4j65xHftWE+VRZVKAFu50pHNFEBm/y45DX5XWAxF2B2cd20tomNqrqImZJAql7B5tCRYzU88oyYi0ax7MSVwuluM4bw22zjWynFcNZnJDw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728134; c=relaxed/simple;
	bh=VLOS2vVv4IuuAP5UT08HBwa1ioaWzhky52552bmm8wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZilu8qOaoVagFG9qOOUwMPSIvjnQV7ionsjjFaFFsDqztcfCtdrXkj1V091ABeZUIpI7s0U9dmL5xrZV+fl6Eg9l6MwIsu78yzD+d3/L0rBGBtlydoPqr/S9eCw63geR2X4wcC0b7j+CgOHoZtCYkONwgwtYJJGki4UQ2Bz6iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cb+cqJ38; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412f62ee005so4193015e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 04:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709728131; x=1710332931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+jaysDx7kzbPxogzlLwhX0qb8dGOpg3gc0tLTZPBlI=;
        b=cb+cqJ38c1aCH1KZE9dDqMAPRf2KsGg1F/Sjs7SSjJ9ZwndKtMS3818jQgyMnNjt5U
         vrdcvlzexDa1x0n/A7LpfQC/40xacFfmPmmLUl875z7AmzEW4CAmGi0/9CBet7GB0bo6
         aTjz2Kbw08q7tm+ENW/8DUJAi4Z5UkIKJjoKkPjOOMXFHgsps6jzrSU16IjpwMdkDLOM
         +VooXQwcghTlAa3AWxYDtqUJbJfTG/xfCYlgC6z9oDIs7HXEGYWysoU/CbuCjODnA1ZM
         OCCJkoInaq0NZNT3hlQUqns2Nu6ErVfMRKPU++RNG9b0NXmTCcqi0DwbF65Eojyky7lw
         Nr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728131; x=1710332931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+jaysDx7kzbPxogzlLwhX0qb8dGOpg3gc0tLTZPBlI=;
        b=PgLYDz+GPuR4gFa0vuP9wHvPvtlzkOli2Tf+NV9I6Fgjrf8XYuk7kq1SKujPn8IhiH
         OrjbPmEFWDt0rpBK2gTXMZp8u99rQ7egfFeIzsDqb2YMRrtUwqzW7thM1EPXvGDH2wwb
         WTNaxJLnmhT+AtegG3KKGRL9a3PV8T3WI/W3QChxl8ePD3noat1x3Bsj+1/awrGzJTp/
         QX6cFA+mp3nDbMMBaIWiydEhLZqyD8Gpi+mIcj/4CpiZZUM5zSNXy6CCngvgcReOXHNP
         ecl6sqqAYhBpkrW1zg5Qprd2MV+ulmRh8M3ikG6WMCFVXuqSOEQ5/ZOArr4ruVmHX76Y
         0kig==
X-Forwarded-Encrypted: i=1; AJvYcCXx+12t9LbJS4jWMnVWkc7QGnt7rVbT30mX2TivCqFy5oIcTsEvvFytMQxYhD163+Vbk2fyHcsFepR2J3IgJTOVYsmYjyeXHkhgV2dYJA==
X-Gm-Message-State: AOJu0YykOLhG7M3GXL0ysCZo+oJ9xniBCWUq5EoprxizsG0wGzw3N6ul
	4WiL96zquV+wuW7Ylp04SQOVwds/S1S0/BHzHFFlNCHhtvaojNDhUyacv+wJ42c=
X-Google-Smtp-Source: AGHT+IETdEzABGZ5rA7uZ90k0itisYxcBiZM3vaWPWgmQKh0tg8Z9BR1QWHuNS2bjWtsUYHHAWSJ+w==
X-Received: by 2002:a05:6000:4c7:b0:33e:8fd:1173 with SMTP id h7-20020a05600004c700b0033e08fd1173mr11966388wri.60.1709728131322;
        Wed, 06 Mar 2024 04:28:51 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bn20-20020a056000061400b0033e43756d11sm6811932wrb.85.2024.03.06.04.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:28:51 -0800 (PST)
Message-ID: <865ba063-e5a8-4a24-af92-3742834b31ea@linaro.org>
Date: Wed, 6 Mar 2024 12:28:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] media: venus: core: Deduplicate OPP genpd names
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-8-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-8-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> Instead of redefining the same literals over and over again, define
> them once and point the reference to that definition.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>



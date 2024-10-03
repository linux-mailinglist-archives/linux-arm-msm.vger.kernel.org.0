Return-Path: <linux-arm-msm+bounces-32997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582798EB09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C231C21ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989F4811E2;
	Thu,  3 Oct 2024 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ermykQxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A0112F588
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727942760; cv=none; b=qRHs8P0BjtvqBsWVzowRhrA3Spou5L7sKT3j7pkLHPhPFlT74gzaV+LecscA9uiFA2RxaFs+KO1IcwreWzQfLdKMhdO0TgW7vh+0MOvzi/bdvnEWAhOM2PHkwrYfupFwEHxKOauvwCK3xbSZxwdZO9Vbf6O+T3IONVsQa5e6X/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727942760; c=relaxed/simple;
	bh=gg/chES/KjfvBsxNlmPolEQpvr/+ChzwpTOgMTdzMrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYFVfhe8m583PtpxxRVDdK8mM2yUoDvM5n6wsgtqdAQVt0pN8af2bobpaJ38WijKkpPbCzXlbMQNhXVwCUVbZMt7gQ6/t+73Ovgv1gheyFYQM0BR5I5hQENRze2QnOY3VX43BjHwJNpzxyNCxFmWV5wVOLCaot7TC3ZsKWhZMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ermykQxv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fabe9fbe20so589041fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727942757; x=1728547557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSbNP2LSzdURuBvtjjNXE7kOTcPFhv0be643iEbepKU=;
        b=ermykQxvAVxnUAkP6kwFoi1EeRlq2bVjCedW9l+N71ioA4IoK8nnCgcjj221noYmay
         R1i79LZF+tALNI70wZrpNEeMX0bNRiJ390gXshxA6Y09MW7nSUDL9AMDiwFpQcGzOj4f
         BtxqaKbE8a4sm3ITwtrLgrmk72CAhiOYXOIEdXCYhwTawAOrcgCgbibWmq+uCixDZzSA
         S+5JYuZ912g4PrsHFtBRcXlS6wX6MdCN2/AXjzsbHCw1//sovJ4CLxF895OznryQZ5xp
         HJvCnXYZ0i/bPkUF79EtBL0Aeq0ltGyn0bPBkCqis2BAHrzGSJc34oLppZd5qg3omVNE
         POGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727942757; x=1728547557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSbNP2LSzdURuBvtjjNXE7kOTcPFhv0be643iEbepKU=;
        b=fbRGQdVK5+/S6N9vnM+n8XjFHms4hclsPszfgsIfO78FjiKcdbGk00dAw85yYW9O2m
         FXUOzuZdZaf+QYHw4XjKhMPDkZsmVpLTxzIe7OCuN6DhYliUEccsKSsr7RQyx9P6YHqV
         RFACltUrGfMs3WbWWDXUxhT2V1qeYkrpRpgj/hx9xg7hAIukHc3qlghPNdvPHG/Ot8ak
         EPEc6PBXLNH75RKCV/fB0quCVliPoNyguK+P0CLuYij4rLqqzI+faW4RqnHVPQ3ZxeN/
         GTS8HwuTbUwUZy8GDMiAHjlsDcTDA9n5Z5wyfAB2qTi+HkUzzE3ABu4RACrVkIPb/bHm
         SbQA==
X-Forwarded-Encrypted: i=1; AJvYcCX8pTrWYNRfhAcyrpaxcj7IVy3rJxQRJqxUN/Hpw4/+k3iVBvsHTGi7mRZ0+HXETsd7LJ9mxrXe/pP/YVnL@vger.kernel.org
X-Gm-Message-State: AOJu0Yya90vgkiQtofjFZqehgLFb3ZYUGEr0Hbn0fY/vQNNZOeKuJ20t
	2GwpXFSMBeOZJ4lacGYxA4dJpwlX7GaQW188KUlN2g3/ys1u+Wh3t2ameIXX2FM=
X-Google-Smtp-Source: AGHT+IGMyQbMxH01BzNBJrn15VPbDfiUtVf0JbE2MOOeoBTQaQxkYK7qqyWEScuedJ61d8IqRS5Igg==
X-Received: by 2002:a05:651c:a0b:b0:2f0:29e7:4dc2 with SMTP id 38308e7fff4ca-2fae1013912mr10690501fa.5.1727942756819;
        Thu, 03 Oct 2024 01:05:56 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82979b4sm113489e87.141.2024.10.03.01.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 01:05:55 -0700 (PDT)
Message-ID: <ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org>
Date: Thu, 3 Oct 2024 11:05:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Make GCC_6125 depend on QCOM_GDSC
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>,
 =?UTF-8?Q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
References: <20241003-topic-6125kconfig-v1-1-f5e1efbff07c@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241003-topic-6125kconfig-v1-1-f5e1efbff07c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Konrad,

On 10/3/24 02:16, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
> required, as the GCC driver defines and instantiates a bunch of GDSCs.
> 
> Add the missing dependency.
> 
> Reported-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

An identical change but for SM8150 GCC is also welcome.

--
Best wishes,
Vladimir


Return-Path: <linux-arm-msm+bounces-22619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1590795A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763E72818F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE9E149C7F;
	Thu, 13 Jun 2024 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHs4QNB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9ED4C6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298328; cv=none; b=CUD3ROVZAL5ZUnRL8+hpwue7RS1Fq7FxNcDYlVlQi5aI28IgYVn3edIe6Fqj4IitCjj4ZkfvWkh6J/DH54wGzGLPI/DeUY+b2gfkbqGgoOdXjSui1xWJoBixIMJlzuF/1lkB+ckbFHLcyJOZuTLZVArVRjS+Z9JKbZGw3E0Vb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298328; c=relaxed/simple;
	bh=p/p2G2Hnjt+abB5vSKz8c1cnMTyRrbY3vlMcptLFV7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsgbvdEXHHAEYEXG3bo6twdIqfhsk3ogOHH22zA+M+ipPuWqDmd2hmHY0+RPHxXyoa6curASF6cmEURC37mh0UOtGYhwDukGkURRJdo2xiVQ0IwuiofAdezYmB6OLsETDF/f5mqfYaOjXyV/MAUWswR612tIgH+X3YxnPgTA21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHs4QNB5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so1490777e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298325; x=1718903125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzFTYmEc+fQ3/csX45CT9heivu+VSe2HarKq4DyBsq0=;
        b=UHs4QNB59/TSi/V5oD4vL2euFuZ6U9IWHdSviSHCe5wHNlyyqAEHNIf1HH1+ReYG7I
         4UyIVG1OQnrX5aXlgf2j3A4e/hLI1doUkn5XMecFPRGYtzlBIG5fpdMzxwMcXC0c+3Qu
         +DgmwhNdCLVHNHHBZY3TdKbh2f2jEQe64Vk7yOJdisVmpPtPzuTNZJomQLKswJKTE4KX
         CfScWqdBkbsvzO60zglpeUZYQQmdSBFLfqq9d1jdEkjSypCOrVTMN9PZj6rj+SK3EE4O
         v5rbPl69mL8r5UyPKtqo8P5h6oEHZdJppJOeMPpmJL39fF8ofcTNYGKgWljFWlltyGzZ
         CxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298325; x=1718903125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzFTYmEc+fQ3/csX45CT9heivu+VSe2HarKq4DyBsq0=;
        b=EJ56IA62yp880DtpbStGsGG2I/vVKE9Fu/xXg3GUtv0WjyuZrqyus5+JUfensUEQhs
         +LMpJKDnzgZFFHW7v8sfQHCzW24W2F6VDjroAY+lAMFOtU9ZBPM4sHtVrXQTWltsRkK1
         /mG5El7DKXj2jectncyhrcXmHv9pcc3IhkHaUobe+gXJIfu/D0ksmBuLP/dN1NgiCsVN
         3RZMm1mYEgUzKWtFD6Kr57DFvi8CDJcRw6XtLMO0gzfeqI9vz9Wf8hjX1cIf4VD4eSpl
         B4VfcGSXM7+8DZLYzYWkqCSjig++QwIvLA1Ak27wHNanzis1aEE0oZtVFbsRZf7vM+i5
         ovNw==
X-Gm-Message-State: AOJu0Yxb99HlGPS6qls7T8kReuTWX7Mr29G8+kz/XAwBgDYRtrwKSUlW
	572McxFDazhZW8BOJizt2GiN7naHTXt3P8sdtvKxxkp+9NP/MSWSu62heqYZ3m8=
X-Google-Smtp-Source: AGHT+IFMrJVT6uEGUQp5yGREv3B8DR09nqWG4bCjV8ublGXm51Hn18ceK46I7BCUMOznsI+esuuukQ==
X-Received: by 2002:a19:e01e:0:b0:52c:8932:27bd with SMTP id 2adb3069b0e04-52ca6e6e7eemr215207e87.41.1718298325382;
        Thu, 13 Jun 2024 10:05:25 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28259cbsm289479e87.62.2024.06.13.10.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:05:25 -0700 (PDT)
Message-ID: <4fdb62a8-df00-4cd2-9c96-74afcae3ac5c@linaro.org>
Date: Thu, 13 Jun 2024 19:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
 gcc_ufs_phy_ice_core_clk
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jkona@quicinc.com,
 quic_imrashai@quicinc.com
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
 <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-3-adcc756a23df@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-3-adcc756a23df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 13:08, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock to force the core on
> signal to remain active during halt state of the clk. If force mem
> core bit of the clock is not set, the memories of the subsystem will
> not retain the logic across power states.
> 
> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


Return-Path: <linux-arm-msm+bounces-13378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A7872935
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 22:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900381C22C6D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 21:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5093212A16C;
	Tue,  5 Mar 2024 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDj8jKDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F4129A99
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Mar 2024 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673324; cv=none; b=HptTAT+W4gTFDZ/yTVjbxb9uzN5RqPACNgY0fh851jTNkczyFo+FR0aXCBxKhjVt0QxcKQuvEhg83Xm+rlUCFrO/fFtmPmLiFGi5ug1CK69Bj5cdmNx7/kv6XhAFRoJIS+IL4TYS3SRLyn85JlpASB3m0CQhuFSMIku8rPQ8u2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673324; c=relaxed/simple;
	bh=q3qpCtpfaHgKL4O+ohs+zw2E99BCzpPBfbg0sK2q/Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHKUtTQPqbt+e4JGFFs4EAzKs/SgKnJNKPwMG5+lI/8Rd3KUYBMJThUmeOn+59Zvr7Xmj3YPrkaWLkSdsIrsx7PzJQfsB6M3bw7VQ15xAs09LPBdDsEBaMfk5lNJ8/v/Un2VdIyl5oiWgxvTXMl5gfqTgfFStvhfNi/PiUFCjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PDj8jKDj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51331634948so202601e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 13:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709673320; x=1710278120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcLlYhRVUjayvEg2I+ONza/QYQQIRBBumX2Ta0R39NM=;
        b=PDj8jKDjILv/dXLC0/1HoGiF5UjOYb4vMlDo5zHW3PqWNxycCF7phjP+ZSQXWj77oS
         aLwtO9IwZfIYhRu7Z2H8obDl6U3bPR5ZVX1oGLEEZXKaUd8vGIcJ1EhqRC3YXTXpH94K
         7RNY0wZ0PsFHmFpYrGBHGq66dcMzfc0cGyy5tW28ytqh75mpZ2OKQUnwtSqFW+29K8QP
         fz6iayckSyS0Slrh+063h5+VQmi9iXxlYLza1KoyFnMaJW6n/ILUWzR/d6PEW2UZkjWj
         OxpFglpFEmikoj3ogH1sMTvSE9tjCPgLr9TWfoMA13jF+cdcQOCrwzHKozivhTR9Igo1
         /RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673320; x=1710278120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcLlYhRVUjayvEg2I+ONza/QYQQIRBBumX2Ta0R39NM=;
        b=LWtwWUu+iVvwIMK5CgCnj8PJC/SWqUcscAe34FidIAxTtJ3vuX1APQohleamsvZcrv
         deWAjtnWZvgFC/zyo4+GYSX4Nq9v8mm+5NyG7H6Kpx6n5wZTUdIO0nbiAnTtotn1HaQ0
         O5y4zMYs2/FKBpjOWV4sMX67im3NzQ9SAlbA5YJCY9ae7p4aiDM/raGWVhtf+Um+uGSP
         Dim8/r5fXHjuBDgg1jkr8TKUX06zvuVbmYzVu9Sj0+x6ldsboxk7jCaSsdvCUfEwVYkF
         VDZFG4K+HES8Bocnqc42+IY6yDgBC/CmLm1hglV38ZjZKavm4logti3VsPCPEmmqLBrN
         uHKA==
X-Gm-Message-State: AOJu0YyGtFGi/1z4hFH2s1J7ayeWxTsmsLnQg87axRbPSuoFTOLRIDdL
	nJF2SXjfUoLUvQmCsnWtvI/hGz2CVKDXWAIkaHeak9BD+tPA1pWgL7D3zJs0Y5s=
X-Google-Smtp-Source: AGHT+IHdbN7lKKMKvsDIF7x0cETyUnPKYUVcgnXel+Ffrs8Vy4TYbaQOKxKx/8wKuc6TZ8iFva4IWQ==
X-Received: by 2002:ac2:434c:0:b0:513:346a:5a16 with SMTP id o12-20020ac2434c000000b00513346a5a16mr1068589lfl.9.1709673320317;
        Tue, 05 Mar 2024 13:15:20 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i10-20020a198c4a000000b0051330fe710dsm1994042lfj.169.2024.03.05.13.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:15:19 -0800 (PST)
Message-ID: <d655a4db-89a8-4b03-86b1-55258d37aa19@linaro.org>
Date: Tue, 5 Mar 2024 22:15:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom_scm: disable clocks if
 qcom_scm_bw_enable() fails
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240304-qcom-scm-disable-clk-v1-1-b36e51577ca1@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304-qcom-scm-disable-clk-v1-1-b36e51577ca1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 14:14, Gabor Juhos wrote:
> There are several functions which are calling qcom_scm_bw_enable()
> then returns immediately if the call fails and leaves the clocks
> enabled.
> 
> Change the code of these functions to disable clocks when the
> qcom_scm_bw_enable() call fails. This also fixes a possible dma
> buffer leak in the qcom_scm_pas_init_image() function.
> 
> Compile tested only due to lack of hardware with interconnect
> support.
> 
> Cc: stable@vger.kernel.org
> Fixes: 65b7ebda5028 ("firmware: qcom_scm: Add bw voting support to the SCM interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Taking a closer look, is there any argument against simply
putting the clk/bw en/dis calls in qcom_scm_call()?

Konrad


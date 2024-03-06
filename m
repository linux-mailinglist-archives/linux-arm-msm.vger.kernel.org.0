Return-Path: <linux-arm-msm+bounces-13472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B93638735DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 12:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB10F1C21C23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 11:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B887FBD5;
	Wed,  6 Mar 2024 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5bjZv2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA77FBA1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725697; cv=none; b=MUn/nWfdohNkVj5dDR5pttiD5VcHwt9e6CYUiz4Cx9vrnlH3+lJL2v3A0UO4CAHm39EHxn6NlXukcsPni3hz3h5VjtmcJWeTpiktMJq+P+uTfWKLsrikE5RZB4H2PE3RbdDdfMV2ORoTgq3WhfuTo4QhcO2JfzclwursjjimKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725697; c=relaxed/simple;
	bh=/NaooI6MCdbyOlXlO6KxhqtDj6Xc9BLxT2lYpNpuyTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXDzGnxaDYddLS+pgP3wFinMEt+IKCt+B4M9MJhaauOP5FBdJZ74GIaaUkTHbPEPHXJci7IQg8FakHgyQeOMn5BJPQbJodtDDL78+kSOIPXeZCNm6pQQeu6M2XdT2Jborj5R4A/fXytwlMoCjIV/UQdZMJ9VqNwhgy+dHfDkSwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5bjZv2J; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d146737e6so5232933f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709725693; x=1710330493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdjqKhX03PzSI2pyjOvW3uxLZQ+MIlVgUNLnoaZ5QpY=;
        b=V5bjZv2J3imnvnThGkTlo+FkH4FH3cxv/3MgIkgQZodEKj7v5zGxaSHTlayFI/PdBv
         mD1dOS6VXD3jl9L9rtF7wYpaeomReM7nISz+C2WF34p6mST0JJ/pLS3/pOXn2iQLxNJl
         45Cv+qNTl0zEzKC9WBiBwM8Qj1zA6qlyaCNls+c8gonKwSyTIvW4l5pn+t873BIE9X76
         sd3amm2NVA3TZZdvx0CZT8IOsn2RGT2l9dzEI6JRj531TocrJtujPbWHQxbKMpIlyQJC
         69N/zfJD1hXwXY9vGZvBuhChYDBSWYPEphmGy75ajBcSBNqpjZz7P/IPzMWoPrSaGGRV
         5UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709725693; x=1710330493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdjqKhX03PzSI2pyjOvW3uxLZQ+MIlVgUNLnoaZ5QpY=;
        b=E/o05sl3Oc1dEQ70Z3A29E6Aj3+X74mwA2RPALKEI+BBp0TZQbjMa1+FLCmz4w+dlM
         HgO9dflMSHfjYtOlP9x1ga2YINIQt0RTbK3N1pdxPcdAzV5wC1XkQzKcBW9yvIDtf0hG
         qv9b3m3MVWhfT1W/5+RQTRat/kJZZRTk5ZLqDCNsJRzV7EDGGWaU8fG3+SuNW7Vxg+FB
         tYHT0hb/QUsumImisB3dtUBOsvkK90dARyI7l6D9YC/TiKVAjFb6YDkkSBJj6H8aQqgS
         5unazVOJbW5ddtzAGQQA7OINdd3NNekYIR6Ad+PsRKB7O++WkX7ucifE34cg/GLfXonT
         PyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWndNBK4dKzslOvlk6cpf5lwp7ihbfyN60h/MDXOWo2hGb3XYYcrcz55+ijqx9U9yhEvEtYWwH5wWwNScJzeLMv5KwMp9QKpGfbxrjbdA==
X-Gm-Message-State: AOJu0Yy0ahrulzo93f4YVpcQXJlBWu1d1ZgDCGT2doWCy392iLz4guK8
	TrwazP4rpkFI7B4DfHG6FADllan2r+/4sPkkhju+jdzTtjvetgjKGp46Wv1PLZA=
X-Google-Smtp-Source: AGHT+IFRGKSDU1o5pzZkisag4+rQAq6jSD+XrXtlozIedUnam1oEQFdwWmmInfdxpXcI48SF9F2kQg==
X-Received: by 2002:adf:fccf:0:b0:33d:3fed:3a18 with SMTP id f15-20020adffccf000000b0033d3fed3a18mr10598070wrs.51.1709725692648;
        Wed, 06 Mar 2024 03:48:12 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id da8-20020a056000196800b0033b87c2725csm17275033wrb.104.2024.03.06.03.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 03:48:12 -0800 (PST)
Message-ID: <ebe234db-73e0-46db-b377-6b9f960597c8@linaro.org>
Date: Wed, 6 Mar 2024 11:48:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/20] media: venus: pm_helpers: Rename core_clks_get
 to venus_clks_get
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
 <20230911-topic-mars-v2-2-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-2-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> "core" is used in multiple contexts when talking about Venus, rename
> the function to save on confusion.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 8bd0ce4ce69d..ac7c83404c6e 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -23,7 +23,7 @@
>   
>   static bool legacy_binding;
>   
> -static int core_clks_get(struct venus_core *core)
> +static int venus_clks_get(struct venus_core *core)
>   {
>   	const struct venus_resources *res = core->res;
>   	struct device *dev = core->dev;
> @@ -294,7 +294,7 @@ static int core_get_v1(struct venus_core *core)
>   {
>   	int ret;
>   
> -	ret = core_clks_get(core);
> +	ret = venus_clks_get(core);
>   	if (ret)
>   		return ret;
>   
> @@ -961,7 +961,7 @@ static int core_get_v4(struct venus_core *core)
>   	const struct venus_resources *res = core->res;
>   	int ret;
>   
> -	ret = core_clks_get(core);
> +	ret = venus_clks_get(core);
>   	if (ret)
>   		return ret;
>   
> 

We have vcodec_clks_get(). It seems a bit nit-picky but if you are 
tidying up the namepsace, then I'd suggest venus_core_clks_get() or 
vcore_clks_get().

Seems more consistent.

---
bod


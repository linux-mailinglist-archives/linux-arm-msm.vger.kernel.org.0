Return-Path: <linux-arm-msm+bounces-8001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5338396D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A572D294667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E98B81AD8;
	Tue, 23 Jan 2024 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a71sppmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE581AD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032058; cv=none; b=DZqDKZYVjJjTdioiDuW3TuYn6PEJfgdAiM8qasZPTuxoFs8sjTZ+LQtrxUibMUAmoAl5uEEEaDsuUJcAnJWUyV99urYttlM+2JCu9BTIocAvbCvJ9e97hg3llw8pPBaBYCl6vH7L02gj9B+B7bbSCGVHt8w3KTZQY/nE9XCrMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032058; c=relaxed/simple;
	bh=YdAKd8XoB3/ojklKtoW2d/PEp52Xm7vQ/1wzjyM7Njo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMU9M1RL7SaSCye8YzvoSK1d+HZulDSq/R260uY4Gxq5EvyVvdId3tOfRPrsbM724lewZEmYWuhnHCk2pQ+2jjJeJ65Fev3lATaW5nq1UiImUo3oYd43VTz4jHDXYwm9xA9+Z8OEVwx+lM3N50IZ7NQOUp8wNOmZf9RmAzSXhQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a71sppmp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so5771588e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 09:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706032055; x=1706636855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xGfYmopes4ykntH4ktUyEr+1jXwvGHf/bYmnlHLwxs=;
        b=a71sppmpXAqdCC7TpbtC+3Qu2fXJ276eVy0zeXRwvQr+pzm85IUbxDiFbUDsOZ3ih0
         rIFk4TzIOP5V99sGf8+F+XLNIXpRxK81w92pCyN4k5yAC3pThujTqCLFdNx+n4jVzNpD
         fra4x9uPIMQB9J4J0i0JTpZoOKM4R9J2Dcs3Mjjv3uoCpujZvirgXWF+S9kexTMjXhPW
         N3GeYr89lYbufqG+ovMJcU5acElcbKZmixsTDgDtMlVpTxnFiKsXowvtE3nnbKMtHCT1
         90Bk/HaKC9R2QSg80J7AyhbmBqKK2wEdeJjwFO6zru7tpTmf1MHksmk1YiYaTs5bkxva
         9GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032055; x=1706636855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xGfYmopes4ykntH4ktUyEr+1jXwvGHf/bYmnlHLwxs=;
        b=BksD4jCWAFW72i/CTd/PmEzrZOL8lB2vhydg4qTZ0YozHDa7tW8IlDHk8OU2IwBbzB
         3keu7fAGHq+RFrGCsOhropl/5+85F9Ku+wHfvtq/53gPPEIJKRc79xa8rpkLA0dPPAEU
         wwc9U/zCuGM0lWemIKF9ZBYeNrFty0UA6tZa345CMZ7jq/xXt0Vz4HDMedz1vuqesLPB
         6CJaz7eQYZSMSqgs20qZuwoVvHPsgqGzrFVOipW4Rr++hl389NRiIIfrVuTso15SsW4q
         PjFT91Vb2d5s644gyRD6brH8vmCKV9AZwq5mGXZjJntnAvvgnXkFFLHekWbEiWqEyNeT
         UTNg==
X-Gm-Message-State: AOJu0YxwJf5LC6LVwnfxX4kl8C1+qTDktiJE/e7CKDAI4K866dGf+3nj
	NTqllsrY7iZ0ArdcI15/u0Woc94ekLVahSY8Vu7kreeZ3Z7m+GkE9I1O3+akYDk=
X-Google-Smtp-Source: AGHT+IG516HFF5Sf1auhohh1cpQeonpngG1CTtP4ybKJ+ixd/4zpZU641wfVfjcasCJQnnLATvwDDA==
X-Received: by 2002:a05:6512:12ce:b0:50f:1124:2c63 with SMTP id p14-20020a05651212ce00b0050f11242c63mr3346612lfg.101.1706032054676;
        Tue, 23 Jan 2024 09:47:34 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c14-20020a19654e000000b005100889fbd4sm237118lfj.279.2024.01.23.09.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 09:47:34 -0800 (PST)
Message-ID: <d31a52fc-9073-483d-b84b-1f02a5698a89@linaro.org>
Date: Tue, 23 Jan 2024 18:47:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm8150: Add gcc_parents_0_ao support
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com>
 <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 17:34, Satya Priya Kakitapalli wrote:
> Add active_only support for gcc_parents_0, this is needed because
> some of the clocks under it are critical which would vote on xo
> blocking the suspend.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Is there a need to keep gcc_cpuss_ahb_clk_src around? Do we do any
ratesetting on it? Should we ever turn it off?

Konrad


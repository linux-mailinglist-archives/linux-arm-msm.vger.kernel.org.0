Return-Path: <linux-arm-msm+bounces-1530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4D7F4BD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 17:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2E851C20945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 16:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4978257869;
	Wed, 22 Nov 2023 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+bUqMyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AA71B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:02:45 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c8879a1570so38091211fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700668964; x=1701273764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vr2sj29czR5v6hlCqTmdn2dM09cmk1PbJ4WRUrk7U7k=;
        b=l+bUqMyMU3Yrl+xQHlrNAnWTnkOny9MU11O/GtSryeR4qakdjciGn1xyhhqfqZ55sU
         qYEzrGLy0FC5lXd9sQ5YfnpXik/G+I4ntO7pmIAQE2i/lhTO2G/0NEueoJ2glM5mprvL
         XgbSkipkcQIWWBwir0aJ2907Hnm1z2eXwygmgGhEWVnX2on+e0qIZzeANOLB8pOQ1LsD
         LMC8bygv9P8+ZXvBCKAJleaMIBXDU+z5faHoDoOc7RLIExVkoqieQsYJcA4Yyn2MdMPP
         XtAOfZW8+pnknub6pRdWtILFKBBXcAS7bmC2uWGnD6RGs9EUa/U+rDRdxtY+/+zF4MhU
         qj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700668964; x=1701273764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vr2sj29czR5v6hlCqTmdn2dM09cmk1PbJ4WRUrk7U7k=;
        b=fDzjCFcTi9oh+LhOy9eBMZoKUjENqAUN6obZKbtLr1ezvOglJr2KBXU5l1Odj3XQvJ
         BiatPuz4ho+nlBBx/6wAm5Be9A+ZWKezGc7TsVgFFUG6bSa1+nquE+FbJANUkZ7fzqJn
         glGGQkms019sb8lBOS5NJwEd6Uc0mq6xwd7psX6ucLnsWb9RJFAc5tOYvBP851nCb+dg
         NrSVqplIYR8j67TCMHuXRgZmjAGUAhHt/Xpmvmo4uJzdxPNwgPl/8UyIy1DgQxLtEbPt
         ELHrCL4nHF/PzzyCMYNzukWPqec9daqsbLItnt7hE1HBhi86u8EQ7i+bSNof4AwNdM/0
         mlug==
X-Gm-Message-State: AOJu0YxBXBruvvM2R9+/Ay56gb2yZvxDZYFk0EFCNa99GgOsLC5c1hB8
	ZiH8HkVSavsv4iQXqB613fRj2w==
X-Google-Smtp-Source: AGHT+IFBAFL84SqNmL1M5tuvjN7IgtJnctX+MYg6x+eGXmvT3bimGFiGLwQDQLi+kvh7pV8m+IGRpA==
X-Received: by 2002:a2e:5c43:0:b0:2c8:71f9:4ae8 with SMTP id q64-20020a2e5c43000000b002c871f94ae8mr1984517ljb.5.1700668963701;
        Wed, 22 Nov 2023 08:02:43 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w27-20020a05651c119b00b002c8787b3ac3sm1091916ljo.103.2023.11.22.08.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:02:43 -0800 (PST)
Message-ID: <2b619607-1219-46db-a439-0f087b8b5d3b@linaro.org>
Date: Wed, 22 Nov 2023 17:02:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122042814.4158076-1-quic_skakitap@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231122042814.4158076-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/22/23 05:28, Satya Priya Kakitapalli wrote:
> Update the test_ctl_hi_val and test_ctl_hi1_val of gpu_cc_pll1
> as per latest HW recommendation.
IIRC there is SM8150 v2.1 that's there on most devices and v2.2
that was used on the Microsoft Duo (or v2.0 and v2.1 respectively,
not sure, don't have any device on hand to read it back), do these
settings apply to both? Are they different for mobile vs auto?

Konrad


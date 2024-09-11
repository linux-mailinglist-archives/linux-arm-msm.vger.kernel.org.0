Return-Path: <linux-arm-msm+bounces-31467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18822974DB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CADA1F22A1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7679913E05F;
	Wed, 11 Sep 2024 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brrVM2Lp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A386033086
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045151; cv=none; b=JQS06ZYCm0uxhBOqpj1UwfLcpAVFgEhhyuXNEZlyNGVDI6PbB7ywBlC9CYF+GjMgU+Ne2S1D9FpVaIA+xqu1+ZgCWHmK2UGj1/qjvACbJffqigJK9TusllhKMkzeF1kw5QnM3NaMWUiWFeEgwsg3TrYFvS2Nn37sqQwfl1dlOyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045151; c=relaxed/simple;
	bh=RXcUU9kvB/0Lyk/xqe7Tia35vTzjcbYYrmrNIZh3fNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWTsdZqPjW8enHeS2nfE/tu9Ecqa8XX8JmRgaRhZMzHAyU2/4TImu36J3f9Mdwzmok85drCkIOefkgg86Ib8uJfF7dnVWxNxAGITy7Agw/dsnPVp04GjkuGI+BqIAIqUDzZ8mhn/XfF0MV55CKykrBR244seVpw14rhfivdfvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=brrVM2Lp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53654e2ed93so7225797e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726045148; x=1726649948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBnIbKIrzLr2LRaTxm32XswuLSx/2Q2zvIDfhd4W5ss=;
        b=brrVM2Lpz6dLkz8rpr4Hl0y8iNW2JW1VF6uDvhsDgzTeKg2Ynt7GklrQO3k075J/FN
         MNzLmiQKDfOr9bjbOJqIi/jC4ieMMbC2LlaVuAlg0SHJK016tmT0PcMiDmgadwOq0HJc
         aNGLOPaRGa6XV3NjSBCl0KNBO6pvXEnzvcJaQSU0J6maMvHVNpESrMlfq/kPU27XsRX4
         KVhIs1DDsxzVgP3oAaWQA0wLb57UJTA2qVNtpwpTL/hbJCPxtsIfbZLGXb+FCWIEggh1
         uQV/ZdBF7Qunm0cxo7FhgdFcKhIEDYqY2oxnabD6U0j3Ypp2tpyPvj0CMtfJ/b7fIira
         Uxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045148; x=1726649948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBnIbKIrzLr2LRaTxm32XswuLSx/2Q2zvIDfhd4W5ss=;
        b=aJabYl4AfAiyWKppUmmZkOD38sLqais2ZR1hI2Pf52MXaGQWwScSa/uGyVdzd6qpBb
         Lzh3WzirgkRrgdEfz4rsHJonH9AmROvu7JQH3lzsEkAwBKlTC45MievtvKnxnEoqDvik
         O1A5fzOhTiaHCPAviHq7t1LuZ6IpKnf+Lx20/MPqQJbiidKmbdHOqAA+gre58rN6qE46
         UaON7S8MGzpsuuiZqZcbbXdnzVndWI7j8+I1F8bUoz0h2oo4Dw3Ciofe5LD0Fl00CHQ5
         1pMiPeXpNdgC08pee8ZxIs1rKy+wovBKFMyinHX2uh0sL6bsb3phF5TmlHQym4jkLU99
         oUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRKVCMWdmDlRntQV5EQYHTm8VGbS8lktRGXWM4MWYmUAXeADDnjxjcg3pt9Jd7r6sDQFso0nL8pGpON4wL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+3u5db2r4raEC0QF0lc8hrAUrH0/wH1CrEwGmMyBRVtcHYIN
	eev6NWf6JoVpghXqeDMKEw78gLIeTEy0N1w7gjox+QaKE9vh7avzY43Mh+q60T0=
X-Google-Smtp-Source: AGHT+IHp+NhjW4PX/mPJqKBq2KEi3a8zecCL6S3kVYpsYCxT3jOueJVqY771ut2JA1TGcENNWw+qOg==
X-Received: by 2002:a05:6512:230f:b0:530:c212:4a5a with SMTP id 2adb3069b0e04-536587b424bmr9836628e87.22.1726045147412;
        Wed, 11 Sep 2024 01:59:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903b10sm1547415e87.189.2024.09.11.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:59:07 -0700 (PDT)
Date: Wed, 11 Sep 2024 11:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH RFC v2] soc: qcom: llcc: Use designated initializers for
 LLC settings
Message-ID: <6zxji5toy6mfqvjkq5qyj5m6znmjve6wxh74dxeetj3ragr5r3@dycjj3ihcw22>
References: <20240910-topic-llcc_unwrap-v2-1-f0487c983373@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-topic-llcc_unwrap-v2-1-f0487c983373@quicinc.com>

On Tue, Sep 10, 2024 at 05:01:39PM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> The current way of storing the configuration is very much
> unmaintainable. Convert the data to use designated initializers to make
> it easier both to understand and add/update the slice configuration
> data.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
> I put this as RFC, since this makes the file gia-nor-mous.. However, I
> don't think it's feasible to try and update these values based on
> available information if the developer needs to count commas in the C89
> notation..
> ---
> Changes in v2:
> - Drop parameters that default to = 0 / = false (except .cache_mode, TBD)
> - Fix up 8150 GPUHTW being out of style
> - Trim leading zeroes in hex, make all hex uniformly lowercase
> - Link to v1: https://lore.kernel.org/r/20240907-topic-llcc_unwrap-v1-1-cc6479a15ac3@quicinc.com
> ---
>  drivers/soc/qcom/llcc-qcom.c | 2644 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 2375 insertions(+), 269 deletions(-)
> 

Manually checked several, but not all table entries.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


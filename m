Return-Path: <linux-arm-msm+bounces-14718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4F885776
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122C4282811
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBAE273FE;
	Thu, 21 Mar 2024 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYFXpi9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2556451
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016964; cv=none; b=kulaqqmvRfxMFdzfeLlCTCow+0FNGbst7klGk9UciiDwJ1cmUhk56//IEZKE6FvX7XWcuc1cdw6XCCp04Et9tsOfduT9f9YdqadplcpeZWC6DHEwyvy9fyyqbirsMVO4iRxLn0bSKsQpnjNJ8GjieGBYzji6UUIDZ4Z6gca/6GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016964; c=relaxed/simple;
	bh=lr/ld6LZKki83QfUyI11Gr3pibctAzUl0+BQ0vKyXpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjH3jk0165+l7jRdWeGnBWyt4fI4sGxpBYwp7gKBJ3zGHd+tDD1B9r3TxdGOkUzfYpI1bXfH+ofwwN3BAc37pgWXqRuZnAdPpjydeB+rBCBvbFm/znqUWnzJb6rmnjgVxCMEUTr5QaZCXAdqiagUS3zQqiZMrYO0+6Yw1SBrWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYFXpi9V; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso804587276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016962; x=1711621762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/sfGiMQOWE4qVjOwgz/wWhsIkX2dxibhY6pkQCwewf0=;
        b=JYFXpi9VN51y6ahg89/j8fUJONXl7O5g1SmSnlCMeUTWqg0M9G9WzflKjitpxEawpk
         85DphiFxO4qw2W5J4icoTfIbZYlAnvDLphOew7muUpaRrvi/NtP9gCkp6L1l2ACTtXst
         K14PMpkoZTozxxm8GIp1HLY12hIteHHh9MH/cvT+I9Hu6Nv92aiTJpwn+WVUhjDSJn/z
         skdz7xBa4J8HavstvE5XqxIv16fMrEpJKEuSc/iu71ozmuyEDggIP/svJYiHul38ptMx
         P1P7XiYf2LaoFjSjq9F8bxVtk5xit9jgJj59e7pVFB3HO7uLbpKQ9vTAs+7puKpFAi8v
         3mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016962; x=1711621762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sfGiMQOWE4qVjOwgz/wWhsIkX2dxibhY6pkQCwewf0=;
        b=ez11CgnlL5luwl4ae3RrKxlhEvyueGrV+GyyJNIGDWN7sg6YDo4IEODcDxqt7nswTd
         6TcCpBrjO/DCceLU2yp/6lYgl4mAxjGYMrYgzRKpxHRiisf9KOAQzwkgEVc0xGNNGbYF
         RGYd3xbivUqyb/gCzbHbeVsejjvMUqNgK2DQ34F4IAp2ZtpYlRTm0esWxcfY+Agm3aSz
         i7Hwg8kvdv2ugXVEk3IsiZQgv8Vq1TfM/AhAiFasL6gdON38iurLnxcvzYEfoM/0LSaZ
         Noenwu5T7HnWZzJyQS5dEqa3raUWwDXM2M+qHgrWQF0jEvwHtDqhZbGbDcI5pxr1cvw5
         7Aww==
X-Forwarded-Encrypted: i=1; AJvYcCX+M5jOeBWpyzUsHrYMTHwSAf38XeoMyHHfComWWKR+8ZUw08fwb45lTwVpfRqttYvFDP4XCtoHtZXnYf1FLIKkVprxLMvpTPhIONWDdQ==
X-Gm-Message-State: AOJu0YxBawH+VGdIG4AV/nPeFD+XlTRrMehifJpeNrbvg58F+D/WZffC
	pW7It155cOPp3sbxqsIAUM3rMz1Yovb3EIJybe1+WPy8HRrUhWrsqRTtdn7Aho2AUoOowafpfZc
	Ca5yIeTnUXAE3MikAANQBY/H2vr2xWP4a2K4R/w==
X-Google-Smtp-Source: AGHT+IExbdetzQ9xDBaxa779Os0rcJeKqehsNC5UOgPnByKQYAfthML80JKoXGc0ZMbS3XGvTEwkkqHMcTzwiPZ6/J8=
X-Received: by 2002:a25:b502:0:b0:dc7:4564:fe6b with SMTP id
 p2-20020a25b502000000b00dc74564fe6bmr4133015ybj.60.1711016962076; Thu, 21 Mar
 2024 03:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-5-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-5-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:29:11 +0200
Message-ID: <CAA8EJpqRs81-8wdufLcNFWKpAkF2=d+6TrOApJNOV2XMcYAT1g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] clk: qcom: apss-ipq-pll: constify clk_init_data structures
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The clk_init_data structures are never modified, so add const
> qualifier to the ones where it is missing.
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>  - no changes
>  - Link to v1: https://lore.kernel.org/r/20240318-apss-ipq-pll-cleanup-v1-5-52f795429d5d@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


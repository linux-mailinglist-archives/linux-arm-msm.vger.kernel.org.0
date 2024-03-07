Return-Path: <linux-arm-msm+bounces-13640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FF875933
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 22:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443311F24071
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 21:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB65613B78E;
	Thu,  7 Mar 2024 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9IcGzz0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2369913B784
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709846712; cv=none; b=PjziGr1K7GDYyS1tjyJ3ADFyjcHkOWi8w8X0IdwBv6Ctd/8x8IGTZ3uR1mAt5IdbZAi84rMircfyUnPTsvi2EX5eFrvMipJrdL9M6iF95IP43M6Y48L4Ve94CYSSIcxKCHPS3PxPyBXC75p3y3ZS0Q4jZkL0OZsjOVHz7xA+sR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709846712; c=relaxed/simple;
	bh=fmMP5iKplWZjMSpRw/sZdefxBphDjLLMtsB0POMq9wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrZ/mvm/qhE0/H9957ziAKmDfExcIJWFnpTCEVtrxjBhqmlwJzAKDPQ1pHkzV6jVHcO7GEi06Y5WmaXwAUGaOh8qCsY9EmEF3hNBDTEW1QA7U+QFlja2LwCAkpIQQROQJEKdzjUytLV8lwCBzZsR8ozngxqJFYWsrHWrJAUFZ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9IcGzz0; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6096ab005c0so14603277b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 13:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709846710; x=1710451510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b9hhcys1gNGaG07NYC+PK2//TEd+2vYvb6mO1ZLDuZE=;
        b=t9IcGzz0Nq1flpUvdkBGP5Euh/4CAnc5TKttnLkWvkLIn0vK0i9rW27uOo9+SmUQlJ
         VCzJHkZTAKx47kejlueRP2QE+k5AjymQSVlYHD5qsHOxCA746r7Ga3CVzbtCpph85uJE
         9tDorYeSJPafo9f83e2tH7IoPOd+l2oUH+7b5df3G0ffh5nfJKAxMymyYAF6v8DeZGuk
         2esjb8Go/cTbBn/WpbydR5opCavOrbjnogHsfebj6kS+dF8ROF10DJ7myT/2kYp005Ul
         ZtpZeDSeV3kScmmS4pmy7emHfBqUF45MQ5QP9pPLuCeivqvJAdzhW94033h4yUUaIyWt
         axwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709846710; x=1710451510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9hhcys1gNGaG07NYC+PK2//TEd+2vYvb6mO1ZLDuZE=;
        b=YHa5MgTr15wwZQ8ckWM6umbObwMTS7FQxNMMQ1G8mkea4k8YFXglI05+9R23qNwgUo
         8OhwhuJPJ9P9hH6wecxqNqMYs1pIGvXs2KFZbJe7a0c8CdVhXsO6MDnOAhNcb2XYcg4b
         CUl8a0J0uWlZ/ZJOz95Q7AWrtLcaexc0YmB63Nop5rbVf2shmLvijii+a6mfYDD/LMsO
         fdsoiZDGaHKM8VcgzhOr3PMMYv9YzmnEWUhh5dRx728Ny2tep+Nravf/7O/DizuoQrp2
         qa2JhRYFYAW+y/w8cAY1Cn0mhTsX008oNRnuMG3uGkrQgZfAB9yhhRwd5CtrDvPqhaT5
         9hIg==
X-Forwarded-Encrypted: i=1; AJvYcCVe+e3aWPn4Ce2q2aUXqhinnr4o7IAZD8jOc3AViXv3D+d3jeOqm2ZQHPO0Q1DuAGq1RqirHHh9srmbfxIXqPqnt8DO48afxnGaP2+iZQ==
X-Gm-Message-State: AOJu0YwMFOzgYnAxViGnHNjp7fqwJPdK5UZpN4UNgV/kiE45UszNnE5c
	8evM4w2vM7iuXv6TcEx2j8bo1l+5oOCtRrAOZanlCQZYf7XScId3zQPN8XQUz7o+PcF0rP4C1IW
	+xZyhIICCqbWO7G248pbN0oNFlnMPO6UcCKiD0w==
X-Google-Smtp-Source: AGHT+IFeiIPNPn9x5gaa4VWCe7fO1lW7o6wG5lJpI4FhUITzOYaLQsMD+ZKsTXTO2rCcXRWB2h99TPW5M52TItEo/AE=
X-Received: by 2002:a05:690c:fc6:b0:609:2fad:a9d6 with SMTP id
 dg6-20020a05690c0fc600b006092fada9d6mr25256866ywb.7.1709846710102; Thu, 07
 Mar 2024 13:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
In-Reply-To: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 23:24:58 +0200
Message-ID: <CAA8EJpq01SPGnJx-YrM=GDRVD_DjYwMQqL9D9v5jADwd3OjVsg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 22:56, Mukesh Kumar Savaliya
<quic_msavaliy@quicinc.com> wrote:
>
> I2C driver currently reports "DMA txn failed" error even though it's
> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> on the bus instead of generic transfer failure which doesn't give any
> specific clue.
>
> Make Changes inside i2c driver callback handler function
> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> stores the error status during error interrupt.
>
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> v2 -> v3:
> - Modifed commit log reflecting an imperative mood.
>
> v1 -> v2:
> - Commit log changed we->We.
> - Explained the problem that we are not detecing NACK error.
> - Removed Heap based memory allocation and hence memory leakage issue.
> - Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
> - Changed commit log to reflect the code changes done.
> - Removed adding anything into struct gpi_i2c_config and created new structure
>   for error status as suggested by Bjorn.
> ---
>
>  drivers/dma/qcom/gpi.c             | 12 +++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++----
>  include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
>  3 files changed, 36 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry


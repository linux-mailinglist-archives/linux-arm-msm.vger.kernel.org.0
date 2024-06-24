Return-Path: <linux-arm-msm+bounces-23874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DDE914237
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 07:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E6F1C22BB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 05:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B73B18C38;
	Mon, 24 Jun 2024 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AT3H1Pc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F531BC3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207570; cv=none; b=bzY08/ImQZZgC5AzR6wiYw+cg4gG+m0w/Rrd7foXQmRhCRheklGHgANpdL7/UlNtFRaNzywMho5x7EQQnv4Xs9V1RMkfk2AjsQnhxmk6xuzoquyoRxYzJB2yOCP2SrmslB7VMO2/r2KGtoKiROPh1X9N0uyC7w60iRxiT+z0rIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207570; c=relaxed/simple;
	bh=68opku4OyG6OmJwgb6WH++M2tbYDZdg7dZF2Gk20wkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTycM27TzbA7BkEddJPPN1iR400HuKVU63s5nbpXwSE/y8Hkq4rasVi5K+geltf97QNBMfgmIyxziPlPU4Q4iP0CQHoEH009v99GwiMluNJXwhynRm+GScm3KZ7naWw1VU7n4zrhN2uQrv4aDP2HTXAsJY4jrxhulkQYOcEmPiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AT3H1Pc+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so1367524e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207565; x=1719812365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSa3xTd57H9MrjDOBYM0uRtrP8SSrHpws0N+sRWwWEY=;
        b=AT3H1Pc+pOd4i9M1+SA5LdJQceg9EswoCnCLQVGpFV05+NoUsqefh3t0SWtow211RC
         y16eBRbzIs1hNAyvZPD9NeGFDYeEn6qvD+lhVjuZ5Sk3ulWcr4S/GmhlTTx8xeNcufrm
         HSU5PO/kBCKVb7JfOBp79pVPM8s8r0ACnMAJhQMNTZRC+tZiu/YWFzO2jwjPRupysY1s
         f3xjl3sxzrU1LTXsJUfSss1v9TNaF7woFvpVMmalBgV9evUZb608DUr0on1TZWkMwaD8
         dO+oLYy+zTwAewOgTICGlSQflkyajP0pIb3arMAthP/NbY9I5rr6OLIrHyZUU/c7ZvYq
         Ekog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207565; x=1719812365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSa3xTd57H9MrjDOBYM0uRtrP8SSrHpws0N+sRWwWEY=;
        b=V555Gp8I1d1A0V3Mcm9rA7iIivtCQJFNIaj094w9srGdEsrkVLytvEymeYNVZtUeqc
         eiHYHIIPSgIER3HyVM20JPcT03qcy/k00eWhr6B+1cSzaKRQo01HEM323mIIrcEh8yFN
         h3qMcEF1SZgIg99cr0T8qfusQ+Xbrx9EdLKlfts0J3jne+mQvGQbQw/C7kO0oIy5DncK
         071I4RlC/X/CMyUPQcJnvO13lzQcaLhVk9/arMS41RwGJBATTHCHvQ2FwIdDfilM1YBe
         EN8lAVSOQw1j73Ucq9SPasuzAGYDFtu5DF3YvxuRbCSAX7YMCTQMd2e2VyPX98uQ8PoY
         tLzw==
X-Forwarded-Encrypted: i=1; AJvYcCUVnFEAAtzxfKXLvsshPIHPEknwM0CvALRZ8DAU9qTJiy14Tg4gawRWuS2efirhN/kpGuo0sjA1HuN/6j4StJust20PDyUCeq8E6Rx71g==
X-Gm-Message-State: AOJu0YwKCDfCmenSjMqujCuPim9+8guXQF8lj2xWHPZ46ylF9jKFrWt0
	Er0TAWhTj6Br9ZV0Ot3bLdbQoYqDOuRBI5mvCwP+wQa6qj4xxNNrbaqqyEANjkw=
X-Google-Smtp-Source: AGHT+IFcbWt2iEMxFWb84NrSYaeoaf1H+jGCDGgH4AmthdWc7vARt5ywIshEOxo5cQDQxUNAQoIB5g==
X-Received: by 2002:ac2:5a51:0:b0:52c:df5b:fd9a with SMTP id 2adb3069b0e04-52cdf7f6657mr2579793e87.32.1719207565384;
        Sun, 23 Jun 2024 22:39:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ceb37df50sm26079e87.75.2024.06.23.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:39:25 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:39:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 6/7] soc: qcom: cpr3: Add IPQ9574 definitions
Message-ID: <vohhbc7al2wsozjkjzqmejz7jbiokxjbv3vgiysjwaejddvloa@xars5kak3t2m>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
 <20240624050254.2942959-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-7-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:53AM GMT, Varadarajan Narayanan wrote:
> Add thread, scaling factor, CPR descriptor defines to enable CPR
> on IPQ9574.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Fix Signed-off-by order
> Depends:
> 	[1] https://lore.kernel.org/lkml/20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org/T/
> 	[2] https://github.com/quic-varada/cpr/commits/konrad/

This should be a part of the cover letter, not the patch itself. And it
looks like From: is missing here too.

> ---
>  drivers/pmdomain/qcom/cpr3.c | 137 +++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)


-- 
With best wishes
Dmitry


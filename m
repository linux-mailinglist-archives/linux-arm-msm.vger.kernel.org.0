Return-Path: <linux-arm-msm+bounces-8350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC5A83CF32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B035B266A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0760E13AA34;
	Thu, 25 Jan 2024 22:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bW2gQW2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A99C13AA3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220824; cv=none; b=VA+X0ZTG87I9w3O8HozQ++yjXv0TzocEReALJKtwzRLKSF5t8EjkZcAUoZ7vhxTxEe2nmCTl+miDC+5FN0/9jjIVU5/4B4iYuYr0yT+Sg5oOGrFjoeAf+KPcUELB1vlcKsM9vzGIH18RxGOWnrmaKu7ITwUS4FxAUdFzAJyuBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220824; c=relaxed/simple;
	bh=/q+OKPTvjfhtwgZQ3LtD4ypTdtx/UFBmU0i1AagUJwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=du94KN9pexieoVFfRqz2tA6rf71efLOb6IgZEL1aLsVJUORY0khRNf1Nmt8uWpn2sWMaHlyGIpwL/tFA8fcpz0hue9B+54FrsQLCwHVrgpGHFjgRu0odENjdSrUn0QXXNOuiHN/Ts2oqyGekgXeSef/O0Zj8UHHz+iSc02cSKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bW2gQW2s; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5edfcba97e3so74222787b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220821; x=1706825621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=slwtZcSfd5oU0OLpt8FDjn7MWT/cYH2TJp6qwy9HSCY=;
        b=bW2gQW2sQmAslc3/bpTtAV5QqH6TAAxFQ7V9JEk58Cq7AkNeKTYBKSir+YX4kZvBfL
         JICtdNL2fOWOOe43hSPVvdmWUjPzsHfuXp08B+scFUSFVk/p9Q41rvQHt7GoTTgfk8kS
         XtVDn8RZ5tbcQsqmZK2/HLNXVhib5iEpvoArs85b/PC407wLmc2QmOPMllWxzqgkHrAZ
         SnoIVQXKpw4KUtAEJP1sEjtPa4+LjnxKltA2WvH9MIqae7ytMawnFPt2olm/H0Giz+2X
         PMH1u87jn0KiQWKtpXmp7jXnrrwYINDo+RDJVUQMi4Xb5fx1INXPKEgWvASiEPRpSKI+
         6mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220821; x=1706825621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slwtZcSfd5oU0OLpt8FDjn7MWT/cYH2TJp6qwy9HSCY=;
        b=DDomuR7bW1qc6fOxM1DI4Ty5jiTQE77t2E7Kl7zAWccjGDT4nTPEOEf4pnu7ImIj/O
         eTPEZZBblf48UsN4LNpe/OQilFQJxaU63ItUFLjcOgRDNicvC79DxU8z6jCIyTsWaFM+
         gAKIT2ga3SE5U6nD2kpVlUo5HRyaFiWneEaVuBrHDPP56yQetiRwOsQ2fz76pJu49o+9
         mvdCD3cRNFMjsf682j01e6ZRI5Xr8qDrRU/9/vMWygcQymlkipQLBs5iymfZMZFCvLVF
         M7iECHLof9dB94mgk5lD3eEqQ9ic4SJOKacPl1F12CuFzHxD7vJg2rde8nEiV4GbAxHG
         JfRQ==
X-Gm-Message-State: AOJu0YwJBUJH1TkEXErDDvtViTT5YiVBw9U9kbOuy+7DMbeZeVtA7vZi
	yjawzdSWANMcmla52WVgYfsN2ACx7cnjScYb1Y66+6WtpSk1TUmB+c5IDhkvoMcDhbzkFGfOaWx
	qrDJaBF0Ncobc+rxUhczuca7SGxEwOyPQGgHPGw==
X-Google-Smtp-Source: AGHT+IE3TWyGHNGHsG2xqF2JXCIF6aVnGmnqe4/3CyA3myFBwqZCxjCHe2OS/OaFjyPxVBpRCKQb3m3/ij+f63iLZtk=
X-Received: by 2002:a81:c441:0:b0:5ff:7cc9:1691 with SMTP id
 s1-20020a81c441000000b005ff7cc91691mr475647ywj.70.1706220821421; Thu, 25 Jan
 2024 14:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-msm8953-mdss-reset-v2-0-fd7824559426@z3ntu.xyz> <20240125-msm8953-mdss-reset-v2-2-fd7824559426@z3ntu.xyz>
In-Reply-To: <20240125-msm8953-mdss-reset-v2-2-fd7824559426@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 00:13:30 +0200
Message-ID: <CAA8EJpqb_FFUzyGR2SYH7wwrDCrC8Wy7QcUFyJgHqAvx42Vgfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-msm8953: add more resets
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>
> Add new entries in the gcc driver for some more resets found on MSM8953.
>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: expand commit message, move entry, add more entries]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/clk/qcom/gcc-msm8953.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


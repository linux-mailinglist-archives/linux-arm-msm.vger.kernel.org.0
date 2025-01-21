Return-Path: <linux-arm-msm+bounces-45748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4EA18875
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 346751621EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 23:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648B81F91C1;
	Tue, 21 Jan 2025 23:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8VJWcSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961C226ACB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 23:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737502815; cv=none; b=W5JRwikggOEjC5x0wowqquA+l0nmtWCqgPQFsJs6exXyeYzJnO6/S+NG4HzPqtcDMvlPyaYy0gpctzkn8H0SywdvKU4ELZ/0q+S588q2CRTQp8nrsuLcxpEpK9uuS60BPbEFAMnEj1srndUgMs2YLzO89OehOxJmtDCX5WIC5rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737502815; c=relaxed/simple;
	bh=TCOCQ3bkKIctxb2lRs9F6kGeraIlr58WRXM4dWXLbcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFjFqnS7zqmPOMDRFVVeS7saYh8Jiahztfd+CH7OtwABaetagtSvUjk6d91Pe7sqt09iyv18iMCUzkJShma6QiE7V26pAa1zmhAFg194XSNp85hL5bhZW00oZ9dz55QgXumzTJnaspJ8+ZXSeYCEU0WPjlKrlDgS16Rh3U9KjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8VJWcSh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30241e6b540so4086681fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737502811; x=1738107611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mta+AIdpMSvwE6BUNwFLh/nPE1lBGYV5zcqSpOUlngQ=;
        b=f8VJWcSh+umvEIH8gOU5BWo/uCnzMw3tmLJ9D0LV1aKavluF84JnygHq1mViJ3xPRE
         ccPkjRzJvK5SODrxbpmpo9peTX77w9wFPYVmSjbXp511p3I72RAYJFnb0uib6cVJVYuC
         svw10iYjru3nolMVkHDYdchBjgq8PZ8cHVuk7D+Od43strawMoe0VlKCwtQnM1IkncB4
         tWEWWn1yfVvYtGKyMZCLvMicP9CsSmR+UayYF363uIOn925m+3XaraW4AVdcaLAouh0e
         C22F1kzxSyMbTmr92Waz8GBXgAv+2Wf4J5ZcZldurkMP4J8y1aCP2LOeN024UQGbQs1J
         zLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737502811; x=1738107611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mta+AIdpMSvwE6BUNwFLh/nPE1lBGYV5zcqSpOUlngQ=;
        b=wN0zQ5z6y2M8GLJiNFqUZPQNLbCgHT0vIHvbGXyoZBaYllUufYNEJW9dSCX54vGfwi
         pibtzNIEPQUSQwX+jpe5Mbdu2k4uaJTl+jakjDOx8f0IH5vvEJfh7dJBk5mZ0sefW2D3
         cWFhamJBx2dp7+eRoUKLbQsvFvvqk7AszbZDUxhKfQ88fC+ZOW+nOTAjvEyNMLw7ul/0
         IcvMVHBLFSZCPsCdJh5G7KJyBoOyj3sSs+8i/AWU45aPB6k9XrKz+l+7+94nxg2mWSLo
         o5xm/bvW5IMH2nAcMSQ3x6JtpW3zgXALGNfQyWpH6wNXgHGJIlJK+jYVzBhe6oVltqMa
         kiQA==
X-Forwarded-Encrypted: i=1; AJvYcCVYSBeRPgExvZiu2/on9BGGJSv9pBFN0zwPJNqApe8xtIlqPiSJ1PSfPrXQeNH7o90qNeJTVM1ZTq4PNzmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ihfFqhyDfbxzWBB7IKnVS26pVbBgnG7hU3/DFaF+LMLdhYob
	Zz5BCccrG+It0GJyspGAroyup16Zb8QdP5GXiSxlrj9r8RYVzwR9KrFadTRROaY=
X-Gm-Gg: ASbGnctQYnI9SOnwr2enpH8LLBFK5BhcIZuQlWoYv8ekJ/CcJDRNAPSb8h5eyngaxRB
	7bqTb3pB+KGYzTzAXM4iTEayttkcXhK6Ih4KmljQxhQ4cbxMMhJiY9AwXY7I1/4RzSzfEpCGGSz
	hoA/blReVCmm9SC8FaxA3Ht7tinm13xNUsq0fIdC7yRWW6ukvyoUF+s14BJHe7aMljHclcQystA
	vgs5SSLovsqhCHKAoW3HyW95wp9/IM8vugpWR5aFWYJhWTomzSkvQNP1kxyGvE74wXksAGFtvOP
	j530uu0fMOq9Qx17jRl3ev0S0s32izDbNdHBvHt1dWChwX8Q
X-Google-Smtp-Source: AGHT+IHceqea2DhrgZA2WSoQHa5W3uiLM2vb1SJRgqehIuMKTpetHNtLR3dhLF9hU56gKqpIbz34kQ==
X-Received: by 2002:a2e:a9a4:0:b0:300:29ed:b7c1 with SMTP id 38308e7fff4ca-307587aa08emr2040321fa.7.1737502810692;
        Tue, 21 Jan 2025 15:40:10 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a502a7csm23033251fa.93.2025.01.21.15.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 15:40:09 -0800 (PST)
Message-ID: <b4ed07d5-0905-4bfc-ab41-da86776ed972@linaro.org>
Date: Wed, 22 Jan 2025 01:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: qcom: camss: Use the CSIPHY id property to
 find clock names
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-2-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-2-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:46, Bryan O'Donoghue wrote:
> Use the CSIPHY id property to find clock names instead of relying on
> generating the clock names based on the control-loop index.
> 
> x1e80100 has CSIPHY0, CSIPHY1, CSIPHY2 and CSIPHY4 so simple index naming
> won't work whereas and 'id' property allows any ordering and any stepping
> between the CSIPHY names.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir


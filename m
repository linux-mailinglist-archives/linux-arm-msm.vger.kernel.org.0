Return-Path: <linux-arm-msm+bounces-67963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27310B1D288
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 08:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C924A722D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 06:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2269021CC79;
	Thu,  7 Aug 2025 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIxgQMWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED9E1F7580
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548540; cv=none; b=U/fq4b4jrcMG/oEE7s5MAwVUuh6eL+eiF5gSUpqLGHrUxOTHSggo80m3ZtJigkRiUnellTSzufMBsY0qDPJXkfhVu20LIW/Uyc1jZmllU144t10dlyveRhfDUKO/opY7I/UfyigA2OtJO7NFhr9vFhFm3q10ytpaIRGmPJsI1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548540; c=relaxed/simple;
	bh=BFDv8KwOdxE5b9FJvxGKqE2UTyIruoDsFRiENIG9Q+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhLy9gsrXOTIcyp9JCLHeN1m8uSwrs5mL1eKHQTrkMLx78liy34pPoSZPxb91r5DL+6mLrxUeIYvYvpfpGGIx7LsxOgGlHzodhcA9MHxAfEKUxNxBnMye5p09PdOlGmo1rgvExQ9zAcdg6XlTaVXstu4LtJ3ahsKoNRRmhakAKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIxgQMWr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45994a72356so4824485e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754548537; x=1755153337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R87XAIEmPfqrUnpUN7cuFO3Ri3HR4f4oxIPKr+mmdB4=;
        b=lIxgQMWrE/7IJj45biPk+YrbgBjz/x9MOf9EQK8H7azA3vxio72tu3SHuQhJnzDWjq
         r6q/Ftyq7c3O2TuvysUGLgqfzR+N7wBLcA3boh0qnGvH8PzngM3UauEfOvJhb7FRJqvv
         eFZ264lC5fWS2NFJo/cdUmezrj8ir59fZqxLD1McOLCwW3qVzZcsU24nzPmBQpPShpDD
         kLrfpjo+B2P3I1ytu//kX4QvPLsn8QXuiuSSQERWh/7TDQ1oj4wc7e3kLyEfab8mVJem
         Mz0x8PrnQyEgVFp+iI4ODNv0fzC1oXVbs0PCkqD0y75LN9kjlxBVUQLWJ5bcHwBXdNQT
         D+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754548537; x=1755153337;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R87XAIEmPfqrUnpUN7cuFO3Ri3HR4f4oxIPKr+mmdB4=;
        b=smJr+C8UeCKZlx07GNETFDg+iJxiFz5Y9j1I3g13fdYEuoz8cz3O/1yS3BD6d2kwaq
         qq68cZkU02SVtUFN5y70N9HRg0B9Jfud+rW4zXX6U/tQZ3Zb9wapu0BiGjmnHe5gqViA
         p4rcbfd4+r2lkpPdtYSHjKW0i8vQ30bhtoQsqNlqIKkuR1fI9HEQF+idAGjh1UOmlyKn
         CZj1QcrmwpXfBFUBQgbjRMvcQud/4b6WHxHkw8ZjTZkRrzuGLL8eTGpNkDuItANt0mRo
         2EoeJv8E8rp9/jr5jdiIw5U/INhFv1TGJ5Dx3J1pdqmqdwLrmusGaWcuKceEyKV2tPcX
         Ahqw==
X-Forwarded-Encrypted: i=1; AJvYcCWLKsAuqvH/HjEJqNPYVILNtSOxoJfYbOa70wYObR9ErrBdoeSiXH0KPRELBcr58Z5ZirgpOBAKjyDA8jt7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vg3OA7oMH4yIgi/RQVXrBhFsqu6Sz86lXqZ4pJACKirZzQzL
	52VqVUn3zwZof+TiYUzUVFDAFlIMTeG2XeIx+Ba88hrkKutDVydyVt8JxtDSvPT/4GU=
X-Gm-Gg: ASbGncsOHXDKkYbPvL3gQwC9yUtwKRIihplb05C1sZF1I5Kw3F3zt3HezOPihfcXLMP
	usZ5LPHiOl5i+C5rcP4/UOGujVkuhJxhIV+qveyAS+eCxDqEEy9QE8HbHBCvV3+UYaM/9Y5/tW+
	mmmOX41Fn3q+44SGK1V3LpbN73jylk7g1ZUDFYlFBsycV1L3vYmT+JzxdJaoVv5ZxO9phMKbKl7
	oI7tujkn02xx6ZBbllnklbw8ThjjdlQ3VyJBWFlZJVnjPNk177ftxGm6So+ItQW3081h6QJqshA
	QBOshnQ1mgVJbhgz4OF6AQA5FxaEwJGuGSMktna7OJ62fsy1KJ+OT79SC3LeL8UrX5EBVygHMhX
	603uRAYE9upJZuHTtm72rD+uq4Y5Ijj5BmOA4dp/7lencTSuAmDQ8juKZHlQKrLtm
X-Google-Smtp-Source: AGHT+IG/0hVZUCxEE95MZHpW6pcKniy4zaPb2rML34xuy+jP9E9jyGGasF0CZWrS36AX5D4SzgV2BQ==
X-Received: by 2002:a05:600c:8593:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-459ee0c729dmr16878855e9.13.1754548536626;
        Wed, 06 Aug 2025 23:35:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db13fc9fsm151255515e9.7.2025.08.06.23.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 23:35:36 -0700 (PDT)
Message-ID: <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
Date: Thu, 7 Aug 2025 07:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aJHgh8mon9auOHzi@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 11:44, Jorge Ramirez wrote:
> yes, in V7 I did implement this functionality plus a fix for EOS
> handling (broken in pre 6.0.55 firmwares).
> 
> This added some complexity to the driver. And so in internal discussions
> it was agreed that it was not worth to carry it and that it should be dropped.
> 
> I'll let Vikash and Bryan comment on the decision.

TBH I think there's not alot of value in supporting a broken firmware 
which only does decode.

There's not alot of value to the user in that configuration.

Provided you have done the work to get the fixed firmware into 
linux-firmware just cut at that point and have the driver reject lesser 
versions.

I as a user have no use-case or value in a broken old firmware which 
supports decode only, I'd much rather have the full transcoder.

Its Vikash/Dikshita's call though.

---
bod


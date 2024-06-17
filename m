Return-Path: <linux-arm-msm+bounces-22929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295390BA13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 20:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC3C9286A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 18:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47FA198A20;
	Mon, 17 Jun 2024 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFXCBaEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A79198833
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650084; cv=none; b=g/3SOuFe/ryGh7qp9+KNOoPz4aasqB5lLPyiA7WIxJL2URg3aMplnBWwA5ciSTMBgDrQI+iCaMzgZC8FIVWYm4U12muwatxDPt/pnB1vvvF/uQRQIWkxk38R6gQ8AVG4AGU3/MNLlSG7QINg8YUqYKp03RJrzNJyr62K4HPqGqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650084; c=relaxed/simple;
	bh=qeXF72FR93AGBhELVsrcMvphwThBusQ84oeb1Yd3e+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCwh6hFK5yOJTbHjHn2M4whf6N5HvfG07w/8joZVEns6HZZkq9u5k8F1kWKw7hdiSNi89FzTH0Cpu9yX1GtaRemPaQC8pTdIJgbuSrk5ID7x91VZ0jZqNhVSWBvHloRST0paLFdCfpYLjGcEuZKfEio534B1RZtbCHYHGuhVOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFXCBaEv; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so51162921fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718650080; x=1719254880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FYnJ6sKcKYDve5AuIpVcAVHdyyVXD2FX+mVnM7OJR7o=;
        b=GFXCBaEvpWYuexpHYbZHfxU1Y9zIonEfVTjaf9SMdDZ+xXfIQOWOBhyjv3vfyAZKUV
         Ftt+GongLM4rUJknxRAY/UK++DxaRsP45LikX8EUWpHUhgGYJpt3iJWulJai0DhGlGpD
         gWgd0Wc3+QE3yIAs9PUV+pHmrhLViYOuwvioyipCBwyOoyY6LgdweCc+07yU6bUp1hKx
         3+UW9IHKbwMRQcsx86gSY/nWhiGRM6tlxcbJmk2nQ5ing02kIUS+DOUHQNTXnlejyrLc
         iK3f40pUr5VknDsQRj9Q3u12s6DmzZ01J0CN/swDM7I7f5Rw3x5qMOHWPVMXZBlo5H1y
         2RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718650080; x=1719254880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYnJ6sKcKYDve5AuIpVcAVHdyyVXD2FX+mVnM7OJR7o=;
        b=u0/QkUxevJN+ek8LU3uiTGcQclk0Sl2a8pPaeVcdEkg8ePkisWYiSQfDH6QaJumxSN
         OCdBQpnKUp+rdhIeN3Nmop19alun5Mec27W1gulOsX+5Ao5gHQ///m3/89eIoVke8sEz
         JKZ/4SMIaYZKQcxY3TQqEVIlJkJpTKRRt2ZSIXU2TW3eHtApbKdvO+M3SmFqElyr50zT
         u2kHgpc5tq6ATbABMKUT/Tqnu6CCngulenzr6OM7AQna2EVwrXi5Ea6nk+3maeXbyGRa
         jp47VwnP2YE0pdKFquw07kOTA/vPvkn3KcH78wZVn7FjrSBwNSFXbGvvlEwfRNsG+BoF
         JQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtBAdw4rFGns05yoG0tzlASsoirCCH7G0toB7oa2HRU1Psa439Gjv7JvTOuQz9pjgAord78RUfv01cYMtihgBlRFI6gLDZq2dC8kpQXQ==
X-Gm-Message-State: AOJu0YyAtuY8+ajrmrG0l0OI84Md0zYrz+HygEOK8597fOnAdyZ2b1Ks
	igsFhoQ38LE2ZI0dGMfBUVjYR6LZ1qnnb2LWtaeTptQQLPcAx9CNvCqeiyCKayQ=
X-Google-Smtp-Source: AGHT+IGx+atBJRdGHE+dU/qVvXUgXHTjfuz4zdzX/PqP8kUgeQ1LM6w0fr0vL2L6wwQuaZMSeOstFQ==
X-Received: by 2002:a2e:8895:0:b0:2eb:ea4a:9923 with SMTP id 38308e7fff4ca-2ec0e5d1415mr83982231fa.23.1718650078858;
        Mon, 17 Jun 2024 11:47:58 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59? ([2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c17d72sm14085621fa.68.2024.06.17.11.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 11:47:58 -0700 (PDT)
Message-ID: <65f248a7-43bb-4f97-ad98-e2ca29e99e51@linaro.org>
Date: Mon, 17 Jun 2024 20:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] serial: qcom-geni: Fix arg types for
 qcom_geni_serial_poll_bit()
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.4.I24a0de52dd7336908df180fa6b698e001f3aff82@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240610152420.v4.4.I24a0de52dd7336908df180fa6b698e001f3aff82@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 00:24, Douglas Anderson wrote:
> The "offset" passed in should be unsigned since it's always a positive
> offset from our memory mapped IO.
> 
> The "field" should be u32 since we're anding it with a 32-bit value
> read from the device.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


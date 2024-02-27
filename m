Return-Path: <linux-arm-msm+bounces-12622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEF0868693
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 03:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73AF91F235D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 02:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9693DEAEB;
	Tue, 27 Feb 2024 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3iOFnrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1CC748A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 02:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708999684; cv=none; b=h7AtQeNIOJG+IQ3Nd0wGmI56sik62wkUdVPaBKUDyiB4PtbyX5L5K+KP7L8tSjr4XtvdKi5F7AfCBHJnfy1UVBhwRXINe3+6DTPMOwM/x02PgX1WSlC5Po3yxfoWTaNG8XehfWRFOlmWTNpAwPOBnvksxWQw4M/qF3SVONNZJrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708999684; c=relaxed/simple;
	bh=e20cSwHxUYKaM7UrngPan3hSH8QhKOwaTuiejGgEcE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlvZ7WtOXlxpCE5NDj30/dDKYRVNZ1OxVWBTPBrHeV6xkc7MLz3qqaE5gH9Myp5b3wh1tSACmMhfWeGrAxnjz/SBR8yH3XeSvsVhZKfj4ISD4fSsbQqFBtgo/0LHqb3kgS5nm3scYqZc1dTRrfEOCfpDdWHGIaiaKuHD1H8CvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3iOFnrb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513031ce058so674856e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 18:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708999681; x=1709604481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKgrsbDtRhtTwJSZwi3Iuzq+IR/GTbO5ckHV4gkPPIQ=;
        b=p3iOFnrbTQr/7RKe5s/anuR/LwIioxh3JG8ddLkcRNGnuphUUYQjc3X1UEVEnL8AsJ
         0zUMkNNHTq4iiIWeBkgBRFshqt5D4p5R5i1BqQ8FRQsIVK3ZURlaNljgkmQJ/+ddxH73
         ImUMW6sz18ltZJqX6DsNS4pKreDclyOXsxacBfjNo6LPXkURgT6S4jS2vXjBDgWNYSs+
         WTb87u/n1R6gRoubcjE2DP7tWm35saG4sZ+s7iC4cbGL20zh0RvI38IE0CuxrV5WHTR0
         6s6+XcgEcRjG8raaZ8B3YmO1yAR/5ChFwb0aiQO/X+sAyWUvweSl7CEuT0+drOycake0
         eboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708999681; x=1709604481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKgrsbDtRhtTwJSZwi3Iuzq+IR/GTbO5ckHV4gkPPIQ=;
        b=Zj14/4rd8DA9K3vf8W798apVeS2kK1CMHWrrZonm/icpeOAxFxEPaL0SN/maMCikUU
         e1CjilzapHZUZJg6jPg69/OX9DCgXI7PSiePMRb45klhc+Zklkf5w58r9Pdrpx6/MxJF
         r2BBcAo1l/ThaJEj6YgfCNXoaq+OhjCliD9r6nUQpV2Xvp/YpLy2WfcmQwPQRIcDMl+M
         nXZ8HcbrY0++PPhM84VIWwRBg801HLNHkC0GjVxMGkB/3bxNBvlNqNbJwlX1khBXXRpr
         TjjX2j+3Ip/iPX8UEIgBPCcLRA/DZ0MdRfJGpxR7+R+nk3UgjeTooPdf+itbO9evKYef
         2tJg==
X-Gm-Message-State: AOJu0YzOOI/0kysYs05gdiSJkBlhfd99Qz1UuOwtG8ob/Qoa2wMNCZX7
	MUnaSsuq/aGc7W/weqFHAsbHg577yy17LNM2B1pnG2nsPboMxeb/v9KwQ11TRsQ=
X-Google-Smtp-Source: AGHT+IGXqMoQl1y3QKQ7aoLgd/YCYjjNvpDVJY5uZK5Inh7UBk//uGb/IfQsf0Y8r17C33Kt0AmV4Q==
X-Received: by 2002:a05:6512:324f:b0:512:b84e:e7a1 with SMTP id c15-20020a056512324f00b00512b84ee7a1mr4873359lfr.5.1708999680724;
        Mon, 26 Feb 2024 18:08:00 -0800 (PST)
Received: from [172.30.204.180] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r28-20020ac25a5c000000b00512e40ef364sm1035102lfn.108.2024.02.26.18.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 18:08:00 -0800 (PST)
Message-ID: <615042d9-4a8c-45c2-be17-756e9635a8af@linaro.org>
Date: Tue, 27 Feb 2024 03:07:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
Content-Language: en-US
To: quic_bjorande@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org
References: <20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/24 02:49, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Commit 'e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable
> the domain")' aimed to make sure that a power-domain that is being
> enabled without any particular performance-state requested will at least
> turn the rail on, to avoid filling DeviceTree with otherwise unnecessary
> required-opps properties.
> 
> But in the event that aggregation happens on a disabled power-domain, with
> an enabled peer without performance-state, both the local and peer
> corner are 0. The peer's enabled_corner is not considered, with the
> result that the underlying (shared) resource is disabled.
> 
> One case where this can be observed is when the display stack keeps mmcx
> enabled (but without a particular performance-state vote) in order to
> access registers and sync_state happens in the rpmhpd driver. As mmcx_ao
> is flushed the state of the peer (mmcx) is not considered and mmcx_ao
> ends up turning off "mmcx.lvl" underneath mmcx. This has been observed
> several times, but has been painted over in DeviceTree by adding an
> explicit vote for the lowest non-disabled performance-state.
> 
> Fixes: e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZdMwZa98L23mu3u6@hovoldconsulting.com/
> Cc:  <stable@vger.kernel.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> This issue is the root cause of a display regression on SC8280XP boards,
> resulting in the system often resetting during boot. It was exposed by
> the refactoring of the DisplayPort driver in v6.8-rc1.
> ---

Very good find, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


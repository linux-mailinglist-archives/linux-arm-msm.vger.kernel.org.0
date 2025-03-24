Return-Path: <linux-arm-msm+bounces-52368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB02A6E031
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D21FE16E17F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E41A2641CD;
	Mon, 24 Mar 2025 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GByonw+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407072641C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834995; cv=none; b=Kbpe0W3lHVx9TF3HgC8HRLp69oeejsn2d9oCDiDzzfIS1DVq6WIE9PWF4pxuu1mL3z+G6LwfsrytmHRyCzoAPfJY7b+4FYbR6Y1Y6PZtFN2f0fdRMZed/FwvKIHI0oR5lRY7Hym7gr5Hw2SoJPPzm92N6Gkpc9f3yZ7IkWxD0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834995; c=relaxed/simple;
	bh=LviRtfZ2Zkhdvc1v2tQGyN26tUVva3KWP4SpMnY0qFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ku7Fjp+3x8MCyhmJlVDTvMw2EI6027lvXkongqD9q+J3nLvDEG+x1mEgI7R6eZ2pk70RH/FTXYyiCMTijKUC9RhcD3V5wkHClClpux+GjRXitzm3Rq8GTqy5SLsaj746j+aurUBEmkF+shO9uxSGklGRVi2s+4qlhcJOVr8NiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GByonw+x; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-399744f74e9so2839385f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742834991; x=1743439791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKZOx3qp50UyeT4k9CXml4Zn6aQsxicd61ejBpyhlHw=;
        b=GByonw+x/a/1AjebGTc6VSwGRiKm7N6ggsMu7tsYjwDCnzPoQ3pTN+GwxNg+BQeKbb
         R4joKHKJNfmX6J4sEklmxh+ZaCVdghWhObGMgPQkCva8cJIUsi+ZtNO4Iu1yabCQ5xBe
         iGBYkJYT18sflhoL5FkDkvAwddFWLehrTTJtGrv5fvCbfQueDreLBYO8aUkGedaY2Q1p
         bqx/BwS2alQ3YIpxljP0GrlRJ/ncNXIoV4c46Ka5SgWsEYaGJAiSg65bc8LI3BXiycWz
         WWc9UNK0u1qN/uzTeZkfZRz+vUJXZBH4hshzOIjTttoMoUqj2+djiYxdfzdBRH3+8AGs
         iRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834991; x=1743439791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKZOx3qp50UyeT4k9CXml4Zn6aQsxicd61ejBpyhlHw=;
        b=shjKvuGKLih1ohiDZ5iTiC1XjXLMlmwgYEdeNCTmaYvX5yZCsLZZQ9c28JH8Cu/yPd
         DOOXQM6+rJjzTGbxSWwPA2a6Rp90Q9Cn10zDxF084xcI6Hz3FlYzuQe5gpAH1XsNx36f
         1JL0TWfcPIlsOxxZeYz5EezaUZrgBt3KNhdvLW1iWwyBuAcxHK9XmPw3TdccnYvlTuOJ
         1YpOFS1KXwqx+avjDOeUg82jMPCUjGVUgTt/CTc6cAvAbYNFlPQ8en6xQ7KxAbnyOyyV
         hYjU/TKfsfbsRAStr6A4h6bFgB6ifY8p5AZZ7O/Wnv/ANKUqOX7czahPwF/Hzu1P0CLL
         3A4g==
X-Forwarded-Encrypted: i=1; AJvYcCVfLjLFnbhrzRLYcEwnWs0UF14tZrXW/+J+ct330sd0sPAiVG+BnLe41CssUSW+IUGdxn35zz1xbAaIpjO/@vger.kernel.org
X-Gm-Message-State: AOJu0YxILZqFoJCEX2+Sz5VUmkFVCHmuvLjsqabFhT38KMh6yym25iRY
	PUwSK+SL+wxp07eWVBkiHLxrHWyAHDtfF4q3o1eFYOJCMQV+s/bgw0Hf4JSR3bc=
X-Gm-Gg: ASbGnct/mQPxdP7RquQ/gu708sP47O0p7PH3Xhfs2pwWvXS/71c6+iLYxMEgA/sNcwV
	JuAA+barN4sIYTAdPZmvMCL4ZcA/LsiZA0MPSfmozX7xUpP1VB4Ze0+a/CHhfNhfYD+yBlKDCXO
	PNPOo/z2tSly7eoOWhDwwlw+FPKqdZab3EKJcj6NGPYloS8WjPhCgBRpYaXL/RrCYTxnNr5mm03
	RHQ/j16dnZCxUkQKY0mtbSgv2iobvk52XDGSyFpZWfcbXCfrhbWARMJwkA8X3xlBm/F2up4NIBB
	3vuQt7XKQjpBSo4B/weEA9EJPSFBerzZsnAtp5Espan9ynuKnYKblBpfVr8Ur0DjTsqhKOx3aA=
	=
X-Google-Smtp-Source: AGHT+IEgPD+xDa6jr2Is2O2+Xj32Sel7N6UWscGct1y1fK9hAAcLY0xxiUzIYdVwngw880A7Z6/vOw==
X-Received: by 2002:a5d:6da5:0:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-3997f958f34mr10938614f8f.46.1742834991401;
        Mon, 24 Mar 2025 09:49:51 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9e6450sm11505850f8f.70.2025.03.24.09.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:49:50 -0700 (PDT)
Message-ID: <1f090804-2ad6-4ab4-a6a3-aa5d482f320b@linaro.org>
Date: Mon, 24 Mar 2025 16:49:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Peter Rosin <peda@axentia.se>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
 <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
 <ctcqkdbv6zh2rabkkr7tlhxlcfsn5nazjfbsnbbu4l4blyakft@pejdsvnazfh6>
 <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
 <8fbc8cd7-f8e7-e33b-74df-cdea389ac9a4@axentia.se>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <8fbc8cd7-f8e7-e33b-74df-cdea389ac9a4@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/03/2025 16:33, Peter Rosin wrote:
> Hi!
> 
> 2025-03-24 at 16:58, Srinivas Kandagatla wrote:
>>
>>
>> On 24/03/2025 15:18, Dmitry Baryshkov wrote:
>>> On Mon, Mar 24, 2025 at 01:58:06PM +0000, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 24/03/2025 13:50, Dmitry Baryshkov wrote:
>>>>> On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
>>>>>>
>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> *snip*
> 
>>>>>> +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
>>>>>
>>>>> Hmm. Does this really work? You have selected the mux in probe
>>>>> function, now you are trying to select it again. If I'm reading the
>>>>> code correctly, you will get -EBUSY here.
>>>>
>>>> On successful selection of mux state, the mux will be kept available
>>>> (mux_control_deselect) for any new callers.
>>>>
>>>> So we will not get EBUSY for the second caller.
>>>
>>> No. wcd938x_populate_dt_data() selects the state by calling
>>> wcd938x_select_mux_state().
>>
>> At this point we also released it (both in success and error case).
>>
>> This will hold on to the previous state unless we have defined a fallback idle-state.
>>
>>
>>   Then you call mux_control_try_select() here.
>>> As far as I understand, it will return -EBUSY as the sempahore is > already taken. Moreover, this is not how the MUX API is supposed to be
>>> used. The driver is supposed to hold a state while it is still in use.
> 
> Dmitry is correct. A mux consumer is supposed to keep the mux selected
> while it needs the mux to remain in a certain state. Relying on details
> such as idle as-is and that no other consumer butts in and clobbers the
> state is fragile. Mux access is not exclusive, at least not until a
> mux state is selected.
Thanks Peter,  I agree that its fragile to depend on idle as-is flags.

Will update accordingly.

--srini
> 
> Cheers,
> Peter


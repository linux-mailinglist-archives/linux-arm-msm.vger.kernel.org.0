Return-Path: <linux-arm-msm+bounces-8234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED583C02A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 12:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6176299856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 11:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F67028E26;
	Thu, 25 Jan 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbPKmRN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23524B52
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706179628; cv=none; b=QH2L8flvK64TuwQH/jRftlsheBnfUvgYvAd61aU/+U1DVuhlf86G4DfjXV9iPOSu4GKp+hP0+IEFFipQqBobG+BeTpt8RxDBstjJf6SVxOKBECR9Sq9+6kNtn5vdmKrioO8r5gLBhRourvUS991X9MNXGjIsgsBvwBfxd9huWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706179628; c=relaxed/simple;
	bh=3LsMPKKHFyqK92xTj0v6geKf3RLh1/ofpb3gzz0Lnt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGUemvlaZnO+JwpOA/DHrq0lCkFJ0H/BsVqVxz+mKTdC0j1K7LvnNg0n3swP6U0Uok/xYN5KgtD3JnBBfT+k6+XuDRIn5Fi3uALDHgzhbJ0xEYDnud/9PUoKzmACUyQYAXmtIP/7Tt8rja9V1aRpAQWX0eUH/pqw7USyxxThpbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NbPKmRN4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so1245018a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706179625; x=1706784425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P57fZWY1sQkih8XnkVavIoQwU+LGJXJMtJjwWFrbJdM=;
        b=NbPKmRN4pXMmMJPS+GFg5gC4Z3rjVnvF9PHF/kNUvV3pIZjmyhHvTe6Vc639+O2IA6
         V0Fp3AwGfmxlHa4eSH4B+58W1cc+2vY3bb0Vvr4PQp2FVLuJnJvcpp4njZxhFSajRiZf
         VendMBUsl7Zf+Pp4pvm1PcLQbJXxCLUGdHpiQzCTR2sjia1r/kHFJm9LGjf/f6X1mWdB
         GoUc2T5gjZuCJ73LYg44HZNdbsPdmaZC4N2dwkqcf1wkDF45p8IiEzqqQPO7GVS0iR32
         wfKTT7pfF17wgkLRnZHIiUuajRuNmdWjcAzI1ma0+uUqSiw96ixmt2PZjLte+sGw6dL/
         XSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706179625; x=1706784425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P57fZWY1sQkih8XnkVavIoQwU+LGJXJMtJjwWFrbJdM=;
        b=KL24BgbDqDgdLDd2SaCcfHv+icEPMY2hUV0cg/VXuKXU4PUngMEzqt7qeWyoRwtsbz
         /Z8P05llhq1ZMGxn3R91FwgMVVpnpMbVp2AZODKQlXeEejH1CTYD80oTI14kIoX66IXc
         kGgTkyXYPty6V/drrqGKdcz0GxaWKTt0OnjlbqdTcARe3FalanKavduswG/VFSmAe8DK
         BaI6UrEsSwcz2zuJFbti4YTeYmnep2ue0jtYVXyJzYtQExA/6qIvPdf/ebnVVaUm/2p5
         yZoAOB0ek59dUH9Cd3+laubKsmWkHxqM/IWLqsfz6SOCoaZNzB19XcwJGmfLP6rYttk5
         dIVA==
X-Gm-Message-State: AOJu0Yw0BtLZRUDDXkbepxy9W9psHTnmqiExjEfBxJtO3pwhyThlbo/q
	z+Epk/MNq+JZ3XBvo/k7uDYzD88g8egOrOIjIUnbQWq/u4dUE75gpv22aRygBdI=
X-Google-Smtp-Source: AGHT+IHNZmOeYOcVtz1eWP2UX/0T0VogLnG7NpMga3Qc4Uh1CWmGcPR7wZzjvhDvFK/pRhyZJDK2Qg==
X-Received: by 2002:a50:8e4f:0:b0:55c:c40a:c180 with SMTP id 15-20020a508e4f000000b0055cc40ac180mr846408edx.26.1706179624974;
        Thu, 25 Jan 2024 02:47:04 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id ez15-20020a056402450f00b0055a82fe01cdsm6389475edb.67.2024.01.25.02.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 02:47:04 -0800 (PST)
Message-ID: <803e9ddf-44eb-4aa2-9a15-833109d2248b@linaro.org>
Date: Thu, 25 Jan 2024 11:47:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: sm8[56]50: Drop the Disp AHB clock from
 Display Clock Controller
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
 <99817149-4a2e-49fc-aedc-fe298964a019@linaro.org>
 <ZbI7k+bDy+KSmncq@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZbI7k+bDy+KSmncq@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/25/24 11:44, Abel Vesa wrote:
> On 24-01-25 10:49:23, Konrad Dybcio wrote:
>>
>>
>> On 1/25/24 10:27, Abel Vesa wrote:
>>> The Disp AHB clock is provided by the GCC but never registered. It is
>>> instead enabled on probe as it is expected to be always-on. So it should
>>> be dropped from Disp CC entirely.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>
>> Abel, you just raised some concerns over my series doing this and now
>> you're doing the same, plus breaking backwards compatibility for no
>> good reason, instead of solving the problem.
> 
> Sorry but, during the off-list discussion, you convinced me that it is OK to drop
> their registration as long as we enable them on probe.
> 
> I've not seen the following reply in time before sending current series:
> https://lore.kernel.org/all/6aa58497-9727-4601-b6eb-264c478997c3@linaro.org/
> 
> Since this is blocking the patches for dispcc and dts for X1E80100, I
> thought I'd just drop the clock as required from DT point of view.
> But yeah, you're right, it breaks bindings ABI and that's wrong.
> 
>>
>> The correct solution here is to register the AHB clock with GCC and
>> pm_clk_add() it from dispcc's .probe (and enable runtime PM on dispcc
>> if it's already not the case). Then the AHB clock will be gated when
>> no display hardware (= no dispcc consumer) is in use.
> 
> I agree.
> 
>>
>> 8[56]50 are in a good position for this, as they already have the
>> required DTS reference. Unfortunately, I still haven't fully dug
>> into this for platforms without one, but that's on me.
> 
> Since I need to do this for the X1E80100, I'll probably do it for the
> other two as well.

Thanks!

> 
> Sorry for the misunderstanding.

The story is confusing as per usual, perhaps I could have explained
it better in the first place..

Konrad


Return-Path: <linux-arm-msm+bounces-60884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0015AD45C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C9D717C3E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29FE28AB07;
	Tue, 10 Jun 2025 22:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlVtTujI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA576278772
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593829; cv=none; b=mVBqs1u4EcMkEm637Ky2NizHfuKyXtAFkPjgq2+/cItrDbOsG0nBRVPkq/0De2/5UULtlpCVIHaSkOZiGVgxBGATyYLBv0Jy5oNqnJtb6F7gLLhnjsQ0KvZCoQfvE9K0KwqOvprNNRRdh3tpkBj6Ho88fZIa4XCvCSHGnWlJrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593829; c=relaxed/simple;
	bh=7TfUR8R2IrpRs1f5np0P2PSPG9JH0doPxboC0XmNhik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8Snu/Vo4ZAuz6DyKrbkS1+tyDaGdw5ei/I/lQFRgCgMND9z+GJSwxt3z6U29pYNVlfRmRz+wORTCv5BuZaTMOvfXsKHDzIJOzQi10cUZUyybh0sW+G4iHYsW9/eZYiR+CCS4UiOif/B36ajoicJw8EekW4c6sB0PFkVF9Xwcng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlVtTujI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4860787f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593826; x=1750198626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIt2WsPysp6xDtdH49fFBClr+UXdYRyo8pVXPNJ74C0=;
        b=AlVtTujIl4s2x1TJUtdWI+Nc4y3lKISil4BGa4q50EP0cuwOOk+NFS9hEt+Chdezk6
         ozYCX8q048nj02uxRcDGafRs5bZ6xxErghsoS4XW7mmGrBQZNjeC6T7LkM68WWPBbfog
         0JmvDx7RhuYAfoJy9FBecQBt2L3zQXsyG2RtXm3Fdh/wZH6m/ceVEnS+bjWyU+xZpB0F
         Lto1ejC4VBenDjmlaYQIbEh4crXYxTx/t1sN09Rw1EWCsTURFCM5ba/1Yrz9j0ofo6B7
         qZZ+Vlym9w62N+U7/FtIrlTKdpXKA48ZSlnwz9hPwV88grY3GMtEXZytHfQQyIgHUcVi
         2hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593826; x=1750198626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIt2WsPysp6xDtdH49fFBClr+UXdYRyo8pVXPNJ74C0=;
        b=EqW27ShO1Prrnb+UcAiI2wMXI2ePsxkKT/wESOtcRMWunvQM3DvyRYLP70Mp9Mmcoq
         nlWKRCNurvhiXCLbcGIcIsCybQbJOPAolAmgHWn3l1egAnwDqmuTb77GI4JUIj5Exom7
         D7qaiFMBjDroTcn4pQHB/+b9ckQYYjTAKFO9e26U95qAN7zRmaWfVOV2TigHanhfgGLC
         znsNG1tcsBzZ53Z4cTHFEYUJNd5SmYB6+xK+fqvGSiWzoKHcjudg+/sG79UGFjN6bgQe
         +2FQZQRuF6BtPmTP4XWGzTPslLtJkItqjpCBlgHFbE1A0HPQI0GhWC3E2xvpHTo7nqrL
         moDQ==
X-Gm-Message-State: AOJu0YwjdgwLNt6reEH4dUucvSUA37+28TwnACp1TyV+xv0cjBwHWJpQ
	qWe0ujo9j9TmK8FfvV2TsGmGjenRvbWYqZy4OwfNGLvkqgWNFM876CLPse3IOflKGfE=
X-Gm-Gg: ASbGncs3RpHBJswRKQkYAixOPtREXnOasTRHFjGynhEL04+6PGmpZxCBUVhBad8gNsT
	6mcpuxFTRI1V/eL+WFBfda4k2x+82tMiioUim5YjLw+/fAEXdbXpyKpN8/wZ9g2lBx2pj564H+m
	KbieqFnoKXh/iCXCWDkqeouVn0tNKzTvKFgx0wDnE/K0pulbvI0ziHoHIR67EOH3so3gHXvS/hW
	AVm0OhUdwzHYcfZq4vx14E5HwumTpPcRwl6PtrQFuHIryj+myhjXsrFYYWethvkmj/yXrGG9Pnb
	m+akL1dY87286R9sRgK5vpmDR4gPXKnWhXfsVTSKeNJdbyIxIS6miEO8+q8vn5Xg6rzKrAHiS72
	/YZ22jTALq6dPPl+XrT5SdanEt1I=
X-Google-Smtp-Source: AGHT+IERnljNf31VprhAEokS9VT8ilK90CxWqw6sUIOgCUXrKGJiaOEei3ELCJOxQ0LlxD+btzZ1Ww==
X-Received: by 2002:a05:6000:2285:b0:3a4:d6ed:8e07 with SMTP id ffacd0b85a97d-3a558a27717mr467480f8f.32.1749593826029;
        Tue, 10 Jun 2025 15:17:06 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464f20sm13422204f8f.98.2025.06.10.15.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:17:05 -0700 (PDT)
Message-ID: <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
Date: Tue, 10 Jun 2025 23:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
 <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 22:13, Vladimir Zapolskiy wrote:
> Hi Konrad.
> 
> On 6/11/25 00:04, Konrad Dybcio wrote:
>> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>>
>>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>>
>>>>>
>>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>>
>>>>> The expressed concern is about the novel label name.
>>>>
>>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>>> not camss@ and I agree.
>>>>
>>>
>>> Let me repeat it thrice, it's okay...
>>>
>>> I don't object against the properly selected device tree node name 
>>> "isp",
>>> here I object against a never used and very questionable label name 
>>> "isp".
>>>
>>> Please feel free to ask more questions, if you still find it confusing.
>>>
>>> Again, I may missed a discussion about the need to get and use a novel
>>> label name, then please share a link to it, it'll be very much 
>>> appreciated.
>>
>> To hopefully help out:
>>
>> label: node-name@unit-address {
>>     property = value;
>> };
>>
> 
> Thank you, here is a link to the wanted section of the dt specification
> for Bryan's comprehension:
> 
> * https://github.com/devicetree-org/devicetree-specification/blob/main/ 
> source/chapter6-source-language.rst.
> 
> If for whatever reason a proposed "isp" label is preferred, then
> since a label rename is not an ABI change, it would make sense to
> do a massive change of renaming all camss labels. Otherwise there will
> be an outstanding incorrespondence/confusion of the label names in
> board .dts files, and that's bad.
> 
> -- 
> Best wishes,
> Vladimir

Ah the label, I thought you meant node.

camss: isp@value

Yes
---
bod


Return-Path: <linux-arm-msm+bounces-51200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB3A5E63E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 22:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54A317A9F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 21:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706201EEA5C;
	Wed, 12 Mar 2025 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9m+/Ne5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA471EE7C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 21:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813226; cv=none; b=SHEu+P6vylBPN8a4pPLNhD9Axy6i3nSMgYIaFv0qKKy9Rv/wl77p3jvRzZoH1dOd0ltuscmDWMO1G+AIBWFm6rWShddDAs5xWlHakhPTe1Db21qhnKaypjC1+DDM5KRYSFjzqA8U524+mz4T8pYohkjolfR47FsbFhBtmqAPbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813226; c=relaxed/simple;
	bh=ScuDkmShn2D0Kq8ggB9Erkj9flGtVscDeBuMOCChZIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEDKZnzL/j1v/TvoMZ736Ova0rODk3aEOiGU13em78tR3WfzMjHKolMDhNID3aalFG6UiR11pWSBkLVI44iL/sepClb19Wg9WrJrwfpsP/4IW4DI131vZSY6WMEcncwK3VcgINgbaqh8TdBJqsJliTZu4ryT8LzxYbMvDD5KDdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9m+/Ne5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so390605a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741813222; x=1742418022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOnA+cmYlRAwYleIWz9JDxBsHfen78RX1YLWTTlffOk=;
        b=E9m+/Ne599eetBB3EUwzPne+s2W3qRTHEnv9+eKJoXmRepUJXndsUg2h7/p/fZw8zF
         fX9Ex11yrqrwJjLQFaHE20gHPtN5SzdvHtDs3LM/y9LstCH/RgV5iPjiOyJuyKjRaTv5
         cADtM9rltKYd6FsfQsSvBtytvkaO6T9AX8EF4J2LPix8MB1Rv14YNGFZ4ZdzUkJgCdVR
         lapH6k0n+8LM8TMMwO1+VUzfvnq6XiRg+fOksCK83FVgp5DUpDhGB4QR6ycedV/v96wo
         Q+OeE9/hQghVTohcBszFg3+dYDZhS07rUw8xlNd7l79T+E8r7jRmPwWoQsx9IHtwjQ8r
         Qplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741813222; x=1742418022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOnA+cmYlRAwYleIWz9JDxBsHfen78RX1YLWTTlffOk=;
        b=P+nniJv3XhzykCxRkzzEvcW7q/Ky42X7R4tWYYBUOU654fdL8Y7szUKB++EeTu3DdL
         2ASPHVczwUiXgl2YEV855fTppxxX8TZVnbMP4NjmWIeS5gX6e6conXBjwUCaWYZw0giM
         DxQb30uuVpVbg+XagTx5rsMeTPx5WryhBGOekr8agTGkaq8rJgnZ78ZeQF27wLd6mdz5
         QUERv5g6d9SuQIGODvQyg92YY3MM8yAnO92zOqM+77RrcCB/6zgWMq4T7zswAL6RaSJY
         X3oOOtAxEcIgo7/tLhr07EV+/XJdulGRixYehpbq3v+jCnveu0K3MglynEG1HbN1fK4E
         w5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpxlqDieDTf4VrCQUQWfcAzMRoKPDEMHkM6l8hJeZFFYyMKE/h3O8MXfplrNK4tzu+J8zqFNHIcAoi7J3x@vger.kernel.org
X-Gm-Message-State: AOJu0YxcilD99TlILlB5IUjh1CzhPIQ+PQ+vaZallXDGBhtSFuL3hthw
	t7XfI07fGyADv1BJEad/wU7nMolOPsESjz2on5jLYbdK077I8PVEd20EaqoVM3o=
X-Gm-Gg: ASbGncs5/7onBYgDuLiN0a0e855goT+/LQp8KJ+H0E/Ya9lMGgcRBR8hlTdrbZMkWgZ
	WVBDkAak2i22bl13WI7dA/H8Rsz8dXi7tFFCXt+GZOjcVzjd/VMTI0gV61aMg2gc/oZoNWd8NyB
	MZEtXhnwIvq/5OGrPX2JMcSL+Qlji/TrkYtKgerzVYuyfrK/gdcZlO13AQ3v3i+MWCYljRfOFFo
	3VvgIMko+iAF2/Toyyz4LQjyGIeOZfg8zgYqcpE2hP+CFbkbkMp6mPoB1Gqbp9kCm5sfXmg0gKG
	LYwbl2EiL3ul7xrK+/bAe6V4G5+ykx0PvkV+Pme4jlYR3JpobM+SKRYK8lL37b2HHc7cQFUyule
	bbHf8Qm3goc8MpmY3f/5KWL1TcgTb/pG3OskIE8vZRiRPyEJRIbzn0hsL/4hY2DOijOOFzuhTnv
	/TousA14WewlwhHsKhd+cyZEGpflJUqZp3d+/y9QUjsA==
X-Google-Smtp-Source: AGHT+IHh0iXxxs/GZwfYJs2dwZU3bN+0fVe/CVUJtTxBagoFSg/eGO0RYs1ORkUa/uu+I4VnRXWFhw==
X-Received: by 2002:a17:907:9691:b0:abf:6a53:2cd5 with SMTP id a640c23a62f3a-ac253035876mr2957964566b.48.1741813222026;
        Wed, 12 Mar 2025 14:00:22 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2773e8641sm779855866b.165.2025.03.12.14.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 14:00:21 -0700 (PDT)
Message-ID: <8ba6a6f6-2e6a-4945-b7c8-89f9ea7792a6@linaro.org>
Date: Wed, 12 Mar 2025 21:00:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 23:53, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>> domains.
> 
> Are those really required to access the registers of the cammcc? Or is
> one of those (MXC?) required to setup PLLs? Also, is this applicable
> only to sm8550 or to other similar clock controllers?
> 
>>
>> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index d02d80d731b9..d22b1753d521 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
>>   				 <&bi_tcxo_div2>,
>>   				 <&bi_tcxo_ao_div2>,
>>   				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SM8550_MMCX>;
>> +			power-domains = <&rpmhpd SM8550_MXC>,
>> +					<&rpmhpd SM8550_MMCX>;
>>   			required-opps = <&rpmhpd_opp_low_svs>;
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>> -- 
>> 2.43.0
>>
> 

I think both of these are required.

Its a pattern we see again and again with videocc and camcc controllers. 
The GDSCs and => the hard-coded always on PLLs need to ensure these 
rails are on.

---
bod


Return-Path: <linux-arm-msm+bounces-100511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEAkCtIjx2lATgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:41:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DFB34CC29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16692304EA50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCD64C81;
	Sat, 28 Mar 2026 00:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viLd/j5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF921EEA54
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 00:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658488; cv=none; b=ZetOAXCYIDT+IbBbq+26OJErGrJX5P3YuIygCTyaS/0BukjMjsc0I0jgLfudStVC7eSGWRlv9kcFovrZmUxLjjLIvKa8/cf94lzyycnnBjmMSJf7T1+D5A5u9IrF972XU1ijQ4THbjm6QwYZTRRTtAZGuuBO4IXbiFncWVEypE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658488; c=relaxed/simple;
	bh=vWi5PsX3/N3kIUZKJo1GpcR0ab9hV2ov2mnFXm2V5+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEB/v249rx5ZGszhPPJ3DpJTsO+wc8hFeZ3YuQzFRB13uAps0BnIO5/H9Tewbv9VnrX7qe1gLKYMga9LXvyvp8lD7gq0d94+3T60O1dfkaN7KkGEene4OWCVSjQURzUtfw7ogwDhUwdKvqjRNnUZok5IQzVr6b8M6Ndw1Y6mX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viLd/j5O; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a2fb8ad36so1047161fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774658486; x=1775263286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGqFSu/F2IhY+ii28nyc1IJ0LboHG+irAmTUkiXh190=;
        b=viLd/j5O2afh9CeeL7DUdhStyVjJFcDF6ElR5yozqSLwFVxltdeipYPTM1iqpOs4S8
         g9GsGm3EWDd++XvTgzutVAxDs5PWlCYE8iwpsr20wVhGW+syqxXc91zb7A/Wrv8KqMwB
         ce+TfK90UvO4J7mcE1f2IQGWsa2oDkPI/8tUD+ZmEW8w9p3RVf2IDk449ZRYjsAj10P+
         HSkBpOQktql+AC5srfbOj5lW+eMmdtIHEYIeT3Z9h7UjbYxH2iah2Jl9AO46jsYTTyPD
         FIcAlepEXvAEItXFvoH7twz0c4pBbfOdO1VbfobrczypBqYVghDP+X88afwuvrArF780
         IvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774658486; x=1775263286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGqFSu/F2IhY+ii28nyc1IJ0LboHG+irAmTUkiXh190=;
        b=KvVc+89BU/2obhj63KB4yzxGyNjWFr7em/8Oh74W3hSaF5ei58EW++zGwVUSRJKspn
         p7G1Y75LzOJTaiesqDvV4A0pZnIiKtLCseTVSrfH5sueh9Rg3mhGDVTIVesYf77Opm8/
         qVOeMfnSFN2he9hGEAWZag/8SwVZ/Rs6akzIqZWcs9/RpdvKPLsAztrvlgbVJLkerv08
         P6PiBkJKtsqveb+2JQDbjHuBUatL6gc1V+9ggBHfSS8O3ryqXcc11RSziY/2tMo6Bk2v
         b0cFZnLBTwc+D/mt1qDpti2iLHdQrBxvrf6y1LUqBjH7ls3uZ8va8cRN0KT0fg3YR8bg
         1zbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY8qbsWmmHdrojJ6UEJtiez5Z/yg0D6Jg+lHo3zR5gICrO4VFUup4gQGPIHwDIN/7wOCLbDYYA3n2dzvxs@vger.kernel.org
X-Gm-Message-State: AOJu0YwLOjTMYk3qz9OM6aQIvVsSRzjKDJvh2SyU0v819iQ1+HKQ7q5V
	qYTRxbUiLrMaHWXJIzEigrINiiayceEYA1nHEB8aYNYxwxAZaNENYyDDCzDBkewN0wI=
X-Gm-Gg: ATEYQzz0xjOh02IIkpIAvRyDr5l53keIPQxp2pi4VWQPlifcmWe2C/7lUT5bW3op50U
	2++LbBf3D7EdcqjZfWSTKZEYh1cP1v3TxemtowIPqR52LBIhOGZe7iGqXcQfamN/ZQETCx3U+ax
	z7pS0JITn8n+yrAt9RGh89DnDDYofvkxmILJ16Y1TIrQY3lfxGRVXMMhl6Q+3h9GAxz8ZS6XKPi
	Otnm4WcQKDwe2KB5nGUfmn/76XaL/oOLP3ADRFaFI3M30gOe3cKtv8NSRh2QDrvGmpf3Jor2/7L
	6otZbYWe4BReO9SEPOzzbPDcCst6p3KAKhr9M8NThqjYsLgzbIt7t1wB5/DVQoigjSV0fMMTlWI
	o90rAzf45KSE4GJHoSlYaBgBxRTp0Kb++8XS+uLTfvnETF0lsB37mcMylem1of1xWYsgZ0AqY0p
	BNUg8mr8wzNCfAWL2143nQx7ukwHuyBVFtcgs/KXG77AkCsvrEcKNv7F9sbsVKH80Tz8+o8U4tf
	sTMkm1/wvnyA6ve
X-Received: by 2002:a05:651c:4cb:b0:38a:3473:526d with SMTP id 38308e7fff4ca-38c740675c0mr7346841fa.7.1774658485521;
        Fri, 27 Mar 2026 17:41:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm1397891fa.21.2026.03.27.17.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 17:41:25 -0700 (PDT)
Message-ID: <d2ebd15d-71d1-4063-903c-2b5971696a5a@linaro.org>
Date: Sat, 28 Mar 2026 02:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100511-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95DFB34CC29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 01:23, Dmitry Baryshkov wrote:
> On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
>> On 3/28/26 00:29, Bryan O'Donoghue wrote:
>>> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>>>> That's just not true. If you read the camx source code you can see
>>>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>>>> PHY to support.
>>>> This needs to be identified from the data-lanes / clock-lanes topology.
>>>> And once you do that, there would be (probably) no difference in the
>>>> hardware definition.
>>>>
>>>>
>>>> In other words, I'd also ask to drop this mode from the DT. This
>>>> infromation can and should be deduced from other, already-defined
>>>> properties.
>>>
>>> It still needs to be communicated to the PHY from the controller,
>>> however that is not a problem I am trying to solve now.
>>>
>>> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
>>>
>>> I'll aim for DPHY only and we can come back to this topic when someone
>>> actually tries to enable it.
>>>
>>
>> DPHY may be the only supported phy type in the driver, it does not matter
>> at this point, however it's totally essential to cover the called by you
>> 'split mode' right from the beginning in the renewed device tree binding
>> descriptions of CAMSS IPs to progress further.
> 
> Okay. How would we describe that there are two sensors connected to the
> single PHY anyway? How would it be described with the current bindings?
> 

An RFC example was sent about one year ago, it allows to specify one or
two endpoints under a single phy port:

https://lore.kernel.org/linux-arm-msm/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/

-- 
Best wishes,
Vladimir


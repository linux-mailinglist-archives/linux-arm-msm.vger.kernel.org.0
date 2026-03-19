Return-Path: <linux-arm-msm+bounces-98750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PIgNp71u2nkqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:09:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D02CBAD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B74A830632AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51E83C73E8;
	Thu, 19 Mar 2026 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGJ1CkoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D53D3CFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925748; cv=none; b=RH138l1SM1UQosA8G9c2CqsvnplhhJQg1+mS6SrFejNmXV0/a6ieIP0Ft/KTn6kOtd26XDRsO8jRtgaj5o/XvZ4NwtYy9E6CeZl8d6aFvEDPvqcq9m8aNDij8NumjanLNqIK1FjPpsLdWH2WcpANPQ22Qt9C7Y0CUT6ny/resqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925748; c=relaxed/simple;
	bh=4E0ID7APL8YcpCqvbHlYRlwfw2W4WtPyVECj5Xxm2x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6wRJzLJA6kvpSwx/9j4AMgitXL7MogtcQYnILSvMtaeIDYeto9IITOD3wcYRo7b8tgCEUBQFzq2l+NJ6pHzGwCV/HekZHXuv52ARo5ggdJvfQZMnYNXFXrvIDfcAnzbb3vJqWl0QGUBOcMFQzIfIifRE0F2R07rTg9ggttyJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGJ1CkoC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a277403370so64684e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773925743; x=1774530543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK3EVuDFkrZ7hmAmWn6xkd27Z8e5d83PJyq1D4T9NcA=;
        b=mGJ1CkoCxdSLZtzgMFHhLgi+wX9pb66mYGGg5lShsFCMidWTeJJzV5AaG3Rwv/26eF
         2MQA0c+4zqIO1l4mY5LmJWTB60zBpxns747JG909/q5j+LUz8tIHbVGYFIsMg85UW2Ph
         M45ikSOHtX+vFHliA7T41AdsP/gHjVFH+g42ieM/kmBDDLoN1h7je/SzDNmMSi5TWSo+
         2LYnZMDoD00g47TRNBpUewsaP2qNKwVKyeLxESk28rADq3cl3X+4cb5MIK55J3EIOhAT
         ChUByRAiIpT/tkErMdXn1D0MZpEv6JwmyEh19CgLSWDhDQomHk2Y++qjJY0byLC+fm7w
         EmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925743; x=1774530543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eK3EVuDFkrZ7hmAmWn6xkd27Z8e5d83PJyq1D4T9NcA=;
        b=H68/CTROupBdr3gGNdcYp5kVbgvrQnQy8RFqoCgf3rezoi14zPk/Ggb3Vt+V0sL7nA
         cStUqzAloojq0d5S6DHOD54zWe45kc3RgY6Sqj4/q5Xghl9zP4g/mD3cXkVnhYaKeyWp
         KiSHpiRhQfPnUqvnG9/hFB4VW9wnRih/bE4Vj1zFleQ7XYhNr7fqgnOkc8GYub/6UNF8
         won/FNr7CKNl8Wv53cyT+UrWkivEZ+qaqdX+1p0U58XhEVIoHHZ+ExIm920ok3bDalDP
         1NVEckqgzvMkNlipe3j7yoAznGP3L91YsnIlfK6KHUwp3j6xIA96JsI/y141mZylsxem
         wS9g==
X-Forwarded-Encrypted: i=1; AJvYcCWCq5ZpB0TMIanMPqH0vIYQFpAZljpOghiDrrbPr0evF3bMUpal6n5O602iheJox5mAtbqiLJKdSd0I4/e9@vger.kernel.org
X-Gm-Message-State: AOJu0YzenVarAlzn/LxYy8jomHu/tkZvJVaz7e8XYlNx3KvkCzaBhlZ0
	IcAxRZNAyO924D2SB1JWVNIwLo3/5B9wjd+LGjDYo2Rt5i4QCQD7OGvIufIAYbXrBE4=
X-Gm-Gg: ATEYQzwLpa66k6MqyiwfBovfyoTEacQMdohuxSRo1POhyRs1mhO/HrjXVwgWqPgB/63
	5W3wpP2qNkdS9fVjMlmxP4K2mYWzmgFYsD71rgJDXjLHQWxmJihsVkVj7pzNS8GT2Yv2dkh+ycJ
	Npr3MAs1GMRpVCfeEdFYdRyh4Kktif5/A23MVXSCx9wsEbhT8cJHsQoU7pBInqC5AQPN2jgkkcE
	qeYPU8gPwwNQICKHbnqjZFztWpWNioPizdoMo+Eq0fsvQsy48FmTmwgAJnK9sLKMMxmUiMJ6EwM
	DfKVXMe05Vffn/cZPcBFqWbuBSh2bbjR/Am8khPIctJF7zKicz3e+D6eKNiSuSUcf5Y1aAYdl5H
	P2bNZ/aAynephboUV8lFyCcXa8H4iMPvEttBWLrtWvnoKrTG6rQy2XdyYaM0AQyjuzoziZnAxPe
	b6kF+8PTi0l2YEVjY9RUK0ptb3U2Dkkhk8CJXlQv1jBLaWuBoN2DyhRvSkgahxaektWPMPANQ8L
	HR1dg==
X-Received: by 2002:a05:6512:114f:b0:5a2:7b70:6b9f with SMTP id 2adb3069b0e04-5a27b706d4fmr1208493e87.2.1773925742648;
        Thu, 19 Mar 2026 06:09:02 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c27490sm1148020e87.13.2026.03.19.06.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:09:02 -0700 (PDT)
Message-ID: <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
Date: Thu, 19 Mar 2026 15:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98750-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C7D02CBAD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 17:27, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 04:07:39PM +0100, Neil Armstrong wrote:
>> On 3/18/26 14:17, Bryan O'Donoghue wrote:
>>> On 18/03/2026 10:15, Neil Armstrong wrote:
>>>>> +    /*
>>>>> +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
>>>>> +     * the maximum number of enabled lanes.
>>>>> +     *
>>>>> +     * TODO: add support for bitmask of enabled lanes and polarities
>>>>> +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
>>>>> +     * For now take the polarities as zero and the position as fixed
>>>>> +     * this is fine as no current upstream implementation maps otherwise.
>>>>> +     */
>>>>
>>>> This is wrong since you loose the lanes mapping defined in DT, which is still in CAMSS
>>>> but is a PHY property. The lanes layout is not a property of the CSI controller,
>>>> CSI controller only need to know the lanes count, and not the layout.
>>>
>>> Lane layout is a PHY concern but, the PHY API gives us phy_configure_opts_mipi_dphy which should be extended to provide layout and polarity. This would then be of benefit to more than just qcom/camss.
>>
>> Why ? the only concern between a controller and a PHY is the lane count to calculate the bandwidth, the actual pin layout is certainly not a controller concern.
> 
> I think that the DT should be providing the information about the
> connection of the lanes and their number on the board. Then the CSI host
> might want to limit this further for whatever reasons. But I don't think
> that the properties of the lanes should be configurable between the
> controller and the PHY.
> 
>>
>>>
>>> Right now none of the CAMSS users for this driver depend on any other mapping and I propose a separate series to fix phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.
>>
>> None of the upstream users of camss.
>>
>> The problem is even larger, as you replied in [1], the csiphy is still exposed as a media element from the CAMSS driver, this means this driver is not complete,
>> it should be a media driver entirely with eventually an internal PHY aux driver, but this would be entirely implementation specific.
>>
>> Either the PHY is standalone and the PHY consumer only calls phy_open/init/configure/power_on/power_off/exit, otherwise it's not a fully standaline PHY but a composite device like here.
>>
>> I propose that you write a proper media driver for the qcom csiphy, which eventually spins a PHY driver as an aux device.
> 
> Why do you want a media driver? Isn't PHY driver enough?
> 

As for today CAMSS CSIPHY are already media devices, and a user applies media
specific properties to them, for instance media bus format, resolution etc.
Technically this might be removed from CAMSS, but if so, then it should be
done before this new PHY driver model is applied.

-- 
Best wishes,
Vladimir


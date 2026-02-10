Return-Path: <linux-arm-msm+bounces-92437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAeSLgn0imn2OwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:02:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A01187C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C16F4304276C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F9E33F38B;
	Tue, 10 Feb 2026 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBNuy/zb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CAA33F363
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714066; cv=none; b=QXhD6+Jr8fTFcIVcvx5dOwbdQQo0hEXX80Pb8Db4ofn7wOLiGfK5pSrCs01DjkxqjwDCDlFvnQZfSlJPzi06mgISD1jEdd6MPwvQV7uqNVSIP8XO/VNJ2eLe/Jfrky28OdZD78+frvwMpXl4gN8WqMc0C5aEIG7ynEJ7QJzg+SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714066; c=relaxed/simple;
	bh=5TuK/1VHSDAvQJedSrFEg1hBDEt18y5IQCShE6I97Cs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bZK9sdGiNDc9/Khiz5gzR/Vt3z92PvCxwAWXfnmScp7ImtBAFMaUoyJuTMLBclJ6kTIGLUdohV0npxOIIwjmMl+t6qBO99BEAVu/F9ol8NPQkMRQBocwQj9asoueUW87WX05OOcBvXcOPTcpawLMG2WQvf6Y//XT74L84Uq001o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBNuy/zb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-436317c80f7so1774478f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770714063; x=1771318863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNcrRuVJbDcGsHBwzSgQQzMKr5rzXqyv5RgDCsFejSY=;
        b=KBNuy/zbAphcR2Y+H0B01by75cKJUhiEqlPbXu5D4Jl0mAdv2jyYi6VCOykNMHpEdG
         iF7Mu2Mp50SYSdGopl/wkN/M6GkKipJIVcgPma3LCAnxuJ8YkpiDXzeQ4SfKIaoNPerb
         w2fMcnXw3Qu44+Gy8VAOj+Ws6+aObzAjAnn12a1J6hOpOOALFF6F3rv7LnoORUxZmuXY
         bLaGthU0qeZfgtXo2KyY3ukJ8f8VU79qHYEHSt9tAx4kknH021SNhEpp1VpOLm2licGP
         UATNsfIPqOuxkfHEq7oad7l8nlnQ5d4bi/50842EBSuUY6YbJ5U2Poiw7AEHd7X6EvST
         P6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714063; x=1771318863;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNcrRuVJbDcGsHBwzSgQQzMKr5rzXqyv5RgDCsFejSY=;
        b=jCxlb6+pbw69aoiGw0tIIyB2ftqhNGvNENbVsjIbYJvKmrckBA0Rsr2rVgThT/5B2L
         vx+u9z9ZIkSKvXgj4utaPaD9h5CiGKg/tLwEjX2i4euX/UNdwMsN8n3QG3JYnVZ2GJ4T
         hl8FpoSs2YDf/ZhgGW1cRAO+Y7tP+zYkVwuuaW9xVblh7H4SraCo4QEuvPFtY+Q6O41K
         lKK4RR4WS1fkRlNcDkQH2A9T7Nsuot0vZVCd/Tow6YO3OthYkzUqbxKoyuDALagkYYJp
         vsTuMrwaf9fNOQnlty4aqAPVKffYZy29HIBCyI46th74Zp0Kf9RoNhJwqd+seX7hibL+
         LWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj7+Yu7Dff9kumCOTvPSUEJJKwdVj0W2gMueE8BoDKDX5IS/xWhOZ5uQDFg9H8vMErTtx9UEnGEm4+DQx/@vger.kernel.org
X-Gm-Message-State: AOJu0YwijyoWKv5EUJULWmgVTCBv3pH8Q4+/ft4lbTlDpVEeqt0gjtb6
	uowSRT2hJ8/f80yKP+tRdvdWzK61eizvRe9+T0ThjpEN9zsYSgaKMN/EsHXwxVwN7y8=
X-Gm-Gg: AZuq6aJ+nPTTB5Kk9bTm70QPdge89h8SDS1suAmtpdIvn5PFJ27SQfMSAYFOeHHMZSy
	IssFHesDTY1t8gHRaJ6n+eJqCrlbu1Cfp6F2LC5illbb8sA8Y8xZsGeU1PtxjASqRo9Lf/sXu7M
	S9d8JZ85vLIwbYRyIPvRA+NUDj14EWSbdnEtts1P6Ank2x4l/YHR+Kd89aOB3o+VQMfwNVsRqXK
	R6DcJuW76tL8kSdZR8R0MjzMn/7tH8YRKOtbBLI+8G3jz6WoumOuB9zOYz3dDmEH3m/q055ZnzM
	YPq9AeWE9spW2CyOHCpn8ODgEHQy0s/woYnY0dk6rz6e3gHdQCvSDdUa588D194HCTNIb3RKydv
	/dyBhAcgT7IoFauC44Pjj1EnRU/3fQpbnGJwoneYhpSylrMgfWqoVicNBv7vmeFBF1382G8OvBH
	z+SEZ7thkIoIKut54XPfDe+XnvSkYeuUuM3Oa9Tbsa3itpSBhm43YboqJmpak6SX90C+bvoSeGJ
	4Se4w==
X-Received: by 2002:a5d:5d0d:0:b0:437:722d:5c66 with SMTP id ffacd0b85a97d-43779ead6acmr2868167f8f.16.1770714062899;
        Tue, 10 Feb 2026 01:01:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f60f:868a:517c:18fc? ([2a01:e0a:106d:1080:f60f:868a:517c:18fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297450b4sm33534874f8f.34.2026.02.10.01.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:01:02 -0800 (PST)
Message-ID: <8b18433a-5836-4a65-b790-9f51112d1f5c@linaro.org>
Date: Tue, 10 Feb 2026 10:01:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
 <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
 <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
 <b46da4da-93aa-4213-ad75-ec7709008b95@linaro.org>
 <qd5egc42mkdofs4ey7gl664e5el2p5sxwluesjtm7gc3y66hez@l4dz3bd5xm6n>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <qd5egc42mkdofs4ey7gl664e5el2p5sxwluesjtm7gc3y66hez@l4dz3bd5xm6n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92437-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 801A01187C5
X-Rspamd-Action: no action

On 2/10/26 09:00, Manivannan Sadhasivam wrote:
> On Mon, Feb 09, 2026 at 03:59:20PM +0100, Neil Armstrong wrote:
>> On 2/9/26 15:49, Manivannan Sadhasivam wrote:
>>> On Mon, Feb 09, 2026 at 03:00:02PM +0100, Neil Armstrong wrote:
>>>> On 2/9/26 12:30, Manivannan Sadhasivam wrote:
>>>>> On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
>>>>>> Enable the generic pwrctrl driver to control the power of the
>>>>>> PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
>>>>>>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>     drivers/pci/pwrctrl/generic.c | 4 ++++
>>>>>>     1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
>>>>>> index 08e53243cdbd..4a57a631362f 100644
>>>>>> --- a/drivers/pci/pwrctrl/generic.c
>>>>>> +++ b/drivers/pci/pwrctrl/generic.c
>>>>>> @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
>>>>>>     	{
>>>>>>     		.compatible = "pciclass,0604",
>>>>>>     	},
>>>>>> +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
>>>>>> +	{
>>>>>> +		.compatible = "pci1912,0014",
>>>>>
>>>>> No need to add the compatible to the driver. Just use the existing compatible as
>>>>> fallback in the binding/dts.
>>>>
>>>> ???
>>>>
>>>> Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
>>>> compatible as a pciclass,0604 slot.
>>>>
>>>
>>> AFAIU, 'compatibility' implies that the driver can safely fallback and would
>>> still work. If we add dedicated compatibles for each endpoint devices, then we
>>> will just keep adding forever. Powering up a PCIe slot and an endpoint device
>>> are conceptually same.
>>
>> We're not speaking about driver here, but about compatible string which describes
>> a device, a PCI endpoint and a PCIe slot are 2 very different devices that are
>> nowhere compatible.
>>
>>>
>>>> Technically it would work just fine, but "compatibility" has a meaning....
>>>>
>>>
>>> I view compatibility interms of device operation, not device as a whole. But
>>> sure, I could be wrong. If the DT maintainers say so, I won't insist.
>>
>> In the actual way it's defined _today_, the "slot" and "endpoint" power up schemes are
>> compatible, but I hope the slot bindings will get much more features to describe the
>> real world slots power properties. And no, endpoints will definitely not have the same
>> features as slots, using it as a fallback today is an error.
>>
>> On the other side, adding a "simple-pci-endpoint" compatible that enables any supply
>> and clock would be a good solution, if the DT maintainers agrees of course.
>>
> 
> We do have a 'pci-host-cam-generic' compatible. So we can also have something
> like 'pci-pwrctrl-generic' IMO.

I don't want to into this route, I just want to powerup the USB3 controller on
the Pocket S2 gaming device, not spend 6 months into _not_ modifying a driver compatible
list.

All this feels bulky, who a pci device would be compatible with something like
'pci-pwrctrl-generic' we're speaking about a pci device, not a power control device.

It's nowhere similar to the 'pci-host-cam-generic' situation, this describes well defined
host controller interface.

Neil

> 
> - Mani
> 



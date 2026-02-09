Return-Path: <linux-arm-msm+bounces-92311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CSXGrjoiWmdDwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:01:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90B10FFBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 448D33029ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B814336BCF5;
	Mon,  9 Feb 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkEFcOVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3F374731
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645605; cv=none; b=VbrLM8nEliQxx9tZN9icf4u5SnZyHw24eZi5mQN6bgVXaV77miC34ZZqNOSS2JC7JqXByv0iV7j0fG6oOFsAdu3KlfZLpS/khlAQ075jLAn/Eszfd+WDoWOienRLqmVgGo/A/iIqY4oNJanIOHOGFqQnCzUkGfLyN5LdCZMC3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645605; c=relaxed/simple;
	bh=Nuf5oBBoMZpdgayRTi4P5FfCTv1xvNMcXtfo4vkmMVc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oXBrXjYt3ICzD0t5/UgiA885U54l1MWmsXL6TuAYNyJaDXMI3gJ4cpDcdDYua8nUEjdUAelEQcmLDDqaqiJP9ARIViVxjg/lQkyD8SvGb+zGkLG7BzVqMoAhpc11kgE+xLTbSBJzglmZftgg938rRfjhUEkfv3vozCGvbf8bZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkEFcOVd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359a16a400so4243843f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770645604; x=1771250404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbQMmk1MO4QOzPI1aGplcQy9lMA7g33jZd4vEeQtoGs=;
        b=UkEFcOVd+/83yFqYq/bO+yFXF64O66u5xAL/THL1zfEZ0WDVJrxG1+Mvwe3+ttPPrR
         iWVvb0Sl6X0k9bBMhLLbKsPinSkxq2Pz9/iKYlrPgght6dvpVc28JjgxzBfmrcs0yRoE
         knpHpV4FjcbpFsDWrheC7OQeeX5TBxRIl5PKRqz9hoMXi0/5wDxCdEh9qah+XoyzAko+
         QAQXlh5gmD9o9TdGT0BoMe0NGudbbGJQ9VjK/yJ0YsRt+2maHO+cOj3k29aPTH9nlzD8
         rZNyvWXpAUCQbcxjpflg6kGkMOs0042G522gw99UZQOkXCFipKwsA+VDA0Ll5elJnpEz
         /zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645604; x=1771250404;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbQMmk1MO4QOzPI1aGplcQy9lMA7g33jZd4vEeQtoGs=;
        b=oWhYJt0BsCjJZhip5yXbEarm3BwcTigLkiodNqz+p3zk818HCtEoQmsovL8r1/r2g/
         cC/rGDsAFK5iS6o/8/4MEpI6MYebtcK5RSgA9yWp4A3b7Qdn+A8OxbqwWPA9RR0nkUHD
         b+BxzNF3aon/qEDEgpwQdQQfvOUlc/+LaUzSKy32HmeXOpsnz8Lohp5VbEuI98+x9h/S
         SQbyruv/wBF3oAbnnWAPczexB1P+ZvyPNv9vEMKSSAr2d5an7h0JqQVNw6KRSliAl+ID
         eO3SKebWsYhvEKqLfrU7YKeY+sLnyY0oadASiFN3ExHj8R+O35dO6sALsJKU+SE+/R9J
         6SAw==
X-Forwarded-Encrypted: i=1; AJvYcCW0YRbjvGKg3HBxq33A2W2NzfbsrDujijwRQpujHee0HegJaYC50OL1UsxqE1mCzTLqWHMjSdq0KBtfzHz+@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTBAdbJ5ovPJG3GXXOjgVfva4zY/8rNd/mzxouqELqydXZcVh
	s0Ob0yoTS6yW5IG6OfrciTX3SWBnbRagTJJUA3xKSGIQqQSbvEa9lyicokqEwx4MLow=
X-Gm-Gg: AZuq6aKLs0Pb02ZWAFw9Gf6QaR68DchY6xa24E6tREbHAWNoC9oa9W7/o/9jc6KsDAB
	ZOkt/qiPc+HNcUPYRiXN5BTebci1sTQfYtubq5KnPWr4MQboOGwvHGVPw8LpMIGs23KaVp4+gv9
	8m+8ot6kDXkoQWXVjYo8+91AY7emtplZddXojZeaXs7mOB+dOaZY/x3GzoYwEs6HqKq8HzE9Z7e
	q5hgoL4jMmL5PDgOjFuIKkCM1bUYon6NRNW3D0tkEhEl8VqN5CgmkJrT/wxIeI9pXUBPMbZMKb6
	JvAjb4MUkeaeAZXYkXqHBktnt8uzIJQMXL2AZptNcsrlLQ5BUKvi/3fgktT/pygXsG5IdLiPg2t
	+9FyxU1UGJ5VGKjBmVioqTSJVUw4BJEMx6Tgd/gCa/p0Yp08sF7zcPD5oz1HYFbE8Uyy8bWWm18
	Olr0Y0jqIb6DUtnC34Ep7rTc2ZHoOuPaG0IvJo8/rjTI2gQ6wWm6g3K3UU3g+DfIE=
X-Received: by 2002:a05:6000:24c1:b0:437:712a:fab5 with SMTP id ffacd0b85a97d-437712b0c7emr3989897f8f.35.1770645603442;
        Mon, 09 Feb 2026 06:00:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:44e3:9198:bd5d:a3f? ([2a01:e0a:106d:1080:44e3:9198:bd5d:a3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297462a8sm25096267f8f.30.2026.02.09.06.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 06:00:02 -0800 (PST)
Message-ID: <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
Date: Mon, 9 Feb 2026 15:00:02 +0100
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
In-Reply-To: <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92311-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: BB90B10FFBC
X-Rspamd-Action: no action

On 2/9/26 12:30, Manivannan Sadhasivam wrote:
> On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
>> Enable the generic pwrctrl driver to control the power of the
>> PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/pci/pwrctrl/generic.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
>> index 08e53243cdbd..4a57a631362f 100644
>> --- a/drivers/pci/pwrctrl/generic.c
>> +++ b/drivers/pci/pwrctrl/generic.c
>> @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
>>   	{
>>   		.compatible = "pciclass,0604",
>>   	},
>> +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
>> +	{
>> +		.compatible = "pci1912,0014",
> 
> No need to add the compatible to the driver. Just use the existing compatible as
> fallback in the binding/dts.

???

Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
compatible as a pciclass,0604 slot.

Technically it would work just fine, but "compatibility" has a meaning....

Neil

> 
> - Mani
> 



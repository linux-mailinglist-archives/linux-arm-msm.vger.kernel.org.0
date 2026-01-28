Return-Path: <linux-arm-msm+bounces-90927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKAsMAPPeWnezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:55:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7309E7FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6632C301C16B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E184333AD9C;
	Wed, 28 Jan 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+v46eqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB733A9E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590313; cv=none; b=juHHFJPDrO09fAoNWtmA4jwILEHXQ7wW0iqxMWhqfQtylOpJ9Rg6hCPz/0Lo95w5qnWRyawRyAXmUBNpRcxlG+JFhsfUAhAJZU6W1XmylqwckhHc2Wh0Hru8RUdEXaMCXqEtQQppdRv8jeq4uQlfzTPP+DLJbDOc+J6/3Cz1h1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590313; c=relaxed/simple;
	bh=X2AzdKeGMu19tO1ypR/VJC5WRPHhh7DKhZdB6XQSJHI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TYZOa49o85UL4gh0iy8vHiFIRgwI3VzL7Q0xhrtK6mo+dQ55o60oHtYCp7g3K2ao//gh3+tTWh9Wb24NxZwk42VWgqoYrCaMFd/E/M+8W06LQ3xWQ2gR4IhcP4Oog6DxOEuLV4Dtf0uaJYddV9VJAJKqtUtUWxsBIBl05TqMWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+v46eqb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so7461055e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769590306; x=1770195106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkssKX9UZLI3a5TYO9ENZYAnlkONRgQSKBvfWG/TLA4=;
        b=t+v46eqbTW5XM6obyBEMzkqYgESFckHAk/whgKXQvrxkoub0siR5k34gc8CSoCGwWk
         6vwr2IqLsIYvaZRUUwSEOv0c0vtILiQbwoddqzQwNU1gRDPgIadRC+/+GR+h4BZyg/Te
         4+yXlRsQ6kukqHeW5f1cmzCIUDDp/HPCqSUcsCR2+OX2VmM1rVF3+HlY06ojyKCaZY0N
         aoHDVPJ4AZsLUWWrqF02/sEjyFGF2PsCzi9EtAxmqFzks3krk0vXZimCUufDsr3ILJJT
         CQ+d+J3+3ApFtJO3JrVC9GLEyhDmCfS3ySkb0ud9KWQiUZrqv+z9EQu/Tzt/Umk7LudR
         OaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590306; x=1770195106;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkssKX9UZLI3a5TYO9ENZYAnlkONRgQSKBvfWG/TLA4=;
        b=HrUKVmeq5JCDPeqD4zu1eeq6GSdmwQPZ5icblymHhKF7qM4GueVZalix7af1o4S4A3
         ZQ11VkziTQuEiJ2NhbE8CBRCUFGqP6xFeePsjJVEobEDUrqWKeRtNDGONQ/M19Cbv1q2
         BH7iuLTWVNv/lYI7ye7HiI62lkeCScl85T7lI6YvCzV+yPVL0WLIf60Hg0o3hYMSx9F6
         4jEdP2tz+VTs1Esa/j2mITChbEu33Jn/S6r/XMPsOeTOOQXZygnOqCfufTnSxKa5c+hj
         Dc8mn5h4/5DHQzu2eGtCOPb1QaePr4XucxtCgZu5M2fz5XuERVJqCNJLgiVUdNmaX6xu
         cRDA==
X-Forwarded-Encrypted: i=1; AJvYcCVvP7dvomDI2vgNatR1wDV44IlZlWSCrzzhwwi+evFnDWiAXkkoSEUDylVUywdslYLrpw2bFhhmYR+mwF85@vger.kernel.org
X-Gm-Message-State: AOJu0YyrybsPRUruU7LJVBPtegjv8+TD8S0mJcat2iDiZW/UPw0eEqKG
	teGINCkLoBRH8TChcwiA4Fp2jqhWMeRld0s8CdEx3Asu6jubwyLPMPumbJRv/SxfHVc=
X-Gm-Gg: AZuq6aJlvNUJMXElWMfKhy5pvOh0EupdTqR/wfk2Nkjyd1PwTWwEWXD4X/JSm43Mdzz
	c2vdgws3MYhT7P2l9PedQZ9V6TZLDssCUnoDwLI4b3+OGFiyhUCYuK3300XEqws7hXHfugQb156
	jgS1lQEffvQ+XJHSRNiyvLlwCZpl4nh1wxWm30QCyuVKkSdnVTaw7objja7O5XisSplRRnxj6wv
	pYfMsOMbLb3tc068+7b0xXbFpBsqfNahcFvrD2g+r6OoEUE+6wYA1Xs3fQuOpq+2C7A1CFpgIkE
	QRskhH4Y/5JQLF3A7RFgE6Zxe0DJGjZKbIROP2PxvOS6h0TmK+EmpICrouklAmLJro4lh3a1jkP
	XNbpN/90tYTFsrnYHNvJr7cS5uFXLhYmXw1Prz3eQl0UsoVToJri5s1QPSTvlS0TI79I2l3ix0J
	4B22+5+nbG3wVGhvaNbr9zGij4MWmlFdIRhT4aZlBVPBwNTKs/d90AwuIZuBIgvGQ=
X-Received: by 2002:a05:600c:4592:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-48069c5b97cmr56776605e9.17.1769590305903;
        Wed, 28 Jan 2026 00:51:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68? ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffe9sm66744915e9.4.2026.01.28.00.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 00:51:45 -0800 (PST)
Message-ID: <c3b678ea-fca2-47ff-bc39-72ad498c8641@linaro.org>
Date: Wed, 28 Jan 2026 09:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
 <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
 <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
 <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
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
In-Reply-To: <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-90927-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:dkim,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 3B7309E7FC
X-Rspamd-Action: no action

On 1/28/26 08:57, Manivannan Sadhasivam wrote:
> On Wed, Jan 28, 2026 at 02:22:50PM +0800, Shawn Lin wrote:
>> 在 2026/01/28 星期三 5:53, Neil Armstrong 写道:
>>> On 1/27/26 16:53, Manivannan Sadhasivam wrote:
>>>> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>>>>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host
>>>>> Controller
>>>>> power control which connects over PCIe and requires specific
>>>>> power supplies
>>>>> to start up.
>>>>>
>>>>
>>>> This driver only handles the supplies. So why can't you use the existing
>>>> pwrctrl-slot driver as a fallback?
>>>
>>> It would fit with no change, but the name "slot" doesn't match the goal
>>> here,
>>> it's not a slot at all, it's an actual pcie IC.
>>>
>>
>> How about renaming slot.cto something like pci-pwrctrl-simple.c, especially
>> if most power sequences fit into this category? This would follow the naming
>> example seen in other subsystems, such as drivers/mmc/core/pwrseq_simple.c.
>>
> 
> Yes. There is no point in duplicating the drivers just for a different name.
> Slot driver is relatively new. So I don't think there would be issues in
> renaming the module name.
> 
> I'd prefer for 'pci-pwrctrl-generic.ko' for module name and 'generic.c' for
> driver name.

Will do

Thanks,
Neil

> 
> - Mani
> 



Return-Path: <linux-arm-msm+bounces-105641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9d2NJbRA+GnCrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:46:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E214F4B8FB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A094330053AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 06:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1AA24BBF4;
	Mon,  4 May 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmV7dOud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216251A9FAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877168; cv=none; b=bpVtfIAVaP9V4bDRDpeICfBdzJNU3STggQQ6Z0MjFX/l2k9uzB7H0xXEhZSblKJeLSPlY6MhVSaqw2OMYPVUCcZDX+Pi+paemjEafFqHHeZiW+AH4VBgd5Xily7X/9n/aeWY5wQTzNSe5sfusegFGbKij725uli+xL7UB4oytWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877168; c=relaxed/simple;
	bh=WOUTFRQXY7u4mCgzjAgnVT8wNzDI/PXA4wTabljAAkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4t1jQtLXURLorMbMozrWoWnWDFdFoxLBa8Q/3kaYIWi3tZdzUsNPoRsDYs7BOaTmC3nDFGWeYSochqLJkvPxg1CwwafFcqIS26CyKpu2LILKJCLelcYbvWozIGQGFUy/nRxw72HokiCW14eijPqNdkF7gFlIVQn/eeD3unbAP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmV7dOud; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso1516276f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777877165; x=1778481965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOccawuCoFWsjijYdwToilKKz9XDVnegxFTh6EZHPuU=;
        b=jmV7dOudGI90beUFDyMX3vQJyJCJf8b62/jkvuM0i9UFQQR13b3SU1AmvrK0xM50sC
         vFPZvy5tC5+XeXznxOXM/LBNdBawkGwjMP5B5J+a9jn/V0ZHxjjzgz3EhFeNOeaxamMq
         KS202Wwavbvdo48XMjpJ3TZKSOsLA0TvSiOoTEvEXEL7vZAnvriLPw/2QhJ//Nuurhys
         Hw1YMSfO/YFRMp0lRpk6881pyNk6s93t1TnMDevL5EFFw//mrH4J8MFZj/8GCH5yBqUH
         faUz1HI7KgOGbbSLvflMCPkGI9EzFzVt9357IzfVB5X46SQ2+NVNhWcxD2a6DsJoJHtn
         xtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877165; x=1778481965;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOccawuCoFWsjijYdwToilKKz9XDVnegxFTh6EZHPuU=;
        b=Rw0SER1+jsnf4wZdNaEix8jwRRQJOlf3Gs7bbtB3uKg0ESTrzsdcZ63IFOkfFOzpwB
         /UXxuFMpOPrTQV+1jhfU7MpepqUWfmOhfRdAFZQ5AHI7pQAHw5/kK5bi7nBAFftyQn3V
         21THrZHciTXnFr1mfXpgTIDt3x10mscWw8JnO8aMNPgkVDZJca0lkOyvmj03ssu8i4+w
         5WlpXCXVhSsb/Xjc8y8Vpi+Je77u3030PSyaK/dtypQI5jl/tNhT57f6O69fgBPjx47i
         wk8lpomvX8ecnXEVyysmzHdq3j9TLfhfkW6XcLqLAvXF3/2C8HHNnlhgrqXlWk7fLKD1
         KEDg==
X-Gm-Message-State: AOJu0YzlRRdKMkugVvBqgl4MVxshZCCezsiEUisl1yFmz5tmrXg8cl3O
	6RMybJ7BjKjeLPjYpXs+ifOXAgwju+TIVNbvDnTGHFsNJLWWsf7jXYxjuKPLCKhaxOIXvJEheGk
	YiLlPVWc=
X-Gm-Gg: AeBDietCQ5XIBWDUb/CI2CyT5+NnQmraakvnRaHok5nOMvbx67ab6xvsa+dQgVV/BgC
	B1yTTLkv2t8ENiLflixOAwnz3uDIXhbFsN7FJU5UFzQctQ+EcmAcPDQs+OmF7nBRlCHdmu0LrMZ
	vdbdEOMKUP+9Bh3pHP1616RcfezEwazkzjdL8WOz/qY4G1jXP4eE1UC48KU02vjTLHAeg1Vpmhn
	0i5WQgdkBCLYmdS/zbfO6Yx+vx/Baw/GAgn6vYgDZeknxGV9lkimsJPDv1JdlgFC/AbeOeGqulM
	gDhOg5Ikjs2wyx+skjXJYfpzZLhOhd5brNb9ziAnTW+4UbXsaNjSR2JPHbEzLNDto7QTCwi87pk
	4/0GP+w6MdhiFedh92h3pcMDz679ov7HTbb/RAyYuSAtA/Us9+nF08/9L4Jsx3C1b0cV51MOevH
	WuqwYPhHWxvZ5i9IBy4QUxnfu475f1D0xtIZJE5ZQ3POD9N6XIudVKlrD5LOe79/xsdtAguMSv4
	q3Xe7dXaSsGECzjiA==
X-Received: by 2002:a05:6000:2003:b0:44a:2509:fbf with SMTP id ffacd0b85a97d-44bb63f5834mr12677316f8f.21.1777877165312;
        Sun, 03 May 2026 23:46:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4245:af61:1735:3752? ([2a01:e0a:106d:1080:4245:af61:1735:3752])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50e59sm22923096f8f.10.2026.05.03.23.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 23:46:04 -0700 (PDT)
Message-ID: <d774b2f2-75f8-485f-830f-2a7a5dac1c23@linaro.org>
Date: Mon, 4 May 2026 08:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Modify interrupt handling for EUSB2 Phy
 targets
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E214F4B8FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105641-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

Hi,

On 5/2/26 11:56, Krishna Kurapati wrote:
> Modify interrupt handling for EUSB2 Phy targets. Enable DP Interrupt
> when an Low speed device is connnected and enable DM interrupt when
> a High Speed/ Full Speed device is connected.

Could you explain _why_ and not the content of the patch ?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Tested remote wakeupon Glymur device by button press from a headset
> connected to both Type-C and Type-A ports.
> 
>   drivers/usb/dwc3/dwc3-qcom.c | 63 ++++++++++++++++++++++++++++++------
>   1 file changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..5956821eab45 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -60,6 +60,10 @@ static const u32 pwr_evnt_irq_stat_reg[DWC3_QCOM_MAX_PORTS] = {
>   	0x238,
>   };
>   
> +struct dwc3_qcom_platform_data {
> +	bool			uses_eusb2_phy;
> +};
> +
>   struct dwc3_qcom_port {
>   	int			qusb2_phy_irq;
>   	int			dp_hs_phy_irq;
> @@ -85,6 +89,7 @@ struct dwc3_qcom {
>   	struct icc_path		*icc_path_apps;
>   
>   	enum usb_role		current_role;
> +	bool			uses_eusb2_phy;
>   };
>   
>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -272,15 +277,21 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
>   	disable_irq_nosync(irq);
>   }
>   
> -static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
> +static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int i)
>   {
> +	struct dwc3_qcom_port *port = &qcom->ports[i];
> +
>   	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
>   
>   	if (port->usb2_speed == USB_SPEED_LOW) {
> -		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					     port->dp_hs_phy_irq :
> +					     port->dm_hs_phy_irq);
>   	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
>   			(port->usb2_speed == USB_SPEED_FULL)) {
> -		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					     port->dm_hs_phy_irq :
> +					     port->dp_hs_phy_irq);
>   	} else {
>   		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
>   		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
> @@ -289,8 +300,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
>   	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
>   }
>   
> -static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
> +static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int i)
>   {
> +	struct dwc3_qcom_port *port = &qcom->ports[i];
> +
>   	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
>   
>   	/*
> @@ -303,11 +316,19 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
>   	 */
>   
>   	if (port->usb2_speed == USB_SPEED_LOW) {
> -		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
> +		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					    port->dp_hs_phy_irq :
> +					    port->dm_hs_phy_irq,
> +					    qcom->uses_eusb2_phy ?
> +					    IRQ_TYPE_EDGE_RISING :
>   					    IRQ_TYPE_EDGE_FALLING);
>   	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
>   			(port->usb2_speed == USB_SPEED_FULL)) {
> -		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> +		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					    port->dm_hs_phy_irq :
> +					    port->dp_hs_phy_irq,
> +					    qcom->uses_eusb2_phy ?
> +					    IRQ_TYPE_EDGE_RISING :
>   					    IRQ_TYPE_EDGE_FALLING);
>   	} else {
>   		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> @@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>   	int i;
>   
>   	for (i = 0; i < qcom->num_ports; i++)
> -		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +		dwc3_qcom_disable_port_interrupts(qcom, i);
>   }
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
> @@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   	int i;
>   
>   	for (i = 0; i < qcom->num_ports; i++)
> -		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +		dwc3_qcom_enable_port_interrupts(qcom, i);
>   }
>   
>   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> @@ -609,6 +630,7 @@ struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>   
>   static int dwc3_qcom_probe(struct platform_device *pdev)
>   {
> +	const struct dwc3_qcom_platform_data *pdata;
>   	struct dwc3_probe_data	probe_data = {};
>   	struct device		*dev = &pdev->dev;
>   	struct dwc3_qcom	*qcom;
> @@ -624,6 +646,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   
>   	qcom->dev = &pdev->dev;
>   
> +	pdata = device_get_match_data(dev);
> +	if (pdata)
> +		qcom->uses_eusb2_phy = pdata->uses_eusb2_phy;
> +
>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>   	if (IS_ERR(qcom->resets)) {
>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> @@ -838,8 +864,27 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>   	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
>   };
>   
> +static const struct dwc3_qcom_platform_data dwc3_qcom_pdata = {
> +	.uses_eusb2_phy = false,
> +};
> +
> +static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {

SM8550 was the first QCom upstream SoC to use eUSB, should it be covered as well like SM8650, X1, ... ?

Thanks,
Neil

> +	.uses_eusb2_phy = true,
> +};
> +
>   static const struct of_device_id dwc3_qcom_of_match[] = {
> -	{ .compatible = "qcom,snps-dwc3" },
> +	{
> +		.compatible = "qcom,snps-dwc3",
> +		.data = &dwc3_qcom_pdata,
> +	},
> +	{
> +		.compatible = "qcom,glymur-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,glymur-dwc3-mp",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);



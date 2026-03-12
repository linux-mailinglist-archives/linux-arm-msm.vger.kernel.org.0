Return-Path: <linux-arm-msm+bounces-97174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNHAEDuesmkOOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:06:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F1D2709A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52B0A3009390
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF8439B97A;
	Thu, 12 Mar 2026 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLefyU8c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWzZncL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7993399368
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313577; cv=none; b=mJw7At21thTQredsBVgXR3wAP8AVxRf1Kk/+6XXkLqdxUkq1POPQXV+zJDP1oythW+Rf+shqmoZRBgXLtdDpatYj9u8PvY8tzoOlCnIGKY1qeusbdOQQ1ZlYr6t9xV5XIfXZAlygL4nYQ387YahC4Hf2imKrxdPczKu+CnoNyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313577; c=relaxed/simple;
	bh=CgWNIiS+M0AOGBmsGiYrX0z/waqFRn3xgrom+Vf1ip8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Txh84J+iBGWMgtJ1aiY3w4kPE7ob11HhnDEl4ylxcp1cEhIu/8+Z1PuXWIAhw3q9gKOxtJJmvl1O1vRrwvDjpXX8Q+2zENsICm/yG2pjAa31xxilUOqKAw+Q0QzMdubRN9m2eTHpBs4wq+JcdIJLkdH/p888VJPWs401SWHhv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RLefyU8c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWzZncL/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773313574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0GjOCrLZMJdWmBqARXEFoO0AI1gLdN5XafIHahOrOo=;
	b=RLefyU8csHdcuJjLdNbO8NT6ZXgJL2I25o+/OuI9AHkt5UU4zy9kbK8OtcksglSzsyt06a
	IxuvsIpHG87ko1Ar8azEfa/QNL26GtKFbIQo7cO8riWd7cMQjSli4Go+D12MtoCRA4TmqB
	A41BUAbK+CYNWL3U//1ZWh9S8GNok5Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-z9bSQ2PkMaK6BLhI0h_Qsg-1; Thu, 12 Mar 2026 07:06:13 -0400
X-MC-Unique: z9bSQ2PkMaK6BLhI0h_Qsg-1
X-Mimecast-MFC-AGG-ID: z9bSQ2PkMaK6BLhI0h_Qsg_1773313572
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439b699b9a6so813974f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773313572; x=1773918372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0GjOCrLZMJdWmBqARXEFoO0AI1gLdN5XafIHahOrOo=;
        b=CWzZncL/hOg+k6h5YFk7cwF7clCounjODLg75YCIkiud9zaa4WjkFuHMyJfSfWGSxs
         G1HDOjMckGdPZ92idkolFPuzAdWBI0utK4W1U6TgX5Oabvsv65HxrJFzlLzFzHwdlrAk
         yNLR1/XPf9VwfVBqbN6ktkBHcaIesxgnAP/twHSYizZKFjl6XeSkpfw4aHMN1dVMYmDY
         IQ6CwD4Eoq/zXN2pFskKdCC7ZRTEI9FN+eBWCsAMY1uNyifQsVdMJc+tyXqjzszHgQQj
         TUSsdbdhs/pwvqsS44/D1H8wUUIwESK+X3Bu0VmZefesp9BOwZHms8jPDOApmLrkhcM/
         5nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773313572; x=1773918372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0GjOCrLZMJdWmBqARXEFoO0AI1gLdN5XafIHahOrOo=;
        b=V4bwjIxHUq41mA7mnUxica6KViZ9oXu6Lxyf0ypr6wTBEvhnJIRtd/6Yve2civMxlu
         2Eym12dpAFZxrAyeh4qKEABHobfS6xy8PlwQB3PDHOsya7wpkY98YRizyzj8NrSEg51R
         MJmvfYb0cT/C0d8imEuBuPuFfey2XuienyTFRfsS+0lgbpvpPJkK6sBEBAu6Mh2zNNHm
         pg8FS+kamjcWFBlEkbhADmlAyX9eGStNGXMTPZs4voBwgjHXAzmI9Ar0zO4lBjhsILeh
         XEZCl492d0PioflQ9dGHnhZbx6K/kDHwLLTt5rfn/69FtZbzHqm6AhtjebEkcY3Y/g/7
         yIhA==
X-Forwarded-Encrypted: i=1; AJvYcCW8a7hmZjRCwKUn/ePUYMd//9JIAkS+b5nxW66arv6rfHq/IiOSpUHtR3zOb7fqw4H/aRdeRBVdI7/d4VDZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nDgz1vE3ACLb/kAGnex3tURkYZ8vObepzeMLdpHBvoFtFHdf
	0GFMxNVAQR+V+ckHPIMBdufSbovsoGcJ0OuJiLA9J2j4z8rvGJU6b0vHgrCJqenpJmfR1EiVpnT
	ytIoxJv+ij3NJV07G9SvSqWmp3FhuGQsXLPLsnp9j6DjqOD5lhS8YlNc/sN31BDGZj2A=
X-Gm-Gg: ATEYQzwrc/PuiHJSVGtICCgyB1gQN2WaBQyuuWsmcyVEPaNSG2Fe2Id8atcyQhpXGZ4
	OCpfY4aIjEyLx7jm/zlW459m9OXiOdxMLDUfz8Bem+zDvCsSXwdsFm+R/iSeY2WMTqQl0uDuVnZ
	7Yj62pMkVcRJAVSY8IsbDHvGiC/S3c6ewaTNfFqdJOH1UE0Dx59FI1RwUaUbgfFmYCJclbrho7I
	2pzpMHU0+6vBsFGEZse0DJbkd7b3jjkFm5C8vkUp9MeFcksUfbgzdcEx3ARv+TKxS1yH6jYWyqY
	Ff2hDi4A2PcEp0E4kOSQcEVC7BeJKSr90/ZeEzNNlX/yfTO1/kNP57YU4wEbQHs8zSbMIKKNSxY
	N2IPNECgkR0/BgfVMqt3yHCMyzIgXD1yHRta2keqi76J6t5AXoEmaPU0=
X-Received: by 2002:a05:600c:3548:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-4854b129fffmr97036605e9.27.1773313572508;
        Thu, 12 Mar 2026 04:06:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3548:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-4854b129fffmr97035605e9.27.1773313571932;
        Thu, 12 Mar 2026 04:06:11 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6b95sm116309065e9.6.2026.03.12.04.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:06:11 -0700 (PDT)
Message-ID: <04439ab3-818d-460a-9307-2c6cca4f9ab7@redhat.com>
Date: Thu, 12 Mar 2026 12:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 2/5] net: phy: make mdio_device.c part of
 libphy
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
 <c6dbf9b3-3ca0-434b-ad3a-71fe602ab809@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c6dbf9b3-3ca0-434b-ad3a-71fe602ab809@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-97174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43F1D2709A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 6:03 PM, Heiner Kallweit wrote:
> This patch
> - makes mdio_device.c part of libphy
> - makes mdio_device_(un)register_reset() static
> - moves mdiobus_(un)register_device() from mdio_bus.c to mdio_device.c,
>   stops exporting both functions and makes them private to phylib
> 
> This further decouples the MDIO consumer functionality from libphy.
> 
> Note: This makes MDIO driver registration part of phylib, therefore
>       adjust Kconfig dependencies where needed.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - add needed Kconfig dependency changes
> ---
>  drivers/clk/qcom/Kconfig          |  2 +-
>  drivers/net/phy/Makefile          |  6 ++---
>  drivers/net/phy/mdio-private.h    | 11 ---------
>  drivers/net/phy/mdio_bus.c        | 36 ----------------------------
>  drivers/net/phy/mdio_device.c     | 39 ++++++++++++++++++++++++++++---
>  drivers/net/phy/phylib-internal.h |  4 ++++
>  drivers/phy/broadcom/Kconfig      |  4 ++--
>  include/linux/mdio.h              |  2 --
>  8 files changed, 46 insertions(+), 58 deletions(-)
>  delete mode 100644 drivers/net/phy/mdio-private.h
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a8a86ea6bb7..a277c434d64 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -392,7 +392,7 @@ config IPQ_NSSCC_9574
>  
>  config IPQ_NSSCC_QCA8K
>  	tristate "QCA8K(QCA8386 or QCA8084) NSS Clock Controller"
> -	depends on MDIO_BUS
> +	depends on PHYLIB
>  	help
>  	  Support for NSS(Network SubSystem) clock controller on
>  	  qca8386/qca8084 chip.

Bjorn, Micahel, Stephen: are you ok with this change?

Thanks,

Paolo



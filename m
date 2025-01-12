Return-Path: <linux-arm-msm+bounces-44822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0599A0AB16
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 18:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 896363A63AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 17:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404FC1B87ED;
	Sun, 12 Jan 2025 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="fnH0iNQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08BA1BEF7D;
	Sun, 12 Jan 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736701435; cv=none; b=ai/Rd0J15ID9pQgksSeMJlWFdnBsj26aX4SQn6gpMnypey5tWSW14CKU0n+6J7xTvvJt97unaXFk9YgPDh9tdo0M8XhRNWVCXBDUN7vw1uR5CV2XGPGp0i1BeSfCsMNrflKIxXT19syCYvhjtRVyvYvw0Q2PslyANYKNZGInfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736701435; c=relaxed/simple;
	bh=ABE6baLfT+jnOfm3E0iUTl8bed0Mn68JyxJRW+NvnLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G41g8LplAGLrDj706IxuoCTzGrJWPBFAFy7HKUmkZhBfvilh6Tk2FBAnk6orjUEETHVAYC/cpuUmed50LI2ilymgYX1eeStZSJ5gJpRcTHOGIZ82czPB10rqY4fJyWKV3QLZi+oNwGIFbxM4eXY2E5t7X2MwJetuM/rkm3VIpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=fnH0iNQQ; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id X1NCt2XX5qZ5JX1NGt8sSO; Sun, 12 Jan 2025 18:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736701429;
	bh=gcp02vfLN1uVTWXJ8UJ8BzKX5eeyuNnorXOtRkd8w94=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=fnH0iNQQzQe3piqBMIVE5d9BG6+w8xEgN2VBqmi8AXirOeRy60NrMR/v+/jXABh16
	 JpvenW7mQrRyQJNS7ODfCQud/A0sHpCYumL7Rxo4dvkQRkFn5Sq+X8YWWLh1l3Npj7
	 EKCh7IqNNNluOSSWpJWw/jeZKljq/zAdtpT71biBfD3cTuF1rjWn5vFZEgL0E6FQCj
	 rUQtMFXuQPg5CYG5zF84tPPtJtZ/Li8U3366GMCLOd/+RYloATVfvXiYux/yyQLhAh
	 h/GhbIjMLlosT95vg3PB740gtcl7sPYn5Kc0tMKx+JEYGR+BJ4RpBBEKNHbPCy3uh+
	 8FUFx8/CX7JlA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 12 Jan 2025 18:03:49 +0100
X-ME-IP: 90.11.132.44
Message-ID: <05dfdd2f-e2c2-40ff-8a84-038c4da8385a@wanadoo.fr>
Date: Sun, 12 Jan 2025 18:03:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: Constify struct mdio_device_id
To: Andrew Lunn <andrew@lunn.ch>
Cc: SkyLake.Huang@mediatek.com, UNGLinuxDriver@microchip.com,
 andrei.botila@oss.nxp.com, andrew@lunn.ch,
 angelogioacchino.delregno@collabora.com, arun.ramadoss@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@makrotopia.org,
 davem@davemloft.net, dqfext@gmail.com, edumazet@google.com,
 florian.fainelli@broadcom.com, heiko@sntech.de, hkallweit1@gmail.com,
 jbrunet@baylibre.com, kabel@kernel.org, kernel-janitors@vger.kernel.org,
 khilman@baylibre.com, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux@armlinux.org.uk,
 lxu@maxlinear.com, martin.blumenstingl@googlemail.com,
 matthias.bgg@gmail.com, michael.hennerich@analog.com,
 neil.armstrong@linaro.org, netdev@vger.kernel.org, pabeni@redhat.com,
 piergiorgio.beruto@gmail.com, richardcochran@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com
References: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
 <9dfeb860-3c0c-4f16-a150-fdce133281e8@lunn.ch>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <9dfeb860-3c0c-4f16-a150-fdce133281e8@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/01/2025 à 17:46, Andrew Lunn a écrit :
> On Sun, Jan 12, 2025 at 03:14:50PM +0100, Christophe JAILLET wrote:
>> 'struct mdio_device_id' is not modified in these drivers.
>>
>> Constifying these structures moves some data to a read-only section, so
>> increase overall security.
>>
>> On a x86_64, with allmodconfig, as an example:
>> Before:
>> ======
>>     text	   data	    bss	    dec	    hex	filename
>>    27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
>>
>> After:
>> =====
>>     text	   data	    bss	    dec	    hex	filename
>>    27206	  12600	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Seems sensible.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> Is the long terms goal to make MODULE_DEVICE_TABLE() enforce the
> const?

It was not my initial goal, but I can give it a look if you think it's 
worth it.

But some other constifications will be needed before that.

CJ

> 
>      Andrew
> 
> 



Return-Path: <linux-arm-msm+bounces-44446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DFA0655C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 20:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DCB2167C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 19:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1132B1A9B58;
	Wed,  8 Jan 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oyg0qeRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B56126BF1;
	Wed,  8 Jan 2025 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364638; cv=none; b=ixUQpkl9cjJD2mRRXDqFu50eaWPkm3hXy37gGg0khhZ1PD6fHNCkgnug2LwFRrptTL/fg0KL3dC3sHCBdwSggW/DhvhIFQ/nKjV7U6zRAlnoJA+bvcXyBo+/eEcGwaV/8OTl+x+a7UprPLHUMUvAwQYNUazuF7VadO7GWKU2f68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364638; c=relaxed/simple;
	bh=nIiqJwgUAFtVpyksqLsfSNzy2JZ9A1KLXmCabtcF124=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThMn1hOtEQgxUj90eAN72hGjvHNOXitjAhxwdCMXOBKmmGzaBAq2bAjjTWdi0ZcPmHW1sJFTWsxWTlkaK7hlvCLLuf494vgaSlQZhZa8Xr9XY002V3vqfvSXumNHxs1sZXqFz+wQt0ljIs0wre7O8Do2FkAOtMiA3BGynZDjANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=oyg0qeRt; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id VbjytM2bILSCnVbk1tFZHg; Wed, 08 Jan 2025 20:29:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736364562;
	bh=3W/qNrGfy6V4CsHDQcIGMo3JImJKU5XjyGyfj1Fe0Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=oyg0qeRtAZOgvOHU2jxOtU94ifwY2QbOKJPq1I/IU+5rV/sQC6N41QlptIxScYep0
	 65ppcGd7XcTESq8CrBffrSKsYCGJiXyYtOwyTA8NKWDM79NVh8zxwaIiLLl45Afp19
	 ZEMZImUt3kH8yfTbOfMdtf+yFzHErAuHdpeo33um0iCQDzEr9gwkpc0ej/64qzzGFl
	 1U8qxrd1eAZKsExnNFCJFw4VCe11UAjS5nVbtRpSIGmHX5IPf1CiwBgnWrXo0qissf
	 7h3ekCyF5fj2MtHC6nks5o7l1474pvCXluX6PE8VqRNdCYDK3GIPIZBYquYhhg+R3+
	 YCZcHoIQUxwGA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 08 Jan 2025 20:29:22 +0100
X-ME-IP: 90.11.132.44
Message-ID: <4916d329-4513-46e1-ac1c-34628f335dde@wanadoo.fr>
Date: Wed, 8 Jan 2025 20:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/14] net: ethernet: qualcomm: Initialize PPE
 queue settings
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
 Suruchi Agarwal <quic_suruchia@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
 quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
 john@phrozen.org
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-7-7394dbda7199@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-7-7394dbda7199@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/01/2025 à 14:47, Luo Jie a écrit :
> Configure unicast and multicast hardware queues for the PPE
> ports to enable packet forwarding between the ports.
> 
> Each PPE port is assigned with a range of queues. The queue ID
> selection for a packet is decided by the queue base and queue
> offset that is configured based on the internal priority and
> the RSS hash value of the packet.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

...

> +		/* Initialize the queue offset of RSS hash as 0 to avoid the
> +		 * random hardware value that will lead to the unexpected
> +		 * destination queue generated.
> +		 */
> +		index = 0;

Useless.

> +		for (index = 0; index < PPE_QUEUE_HASH_NUM; index++) {
> +			ret = ppe_queue_ucast_offset_hash_set(ppe_dev, port_id,
> +							      index, 0);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

...

CJ



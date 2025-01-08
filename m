Return-Path: <linux-arm-msm+bounces-44445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E39A06554
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 20:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B6D93A6F27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 19:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FD3202C40;
	Wed,  8 Jan 2025 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Eua039c8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFE0200BAA;
	Wed,  8 Jan 2025 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364456; cv=none; b=EuNX3quVVKPmdfPVLG/OSdmkV6ADsp3z5IQpnivCgjYPvtk9hdbqK/aJ2oHG/wgrG9Tk7v7UIj/NnswWpIux76zmnU4Fr8V1emX18xFBHls5uqujIbf2XR5WNMvjWdEhzJIgYHtYwbP8xU8blxQ1KmQ6LbpU9e26qgZzPIh25dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364456; c=relaxed/simple;
	bh=ZN0doFi+4KAbAfVL5ZJZs1dAeYLIuG9AmKss9rM7Mlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hC7dPC7aB1voG3TM/B88jjEExfV3zQBHefhN61hkSwq4E5uWLEak04ObPC0AQ5Xm8TcbfsGxZK8rtJcKwCWgGCBdUq+pRJc30eKg77ShySeRmYF3FmJsz1qxx1b0aet4MeRSkDzAAEmo4Xx74CCHXC+GOgX7yT4QtkWy0YwAUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Eua039c8; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Vbi1taLxSjlXXVbi4tP6sn; Wed, 08 Jan 2025 20:27:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736364446;
	bh=YfWJ/zMaLLh+6wFx2wyv86Rl38wi+GKnzw0/jUQ9fiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Eua039c89HUR8TR4tm7P/3IHuzCk8IXzIwXNBhO1Um5L7ahZnmI0oJgGRmAmok3Gc
	 WL+Ri+JTrO8k1EfrMTqW1Fe1AvlI41amdrRd3KqUt8j8IUrhJD6N0n9zBWSTJxxd5t
	 BtJd0rezSHpJumErGGUj4u2oV9Kjq8srIehb6K77B8C9tH1cUnE6leR2UT30uHwbg/
	 k66C4WZFlXHaUX4gRHlBOKrEoWAMXSQBDVJJsaNY58X4mvG4NluPhcIs5A5/Bbi+37
	 vQC7EOCNmrg70I10ZHrOHJxsLOs2gMAflC+aNAXgBipwKAw/lBavxGDktiY/QKZAim
	 KzFDhIM2j9hXg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 08 Jan 2025 20:27:26 +0100
X-ME-IP: 90.11.132.44
Message-ID: <4abc7542-df10-4bb6-a8dc-68e57789fc8e@wanadoo.fr>
Date: Wed, 8 Jan 2025 20:27:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/14] net: ethernet: qualcomm: Initialize the
 PPE scheduler settings
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
 <20250108-qcom_ipq_ppe-v2-6-7394dbda7199@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-6-7394dbda7199@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/01/2025 à 14:47, Luo Jie a écrit :
> The PPE scheduler settings determine the priority of scheduling the
> packet across the different hardware queues per PPE port.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

...

> +/* Scheduler configuration for dispatching packet on PPE queues, which
> + * is different per SoC.
> + */
> +static struct ppe_scheduler_qm_config ipq9574_ppe_sch_qm_config[] = {
> +	{0x98, 6, 0, 1, 1},
> +	{0x94, 5, 6, 1, 3},

This could certainly be declared as const.
If agreed, some other arrays in this patch in some other patch could 
also be constified.

CJ



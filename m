Return-Path: <linux-arm-msm+bounces-65878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5254B0C217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 13:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D163B4DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 11:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE80B21421D;
	Mon, 21 Jul 2025 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTqlP+OS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178122F50
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095762; cv=none; b=YNa/zS5tI9yFhNcRYOQgC8gt2212fnwCOe1TVY/LhZ/W/Dx4OwCFcwuAbp5uM5kvpdyHEKibnnwdC/OWSuT8TNWhchkGNj/oXord7g3lhG2Tb+/oeMXbecctJeGhkhsiVM2Yb1Go3WF5/zCYM3tp+o5dTD6NfKfcHTFiGsIGtuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095762; c=relaxed/simple;
	bh=o66KmS0dvmnVwV9kRV+A231A5UVb86BycA3XuJzDjm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeEuac1hHTQkLivHLivGwXqYzkveVY3p3U+ICFn01sUCuXS8AoFKGw8Qc++Qfq9hO91sqtCzEg2Cj1V0o930qCQGBnr8DLyHooEAwpnmWKxjnJ+xHkAJBSLSlENSQzVBSlQ+4ySt8Vz0kSDGpQ+5uUWzbNr5Vr0lAdBqRYy7jbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTqlP+OS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2712833f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753095759; x=1753700559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnPN47nMXqCMa/5FKC3NpcQPBDzZo2b6pouXJ5vXunM=;
        b=KTqlP+OSRxVjlnfssrIEeIY12LzBXd6h37WeZB407j/gVsJfryA0UNnU/TaU9bR/sc
         0EU1rEqwCm5iTeCZRDThLdGIZSqGqwrKE1uR5OhjhY/HjJ26pcs1gZtg4al7HiIpxJ+O
         To7HTHFJyA/xYHNXzZEvumpE+bIkgVpGvcwQiZnlP5rWm9VrNWG+sm7wXsD+xE66uBsm
         9ksUqANj1zVNk8trXeAIl6tp+rM8JZ395kapvOyVmy45CEuRAMjCfpGLiQe8Y4POHthp
         nTuq05JW0jmA/MhU2MjC3f9jIMVRbYVjRibcxw8M1gbp35oL2CEoCWZP0HKLJiXo8/LG
         zSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095759; x=1753700559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wnPN47nMXqCMa/5FKC3NpcQPBDzZo2b6pouXJ5vXunM=;
        b=Sowrz6WXXppM0Y+a+KG5LHy1TeJ3mCJ/lmt5Td1S/S1OS+nRjC1tImbG4g8crAIGZb
         fAC3TzVxxFW14lqrF4T/FsRvdB3TMU4j2N5X3b7/VRr5cUyWw/G633OPJMVeB41KqBsy
         mGDJ1m7NOCqiVC23/CqFKrNF/GYYNMdyWL+/O1u8qa15bdOUN8eIeCLI0HYWPClZLo06
         xOXND0jomb7KgV06Lxy31EtgG+H27r2kjvTZq2T+FFRZy/TnFQo0Zcopz412RQcKPxua
         wkrQjazrsEFpGY6P1w6TZNymAtzf4gpuSKodUk3eEN2xqJn7Jwv3kO/Wr9BLjq7pmTJw
         Xt1w==
X-Forwarded-Encrypted: i=1; AJvYcCXPhXbr5/nKwcZOzFdbW6Lpdno7P2pnjyJixYsEDEsfiY56ZJWckKPabbTGxQEGYioZFUdeVIdUqMF8LvPO@vger.kernel.org
X-Gm-Message-State: AOJu0YyHOyw6Yd+G6qo4V97XNT7F7pOMrqJ+lMkHNRK+shTT447HMopa
	QIPAIPheQHPZ/8GuBHtrIgId8cNVcqR+4XGbJVIFVYqfH8jOIo2a9ZLEbqLk9Iz2XLs=
X-Gm-Gg: ASbGnctd5axIrKTnTH4cjmll0YnZbA5AsA50+SZFp+TX4E1BePer5Er25s0O5AO/iDL
	PULxaYnoyCExqJxFXdLDELz1AWIWaAczBQWCBpZcRuQ7H0IvH479NVbMYbgN/oYpeofo0hk9KxW
	7in/dYZasU/SufQ/7M2+gHx6yzX9juGGurz269Si2CWUr1ETdNFqpLeHRoeZwxl/7zkKplbCJNm
	09HlqP84qjBD9eOhurzqyWZxUAbAxomThAARNk+df4yLbHbyL5HcSS+PF6MB0mm6X+VwTFLuq8T
	fbpntU4a3h9NHHuW1FW8rgCGiqvs9jGHzPJFANpGznziWMFO+YBzks6+Jq20hx+MeBHbpmrgUtG
	KO1bOplTbMngKlmAe0WBkJN0tAJM+t9FClnhVsoRTgJgac1281e9YDuCGPjyS+5U=
X-Google-Smtp-Source: AGHT+IFGN8mRXN/kZxyJyfdLFb/YDnz/Qv7FQJ0+kN5BasGH8tzT//CVFFtZf1yRBXL9BZ2mDjJbAw==
X-Received: by 2002:a05:6000:2383:b0:3a3:64b9:773 with SMTP id ffacd0b85a97d-3b613ab2bb8mr12942274f8f.10.1753095759171;
        Mon, 21 Jul 2025 04:02:39 -0700 (PDT)
Received: from [192.168.1.36] (p549d4bd0.dip0.t-ipconnect.de. [84.157.75.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca486edsm10204994f8f.56.2025.07.21.04.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 04:02:38 -0700 (PDT)
Message-ID: <985111fc-3301-4c0a-a13e-ab65e94bdcbb@linaro.org>
Date: Mon, 21 Jul 2025 13:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] net: qrtr: ns: validate msglen before ctrl_pkt
 use
Content-Language: en-US
To: Mihai Moldovan <ionic@ionic.de>, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <cover.1752947108.git.ionic@ionic.de>
 <866f309e9739d770dce7e8c648b562d37db1d8b5.1752947108.git.ionic@ionic.de>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <866f309e9739d770dce7e8c648b562d37db1d8b5.1752947108.git.ionic@ionic.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mihai

On 19/07/2025 20:59, Mihai Moldovan wrote:
> From: Denis Kenzior <denkenz@gmail.com>
> 
> The qrtr_ctrl_pkt structure is currently accessed without checking
> if the received payload is large enough to hold the structure's fields.
> Add a check to ensure the payload length is sufficient.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> Signed-off-by: Mihai Moldovan <ionic@ionic.de>

I think this is missing a Fixes: tag?

Kind regards,

> 
> ---
> 
> v2:
>   - rebase against current master
>   - use correct size of packet structure as per review comment
> ---
>  net/qrtr/ns.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index 3de9350cbf30..2bcfe539dc3e 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -619,6 +619,9 @@ static void qrtr_ns_worker(struct work_struct *work)
>  			break;
>  		}
>  
> +		if ((size_t)msglen < sizeof(*pkt))
> +			break;
> +
>  		pkt = recv_buf;
>  		cmd = le32_to_cpu(pkt->cmd);
>  		if (cmd < ARRAY_SIZE(qrtr_ctrl_pkt_strings) &&

-- 
// Casey (she/her)



Return-Path: <linux-arm-msm+bounces-98703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD52H1fMu2mXogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:13:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6F2C94F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79E763029A92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D94E37FF49;
	Thu, 19 Mar 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8J9927s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D831ED91
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915222; cv=none; b=OO60ORkd06Bi1wEjIX2XQOggUDDuuZemIAZ5VJcN2+U0HsV+BhdV7quEDhHDQYlb+oXVtw6RWWkNOLQXpkJiK1duhIVvj2Aa3diS9454Z/mSpGRamV/Whr/vqkf+pPekXLOjDJluPIV3aAZ30yqLIhwwz69FbTf9RWJoUdgCDJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915222; c=relaxed/simple;
	bh=/y3cER5VeifGYqyB/RNY6HTHRsJi6Bejtyik9z/joek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVewV1+aohUceMfswrKT6scRm2s4LuZczUi9RWFcP8jUNu6pgR0PgY5U8Yim6bfDU8t+roB+yX93MOMERsiPmPlQOsnNtd8ZoOI5ZzMl+9KzpCpveNccinvtG4AjEL9kicwir6AaL2wjt8XkCS7cseYc/UnSdnEfq2aVbMuRFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8J9927s; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so338802f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773915219; x=1774520019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJrZK6LI0nYthLwuqgvtgpXjKiKxtedgYeY+7lEiNmg=;
        b=F8J9927sgTTPgAZAIU8/nR2GBjd1bAOqbxQZQu5FCAyF2Cr2eQlCZMnQXF/V4ppTU6
         NKvYMq51eUYaoQLI8eJti46qf5ciayzEaaeDLmZULwswUwwhlvq2XKHWUoBmmQCBz4aw
         uWhmtL+7XLStjIuNeLbRDv0rgJpWxxpiWDRdGW7VRXB9DJzBr4w38NZqoXjd3Y1Xv9sv
         v4NvUewaGmnvkTkV83Hpqf0EEq6fAgDlAomCZDcMBY1/1qfXnKcjHQHxwZ8jPsQNgY+E
         vzXH6QROK9kUAAQ8mA434IKcwGijfeKbZQvHz+ZwbnnvlZANXw+BpWCMZLlJQZUXKaDr
         uKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915219; x=1774520019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJrZK6LI0nYthLwuqgvtgpXjKiKxtedgYeY+7lEiNmg=;
        b=R86CrunbgqnpvmHSHEkl5qPaOp50YkmelGO1hDMnaaAdGNH1h+Cxh9omLM18YzXcNT
         Kz6VvOWzg99/hqLmxqD5gLk+ou4Pc8/FrMuG+xtr8BVZBOzjLQyI3UZXnxrmlMdOojJP
         /J7X4LhrzeJpjMrM+lxGtq10Ywa1+9sResckw5f+RwCDdTL2HJq3/B/0o3QVkXUlsUhB
         /zLPLHdV5jKukYz0SokabLUt2x9qrhqOaw1y4rocCvM3dFSqm3XXfI5E7ToBc2Pgk9LC
         gIEHBjt/dH7tvsdW7M+CFlLEOKCD6YXsMV52WOIr/N3XCxBb/XNp+Egxv/l7xg64HClr
         AlwA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/Z+YuhdRa+9NmLY3XjijHxuZ+RhV1dFDaueU/FfulqbjyPSIsXFKw0BEYjyoxteost6Uk7Wsyf5jRX1G@vger.kernel.org
X-Gm-Message-State: AOJu0YxdN9BBy/vEH/kVn+GBJ3J9ab5tD3oSYA/GSfo8fN/23s4uP66f
	3N2CeCASIcoQyno/uV4yKZnxk3f4+neZXau1GYC4O8tz3iZvOcZSEwzP2ZqLFfyMhW0=
X-Gm-Gg: ATEYQzx6FHdvvxOYKeUESkViutjwMVVCf7Eg17P8V7d/za+nYMfFy4ir4/LE01FqaM2
	X4OMqd/8M3XcN70EI7nCZJea7Cf80JWkdeTK4yJiHeqtC5dwON4Vj6rWA5Mq7AN/T5U3FIFL6AV
	NtldsIPss9EkLd0OIa8zseZuoGG5CyExtOrZxrrhrl5uBrQIZ3v0ZK1KlhJ7jf49+byEzYESpl5
	EtzQPz59lmqvNLFNkMXe2gUFgDU+pCR+Rh0bi5c80jVcdyjkA06u8jD8xTTHqq5eIV3bkqzVOrW
	Y8g6ThvoMsp3tYRv0StDLYeWeEKpuILl+rHHf8Jb6HPXazI0YK265/REC5y9qGj6m0ruhDoXwb0
	hUysaYQjuoJGYgsc4RX/YT+MQSce6BAYhFbPrdRtAj4llhHn29b6WH3BWrp7Mrka38Yzi1DRlBY
	Z1Mz14Ahu4+lz5ufNOB8yiOl/vknoRoCHmtfJM
X-Received: by 2002:a5d:5d08:0:b0:439:bfaa:ed99 with SMTP id ffacd0b85a97d-43b527cce8emr11267915f8f.44.1773915219010;
        Thu, 19 Mar 2026 03:13:39 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.224.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518922absm16848713f8f.18.2026.03.19.03.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:13:38 -0700 (PDT)
Message-ID: <0d861651-4c98-42b1-a453-3b1de090b8c4@linaro.org>
Date: Thu, 19 Mar 2026 10:13:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE
 lite
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-98703-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 3BC6F2C94F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 09:09, Wenmeng Liu wrote:
> VFE lite hardware does not provide a functional PIX path, but after
> the per sub-device type resource changes the PIX subdev name is still
> assigned unconditionally.
> 
> Only assign the PIX subdev name on non-lite VFE variants to avoid
> exposing a misleading device name.
> 
> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type resources")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916736f1d1664767bdb6a36 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   		v4l2_subdev_init(sd, &vfe_v4l2_ops);
>   		sd->internal_ops = &vfe_v4l2_internal_ops;
>   		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -		if (i == VFE_LINE_PIX)
> +		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
>   			snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s",
>   				 MSM_VFE_NAME, vfe->id, "pix");
>   		else
> 
> ---
> base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
> change-id: 20260319-camss_fix-506ae164a5dc
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Return-Path: <linux-arm-msm+bounces-112876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sFnOJT68K2oNEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:58:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B76778FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:58:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=O0XRd3RE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112876-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112876-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3C9831D3537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFAF3E16A1;
	Fri, 12 Jun 2026 07:54:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459B0175A7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:54:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250843; cv=none; b=W5I8PUbN3/JiEIvytpaoxe9vNPUGTUiMAvyXuReoQsOqu6HRGHNUvzZUd+eJacXpBwzUu/zbrvEE+j6zBlJMne1+nV+JP1yX5/CtOlcq7b6ahMXMFkC+pAuAOV9sbNT5BwsEmHQYJ9gpr0ez/uM+q9L7Z2wEpZmLkfiOb3dtypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250843; c=relaxed/simple;
	bh=QBbXSr/c3akYemQ3kzkXquISdpepjP/Y0O5V7dwTJwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRrMvFdpvSkA0bS9noJmYMe7jRtdBLFuBhcDN/zhIpB4tjn9OzsOh1gBLnxG3tsOAt2wmIyyb8iJ9iGTV7UyR2Y/sLChR5XfyeHt9ojIrZSM4htgvtyAJtYR1qedMeNRGWQWs8tw1aOB04x3E2/E2hGin3v1OM3oR8TYFAvLLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0XRd3RE; arc=none smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso235301fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250838; x=1781855638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=O0XRd3REwQ+hL3+Z/uzTLTyWtn4vfUV/1UwMutQmF1cUJy9JmK3Un/RgNaApnoZ4rm
         0wXUU0jZ7/3WDEXNal+6Zz+M4+ikJuJ2/x+LKi1Hs0xkxwyRn6r6Rj09r662z72E7b1T
         LGqExvLFurJsHeA+VJiT55uy9CrrPDdvKm7i6GdBQsjBdfsT2VS081/SsY/BkCgcTX1F
         O0ztj+ajpNR5HxfD/JLOXnOOd7JHZ/V062uytcfAxL5GVKxYXhHXVFSgVAPxLf6MxmVf
         PJMmStSb6tmoety+DlFDpmG/nYIY3WyKj71Xu/7T/pOHStYDfp2w/6UE0DD78KBquXbl
         lz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250838; x=1781855638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=HbOi4Sc10ytr8rIJP5TR+OlnvYNY8BYd13wWtOFIS075W9DIpnUGioMy8VkA1Ardcg
         I5V5ReTv6N4HdOuyRzJKFH8QMrvru00O0JIB3MVV0KxUhoxGA/xvRwx1gHQeFGtmY3le
         00/E+l16JIjrdI/zUJVpZMOu9eEL0vdh5N5kL448ZYuTZ87N4xjfAb1yd3cPp2mot7Zy
         et/rw8jlpHeDgAT1Wj/tuGHJmFWvvU9u7FEPbf/zIOM8pbwDtds/5Gt641RPCFD2/k29
         23A/wKzh4WwNGodQOPsGp/RQCjN677HyKWh5vAAM+5uNIQF8nh5yeTnMS27lrH/Z67WV
         FIGw==
X-Gm-Message-State: AOJu0YzoKCMJISDl0MQRPadm0Gikv8Cc9oTrNJCrt1/1ORl/QfJmJxta
	UEkc54ot/Ub+kZjLvdV3k/5Gq2lC4yMfNVzk51YNVCR0Ja6xPcSL5wGH1WI6dx60d5Y=
X-Gm-Gg: Acq92OFKJGHqjWWx/h3mDxPT37WZ1hJewt1wOi8kzqGWIjAeA4yqhLbC0kELf7hlcm2
	nlJVRjSKeqZWwT6CpXR0OEV1EbxaiY++eXQZcOaSIZFduhg6nR8Eq+YskZYaTHfVls62lg/kHbO
	8ovkYx+IC7lSGy/Csiqb5M43XFs2ScCA7ykOJ2+NOMkVwzK3M+3MNzVuBnHPVkSyL5gNjwwXvRN
	rZugjf5VKnbUZcbRMqPZzf8wytV1YwovR6hCoYwRZgf9D84jS7YP03ewglVVu1xOnmKVg1bLUxB
	/FP4HmqqAd+HZfIYGCASH3D6o4DReLNm/Y3HhcbxQDRgDnhRgCDUigFs37muxMRd2io5SUDI95q
	XSyUy7Q5HU3a9t4xRUL3lHkf4XAgxQUWNy4SSRaLBfWTYiqcLRBIrVGOqRoMEBJQsiR8N3ZjiDt
	NurxMAbOUHiGyHIxunRXsR2G8isPIfi9Q4K1rP9UXUxd2VWHP3GN6VbZwhy0gH50ha2wle6Cm5V
	11IxQ==
X-Received: by 2002:a05:6512:b91:b0:5aa:6fc5:642c with SMTP id 2adb3069b0e04-5ad2db715f8mr228537e87.3.1781250838480;
        Fri, 12 Jun 2026 00:53:58 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4516sm308890e87.72.2026.06.12.00.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:57 -0700 (PDT)
Message-ID: <ad62d09d-ea06-4b65-937b-6dc49581bebb@linaro.org>
Date: Fri, 12 Jun 2026 10:53:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A5B76778FB

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir


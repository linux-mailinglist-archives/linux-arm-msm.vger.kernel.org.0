Return-Path: <linux-arm-msm+bounces-115253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gOAaAy8NQ2pVOQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 02:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFF6DF607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 02:26:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Y48b1OZl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115253-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115253-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABF4B3018D51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 00:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07151A9F97;
	Tue, 30 Jun 2026 00:26:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A97145FE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779172; cv=none; b=B3guELlRK921aS47PC3lKTRtLeK93n0jbJUvWzG64jkBrAjHrmFKMvUWlUXy5nVUWo9bj5rIvVw6a0UCVqyLTAU9BbcPyh42F317CB7LiKGP9NNFXNBmVIMCAuKG6YMz7EIUy7/2NxPNGqROuiWpxikM8YabPDF4sRkykTueREA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779172; c=relaxed/simple;
	bh=Wk+a9pcvM19EvRBYMhdO3ko2i6Yv5kLFb6ARfExIN+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uw677tjypTIhF7NlvThO0rciEpjrDZ4/qaWIPGoa9f4WO1NdxC3gZu7g/HHgl9MCjqQQai/k5CCH7HIi0kFaPZdmGElfyMTWLw6VvcnDPW+TPqVoFj7kiubQ+uNlIOe2GIawv3OqhegXZx5cXhZs19P/PayNwjrE1maqjc8pQtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y48b1OZl; arc=none smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39b173eed2bso1581801fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782779169; x=1783383969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0oAFgkw9SE+FBo2E3HP2A2RxRZQl+adWkFDLjCm+5U=;
        b=Y48b1OZlLnl6E0B7DrHaghmlcPSJTcJ3PZDrd6QHY1wA++39GvvjJZuvHW45q3LviV
         OwCEVbHVEABo1N7eSwZFyH9dBEb9ao+nBRfzkZ8y8A9RHfFWW+7D2k2BylqceJSlisj5
         QYsZe9zMVDS+uFhTvDB2lfpD/BDDbBdsKw+IVHEFhUVgW6qFTGqAZI/i0EPepfCa/ivk
         kKdPNqKA58c2mnTjGoaWQIPhehIRJXeKLM5YwFRB8ukx0KLg0Ryv+BEhi9wh6rkDPTOg
         vbcM5IHZvG0iD2+nfXkD3QLBwOvPziBfiDI1vXEEsQcN0YT8t7lf0rO++25Ez1B1AQJD
         6Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779169; x=1783383969;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0oAFgkw9SE+FBo2E3HP2A2RxRZQl+adWkFDLjCm+5U=;
        b=eGlTbhE5UThrH34MHFx32/Uafr3HwNAQ8crxPfxGFPFK3t/gviZ68M3nL02wj9JYU9
         1Yu7M7GIprx1NLllQGRL+xbZmy9P5Yv8KXBUkOGK3+2RlvgAXag6DkiMQSbYI0tkyAbo
         o5Sa7gZUtzfnqJVRh4m8zKRRAESYKLqkUDoproHwIrk+7ZLqqLWCrQGfvrscHW9gyc0q
         C/WM7XJcQd9bHNcd+gHnuD1sofsmpodfGDxVFgCU/yNYt0fT4N5odWxp2K0uSQTxaur3
         +INtycRDKVsMrn5eBrnOD/m7a4UXeHblUd+b0pMIwzb55WXahxHBo/W4rqIke7rjeb27
         t8ew==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Xuav9BTeG7l+POqxYBHBiVm5s2Ur8zYEx8sSEK4psXx9AxZHTI3XmpC0HGKM/8ZWMjfqdFT9FGfvIMyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvdlPCYJULuxUXtGtS3T58G/tFYgTXsit5peaFGl4ZIZpDHyK
	aOoMy62SkLmVckT/3CUZZCvba6l3nN0R3pwD1OSIqXFH0pl0VD1k0lgbY89wen5KEK0=
X-Gm-Gg: AfdE7cm5PZCxZO3hzMS1N8riv9nrDooYE1qrewD4LFRL8Lb5T2CjsUxXw6bQQEv0XBE
	cRZJhIF1XV84/S+JZO7+dQrub/Vk5JajDI9+k7wE6AhaHEQTsbiX8qV4Qv4pF5GCU+e+OASsWCe
	YuzroyYzrTjMcjLJVCeX5bb0oPCRxoLflYYJIHmNGPVrG9WuENC40yeIVCuUPwFOeYifn0qwr4P
	ChXoYSi8FVptds34Eu+QRAiUShNQEoZTVuuNYsf69cXtnyRoch8TtWve+cmZM4TqpMkLNGvGAmv
	cFExCrZO1x9oDxHG5liywzjmlwxLBDQ4BBYqbE6TvO7tdQ62tYAYphlqxbYsR8WAy7cThkjtjpg
	5cORAbJyW45KDh3V8I5TtrD1A6YCdQ4bvZntnhAaG1UZqnU9RP4oi2xtKhdDgiRm0yW4+r9/51Z
	KwRNssBRdabfvaL0RlckJKEJQBDDn5fHa9jTII7uQFV53o7hgJ1/mbng8dV9EtieYP/jc=
X-Received: by 2002:a05:651c:906:b0:393:9d8c:73d2 with SMTP id 38308e7fff4ca-39b1e004454mr1641271fa.7.1782779168740;
        Mon, 29 Jun 2026 17:26:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1da1d279sm1997631fa.21.2026.06.29.17.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 17:26:08 -0700 (PDT)
Message-ID: <d079ecfa-cb0c-41d1-a6a5-620d67e365d1@linaro.org>
Date: Tue, 30 Jun 2026 03:26:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: qcom: camss: Add Frank Li as reviewer
To: Frank.Li@oss.nxp.com, bod@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
 laurent.pinchart@ideasonboard.com
Cc: Frank Li <Frank.Li@nxp.com>
References: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115253-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EFFF6DF607

On 6/30/26 00:46, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> During the 2026 Media Summit in Nice, a discussion highlighted the lack of
> cross-reviewing between maintainers and contributors from different
> subsystems. Laurent suggested encouraging collaboration between the NXP
> and Qualcomm media communities through cross-reviewing.
> 

That's a very nice idea! To reciprocate I may find free time to review
changes in NXP media drivers.

> Add Frank Li as a reviewer for the Qualcomm CAMSS driver to foster broader
> review coverage and knowledge sharing across platforms.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir


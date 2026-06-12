Return-Path: <linux-arm-msm+bounces-112901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cJu9NgPOK2p/FQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50001678254
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:14:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=g9DslKmT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B878831298E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0A228030E;
	Fri, 12 Jun 2026 09:11:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769C3A5E9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:11:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255509; cv=none; b=aD9pHgjrGK/P2sg08pxwAXgdY6EkZopBbxacOfssyaWMh3u7UjNlj61z+mbiS2dCypjswIHodB0+rkUjHqHWAfwhH63+5AfliZjlKe1v4u465kbUH5J/p0RtgXYum2mktyzAwopfhmVQ2G56mISU87GOq2oLtybd+dS2hJPpbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255509; c=relaxed/simple;
	bh=M2Y7gN389qMGTyy+yo/flfjZkxz6y/4EIFKM+ZT7fgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVs3IbPV03hCW8Uh2Tz+MvGIeAKybBsY0RzPmBA+czmO3GtO0aIgY6T35fU0+F2e3cpM6Cz86as3DB1B6i0NU4Zs0fHuY7wMTdbA7GHFqZdHJdpzvc1X6iVZgQw+I36Klnbyqmu6AZBjH+u7VAzffjtujSbZ3gU/qSua4CHyvrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9DslKmT; arc=none smtp.client-ip=209.85.167.42
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa6145f230so88366e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781255504; x=1781860304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yBcNvIE7yCQii6ic3E0c4VVkUlJG/VlSUkVp+6fpIo=;
        b=g9DslKmTv023wXatRi729A8rcsz048im4daipJsG72+5OLRWdSgx6KRo3WOqKaUoeZ
         iNdsZkkyZep57ZxH90qb15mulz+z4F/tHwiYsbpEvGCcCW1Nt8vWjFo9o2PEMMUiCo+3
         OSiA8fnsKlfPOEedTAMFE161gio/Z7I7teGdh5/wgX8YEO+CVIxjoqSrLP/TA+Ze4DJ/
         lwUatb5o1yM2p9PBIDMYkzO36LdkQ/GMciCTVpSb4ECsf8psIBA9TYTaWSq+pLmFxgCi
         EUxa/gvNyvKlgvIeXzL8nWLQaomIyfXF9ABwtwwW5vEOnnYGGk54c6nhbjIIrWm2JuvT
         x2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255504; x=1781860304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9yBcNvIE7yCQii6ic3E0c4VVkUlJG/VlSUkVp+6fpIo=;
        b=lvbkekae4zdyINR/+mjBJTvMQFqLoKCmSS9SSGkPtDD0P5iUWULnHq5K7bpR/vjXZA
         hfepGLCFgOKTeMJeE6GRCETP26wt6GeM9Z+FAbq5iD2wvfo9Xpp5Iu3MCva0RfczVZ6A
         liYC4z3GlfS7duzrm0xZYj23YmDRM/g5nODAGMi5I3zxXz6DOfo/g+ImZ0+zIDVw2Q//
         tj0pD7Wppf8tFZvfJ0eR2tl+6z56c8T18QEIHfjPJpJpzpg6hV2F8I/57wklW0yQDHLR
         o/kPTlCwmAC5q2OwqoJw6RLmDf/HT5wYPnQrfVDPlYqrdaT55+IYMFR4b3L48NhknAa3
         Va9w==
X-Forwarded-Encrypted: i=1; AFNElJ/oj8xBQO1xBC5LTPmANDFbvtaktSsXbYySgq/+1oQabAmtSsmygeKJG06peI4CbODtAbT5MtCDQ4DHQQsK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmx/Vt6rg+n9eAH2IntUiG4CzxfWvQc09q8ilH1GUVdY0cZa29
	Hp9y8BIVesXyxBZMghWtE3kLsjQpuQIpo/FCO31zTVeJMxYRrQZR/kty14ASi2FxoEmJci9uAru
	yjk4NNWQ=
X-Gm-Gg: Acq92OEwT3IdbyWdc76DPozvHl7Z16l1epujNJD0VeH2MquVTfDQYvC92vhkBLJHoid
	XhSSfjkXMZI9MXGBhI92Ng1bmOxP1HTTk8+27kXX2oQY/52wmNLABbpEo4elt8KARSlAnyjp63k
	JAf0NdPcJa+2Eha59wsT0jUVrx4mwITZN7NhLWZX0H7ofomD8abjoP+/pBy9wGC2jrQ2y6DSuMN
	GnyBnbk74viagLqLsEu6w4rQcLW7N013yc9vRG/WBrjR047zm8k6IYld92Y2+TydaKLw4tZ+GDf
	2szZ+XZZs+Nc0jejI1ol0e8axADkMnp7ZnSpCfAEKVM6qraCwqpcY/m9wlo/tq0aYR28Y1BAMmW
	sXzJy+wEL7RyKs5G6i0V9rb+uaVgw+XDqyC8FtZihRNb93zxxUV45FeWaSd+HSHKE23WEtuh6tB
	z18EpA1rsSmJAEXeUrPNY43kpbhRi0nFCFnrr6zayrWwR+J4DOK0XQCxlixkg31y38LRPf6tG/t
	L4jUw==
X-Received: by 2002:a05:6512:2253:b0:5aa:62df:cd0a with SMTP id 2adb3069b0e04-5ad2db71582mr315660e87.4.1781255503542;
        Fri, 12 Jun 2026 02:11:43 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16fee3sm375352e87.31.2026.06.12.02.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:11:42 -0700 (PDT)
Message-ID: <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
Date: Fri, 12 Jun 2026 12:11:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ram Boukobza <ram@imd-tec.com>, Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
 <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112901-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50001678254

On 6/12/26 11:47, William Bright wrote:
> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>> what may be the rootcause, I believe the lower bus frequency should be fine,
>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>
>> If you find a chance to copy the SDHC driver (and its small dependencies)
>> from Android and test it on your board, and if it also fails, then it might
>> be well concluded that something is wrong with hardware, still it won't be
>> quite convincing that the SoC SDHC is to blame here.
>>
>> Hope it helps.
>>
> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
> kernel [1].

If Qualcomm supports their downstream Android kernel running on your
board, it should be worth to contact them.

> It does sound like a potential SI issue so I will try the following:
>    - Sweeping the drive-strength values for the sdhc_4 lines to see if I
>      can find a set of values that work
>    - Scoping the lines to check SI when performing dll-tuning, our board
>      is very dense so this is challenging.
> I am guessing this patch is only acceptable to be upstreamed once we get
> to the bottom of why dll-tuning is failing?

Apparently if Qualcomm confirms that SM8550 SDHC4 actually has this
discovered and unveiled defect, then this change will be accepted for
all SM8550 platform like you propose it to be done.

According to my experince SM8550 SDHC2 operates properly in UHS-I
SDR50/SDR104 speed modes, this can be verified on the reference boards
like HDK or QRD, and for me it sounds oddly that there is such a problem
with SDHC4.

If the proposed change as is does not enter upstream for SM8550 SoC, you
may keep it as a necessary change in your particular board .dts file.

> [1] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel/files
> 

-- 
Best wishes,
Vladimir


Return-Path: <linux-arm-msm+bounces-115423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z2QRJIK6Q2rOfwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:45:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2035D6E45DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:45:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=eX41QCLi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115423-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115423-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E6663094035
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E21240F8C6;
	Tue, 30 Jun 2026 12:41:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E340F8C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:41:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823303; cv=none; b=A/NT4FL/Z7gttkVVqoNDYdxeJzvEKKhDl7kl9xH2Fw3NcDzdaudRDJSB8s1EYq9gnxNU4t40jO3upKxXadltxHlK4WLAXn9BCS8h4n34fkZxIoH/8henGqVE9aeVDwULBgjq3WpPnUJoDQ2UFBCD9dN6qg99f6ZN9Ffz7pUOiVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823303; c=relaxed/simple;
	bh=/qQIhp6ivqT+2HKiI9GiNz6XwQD5DVyFYiJSHPh2nJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvhmpSB7VBm1ezexzkgHC1NY5vuJqQeH4MJ6ITFCFZ3V9iCAfvfcnZ1bIIyIzrgb7M9nLVUDyrPvyALe9HaPpCjjv2LeLGOTZri9TnrnTZTC9YBU6NH4BbajEPJ/Pim7v1zZTvyELL4/hcO/VbxQH4VV7YzI1zcQNtl15Pw8ED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eX41QCLi; arc=none smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso248049e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782823298; x=1783428098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uCmcPvFsUj9ce5Hb9FUW8V5ardKixIrXr25AUWrKNw0=;
        b=eX41QCLi2zRk9kHbgo52eDnI5I3W4vs++xHKRG5rGY3hXct7AQ4j643DuypenEGBKp
         KROqNZM+93NLWASk165IKvE1Nw2nVRLjBd6mzx4I8RlVVJFIdCVq8ShxRYlRWb7b44SC
         x48HJtWcDMWkaQu8HeNsZG5JLCbmnAC5VNTPfXVc/Z1bTdJsAmN1WR7X7EzwWCFckIBo
         AORv5d5ET3O01z8YcDFaydwJx2iv3HmVJ7enPMEOGpffv+GLWFvM6arul1zRkRp+ZPlS
         hJl410IjUCYca7ndFwMOZLAHpu9BgpFxw/Unh8aZi7w37E/5Qix2e02DwtgxTp9nu3A3
         haxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823298; x=1783428098;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCmcPvFsUj9ce5Hb9FUW8V5ardKixIrXr25AUWrKNw0=;
        b=VpwpZ80KthPHtvQpGqOu+dFw+hxYHhpoKFXW7DV7UdIY/lLu6zwlHD4kPJQpATO9Ti
         BPYwlHnAga2pb6TYm2/s6k0gyVb1L+qnOXjvnvpY7JSsirmEpCBpEg10QbjbQL+EsCV/
         IDfMSrJxv7ADzy5hoQp4bm/g0meUB5BCVg1wO/x8wm1BYHXHEffYyOXTTc/pBvfWUEBh
         6qDnrDDuXPN1kk2co4NuLyCnqxyVk7zYQ7IXDiPJNZl7E4J1G21noD51ZOhYG0R0VQFu
         I1jvKq16ezyalSCooohiKprvCSMcYv3mPXzGch+kILt6y6VbZPR/rlHhRHcMgUbEYak7
         9xtg==
X-Forwarded-Encrypted: i=1; AHgh+RoS6O19jABD6JckMRlaCwNJe94+HIMqO4Ty3M9wCh+KKfLfmqILcm3TX1wP2onxyGsUd9NAyoz/0aSnczx/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx660Le3x7jGbq6H2YspAVbxBdek4E94FzK1/5dW2kuDKG2u0Xy
	Zc5guGmtnSc16hWyNAvdb9YvObS2LleG0Tm7uC3KPQDJIqcMcTavsbh8sIDifaQpmYQg/3akV7d
	m27peFA8=
X-Gm-Gg: AfdE7clcgCRaOSwtpk14uEEo1ovDTmZugTrrxbQDMpNPkGLhIJ0uuhd5jJY1OCQPOQ2
	DhCxtI4Vz0jePj1eeEDlfN5AOXdqyVc8J0DwmlX+EafAd477Z9z9uXeHioVAe5prrQZfZlqoC9s
	AA1BYcg1zPVHqIl9tJn4U5FB8edUWmbQdzk25AQpVwvXOeMD1jOjuhDMMKfAW9pWRH+fC85+qhN
	JNh08smciAqZYRCwbtr8Nsl1HewyJE5RdIH3vs0iRH5jmf2bjiKkPk11MRdwysohd323tzTul18
	O7DtVP7StQzHr1DZTBGO5bq6JBdEXbuKUbjGpcOkK1EHGJp93N55fEyOzhD/eQj20JZQ/vE12SV
	gmhXvwDGg5Kzdzp8/fBhCuir1lWd79GuwSH0EqRMQDIt3D59wDcMLkXyhgYflCRdymLawuWFyd5
	fGwHonUlZAHrLCsBDg5P5QlLeEF4P+pnQt2LZ6jF83zwqy8igZONJqxx1Tuni+R8crJps=
X-Received: by 2002:a05:6512:1253:b0:5ae:b8bf:51c0 with SMTP id 2adb3069b0e04-5aebdbb2232mr564127e87.5.1782823297830;
        Tue, 30 Jun 2026 05:41:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe33ce5asm513831e87.21.2026.06.30.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:41:36 -0700 (PDT)
Message-ID: <fd78f8e8-07c6-490b-a9bd-d581a28c1f04@linaro.org>
Date: Tue, 30 Jun 2026 15:41:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 William Bright <william.bright@imd-tec.com>
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
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
 <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115423-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2035D6E45DE

On 6/30/26 14:09, Konrad Dybcio wrote:
> On 6/12/26 11:11 AM, Vladimir Zapolskiy wrote:
>> On 6/12/26 11:47, William Bright wrote:
>>> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>>>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>>>> what may be the rootcause, I believe the lower bus frequency should be fine,
>>>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>>>
>>>> If you find a chance to copy the SDHC driver (and its small dependencies)
>>>> from Android and test it on your board, and if it also fails, then it might
>>>> be well concluded that something is wrong with hardware, still it won't be
>>>> quite convincing that the SoC SDHC is to blame here.
>>>>
>>>> Hope it helps.
>>>>
>>> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
>>> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
>>> kernel [1].
> 
> I have a "feature table" and it says SM8550->SDC4->DLL [Y/N] -> No
> 
> no wonder it fails the tuning if it's not present (or that's at least
> my interpretation of this doc..)

So, is it a hardware problem of the SDHC4 controller, which reports "SDR50 mode
requires tuning" bit in CAPS1 (see SDHCI_USE_SDR50_TUNING from sdhci.h)?

https://lore.kernel.org/linux-arm-msm/aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8/

> There's some notes about the frequency being limited to 75 MHz in
> SDR50 and to 37.5 in DDR50.
> 
> The supported modes are DS, HS, SDR12, SDR25, SDR50 and DDR50 (with
> the caveat above).
> 

-- 
Best wishes,
Vladimir


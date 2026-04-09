Return-Path: <linux-arm-msm+bounces-102516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIW6NMrP12mrTAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:11:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6F3CD749
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 18:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66026300FF80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7509E32D0DE;
	Thu,  9 Apr 2026 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UK2YBOnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00023242A4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750397; cv=none; b=hvHUKDahKxO4lMg8ZejwMZKPtrMo4OlPQHX1mWcfe1iWnsQ4prIHjJ4mxOBr2aRLhHTuFRX2HNkTCS4Hzcgxrioeb2pZv+gDKaWr/53iG9qyrouMmlyKzGKM1h0xC/hHlJ7asDrbMhzYB7gYi6ejOdeHHoUeSthvw6z3Dto8O0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750397; c=relaxed/simple;
	bh=6fOgEdrTDXG4J9FoTfDRCR08WcOMcszG3utCaL0Tn8M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZAmjpg9B7qbb0wwpnpzQpj+lZE0AgHecxVkM/bifr6v87mRumBBoI7WB7tO952drGdevWWgINSvdglebDSOVMV5GNwEiC6a5fQCLGztqvyqKi4k59AqQHlAqacB6Bb2dp5c2RPG6xt4ySEEEMumYlKOZOG4283cXiBzz+SmlbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UK2YBOnA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38cd60ad1d2so1313191fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750394; x=1776355194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U04qQNDkQW4gdeWnoAOVfit+UeFcepKVp4vhcTXFJY=;
        b=UK2YBOnAyVtFz7A599c6SUwpDs2OBI3KADzi7sOspo6/pVZjl58SKmS4AGNsagUr2Z
         onMWwIOVAGk6Gk0mOjU7BgpN1NrQIEpjtUFO201pV8L5mmWjMW4dEi4T1SqkhiJUhSUR
         jqPRgHQHLCLxxfdHGzs8k0YrPqeWbA0wd5dzWk71ZpCFF+zvty4pt1GKZ3ExSqzJh8i+
         AmFUoil6B3haZXcSith7/JDkY4JXKx9Zsi5mbdOGQ1w3KroifGzhIrKItJtwmXQ+37O5
         at0OVWJLDsj6Kdr4MHN74jw+DYpHSfzR/OgjEzBKg0zzbP0MSAp7E1dCZf2iNq9jGmSO
         E0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750394; x=1776355194;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2U04qQNDkQW4gdeWnoAOVfit+UeFcepKVp4vhcTXFJY=;
        b=K38uzQQ0e+6qb49szO02TP43Qr3aKMq4r/JB3/K7yHryXhAuRvMWsT7WHFpOcqgFCu
         1A0d0m5nxAV/nCjH/j+LVtvmqSy+KrS16HtzLtfwvUxGNy2dkkwSkbHmOvokR/yUUSup
         LfI6wIjqTzn4H7TtALqL4tEpynda+FrUEPmRJzynT7IaXcR9vVtwQZQbX/t++Sgiuod1
         iS31Ksffhc3+/5LXijIWcxJpeyWmNQ+NNoRD+PRDZ+7RWAO+zNwJ7lndfShKV1A1OTFW
         0IpjtRXfDuNxy0AnlqyXCAI/y5yC/Tr5E2hX+qD1j2VCLenrqyBHEh7HBWbog6kkZcsi
         CzXA==
X-Forwarded-Encrypted: i=1; AJvYcCU4mzNvvLo3if7NHIqqgot17r+rs98IZowvWufYyK+LspcmUOHNi+0ew2JRJw+u6a5r4NqkiY1u33Ppyi/4@vger.kernel.org
X-Gm-Message-State: AOJu0YzgemIEuXbSxxqwbcdNt5Y1sXMb6zeZ0K36lN/uxVXgEUvWueo1
	TFNL2WmPvGFmBKKr7bw74F3I65RALAM0n/Fl80RfAzTwWBMAgJJYQ5fbp9yoh0/Hqe3JT3z2kxh
	idHr8
X-Gm-Gg: AeBDieubPVwA5TbRiZV09vpyiCmM959ZyPupJ7dQyQt80rtxspeo12oLJAaeoLA2goP
	RWI4R4dZcmrxIvWPQmEy10o/5RlcakJwa/uzrp5+IQ0A9tGFEJt6sW/qJoBQzO3K4udVS4dLlPq
	tWiVOEVmjAE66JJOfQ8v3ONsKwJYjCR4oQKg4saiRi5SNlShKTUfcdnjRbRdnWcrC33OAVUuRMJ
	E0Ai7FmNiDIT6jzLfROtWBhUwTsShYdO5qQiAtd+OhnXfOJAulArrCtYPalLOkAjcMrEfd9CocN
	UjoCrtUPxBDaslCcJbwtWSx4/qXukr75q2p4NWRIzXgnV2/Pj0LhpS27kmoBl/MBlCK3Ap137+j
	WIkT8R+aZJx4N89RAFk2tk01wQk2KMBm19w3xnEISxTMsKNM5ZdoexecU+55snK8mGOOFAoUWOt
	2KZt0+gogHOZkL54s+AGapiSzDbNdJHTPi6dWVrxXJi2GWLy5LLcbC4QcGLk7LbAyqzw4aZdr/v
	EPPJZDd9zmKfWL3
X-Received: by 2002:a05:6512:31c7:b0:5a1:4712:376a with SMTP id 2adb3069b0e04-5a3e25f2c8dmr1235674e87.8.1775750393869;
        Thu, 09 Apr 2026 08:59:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae59bsm240151fa.38.2026.04.09.08.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:59:53 -0700 (PDT)
Message-ID: <9ed4015f-192d-4cc4-886d-27e633bbd97a@linaro.org>
Date: Thu, 9 Apr 2026 18:59:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102516-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52D6F3CD749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 17:01, Vladimir Zapolskiy wrote:
> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
> domain provider with a special Titan GDSC as a top power domain in
> the hierarchy and as a clock controller, where the clock provider
> function of the IP strictly depends on top Titan GDSC being enabled,
> thus it makes the CAMCC clock controller to belong to Titan power domain.
> 
> Today the formal hardware dependency between CAMCC power domain and clock
> controller is managed by runtime PM in every CAMCC consumer device driver
> like CAMSS and CCI, however this is terribly scalable to any future
> CAMSS IP device drivers, and unfortunately it is not scalable at all
> camera sensor drivers, which are also CAMCC clock controller consumers.
> 
> The change adds an option to describe CAMCC power domain to CAMCC clock
> controller dependency properly, therefore runtime PM management can
> be simplified on the CAMCC client's side.
> 
> The series touches only platforms with CAMCC drivers, which marked as ones
> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
> change, because camera clocks and GDSC power domain are not separated from
> other media clocks and GDSCs.

I'd appreciate to get more input on this series from Qualcomm developers.

TLDR:
1) sensors are CAMCC consumers, and sensors are not under CAMCC power domains,
2) exactly zero negative side effects are expected from linking CAMCC clock
controller and CAMCC top GDSC power domain.

> 
> Vladimir Zapolskiy (2):
>    clk: qcom: common: Add option to link clock controller to power domain
>    clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
> 
>   drivers/clk/qcom/camcc-milos.c    |  1 +
>   drivers/clk/qcom/camcc-sm8450.c   |  1 +
>   drivers/clk/qcom/camcc-sm8550.c   |  1 +
>   drivers/clk/qcom/camcc-sm8650.c   |  1 +
>   drivers/clk/qcom/camcc-sm8750.c   |  1 +
>   drivers/clk/qcom/camcc-x1e80100.c |  1 +
>   drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>   drivers/clk/qcom/common.h         |  1 +
>   8 files changed, 23 insertions(+)
> 

-- 
Best wishes,
Vladimir


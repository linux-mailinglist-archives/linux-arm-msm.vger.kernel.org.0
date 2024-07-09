Return-Path: <linux-arm-msm+bounces-25580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED0792B40D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 11:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD431C20318
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 09:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9421155359;
	Tue,  9 Jul 2024 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEesyLqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19102154433
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517998; cv=none; b=Sfq+DUJIF+1d6CX2EpKC3ob96qw9v5iDvijV9eWLHnf7Wzxt+T4uBiUFJwIJKszh+kLhnrHGjng+EeBTNrVZ59OrSDuatB0/TyYE7+PsRVzYDF82GMKgAtQc5I7VOkyJU92dPr3MfqGcbvcXQd7kIPboagMNkXh+f9wye36lmTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517998; c=relaxed/simple;
	bh=XFBX22GMqSvQ4yF/p0eTw1vNADK5MKQQ3e4vO66O5Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGnVtF+d1i5IacdvzyoRNnO68yHVDrlVZJwMnCnP9IM9/tY6CNvotC5FJkZ33hG7R9p23BKlj2SKUtHbNETDkAc8B1q6+8oYHQCfA5N3sV2z/wmCKYpGS1hqNVeU+WFbZB9vbWdOp1MrQ5OBF4LgoBLryx89l8agPSySEhR84tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEesyLqX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77abe5c709so602568466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720517995; x=1721122795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jKU8pw+Qs8+GTKI4pzMf/E6ufM6LjVXqPkb5yoMPBvQ=;
        b=HEesyLqX2nMXEgr+IbX0mxkAEsuX8kZ9wcZfTi2MpdC+ukOi6784Qr32HB19mhC7GC
         w1JqhKvDzbJvTuZRNLM1ftBu+5GD7HzSRsfn0GizPzglWG0dtj+ik9QWXUuK7irktRU4
         nn4KOXiv/FNmMAUGK/8FqQAPRHkeJ1YTZ3gmIQnXXUijBK1XkXtehypLv1QxP8u5Va2u
         ekThlPiN+lSyrUO1y6NvP0oTrxSYScG/hA3xkj2aHsPpbHo2+dUnPABja770BhjtS4J9
         u0dwXMfP6v/yuYiE/00lQM/l1EVxH18lzol2bqJN9JcY80H2wbLn0IBvLY0BbHDTd9EV
         LO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720517995; x=1721122795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKU8pw+Qs8+GTKI4pzMf/E6ufM6LjVXqPkb5yoMPBvQ=;
        b=XZqLUgUs1rJcn98N6pBAif+1WNX/gatv9TReIj16Nf8aIT8HtUJTjxyjNDaKndMQP1
         f+X+cp5bDLDj7IfuJ8Pp+NLTOowrpHDrYcHr1NKxE3yPeWh/t78rXw+iYcErwQC2olV6
         R76k3L+1AOm28cd7za4mQ/5maG0rulDhi3IRXR1RmHU63fCNeb+WDz7yz4KQvDOOKpAm
         gw3PgJy4yXcq5TE0MRHylIykANL3JM9UD/5Ru0iaOehT9Pz7G8ofKURvMqeZW083lHmU
         b6QjikqefkSs8LexPax5O6AT2+VuR0e08DGrN6s5YkEPuk8YAeKgFl/mvuk7/OeJ4CZg
         zMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCURXfAlhCos9PIE72FJjoOJIXNunTY8FlAUgZgXtqpeUG+O0sAG3o31N0deuqdvuHtEblRNp9yps35dywU37ROxGZDrMBynK/l65n/VFg==
X-Gm-Message-State: AOJu0YxcSTHa4kkCuFkViXODYlWdRmUJjtM39PPFPSZH08z5UFLz+ifZ
	oBHUwFAruNJaSkTbsHedThVmdiP8aDpLODN/WU9txhwt928sHe/7iapeJHSfURM=
X-Google-Smtp-Source: AGHT+IE5dVAZblRZuS88vFnQlzf6kGWVkD8iWoKdgrwFaoHYnTZaP3nVG+frQanmEfzetUmHS5LdDw==
X-Received: by 2002:a17:906:c141:b0:a77:c26c:a56f with SMTP id a640c23a62f3a-a780b68832fmr158070666b.3.1720517995060;
        Tue, 09 Jul 2024 02:39:55 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7fef43sm62342366b.124.2024.07.09.02.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:39:54 -0700 (PDT)
Message-ID: <408d7048-7ebb-4b32-bdfc-5e26a5c449e0@linaro.org>
Date: Tue, 9 Jul 2024 11:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
To: Johan Hovold <johan@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
 jassisinghbrar@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com,
 quic_psodagud@quicinc.com, abel.vesa@linaro.org
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
 <ZoQjAWse2YxwyRJv@hovoldconsulting.com>
 <f53bc00f-8217-1dc8-5203-1a83c24d353d@quicinc.com>
 <Zoz_UmPBWKHA37Kq@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <Zoz_UmPBWKHA37Kq@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.07.2024 11:13 AM, Johan Hovold wrote:
> Hi Sibi,
> 
> On Wed, Jul 03, 2024 at 01:29:11AM +0530, Sibi Sankar wrote:
>> On 7/2/24 21:25, Johan Hovold wrote:
>>> On Wed, Jun 12, 2024 at 06:10:56PM +0530, Sibi Sankar wrote:
>>>> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
> 
>>> This series gives a nice performance boost on the x1e80100 CRD, but I'm
>>> seeing a bunch of warnings and errors that need to be addressed:
>>>
>>> [    9.533053] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
>>> [    9.549458] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    9.563925] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    9.572835] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
>>> [    9.609471] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    9.633341] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    9.650000] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
>>
>> X1E uses fast channels only for message-id: 7 (level set) and regular
>> channels for all the other messages. The spec doesn't mandate fast
>> channels for any of the supported message ids for the perf protocol.
>> So nothing to fix here.
> 
> I didn't look at this in any detail, but if the firmware is spec
> compliant you should not be spamming the logs with warnings. Not sure
> how best to address that, but you could, for example, add a quirk for
> qcom fw or at a minimum demote this mess to info level.
> 
> Also the failure to add oops_by_lvl appears to be a separate issue (e.g.
> related to the duplicate entries).
> 
>>> [    9.727098] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
>>> [    9.737157] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
>>> [    9.875039] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
>>> [    9.888428] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
>>
>> The duplicate entries reported by the perf protocol come directly from
>> the speed bins. I was told the duplicate entry with volt 0 is meant to
>> indicate a lower power way of achieving the said frequency at a lower
>> core count. We have no way of using it in the kernel and it gets safely
>> discarded. So again nothing to fix in the kernel.
> 
> Again, you should not be spamming the logs with warnings for things are
> benign (e.g. as it may prevent people from noticing real issues).
> 
> Also these duplicate entries do not seem to get safely discarded as they
> result in a bunch of operations failing loudly at boot (e.g. the
> oops_by_lvl warning above) and similarly at resume as I recently
> noticed:
> 
> [   42.690569] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
> [   42.704360] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [   42.737865] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [   42.752943] debugfs: File 'cpu5' in directory 'opp' already present!
> [   42.759956] debugfs: File 'cpu6' in directory 'opp' already present!
> [   42.766641] debugfs: File 'cpu7' in directory 'opp' already present!
> ...
> [   42.855520] CPU8: Booted secondary processor 0x0000020000 [0x511f0011]
> [   42.865188] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [   42.898494] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [   42.913559] debugfs: File 'cpu9' in directory 'opp' already present!
> [   42.920265] debugfs: File 'cpu10' in directory 'opp' already present!
> [   42.927029] debugfs: File 'cpu11' in directory 'opp' already present!
> 
> Perhaps you can find some way to filter out the unused, duplicate
> entries for qualcomm fw so that all of these issues go away.

I would say that the firmware should probably change the PSTATEs'
"enabled" state based on availability and report that to the OS..
Or the OS should know the conditions (enabled core count as you mentioned)
and decide whether it makes sense to shut down these cores, based on
workloads.. The latter sounds more sane..

The SCMI perf protocol already exposes power metrics (through opp->power)
for EAS purposes, so perhaps additional field could be added (cpu mask /
cpu count, depending on whether the specific cores being off is meaningful)
so that the OS can make more educated choices here.. otherwise this almost
looks like a hack that made it into the firmware because there was no
time left or something..

You mentioned that "We have no way of using it in the kernel", but is that
actually true? Can you not set that OPP if the conditions are met?

Konrad


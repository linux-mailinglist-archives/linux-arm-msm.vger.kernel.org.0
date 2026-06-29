Return-Path: <linux-arm-msm+bounces-114967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7nUlLThEQmqz3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:08:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA876D8B55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:08:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ePPmbi0t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ArLwLhKd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D16B93021CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A243C3C19;
	Mon, 29 Jun 2026 10:07:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8343A3932E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727633; cv=none; b=WpquT5pPrLOHVHKe39Ek1SRkqR8x1lRWt2RJBmWIfiUvRRP6Z5hKqhwrTcGxhlzsaqX/Im3qLFpjIs3eD2P7aGupIVCwVVpBn+qWm7ccc4r7p17xkwDVadyjbE21vSmABBk/jGvefEw9J+v9AFfU2I93iwERlTHZ89zdPQuX/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727633; c=relaxed/simple;
	bh=peQvglYaqtmwXb0WTupgH8dzST5Lwyiqg0bLF9xcLxk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oSBMcLU6b2buVasY6JmsaNGhFnIjI5meNf0luLAczHUJGEByRVoK9YQ/k+cqsFn6exa06dJ74Ms6lDVyUZpOSWThShQDtmLApmXkIWojhMNV74NimNOFcwOi60wbq7nYHXQtobYR2j0IJUTEVP7737ufIXFW6w8hUZB7WQwZvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePPmbi0t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArLwLhKd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91NmZ2400770
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxKtmKH4Ba7gwjMK4BRBaCCo3zwVIw79x05QJLK2AtE=; b=ePPmbi0tlr6g2RSs
	1zk4O8o6faSpmX2WF+YtTPzQvDUQ1vOX1B95c1vI5BFfzZGOJ2QSpJ6ywHXwOYjW
	zvKyVJOXJD8/6BC+Jr0fbxMUel3+PRnUth/jQwvxu6IIZ8n+ITaLl51j/aaTku9B
	S6lJKF+o7cbZElavaVCRpsZD/UCDbHOpOLBrvVBIoW/M4QKUFUayvZ+3iySJN8/J
	mv7yRIZTffoG6lofVR5HXykm7mUTI0mm89X6IcfBumme4yscUsR8R4A4ugyIXfdj
	iVXWhdxNJVSW6Bo5aGFnTdUKnI6KcV5mcqbM3UZQpdxgZ64seQBrzqdzsv/nVgXi
	GnaHog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88944-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:07:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9694fa5facaso281069241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727631; x=1783332431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nxKtmKH4Ba7gwjMK4BRBaCCo3zwVIw79x05QJLK2AtE=;
        b=ArLwLhKdBsEfNMWC0OPc9ldfpB2BcDF9BpnaGvX/7Tlychxnh25jy7QF/odcV68KMO
         AzRzsTEb76g1vXGWIhygbo462q0nCIRiO5+jExAeF6haKuzgjvzsFOkwuNiGF7pWDr12
         Gsi9xYl45zUdaFMGQovSpwa0iWRUmmLzxxwbGLF1ya90DdIrFMn8t/6/4NmuCD7rea3A
         SlR1/assfKMy2iTDvw+SFDzzVOpyd6jMgnWTxLWAm8xA/951F1ruKFs2NzTY5brnTke5
         Y6lCCS4v+NfuL94ZfFfUKiQS21jAjkr/9ru2JrhesnTlzaDzCG+f+F1ei6i/vb3ojSn/
         V97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727631; x=1783332431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxKtmKH4Ba7gwjMK4BRBaCCo3zwVIw79x05QJLK2AtE=;
        b=fxMwc6GZHI1vH3BYKPAZecc64byTm5UlYViepEOYS43z1b1h7GCedYj26sIlrnJ7HF
         0VnREDirychw8UspWiTQv+NGtEhNGrWcAZVbyjmJQZFkN+ILROVqyKkqQdX/0HNJ0lkf
         SUOFmY4TkSdAWpwIwm6tMD1kGzgQQtVYBBQR1IpkWW1bVmD/xN09RcOuykg6iBRf6zS6
         DrX/vJN8FD8/Pnz4sO4DwQ6c1UhzvdyIn9xLcV1ggCe+InI91A4nk4CzDmuaP30nLSyo
         k12eWc+uQUp6OJ6kEqwmbJB0Mfh9/MJSsop1BqBWXQNgHaDg2x2SuGUyCT3R3cK6ZjPV
         iA2A==
X-Forwarded-Encrypted: i=1; AHgh+RqyC/OYWo2AbH3CFgWYtGHXhNX27qGVJaXyn+ZAAwhRjYb1f46OiX7VMhlsVrTwJv+uhNELroaXl8+GUADB@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyKi7y11qC4KBpyAY3ITPiFR0hKRcqdrPvTp61yLaVP0BQnpG
	vFQwHF7JHxfHaZOVYzX3PPcJa5lunVQecpyOaeL5e1Wd6zLBkKfguza7il5hp/IQBueC6GO6iC2
	clnAiB7AsdqoofNaOdJp5hcIzfDC1vT7EvaByjcjSU7IiBlBE/aX5+1PzUO5xQHTln54rov78eD
	OC
X-Gm-Gg: AfdE7cliJ0DmK+a75LUyiyu3if4xPQOplQc/Df3t5norWPNLZjDYZ/dg9l650Lc+0rN
	P/p5zdzJ7ivz9sXnpfiKWAPFJCMy1s0SitUlfl4gTk5K6rEf1gblz/4rcsPrP315m2ic6Kgs/Fm
	PaRB7Zs+UoCuB1mDYVon/fr0i414LQJM3Gl1DUbj6KmWXM+Wze8OND+4hZZ3G6iiA65X8qgG+r6
	6trhANEaFQyIebF9br+QvBygze9FWR0ksg97RJA7qKDjFaoosQmo8QdRdB1mcR2kkTiNgtGOOmK
	w2+lVdM8mJPRA9S73lxmkWnwkA2bb8359MBwdHoBhFqG5bmfgfICAHd/iEnw1F5KeUxdKdCAmk+
	K29FDlA0gZrRW8ZTED2DT7myVw+Jd2g==
X-Received: by 2002:a05:6122:8112:b0:5bd:b2d2:a1b9 with SMTP id 71dfb90a1353d-5bdb2d2a7a0mr429597e0c.5.1782727630589;
        Mon, 29 Jun 2026 03:07:10 -0700 (PDT)
X-Received: by 2002:a05:6122:8112:b0:5bd:b2d2:a1b9 with SMTP id 71dfb90a1353d-5bdb2d2a7a0mr429557e0c.5.1782727629920;
        Mon, 29 Jun 2026 03:07:09 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac461csm6694710a12.6.2026.06.29.03.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:07:09 -0700 (PDT)
Message-ID: <9e47c991-0d7c-413f-86a9-33c5322fa85d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:07:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <akHTOUvHXooq7ykT@baldur>
Content-Language: en-US, nl
In-Reply-To: <akHTOUvHXooq7ykT@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hAGQmzNkGlolhvOFkRGUUEpAkTTbEBv0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX+Oiygx6yyfeY
 P922ygd1nKwJeTX8RkmqB8QQ5mgSF0nR0L5kExc5VNDkbo7Wf6mmLsLeZZLDqMZ4n1cxB6JftbF
 NZ7b8baib9BWgWGSY1Usm1VGCVJlLgU=
X-Proofpoint-ORIG-GUID: hAGQmzNkGlolhvOFkRGUUEpAkTTbEBv0
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a4243cf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=TY5eUhlIuujBRl2ao3oA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXzVzDUDCg2wzV
 uubhXC0w1tIenGxFry1TA+cO9xRziHpqbHrO9n6Y0Ay+Eyi8NLM/yEAHyPqA5pUPrPB7bKv1uM2
 kYb8hT+LltLTyP1tHGCA27ImG0hQ1NhFbaT/ykHkxYgth+tR5E6L4OHnImtnFJnrmIansKrs6AY
 ebptwg9JhIKX5mtWUVTCOGvxcFy5ASVv04As3UD45zJe6e4CSlq+eHiPMyzvBPwVhJyMJ8wwc7x
 W1NEoSY+3VC+MN+ha4rUxJvegIb1VRAVJ08ohEmjiB+/IevI48KSHBTHSAskqptAH7rlulwmfZz
 XWiSHiO47kWZIboM3pOKWKJJPB85k7v7i6erQrxXL6WO/LRVsTM5Tnu41oBhHHLMj2HPP9ad0Bj
 ishqFy6SgXxofdIGE70wIIZJkmurwj8rGM5zo7xHQ0S141gaMuGONKBPVvvYHoZBU3MmSNWiC2+
 kovs8xMer6zP+hs5HzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DA876D8B55

Hi Bjorn,

On 29-Jun-26 4:27 AM, Bjorn Andersson wrote:
> On Tue, Jun 23, 2026 at 04:52:13PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Currently as soon as the kernel boots with a populated DT provided then
>> the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
>> gets disabled. On WoA Snapdragon laptops where the factory Windows OS
>> actually boots using these tables this is not necessarily desirable.
>>
>> It might still be interesting to at least parse the ACPI tables and make
>> the ACPI fwnodes available for device-drivers to use. I call this DT-ACPI
>> hybrid mode.
>>
>> This mainly is an experiment for now and possibly a method for accelerating
>> the ongoing effort to run Linux on currently available Snapdragon laptops.
>>
>> On current laptops Linux cannot boot using ACPI due to some information
>> missing from the ACPI tables. People are working on changing this so that
>> for future WoA Snapdragon laptops Linux can boot using ACPI only without
>> requiring Devicetree.
>>
>>
>> There are a couple of scenarios where DT-ACPI hybrid mode is useful:
>>
>> a) This leads to a populated /sys/firmware/acpi/tables allowing one to run
>> acpidump, which is useful to grab info from the ACPI tables when e.g.
>> creating a DT for a new laptop model.
> 
> This depends on the laptop in question sufficiently following the
> reference design, such that you actually have a good enough base DT to
> find those i2c-hid devices...

I agree that even just for i2c-hid devices this series seems to be something
which will not "just work" for all models because vendors seem to just
pick a random i2c bus for the HID devices.

Not sure why you replied this to item "a)" of my enumeration of why the
hybrid mode stuff may be useful. I think this comment of yours belongs
under "c)" ?   "a)" is just about populating /sys/firmware/acpi and
/sys/bus/acpi/devices without any other functional changes.

This difference is important because unlike the rest of the series
I would like to get "a)" upstream eventually (maybe even soon) because
it is a useful debugging tool when writing devicetrees for new models.
 > E.g. on the Glymur-based Asus Zenbook A14 that I recently brought up,
> keyboard sits on a previously unused I2C bus - something I wouldn't know
> without first acpidumping.

Ack.

>> As a bonus /sys/firmware/acpi/bgrt
>> is also populated allowing the boot-splash to show the vendor logo.
>>
>> b) It might be useful for device-drivers to be able to access ACPI data
>> for the device even when running in DT mode. E.g. Srini Kandagatla first
>> got me thinking about this because he wants to use the ACPI MIPI SDCA
>> tables for audio codec routing when booting Linux on Windows Qualcomm X2
>> (Glymur) laptops.
>>
> 
> As I argued during last year's Plumbers, I'm strongly against this, for
> anything but prototyping/experimentation.
> 
> Specifically something like the MIPI SDCA tables, are we going to define
> an ABI across DT/ACPI such that we now require the hybrid system in
> order to build a Glymur-based DT-based product?

I think re-using MIPI SDCA tables rather then having to manually recreate
the same info for each laptop model in DT is actually a good idea. This should
make bringing up sound on Glymur laptops much easier.

I know you worry about a theoretical embedded devicetree only use-case of
Glymur in which case we will need to create DT-bindings for audio then since
there won't be MIPI SCDA tables there.

But your suggested solution to this seems to be to do the work to create
the DT bindings now *and* then also add a lot of work on top to create
the very much non trivial dts bits for each laptop model.

So what you're suggesting is more work now + more work per laptop model
to avoid doing the same amount of work (but then not per model) later
in case an embedded Glymur use-case which is DT only pops up.

As such I agree with Srini that re-using the SCDA tables seems like
a good idea for the Windows laptops use-case.

Just another random thought which popped up in my mind for "b)",
it might be interesting to use the ACPI I2C-HID _DSM to get
the "hid-descr-addr" in case where there are 2 alternative touchpad/
touchscreen sources which share there I2C client address, since we
currently rely on different sources having different I2C addresses
and then I2C-HID silently failing to probe the non existing one.

Actually checking the _STA method for second sources for some components
might be an interesting use-case for the second-source case in general.

>> c) It is also possible to go truely hybrid and use ACPI to instantiate
>> some of the kernel device objects representing the hardware. For example
>> the last patch in this RFC series switches to using ACPI instantiation for
>> the I2C clients for the keyboard and touchpad on the Snapdragon X1E Lenovo
>> ThinkPad T14s gen 6.
>>
> 
> Which introduces the very shortcomings that are a key part of why we
> don't just run off ACPI in the first place today.
> >> d) This may help identify shortcomings in the current ACPI tables which
>> need to be fixed to allow future laptop generations to use ACPI only.
>>
> 
> This is worth looking further at.
> 
>>
>> Upstreaming of these patches (to upstream or not to upstream?).
>>
>> 1. The first couple of patches in this series mainly implement a) + b) from
>> above. This seems like something genuinely useful to have; and except for
>> missing DT-bindings for hybrid mode this seems mostly ready to go upstream.
>>
>> 2. I see c) as a way to slowly evolve support for current Snapdragon laptops
>> to use more and more info from ACPI and get closer to a point where we only
>> need a single DT describing the SoC and any info related to laptop model
>> specific bits outside of the SoC can be read from the ACPI tables.
>>
>> As mentioned above work is being done to have Linux boot on future laptop
>> generations using ACPI only, so all this applies to currently available
>> Snapdragon laptop generations only.
>>
>> The question is what to do wrt upstreaming patches necessary for c) though
>> (patches 7-12) are we going to allow new Devicetree files for not yet
>> supported laptop models to partially rely on ACPI?
>>
>> The current demo ACPI usage in this RFC series just instantiates I2C-HID
>> devices from ACPI. More interesting would be to hookup the embedded
>> controller (EC) handling in the ACPI tables instead of having to write
>> a special EC driver for each laptop model separately. For the EC parts
>> I believe that it might be worthwhile to implement c).
>>
> 
> Wiring up the EC is the one use case that I can think of where the
> hybrid mode would be really interesting, as a hack around the need to
> write custom device drivers for each one.

Ack, I have experimenting with trying to hookup the T14s EC through ACPI
on my DT-ACPI hybrid project TODO list, not sure when I'll get around
to this.

I agree with you that that likely is the most interesting use-case and
any further discussion on if we want hybrid support other then "a)" above
upstream should wait to see how the EC experiment goes.

Regards,

Hans




Return-Path: <linux-arm-msm+bounces-114977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MDsROTJJQmra3wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD46D8E8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:30:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=enazcpVc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cSLyWYgp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114977-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114977-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 395E9301DD9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0273B7753;
	Mon, 29 Jun 2026 10:30:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ABF332EAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:30:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729008; cv=none; b=pyo0A32LCAJmgD+Eo6lDcJJSHxGmbh7tbiu05tgnYqBmSYrGYW+s046i+eeDs6fTYrqeHsJe3vlHcJmXi2cW4QW+jtE0UEbt0i06WbChGofGrKbgIRWGyXmzbuQC8Yw1eyGUNEAbprgjmTdhacOak4oXIo5QxkPgZw7Z/x07l/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729008; c=relaxed/simple;
	bh=f4+4llNW9QdhdeH+apJcGMWAMTcPwb5TvVtwKEjFvW8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g795yJ9TQHGNTclKSFWyL/AAUPaisRmOL2yQNYcWNr14bwf3tNeqyk0mZZFqjiF5hFsH4Itaq0Ly6jzvMGD6hzcmIRFmuplQpEDe9sEQoDhbNNEp2S6fttodkOPj5tO3FWKZmGlDvCBi1ZLGyZ5VB9eZxKHJ0bs/bc1USDoby2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enazcpVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSLyWYgp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASpen2601075
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAVzcg6dPMdyNGOIBoidBHCGALgpEE2VWjE3OvdvjsU=; b=enazcpVcgvqwtQ1H
	VUhCQZ2XvpfTBXyanURAs0xpxISnWOcQUQJGz6qKxzX/xIaU5+cHPlcQB32+8nNz
	rdvAn9vrgzRibnjx3286KaOwVtCbdOKgdO3LuNe4Z16+TseZDlgWaq3/OwYAJBq9
	m4lESQGc21xLk/0XxEdshwuH48bZe0yGhD4SBBgbFIxJrWkL4eUIV6wx2so+VjJN
	aD868SVQhoQve9LFRPtvnWni7my8rTiutMxd/QrN1D32/YRWaUYo+cXSwZBs2bcy
	1M7adkmuU+mON8g+EQmVen7CkC0d75l957eK2Rt3acH181thkat0b/d0MLBUiRg/
	5p7DEQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8c6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:30:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd9b850342so1684523e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729004; x=1783333804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YAVzcg6dPMdyNGOIBoidBHCGALgpEE2VWjE3OvdvjsU=;
        b=cSLyWYgpM8mnqaqc4oRhfZZMZWeZn8CKn5qDzfF/bQYK6kmwcLzBq2QK0RcEwYYMbH
         0NZHqvLjxs2vovmQ6IO0xSywLpmvAUHsyz46S3ucC5MA9QNqH0xWZm1w9R5w73zPFRer
         9SAb0RQQo9K4vgSx7NJJaegr5i+VM7fQq/8+ZKdqPPMSDBc5N72EjFjY2kbG5Q9tmRzO
         bHpt1CCm8vDmj3W1nGEaeCu/20mHidxZfyETrxSytz1S4UHWEBBmz2I+firQHNzgeenj
         QhN/ByQdi0WkZkr3AKkjJkeMgYG6AkrC9yGZzorbH9JWOfkWCLwT2woMJbEv7C0Dhr2F
         n7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729004; x=1783333804;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAVzcg6dPMdyNGOIBoidBHCGALgpEE2VWjE3OvdvjsU=;
        b=LJtrJQo25cmo4TKYarv6BBoOfaquTuUyLWaJ03nIMziRZfK9VSsRK0d12ZEL7lE4pL
         L5gRoB3ZEB9KvT+hvhafTbOVN2/ts99macIlTUMarRttR4W3NVrsMMY4cLcqy9rbby3U
         xMduIFa2Sf5ATPO8EFUiMac63DtzivrNTGmir4mXx9x2PoLXgbK95aipeEEl1X/mk72F
         dqJljlbm4TsdpUTpJXBhz22FQdYYJELg4pYxy50Hx/rp13oIg+Lzb/TiM8e4LA17iz7e
         WFabfivzA709hl0rz3l1xAMySjd+g/N0LgDML40vkQZWaxP8l2x2itGTnt6arOvVp8yo
         nNEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZjGKHHWXvW5yyrS1iiZPw666iydsdbwSXXW45H+H+HJfBRFyqTUDfhmeVt2boWhqz1MUq3TMdEGJUKE8k@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTUB6hlG41361D3HeLkU4RSyYX2c9A+k7r2jbRLR/UOPYhSia
	2ja+s32CNSeoP0517iL7Eozah0I3jK9IsDr6YOe8xTglYbnp5YnE6t0DdFIus584zlhvqVJgU4Q
	D+WTi2AZr39FkItXLiwDZPXLkTyrgBLaTLrxKKzwKOktrFW0qDNdgUEpoYQXs1ZBwSSht
X-Gm-Gg: AfdE7cnmqHIN8Ifp7R5/uaMdkwc8w8obsx8joPA2TQN2tFZ6IccAGDrUHi8QMP69m3N
	gDsYQFRZ4qMqLiL2M/1CVfbk76ZWDR/WfYFTrEl0XnR08RuvshMzlbrhzcrCYfcDgh0E0FxpQLA
	bsQNpVp9JdUnpH6hWm3o/OEIys5bWsrUXzcfkeRtyBoZwRyxlcF7zn4GAs7jHpLGmBuQB/uFgfc
	tdBJWQv3PrE68jgckjYS+fRYRFfpXSnHD5lv898j1ggtlzyGJaFzxhuucaAZyZXFjtZRn3/Mbh9
	7Yt6XQ2C8Gq+rvRCkk6OwemKOr3YC2DpMLw6754VtCkWr5HtLgeHVHoH1DaylC15ORyOce2U2pZ
	EfL+kENxmmtWYgaQFeBUlTBtFnFAAEQ==
X-Received: by 2002:a05:6123:5d6:10b0:5bd:a6a3:3066 with SMTP id 71dfb90a1353d-5bda6a336abmr855628e0c.2.1782729004069;
        Mon, 29 Jun 2026 03:30:04 -0700 (PDT)
X-Received: by 2002:a05:6123:5d6:10b0:5bd:a6a3:3066 with SMTP id 71dfb90a1353d-5bda6a336abmr855607e0c.2.1782729003139;
        Mon, 29 Jun 2026 03:30:03 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f49ca131sm6721952a12.20.2026.06.29.03.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:30:01 -0700 (PDT)
Message-ID: <6893c0fb-16a4-4e88-92f9-bd072e26547f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:30:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC 09/12] pinctrl: qcom: Add support for WoA ACPI tables
 virtual TLMM pin numbers
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
 <20260623145225.143218-10-johannes.goede@oss.qualcomm.com>
 <akHOI2Ki1L1pVEVy@baldur>
Content-Language: en-US, nl
In-Reply-To: <akHOI2Ki1L1pVEVy@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX6kK9B7LoVQke
 Ppn83ez0lF9bq52R6VJ7Gks3RSfXUzGNC06x6wIpGwmrB9BvfcnYqeYO980EqRVprd6g5/XO/Hf
 XG0bQCLkH0BR3Iwbdc5ljAFYZezAFcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfXzOzQR8q+j22a
 kw8aaVEfamaNIsJkLXQtdowDJOHltEcPTe5lytJoS/qSup7MzjqMCnTkAAWJOGXhzv+IjP+zAv/
 +DbBHYF00igqewzPMF9m0/R8CGnqom2eZtgT3y67WjLhq8inMIzSqp0UxR963+Q3m6tgMktZHdK
 cJjuS1Vk0wriG3BPEdzu7XgPnhrD4O8RMw3UpGrXO5pwb/qlXNnpaU67Bn16U1ern1+nbbemKcH
 UlGnWN+n4DBH/ZcDHpbeyx/0e+sCuxuufaGV1Yt4axc+vQQQ5rzkvRv6fal2Se4ll/3SUELyhIG
 T4KfVrguLb8WvieRt2OGrhZbbKjNdvHRnp1h9PnWENU0l9hhNd2OvFERyqlmugfbIaelwEgDUt3
 9g8omnlK0ns+rL0vm/S1U+RZyZBjfHaP1LOHtgSCgT50Hl7DJir01Y2r0uNwuxohMToyYBIf+my
 fN/NDyItz6lXHLHFECg==
X-Proofpoint-GUID: 9JTh6296Efpb5G-ArhSHW2pMOEE5_Ber
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42492d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CZlP5E7Tkv4MzdeRfuQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 9JTh6296Efpb5G-ArhSHW2pMOEE5_Ber
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EFD46D8E8F

On 29-Jun-26 3:59 AM, Bjorn Andersson wrote:
> On Tue, Jun 23, 2026 at 04:52:22PM +0200, Hans de Goede wrote:
>> The ACPI tabled on Windows on ARM laptops use TLMM pin numbers outside of
>> the actual TLMM pin number range. These are a rather convoluted way to let
>> the Windows Qualcomm GPIO driver now to use the PDC for some pins because
>> these are wakeup sources.
>>
>> This adds support for translating the magic Windows virtual GPIOs for these
>> back to a regular TLMM GPIO so that ACPI described devices using these
>> virtual GPIOs can work with Linux.
>>
>> For now this code only tries to do this mapping when booting in DT-ACPI
>> hybrid mode which is only used on some WoA devices so this should not
>> impact any other use-cases.
>>
>> The new functions use woa_acpi in their name to make clear that these
>> are for dealing with the ACPI tables found on WoA devices, rather then
>> ACPI tables found on other devices, like ARM system ready devices which
>> also use ACPI.
>>
>> Note that simply mapping these virtual GPIOs back to TLMM pin numbers can
>> safely be done on Linux, because Linux always uses the PDC for GPIO IRQs
>> where possible.
>>
> 
> This adds a fair amount of complexity to the driver,

The changes to pinctrl-msm.c itself are pretty minimal and the 200 lines
in pinctrl-msm-acpi.c are not too bad given that they fix a bunch of
GpioInt-s in the ACPI tables not working.

> to support a model
> that I am not convinced we want to retain - and that only works in the
> hybrid case.

With the exception of relying on the pdc-ranges from DT, this should
work fine in an ACPI only mode too and would be quite useful to have
in ACPI only mode.

Now that I think of it, why are the pdc-ranges in DT at all ?

AFAICT this is a property of the Soc, so this could just be in the pinctrl
driver based on the compatible. Just like the wakeirq_map is coded
in the driver. It feels a bit weird to have one defined in DT and
the other coded in the driver?



> 
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/qcom/Makefile           |   4 +-
>>  drivers/pinctrl/qcom/pinctrl-msm-acpi.c | 196 ++++++++++++++++++++++++
>>  drivers/pinctrl/qcom/pinctrl-msm.c      |  47 +++++-
>>  drivers/pinctrl/qcom/pinctrl-msm.h      |  35 +++++
>>  4 files changed, 278 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm-acpi.c
>>
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 84bda3ada874..9029d99190d2 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -1,6 +1,8 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  # Qualcomm pin control drivers
>> -obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm.o
>> +obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm-core.o
>> +pinctrl-msm-core-y		:= pinctrl-msm.o
>> +pinctrl-msm-core-$(CONFIG_ACPI)	+= pinctrl-msm-acpi.o
>>  obj-$(CONFIG_PINCTRL_APQ8064)	+= pinctrl-apq8064.o
>>  obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
>>  obj-$(CONFIG_PINCTRL_ELIZA)	+= pinctrl-eliza.o
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm-acpi.c b/drivers/pinctrl/qcom/pinctrl-msm-acpi.c
>> new file mode 100644
>> index 000000000000..df180fd04749
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm-acpi.c
>> @@ -0,0 +1,196 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * ACPI GPIO lookup handling for WoA (Windows on ARM) laptop ACPI tables.
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/list.h>
>> +#include <linux/math.h>
>> +#include "pinctrl-msm.h"
>> +
>> +#define MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK	64
> 
> Wasn't this 32 for a while?

Not AFAICT on my Samsung Galaxy Go with Snapdragon 7c gen 2 /
sc7180 using 64 is the right thing to do, as is on the x1e laptops.

> 
>> +#define MSM_GPIO_WOA_ACPI_IRQ_OFFSET		32
>> +#define MSM_GPIO_WOA_ACPI_INVALID_GPIO		~0U
>> +#define MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES	16
>> +
>> +#define PDC_RANGE_PIN_BASE			0
>> +#define PDC_RANGE_GIC_BASE			1
>> +#define PDC_RANGE_COUNT				2
>> +#define PDC_RANGE_ELEMENTS			3
>> +
>> +/**
>> + * struct msm_gpio_woa_acpi_parse_data - Data for parsing WoA ACPI GPIO ctl resources
>> + * @chip:		gpiochip handle
>> + * @data:		Data for mapping virtual WoA ACPI PDC IRQ GPIOs
>> + * @soc_data:		Reference to soc_data of platform specific data
>> + * @pdc_range:		PDC GIC to PDC map ranges
>> + * @pdc_range_count:	PDC GIC to PDC map range-count
>> + */
>> +struct msm_gpio_woa_acpi_parse_data {
>> +	struct gpio_chip *chip;
>> +	struct msm_gpio_woa_acpi_data *data;
>> +	const struct msm_pinctrl_soc_data *soc_data;
>> +	u32 pdc_range[MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES][PDC_RANGE_ELEMENTS];
>> +	unsigned int pdc_range_count;
>> +};
>> +
>> +/*
>> + * Mapping does not need translating the acpi_resource in to a regular resoure
>> + * and adding it to the resource list. Always return 1 to disable this.
>> + */
>> +static int msm_gpio_woa_acpi_resource(struct acpi_resource *ares, void *_parse)
>> +{
>> +	struct msm_gpio_woa_acpi_parse_data *parse = _parse;
>> +	const struct msm_pinctrl_soc_data *soc_data = parse->soc_data;
>> +	struct msm_gpio_woa_acpi_data *data = parse->data;
>> +	struct gpio_chip *chip = parse->chip;
>> +	u32 gic_irq, pdc_pin;
>> +
>> +	if (ares->type != ACPI_RESOURCE_TYPE_EXTENDED_IRQ ||
>> +	    ares->data.extended_irq.interrupt_count != 1)
>> +		return 1;
>> +
>> +	if (data->nmap == MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS) {
>> +		dev_err(chip->parent, "ACPI resources contain more than %d IRQs\n",
>> +			MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS);
>> +		return 1;
>> +	}
>> +
>> +	/*
>> +	 * Windows ACPI tables divide GPIOs into banks of 64 pins with one IRQ
> 
> Is this really "Windows ACPI tables"?

I'm using "Windows ACPI" / Woa ACPI" in comments and naming here to distinguish
this from ARM System Ready ACPI tables, for which there also seems to be some
support directly inside pinctrl-msm.c .

> 
>> +	 * per bank. The resources start with listing the real TLMM IRQ for
>> +	 * as many banks as are necessary to cover the real GPIOs. The Windows
>> +	 * virtual GPIO indexes skip these banks, mark them as unavailable.
>> +	 */
>> +	if (data->nmap < DIV_ROUND_UP(chip->ngpio, MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK)) {
>> +		data->map[data->nmap++] = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
>> +		return 1;
>> +	}
>> +
>> +	/*
>> +	 * Use the "pdc-ranges" property on the PDC to translate the GIC IRQ
>> +	 * from the acpi_resource to a PDC pin.
>> +	 */
>> +	gic_irq = ares->data.extended_irq.interrupts[0] - MSM_GPIO_WOA_ACPI_IRQ_OFFSET;
>> +	pdc_pin = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
>> +	for (unsigned int i = 0; i < parse->pdc_range_count; i++) {
>> +		u32 gic_base = parse->pdc_range[i][PDC_RANGE_GIC_BASE];
>> +		u32 count = parse->pdc_range[i][PDC_RANGE_COUNT];
>> +		if (gic_irq >= gic_base && gic_irq < (gic_base + count)) {
>> +			pdc_pin = parse->pdc_range[i][PDC_RANGE_PIN_BASE] +
>> +				  gic_irq - gic_base;
>> +			break;
>> +		}
>> +	}
>> +	if (pdc_pin == MSM_GPIO_WOA_ACPI_INVALID_GPIO)
>> +		goto no_map;
>> +
>> +	/* Use wakeirq-map to map PDC pin to TLMM pin */
>> +	for (unsigned int i = 0; i < soc_data->nwakeirq_map; i++) {
>> +		if (soc_data->wakeirq_map[i].wakeirq == pdc_pin) {
>> +			data->map[data->nmap++] = soc_data->wakeirq_map[i].gpio;
>> +			return 1;
>> +		}
>> +	}
>> +
>> +no_map:
>> +	dev_warn(chip->parent, "Cannot map GIC IRQ %u to TLMM pin\n", gic_irq);
>> +	data->map[data->nmap++] = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
>> +	return 1;
>> +}
>> +
>> +int msm_gpio_woa_acpi_init(struct gpio_chip *chip, struct msm_gpio_woa_acpi_data *data,
>> +			   const struct msm_pinctrl_soc_data *soc_data)
> 
> This function name makes me think this deals with "the ACPI case", but
> it requires both ACPI and DT tables to define the TLMM block - in other
> words, it complicates the DT-only case and it's useless in a ACPI-only
> system.

Ack, see above. We could just hardcode the PDC ranges on a per compatible
bases (assuming we want this patch at all). Then this should work fine for
the pure ACPI case too.

This would actually be an interesting thing to have for people interested
in doing further experiments with a pure ACPI mode.


>> +{
>> +	struct msm_gpio_woa_acpi_parse_data parse;
>> +	struct fwnode_handle *fwnode;
>> +	struct device_node *pdc_np;
>> +	LIST_HEAD(resources);
>> +	unsigned int ngpio;
>> +	int ret;
>> +
>> +	/* WoA ACPI tables are only used in DT-ACPI hybrid mode */
>> +	fwnode = chip->parent->fwnode;
>> +	if (!is_of_node(fwnode) || !is_acpi_device_node(fwnode->secondary))
>> +		return 0;
>> +
>> +	parse.chip = chip;
>> +	parse.data = data;
>> +	parse.soc_data = soc_data;
>> +
>> +	/* Get PDC ranges, the PDC is the TLMM's wakeup-parent. */
>> +	pdc_np = of_parse_phandle(chip->parent->of_node, "wakeup-parent", 0);
>> +	if (!pdc_np)
>> +		return 0;
>> +
>> +	ret = of_property_count_elems_of_size(pdc_np, "qcom,pdc-ranges", sizeof(u32));
> 
> That said, do you actually need to do this? Doesn't the ACPI resource
> give you the INTID directly? (Perhaps I'm misremember? Or perhaps that's
> of no use to us)

The ACPI Interrupt resource gives a GIC IRQ number, which needs to go through
pdc-range mapping to become a PDC pin number, which then needs to go through
soc_data->wakeirq_map to find the TLMM pin number.

Regards,

Hans




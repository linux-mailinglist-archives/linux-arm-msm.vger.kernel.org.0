Return-Path: <linux-arm-msm+bounces-118758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oxeLG7PWVGqCfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7474ACDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:14:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PIZqpuaU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kMrR9LnH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7974F300F45E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40588388E4D;
	Mon, 13 Jul 2026 12:14:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A35409115
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944879; cv=none; b=tR0fPhitTMxO/a4Z/07ZWiL8vKYbsYVzec3TlEwuMrVq90DdkmKDPRezbZXqMOTZuKI3axhRo2Znu0ujuJTuUzn3fpnMKkXO4QTU5n+Uug7EhDiUaaUM8KC/zs5Ztfv1qtCuaskzFS78zj76xALeRt5g7gvfbs5+E0LnzcHA9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944879; c=relaxed/simple;
	bh=nsI8T4STqsmeEuiGAOxbYxuJO6hrXOyetkh9eq6Zjwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvXp41n8NJ6alrqzLO3RjhG/aZhg4PlBbyv9ePGEc0nCrx8yaTHcD4LJMfSRt1UAgY3MvgzZzcObNOXnGjWfPvInuTGg/8KdptQpF7ZADtlzfUENmtHs/9LND2IMa186fB6wnnBPW+n22oU8h4zITLQb7jBI+85ub/6oY8kCkcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIZqpuaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMrR9LnH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEQIg1333710
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=; b=PIZqpuaU+dcN2cYl
	K7OG79yORlwqF+yS3McM1y2kI/lDMjYUmLFLiIPJ6JEu7iwlt5Y1mY7nw5m0KW2z
	K4f/Ogtn2kEloNL9btXjk2rKGCjHHDmSNdFfQuO5sZ8xSbbi6xnGB4GitPzAQiSC
	L3k47FPtVDrgy2IHsSaIHPu9/kI/yEsudc2NxZhmV2FMB2crUFQP7gn6ZIAc7As/
	ZHD5swctvnyvRq4licOfVoCFNqfq/qpBmApvLgiSOiMTkxJTzR3Dnll0cAJzJiXC
	xWReY8uJgUT6lDyrKnc41xax3hpq65biHKXaEOVZIW9UrnQkhH0pvp5FMfC07hdq
	qUFBuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hdrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9058a836724so5044066d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944872; x=1784549672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=;
        b=kMrR9LnHJWgEtg3W8ExNqwgYxhESYNok/6zwHgCI6O29Vd1E9SY10awPWTv+a3cH//
         ko8vQTIlzXnEkMpFmQ3QcPT+v4zNPBTVNlnsyhX4x9GkonWLta2vt52jI6seoCFHcIYI
         AAtKAZZ0SE0HFPJZy8ZgoWoZQr9BJ9F9viWwoPRwmIvEGyStv9APUkvGmhzIH352K7oD
         rJmvBKZQS3h92FgHjrS2u9mUZe5ylj4zoOpK+b2DnRFJ5iWCm0pyuQUA8DWgI74gZy+q
         klTO4fy21n/yGNhzzK4yWGIeFl+IMjuYj2j5Vhh+SLLRfinroNw914ClnF+4MIb5tQio
         t+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944872; x=1784549672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=;
        b=QO9zzIJTyVZ0SwdepvKsjcmmKk39BwlUC1NcliD08+YT80ge6tgNfVcMBfg8QGDOmJ
         5JSazQ7XJOEphX0A27eaUmuSQT35odT2Xbo6g8FU0AQvB6c/44feuQppm/PsT3kUbTF/
         N7WJH6tb44e3uuXNZz1On6tcl+YodQJOLyBqoLxrPzUkm4RKfkTH64TxxuQ29vve6qBH
         V7xwc7OK7LgjHM/dm1rK2XOFNjmj1hEevIUTzROizgFQXfUjp4FVnAgqife04NNzhmKo
         On4bVe351s8Q1hqI86Q5uLIfiDTBCG9htkVSuO3QyA1IblQPGcobL1yJ0qHArsZRT8qj
         8Clw==
X-Forwarded-Encrypted: i=1; AHgh+RqfypLseCh5s91m7umR39D6ww45Ji9/SbVCbjs4LUZ+tqjNw412BXz/OgUyNV9QO5pUVA1biZLN8E7+1HLO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WPm52wz1Uk2YzrVzEw6cK0T2MUZRIk0dqE/Q8R0K0raUOtG2
	C+zFN/oABSRdqI1kXovWRoe3QUf+h3IinIgBg+peLO6TR0EBQ3n43Q7Azfq/9ZzgYrERC352v/A
	EL70ro3DKXK4AJZ+BbaHfPE5brkN9A/8T4cs1s+dzLxe+NIeDc08bcyaPh1Z9ZCbs2BKr
X-Gm-Gg: AfdE7clPn9e96iQzVx/VaNOnAF2Qim9wjmiG63p1zyZeBhGkdoNtAsOKCoWCqAK7sA1
	bv1qV8RRGylfOjssgFn52TFQtakNqnKIUZcFoIrJNU1JWlhVNKuYvDj8H0H++F7YaY7tamCJnB/
	sVShlBAr9bfA3a2qQ7AT70dCpvCkS4jLvPzpxAyO8yWdV3gcc8jMPlRULYh5V/qC45gRGxFdQ21
	tL5K85+RKXelsEgDzgrGn3V3rz1aXN2dMcaed1V5kOTgVXT3BNiGALqYUVzDFcpAGSx1W2sbKMz
	BUul8gLXz62n+YPHw9FxxhchOwfiT8GLb/TxxWB2MVxAOuLjepaNaowIvckYXWcfD38+hb/oLr1
	9urNGtL7t0obSydlhOCAHHCYGgq3bjd9sj8M=
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr77529156d6.1.1783944872334;
        Mon, 13 Jul 2026 05:14:32 -0700 (PDT)
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr77528786d6.1.1783944871941;
        Mon, 13 Jul 2026 05:14:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm15075398a12.12.2026.07.13.05.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:31 -0700 (PDT)
Message-ID: <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IywfiQxpCGs_-_0jIq5361rNBO0Wzkz7
X-Proofpoint-ORIG-GUID: IywfiQxpCGs_-_0jIq5361rNBO0Wzkz7
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54d6a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AMBhOB7pGyomvzLA2OYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXwET74p1XXCBM
 i6RJz5k95Vt4ifMVufHUodKzMqItGb6HPf6ZbvNBQAvXl3veMuLbUbS9lTdtKKkYoeE60bSozT4
 nL1VKF7V6z2Cf8Wx6lchDEr56S1y9rQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/0PkbGmYEzwV
 7GuNiSORMaXW63t4rdquZIcO8JscSN5/AbdxHhQw2uerpPwKrFL9PmsP0k5gP5hUo7fx+X01Ywc
 JNzZuaTzYHwgJ/FW9fsxDUhFMvWlfrGb/a217hr9bFZwB+MjjyufENYPW9bQXiLvDEEsi6XLrLn
 TGNuFyZ4wq+GcB6aNcQgWQp0Rapng5rqE85bExxghY1p5Ez6hIREqus4fq6S47coKP18qcU9cu5
 /8TIvo2JEOceNn0lWexbOap88c1ZIARyv4eDrzIpC/hv05pUXPaxDcpKg9wTCLu2o1yYzRzs/Fi
 kroLofTfcCoG0Fjsp5OmnY2OzNbFJ63NY7qR2PcBEnGgQzWWveroXjfJz+rikMNoxbR5lwtDbIR
 3vySSO49lO7WCdSSOJxSJpgrSS3PxQBkoKRGAGYXvY2XBei4kDE16CRJSiGTPriXKxS2UFiTYne
 RqSke+JuLrx5v0qkNMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07D7474ACDC

On 7/13/26 2:07 PM, Imran Shaik wrote:
> 
> 
> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>> differs across Shikra variants based on Audio subsystem enablement as
>>> follows:
>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>> are required to be supported on HLOS.
>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>> handled on Modem, so from HLOS only resets are needed.
>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>
>> For the sake of simplification, can the resets be enabled
>> globally by default?
>>
> 
> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.

What does enabling the provider node have to do with changing the
state of the resources?

FWIW there's nothing like reset_sync_state

Konrad


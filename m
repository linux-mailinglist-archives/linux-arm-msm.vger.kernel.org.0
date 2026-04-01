Return-Path: <linux-arm-msm+bounces-101320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL0SDfgBzWmSZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:31:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71037978C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17EE030137AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A263F20ED;
	Wed,  1 Apr 2026 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3d/GjPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSCwkHTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0993CEBB1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042484; cv=none; b=WiUCErsCLWKAVp5D2F5kI6bdBi4J69enbAUnfqDZ+zQdNflbt6mSG0Ao3OL/C2Cq+MG+8WR7KIl4T9+/fie1PS9CGcOKr/DJekiVvI7OUe0HyJpCGLdEw9d7IgcKPLHzYDheQ/6gcuqlNy50/ZR1EHAc5Il7OGPG+sc/ArGaOyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042484; c=relaxed/simple;
	bh=VMnhYYDUiaSfV3lX5JRhm4gQqAQh3ymN4z4y+uJ1Bss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC4jXg0XYTJurMHJojqMjcnne0mswMpIkeT3adhQ24X0ZUlBy0u7WzC5j0sF6t8hk/wRCxg04EZQKMoaAuv38OjprB/tTfhy/c5475NVxLerw0XdVg6cSxPr23q5N3g9fbxmSXQRUmYkPhyssk+roidIMODT0cWaRDTXriJQp4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3d/GjPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSCwkHTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AMqgw1562478
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSggxIu2zQD4DsBMlrluFZINoxno1QBalYiFALDNiKs=; b=n3d/GjPUdHAvz2CW
	58H63oyVg70eCSDzS7dQOgfiC8USySrryu3pXHoemDi5bx38eASlTcAJsAeTPxC3
	0yeC1PkMZjQ8djJXSGttCXqjQvr+pOsFHvyyO8G6AUUTB1gNhPQTtR0B4bGYE0Lr
	yyoljGFMQLcTwj65pvfraKcoQMhcycUvlR5gHZB7drZjH4JOatp4jJD7c64dUYoT
	EjpnjZRkfd+8G0X3ofKkmyJBHH3tGWVP6616I1q3F1ZhmMZkC4j6o8rAnteYbTq+
	llGFuJF/LFcPsGspSs8YNDOFi2IoNL83CVqG0EvWADxoG1KbPbEhhHbubif9d53n
	3LFBYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sjcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:21:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso15568946a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042481; x=1775647281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSggxIu2zQD4DsBMlrluFZINoxno1QBalYiFALDNiKs=;
        b=KSCwkHTr+UQy0WT0lMbT57libRfCbahSHcDj9kwy/vJFpVJgqDMsT4S+3RHKW5fn3T
         AA63vUskwsv2L47VFUvZWl27emOFglwYYyv/5V8o+2WMaDgAuPNdKnfu3Ga/Q2aI2Eqc
         fQT/sJpk88oPBWo33SV5PIRWJ/dfrOak7fKSvN16k5c8O9N94QGVQOMy3LvOAzliJRhQ
         2qinwZW90ETAuTL0NtN1/dsCc0acNS+OCC8arcpWFC/LTSbyEaUlru5eWd9H1uCc+spF
         N1i/oTMvAijmtOzJVU+jN/RcsHN2uKXX8TmeIYb7BwQSrpopb/Hr7hqFxWcJkiG5LENv
         eDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042481; x=1775647281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSggxIu2zQD4DsBMlrluFZINoxno1QBalYiFALDNiKs=;
        b=SmdhAD2psWKKZIjyDB+7zmu4Rp8Qp9iCSinGpXqDM7ULC/WQIFK9L2qR01DXeGH8sQ
         yZ9zlgfF+I2OEKqAzxHmqd3V1zhwNhnJpRf/3I9+vIUm2JVdbRWvBaaQuq/fgMPT0U7l
         e6Qg/XMIEqOkEHh21xN5syZkWz+50HrJDoEmJ+St3RJuT11E9eRch4c+qYEydrmUG9UG
         NpvQfnLDK0OITG4Dlo+AbNKIj3QTw96Xaw11CU2FyhPpRdLNJwcX1qgMEbp32v6qfEGp
         NZDIE6Azr+5hyAZy7jll1z9kM32zZ0EtCQOK/E+GWrKLI+cWFOvyG5X07ynAUpAsmK+o
         nb0w==
X-Forwarded-Encrypted: i=1; AJvYcCV0ApSZr35gjlhjxX8zm24Nr4OLBZ+u44xm2jChWkN6/k2TAqdFJ+yqipqbJkemqKIiI5bLjlVkJ9nfW3Bi@vger.kernel.org
X-Gm-Message-State: AOJu0YwFRKP/zh3r/Tv6RRF+3MN9gKInTYImaYG9jDElOqaYdBmKIwNs
	1jXtK9x4Hw0e4M76pRFerSyFrucT6TrNG0JPzsXJpHRlnkLmCqYUAJQnm4Y91AFYFiQKihZMjX4
	jnfpKFeByVwqAub8upi+NCK8YtGAPik+P787HIE6EPx67ESFQVsSvhNKOt0YmloXiKfEE
X-Gm-Gg: ATEYQzzE4m4aU79TfLHb+A+NhUHDsM6dIVG+ueZQvS8tIujPNi9k9S0w3hT4fdPRJzz
	X/KZx/Sy1D+Ym9AiBX14dW9gzI4FY01ZXE7wKUyjXLRG1BU7ewWcrlbNDt46Jdc1pbErjRr9YHw
	zvIDOJGIXDr51l3iHtVXCuXQac6J3fUwrrEDSQY7BkF32GiHYv3ZzmiL1F7TuRrgYM87H53YGX0
	8Rlo0Ul+tHSyx6cJSaj8OsD40E30Vvki9uHcUkm3yzK/zbWQg+YhJQvK6Ml3MwUOyvnmDxQKBZl
	yUHG2MohtKDAjO8JeCjchVmbDz0wVX29uPGn4LnobvlOcQii//zpvREyn2ZwXciBWZM+jaVbeCD
	9FJUWf9Zy7F9vjhTObtcWkUHQUmE7nio2vGrHigRVz8QUdjxEdJJONQ==
X-Received: by 2002:a05:6a00:22d4:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82ce8ae56d4mr3725113b3a.42.1775042481334;
        Wed, 01 Apr 2026 04:21:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d4:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82ce8ae56d4mr3725063b3a.42.1775042480682;
        Wed, 01 Apr 2026 04:21:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caf97abfesm12659643b3a.1.2026.04.01.04.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:21:20 -0700 (PDT)
Message-ID: <5e1f6af3-c6d3-936e-70fe-6f7ddd472304@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 16:51:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
 <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -zwAJ3rZjwg8rXW0pY95LbzobcK55DMp
X-Proofpoint-ORIG-GUID: -zwAJ3rZjwg8rXW0pY95LbzobcK55DMp
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccffb2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cwlDSPEQxbFMGEvUi3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNCBTYWx0ZWRfX4ZJ4F9UW9PlM
 9+mndUoaDiCT3w6mtN6RsxTIO+NO/qWdXInueI/is2fK+k+NC8/zdmFPFfoSsskWfaf5rDBViRz
 SRPGPJ66XaZrMfVOj+CDzJQXgS1s1c2VNIeJC+VTD2FYv1zs6K5628lDYIVzmAjlECXryfim4Oy
 B0ko0ckJT4vvqL9cZ08iiPBJP3WS3mRrsy6/ZDbR78cAEKGvQlUcabHohhRPRQa0TpFM5c1ufFt
 c29u4VWYwfbbocn56Tb8Y+L6Xa/oU+QVow5eFxYep79f1x7sX/FyhSK/+VUqXJTgRrlTh+r+UuP
 bfcW8ndPW1uBS2I6lhji00MWCk9xBLyBnLfXTO9TXfszGG27KXtKjR1HKb0pBnXVNuc9He5S0Lu
 WC4epbYRcpCc7noka1vHSIy/C3Fwc0PjWVMoR5jVJF8sXoAwGHEM3ljozwU4nhseMmnH4FJD36q
 FUW56vpuV6H1x/0G/dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101320-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F71037978C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 4:31 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 12:46:01PM +0200, Ulf Hansson wrote:
>> On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
>>>> On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
>>>> <dikshita.agarwal@oss.qualcomm.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
>>>>>>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>>>>>>> the PLL is powered on by the MX domain. Extend the driver to support
>>>>>>>> scaling both power domains, while keeping compatibility with the
>>>>>>>> existing DTs, which define only the MX domain.
>>>>>>>>
>>>>>>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>>>>>>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>>>>>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>>>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>>>>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>>>>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>>>>>>
>>>>>>>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>>>>>>
>>>>>>>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>>>>>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>>>>>>
>>>>>>>>  static const struct platform_clk_data sm8250_clk_table[] = {
>>>>>>>>     {IRIS_AXI_CLK,  "iface"        },
>>>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>>>> index 7b612ad37e4f..74ec81e3d622 100644
>>>>>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>>>>>>             return ret;
>>>>>>>>
>>>>>>>>     ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>>>>>>> +   /* backwards compatibility for incomplete ABI SM8250 */
>>>>>>>> +   if (ret == -ENODEV &&
>>>>>>>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>>>>>>> +           iris_opp_pd_data.num_pd_names--;
>>>>>>>> +           ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
>>>>>>>> +                                            &core->opp_pmdomain_tbl);
>>>>>>>> +   }
>>>>>>>>     if (ret < 0)
>>>>>>>>             return ret;
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> Hitting below compilation error on latest kernel
>>>>>>>
>>>>>>> drivers/media/platform/qcom/iris/iris_probe.c: In function
>>>>>>> ‘iris_init_power_domains’:
>>>>>>> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
>>>>>>> read-only member ‘num_pd_names’
>>>>>>>    71 |                 iris_opp_pd_data.num_pd_names--;
>>>>>>
>>>>>> See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
>>>>>> dev_pm_domain_attach_data")
>>>>
>>>> The intent was for this patch to be part of v7.0-rc1, but I failed
>>>> with my pull-request to Linus.
>>>>
>>>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
>>>>
>>>> Is it possible to drop/defer these changes until v7.2?
>>>
>>> It would be very sad.
>>
>> Right.
>>
>> Since it's my mistake, let me reconsider. If I rebase my branch and
>> share the necessary commit through an immutable branch that you can
>> pull in. Would that work for you?
> 
> I think that question goes to Vikash, Dikshita, Bryan and linux-media
> maintainers.  Bryan, what is the plan for this patchset? Should Ulf
> rebase the branch? Or is this patchset delayed for some other reasons?

Its good to go, Bryan can comment as he will be raising the PR.

Thanks,
Dikshita
> 


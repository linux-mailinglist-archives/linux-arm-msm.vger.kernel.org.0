Return-Path: <linux-arm-msm+bounces-105833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /cLAOCZs+Wkh8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 06:03:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA54C64D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 06:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A8893013888
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 04:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E6139B48A;
	Tue,  5 May 2026 04:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoJJEZSK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmANIiB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9FF156C6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 04:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777953827; cv=none; b=I6w1T72CBAPnJ8ZBgf3H1AkTIUh4q7DcpUX+x9jbJBxALAhSjmZD51Lb9IjUTm5hgqU942737LdNt1urZkCaHrLizLEGi6vNcjZ1YRQD0/ss5jI0gACQxC5JIyRyemyXep4530WyNPKlxGB0eatG3H6LNj2s3B5vnSeXyE08PcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777953827; c=relaxed/simple;
	bh=ZuHj1CaGIwM5CyRrzl4MhNkMttdLsH2fTr5J7/qxBpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNan2qB4zURPnJ/UDG6j8aFODtmNxPk5WGn/zvyzLuxK9pTXNCUixYPOiUzySINqm47N/K2s7pyc2575pBwGmeL/D+E8lwC6Lk57KtYdRLXvXr/4T/k1HDUBo6OKKDgZAR0NJtSXAnn7hXNz5Mht6WAnauw/UNEOdZuYT10Q66c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoJJEZSK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmANIiB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644JuNG2331063
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 04:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbuCmHz6zfVOe2R0JIVOeIn//8PqSAWi8vGQ7sX9EbI=; b=NoJJEZSKYS/21L1h
	9U1+B6DlAhRN2A3Kz4Z2plpaUVbiZt14/AmcIbWP3gI3ob74h1U7Do9iR7/jLv9u
	eUnuTqJrkZ5/Aro5He2DvI+WPe79YWCtoNj9IpTuC0Pr/Q+4aqRn4hgAHBxMC9V6
	sSgYUo0+f1zq51M8kPVsDlDjafeIw6lIeq3aQmvLPdY94/Dx/ZD5RIuKyDDXf7DV
	eI0BeIsWy4HXUHLvVAlybYre6jQqZMOj0Kp6E2FrsJldY+d3u8AXUkPV2IclTsv/
	f25jqvlFDOQnHUqDozq1XpxeLG0er8wRgEJ/xcDpz+gljb6AUIiouOszv0hnmdBr
	6RbCrA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1ampp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 04:03:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso29872365ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 21:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777953825; x=1778558625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbuCmHz6zfVOe2R0JIVOeIn//8PqSAWi8vGQ7sX9EbI=;
        b=ZmANIiB9JwaVnOGB//8lJcIiQv+m73jO1yS+Nche0qfSxkMAFNPnqrGoi/F5X7qK1X
         w1tNfnrnO11ntCKKRYSGMHuprfaipAsBsbN+PLT6yYN9nG50Hkq5du7orCK263zm/26l
         qUgPdxPq865AMl/C42BdZkbeqRLLlPADU+3k0wTnp9KFfAilyLEEr1GgOLNDsA38G0Zq
         Y0uLN0G6+AHIQUEPwCTqXnT8q/8vMLWsrtaZFGzsIJEZjYLaczJPU4qkTXCqmlgflJFC
         HXsWJ+o5icd5XzvFlLTtdiUi9+yypVldvTSYWX8ys60XM/FQIHuR/KhdcU8z+7+lT3OU
         yRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777953825; x=1778558625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbuCmHz6zfVOe2R0JIVOeIn//8PqSAWi8vGQ7sX9EbI=;
        b=kdzOyq1sIxw6IVENUeMJSUUmH+Q1QQOO+tgWGakA2iWALKE4CnJvJcxMiUdukHwKd0
         kankpMKY7zeNGyxQ8YcfcZYEmw8btGwVU7df2rMBI6iwm7bmY3znlnoomEaqy6en7lat
         yW+fDUqqXciydC8QSAfokD4atanMUOrgCiRlAXAEGPb2wkyrbTOMv6opUqBTfQaBarm0
         WmTGIjD3gsIN7eaQWjG/Y/vCaEQEqX2uy381HJOApaX+noYUg+4NE25yJslBrXalQhfJ
         KgW5qSBKLeDHyRAVPgGz2Yzu9FriKLCK1Cvp6JKcpPXZ1B86fDsTiAoHB8Copw6/MNHd
         BTWA==
X-Forwarded-Encrypted: i=1; AFNElJ9DBtyofv81FteLm7ugA2fItXxkalb05Te8Ck8C3QZ65jMJdKik5U+y8dDuag1UymUXjkV1O26tPmR1mE3C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+aby/YAFPhla2T62f52TmKWLYGCSP+sfMQtU40zQPBGRMPNRs
	YddtXFstJoDiMC39gGUH1Hx8NNevCKZ2oIgX193U9AhoSroW8z5vAVBC4M6eCXuvYm4NKAvapTl
	KqgyaHwRdrMkYd+8m9OrVrQ0eQ21tRKuFkKTsh7LTAYLNVZgD+R9rtIOgxh/G2Fyl1vXI
X-Gm-Gg: AeBDieuLnJTTrMo0nEBmw2byLr5A/QadGcVI0H5zhCIAa/0kANm/SDT6Y5o7AiwWwi8
	+8PQ129XtxjpzTKq0Y1d3YUxINq0yISrV0muQWxozbm2XY+GQEJrjA5nPPxLk4yJM3R0MI1yXlS
	BqbwKiPSsF6ZqjoMhO36bhDqjG/m3QyLONvCvg1kJxXTv3BBFSwvJQXasIQEO6quPs5Mr2oWE9X
	aflolsuPnEW+r1gLiMCtJ/xE+P447bRfyXAwjx3QRrsnQGKxvD/ymoFx7HhQRua+0MtnKMJKAeE
	oqyVnhRSgchAn7UQ6O4Mq24/fHSnjYGr4OmthNoDSL6A9Yn2mByBBe5kivt17EF9JTtRJE8C4Hz
	dT6uAHAUHFVTkvdnd3M7X/C3aLmrKE+ft1XhFt/wD8ZQRkDy7EVRdf2qMne8gxm9C4Ij0M7rT+E
	IHnA==
X-Received: by 2002:a17:903:2385:b0:2b4:62bd:ee3 with SMTP id d9443c01a7336-2ba53883591mr14063135ad.33.1777953825147;
        Mon, 04 May 2026 21:03:45 -0700 (PDT)
X-Received: by 2002:a17:903:2385:b0:2b4:62bd:ee3 with SMTP id d9443c01a7336-2ba53883591mr14062575ad.33.1777953824602;
        Mon, 04 May 2026 21:03:44 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa8a0d9sm121090555ad.9.2026.05.04.21.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 21:03:44 -0700 (PDT)
Message-ID: <3f0271d9-3f11-4867-baf2-0ac5747d786b@oss.qualcomm.com>
Date: Tue, 5 May 2026 09:33:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 2/2] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
 <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
 <acqEc_urKggA5s62@baldur> <db85ddc1-b302-45f4-be26-f835c63ef069@quicinc.com>
 <f2386cf2-c790-4ce4-91ab-115a29399e25@roeck-us.net>
 <38fbf5da-abdd-4951-90d2-941f7cd62299@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <38fbf5da-abdd-4951-90d2-941f7cd62299@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Eu-Pm_f9G9PCnGY2ASZjrqm80TZimLad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAzNCBTYWx0ZWRfXy/S326TU5zdD
 XgJBKRzGHmW4H31qIiIkXqS7SdrJ76sLoLWNMV7Ul9wXUbhj7zGtjuwA9PDZp7YYCJfcRxSTkdW
 qfGpC2Fyimk0XwJpYW0rWI1V8cbqauwi81TCtxENw3rHF/9gZBAzJ0yFAXu1bLlRc8LOX+SFqjn
 xar/GUYpJPJb3w/4uUY+mMlTh7Kd5Hh0iKxkLm4IB2Wi63HB0MATKxGVixp2MdOcuxo4UNyETT4
 6xiaZfsGrNozSOj6lfPwAy+Bw1vfx20a6oJIJ4fvGW4jOZkShcibSahznEqwL+YmDDSdlUUza76
 7qKVfwKMmWFqWMfunM3nOEPvgChxMeJ2jo3WNp4UG6R6wcM/U7tYFHkrRWS90C7jo8o0VEmNKsf
 34EJwvAlubO1+KuwcK0WIlv7l0jqFQMM3gCec8/uSgEvfCRVbff23jBMoORuSB03bHF6sutQHyJ
 X9htjWqD0te+iuiE9hg==
X-Proofpoint-GUID: Eu-Pm_f9G9PCnGY2ASZjrqm80TZimLad
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f96c21 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_jlGtV7tAAAA:8
 a=bOwoz5vNKzCG1Xw9MRgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050034
X-Rspamd-Queue-Id: 43BA54C64D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105833-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 8:56 AM, Pavan Kondeti wrote:
> On Thu, Apr 30, 2026 at 07:37:12AM -0700, Guenter Roeck wrote:
>> On 4/29/26 23:15, Pavan Kondeti wrote:
>>> On Mon, Mar 30, 2026 at 09:11:48AM -0500, Bjorn Andersson wrote:
>>>> On Wed, Mar 11, 2026 at 11:16:31AM +0530, Pavankumar Kondeti wrote:
>>>>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>>>
>>>>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>>>>> through MMIO is not available on all platforms. Depending on the
>>>>> hypervisor configuration, the watchdog is either fully emulated or
>>>>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>>>>> Specific Hypervisor Service Calls space.
>>>>>
>>>>> Add driver to support the SMC-based watchdog provided by the Gunyah
>>>>> Hypervisor. Device registration is done in the QCOM SCM driver after
>>>>> checks to restrict the watchdog initialization to Qualcomm devices
>>>>> running under Gunyah.
>>>>>
>>>>> Gunyah watchdog is not a hardware but an SMC-based vendor-specific
>>>>> hypervisor interface provided by the Gunyah hypervisor. The design
>>>>> involving QCOM SCM driver for registering the platform device has been
>>>>> devised to avoid adding non-hardware nodes to devicetree.
>>>>>
>>>>> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>>> Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
>>>> Guenter, there's no build-time dependency between the two patches. I'm
>>>> applying patch 1 through the qcom tree, please apply this patch through
>>>> the watchdog tree.
>>>>
>>> Thanks Bjorn. I noticed that 1/2 is available in v7.1-rc1 , however 2/2
>>> is missing. Guenter, can you please pick it up for next release?
>>>
>> I don't send watchdog patches upstream; that has always been handled by Wim.
>>
>> Guenter
>>
>>
> Thanks Guenter for the reply.
>
> Wim,
>
> Can you please include this driver (2/2 PATCH) for the next release? Please let us
> know if I need to do anything else?

Pavan,

Please look at the announcement from the Guenter[1] and I see this 
change in the watchdog-next branch of Guenter's tree[2].

[1] 
https://lore.kernel.org/linux-watchdog/cc68acee-484b-4fa5-a3f3-6add81d63d22@oss.qualcomm.com/T/#m11e748ea57c88853b8bdc4e41cac08b7c1cd1b77

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next

Thanks,

Kathiravan T.

>
> Thanks,
> Pavan
>


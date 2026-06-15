Return-Path: <linux-arm-msm+bounces-113201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jmI7FU0NMGo2MgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:33:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68468736D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:33:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DDJRlQES;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EywmFzml;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E59D3009092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADF73F888F;
	Mon, 15 Jun 2026 14:33:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF43F412C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:33:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534024; cv=none; b=onoJyqNAWKCSWjckXc4Rf/bNQc8qA++jVGCycBwLUBJUkAJV80kKLAjfzWWlofcYaEJijBUAY9jcu4XQBtoY3RSWEwDmEOynMNzJjwsmz/OzHdf0XtganRaB7tGIPNQhpiZ2wMHfqyWyLaQB0IXlGQ17ce/u/SdMJ2R9vpxvSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534024; c=relaxed/simple;
	bh=4Wm4l/st3gWaMHoN5Bw5U9Pr/QJGQ1bGkwqydPvFm9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSqEU7dZCgcGPmis+OthHzoM7rXP14XtEJw/PncV9FrnzwuEwRCGBUsa4LcQBC9wDzZYmLQWT6R6VyH2EhInWAIa+M2rjDrMydmqNge9m606wyY/xy9gvRaiOsU19625WB7xJImisJlEmXFeN3Klwz39gaR8ll+7R9I6+TXPuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDJRlQES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EywmFzml; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCbGFa503166
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGb3OAKHAE1yyRO+IKe2XZ30dzp4/YLjRoSdCH3llnQ=; b=DDJRlQESjIFuNyKl
	k5kRzn5+M3e93sSvxkkqq45B/3srqZe9zJXZVifACNYDIxlA2zk8EHg4P5lOw9TS
	2AyUibj0XZfyWZn+OzEDCwK82MpZf/kyLRtQ0Wf0gx7T4CHctCexao+pYbgbTonM
	VX7Df3fRFxTU0hOw3WlmCl/aLRHaSol4NgNiiJfg65WDghreBTxPqQ1gq+W+ihVg
	NNsE0hdC4wxrrm4PJiG5AlvaYGOFLrzBe3ahkoMusiTkNw4OMbujkg+Ir+XNbAru
	2J+xLr8crUW8LumVWHsZxQurWq8d6yzchDDZr7SbZ4ZdIseka+JjqrzfjwUyfApc
	K9vUnw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegus8e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:33:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfc66167c4so931061137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534021; x=1782138821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGb3OAKHAE1yyRO+IKe2XZ30dzp4/YLjRoSdCH3llnQ=;
        b=EywmFzmlfX8f2Cp7VTRX5klc55e/wFIN0CycIJwe84l2AVU/3J5RASO6G4he+iKHLc
         vG+hJWk6xl6lx4ObqhTT8sjEtgZqpKlTPhaY7bGmmdBQJtzakahU1zbKC+1EyxUmO+YG
         p169bdqW4fiabAGHUuX0aWdAIfmfq+xXOy7dzsWlGyjChHLvuW/KNbAj6mhirK4f9Vaa
         7Dp1tTH9StrNjMg4Yg2/Qks6zYuQtPjVyaVYaX0mH3ennApfCF5iBqsP5jgjFEsoSdtq
         rqA0hzezn7tCjRbdnwvOgasFBm2rM1Mcw+R/W2SHVzMjEKnOdgP4pGBX0nrlAQrxvAFw
         7xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534021; x=1782138821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGb3OAKHAE1yyRO+IKe2XZ30dzp4/YLjRoSdCH3llnQ=;
        b=I06HNlDYsOW7Wi3yUu+f38pVkVMIxlBO3Sdxen1YxsvKvwc6x15YOlSKOm/t2tGuBN
         3UnmvVUtChdI8s4lr+wM6eqlAzbVaUQBAWymbJ+09xTKFGDOiONiQvgoMMHMm37KPKtC
         y/F4Z+7WPXtPplaQzj1I4Py/6pVqx9uBovmPIOyHZ88dEmyfzVyOcnOhUlEy72tLVRQJ
         NVpf0LLgpUa14zuT6maCPgvXWLQAUuCeF/RA/r6Hl/oqNsT38H/JJ3wmA3lfVoqwmxML
         oW8aSlSV8AXNKirT1/yJ7idXSpfms55JFQJDrHHF3rTwg09yDLYLii82PKs/qaZgUJ6n
         3fuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ayg/EYEyT6cGoppmdER0ateNIGOW5ferMhCrE7J31NUR8M70fXqaJNKVEx3C1XoZbMYMrodp8GXqJZ9j9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdr+J0JNlcXStHv0mBeUtF31m+jO1oR3es6kSyMVKMITOTHDN0
	zXz9ZQGf+1FrermgueUHaqbd6I0YzeqDTdG/IvL8QQ3De75hseGliMZK+/Qw8E/rqrmz2ruODI2
	qQOPRDg1BUfcQ87cAjaTwGc/K2IM/mxkYvBg/oZ3oqhh2NyuI90F3KNllQcKA0d51ebo8
X-Gm-Gg: Acq92OEAE09YayOab/sPdFONYjqDXqZKuIyJuKtEPM+dSGpX49K8yCyPul+JLIjOGDK
	Py/AfEGKEHY89fqpO/XAK4CnN/FCrUK2cIaOp0hEMxdBgbg9Y+XO6LpaLX+2JVuiJBcCoOltjCy
	zq3it5nfM5t0SoavNx9juEwMBqf/hswDNIVBQ6REYGmXrYgjsSYphwR209/LT9bxswFsHRU4g33
	FocIiJ0oiHl9fdT7v7EnQx/0SPJZjSMVhSAqxYw6QTkIq3K1fiZuH8HFgz4SsNfSn3Yg6zhtJTo
	pMJBDKAu7vYhE7FKn+9V/gevtJagE1xJBr0JUTB4yk5FME6s9giKQ9Nr8rFmSIHI1jUQOzLn7eV
	B+oBoNceHJfcVG2IKfk0OMrdr3Wz6h4+bP8deWsPd+kvBUhi+dMatE+CLPeeA7EW6WiSZdrQ4xG
	x/VLrrtcz+IDN6Pw==
X-Received: by 2002:a05:6102:149c:b0:604:f849:462e with SMTP id ada2fe7eead31-71e88db5afamr7325421137.25.1781534020433;
        Mon, 15 Jun 2026 07:33:40 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:604:f849:462e with SMTP id ada2fe7eead31-71e88db5afamr7325358137.25.1781534019875;
        Mon, 15 Jun 2026 07:33:39 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30? ([2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2cf5d9sm30916812f8f.32.2026.06.15.07.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:33:39 -0700 (PDT)
Message-ID: <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MSBTYWx0ZWRfX6p77AuJNg1QN
 LyfyracHGDPtx8CSmzWLI7eY1JVNtFjdiuYC1Yw9EibHYVFH954bDYO8UUi+UvsIMjjmnRACimN
 w37dT1Di6ce+ziDnJoR/1NSvFvwRRABLh551vaOT1N6YKgH0CFBo1eRe3/YzSzgP3MiBhk1bb5n
 21Yb1KOIGLmQY00ERXDRi9jb9NNdB2Bj6y68pbUL9LvQpM97p0ONMSJ6sgbCYbg9g9qgZOc9KnF
 UY/hKlyXwgl1Sfm/uK3SlbCQ5NSgiLmUkpDe7EhqLX2wN1lksAp3HnVzQ/2/FqMPkZ63brMNQ3h
 xMvcpFnYNeEV/Le2IsxRwpNXcQ0Ki5OiKBYwL+Radk/5MmEDER9V5I8iyEObh9Stjwqfb+xstLQ
 getzVVP4jJyizU6p4m6Tb8vfb9ooXc9yr/5wcUj3SU4gfQgmPKVUmBdlsqHNnazt4lWIOl8gkqA
 xIuJgOCIPJUiDpZun1g==
X-Proofpoint-ORIG-GUID: 7RDUBDSC8IJl0BUtNpixVcxFv3XpvhiB
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a300d45 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=y33DeBKr3xWxJ8ptnqUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MSBTYWx0ZWRfXwXO7litj2QLY
 MqRjP2c4GkWWCZT9nnR1K6StItXrR91RVm6OepzKfsArBixIlVeFDBfgjCYZ6XmYFqVwt3E8mAJ
 zyfB336FWSLZO+tVm8P6+wpiTTn7ZYE=
X-Proofpoint-GUID: 7RDUBDSC8IJl0BUtNpixVcxFv3XpvhiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150151
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
	TAGGED_FROM(0.00)[bounces-113201-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD68468736D



Le 15/06/2026 à 16:11, Dmitry Baryshkov a écrit :
> On Mon, Jun 15, 2026 at 02:30:49PM +0200, Daniel Lezcano wrote:
>> Hi Gaurav,
>>
>> Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
>>>
>>>
>>> On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
>>>> On 6/13/26 13:05, Gaurav Kohli wrote:
>>>>>
>>>>>
>>>>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>>>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Ack, will add why part.
>>>>>>>>> These names are matched with the thermal
>>>>>>>>> mitigation device identifiers
>>>>>>>>> populated by remote firmware over QMI and define
>>>>>>>>> mitigation devices are
>>>>>>>>> exposed as cooling devices.
>>>>>>>>
>>>>>>>> No, -names correspond to values passed via DT, not
>>>>>>>> some remote firmware.
>>>>>>>> The remote firmware should give you interface which
>>>>>>>> is explicit and does
>>>>>>>> not need such properties.
>>>>>>>
>>>>>>> thanks Krzysztof for review, We need tmd-names because
>>>>>>> of following reasons:
>>>>>>>
>>>>>>> Following Daniel's series [1], the thermal framework supports
>>>>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>>>>> cooling-cells.
>>>>>>>
>>>>>>> 1) The thermal framework's cooling-maps reference
>>>>>>> cooling devices by index (for #cooling-cells = <3>).
>>>>>>> Without tmd- names,
>>>>>>> there's no way to know which index corresponds to which
>>>>>>> TMD, as firmware
>>>>>>> may return tmd-names in any order.
>>>>>>>
>>>>>>> below are the changes post new thermal mapping changes:
>>>>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>>>>
>>>>>> names property are not to instruct drivers to register or not to
>>>>>> register something.
>>>>>>
>>>>>> I don't understand the problem and explanation in the binding is
>>>>>> basically non-existing.
>>>>>>
>>>>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>>>>> which index means what.
>>>>>>
>>>>>
>>>>> thanks for review, shall i use driver data, which is basically
>>>>> pas data structure like below:
>>>>>
>>>>> static const struct qcom_pas_data {
>>>>>       .crash_reason_smem = 601,
>>>>>       .firmware_name = "cdsp.mdt",
>>>>>       .tmd_names = (const char *[]){"xyz", NULL},
>>>>>       .num_tmds = 1,
>>>>>
>>>>> Is something like above acceptable? and this will also help to
>>>>> filter tmd names as well?
>>>>
>>>>
>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>> (node pointer, id) ?
>>>>
>>>
>>> Hi Daniel,
>>>
>>> thanks for review.
>>>
>>> With id only, in this case instead of taking tmd names from device tree,
>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>> cooling framework with id only. Please let us know if this looks fine.
>> May be I'm missing something but:
>>
>>   - The QMI TMD returns a list of names, not ids
>>   - The QMI TMD may return the list in different order than assumed
>>   - The cooling map index points to the name of the TMD in the DT
>>   - This name is used to match the name in the aformentionned list
>>   - The index in the list and the id in the DT can differ
> 
> Would it be better if we define standard indices for the standard names?
> This way we decouple the actual firmware strings from the DT.

I don't think so, it seems to me too fragile and prone to error.

It is a remote proc, an external subsystem. The contract between the 
client and the server is the protocol. The protocol specifies the 
identifier as named strings, the TMD names, not numerical identifiers.

When asking for the list of TMDs, we get a list of strings. But as it is 
an external subsystems, may be tomorrow someone decide to send list 
ordered alphabetically, or per number of states, or whatever.

With hardcoded id the QMI TMD clients break

>> Krzysztof , I don't get why having the TMD names as properties is wrong,
>> they describes the existing TMDs on the system and the cooling maps index
>> points to the one to be connected with thermal zone.
> 



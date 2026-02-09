Return-Path: <linux-arm-msm+bounces-92353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP9IBWQ/imlGIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:11:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A507711458A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 125D130058D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 20:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F017329E50;
	Mon,  9 Feb 2026 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUctPnGe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbGF/6J4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F829BDAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770667872; cv=none; b=MEDos/4w4QZhSMCrAF+cTF+SK4Jth4oyg+inEYqb8lUmib4Gqyx3QnhiRi8rcPee+xKPC0vS0pD3VqrlkNGQf5JHbHnjo+iPUYZtfjSU4uis5zV1DcwahVqAqh4RoNerwUBJIbm4Xw542LZYiqS8v60Bp6Hq3n5/qIzvVrvU92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770667872; c=relaxed/simple;
	bh=fjQyBAxABYnsO50mltUfs7H9ApBzErpw/KcD0KJMF7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMslZkaD/q5PVnCES6qH+vcoTEJg2uNGkktbhxP0RWCnXJ+WVPmDzuAhfWQIWrtw1YSzBRer2m/2IXP/TMF0ZSl/fyMnWeOxbbZcEhDDzWptC13XlTx+ccsCTFbfFrlmO0gQu12vJQxrb/XyS2De9FuerYx98oGACARyS5yXpYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUctPnGe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbGF/6J4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619JRhpB3349550
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 20:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppqvcaXrHUsmWddFWzepuOB36WFXUK3MUMjHqdkSFTM=; b=MUctPnGex54TOF8O
	kYN5Lg1kglVyuE3xCaMteZTqkMARjXgUkLu5dtclWCcBDT/tDtMBm+6PCP3oWKxd
	/grE9Z1Ic2xTaTsyTQtmjtG+Q5TlIEMbyXsSeOaWZoxgAXFZ9p1BhgOS1kf8A1lr
	fgtoPZkHEkERFEF7atBS0lTw1xWOlqJsYxsicEiWtQtv+kbGfZE8YGts+Xo3bjZB
	o0eB7QWVnRFgdJlOmuWMFvUJNAljGFfMNndVkp5he4yMFFGevI+o1FmYRRiyQLt3
	bnA4jiHtzJ/rU0GcfEOaMAEpfv/bhKyZ33UWNpZn0Y3dUAiGzzTPwDCyAHun0aG6
	doMNCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy2ufd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 20:11:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a9638b0422so14728485ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770667870; x=1771272670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppqvcaXrHUsmWddFWzepuOB36WFXUK3MUMjHqdkSFTM=;
        b=KbGF/6J40lG4fyG2OGUfsyDwJkFcUE/zNuBHAAy2AODmkq6/Jufhk2Ax0czf5UtrXQ
         fZxLxqM1YYj5e45sCNl+SwKXO5Dc8X9QqsHIXYwOXsjctq8r/5xeUCjaiEGkaE0Q3Gj5
         Y47qff8BAtzDsO+/SNC23gsFN6R+ERRlkTL95awkL9a6pb7nKe6LKT8T+kORk5SEiEqo
         pkA/mxmHLwsjKsNLNN/MNKJk+luGBk7sZzMxIQ6fFRv/6uTO3ybhKS+l9GWnfjAmcT4g
         D6fptg0BcjWIMziOSd/T/sdkuJ9lmFfq5eEoCl/JtQFjVQJEdc8kL+Zh59AfTfnfHNTW
         doeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667870; x=1771272670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppqvcaXrHUsmWddFWzepuOB36WFXUK3MUMjHqdkSFTM=;
        b=akAB+OiBhlCrT2W1q6AixzvhpxARB0QR70pIpdtrBRHSPOJ/p4z+MRljwtk98VUvWo
         b6j2emgWDSJHqJi+avKOzfkR030kFEiUkCWXAGT411YR6+Sn5RPGjDHwlpykXBi+05Vd
         /HIvBPPiFxhxlIDIFVxG+VzxYsm1ZsnyhK1zZ0RrkmmwewWJXLGdGow1nUdIZ8tVT+u9
         HIkmYwKfkNJJmeSKgXBCkV3fwqCn2JIJ+1mXkw24Gakq62ygHxf5iDrIq0pcAW/SWAVU
         +MpdPGixd1nA10ijMt21Rqk5HjVe3XnX1IX9WMbjClL8+l87TI19tp7LnlvrQR+p7sXb
         zU+w==
X-Forwarded-Encrypted: i=1; AJvYcCVQef4VcDLv+ojP2XRwV4FwGM4AVz3FHnxjHwkMX2fU/nVItP4kRcq4Wcyatfh4HO8tfYujpzlrDOfiIMlu@vger.kernel.org
X-Gm-Message-State: AOJu0YxjhUWwERk/Rj09s2fWiV/DFj6+KDB9U5VINUhAzaWana1peV8J
	RzWeziJW++nEvr7nHCS4GSw+R70sn9zW/SltVvugVz7MaBln0cUjXm8qtnu7il/HClB4cBzpkuI
	KbAi0A68GEe/zKTpq/V+xk3aRSx2LgnDCDedwtwFBuITuTLiE04vgWkRpF59HKtmWA/k=
X-Gm-Gg: AZuq6aK2Ktqw+FFXQk/mST5szFFBPOmn+b8GjNfTzzCo1AOWDfoewjocuY6ilzz2E4G
	EXM9qQG8XUV+egA7+qZZRXYraikk6DDRwiOmhSCuuymwJDQArSvysLz9P6xJflFLVX+ySC4Og1E
	6ZrbKEdJfzQSLexO3QC1Ov7XeUGqaVYMc1zvpBM9a5+SfiIArjHw+WuPbSZ5WMrGw1y5yrFaMfJ
	pFhvMuNrou3+fn7asJPyex6ToU7NJ5WNs52yfQTsf9nYrZ5ZH0/ophtyCpvCPhETitvvn75pjqg
	573YyrD7ZtW0iuVVB2feHX0XhjFhjS4P7/g7D+tLuZ9dMjDI7yfhqsfasswcTr4T5cMECKuLS2S
	V1uIKAjiV8auLcxPL7q/FaSp+I8gImOffiiQdWI2tfLZSzfdcZQnR9oMOdEtquxmhdzf/gSwnp4
	9EE60Pitw=
X-Received: by 2002:a17:902:cec2:b0:2a0:8e35:969d with SMTP id d9443c01a7336-2a951821446mr129161455ad.39.1770667869796;
        Mon, 09 Feb 2026 12:11:09 -0800 (PST)
X-Received: by 2002:a17:902:cec2:b0:2a0:8e35:969d with SMTP id d9443c01a7336-2a951821446mr129161135ad.39.1770667869046;
        Mon, 09 Feb 2026 12:11:09 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c71edasm121492045ad.22.2026.02.09.12.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 12:11:08 -0800 (PST)
Message-ID: <b8062f41-ea6a-473c-bfa7-7e795248946c@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 07:11:03 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tee: optee: prevent use-after-free when the client
 exits before the supplicant
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Jerome Forissier <jerome@forissier.org>
References: <20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com>
 <CAHUa44E4Htg9zEMY9XtkMsPRJq+13mq6kSd8RUznHTRvXVXKVQ@mail.gmail.com>
 <55546b03-cbe6-40dd-b794-b2e81efde33a@oss.qualcomm.com>
 <CAHUa44FfowG=GpgLcq=sp_TqRArJtf0_V-tsJY11HH+FEA6u+w@mail.gmail.com>
 <4c9e4f5f-e0f3-42aa-852f-064f4024af26@oss.qualcomm.com>
 <CAHUa44EhaztJ+5piu0c-HQbqZFX47uLPJ+VDRp=Bp6BMeeARAQ@mail.gmail.com>
 <b8086bfb-f240-4115-9ab0-18509775932a@oss.qualcomm.com>
 <CAHUa44GhTy=TWAuG7JY_6jjWG-uCGnLyZRn1JhGWgaWt28cH7w@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44GhTy=TWAuG7JY_6jjWG-uCGnLyZRn1JhGWgaWt28cH7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H-CPWR8ABpHckGX-QuVkrH2yaAwp3cHr
X-Proofpoint-GUID: H-CPWR8ABpHckGX-QuVkrH2yaAwp3cHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2NyBTYWx0ZWRfXwkvklRZT0XDR
 LLwqM8tjOXyGN5o+kY3gzLrAGm6V8ylX50hQFliMisyJ7aV3ZkqSz8XXVzXSEuhmOCMjSpW0vqx
 6JTgl4xqMDcihf5RTkEj69ZB6woSRkuPoNk++ugycvY/XlSlpt857Eg/TgNlFApgkGKu9e5hH0Y
 fA25j2pZZnH8YOV7j9sjtniNSZafkn8HFaNEAp4ORKMbQgzsrSFRGcnG80xxUjKINQR8GN/VKOZ
 AB4T8TuSyI/LpYE7GiM/BSIVfLXcr8WfmQZTiv8DNRN42A60D/oqipthRSgPupF0jSSWg0+1oBd
 CKXoGktAn2rqaPRbHhIAwdJeEYPiBkb4/yhnhg46YDuixoR8oWugxKmS7ibXqV187qTRIn0+5k2
 O0s2J9gIpNZB0UcbnPmfNmOjy+zO7hhAUvW2alGVF4PigXZ7lD8JuVKi/txE+mfMNNev/MJq7tf
 7XO6BtHYzgNzuO8gt9g==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=698a3f5e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6BXAE0hZp0f7nhlt_LIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090167
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92353-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A507711458A
X-Rspamd-Action: no action

Hi Jens,

On 2/6/2026 7:54 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Thu, Feb 5, 2026 at 3:13 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi Jens,
>>
>> On 2/4/2026 6:46 PM, Jens Wiklander wrote:
>>> Hi Amir,
>>>
>>> On Tue, Feb 3, 2026 at 11:56 PM Amirreza Zarrabi
>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Jens,
>>>>
>>>> On 2/3/2026 5:59 PM, Jens Wiklander wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Feb 3, 2026 at 3:09 AM Amirreza Zarrabi
>>>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Hi Jens,
>>>>>>
>>>>>> On 2/2/2026 10:36 PM, Jens Wiklander wrote:
>>>>>>> Hi Amir,
>>>>>>>
>>>>>>> On Thu, Jan 29, 2026 at 4:22 AM Amirreza Zarrabi
>>>>>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>>>>>
>>>>>>>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
>>>>>>>> client wait as killable so it can be interrupted during shutdown or
>>>>>>>> after a supplicant crash. This changes the original lifetime expectations:
>>>>>>>> the client task can now terminate while the supplicant is still processing
>>>>>>>> its request.
>>>>>>>>
>>>>>>>> If the client exits first it removes the request from its queue and
>>>>>>>> kfree()s it, while the request ID remains in supp->idr. A subsequent
>>>>>>>> lookup on the supplicant path then dereferences freed memory, leading to
>>>>>>>> a use-after-free.
>>>>>>>>
>>>>>>>> Serialise access to the request with supp->mutex:
>>>>>>>>
>>>>>>>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>>>>>>>>     looking up and touching the request.
>>>>>>>>   * Let optee_supp_thrd_req() notice that the client has terminated and
>>>>>>>>     signal optee_supp_send() accordingly.
>>>>>>>>
>>>>>>>> With these changes the request cannot be freed while the supplicant still
>>>>>>>> has a reference, eliminating the race.
>>>>>>>>
>>>>>>>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
>>>>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>> Changes in v3:
>>>>>>>> - Introduce processed flag instead of -1 for req->id.
>>>>>>>> - Update optee_supp_release() as reported by Michael Wu.
>>>>>>>> - Use mutex instead of guard.
>>>>>>>> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com
>>>>>>>>
>>>>>>>> Changes in v2:
>>>>>>>> - Replace the static variable with a sentinel value.
>>>>>>>> - Fix the issue with returning the popped request to the supplicant.
>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
>>>>>>>> ---
>>>>>>>>  drivers/tee/optee/supp.c | 122 +++++++++++++++++++++++++++++++++--------------
>>>>>>>>  1 file changed, 86 insertions(+), 36 deletions(-)
>>>>>>>
> [snip]
> 
> 
>>>>>>>> @@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>>>>>>>
>>>>>>>>         mutex_lock(&supp->mutex);
>>>>>>>>         req = supp_pop_req(supp, num_params, param, &num_meta);
>>>>>>>> -       mutex_unlock(&supp->mutex);
>>>>>>>> -
>>>>>>>>         if (IS_ERR(req)) {
>>>>>>>> +               mutex_unlock(&supp->mutex);
>>>>>>>
>>>>>>> We need a way to tell the difference between an id not found and an id
>>>>>>> removed because of a killed requester.
>>>>>>> How about storing NULL for revoked requests instead of an err-pointer?
>>>>>>>
>>>>>>
>>>>>> Not sure I'm following correctly. Are you expecting supp_pop_req()
>>>>>> to return NULL instead of an err-pointer when a request has been revoked?
>>>>>
>>>>> I was looking at it again, and storing an err-pointer as you do in
>>>>> this patch has the advantage that we can tell whether the ID has been
>>>>> revoked or was never supplied. In the latter case, it suggests that
>>>>> the supplicant is doing something wrong and might as well restart in
>>>>> an attempt to recover. So, please keep using an err-pointer as a
>>>>> placeholder, but we must be able to distinguish a revoked request from
>>>>> other errors to make sure that the supplicant doesn't restart due to a
>>>>> revoked request.
>>>>>
>>>>
>>>> Understood. What if I switch the stored err-pointer to EBADF instead of ENOENT
>>>> (which seems more natural), so it doesn't overlap with other supp_pop_req() error
>>>> codes and the supplicant can reliably detect it.
>>>
>>> Any error returned by TEE_IOC_SUPPL_SEND (or TEE_IOC_SUPPL_RECV) will
>>> cause the tee-supplicant to exit. Even if we update it to ignore
>>> certain codes, we must also consider the installed base. There's not
>>> much tee-supplicant could do with this error, except logging it. But I
>>> don't think that is very useful either. Unless the tee-supplicant does
>>> anything wrong or if the device isn't working any longer, we shouldn't
>>> return an error.
>>>
>>
>> The direction of data flow in optee_supp_send is from the supplicant to optee,
>> so the only way I can return meaningful information back to the supplicant is
>> through the return value. I suppose I could simply ignore the revoked request
>> and return success, but it might be useful for the supplicant to know about it
>> in case it needs to roll back something.
>>
>> At this point I'm out of ideas :). Do you have any suggestions on how I can
>> inform the supplicant about a revoked request in optee_supp_send while returning
>> success return value?
> 
> This became a bit harder than I first thought. At this point, to fix
> the possible use-after-free, we have two options:
> 1. Returning an error code: tee-supplicant will exit
> 2. Returning OK: worst case, tee-supplicant can leak memory
> 
> During reboot, neither case is a problem. During normal operation,
> it's annoying if tee-supplicant exists, but you still need some
> privileges to kill the client. If we return an error, it's enough to
> update tee-supplicant to handle that error case, and we're done. The
> advantage is no added code to the kernel.
> 
> I think we should do what you suggested and return an error. This will
> not happen during normal operation. We'll fix tee-supplicant to handle
> the return error properly. tee-supplicant doesn't care about what
> error code it gets. If there's an error in TEE_IOC_SUPPL_SEND, it
> knows that no one will receive whatever was sent, and cleanup is
> needed.
> 
> Sumit and Jerome, what do you think?
> 

Thanks Jens, I'll proceed with v4.

Best Regards,
Amir

> Cheers,
> Jens



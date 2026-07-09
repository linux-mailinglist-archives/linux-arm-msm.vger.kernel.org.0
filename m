Return-Path: <linux-arm-msm+bounces-117839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jWKpJnU0T2pLcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:41:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44E72CCE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:41:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q2fsT9wP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c8WAFPMZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117839-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117839-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A17A30054D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 05:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B783A875A;
	Thu,  9 Jul 2026 05:41:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53D3E47B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 05:41:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575667; cv=none; b=lxmEfqAarISUSP3AxsfUD0/wvRkJfzDNaU9hE5tthHX6/xvdIaGCWywEwN9H9ptxEwPPkv7CMI5Ix8hGQFAHAToNxy60Sv75se2CAGxujryVeT8nyqK4IWP4LOZnTnmJSUKYoiLVGPHakueb9LfBb9ySGNQX6BtlEX2nP2Ia3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575667; c=relaxed/simple;
	bh=quwu+cde7ba9hLMTE61fx30w8O+wPuSVUmWVKkQQ6Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjjjKkMxDvBVy5vOowEnQ1oQ3WTypBMGtEmv9oib9zVrcKllEcSh122gQLSLizdKoXI5asBXEaW3v7691IVRV6OjCi4qpMKT6W3SIDi6qpHgHNKZ7xBzkFZ6W3HOKezpbLppiEfU059xq7fDIPmxBHE/bdYZxSoHzzHNFo0Ht1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2fsT9wP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8WAFPMZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8nIm039788
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 05:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZLxGrfv7jXMYi1H20L/RrftdACB9MvmvKJ3YlkaKUI=; b=Q2fsT9wPtj5O6eRf
	E8YJCbyH/MIPaL09nP/thMyB4RchZvgx+2eccLjmGsS1+nPAJ7dyc1mG+TvYYI9X
	L0FeCJrYXfHINLWu4iZdPSXh4/CCtF4mTNWPYloLIJTf9+hFmw/9q4zD6/dnWFXr
	Y3dq72GI3qhfIwgCJSEr3+oNJxmhtVPv5ROaGfyqYFz0C+tjXiVZsduiV8k9IfjX
	+owwq/+zQlaegU7lx6y2sRPsacyA0Li4fQEJ1A4Wb+9DtZVViP0X5Mb7e/1F2hk1
	I9luw73dq8OwQb00etk/lfbwmT+Lu6GBRP+4DIRJCFIiQJJ45ullW/QDvHEJc5j2
	Gw/R/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsahxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:41:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so19115561cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783575664; x=1784180464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZLxGrfv7jXMYi1H20L/RrftdACB9MvmvKJ3YlkaKUI=;
        b=c8WAFPMZvO3N8GxXsjfTBvd8CzHXcyG/CRRBp2lGc4urhXs6OcAteuGhkkKSi376Fa
         OwXwkt0j6g5kqyL/pqJYLpqOtd/IPSrd6rzu+YlbCPJVjEtwX/R0/cmHdLxhJrtJ6R7q
         ApHaQb85Jedkdz4xGfISX73+s4JHBIgem7p5KIxOo6PdNPa6TYpscrClNRCi5cGvjGix
         VT6xQgOKQRVP9bKmuJN249SpLFXEbT42mcvDI5YVQGmLvdoeFUrMtNNIkvHGlgfCNon+
         dE/VtDhu+01rdsJNa+UJQvWmm1bxeGOPlkMRAZ6yGeT+YQxYhXjQP4JKxgIYYm4gSw9T
         NtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783575664; x=1784180464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZLxGrfv7jXMYi1H20L/RrftdACB9MvmvKJ3YlkaKUI=;
        b=Ou+wIJxGa/G9/aQR4EZPO/ZG7j1j//YHXwkjgRMag886D0v1FqfttflNWrRwoehW9/
         STAgIhUzUdl7+Q0iLCt+RspIrn7M41hysTW2KYhpTSOjnMbv61qc88DPCm/c6cmEKcTQ
         tsxCcvwQSNYM2I7ykzD5Ss/LX/u9VXvkWIb8P8ZaQqcp0FSW9m/dF6YYr2RfPNEm8XnA
         4evm1hOykAEE3y53kThKLKrSIfoUHjChvgnh31Kdo+ilVNj3kvWX7dz1RLrv0vGaWfyj
         pJdzpuzBD+wPuZbuiapQDTPBg7mWztvmtLts+MUbDqKRsvVg8dPdOFaCCC6PYKbElUEZ
         WVfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPAyo7kwrNZIm9qB1vRnvy1oi8X85IGh2YmiSj8YF0gqZaF/U6ps1dyivOd2KQmHL/m9id9jHfnY7yGgoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbijQc1cE0uYn8d7oVrbXu5KOYTZlEiM67ac8Q4IW36u3soe9
	WedZsQYmqaDSRDYDQAVWnWZXdJQTWdIE6Rh1MNec28yM+MLol/BuF7fBku7StNZT7/nPybV1ftV
	fugUtvkI3Wlj/beH7A7i1eyCOmY0OhddPgU0t2izK8Nengc6OfZPxeyg4JMLWZhO9+a5z
X-Gm-Gg: AfdE7cmu67QPc2UJ68i/CU7asuyAbyBUM3AiDIxhT9OoTEODP/VDSj/lyTwGLiW9uR5
	E93hPnupNnS9+37Jf1KPvoQt6g43+cCF9PNEwA1aJF0Ed3k8QyUHjqrwam4a+rBilKtWZi7MY9M
	XzXBw19SwTQNB/wLuKDmTuHwliuDgxBg2t4OZ3I5hk04oUdIPSEUXn3hFiRfor74FMvhMrlzqwu
	N+61gp7NJ1zcwjcWYBSaCbtYgNxZ46G+NcwsSwVzqMTDt3mtxHFW9Nike3G0LD1lR4A1viVcgeJ
	Qjn3gjw6dMlvoiC2wjMHJSfE1Pi7QHx7xwa6SW2bA8ObGc5rc3w4F0Rjsr8JYZW/DSm1WqsJTqP
	zP5YgAWwfagei6e7xxnt/4Bcx2N0L8WigNcYSHniPf8mK0y6dKn4gEbwvAiNzUbgXPA8xSSUuS0
	dC8v97MSs=
X-Received: by 2002:a05:622a:5599:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c8b2e3578mr59044061cf.27.1783575664282;
        Wed, 08 Jul 2026 22:41:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5599:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c8b2e3578mr59043881cf.27.1783575663835;
        Wed, 08 Jul 2026 22:41:03 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e2936b42sm64059766b.21.2026.07.08.22.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:41:03 -0700 (PDT)
Message-ID: <a80f9d60-e1be-45e9-b601-c47361591f52@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 08:41:00 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MCBTYWx0ZWRfXxSA5+sM37nPH
 wbefNSaALIYH7NtJzd//4/PRUyBoG0OJGud0PS9xt1KsFneuarHXk3QhsC4A63aXiDa5ap0rw+O
 tBHEz8z4DxQwHaLVJ8lNfT5BF+uTgGs=
X-Proofpoint-GUID: shoXkXzeFVXlUnae9blFQ0ftPi9mCg8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MCBTYWx0ZWRfXwSIlwpQnnZ4Z
 dCnnE+lzS8lxp7SH/X0vfnhe4FKsONvApQldy6SxhZP5JsDJ1497AJQ6SetVyA7Di8gS+RLOd2G
 otsLt7YKpg4yqjDSnhyF0HHl9QM8DgTygB7AG7oBudX1+TekUTVkEQtLEF9b7j2MdTzaUYdXlEO
 xJpO4pZyKCpFRyoRSSIiNj2o9dSNm0CvSun2UIYbYKELNdbeouT1AqqPQPmoA3ZJ7fLWw9KZAbh
 YO/FnzG3+D8NOT7UZP0fhml1iDbEdtB8J5k7uCi3vInIJPLprkTq6h46zdd2JHGceh0B6YE/1/c
 13mSp+MQdovB+bKA5MVDlaxAGzFgbJ9eUqUAlEE+fe/hgqXe1QeZ3GkekT6gwawPFkciBjnRdhx
 wuVNn3k4YJ53san8pvu5o0dHE2CnEupH42WQGetmCmUfh44lBn40vMyItTHMGgag3qRRrogEJeK
 1/7Vtc8DVTzmx+KFFgw==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f3470 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CVLRNxM7UcJW-wxj-VEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: shoXkXzeFVXlUnae9blFQ0ftPi9mCg8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117839-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B44E72CCE7



On 7/9/2026 12:21 AM, Bryan O'Donoghue wrote:
> On 08/07/2026 13:19, Konrad Dybcio wrote:
>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>> [...]
>>
>>> OK, I can see how this thread is confusing.
>>>
>>> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
>>>
>>> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
>>>
>>> OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
>>>
>>> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
>>>
>>> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
>>>
>>> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
>> I think this needlessly increases the amount of combinations we'll
>> have to keep supporting down the line (with a ton of compatibility
>> boilerplate code)
>>
>> Konrad
> 
> Fine.
> 
> Lets drop the bus idea then. I'm happy to close the conversation as peer-nodes.
> 
> camss@{
>     existing CSID/IFE
>     IFE SID stuff goes here
>     power-domains = TITAN_TOP_GDSC, IFE_GDSC
> }
> 
> csiphy @ {
> }
> 
> jpeg@ {
>     JPEG SID stuff goes here
>     power-domains = TITAN_TOP_GDSC, JPEG_GDSC
> }
> 
> camnoc@ {
>     modelled as an ICC provider and consumed by
> }
> 

I vote for this as well. For me having resources at parent side which are already referenced counted, is
not justifying the complexity we are adding. Another argument is that i don not like the exceptions, either
we move every hw block as child device of CAMMS including CCI or go with peer-nodes.

~Gjorgji

> ---
> bod
> 



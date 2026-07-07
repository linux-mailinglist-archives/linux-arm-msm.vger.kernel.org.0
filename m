Return-Path: <linux-arm-msm+bounces-117161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CyolEDunTGqrngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:14:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9E718551
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DfbDOWOG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h8zwXRpc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F173089E63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6D02F7F11;
	Tue,  7 Jul 2026 07:02:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0872B35BDA4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:02:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407761; cv=none; b=ST32L6Zu5e5rQe0qc/QefA9pzeL6ymMsM5Y483dTUiqCF0CkcCBqSBcIuuTFzbsFVrebA5OqBrZmtjiauN82PSXHJzKlIzdbBKhbhgd8So2Ks8ewRfBhv9fKlpO6C+eBg0xINnBl7C/WNsjZwYDFEmxxCViDDKa4KlmmH/J9pXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407761; c=relaxed/simple;
	bh=jl83pEmrNHAO9lFjv2bO3JFx4Sg2A+9IFEDUgOi/Lkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzoAe34cUhuY2HjjMJ8qC39ozzPPZkciR0Hx2l19+CluCEw0Jj0h2CiuIDGBCLfvJZ4b0EWwPMp9xUK9CIDoLi4LQ8l2Bsgvavhk5qPMpEEUXb2SnkQ3+U2nFqIV7Rlw4EhjkeM43JDyGnJexKznesJEBM+YKLZen+zDVaT9tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfbDOWOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8zwXRpc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749Gnk2499136
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qK3xL2jl8ebZt5swKuGJNP6ZXB3JUsVz/zPHOxlYvAE=; b=DfbDOWOGHhgzGyvQ
	BPWt0YefggapcaC+j0nI1TgdW40KO5qcdKGEvuiVuMSPfHz15m5kRmw/s/OcTNRz
	8CfiGJAypmP7jSo7FlHm4EuJ0uBtfPTfQ80lTUBLW3Q/BJItnIGHd7uupkr5QVAa
	11BhU/VbFzARBI77crz0pNfH96jEG+AQqKNeAK47oE7dUy0B6EJ9QuJQV9m6JagJ
	rNz3oJXv+xDHeGprPBxBGctymnyqVekFdXfgcdsz5sGMuL8L/NT1EohhvXatlz1r
	mJKLFAUPuk0WQ/rgJXDcO+ESPvPEyEdELSFaKD1uZuLmOd4FyKTXYPOFN0Uid+/l
	ndfeng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsd3nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:02:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a298cd62so3481737a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407758; x=1784012558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qK3xL2jl8ebZt5swKuGJNP6ZXB3JUsVz/zPHOxlYvAE=;
        b=h8zwXRpcLtI4j0fjHs3keZliKt6NqD54XI4SYBBenVf/zrPxc4O/J7FWfZbwQgGpZ+
         UlGiQ5X805kfbmlobdVoYTeROEwgvau7ttMECTm5SlOYI1PHelyi3yJexIHQ6oX+dX38
         rXMTp8O9yjCqJKSmp9JPS5Nl/FRhiyAsEbzj/dNW/ZyGrhO6RmPtcazgqRafLSTp31YN
         toJe3EozITkdeu9rx94PPASD1qN2RYK/yljvyAoMhOpkD6HgkhS/9umxB6whXeEzhqK/
         xAxU/Vf9d+qt4bPjpuCr5NEtjPlDbD9Dl047OQe3crJeH0oPlgsGgMeIj6G2mCddxbFl
         futQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407758; x=1784012558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK3xL2jl8ebZt5swKuGJNP6ZXB3JUsVz/zPHOxlYvAE=;
        b=R256W/aidhbQbUwAkwLXDmdiLnZLg+9oQ5i+6cG80muceMDstDDgxEzWvsxrO/Uy39
         OnG5DpR26K/LQRlKowgwL9VgsBqCPw1uqnPrRqfn2t3q503M/eDaNQhVpkXL+kQxX80+
         xcjuCpVwp5dtGNkj8NtGxiS4TdsFaKwcAHlZV+xkWFW1CpWw8fx82chQvwG9XsZm5C0+
         2HMVK+rQRqBt+io0f5SH0pACBTLJz4DIMB8D3JCIIoNEGUTZOxkALZR1BbftagGRUDtc
         yNuZbWUOIaR2tn/1bKvMRg1NUdNltBsEx0e3TEINhPfYBQySfYcvAHTLUxTObw+2ZABu
         NNFg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1uhKh19nCE2dkOMwEZ24KBxi257ZTrxUNwdz8WAbFiifXKwU0cyewLlZ30Z1/M/IfGQU1y8P9lnXU+Ce8@vger.kernel.org
X-Gm-Message-State: AOJu0YxktimefHZHkLWwFda2pmSmu0XbhAdLCv9nrTDRsiRYd5C5082k
	j3qgU8rJryqY1Rwe8fjkVPP+SW+XjatEEfWrWaSxMAkxmrC+BS4ssn6DuJtkqm+Jle1B40cXKT6
	yWzuIXcx7QzLw5RtxlVKK8EBnB8FQls1j8iUqWhPfrhZhP8UXfNwcuUqP4+llZnA0yE0I
X-Gm-Gg: AfdE7cn6nMVwZXXxqocbwncdzusGlUVY6VbGl1AlAr4F8gnQCjUm7l+t7DdnMC83rFf
	eO8zL0ErAfo8u8qhjfO3DnM/B2sgitiZb9XlnJQi1T5y/lBBaTpy7s4hdmv3OTCG21nCHnzGu/d
	3XhVHAo89RWsdHgNMLXAnesQVTmyLe9kZy4yU73AmsUMSzsqdkTzjgqJTRaUV2YZLOCT5VuvYin
	5VnI9g3SDk7pLtq26RskkZR0LI7y9YiaMUv0VLvOh8LFTocvE5JNU4podIDT9W3yf+H7kVuKDSt
	v5dKGSiaove+EnlJg/lhAnHjJjYyMqn2t9n0OJQFYbcJaZ8fqhB6r3g3V8Yd3zPTNuGdUgj/HWR
	hBS2TuGJ/lmVH9tVfMppGL/QcUddd3w/tqf0BkO/SFQTe
X-Received: by 2002:a05:6a20:939d:b0:3bf:f795:f0f3 with SMTP id adf61e73a8af0-3c08ef55bb8mr5389213637.54.1783407757788;
        Tue, 07 Jul 2026 00:02:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:939d:b0:3bf:f795:f0f3 with SMTP id adf61e73a8af0-3c08ef55bb8mr5389153637.54.1783407757293;
        Tue, 07 Jul 2026 00:02:37 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm4912010c88.12.2026.07.07.00.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:02:36 -0700 (PDT)
Message-ID: <7e4765be-397d-4efd-b8bb-5e990addf4f8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:32:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
 <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
 <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
 <r23uskjcu2ui4hgviei5pyv2jlnz5bhuqdjavz2ipoenwbya4y@gijmbfreckzl>
 <bd049402-6342-4b3f-a2d3-58d8dcda6ca1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bd049402-6342-4b3f-a2d3-58d8dcda6ca1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qYVgH0gdunB5qFl-elCOp6Jfadudsfx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NSBTYWx0ZWRfX9oNYrcWEjq5g
 YVncd/MoX8DUBeuQx/tDY2ygoVl70rD3+mjjgnnRjdfETFdcGsY33oHTA64ecYEj/+fq88OvxDK
 8sdmglJhoOKQ6gmXrGRgJnIzyMRe7Vog6gYJHR/fP4nb0m0IFKHul5gGfHxzfuoO+5tn7PMNa81
 tyeeCWEhc35/MVGKnjXt0aIaQhWZFY2dIi58PYWjMrqBJ2ass21CoDAGHPSQbfPK9wKRtC/wHHt
 tM1RAbyDOwBNrLG5YwCBbRSOUpEgKGoS9B6nHTA7wxlwvoSggBPBnykBocTCiuod902x7FEJo7T
 f60LO8VMhtyMCWsD81itF+BkyAk2p94hCnS/oQFXSjO3JvP7hNGNRDR+TE2ffQlceFtS7Q8swax
 dCYDW6Tp35/BZtw3aS6CNajOVr8BqnbPgmRFrMS1HQ2s6j6J2E0UA2+XuYWD0ki9IOBFGOAtPhm
 oI/4VzVjAHKJVYWJuRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NSBTYWx0ZWRfX41YEgAit2qWB
 tKpPWla4zn5ciYvsoGRLDHKqaMBvQpjAcS3i/4zv5FzUF2PSqe9WvAAlgNyS/hV41agGYOCBHWN
 0Aa097hseVcCbk8zgrFNbgX7qSmJ3a4=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ca48e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9AdMxfjQAAAA:20 a=YSFRvgiz6-i7QfQYUPUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: qYVgH0gdunB5qFl-elCOp6Jfadudsfx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sachin.garg@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:nicolas@ndufresne.ca,m:konrad.dybcio@oss.qualcomm.com,m:mchehab@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86B9E718551


On 3/30/2026 11:14 AM, Sachin Kumar Garg wrote:
> 
> 
> On 3/17/2026 12:17 AM, Dmitry Baryshkov wrote:
>> On Mon, Mar 16, 2026 at 01:37:21PM -0400, Nicolas Dufresne wrote:
>>> Le lundi 16 mars 2026 à 11:52 +0530, Sachin Kumar Garg a écrit :
>>>>
>>>>
>>>> On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
>>>>> On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
>>>>>> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
>>>>>> Encoder will choose appropriate quantization parameter and
>>>>>> do the smart bit allocation to set the frame maximum bitrate
>>>>>> level as per the Bitrate value configured.
>>>>>> ---
>>>>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
>>>>>>    .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>>>>>>    .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
>>>>>>    .../platform/qcom/iris/iris_platform_sc7280.h      | 202
>>>>>> +++++++++++++++++++++
>>>>>
>>>>> Is this really only available on 7280?
>>>>>
>>>>> Konrad
>>>>
>>>> Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
>>>> only for SC7280 because currently, we have added the support only for
>>>> low tier chipset. MBR rate control aims to improve the compression
>>>> efficiency of encoder for static and low motion scenes for extremely 
>>>> low
>>>> bitrate use-case.
>>>
>>> Without a spec definition, which constrained the implementations toward
>>> interoperability, this needs to be made vendor specific. That being 
>>> said, even
>>> as vendor specific control, I think it deserves more documentation 
>>> for your
>>> users.
>>
>> What kind of documentation would be a better fit for keeping this in the
>> generic namespace? Frankly speaking, I think that the current
>> documentation is too vendor-specific, it describe the particular
>> algorithm, while the control seems to be more generic. However, I also
>> feel that defining it as "Maximum Bitrate" might not be specific enough
>> (nor would it show a difference from the CBR mode).
>>
>>
> Thanks for the suggestion.
> I understand that this functionality is vendor-specific and should not 
> be exposed via a generic control. Would it be acceptable to convert this 
> into a vendor-specific control (for example, 
> V4L2_MPEG_VIDEO_BITRATE_MODE_QCOM_MBR) and update the documentation 
> accordingly?
> Please let me know if this aligns with upstream expectations, or can you 
> please suggest if there is any other preferred approach for adding 
> vendor-specific controls in this case.

I discussed this with Hans during embedded conference on handling vendor 
specific controls. His suggestion was that vendor can define a reserve 
for 16/32/64 controls, something similar to [1], for cases like this 
which seems quite vendor specific handling to me.

[1] 
https://github.com/torvalds/linux/blob/0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53/include/uapi/linux/v4l2-controls.h#L235

Regards,
Vikash

> 
> Thanks,
> Sachin



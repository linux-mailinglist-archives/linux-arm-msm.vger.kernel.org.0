Return-Path: <linux-arm-msm+bounces-109730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF18EfpEFWprUAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:00:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A15115D16AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC8CC3011591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA9A3C4165;
	Tue, 26 May 2026 06:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nj9xsrCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdTr6YC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254543C3BF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779778780; cv=none; b=Y24zTCagR/RePubY9PvhbHFkgHzmKWOaFLGGMAsTTFCtIOPBhsB0EqS2s+wGGgt5/Y0o3F2OItIMVe/RsgFWn27VrgJ85qMDNYsmirp8ExmfUdZh4TQMDAbkC8f2+mUGLTpRj5RaCSjhXd6p4+viB5HtX+uFZ8kVVTw1l5WPqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779778780; c=relaxed/simple;
	bh=VCpJwz59z00/2pf1W5HQ5EcorcdEfDt7JDMuLDgIWhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Kjubb6A6QPgM5zyFXTs1XGr3Jsz8LjPv6YUpTbh+rhIciXkGQ+W0Opxp16C/mGoqJapp9wO/VXQ85dndWD+1i9k2ZrOFlf0Oc/dJZyRYvghwVV0xiSLS8m4EZ71VU9hsT6bArwN9Z1pKXVEC3EYwYPRLKXWpBvbaC9c2Q2h5KCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nj9xsrCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdTr6YC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PNkveg2041057
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LVvCV+OUMP+eKOrIZZaZLZwCkJ9amVnJmT5FmWau3s=; b=nj9xsrCm/lOT11kn
	ZnRRjHjYdlK1r6DvR7j8lL0xfTKmOeoGT0ZCNpAhzRDrODPhARMSlJJSJYe7kBnO
	Ue4e0NBmlMMjO+f+Vd2xkdIXeViCcf8+VuheB7CZUrd6f9WrwZUx0Yzp5nwtjTsC
	uqOU/UqrQ5+RxR1JfJ4xFv8R5aCwSro4k7DnJh+1fkMqOsrebnwyIvak55V0FzoI
	XgT+UoPsvDibYhb2t4wMX4rGyZU4OpBOvn9whM5z9xMOHNHcp8ZspTHOfbtMzRK4
	+66r68Gv7TQ3WG1K7/PGg7+zM1oEv4vaYmfR0x0Gz0Vb3JnbS2zk6Ko4r40lX35r
	hgMp4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2js1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:59:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366344513a3so20859863a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779778778; x=1780383578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LVvCV+OUMP+eKOrIZZaZLZwCkJ9amVnJmT5FmWau3s=;
        b=hdTr6YC6SEW33oaFIZVBSZ+h32WyYlhOWztWhTXeYlyXZi9xbTL54SjxYVL9loEZWq
         J2ihE/SGlEwikm3W7crVPp3ktMSO/EqF8Waj5ROgBr32JgXFIF/Zxx0vLeVFarB63LUP
         L+lF/vjhOsAI079c46mJqRngGGnv/+9deQ5m774PEsxtxoXwlAWGQObvQLxpoowFFi9Z
         aFXkE/KoRZeHmHA5XqriJaH/z3lftvfTA1VeB73ucIC3VSaaw3knlBJkBcZCYxA7v6Dr
         lXge9+is2sNUH46/384NuuNHDQ2djXqhpKIQtOuiGPYl38WAcMQepx/Yr6jFiqn3TJmb
         m82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779778778; x=1780383578;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LVvCV+OUMP+eKOrIZZaZLZwCkJ9amVnJmT5FmWau3s=;
        b=HCEYbB8ZSH3AJzwe4GNBrLgZqAy94Jgd2HexBVh6tcJTtNLGdAAyV+Adx+lUwXcmnK
         +hK8G47dE/sQGJCI9ZMShugVY5vkVA/3qEG5sFL/FZ5wm0Dtf9z2cACDqHOkIzSREeIZ
         7t8ZKGtEaqmWna+xiabVKZvz+0StRgxTdG59YYquwlP9TRE3MQxsENgTHKVgh64AdBHi
         geli3YvmUaOA6uPIjqoVMwnvT3HvzRdkNLroqV4Cn+tXUO8kOW7wwWV99BKVG10rT9U4
         KjKcu3OoOrjYi0oF1/KP5iZOHWiY7bcYnx+H3x3IFmf4eTJB7niLU9Yeu8ZFZdvbwdJv
         uwVA==
X-Forwarded-Encrypted: i=1; AFNElJ/UfuzMRX7a300x8rgbNu9zNodQE7w81Xf8vOfRUYDLGdc+dX3fDVxoYw+EFY2+Qdos0Y1pd4ua0jDwfaGA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nkIRP6G7ojPBxlJFZT+1GOxPycLe5J0fBONYG3uPqZjxYVS6
	jl3Fly91CBvsJX1cE3VVsdv8EwmdAfDIKQzlbMCpAT9iiEveX6Xr1QgnFKDVrpOLfZi2fzBg0tK
	pW/NQ/4EyOIKHryXum4iNaiZtHW8DhSI+oyyHobR/41W624L1v5qWKEg9BYr+pycSSAUl
X-Gm-Gg: Acq92OHLCfxkExrlsYXsIE58LAdOvmFZIh8mBHKxjCHtcbDXISPrs8yMg/xYYP1cPdP
	x+yptrf7Q4hKDjBhCpB5oo8VjdMBFoJ+0RjCGsdf1i1PwM7XzYKPSbIsTcAGkpl6HKUzdotL9iG
	+m9+vP2GkTqehOgJGtPJK3irFrB2nf+AC3TwDYLYm165w2R4yyXRd0nspNvqGEiGx7dGbGxS3kF
	PxgJmkwwYfibj7pVajuObjAivxfQHEU8v6vu9XWIT9+Uh/lUfm0p2cxI+oOScs+b+P6VdgCcURh
	73yccHEcFha9EBexQa5pCfsuTrWIc4BENvEUk1KfhDJVEL7fb9b708l6FLrD1a7fotCrWlMTmgW
	HaWQbnFcJrU1w6FyJWh7ppYmuwMvs+aYu1Ih9Zh1gjBni6hvNuJCoaNooFO0vNn96EXPDgEt5/d
	muPD/qeLrfKS1kCSkz
X-Received: by 2002:a17:90b:5746:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-36a67639d6dmr17650199a91.20.1779778777717;
        Mon, 25 May 2026 23:59:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-36a67639d6dmr17650176a91.20.1779778777240;
        Mon, 25 May 2026 23:59:37 -0700 (PDT)
Received: from [10.133.33.225] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72674492sm10892004a91.8.2026.05.25.23.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 23:59:36 -0700 (PDT)
Message-ID: <4dc05557-ab95-468f-b972-84fe9fa3cc51@oss.qualcomm.com>
Date: Tue, 26 May 2026 14:59:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
 <lvfwkplrktjldbvn3j3jqh7ds25prx723at5t5oobsvhgolngs@pme6jiac5xdg>
 <85c2bfd1-8e69-47e4-a360-10a2655bd43f@oss.qualcomm.com>
 <CAO9ioeUgeo-MiP7pNY16wL9d7LKEi7PR7pJtH=1hMg-mnMSOPQ@mail.gmail.com>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta
 <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <CAO9ioeUgeo-MiP7pNY16wL9d7LKEi7PR7pJtH=1hMg-mnMSOPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V6EgSYnnfzFLPVBX8EYT1ezvmOBshMuj
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a1544da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HEe4avgjgsDiN2dfqW4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: V6EgSYnnfzFLPVBX8EYT1ezvmOBshMuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1OSBTYWx0ZWRfX8jdrVPt2jFpU
 8XehulejKIg2226xVDvEou7MB7aOlM1WgFF39L6is556ViJRPzQbsBzVWKFDlr3afSzgOCgM+HC
 I4OebTDenAfx9V8rdaIxdZuU88IYJ1quyxXNEfUmvwwhkLSLFOnPhdagarrKsk8Kr5j78FSTlfv
 Cmo1qUiDwH7eLpHL0NtDZlpytP5VCtC8zsv4I7CN1yrMFxgpm/jhDC0YzsBv920VljkhoYjkilH
 KatcRshLdyQiqnglVznhUcgzi3OZwoTDnk/GI94uIH94kdrDYqtEtNIbIeim0qPy/WGowfwDhip
 r4Mtp4yL68//ADoCXQbkUfE8OiSJZfggm9U/0ik9yE4zodTSwtTs1EwR4uYIke3TThIDjcg6iR7
 0HOVGjn1QKOEJlf0+xNK8cH87q4IKEM5dLgaKUWewkRflyP6H51D61v5IzN0BAuDXplG+Nh5S20
 iUd3lmTTGZLTjpnyVqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109730-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A15115D16AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/25/2026 5:35 PM, Dmitry Baryshkov wrote:
> On Mon, 25 May 2026 at 11:34, Jianping Li <jianping.li@oss.qualcomm.com> wrote:
>>
>> On 5/25/2026 4:30 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
>>>> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
>>>>>> From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
>>>>>>
>>>>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>>>>>> getting removed from the list after it is unmapped from DSP. This can
>>>>>> create potential race conditions if any other thread removes the entry
>>>>>> from list while unmap operation is ongoing. Remove the entry before
>>>>> How can it remove the entry from the list?
>>>> Multiple threads sharing the same file descriptor may invoke unmap concurrently.
>>> => commit message
>>>
>>>>>> @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>>>                     return -EINVAL;
>>>>>>             }
>>>>>> -  return fastrpc_req_munmap_impl(fl, buf);
>>>>>> +  err = fastrpc_req_munmap_impl(fl, buf);
>>>>>> +  if (err) {
>>>>>> +          spin_lock(&fl->lock);
>>>>>> +          list_add_tail(&buf->node, &fl->mmaps);
>>>>>> +          spin_unlock(&fl->lock);
>>>>>> +  }
>>>>> Is it expected that userspace tries to unmap it again? Or why is it
>>>>> being added to the list?
>>>> User process can call unmap and fastrpc library won't call the unmap again.
>>> In the other email you wrote that the driver can be used by random apps.
>>> So... what happens if userspace unmaps it again? What if the userspace
>>> _doesn't_ unmap it (although you've just readded it back)?
>> If the same buf is unmapped again, because it has already been added back to the list, the unmap logic will be executed again.
>> If userspace no longer performs unmap, the driver will not unmap it proactively.
>> The Fastrpc driver will free up this list during fastrpc user-free.
> It will free the list. But what happens with the memory mapping?

When device release is called, DSP side PD is also cleaned up, which includes cleaning up of DSP side mappings

Before kref_put of fl, we call DSP process release, where DSP PD is cleaned up.

After calling this, we go ahead and do buf_free of the list

Thanks,
Jianping.

>
>>>> Fastrpc driver will free up this list during fastrpc user-free.
>
>


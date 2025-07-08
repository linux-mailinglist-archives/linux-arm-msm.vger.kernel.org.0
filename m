Return-Path: <linux-arm-msm+bounces-64086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C596AFD519
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F049167F68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D8C2BD590;
	Tue,  8 Jul 2025 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU1hhUqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B7F9E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995099; cv=none; b=FamMhNpkBU9xgpGMSvOjKVxY/ViYEIqAkv9/o5k6XA3kESrbV+7sgYYbCKAxBwGCqbNpYWQfgSXtvAuz8E4ME+AEEl8NRd6JX2k8jXXu/Oi3H8NQsgBMwg8xPrvXoZbVyTWA6VLMWaiOINOSo5gzah1avvUqdmBaEtPKSojPHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995099; c=relaxed/simple;
	bh=ZxqmAlpZPE4GpQlH6qTfsRIina0dFeRDlh/OyTnSWOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbnhxUEb4FybUYcieMlFpDP6XDFIcL/jqVihKQrn46pndOPMKaangUBwlNvCymoSH1nf72JT676UWf9U/8kfELEsm0yMhS9U7fYxNLFKk70HWuYnhVr9LF4P4wuIiewkxoVK5BBa5IJFovakZAJ710/IauMxrYMYqvkBYDIR2ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU1hhUqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAYHf029330
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 17:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNZbdhmlFQUxsHOHqhI2G9n2d5YtMKeChku3vZES8/s=; b=pU1hhUqsEsRfw6Pl
	eXbAEK2TMtc24QjH1fXnAekI/mSVZ+JM4sI7Ct8zyOwf44/MQiFVUr7soTjtVupl
	4y/DcjkhSuElAsPKdKcUbn30J294VrCd/Ma70XBsOcLxoXftczLPNxy5Yqi9kZQn
	UzIBM1DVcOXR0tm2OM6fDzf/+pqzUwdgCMnfo1zPTB0RwrX93KqYPLhF1yKEIhM9
	H/kIvc8b6ybi2qzjCtUQZ5LROfV1nYitLLnVbcyZNTJ5Cr34KBXT2fZbMe5MIcEH
	iV/wVlyreAjC0PtDaDzKyxPp8VuKcrwcUQ+f+X/kdbqTZdUXAcNgw4Vy44DsrLZb
	TzHj+g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4y0xhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 17:18:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b38fc4d8dbaso3812445a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995095; x=1752599895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNZbdhmlFQUxsHOHqhI2G9n2d5YtMKeChku3vZES8/s=;
        b=vuU1L7k2REoQLWVGa+jHwm5Vhr5WIGvkkzoEjOijSc4GeLsoK1HFM/XwqTCSr/K68a
         iO0BQ2MnGItIeSUR9QYb+lYt9W6Qz5lBz+AK2Ft70BoqEP2WuoWZgWHVkfwkoVa7F78w
         /INV6SBhs3RUMhL/yT/4qEE7Ds3I7MfXIV2eQzTIviVLve8PgqLCX9die6rDdiqg2hZl
         QA7AK68wJnDvXLyTQBO8Hm4BhcKPzJveirwyko6oXQ1d0L0dUvFVQvhJK+SSsyAqUhnc
         CpfRMDkGXepZn8h6wXT27qB8XP0qL//n+E7oHeijfIRsaor5CC/V9xAjSs0UoWQoPECh
         uqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0sSK0IlavkQaOnGIpTMdMvelXzcellWFzHqtjth95wUTeygOpNV1vvsYKray6M9HdiIaQOUpVJM9HoeWV@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwoymdaXBR3q+y6HdnMglZblt5i2wIsw3b2W6MUjIw4naC3Z/
	iU0EVlQfWerk1avXW/OvrBjuYiIKgGdObNVqOZ39Byi0U054UPFX8DBsxk9Pa0z0L3nxB7/ekFc
	paGLxB4730sRjLPTykm4xSqurdAs4S3PWdAKfiCdvrf9iHDStut4qp3idhUWGlLJs5M9J
X-Gm-Gg: ASbGncvqTlSIcd2XvN/rcEa1tslNNb0md4MjMw8EUVTJl8FAwMTK5WW0RDBIudwnEjd
	tmMuuSn2RH0PWhhzKksot5Ac4q47svmJkmnrl5pdobv+GJqYdRXaY8gSQWiskNMwFz4c0lmDKyG
	NxSpkdqVPs7L4N3EJYUdE0SGxGMBAj4h3X3Fs8+jMTEnzVoldYIiJ6NdGtuHu09A1YKUNLRLCnb
	LVXyxxcZliojE5jehZV8ReL+yCm8nXqM7b7CikICooqIADQun2El9MEljRzUWfPGcZfF13VC2VG
	aq/KjUaO+n8F25Qp2ZL99VVs55TdqmMZUEIsd+k0Pkgr0FqwQlo4Gf9biIR2habG2mvXxzWg
X-Received: by 2002:a05:6a20:729f:b0:201:85f4:ade6 with SMTP id adf61e73a8af0-2260c2401famr25701531637.27.1751995092803;
        Tue, 08 Jul 2025 10:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHongpWNESLAVgwtBOry820wNxr3RL8aa+ojutFfz5Zh1wSOxaKFJlRS8eGzSYgs83bpWs4mg==
X-Received: by 2002:a05:6a20:729f:b0:201:85f4:ade6 with SMTP id adf61e73a8af0-2260c2401famr25701499637.27.1751995092278;
        Tue, 08 Jul 2025 10:18:12 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62c615sm11869772a12.60.2025.07.08.10.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 10:18:11 -0700 (PDT)
Message-ID: <a3e2a410-76b0-458a-9b9a-ba8f91283346@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 11:18:10 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
To: Manivannan Sadhasivam <mani@kernel.org>,
        Youssef Samir <quic_yabdulra@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
 <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
 <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0NiBTYWx0ZWRfX8Uv+UTt/VrD6
 JlTo7IVjwcERgCmRBeAIFiV0slyxzX3g0OIVyeekXTL0Eu8ykwI5ZcTpI66JUr7WneLYgb4KGbZ
 52fKCKwNK3TccVysNBffNTwkFRX5YOODs/L+nHH6YRNDXdMyPPINXn/gJtn7eGqaj0CdsXiSCA4
 M0DwdKHbfcUO0gpBKNaOHOKVWgu6jxTVJzyJTGjFrPHNkbqMoD5SSV/8P9lBoDGQPZoMC0WEOJC
 yhXc8CrzKsFAPM7zM+L93PsVjxfBruNCOAGO8BIsL67ngWIlVc3cxzU7BDDSu/pfr5pL8AsPMnG
 dh8s/fpy1GXtFssVTnbrIR6+LwVVmq3ZLXbvS9iTBsCdoyeO5VxtAf72eHcTbQJv83eRQQ8kmTp
 KbAElZ+e6Cc7PWt73JxgxZHqv1XjR7+qDyDJQ9OiCjJaug/yh33HiaUomhmmAeDnEDkI6SBI
X-Proofpoint-ORIG-GUID: 64PaCSvIMbHE01MG8rLWycbqaavDCf7x
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686d52d8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Wp3K0ks6gaFnrRQnQwIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 64PaCSvIMbHE01MG8rLWycbqaavDCf7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080146

On 7/8/2025 7:26 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 02, 2025 at 04:06:55PM GMT, Youssef Samir wrote:
>>
>>
>> On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
>>> On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
>>>> When a remote device sends a completion event to the host, it contains a
>>>> pointer to the consumed TRE. The host uses this pointer to process all of
>>>> the TREs between it and the host's local copy of the ring's read pointer.
>>>> This works when processing completion for chained transactions, but can
>>>> lead to nasty results if the device sends an event for a single-element
>>>> transaction with a read pointer that is multiple elements ahead of the
>>>> host's read pointer.
>>>>
>>>
>>> How can this happen? I cannot relate this with the scenario mentioned below.
>>>
>>>> For instance, if the host accesses an event ring while the device is
>>>> updating it, the pointer inside of the event might still point to an old
>>>> TRE.
>>>
>>> I cannot interpret this, sorry. The host is supposed to access the ring elements
>>> till the RP. Even if the device updates the RP while host is processing the TREs,
>>> it should not cause any issues for the host which only sees the used ring
>>> elements.
>>>
>>> Maybe I'm missing something?
>>
>> Hi Mani,
>>
>> This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
>> aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
>> involved the device sending an MSI to host for an event that hasn't had its data
>> completely updated. the event could be pointing to a TRE that is not local_rp + 1.
>> As you mentioned, the host will process all the TREs until the event's rp,
>> which allows it to access data that were freed or hasn't been written to yet.
>>
> 
> So you are saying that mhi_ep_ring_add_element() didn't update the ring pointer
> before triggering MSI? If that's the case, we should add a barrier to make sure
> that the RP is updated before raising MSI. Though, I thought that the implicit
> barrier offered by the mutex_unlock() would be enough to make sure that the RP
> is updated before triggering MSI.

No, we are saying that an ep without 'commit 6f18d174b73d ("bus: mhi: 
ep: Update read pointer only after buffer is written")' can cause the 
host to crash because the host is trusting the ep, when it shouldn't be. 
  This patch hardens the host by removing that trust and checking that 
the ep didn't do something invalid (to the extend that we can detect 
invalid behavior).

The ep updated the ring pointer before it updated the ring contents. 
Therefore there is a window where the host can see the updated ring 
pointer, but the ring contents won't be updated therefore the host sees 
stale data.  This is identical to the scenario where the ep updates the 
ring contents with invalid data (maybe a FW bug), and then updates the 
ring pointer.  This proposed patch catches both issues and avoids the 
host consuming the invalid data.

-Jeff


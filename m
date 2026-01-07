Return-Path: <linux-arm-msm+bounces-87822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A02CFCDC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 10:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDDFC308C8FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 09:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FD12FF679;
	Wed,  7 Jan 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhxoX0E5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+YqgyjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36F2FF657
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777865; cv=none; b=OB46Bn+eepnnZ4DfCZf0fUFfuL/nYmUBiC4+lwUeaL6fHRzZ9xPFwJjonrsFMxO6AfaCTPYkATskxmn1UN/TpHh69h9q7W06MoKaigGqpI1IiV0evsKDr17u7WjOaJyYfKcwOSjnUOS3CHpLzXrUcfiXVBsV1VfbSZDROaSO+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777865; c=relaxed/simple;
	bh=is3JvHvh26LfzW4x4xGy/g08AaliKKVtZ3JcDZvfYgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1+QzbmgiLnc20A7gYumDVnyIq2RkmJOAf9YhkRttN/A2UZXpO4zS6AMMeO+O9+SzQWXC8V1tGlHnz3JcEqjJ8oXH3GcvWDeSdtHI9lAPiomAk2SoJeZyFXRLygveJpRDrVUYB9a6ChLj/3G9L+3o6nLbD+LUPQBYfcXGU0Y6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhxoX0E5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+YqgyjB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60737Ukg731694
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 09:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCQ7E64aGkZQWKEuQyakZA3qgIImGoTLX07wyb3IoS4=; b=DhxoX0E5S6BoCeN2
	pymR036FmoTmtv8J7KPAfx2SLdzQnMTIcGG4ejWdEEeEMbUjjIjrX0/7wz3O6d5P
	inbHBbk1plsSmsaQP/qy4XHehUIpLr2yFSIZ/mxL6ehfojLSmqZcUklbTC6/Eody
	mcC1hvMivRXeCKOyN6FjHmlqzp5QBa92ESOQjthp09wdmMc3qUobGfb1UpnHZtIi
	pxpGiH2+B3cGVLcy+vsa0sbXF0P3DhXHrYFiaNbYWYBGbAhiGxIwc8RyGzLnKhuQ
	9qxEp0gCgBmoPrKckdY78EoGe53xUxrE5GxHeIXrL5Fh/UOTAfX0FzvRik4zgFKG
	Zubstw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66mjrfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 09:24:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ea5074935so2277851a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767777860; x=1768382660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCQ7E64aGkZQWKEuQyakZA3qgIImGoTLX07wyb3IoS4=;
        b=D+YqgyjBr9Ysoq9gx01cUs/Gc2kf14/alew3STbk4Uz1y8AT4f0eXPyEsar5i9+TDm
         rrU6z5OUKjjrNNptgmJIA5HMpFXvrqYbuisYY9kLKK5GmCjzZ3N8dZKvv0WAQ0qRQWMh
         kqgmO5uFvMusU6mQz3XEMrEgHAwSpk8QXpcF39HtSbyoWrrGLi3nff/cqYKLWy+yWcWG
         EAQT8SHjkDSQ3YBALrAK4wx9MM5w5oStrLhVSBvYovn6DNEJ0t/jtcLYnpZ/UfuAOT1j
         /utQXqPxMDBeOyiCXciusJnrDQejJY+Cf8V2TZSeVtbhogADq/wtVTjOEkRnUh1bbEdb
         +/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777860; x=1768382660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCQ7E64aGkZQWKEuQyakZA3qgIImGoTLX07wyb3IoS4=;
        b=PXImFy68b8u0bQ+qNl/rwSBcpGUp6pIaOK52YK7SMH5o1dvHcutfWvvbDk2AH5ry3b
         egUiZGiEVC2n/kh8csqfG68tsA/MB8SoaHeYd3DA7sYzUpkoypmUUPFrUQ31t1pyY4VP
         OsAHjsh9z+zUWepgJoVnu1pdgBlLoKO44vznx+uDP86Gj7dkapxACx598aEPdcsXfL3X
         b6KP0byJEkHtE+BNMMXbi8mlOKJcFVj1b7E92ejxDWdgKeh/sVEv+MbNYxfgZqoQIGXj
         MoSlTalWyAfYurG/XICvaC+lMNxxRE25O6fJVNmoT9A/KvyoZE0yYtOB7ah8WxC78NPM
         XnVw==
X-Forwarded-Encrypted: i=1; AJvYcCWCxZ6brv2NkO9PpyBUN4KpFAWK4Gi3414BTRzboDHfieMh3196x/HrO4ygHPBM9sKQOLuUIn2DjAUgTcVv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AxELxxhQfNQmP1SIzTfNClPFBEpmhlti4fzuU08t7ZKM3Fhj
	PYwutq0M5MQOGrm5LBpI1YY1Fmrq9NMIsQWqqvc4OmP665AG5+HBf0OMr7SGxSIDZx+upohPt4M
	cyiPkHiW9D2BYszaiKbmi/bmNGHkyvV+82SB+/zQmv2mOc1l9NrpQNPD5jcfpdgfx1eHm
X-Gm-Gg: AY/fxX4mjKV/jc1YV59eqXwkxRBiPIn1NnS0h/0r61wThQiM+hGbppkmvjl2MTf6iyp
	+5WSOubHVmqz0FA4419QAQDf2BVFusI7Y1P8KlULiMqS2D57jtzaoKNmBxK8DMy8Sd/Vw/q6wQS
	eTRUnqhZMgsuKzfzODpowlNu381qJC/xG1VLWvdLc8OfZK2eGqy8HRlfzg6vHS7KeGRuyrdhFTG
	sF2LGr7QIPRSbOqyYprauo2im7DtiMnMEzFqw+0XIn8kH7wUEoxsTbSDyn4lbnWurbr+Z6wOOp6
	dPvaYANQ93+NTdQPdZIn+XT/TjamvFXWw7MXQ8cUrpjiymIz2BFDB4kIibezpfv018pHh8gcNHc
	E9Inl9mj/XJeaxmzDPOp6gux3y6GUJFijWSBzHTjhQg==
X-Received: by 2002:a17:90b:35c1:b0:340:9cf1:54d0 with SMTP id 98e67ed59e1d1-34f68c339a8mr1522629a91.1.1767777860056;
        Wed, 07 Jan 2026 01:24:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6SQk53WozcRJr7IdsTTFzEHcdXz6UUnKRx8vIFFDYVnO8Tze3frQxP2XgomFS9jRlb056Cw==
X-Received: by 2002:a17:90b:35c1:b0:340:9cf1:54d0 with SMTP id 98e67ed59e1d1-34f68c339a8mr1522604a91.1.1767777859477;
        Wed, 07 Jan 2026 01:24:19 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b09f5basm506459a91.3.2026.01.07.01.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 01:24:19 -0800 (PST)
Message-ID: <36d8fb98-562a-43dc-8b47-b4f6d29475f1@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:54:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
 <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
 <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
 <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tC3qznz4bIGmJQoUdXCG6L1pifPGNM5G
X-Authority-Analysis: v=2.4 cv=PoSergM3 c=1 sm=1 tr=0 ts=695e2645 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=agy9Euk4f6zF618OgdMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NSBTYWx0ZWRfXywFtiB4T1h60
 QMwKgihIBkPN+0eprJYehx66UlhMH7i+oKh7yS3Lw+eHFDZI05ESEd0LktBqEPaLC03Hg+r3uGa
 XlSjYqQaMi6ZbVWInEmdEFpz4SKNhvxx1NWFBQMm9NhbhCkC4k24u/snDt4NZIio7hafIP8m+IO
 Fum3U15ejIr22NdbzwlQO2poN9mVE0L7OXH5/kSYdKItcfPVKK97bGFjIvgstHQqE6t0fm6Fttz
 7gOha4M5GDOa/9aiUsTPDbeVxQISxL5gqKAFtFAjfljGdrI5c1BBBAiC0UXJAPx1VEKaf5BeRWM
 3JA7Ov2QyTXHPu6WV7F6rUrtKUYa3gpSTH2DUs6dKvOfJnTOmfRg0uBz4qtpV2N8Z05Hi+W8ewD
 Ms4/dfaYSl/PMz1BM07wtbUNSIjm8rPHE7+rq86c6QffJdc/3n+5NEYCqGfroCLWjiRgFBzu1k+
 /nIK1rnh8DlKMns/4iw==
X-Proofpoint-ORIG-GUID: tC3qznz4bIGmJQoUdXCG6L1pifPGNM5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070075

Hi

On 1/7/2026 12:52 PM, Dmitry Baryshkov wrote:
> On Wed, 7 Jan 2026 at 09:06, Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>>
>> Hi Dmistry,
>>
>> On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
>>> On Wed, 7 Jan 2026 at 08:48, Praveen Talari
>>> <praveen.talari@oss.qualcomm.com> wrote:
>>>>
>>>> A regression in linux-next causes Bluetooth functionality to fail during
>>>
>>> linux-next is an ephemeral thing. Please reference the exact commit.
>>>
>>>> bootup on the RB2 platform, preventing proper BT initialization. However,
>>>> BT works correctly after bootup completes.
>>>>
>>>> The issue occurs when runtime PM is enabled and uart_add_one_port() is
>>>> called before wakeup IRQ setup. The uart_add_one_port() call activates the
>>>> device through runtime PM, which configures GPIOs to their default state.
>>>> When wakeup IRQ registration happens afterward, it conflicts with these
>>>> GPIO settings, causing state corruption that breaks Bluetooth
>>>> functionality.
>>>
>>> How does it "conflict with GPIO settings", what is "state corruption"?
>>
>> I mean the issue occurs because the GPIO state is being altered during
>> the wakeup source registration process..
> 
> Altered how?

During the runtime resume of devices, GPIOs are configured to QUP mode. 
However, when registering the wakeup IRQ using 
dev_pm_set_dedicated_wake_irq(), these GPIOs are reset back to FUNC 
mode, which impacts the RX GPIO and leads to Bluetooth failures

Thanks,
Praveen
> 
>>
>> Thanks,
>> Praveen Talari
>>>
>>>
>>>>
>>>> Fix this by moving runtime PM enablement and uart_add_one_port() after
>>>> wakeup IRQ registration, ensuring proper initialization order.
>>>>
>>>> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Closes:
>>>> https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
>>>> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>>    drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>
>>> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>>
>>
> 
> 



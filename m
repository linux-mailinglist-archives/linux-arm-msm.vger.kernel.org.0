Return-Path: <linux-arm-msm+bounces-87791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5ECFC478
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 694CA3001BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2833227510B;
	Wed,  7 Jan 2026 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHgIobsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoctcRIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994AC1F63CD
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767769573; cv=none; b=RR3srh2eCe7wCzMSd6LDBc2UUkC7qgSJebl89hijy8KsUJi+IPQIS2MxBVUMEy0LY3agoH6EIbQeOuHUu0KVIQLbxSC8HpCLsWH0eIYyfuQ4UDpQHukKxDW3sxYjday4dx9/HYRm8KyVuXdCjnBO3Ak+VHO9bzHEXeuI1diWimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767769573; c=relaxed/simple;
	bh=X7IK1sesTtYzClY1ixLsI6OmQf5TogfnXVJTCbBbS5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHEz/TJ7G45e2hIfHxvmczCHKOLTNiH1QppTVz04BAo+Ed17h3PTASB5eB0HMuIGnEdseVGuUUnNYeTWelmy0RIqGUzMj8Z9tcXI7DzD8YUm6up5/Err89E4Rzo8MBZuI3S/Nt4i3M+5IdhG/ZTGDVgu1k+VWssy7HoQtSROj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHgIobsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoctcRIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60735r8A364935
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 07:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Id51aJqXTKYJTvWTznSlyjWuzynH+IhaCX+ZUbGbYtg=; b=pHgIobsjy1idsIVJ
	vnij8VA1NYlqW2UPuHYeCZLQ2ouIPOd+ck/Eo81gHXYj6ikicubM/2jl4/MJRxTL
	edKPmtQS14LwoSB1xIH9B+FzR4PJvmta5rkSil0u5dvWVvq811ZXrvky9oCInl7n
	kznNcIUQ6zsqERba3LzCipRHmNBMnSgNQHNGk3wVb6/2GuSDUxM5PHbOI8PRYI6S
	QbbcAnw8GTOuI7HG2WYbLOjgPRs1ZrVWsCvyf80o4Ifb2LtBV5c7KLZxQwr0FG1I
	kzao7oezMhnJYIPbi1gQry5Qs935wmDQ+R8D8RsQPgyhBFXHv2zhkgK6dnfj4AGx
	9by3DA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660t89n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 07:06:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c337375d953so2066956a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 23:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767769570; x=1768374370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Id51aJqXTKYJTvWTznSlyjWuzynH+IhaCX+ZUbGbYtg=;
        b=eoctcRIeo2wYDAqake1xW6mJQwprqX/sfXG9dBDKNFV9tE8pwNdGLXNzAkX5kJQYCl
         KYyhQWHmZ1N2AKWqzcyPEA/fDxO/xJlbGp8ix2oKsYV/ot5nacLIkQQj868T5k20nPJy
         2Lh3YI2qCzc1xm0lYB7xdMPsfOkRo0e86fkx2YIwzgYNZaK20e/KDRtIY7VvJ51WG9+v
         FIk9BO4Oje+f6BELe4CE4oMK7MYRgk0PY2HCLurShiovJIE9m3I+fXDtLzdMWYDVVT5N
         CTn/WffmMoSFczlN36OfQ+0Unwtf1ZJ+uD7wegH6CE+FHqydL72/uGTdurPdOmYigLDg
         4NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767769570; x=1768374370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Id51aJqXTKYJTvWTznSlyjWuzynH+IhaCX+ZUbGbYtg=;
        b=GXV1IWzF8qQ6waFeGgtw95ZcsPaTFaKyVhx8fYxlPsG9TUl/bV0OUF+4SNEHrJzrWc
         V+Wh7t7nSCc6YrKh8VJ/si6nNdUTUkeI4nr0oSEH2CZ46m4JknT2VvIuxdeQbn9VyY0Y
         89YbSo3cyzD6jAVlPfr2lcPcf/LemVRmfF4Mz44j6Oz/Syp61dx5rtUqH0JHku9L4XyY
         x/BDczs3LtA5UawRW1dP8ngoBtYPvg9d1k+7Wdr/inlNTTXPjxXjUgRG0rUCTGRhflPx
         wHA0WMFxboTp9WupwExPzvuBvN74ho4oWw1nx/vlPuvSZaOsu+DcYmtGQqXe/Y3UffDP
         UeJw==
X-Forwarded-Encrypted: i=1; AJvYcCXO+aiG+BToKrpC7fcbeNUnYFa/0TkubF8JBgBAOFTs4uwsMV3CD26bT5i4b7hBDyXK0RZ1RRO1HAFnsY/L@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2q/+Ryk7L4meqb9XdV37kobCkRsz80cgmbpcC1bP7WlIiALy
	0FZo4coDAFoJYC1s+oObM/lacAY0K6gHLV1SuX0FJwA+osO3ZfKUauNhJnwzLj7HqiLHPyM3z4e
	WddQXtpRlSS8JDOoxlc+nwsLoL1Ff81cokJNynhSc2vCaiQFNuwjf2vN8g2SE5mEAHLq0
X-Gm-Gg: AY/fxX62cNxaX97ZMlLJGxyH8FmByPPJcTdaYKbkDJnWTghxWtBx5J7QlR3kQIizvkw
	C/BF8oKJn7XtLq3inpus64/6hLGSPH85Bw4hcFfGEBO83uVz0F68Q/vsoLSM7AVIMdZaOamPXGP
	p1LC9XVGx0WSrrdqDVMj4Wgp4ACSJvQ8JvFfXQgjhHLnLLFoQwwXqAJz1PhqHU4mY1/Ton4Csjn
	/56bCeIUn9bfcAa41Ndl84yHzzmjY2vLq1Kx2bbmfj5sXFjY6rTeN3diGXPXZ2MfDB8X4oG9EI7
	Uf/jE/Wku5iRywzyNJMBQDTfTy8/tJ3jEtx2AGPiIMoi9T/A7wBIr4TT5kwuC4ZyynwPFvy2Eky
	pf5vp+z7rZR84j2HsAdi0/qTQbw8uuCYy7gH6iVwE6w==
X-Received: by 2002:a05:6a20:6a05:b0:35d:3f07:ba34 with SMTP id adf61e73a8af0-3898f8f4860mr1473829637.31.1767769570036;
        Tue, 06 Jan 2026 23:06:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkK0TXEy469X4Lki1iNUimc7BNa27ftbZY5C46XH2Q4FBkpYXMwIFOrQN37CYLCqgeGesV2w==
X-Received: by 2002:a05:6a20:6a05:b0:35d:3f07:ba34 with SMTP id adf61e73a8af0-3898f8f4860mr1473799637.31.1767769569427;
        Tue, 06 Jan 2026 23:06:09 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d2932bsm4332346a12.21.2026.01.06.23.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 23:06:09 -0800 (PST)
Message-ID: <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:36:03 +0530
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
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695e05e2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4yKbRbB3D-Nyn2zg6usA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: QypNnLq8lt6S5J9VKhUp6KbbOz9APW1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1NiBTYWx0ZWRfX5U/3KW078RN5
 XtDt8fX02UnZjIrjOuPhnMkvHoLrrmFND0Eo6EYFeamgu+naHzVTa38etFS/qbcl7ckTaNwC/D2
 bawIYmGRUtOwoMu+TP/CpmnvAaXDhOFWFZm+Mv0EdnyYkDGGdLkq0h1QQWbBVKoh+FvTgYB1ved
 bar6JOxV88r6AqZ1ztt/7WtFiZQOoUg068O9/alpUreUJe3yHsil6nuV0c9gqnEOy+GMRkOM38w
 yZGv+6++B/vIE61B8FS+oy5anCcxOBC4LfzxBQc+6F7R0ckbP9mTdI5cplJc6KqCbvci5/xnkWz
 TnJeVGvQCukaQIMXDINfqSAvlY/ueZ4RB8WAyc4+48lozOkcfn9osXATPbGqZ0bPPvb4RODj7IY
 wLNtI4CD8iPs9goybA9cV5F63rr0EqUzlK3xNCelj8HLYZv6CHGe2XmVzxoXlJHFloT47NUenIj
 KVHWrh+5vkRfVUzUvGg==
X-Proofpoint-GUID: QypNnLq8lt6S5J9VKhUp6KbbOz9APW1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070056

Hi Dmistry,

On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
> On Wed, 7 Jan 2026 at 08:48, Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>>
>> A regression in linux-next causes Bluetooth functionality to fail during
> 
> linux-next is an ephemeral thing. Please reference the exact commit.
> 
>> bootup on the RB2 platform, preventing proper BT initialization. However,
>> BT works correctly after bootup completes.
>>
>> The issue occurs when runtime PM is enabled and uart_add_one_port() is
>> called before wakeup IRQ setup. The uart_add_one_port() call activates the
>> device through runtime PM, which configures GPIOs to their default state.
>> When wakeup IRQ registration happens afterward, it conflicts with these
>> GPIO settings, causing state corruption that breaks Bluetooth
>> functionality.
> 
> How does it "conflict with GPIO settings", what is "state corruption"?

I mean the issue occurs because the GPIO state is being altered during 
the wakeup source registration process..

Thanks,
Praveen Talari
> 
> 
>>
>> Fix this by moving runtime PM enablement and uart_add_one_port() after
>> wakeup IRQ registration, ensuring proper initialization order.
>>
>> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Closes:
>> https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
>> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 



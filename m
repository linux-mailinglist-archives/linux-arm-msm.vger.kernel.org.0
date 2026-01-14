Return-Path: <linux-arm-msm+bounces-89059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAED20B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 19:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F2723016AC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3763A2F362B;
	Wed, 14 Jan 2026 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjScVXap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAcFsGjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41632FFDFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413867; cv=none; b=eHMmNMYmUTjamnJpOAXmudWOkTiFWXGXemosodrl4iGuw74RUby5TCV3braTLZuccJnckZ0Vh4Q0YmTsB26ny/IwnrusAclutMX3fXO2OWaqUZgki+mgHc6KNb0X/dhHBpKPn2p8PG23AHDKEiRL0lgS8TvhfpVbF5X+Rm5Ue1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413867; c=relaxed/simple;
	bh=qanp5/QM8lAcKYIgxVDDV2jUiOTNy+vNcJROmQrdrsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV2fJon5Bo/TodJlYsbAcOjJ7pJISdNd1Nf2+NMgsuOwB6MiwwXdWSrpmvMHUDvEnyPETvgO0fufRHJCKzZk62a0w0uqnDz6uuhd+Z0O/qbrNVaPagX9Wg+6E0kbUZPMFWGDvjAa+aJ72+CvWyX/PtM3hXRx9zFcBr24m2bbEN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjScVXap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAcFsGjR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB31N93279843
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 18:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=; b=JjScVXapKcA3XvUy
	7B5ZfLrcvljnDGZy1Mgq1U8gCrOne7kju/4EWEAn4X7zbfW2HVpxDZM44XeiZq/o
	o8P9AZ9hpGa7QO2K4pJN8r7nrfbCXA1LQlulTZu/H8giD8N8MZ343Q7I1uCnF99e
	fJMq4czpvA5Xeksb9eNlGaMCdJB2JbZs+eb/AiV8q37Gw8hlhbZwEA4Wt/CKDyH5
	XhAX6S3JG3ecOp32PSbnpsxv9fAhuEFGBZ9XNoKCUM3n8xDqmGUVLZYMer4MdwGn
	PedHLB343qhnvpDhp2vLEnurmwzO4XZuMSsAYMR21F1O7hQq+yTZnWE0yIUfTmGa
	NFZ0oQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8sfr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 18:04:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123308e5e6aso35417c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768413864; x=1769018664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=;
        b=JAcFsGjRCp/Dgl7wwGTQwzz+fRw19OQCEnEc8AmTYN9neJPjtCvMSdOce1KhlmrTn5
         IxO4lpCA6/psoD7Apd1yttHZRRF9oMJFNXEwIcgtxqg3uM5l1rS86ZRwFcL+8Icres7h
         er5btJUpJOYDHPKwNAYTB0Jc3UtGFd1UiyWk8ZoHBiQcw3NTojuu+EiWDrzzE78eE/40
         3aueqEQgV8kVBEZt3qkG39MuchGsH7P6MekcUzArkAcnZ4bh/rUYRqxOEyWLx028OzfS
         YJ7ORkpzdmczJMkVToHXXL+eDiZJsAAxeNm/xzxyNgcstE+z7JQ1SW+EquyvpuL2uv0Q
         yFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413864; x=1769018664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=;
        b=sGETzISUlQQzCK3mMe4vCfj5uzLUMQHIyPbv6UXoO10l2M0NwZjsuoZwHrSdlmF/Wm
         sG5Gfg/eD7UCxZ6J0f3CdVP4yVygNA5tBYahDs8q1cbpacTiq0rXvTopi4igO/UF1V+b
         XlN+itMPfBDXRkLqoAHYg7a/aXgHb48PlsUHtqDctiJbUrG4+kDerHwDRhjLhmg4FZU6
         R0v8HwUkoMf8lFSu2BzENJIMaeuk+duJzg07voxuvEXOld74Y+oUqV98igN7yPJszFJA
         JLscMFcQcVXzp3BuTzehn1z3gb7FDr008eU2Ikm5H2/riFnAk050ydXXOn72UV4D75H1
         b7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVBY4JVYOYoZQDP/FSa+laAR++aj2yL480KsSXtquFMj9bIrzFTxX8Yuz+kryk/A8maZUvS1DciE6NrCVn7@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWzWBCPRsMzARWtM4UrFLzYWbsaI7O4W0Aq6O+SMzcjOqGYsa
	9m4Z27b9gzt9BKo/P9xW87LO6Fk5CV+dX9QVqvYw6qCukDW31NNVyasB03A2WPJmWLr+X7wOWhF
	KQhKdiiomT3KBfVEU/ZY01Da803ZozIahEBd4GFQBCGoo7dMafQBbotU7bzq5NJPiXZpzWAPfI8
	vn
X-Gm-Gg: AY/fxX7jwMwtVDZ2uhFrQcfp08OMke2LvjTzoP9wmtd+ZZuN+V28cTsFxNwsDlQQEbV
	YwaD+G5ApPI7x3sKnTToVoJg92rHZrN3VBfZ6Db1b7LkZQHbE2F+21XWv/Z+B7bIYpscaeBXe4e
	Y6kqd1N4f6sFMJD10honH5VA+BwUp8kvKJmn8N8SUWUulEV0GGefCA5BNd7tSgDh7SEdmsh0SNs
	ETdvhzmg3D/kKtKuu05UqQjjyzRc1jxTT8D8nQMMyHusPwIX8faFNeufBgxRbPf44q2I0c1ZzRV
	wawf8VDnCItHIax3gih7Iy/iIQ4nWZ8N/+xXHADKqIo/NytKWzQWoruru6tvXbVAQ5afs/0qcl7
	87nIMUsUtEFQIcgU4DNSEdvDPoRdRkkGpQWGFwTo5yw==
X-Received: by 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr3365239c88.38.1768413863389;
        Wed, 14 Jan 2026 10:04:23 -0800 (PST)
X-Received: by 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr3365184c88.38.1768413862595;
        Wed, 14 Jan 2026 10:04:22 -0800 (PST)
Received: from [192.168.68.59] ([76.93.176.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm31712742c88.2.2026.01.14.10.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 10:04:22 -0800 (PST)
Message-ID: <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:04:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dSulYgAPg2_LMil_Go0O9QaUlJlMAh-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE1MCBTYWx0ZWRfX4w27AKCQQx55
 JTPqmqx6QCV4zc92PnKMh94NXR3J5HnaJdBLz2cZp23tHkf4E8UEcRvGl0DdPXqhGkTk3D7Ol8J
 6zXUPyKusco5oe2YRfTJ6LzoGS8aa35xUQ8GVJnCGPlcVhEk9+8lKgL+gpJUKswDbrnOdnoKE5h
 N/HszkHIJRfFCuuT+YUBH2GpgXhLflVCaJdFPJ4UTg1IV71HfpbRAN3qtJxH7gSazO/1bJwNGKD
 sERBSLhovu377GG8/vQgSK3pRiFD1MkPo8WiVeo5pAHC4CC5NEzmiPPseVGQpgsX8FZR9xHr8iT
 BOfCehixszgMS1K11haE3z50XQsg0239C2iCprtGIE3eBRwuiCSvwyQCKJBER+O/7/CYKejZ2yd
 Rr4AKjxZA8UDgVwzwFbb3I1G5mNEV1O4pj9egqMDLHKGsdRv4MxvdvvSUxHakt557gwyYulftPR
 NwQZ7t0jeM4i80K0Gjw==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967daa8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Q5rFrUx7DTp4enn/YD2GRQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-vY5I4PW3rQ7Gd5RY6YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: dSulYgAPg2_LMil_Go0O9QaUlJlMAh-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140150

Hello Dmitry,

On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>
>> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
>> prefer SMCCC over a vendor driver can explicitly enable it.
> NAK, the userspace should not depend on the exact kernel configuration.
> Consider working with distribution kernels, which would enable this
> driver anyway.
As I mentioned in the other replies, vendor interface exists before the 
standard
interface and user space heavily relies on soc0 already. If not 
disabling the
SMCCC SOC ID by default. I believe, we should  at-least have a way to make
sure vendors can disable SMCCC SOC ID by some means or have vendor
interface takes precedence.

Best,
Satya
>
>> This avoids unexpected format changes and keeps the generic SoC sysfs
>> stable on systems that rely on vendor-specific identification.
>>
>> [1]
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
>> ---
>>   drivers/firmware/smccc/Kconfig | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>


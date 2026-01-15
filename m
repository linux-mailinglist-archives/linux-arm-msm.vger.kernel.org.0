Return-Path: <linux-arm-msm+bounces-89265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF8AD28587
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06CD6300DB25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E382A322A29;
	Thu, 15 Jan 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD+4LhsY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="coy7tj/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8892B320382
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508059; cv=none; b=hkC4mquk/SaOEwcmeztm1SERfmLwjXHmGrXicP5gIa1pt7E8v39m9WK3FDkgJdTA+m27lc3MOKRtXz3gXAgsVbsVf+2BjcUtyQlTXEel6ptxC90GDhUR6E3kni3pc6Ab71zfBBjKaquhGUScZaF75IAAETDuCjODMuysdDJQ8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508059; c=relaxed/simple;
	bh=3m1JDKUE6dCwtGw1I+GY5YI4+Ska1S2i/RrQAxVN7+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnLun4p16CO87Wyv4m/iBWyCc5gZ/3rZ4HDojo5GVU1v7H5O1RqA7he+32xebrp5+aXAoDrrKauCG6GQJEpZhuK68L0T6V6OlmjWwGgU66PbPTWRUF0vxy+1f5AzC7ii6CswP83qojWWaF4CkSs58gpzLpySY0pSdGw+beRYj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD+4LhsY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=coy7tj/4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY5KR2817314
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=; b=JD+4LhsYsd/zjfgQ
	5xcwxy8GIOeREQp1A/K/Tlmc1lp/UuMnIWpB4Xzm6lCiSFbF2vJURh+n3gXpYrQd
	NKHjmf23+KlBuKa4zJvsme4zlCh4kGVqG26SVV+ZETAKkOmOGrWbMW7ASbGHbJiO
	Bx/ch6a1e6WkHQM+uu4jL7KG0hFitk6forjT/sQVYjtL3ju9f7LWpn8s5ITmBOjW
	E6xnjcjtuwh57wYT3aPbQzLHIoWcpxgdvbh4ruRK9vg13M5YM2N+902KHZ98tcKJ
	sKiRMzFzydMX2hMbSvALvkA+ax0QFdm5xSCqIqLGXdtzWYl1bMAqXomlw5EG+Xe/
	p8ayZQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxhwug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:14:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123349958b2so5220172c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768508057; x=1769112857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=;
        b=coy7tj/4SHtZ9CnIff0BkkOJ36HuB9Ap2m6NpfMbkhLM8NW1TE4IJ/Rri3DNZZzLzS
         dBfrTiP1q8Q0b0mmLU/FZ18WNkoc7YFo7k8cbM81u7zYmIC2o/4ewhppGzwvvhmp+/J/
         sFzHo5b4EpoD7nBkMKhcV3t7Ji/dCsCrTGRvu0n31Gf7zH6M/aholxQL9kY3zQwUC4tQ
         EH3xzYgsxRfIKOtCKC298oqJnZDa9QdM2q82enlnItZwnGje0Ev5ecRgn51XddcoXHXU
         Mq4vhqzdQeNK1ZkxVwIsfqgCWkpvvQ08WVgxZv32RAPFJJazuCbRnCnV93wK1S3N7da6
         QjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508057; x=1769112857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=;
        b=UqbfXKuWuQWwWZpYXXCcK1PyDMa3nDkSNCHofQ3nTjrnfjIkt9GkoKc5vXhD3AHIN9
         8XOEfjc9VrdoJdy6HXq2tddZSsyqBZyTqz/h7i7GZ9tcE4GQFGXX14qpT8hJ54+T7gGh
         WerIZgnx0S/GjRHWN6J9wVUdL1UrhvcHtndhAmDuHXC7IcvPwWvPceyQo77LiMuZ9lrB
         M5hkMKZZwdMMYDBgrE21Pno/MZXd0YXbK7x63XOhKAFQY20MpZGt/sgRromEJllhmB0+
         aSFZyvkvLUjYXIzpAQgC9IDMyxRLeIqjuDYCoVve1QAEownk6tmQq1RH2H0ixD1Tv4kQ
         EiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+A3R7xdyKQ+2GU+iilzlCoaOnuVtIIpmjwbAEsBRfRKzXAjAoljN9n7fuf6Pr1N0JEWlTKU+KR+cMnGW1@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBXPBJGqcYk6AlDy/RgDDOJhMo9GilZrvhuPGIaOYpOhewG/k
	ZTGt9t4olff1IAs1eFUcxpadrIWq+sidAh1ki8MhkzcTbaAfDge39zXTH4Z8HnAXBmq7+PmaeGt
	4exOzdGMh3a8FEn9CVd3CqOGRxpW1SE98F64ls862X0o9FrCWdKp9cLjw1vqM7/lsVmnY
X-Gm-Gg: AY/fxX7K+tQcDEJomR3rA8Bd6UwzgM/i9ixBF6CLBc3Q9NBZSPPDRCkgs1s2uVDK9Gq
	cAJO2OE5vV3rN3BGsLqoW03rJnK8BAj1nNC6wwnH7Ub15XnSoGYsPDHx0/xxfGxNCYhKeF5BKT5
	0LJyeZnVBhdQ8FeY88qmdsux6zxjBOglMDrSktaq3natfPfk+5E8FZZ0Li5wz6c6NZTA3YmhkWd
	4FfmgoVbV1YzqwjLvEJKpcFHFY01ChJWjzEH8l/NSEDr5GR8Y74DX4ewH8LhT3d6LWN4H99+O2L
	9x4+35JPlGcB2gXN1Ud5qyPOc/UbGMvVGhO85qfvTlS94inOF4GMHiw4XAYVy+H7kRwADbJp2oF
	9WiQ9QTOZKEOlx2/DTb9hgsUK/qhuU5cmg3ZXdb9iX72SSe+Gbog6F7XG8vMN
X-Received: by 2002:a05:7022:628f:b0:123:3356:7abb with SMTP id a92af1059eb24-1244a7a1f4emr1005353c88.46.1768508056840;
        Thu, 15 Jan 2026 12:14:16 -0800 (PST)
X-Received: by 2002:a05:7022:628f:b0:123:3356:7abb with SMTP id a92af1059eb24-1244a7a1f4emr1005320c88.46.1768508056292;
        Thu, 15 Jan 2026 12:14:16 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefaf0asm405764c88.9.2026.01.15.12.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 12:14:15 -0800 (PST)
Message-ID: <53760601-dfd7-4536-9cd5-9241800c6c73@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 12:14:15 -0800
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
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
 <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=69694a99 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DTRC8DjRNAS07NXFP4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: otLOUns0qm88jmBrp4r_KWNpgZKynhjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OCBTYWx0ZWRfX55QdhTe784fw
 I8qtb3qE1067KVRHtzJFTkGoyXSGDaOxhGIXUHEtnYb7r0+zgPZQsU7wrq4k01BEFvlR6UDJsdp
 Q/wpCDg2L5MNMyRzrH1e2Q0vjiLjKyim66lDgmYeRenmdsR4ghiW+DESIoLOmeoOROpYvYB9+yj
 412jvFRiKmrI1TwHPMt7Rqm9tYdqXIYOrBjbA2+xF+jGB9tUlXued6H8jxCcZo3habwoN4Ck1qQ
 /Gzc7dL1l85dQmg/o6ACWXr8oC7TzU4ZmRIacSr5i0Um+FHGFCA6/8+RtBVP2k+odrElmI4osl7
 r1/xhVQpn7m/JPN6gEjLriUrzDi7shCBxFTU/utqSGLaCVw0ErqWwmvaKS/4RbJD2/Km0ffKlno
 7PWK5regpIRt0dMxDBhhslul6AmYqfg+D4k7eVrMF1IKSKyVYQZAl3X8Ooa47FwfXtfTMga10jY
 zw7pmK5DOETHK1Fad4A==
X-Proofpoint-ORIG-GUID: otLOUns0qm88jmBrp4r_KWNpgZKynhjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150158


On 1/14/2026 11:37 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Dmitry,
>>
>> On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>
>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>
>>>> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
>>>> prefer SMCCC over a vendor driver can explicitly enable it.
>>> NAK, the userspace should not depend on the exact kernel configuration.
>>> Consider working with distribution kernels, which would enable this
>>> driver anyway.
>> As I mentioned in the other replies, vendor interface exists before the
>> standard
>> interface and user space heavily relies on soc0 already. If not disabling
>> the
>> SMCCC SOC ID by default. I believe, we should  at-least have a way to make
>> sure vendors can disable SMCCC SOC ID by some means or have vendor
>> interface takes precedence.
> Please correct me if I'm wrong, what do you observe? SMCCC device on
> soc0 and qcom_socinfo at soc1?

Yes, that is absolutely correct, Dmitry.

> In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
> defines that there might be several different SoC devices (identified by
> different drivers, etc). If the userspace depends on qcom_socinfo device
> being soc0, then the userspace is broken.


Yes, there is no question about that. User space had certain assumption on
SoC Devices. The point to note is, user space had those assumptions based on
vendor interfaces which existed from long time.


> Last, but not least, the soc_id format is documented in the ABI
> document. It is clearly allowed to have jep106 format in the soc_id. So,
> I think, you have two options: disable SMCCC 1.2+ in the firmware or
> adapt the userspace. You can't control e.g. the kernel that will be
> running on your platform (it very well can be a standard distro kernel
> from Debian, Ubuntu or Fedora, which obviously will have that driver
> enabled).


IMHO, vendors at-least should have a way to choose what interface needs 
to be
exposed to user space (vendor vs SMCCC).


>> Best,
>> Satya
>>>> This avoids unexpected format changes and keeps the generic SoC sysfs
>>>> stable on systems that rely on vendor-specific identification.
>>>>
>>>> [1]
>>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
>>>>
>>>> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
>>>> ---
>>>>    drivers/firmware/smccc/Kconfig | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>


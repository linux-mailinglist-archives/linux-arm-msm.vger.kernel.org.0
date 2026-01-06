Return-Path: <linux-arm-msm+bounces-87709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE27CF8D6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86875302356D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 14:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066E6325722;
	Tue,  6 Jan 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="audbgGpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YX8Z9wh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA428325488
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710742; cv=none; b=tbROBRJIAOlw+0wNBPjfdoR+6ySLhiHvD24Ozsr+lJtcGOYouGI2nZlCO3UR5cJMO3hj3/GN60+KwB1YhyAl4lZsm3sPcgMQ8m3ImkKF4LsbVA9NPVRpsV6heufl3oO1S//jReNijhPUm3qxUAVJ0aWBfhanEHVqpNCHpn03ves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710742; c=relaxed/simple;
	bh=eNAOjNVr92F3tFRWKgIvOrOHSLIqRZLwoWnifg549Wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/Sy7K+lqp6zmaGiWRpO6EYKBoNBY0dGhNfsBhLZSnO/1OOlnnb5UHOlHaL3+FAJs/XPJd8ULV9weYGDOudAvuJWXthOYm7eIFz+iDZqWsLzivvfrx6IRjwRjw+R768sYd+rfdc5OYckQPMIvvGZc1jmkUvmwgkR9ysX4fT40sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=audbgGpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YX8Z9wh7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606CAFDl4048735
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 14:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=; b=audbgGpRpDXwSWqb
	mpAeUqvDjLRcZ8AmY+JGq683g8RaoXdSi9AG1Wewbp0deReUU4SFHePOD3dDRK+g
	+HlCQR6e1sWti4woU8UIM2nOlVjNFg6V7LQOzIvbmxqvxhb5fJqqB1EhXrxD5vo3
	cyO9nkjZ1a+i0vrw1nHPbsIfgXrk3JHq28ZgbHQ8Pl+rp1hCF6HnfAi1jv1kN8wV
	sFSRh+EUy0RnrbW2FFqM3MCCQB6R1SLM6xzLQGn5dUYkoCdtXAqagVvYOUQ0q4Nj
	PY3NTaHA9QZYPvdglh0r6QKebjZT6fHBuJ/DAeo/vmxw1F25bV+3rugiQtc73urA
	nPfy3g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rrdvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 14:45:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f66686710fso2951467b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767710738; x=1768315538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=;
        b=YX8Z9wh73uDhlIe8cEAkBI5p2Ffq2ZbHo0hYKsfAcRh3xkUIv0jsnSedLJMXf402LN
         4iayRKuybJaie3hDyPudnoux5BGo1aIga395uyO/DvjJIZgEHYnoad0JhsJhtly8u1/U
         ub7SeHdAB/n5c8cA3NA71wG373/FYwB49v5NCMUE34+qR94eOTkUGm+FXAKFCShDgHhp
         wqgL8obPByZZZaNPwA5aOPBbvllKmTJT5d4wRh5NAo8F/8rOAFTeJ767+ptoMKA6H0YF
         wEONqJruN+9z1FRrIsifcZYXbRfM1Owz9CEoikLZXxPq0+5pb9C5JP8VJAgGwE8wNq3s
         /l4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710738; x=1768315538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=;
        b=ACHLC/QR0b0A0HwGx/6f7Z33lBIvKb34QuLTBQoCWQBIthtVMnwrUCu1RTC1/8BwGz
         /NpMY2DQstdu038tXbXICVd+X/xwSGclffZ/x/3RzP+s/0QClJG2lUhpBqLpZPVOvihC
         MqYALtksFpZkaJnFS3KIHyUM2dU4roWDki3OUV2OEUwvVxp/blTbuPnZehQqq7yoYrN9
         pHoj+1Pb//vguk3n+1rMyGl78Fu3ish0+R6+sFIWU3zyEtoD7aWKGdM+yPTJEwJi+3Es
         18rmzXzEsF3fySLNgfh3BtUR1RokoYCTedsfFpnJzXw3lNca+8zLFWi8dXw97JnG7cBJ
         6v9g==
X-Forwarded-Encrypted: i=1; AJvYcCWj5iFLs97Tbm5aSGMZxELcTLJAxYcg9kZOtKzm59TpzZ7nwL0xk/UyMP0ZWT4c3iiPOSNbl1vKuAxb0/x8@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgXvFRf9zL7mOWFzkBRSamF3U43PrzIbZuh5a4QiwNKh93AnE
	rPi6wtkEMvXsf7mM/FT5KGfUNBaiBq+Vx/6lrNt+YfIn5bDkiRL02Ni7BOqdOjKO+J+aM+mrzD2
	WqXUCb38nima5djbof/vdV4WvFNJoH6XmGjl9WyW4KnMkkImBW4ZvqHB6PqGYmTMxYMKm
X-Gm-Gg: AY/fxX5aHVMd3W7T3w8fNfFHRJLByKde0d5BuSlNjVBMjmx+M4jqZtPn56205ebkC92
	89buB3AxGorVzHsqkdCs93UVK2YDqrDb7PVOUz5i2zGKD5jF93NFXwsFLC1J2A4ZLKZm7vYWnAk
	kBAZVwkntz6cFfGeXH2QF1tLuR7qLB8aWr5BoM7UGw0ObaskF3xlEnDn5I6IUxEambK5fYNJ3nI
	/HMwofPcWpo5lcD26QDVZxO1YRh+XVThnwrtwhIpjoKIKedTQvbSU8lU7E1kiEuM2MsXKyif6y4
	JN4gfnWhpbEQa/qa2jREe5L8ou6C6eNZry2qKlBTgGLhRr7UrTsgX5prtclNi3Itw334jUM+dhn
	vUK7Q3BsVpcMwDEHzGgdPQgZWjwZU01/HrFWI5f6+m5E=
X-Received: by 2002:aa7:9a87:0:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-8188115dd33mr2789005b3a.5.1767710737565;
        Tue, 06 Jan 2026 06:45:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFDkO1MPs6jk9DhiTL0y1oFq1kAN13vdOai6+rAL4mB8VzpMFwz2vdGbIXz2c0/G92FT+f9A==
X-Received: by 2002:aa7:9a87:0:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-8188115dd33mr2788972b3a.5.1767710737035;
        Tue, 06 Jan 2026 06:45:37 -0800 (PST)
Received: from [10.216.40.68] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5de6405sm2450578b3a.61.2026.01.06.06.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:45:36 -0800 (PST)
Message-ID: <466fac7a-e16d-9c49-80bc-c07ba5a5f334@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 20:15:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
 <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
 <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QaLBFPi9CEi8oI-nkkAkWPaWPEI8LAfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOCBTYWx0ZWRfXwQA17dyzBNBg
 evo3XGpfEtkmgYJCkjCpZMF4OxUnFZtRELWuutiGB88jCNmPD+PQ2LV0WQMp+8U07eN9HdAnEh2
 UexYLdW7t/XPgoQFe/Y2YXIlWoC+5nQYEOZUFU9py91iTgWsOJmx2c2p+oxFbBn6l4ZhSNdMNO4
 IAKW/fjGjcwcEBg4p9SEWJMhfCVu1cfENfr8p3s1Y2FrxYodItiIJ1lijYnqf7d3xyhYjC6jt75
 wgvdtxSkZlv9GTO46RIpZ5drD5jJMPl3tpiKEN0kyIu5r9Fmam4sKEOLMMeT1lGCvIpRGt8PcEj
 0j9eiSc/Bp9SyKknjI1S5nrTtbqltNZOt/t+YSu85NG5JKOBeh3xgjAEB8b3M9cxbn9DZHxz3Ho
 zX17fUCXnslUGE1TZm1SjOyO4AVeF/HIIYLrRqE7oDPzHILXOiCmSoKGTQIRRoqnjDf0Faf2bfO
 PKRalbSEFimQ2l/dHfQ==
X-Proofpoint-ORIG-GUID: QaLBFPi9CEi8oI-nkkAkWPaWPEI8LAfd
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695d2012 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jnZpEnBlv3Rj3AlvUe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060128



On 1/6/2026 6:04 PM, Bartosz Golaszewski wrote:
> On Mon, Jan 5, 2026 at 7:06 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>> +static int __init psci_reboot_mode_init(void)
>>>> +{
>>>> +       struct faux_device *fdev;
>>>> +
>>>> +       fdev = faux_device_create("psci-reboot-mode", NULL, &psci_reboot_mode_ops);
>>>> +       if (!fdev)
>>>> +               return -ENODEV;
>>>
>>> This will always create this device for everyone who includes this
>>> module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
>>> call from probe() here instead and don't create the device if it
>>> fails.
>>
>> Ack.
>> Will move both calls to init before creating the faux device.
>>
>> psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> and
>> np = of_find_node_by_name(psci_np, "reboot-mode");
>> --
>>
> 
> On a second glance - and I may be totally wrong - would it be possible
> to switch to using the auxiliary bus and create this device from
> drivers/firmware/psci/psci.c? That would be even cleaner.

Till v17, device was being created in psci.c. Lorenzo wanted to move it
outside psci similar to design of cpuidle-psci.
 
https://lore.kernel.org/all/aRIfc9iuC2b9DqI+@lpieralisi/

thanks,
Shivendra


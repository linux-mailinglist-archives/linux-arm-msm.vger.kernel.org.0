Return-Path: <linux-arm-msm+bounces-114786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7pvyNmtaQWoBoAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:31:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E026D48BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:31:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NzVjkylx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ha8k3us2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D18843012C6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 17:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A342F8EAE;
	Sun, 28 Jun 2026 17:31:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543812DC765
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:31:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782667868; cv=none; b=g51e7/UlgSm6SeZNGN0Ev9MLYmY5HARyVMepdPnUTvoSRm05sxxnrgtZQRj9DpeA62fF2xvCg6pKorKa9foUlmyuUfZLZH9q9N7+/AQsMp7BH1mglG4I0w/oQEOomQWbRDZ2ZwY0CpRz340aRuSXN6BTTKMuBa4QKZkUQeE0SVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782667868; c=relaxed/simple;
	bh=ZT4Oi48MQ2edPaWjW8khM1ET81+4j1v2TQ4M0MI6hX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nytEzB/PwV8KMeWnGFWgaAyDw0Ye9aR/vfHltnocmOwUXNNgPBOSW/uKDw2coS4vHHJSgOZ26oCCLMkd+QBnBC2QlIpu9rNn7dZZIBqlyi3eFX0i9IazXJuoXMLyMdjdDhBHhRc6hqV1NcULjgyzyOzVQK+nMsQ4xJzqBzgjVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzVjkylx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ha8k3us2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SESl49008285
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=; b=NzVjkylxUjSWlaA4
	g03Tq7LAV2Yhm3AjQYZWm/oEjfM1/OvIFu7/0RbkV+K5MY8GVoELRGPrnkxclIFV
	cTuuQVXx1t2jrD+DSSPff1jpUChZyG+DsaZ5+XgeYObuDVxXLJyGa4ou7oUNM09X
	3N9r/nuPYEw/Piu7NUaakINNB0pvBtBdIir9P7MebKCZhIeF1oedKH5ljMsH8L9X
	YqozeKwYCVBe6J/4YeWiyVkFPms85ZVLFikjExrXM0Edsg1RLGiWOKRAXbs3GMcD
	WZ8/IZe7BlVyKBLaCSkiRc/w4zwqs2QJPCXsAYeNDdBJZ/rIBJx3kDxpEGfRoYU2
	5RAvvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf36t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b8fc5cc89so319288685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782667864; x=1783272664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=ha8k3us2yjr7ofmbSD9rt3FfuEqUoVZURiuUlj6HDSX/WxNlTQyrget+R6/oDMGpbD
         yk7ujqPBBd5sRGpCleSMFrBvNVVHW4hLUlH4GD3UKTEGnrdOA9OmQOzVHCCT8m58xG2r
         XtL4Bbj9YDy2la+dpXzG4zjzwwXgWmuPJHvfjY8N7BlFDrHa8qOVi1WzZ6lCFfiJ6yA1
         8rC8J//QOK9MgKi9ZP1S2c6jMck9ukOEshtvCutw0/dbwo2h18r83y3r8xbN6C6Xw59t
         DdFeYprrVB+JR7OxZ8X3H+U7IWYE4bReGFRn4xLnPv0+EW7WMb6wt1BK86IimGnVQd62
         UgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782667864; x=1783272664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=Icr3k5WlEpxdanxy7mXl66/+UdSn36M3NI9RrdrZNUpueKkzS28LkKFkMZx2LQPT+C
         Op0Dt0HAVvglXcNPolsShM0c7UjX+n2yesOwWFY7Hd2zT7UsdZh4vVuLZ3dLsFgVuLg1
         7iyV2MCx22ldH7rFeHxChjqngxjJYbmj8d/kgxBsPkuwMaBNGpYQvBonWMwe9JhoxJ7X
         OK9VrYnlua3SKsdlKSDlUKab2h7P5lwUfvqaKJPtAJmPLj/17Ic1O7oYL61M/XzTTkq8
         DWmkMQuM4V3TKzLrslIwm8nl2K9XaOS/gcNBNUZgBf5PvXNumY0XhENf/HoZz5SaRDGq
         7faQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PbqyoiUT6/VF8zcpm5fzITFH0X2LIFMiaO2WkFo2qQByTH8jlUioKfX/r2vm8nORyLV4a4UT8Ffg9N3ia@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0gRAUACtMj3tmxGKjx2cIL/Kej4u4kJWDmH4hh2B39tbcEFS
	UpUkTQWmsYRh1K7Nn/FCQSTOr8QU3anRi4cmZ95Sil93kH4sL7mAmxIzcCc6iURPjR4KZfaLqLI
	At76g5Xw8P/USP7nQ6rjRb9MrCXlEeK/mL0hMypsgOWdUtBos83EdP9xEhI2hQXBPHCIx
X-Gm-Gg: AfdE7clgINvKrVI5ZDvCRoKvhnp4NI8BqrurAaO/HVXL9FueUly0CXqzTrdOZzYsTn+
	xe6A9pPk6lmWo7HIWUFvaJ22HcF91ni2+L3fJtjbqZo5z9byFIomkLZTIKhYPrN5BxVXGLBY7Zv
	Bh6acFph5uFgE/mJ246ZQhqS6SFFywBdEW4/uqZQYpWuTCNqCRymQVIxiCBZ0FTGaQpiUrkKazn
	M8D7BZSwoJt3Q8u5ZE9ZVJAM3SCMj0z9n3E199U60AHMeECDVpIPw4Fu5PunM3s8krea6T0u0AA
	IMeRR8Kb0HdmF61HwE4WgBGaCSvkdpgLp5R8s/192vB2Dq0pz7NQvsnE/A/r2lvhjUBcMSFnafC
	AJMy9xA6ymNbd6O+7M/QxVUNLagtxKGvvbYdv6TAP5wsTQOzRveJDCvUpZZOSa6Fz7RHQOao=
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058531585a.22.1782667864504;
        Sun, 28 Jun 2026 10:31:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058528285a.22.1782667863990;
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4932f100e4asm144355955e9.1.2026.06.28.10.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Message-ID: <8e7a604a-4cd2-40ec-b1a1-ae5ac68c4189@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 19:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <akEj6XEByCOkuJaY@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfX8rvL6d6pu1uq
 xySDHOTdnCZq/vhBjj8iPgC82+FGso8qQgGVYoB/XSY0RYNLzUX73f+gwruT2OB98PQ3T0TIoWI
 2qszYRnQwnzGtythZc741Ni/832rJfM=
X-Proofpoint-GUID: ERxuImxU1k8jqL4jBMlr7L7yFl-i9ZS6
X-Proofpoint-ORIG-GUID: ERxuImxU1k8jqL4jBMlr7L7yFl-i9ZS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfXwsd0Alq5Iwvp
 KrBHQOdnakcNII52VGatK2l9NFlYTGuMs//eCtSNelEV3neoi6eTEGWFz76A3HRPp8J7FZ5iDYY
 FPgfllrGw1FArXvSRQ+p4HAmo65ZgLiRraqEXpJg/7KpIkmgz3TZxDwDwOJWF9IGKzJYDURYpUQ
 rTfv0Ky4lz7xPfDqpTmAm8bxkdja2vZ665WfHL7uhlbZErwXA7cDwN/rsNwMEpsKmCOZIT3GG26
 vfNCOjmzBqYAx8nnBgeTaUCL6BUY0OGjJJ0mUiUGcRrsD3xE9A3PeOGCkioeVy82Elfdm/3um8s
 PlwgwCLS6XSwLcWrdqFTkLtIhK+YXfZ6yLykJB8GmSgF2eurGQoZgKkFNSwVa8AoAuFw1pUx2gu
 L8RPZQ64rxJsevvkGnK7j1zab30AplC58vDpiHo4+rGR8CKgv8EQh2xqxoc5fZZamB9MdgxvfAB
 8g5v93liInJDaNEbDuQ==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a415a59 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bjHr9k4kyxrlvEBRdikA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77E026D48BC

On 6/28/26 15:50, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> I gave this a try and for me the fan data is always 65535 (i.e. -1):
> 
> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
> t14s_ec
> 65535

Strange, I have:

fan speed=0, temp=40000
fan speed=0, temp=41000
fan speed=0, temp=41000
fan speed=0, temp=43000
fan speed=0, temp=43000
fan speed=0, temp=44000
fan speed=0, temp=44000
fan speed=0, temp=45000
fan speed=0, temp=46000
fan speed=0, temp=46000
fan speed=65535, temp=48000
           ^^^
fan speed=1903, temp=48000
fan speed=2345, temp=49000
fan speed=2367, temp=49000
fan speed=2417, temp=50000
fan speed=2431, temp=50000
fan speed=2430, temp=51000
fan speed=2441, temp=51000
fan speed=2450, temp=52000
fan speed=2457, temp=52000
fan speed=2458, temp=53000
fan speed=2458, temp=53000
fan speed=2458, temp=54000
fan speed=2460, temp=54000
fan speed=2572, temp=55000
fan speed=2788, temp=55000
fan speed=3009, temp=55000
fan speed=3229, temp=56000
fan speed=3424, temp=56000
fan speed=3610, temp=56000
fan speed=3631, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3592, temp=56000
fan speed=3592, temp=56000
fan speed=3588, temp=56000
fan speed=3588, temp=56000
fan speed=3594, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=55000
fan speed=3594, temp=55000
fan speed=3594, temp=55000
fan speed=3592, temp=55000
fan speed=3592, temp=54000
fan speed=3588, temp=54000
fan speed=3592, temp=53000
fan speed=3590, temp=53000
fan speed=3592, temp=52000
fan speed=3590, temp=52000
fan speed=3588, temp=52000
fan speed=3588, temp=52000


> This is with the fan running:
> 
> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
> fan-controller
> 2564



Return-Path: <linux-arm-msm+bounces-89039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C40D20678
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B5EF3038009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365713A640D;
	Wed, 14 Jan 2026 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lztIuwx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iye3GIoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638B37F722
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409886; cv=none; b=nVjGPYno/NScXc+CKy7k7HL38aJNnGzlSaHzUHfqvtNnvl5q46EjCk35j5Nywdz/cVQtQ7hmAp8HARDMb8kOOnfgPZm/PriNVEtGfZOFXF6zQr4HeZp5fkCoOrMopZkCmr6+w5xi6lHvEJFcoyKfhH+aL9TV5XfN/tE2/xM2Yoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409886; c=relaxed/simple;
	bh=uzdSG5lYeBXVCH2ZCLrTp+haEblOsxoF8BtLt45qvGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbErcOppyog3UybGN/UihfVvTD3EwUK2uG/yvTKW3dMqs6vVVmLqXShJI9edg/i+k0K0WHWeN2olEyubuIygO9S6fIhUgV2nQTWuFthtafGOQOS2HgwC8u7cEUg0PlZ1gnGM+YEjzGTAEhNxvqcnLSh73Vjno3jPFjLOZtNmDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lztIuwx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iye3GIoC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChUJG3925408
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dFg0ZU1cAsHhMYlwQqI8U+srvs69g9Bu04eiqf48wEo=; b=lztIuwx9z6zbyPP7
	kEdfuM6akt9+ukcFEgDy8gDnzbIjDO5xmvMUVkss5JruUb7ullgmDGURkDVBPprr
	529g5B3i2P4Dut1aBIGK/hqcCxLNhgNxmAtLIDM0OAXA8EWBd6PtZl421BnbCM9k
	pPjdScQh2AsTcc+ejlv7DUQ3id+G4mysWLY6RiLj6wSk5YqpBNWs9gzLgx8Am7/6
	VqWpFUKx7x9VKSZRe3fR8TggDoT8L3Z/ykTcY5ET1GnSRx5NyUIZxxbnPpTAta4P
	UAX4CH3nv3bow7p7IAJqs/4m+MDQLMM5nbsGmNJLdVJM6D1jTZT1JgVLpPoJlVKN
	CNJqdQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbrv6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:58:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b47ce772e4so63892eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768409883; x=1769014683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFg0ZU1cAsHhMYlwQqI8U+srvs69g9Bu04eiqf48wEo=;
        b=iye3GIoCpB6KZY43WO+JtEvWX8TmGWWfUnXQ+j5m5OB7sN6tW77mjEzPLDj6hmyD+Z
         zvOFw7rvHtnfVpJJDRqffpzImfFaUBJmfbz5Ef1CZxufas+qNTYLIGSQuvNmoSa0oOXj
         L/0DlOvIJZK0XHOekS8wCAES2uJPIfCrRfoAY7Zl/OeyVPv76r3ocGW8FGXZSuXi3Ag4
         jtZ1yVOjbIuuX88p1oXCT1QoXsZsu6Lj+Gv62D3XngIyw/peCv1yJ+p794B010UaK5Hu
         BMn0u52ro53cO1fa2C4c8fM5nVOLLKGO2cv4rEc9cg6wqtv1DFl+vlPEWGBUWXeeCKBy
         jcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409883; x=1769014683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFg0ZU1cAsHhMYlwQqI8U+srvs69g9Bu04eiqf48wEo=;
        b=LHR3/LyJE5AbW7XWLlJIm+VLSp8KgwkVaWdnfPUtRcMNPvO3oBQL1QT/8SKFxOCCHo
         I4qV2FBt14TGU9//xcfoQ1eAsRbuzXt+MwCGdTFh3Z9TyO4FsaK7hjQJHlgmp7FHlTKP
         TlU57hPatYKmuLdEKHPU+lYFxvoXAPXEZersVGm8BpZb6cCFmQ8IM39eNkvBWUtzxrZ8
         kNioAvWjaFKZhd3hqWOFKQ0xckmTm+6JnB98a3736YQrtvAdBt+taMwJ3tDITl+h5uXZ
         KTpYIdy4Ai66iR6quAZ9hI8PwdYocTHu/j551KVcUDxD2Y356LlEgGPzZ+sKy8AFwrtb
         fMig==
X-Forwarded-Encrypted: i=1; AJvYcCUmfgGqkWuR9dbH0VMgMEGuITowNiva+PO2CcLzyDToDgvJgsUviNfsAuD4hrn+8CKnj3XC5pbgqBd90cTp@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWEQkeTzLLzwn9lMkrT0zUJ1ntT8TyFtjp/wwoVOAATJ6cEL1
	VlWAYcvqTCj72vXYiFmrrDu8VwBK7N5YWUliiUl2bVli/uK6ccfnmm38YC+pQvZXq1LGtpeQf8q
	yavXMf+KCwG2uNN3/a6Qp0jLLaQSOiWObrZuCGcPmnHmdE4t3Xujqr1qTz6Dc1hPYwkvp
X-Gm-Gg: AY/fxX4VzP01MfuUOFzy71RGgdEy7eeeZnmGX6BW3w1YCEy0wIWBAHweArgYDKORmrv
	tdhkmKiFACZHFeSDqbF6w06iFhRbMb8wvjbRasaClpsu7GEzhcxuK49yIqdexJ5uliOnqdC8ldc
	Lzw7WSPKZxsSqNCAQF5lVD7unN9q4MrI+D+kFn41FLAFSSSU0Kn+WTaZKsysegDwFn75IGsgRh3
	bZL/DACIerfikd+MHBYh3sbZGP0o6R6PXZawf5oVn5JsEWp1F0/YJ4HST35ev3l2PlYmwFidtjn
	TUFI0tDFLreF+a1mK6hSab5I3SaHiXshiv3oF/tboBaJkDY1bxjMPmUThpif3hVxdlmnsnV1f3x
	s6XqJSTv8XccTjHpA9dPvJahyhhrWbc1CaiwH0PKCvw==
X-Received: by 2002:a05:7300:cb10:b0:2ae:5020:afe1 with SMTP id 5a478bee46e88-2b486c94e69mr3996890eec.14.1768409882900;
        Wed, 14 Jan 2026 08:58:02 -0800 (PST)
X-Received: by 2002:a05:7300:cb10:b0:2ae:5020:afe1 with SMTP id 5a478bee46e88-2b486c94e69mr3996862eec.14.1768409882321;
        Wed, 14 Jan 2026 08:58:02 -0800 (PST)
Received: from [192.168.68.59] ([76.93.176.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd8fsm23272007eec.20.2026.01.14.08.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:58:01 -0800 (PST)
Message-ID: <6e674553-d0e5-449a-a49f-84f5d32cec94@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 08:58:01 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWYk_qGvA9Kn0xGe@willie-the-truck>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWYk_qGvA9Kn0xGe@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6967cb1b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Q5rFrUx7DTp4enn/YD2GRQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JZMqPXA25EcJQqw1oVMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: fzDvVGfGrv8s-7v0U3TQ65pKAWCwcnox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0MiBTYWx0ZWRfXzsPI4FnnRMDG
 IooT+yOLX8f0e6MbuQcGppdeEFmCEmREumVTow2oFUX4A499zrObWl9WnzYmqz6vfBxUwc36Ha4
 gIFbPM/VJkNPhEacnlPT9Vzel/k9cqNhwi6zRAaoVnauR60x6MQQDX4lcMsZ9ItOsWGMemor/OR
 7QrO+adi4KJSOCcYbe2Mn1fGwzoLx7spbBWWbGM5tWMAm2GJAlw4b1ZvZaa0TJUyuxNTOuPf/qL
 WGBB7srEKywek2zdjv6bH5uOvUiRyuDT+gvCkLvrdf941ljTMenmvLZHNvMRycrS+HeJuwI4oU5
 f06s/3Tgm8JMj5YYd5NhHuGUJGaCc8psR/uqeypbFM4N0PTMly+eK/vUoWqRshd+NlCutjfpp1v
 QGHTZjYmMQPpCqLSJC9QxqP9V5KRP7svbLzcZz/6/yUEGXgtwX/5LNcdXxbstYTt6Tdrxl0xK4U
 FRIxBcW1zLV00EwCJiQ==
X-Proofpoint-GUID: fzDvVGfGrv8s-7v0U3TQ65pKAWCwcnox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140142

Hello Will,

On 1/13/2026 2:57 AM, Will Deacon wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace consumers.
> Isn't the fundamental issue here that you have multiple callers of
> soc_device_register() and your userspace is only looking at soc0?
Yes, that is right. The issue is we have several products which already
uses the soc0 interface as vendor interface [1] existed even before the
SMCCC SCM ID [2]. Also, per SMCCC specification, SOC ID is an optional
feature. So, vendor specific implementation can take precedence over
standard implementation or a way to disable SMCCC SOC ID could help.

Best,
Satya
>
> Will
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/qcom/socinfo.c?id=efb448d0a3fca01bb987dd70963da6185b81751e
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/firmware/smccc/soc_id.c?id=821b67fa46390baea0ac5139a60eaa48805261b2 





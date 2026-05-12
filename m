Return-Path: <linux-arm-msm+bounces-107042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAiJC8nMAmo+wwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:46:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9449A51B3A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53BEB3019FF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB23368D66;
	Tue, 12 May 2026 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIgkPZMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0Dz8fs4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CD357D18
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568380; cv=none; b=meeB+MW/Z7zsnEKlOm1wTnmQ1Xq4rpuBhmxQkbuSJAO9bpVnDcj4XzH+DIG4dGKAxrvu3QKIx+L36lfHSgA9okshQNSS7fFhPHI2ih2vWbKQTfNG+CN8bRGZFusVzFHl4PHoKt5i1J0OPzr0or8ZyiD1t89Fv7PLu7qIoJQrO/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568380; c=relaxed/simple;
	bh=V/t792VyAJQ43idxgpGa60nXaS0FMldt5X8RwmJQK5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QB7l8MvmZ5DKHea1MBfUYTlPxqX/Qk+Ov2QqFJgtru3DzJ7VObuLT0iXJwP04R3m8lna3Y9TLliNVUaFLqfss18+dcKDb+BoVqBtyPPmJxyVIH7v8YMOjZhHEsNjEP0emPkdy3mAwoRYs+4tYZwgVV5L0CiLCN+mA64WugWcWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIgkPZMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0Dz8fs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BQrG2186456
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BinY4gnvTpca70aFjDGmAnSc0bvUH+YSKn9BhicIR3M=; b=DIgkPZMQDp2NGb+3
	E/R68lh9ebJ/T6wgTQNfC443HbNKOPuGstILWpRswN90Fpe7Nf6j+hQq5zMdoa92
	KfJGeXEehAUbViM3Em1QzXEaitc31c7IovJGsOYmKy/fctw3rGDWXFm3GLcx4XKH
	4JZ3nsLecpunENYA1csH2FH2vyDzU7hy7ZITq/DLLqUivb04YtNHHi+Y8ak7uKBw
	71gzY4wxXMBHb43HJ3k3jxh3rA2AccyO9mGR31fl9NAu4yD++bmGCONHH523DAI8
	FAxzXwMpNY6aFSTBm/FUx6QTJ/msYOL75MU8S7JCsp7cFOEP/Jl3O18ylY4o87Z4
	GsWYsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29wck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:46:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baad4ffa63so11094055ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 23:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568366; x=1779173166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BinY4gnvTpca70aFjDGmAnSc0bvUH+YSKn9BhicIR3M=;
        b=d0Dz8fs47zZd3M+hV/rrYZn4fPTAZdbCHovxnvQlelQbzA+fH53kzqHXGVQ70cTfFW
         j+A1f8UINtR272oFeH30mKYdMtw3Ypo+8lnE/iTptG2F9g9gs39iVOUwaHa/j99I9UDA
         un1z/jH5U8kGNMmjbjgExkvSbCQFOx4SZMGVVU7QrA/5w7NHlvIfu5VtjcTU0H8Yh+em
         YHOdAEPJDm/ktMzo31tYspcJ/vORWAHTAhCrfduCyv4iFYaagB6Y3QvrF2GA9/E5Bx5n
         z7JKxKuY9MeZCEiqbXJLrBCwxmvGnZcgLxgwMVObegIyindDV86uz6Ziohzu2XAJONqm
         R5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568366; x=1779173166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BinY4gnvTpca70aFjDGmAnSc0bvUH+YSKn9BhicIR3M=;
        b=Tz5T1oL7y/qyiVcUK28iy4UPYbUlMY5mZu6MBTGcIIwsMPofdHSurBezL8ApIRzYg7
         DOl1xcWuoFYF8UK9lm07QqwiXYtmNaqgUvwIkphf9ahEQKcOlaSFTZrFAJUj6wb4hbbX
         eiUvYJBznfeSzWnSaJmtiKEUxf1m6Cv5jp6c1/U5KjSyaBqEJwDpj517vRRJ4twmW9oE
         R1iaitItuUsSoQbG912hj92ecXqg2ez9zengXHwtJKKp61agmwyt62lg2U1Diwe1uEG0
         RJB868OgQ6ZgUra7ndllBzIToL1vb4jeYfyPP65vok/yAjVHWc/79jimkeykibZmNJS0
         QytQ==
X-Gm-Message-State: AOJu0Yzfpd9ilhD43eaI+E2Sxjfkerg+EeSami3MlLQsxJCrx0ygGbmd
	T6zXV2xYahUh3CHtCWt9KesYKteZR2haPSFt8wSeID5MpOLEWliG4xWNunvsL/hNl/6riavQXYj
	zJjwDo0g8S0xvFUMBmF18gTIZqqCo8t2SUKPLmtEwnafOAfp0le0VaXj9PJrKV2JahqMU
X-Gm-Gg: Acq92OFJLmjFD8L8VZ+wfIYwKfTmjOy2Ena9bFCo75zHpNJTynU7t/iX7rtoSoc8EWg
	QoYV96pxNPZi+bjcfLog1lwWU5BtNklWpygd06ucxyyzC6ynEHqR74JzLdTPE5bqxOniXRnqcmS
	0GzJFUtAZ8m05UCLOrLpo9yk1OAsGufObZ45LecMErn9briRT3hlbG/5xk3kOOWceI4fLsXRpqk
	BSfBMeqAculhgoRanTZkImBPzTw8gZNZ0KE/pVWE0WN46XLm9dh9huqRdOwdunoIPfJ5ZZKSEic
	nB+jwhunGmgyF7OrxqH8vcBNDwYnWi/JEG2xCO1BGVYYX+G3HvaYnl2JIJE3xSG+AJYb71P32sg
	nbI1+5TF6HSop4a6hyf5JyrgyZO5X3pOCUve3G9o7utUwFnpwKf4=
X-Received: by 2002:a17:903:90e:b0:2ae:6220:1539 with SMTP id d9443c01a7336-2ba7b35425dmr139626775ad.6.1778568366124;
        Mon, 11 May 2026 23:46:06 -0700 (PDT)
X-Received: by 2002:a17:903:90e:b0:2ae:6220:1539 with SMTP id d9443c01a7336-2ba7b35425dmr139626405ad.6.1778568365456;
        Mon, 11 May 2026 23:46:05 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e847d0sm119936625ad.62.2026.05.11.23.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:46:04 -0700 (PDT)
Message-ID: <f95584f8-220f-4bd1-a189-dc05ffd2a9bc@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:15:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ras: aest: extend AEST support to Device Tree
 frontend
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <8f1529af-f6fe-44bc-a4b1-c47a19824d1e@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <8f1529af-f6fe-44bc-a4b1-c47a19824d1e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aBtdsAGxp-wMEiIyyXcf7cUgZ-gnECyu
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02ccaf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=SRrdq9N9AAAA:8
 a=EUspDBNiAAAA:8 a=2yO6rERebkD6Ods6SnIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NCBTYWx0ZWRfX+XugcF8SatBc
 fpHDMM1JuhJkgUlBwRgZz+AkUVOT/z8xGik6tHKgwS/e3/XwoBaTGa3YzYEe5l7olRuDC00JUQT
 oD4sIrTp6oawUcBvMLKz6RKLr3GUKjYqHMTDkIOvC9HpQX8HdNeNb/9NTxcc+/T0qkJoyVMWoHM
 /bcDSwdXAIa/iPTb+vnfcwMpS4Qu79fIKg1JEh78Fr5aZwNzrw8V90AVKOF/6c0G3A51nB/OSt5
 oXrrwDmk0HinBV4bAtBE+YNE+mnxfe/5nkhw84jJRyPZUGmIIkvaNVPpRqWugWsVomB+xUDxfk2
 2hDQ7QxlGFF4JQ+VHpPePD7wtelPrcWHTDdBJCxQ5oFV5gj+MPJ33iNbJRued0H8StHHDXhUEfN
 MaQWFTELCEUY/XIFYs/E+x8NSXrmNrthDp0UYnWWLugFEa+t+hkUrhjq1R4UMb6ohvdA0ushob4
 FZI4N9ro/jp4uZMt95w==
X-Proofpoint-GUID: aBtdsAGxp-wMEiIyyXcf7cUgZ-gnECyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120064
X-Rspamd-Queue-Id: 9449A51B3A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107042-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[90d0000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,arm.com:url,alibaba.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Ruidong,


On 5/6/2026 1:40 PM, Ruidong Tian wrote:
> Hi Umang,
> 
> Thanks for your patch.
> 
> Would it be okay if I include this patch in the next version of the AEST
> patch series? I will make sure to add your Signed-off-by line.


Yes, you can include this patch in the next version - we will represent
it and respond to all of the queries received on DT specific patches.

How should I be sharing the patch fixes based on comments received from
maintainers to you ? so that you can include in your patch series ?

Also, when is your plan to post the next version fixing the comments
received ?


Thanks,
Umang


> 
> Best regards,
> Ruidong
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> This series extends Tian Ruidong’s [1] ACPI-based AEST support series
>> to also cover Device Tree based platforms.
>>
>> While the existing AEST driver relies on the AEST ACPI table [3], many
>> embedded Arm platforms use Device Tree exclusively and cannot use the
>> driver today. This series adds a DT frontend that mirrors the ACPI
>> implementation and feeds the same core driver, keeping ACPI and DT
>> paths functionally equivalent.
>>
>> Along the way, several correctness issues were identified in the core
>> driver and are fixed in the first part of this series.
>>
>> The DT frontend is mutually exclusive with ACPI and does not introduce
>> any DT-specific logic into the core.
>>
>> How to test with QEMU
>> --------------------------
>> Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
>> virt machine.  To test the DT frontend:
>>
>> 1. Build QEMU:
>>
>>       git clone https://github.com/winterddd/qemu.git
>>       cd qemu
>>       git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
>>       ./configure --target-list=aarch64-softmmu
>>       make -j$(nproc)
>>
>> 2. Build the kernel with:
>>
>>       CONFIG_OF_AEST=y
>>       CONFIG_AEST=y
>>       CONFIG_ARM64_RAS_EXTN=y
>>       CONFIG_RAS=y
>>
>> 3. Add the following DT node to your virt machine DTB.  The QEMU
>>     fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
>>     vendor records at 0x090e0000 (SPI 45):
>>
>>       aest {
>>           compatible = "arm,aest";
>>           #address-cells = <2>;
>>           #size-cells = <2>;
>>           ranges;
>>           interrupt-parent = <&gic>;
>>
>>           /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
>>           aest-dram0@90d0000 {
>>               compatible               = "arm,aest-memory";
>>               arm,interface-type       = <1>;
>>               arm,group-format         = <0>;
>>               arm,interface-flags      = <0x22>;
>>               arm,num-records          = <4>;
>>               arm,record-impl          = /bits/ 64 <0x0>;
>>               arm,status-report        = /bits/ 64 <0x0>;
>>               arm,addr-mode            = /bits/ 64 <0x0>;
>>               arm,proximity-domain     = <0>;
>>               reg                      = <0x0 0x090d0000 0x0 0x1000>,
>>                                          <0x0 0x090d0800 0x0 0x200>,
>>                                          <0x0 0x090d0e00 0x0 0x100>;
>>               reg-names                = "errblock", "fault-inject",
>>                                          "err-group";
>>               interrupts               = <GIC_SPI 44
>> IRQ_TYPE_LEVEL_HIGH>;
>>               interrupt-names          = "fhi";
>>           };
>>     };
>>
>> 4. Boot QEMU with acpi=off:
>>
>>       ./qemu-system-aarch64 \
>>         -machine virt,accel=tcg,gic-version=3 \
>>         -cpu cortex-a57 -m 2G -smp 4 \
>>         -kernel Image -dtb virt-aest.dtb \
>>         -append "console=ttyAMA0 acpi=off earlycon" \
>>         -nographic
>>
>> 5. Verify probe:
>>
>>       dmesg | grep "DT AEST"
>>       # Expected: DT AEST: registered 1 AEST error source(s) from DT
>>       ls /sys/kernel/debug/aest/
>>
>> 6. Inject a CE error via the QEMU MMIO fault injection registers.
>>     The QEMU device accepts 64-bit accesses only (use devmem with
>>     the 64-bit width flag):
>>
>>       devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject
>>
>>     This triggers QEMU's error_record_inj_write() which sets
>>     ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
>>     aest_irq_func() fires, reads the status, and logs:
>>
>>       AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
>>       AEST: {1}[Hardware Error]: Error from memory at SRAT proximity
>> domain 0x0
>>
>> Testing
>> -------
>> - Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
>> - Validated CE and UE injection via debugfs soft_inject.
>> - Tested ACPI path is unaffected: ACPI boot continues to use
>>    drivers/acpi/arm64/aest.c unchanged.
>>
>> [1] https://lore.kernel.org/lkml/20260122094656.73399-1-
>> tianruidong@linux.alibaba.com/
>> [2] https://github.com/winterddd/qemu/tree/error_record
>> [3] https://developer.arm.com/documentation/den0085/0200/
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>> Umang Chheda (8):
>>        ras: aest: Fix shared processor node handling and error log
>> messages
>>        ras: aest: Fix CE/UE error counts not incrementing in debugfs
>>        ras: aest: Skip unimplemented records in debugfs
>>        ras: aest: Add panic_on_ue module parameter
>>        dt-bindings: arm: ras: Introduce bindings for ARM AEST
>>        ras: aest: Add DT frontend for ARM AEST RAS error sources
>>        arm64: dts: qcom: lemans: add AEST error nodes
>>        arm64: dts: qcom: monaco: add AEST error nodes
>>
>>   .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
>>   arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
>>   arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
>>   drivers/ras/aest/Kconfig                           |  15 +-
>>   drivers/ras/aest/Makefile                          |   2 +
>>   drivers/ras/aest/aest-core.c                       |  63 +-
>>   drivers/ras/aest/aest-of.c                         | 673 +++++++++++
>> ++++++++++
>>   drivers/ras/aest/aest-sysfs.c                      |  27 +-
>>   drivers/ras/aest/aest.h                            |  15 +-
>>   include/dt-bindings/arm/aest.h                     |  43 ++
>>   10 files changed, 1310 insertions(+), 16 deletions(-)
>> ---
>> base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
>> change-id: 20260505-aest-devicetree-support-a3722d90e1f5
>> prerequisite-message-id: <20260122094656.73399-1-
>> tianruidong@linux.alibaba.com>
>> prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
>> prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
>> prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
>> prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
>> prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
>> prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
>> prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
>> prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
>> prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
>> prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
>> prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
>> prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
>> prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
>> prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
>> prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
>> prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24
>>
>> Best regards,
>> -- 
>> Umang Chheda <umang.chheda@oss.qualcomm.com>
>>
> 



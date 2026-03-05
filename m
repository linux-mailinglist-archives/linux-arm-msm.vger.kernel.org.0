Return-Path: <linux-arm-msm+bounces-95680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLT9AQ7DqWnNDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:53:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DF216961
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3471630215B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 17:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B8C288C2C;
	Thu,  5 Mar 2026 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgU6YTaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHp/+bbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742626F296
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772733194; cv=none; b=OSCEbFiVfKVF423f5lk+AAa8SVMsrzw64jMu/ynYoizGT5wQRQcMqadeON2c2RRkMUh3+Q0E5fin60wVVuqSXj+SU+u8sLxmg9aUMU+mV7kx6nXf6Y5UQfD/w7l1JCVYh5L7gPhqAbgEZVIph3cP4c4nAtREMUQiYDcG5MNy1ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772733194; c=relaxed/simple;
	bh=ROWnuy6Rn+2HRwecaqRc3kEQ3SqRfK+w/L6FaAqeaAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJD3vwdBcQrX2hNh88h+xHJSmTQmoC4TejcSFF2Qjx1VdSwbUsDTuUhAfdRyBvJNdK9lJncG0KtUUylj8X2OyMY+zJLYHDLqG2Va4+5T0nhEJ/FiTxuUGkfpnx8HrqK8zq73e9En3mVshFiNdMkjyXVjtMXnv0RwhNI7HFrtYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgU6YTaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHp/+bbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFrro456172
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 17:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=; b=JgU6YTaTq7fpD4MU
	S/8pEqJlucTfas4yiL+8tyzScKEy0/aBWrrcE0EfohZ+97WBx+BPQyOZR29zvIm1
	5dfddeY0o5VWpFmTWiZvgbfARXYvWeMTDZLYa9btBL2LwmFwK47woY+EPLQ+IyL5
	V4xkLgxANLR6ltvz9YyPvhjy+lN6ElrHGRGEoNDdER0Up1nC0R7JgnqxQAAusJqk
	7Ac+lej1DB1166lHFOs0TLSdK1rrjNB/UJ+ztoXj4CBFyRvNsXpjma6FO8SW/J6Q
	vi3Z67EvA7QUT4PdpMbcQ3gS+xjH/XSQ/j2QIHOrG5REshh5g5PUAQBCjVmwi0hN
	J4iS7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wm9kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 17:53:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae6961bff0so104615845ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772733191; x=1773337991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=;
        b=WHp/+bbQ+t6tATg13HGHbrx0E5NO0SZyKD6Y6T2d/lEqnvYD9uPJJNkV5ULeh8/e5V
         N3dexkeqJQT8c03g/c629DBj5gFkPHBZu+lbwUFUm6AH8NI9igTiRCkTW2AKvIrsQM81
         f98W2MnnxJbmivwaRqxIRncaeIhK6qWd9ia/Kt1HyOZ0Gw2lkInRjB2yVWfL/3VzNbNl
         v30O41wcCl6vLL1+1Uo1OIF1CQcMkseMm57N3GtfVwpuhdv4Ju5QDhc/S8eo9nHojXpv
         407+6vmBpye0FPLbU3o/IG7Ry/AsCKfmgDeK3VYQWi3veRnfk09ouD4SWGVIntve/tns
         af/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772733191; x=1773337991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=;
        b=pPGUxb5V/nys2qSmTFrbJWs19dvU9gkAV4hcGI/hDOAU7ht//PQxGiCgmhR4J0JlnU
         /L7X/XPdejT4mZL2z8vl3qylXyxyADwQR8ox2W1UtJkNh2M5lJAnXlJFWLuADu0Zqmub
         HLoy8TeUo9z5MLq7/qu4rWzLJiLPfQU24a2bzWjpdbsbfOf5wsbH2N1QDvwQE7hRxMGT
         atggIVXK7Znh8Ku01rGIMuHJqSLl++gmebGF+oeAkOFZjpDRcBHorMsZrCIyLaIJYHhm
         p7xJP3weoQFUdWZcjVRl3cvLjoi5qt15xEh6+UpJznKbzJZS+knEflOpx9x/SZzdngH8
         9xpw==
X-Forwarded-Encrypted: i=1; AJvYcCVSXONm8ztlqj+7hfRsTF3EXOOF0AGyqgI2nYi9M5FKUfB0Q0OGLWaw/xDfl410+134Yyar+KqYJg/p1f1x@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwme28XMEnAMzrsoEbWgMML+Sk9UNLYDRs+dQmGorDF3HniNLJ
	k5hcvvhiuCQWKLO5+zfUM7lx6+Hp9+iDKlxYPs/y+F7oNM4W6/yAPhletP/s0qld23iV/640S9y
	OqLXm5InwMe1UsjD3i0Fs+cnnq8MmBzZ8XCjnoDx3l4VFTQgoJ/NajtICOa0LicFbIJcS
X-Gm-Gg: ATEYQzwjGQ0AmNGro91ou1G/ThQuRgnCS5t14XYm22AIW3a2TWwYhi/JpD7SGXNmrVc
	r/0rj8+Uaj2629KiOrJf5ImW21tuXF3Wy+u5WbHdZaz5B7A8YWDRq0h2ygJDvfMskHeovb5kup2
	/lwCxN1QeGEMvTudpgi4uRWnVlkhYT0DCh30+e3bn6O3wS+oJTO8LihWK1wSsBrqGU1EuVrci3j
	uw96lFCm9rieFkCdbdrZBAAWvII7PHhnnfYAd9socwngUV8d8GUFqMDKzlUVcXTapD0V3zQxRuN
	YyEsww3iKAm9L6ybhbOdjDm32juidrxkVQxPehqLMeQsVX/Pm1OJc/uYVbC+WvCL7dTt+n3eoBt
	jxzbwYwnYFomgTEdWWQVjrV8BVYPo5jqsGubRVrIC9vsdKL4OrJXvlk0=
X-Received: by 2002:a17:903:38c8:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae6a9ed5ffmr69921815ad.8.1772733190706;
        Thu, 05 Mar 2026 09:53:10 -0800 (PST)
X-Received: by 2002:a17:903:38c8:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae6a9ed5ffmr69921425ad.8.1772733190225;
        Thu, 05 Mar 2026 09:53:10 -0800 (PST)
Received: from [192.168.29.31] ([49.43.226.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae464ffff3sm143642605ad.42.2026.03.05.09.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 09:53:09 -0800 (PST)
Message-ID: <c3e94089-bad0-4cd7-bde2-c17e16712467@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 23:22:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
 <4d4cb697-17c0-4610-b498-04a3bb252923@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <4d4cb697-17c0-4610-b498-04a3bb252923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K_eu6zRZPoDwR4OwUVCPEjlvdOiHXpXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE0NyBTYWx0ZWRfX8v6VAbi2057Z
 sTXN+JzbIH/kdq9fbcutkwo/xF2n8snzTJkpAAxWhnPwLRRzyEiThudhbM7yLFaaTaUJLp+OCz1
 b70rx7f+dCJc1Hg74WAFobguTrpeQqT969q45yBFcgBh7Vd5oDqXBszeuhMKRc0HDpF9a8WCpYZ
 uI1conc5DVEpSk+DPcwqB+PUxfVQaUrTX1ePZr0mVSIq3y8ChmM0DJcinjc4tEOtX5P7gPQnsXT
 O6LcERp/VhiB3lMfxN8E/gCgy0afM/XIfwGm7sQdavSpvR2RJa3fIyeH16OrkvKiCQOXpYCmRIi
 juxoT7dYws23/844W+aeFyaTyK2h41cG9le1wfKnzY1egwznpInRhr4/7qyqFWgXxVI07xCmU+M
 lLa4HrtfKeSI0+C8t/dGTV+JR2OcaDFsymnBWcf4fPf+PQ1s1UJcWMQiI9NsnrtfS+i25nhAqFO
 jQiAJsrMyaghB9qIbPg==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9c307 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=mvMbtr4cKWCpcPtdaitTtQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JqnQEXjPz3xb6-exIXoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: K_eu6zRZPoDwR4OwUVCPEjlvdOiHXpXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050147
X-Rspamd-Queue-Id: BC0DF216961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95680-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 05-03-2026 17:03, Konrad Dybcio wrote:
> On 3/4/26 7:03 PM, Shivendra Pratap wrote:
>> Add PSCI SYSTEM_RESET2 reboot-modes for lemans based boards, for use by
>> the psci_reboot_mode driver.
>>
>> The following modes are defined:
>> - bootloader: reboot into fastboot mode for fastboot flashing.
>> - edl: reboot into emergency download mode for image loading via
>>    the Firehose protocol.
>>
>> Support for these modes is firmware dependent.
> 
> The previous patch only enabled it on a subset of kodiak boards,
> the remaining ones do it globally, even though you claim it's fw
> dependent.. this changed in in v17 apparently
> 

Thanks. Let me review this and make it board specific wherever required.
Will update this in next patch.

> My fear is that those may conflict with other methods providing
> identical identification names, i.e.:
> 
> psci {
> 	reboot-mode {
> 		mode-bootloader = <0x80010001 0x2>;
> 		mode-edl = <0x80000000 0x1>;
> 	};
> };
> 
> imem@f000 {
> 	reboot-mode {
> 		compatible = "syscon-reboot-mode";
> 		offset = <0x65c>;
> 
> 		mode-normal = <0x77665501>;
> 		mode-bootloader = <0x77665500>; // conflict
> 		mode-recovery = <0x77665502>;
> 	};
> };
> 
> will the syscon write apply and the (unsupported) PSCI_RESET2 gracefully
> fall through?
If a SOC/board wants to use "syscon-reboot-mode" / "nvmem-reboot-mode" / 
psci->reboot-mode, has to be taken care in the DT as per support. Will 
make it board specific wherever required after re-review of the DTs.

thanks,
Shivendra


Return-Path: <linux-arm-msm+bounces-105266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHFpH/A98mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEFF4981EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0274230432DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A25840FDB7;
	Wed, 29 Apr 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfMZtjN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9bpj1GU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B4401A28
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482976; cv=none; b=Rhmg9EGvgEHBzlUikExdsDUs50yPCP6YhYEwG7I+mrRDvmVwLrCXdHemZWio5FjZh72QBOy7kjQLA7fyFtlarre01SXZyRsZZA0GVgiJqUzF1utCW2zK4EzTMxC6zs/0/1fqZqS1akBR5Q6UCfd+8U/GhoVhXr1XJeST+a1qiEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482976; c=relaxed/simple;
	bh=MsBhThXBOL7FXkcrmXSBCXSaa9bFMViErbsSDfLMBwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G97iSqz7KzQZUEDuVezbivaAYIbEwKsvBTplioiU3XECa+BrnT+s5/6jj50bqguEuQtFeLFz3GP5V6VY/FJYWCKOd5/BRyoVNpntMT1AaVATPieQI7YC4EHZKrkw7hxrjyKNrUWhud+lyr44bvFq27SXigfQ//ZK94Be6W2udns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfMZtjN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9bpj1GU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TG5Upu3856963
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=; b=GfMZtjN+zIK4VOAA
	BNXRZya0yClTFAhjLemCDUj7FZhy/b2Bn3vaBrbWSFt2qnQy9lx0xat0R6U1IPVB
	pYeTfn5wZ2dxPzpOt+oLeqVNmBMKwXju8ntHQwR8JrF2us5yAOVYesb44qA/3vbQ
	KE2wuN18n59HHBMGOJdAl/BEeDWWBa+Y/iOFZEEYG2JwBeFJBjAKMfqYsDJyMGRR
	d+H1thTYB3wbYnziX/9U0T3HXf+z85CtzfBaigMaw/74aCBFLPQUmNfuLFdacjcb
	h6uQHuvLGAqbV18aE8s8MNaq84uHh/PKscuMwJMYeqr/GmsI67/+i0OvqF0QPR2L
	0GJsWg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71gaj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:16:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so382515ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482974; x=1778087774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=;
        b=c9bpj1GU0pcUnNYM3H+2s8bWdQiO8/7FrlPWRxGHK6gH7/UhUDIEMjtjKrXpxMCMzb
         hvYWJHLPJ3e9mZS08vMJsuUddjdwj1vD1I8h+qaN2x3l6KgHcXJKf47THNCXfr0me4Ck
         zz2CRTxjd1J+9ESjF5R24rN+6jC1wouCw/kcUOEN5scRkq1mNM5Ze2CWO1I/jOLyOqX7
         MPKZUYesoLvUOILCm93TqkgCP0+phBQmo++0YWxLHiaIk1oj8XXuairKZpu5l2o8hR7i
         ZazupPR0IL7lQ1xZsWLwe967KjcZX3V8Un6g2XVMCt08c7tzRp2V6RdzcjtXfIFyyfIO
         yvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482974; x=1778087774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=;
        b=QeKo5ln/Ogu3svMz8NDKQKbLEXxlPSKrZLZddwaTBpYXCVVyA2HADgvwdkEhyfVofQ
         1C+Q5Psiz/PvdcSOE9IYZodhRlJwHak7XydDPxrpCLz+H5B8UP6TZGgdB/LfzsXk5pWN
         7vJbKZrPgbls6JXPzrLvNwnCp4TSrGdZtC/Z2A2ybvnxxd0vYFrqPPZ+IoiJ8OgprngZ
         C6vtBTkykSwnTlDfsvrAiJ5zshLL86iqc1GTAgbduNM0HtzGXrAbAtc2wsi6JcHJsWSB
         OrIo62WLp2jBWOWrjFtWVJxuhvUuWuLg+Y1Q6qRA215erE9iBTnsfR0d0l118y+hGH+O
         z7OQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cSBkriptRv0ik0rM2mTcFZiwYME00xa4pix+IsOfNkzJsl1OJVs+T0aNi1rfkneVkR3HsnSDc/kJLiJK5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Op3rT/sjcs6JiztXte9KqHcATQBvRwlT3zjvn8y5kxr33ltd
	+NXLVSto2bYVlefslHvBkS2cdVdsCsWqAN8mtIAL+LGnCK3mMNyI7G5QXj4I6jldq3Zg7N/VefO
	Jz/trJuwnTaQB2D/leBfBraPz8wTFZgR5JPOxXQbaxdMsRE08Z50dWz1QEgG9te8iQppt
X-Gm-Gg: AeBDieuNuiPgnbvN8kxgPFJBxIYs4XXDKgWnP+zTiaCzyfZ0pyjKwuUTUS22rOrpyBK
	eBhdmiwI45HMb+jEmRd/REqXF3/A4UgqvRuYU0UDTTXjZhMs4zzYnAIqcCIMWuaaryhu6vJqH1T
	1ue7j2oVUo1A9Q561xgoehFO9Qq1Hk1qa+trE1z0Gi5NF5twhuF6H61XfrRXyYila7fIJ0GBzva
	cDoqvbIBjIULXMUEWORteSslFqCJJw7qpKkyynYX33NB44i3K93tilDpy7osxCFKQxHc1bEgHPr
	oGqT/dt7bddVQFO29W4tFKrbZJ0Cf2NM2ul/MVwoJYh5SDJpzoXPrh1n9ANbd+U5K5mGB9rlgi9
	G3/+22dJgFhfOG/vWJLGhqlB+R/JdCWpAsAS52PtGE83zlsVjHPK7a6DV3Y8CZBq/MA==
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr82119245ad.1.1777482973749;
        Wed, 29 Apr 2026 10:16:13 -0700 (PDT)
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr82118625ad.1.1777482973066;
        Wed, 29 Apr 2026 10:16:13 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988785db2sm30726005ad.21.2026.04.29.10.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:16:12 -0700 (PDT)
Message-ID: <2e77bf2c-4335-4147-aa90-0192e2a164bf@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:46:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
 <e494ba66-3f8d-4d71-a82e-b37f5b34d45d@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <e494ba66-3f8d-4d71-a82e-b37f5b34d45d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EDZOT-V2y6Vi7tI2xmabbzNdmgg6TiMd
X-Proofpoint-ORIG-GUID: EDZOT-V2y6Vi7tI2xmabbzNdmgg6TiMd
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f23cde cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Y3Rdv8TwbQrKP7QTPRCa6w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=2MFqQf0nztRcsXl5dLQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3NCBTYWx0ZWRfX28nvnovg71RC
 B7i/InyZVGgX0embOHVmVecgYiDZdf6ybD+5go6nW+AGyggs4zbkOZk6/xi8SP00Z4O+6lPGZyI
 NeaXZVPdpyviXBGfkOCcgegTezh+x8EAJiq8cuZM/xxezOlwaxeTpseK+9rN1xdJSNWKkBrGBdv
 maDvit/CkmkZnhu5gBi/u2wdaFE06eWf2RjQxiDPtc8jiHca2aX4iG1oaFh+7ipxlXQPwT/f/GT
 iUZr7InmURi5fHAEcqA6EmDfKv3LC8fvS7De2FWjIc46inxIzGPDTwUzj/eU4gvCl4TbYDhx+R9
 f6Q2MLMg5AOfzq0X1/EYe6eNXgIyYJVJR0oqvvBBG4pntaNt33yZ+LGxFe3kowlV2VjW2A4tKYW
 RhRfpnsxf3HjIJhll//+nVITUzp+f+O3e/Cyn7YnEU4MndEM/FLSv8efYarsI9Fb7NmViixc8nf
 u9n/RngBQJWupf3Dl2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290174
X-Rspamd-Queue-Id: 0AEFF4981EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105266-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 29-04-2026 20:10, Pankaj Patil wrote:
> On 4/27/2026 11:04 PM, Shivendra Pratap wrote:
>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>> introduced, would also need to bind in the same way, leading to several
>> drivers attached to a single device node.
>>
>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>> child cell.
>>
>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>> PSCI node for power-domain traversal.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                           |  1 +
>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>   drivers/mfd/Kconfig                   | 10 ++++++++
>>   drivers/mfd/Makefile                  |  2 ++
>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>>   6 files changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c871acf2179ce16c80b404027e6b969c7787a6bb..333b01fa00b8fbd15e6f31a6b9af47600411624e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21239,6 +21239,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/mfd/psci-mfd.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>   
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
>> index a1ee475d180dacab245510674514811aec337ad3..1a1316d11e0a2e4f61801586229f5104e2435865 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>>   	bool "PSCI CPU idle Domain"
>>   	depends on ARM_PSCI_CPUIDLE
>>   	depends on PM_GENERIC_DOMAINS_OF
>> +	depends on MFD_PSCI
> 
> Should this be select MFD_PSCI?
> We're seeing bootup issues on Glymur when MFD_PSCI is not y

sure. Let me check on this. We may need to make a change at "config 
MFD_PSCI" --

    config MFD_PSCI
         bool "PSCI MFD for psci child cells"
         depends on ARM_PSCI_FW
   +     default y if ARM_PSCI_CPUIDLE

--
thanks,
Shivendra


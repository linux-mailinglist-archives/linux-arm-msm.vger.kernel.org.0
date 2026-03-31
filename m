Return-Path: <linux-arm-msm+bounces-101112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLDoOqMNzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:08:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D136FB74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26B0D306B7B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3309632D7F0;
	Tue, 31 Mar 2026 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJGBOu7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BrGIMF0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818B44A715
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980026; cv=none; b=Mq2aMIwZ055AtOZUnXBshpubuxNoLH23hmWUqFNko0bfVMSxMZkOBQcTuQQMDf/8/d1TS9r2rthu8fS94uPTs66/CU+TGfWONEEOyLi3oEGx//OHFwNk67HkIVKEipyMlYktFH0BJGruJrZkS8bSHgrkH8dtS94fTxFnQsWf6yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980026; c=relaxed/simple;
	bh=qkF7LCy5dw2bwyara7za2iN2mL7PefiNtH+7ums/WFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfwHi2p2qjpTk4R+VIT4+yHuz8Z8i0G4uZ/AomNgC0XrLxkbgnsr3OnSlwPBSzEbAXsaZTH/bE3++wDk2rPrgF83Qu7N8PEI3XW6uMkzcMBBXGGHqmDKOJeuFruwifoNbmbzlJ5MyeiA9Rk/OGNWijOUXTxh3MINFDZyDeOpji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJGBOu7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BrGIMF0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdQgU2724167
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=; b=mJGBOu7cmnVlWToe
	p26xjkmWqNlEUU2kL0ft4DSZNw7b9Aaj8gs5oNf8YbiYGW3yTT5x1UeRAjrFDMjb
	pnK0neiAJtrjjZAW7sEByzwzTFG7pdwiUWfLo/wRI+e8X1sYCWriQ9oc5kDIsUFp
	iT+1BumGzjRS4V/eUzFo8oRuBRFKtjfxDFsEwv+4HP/gNREeWEs1B0rYggtqWFwc
	esIy7WDvb8/IZV3fnslc2mbnRnOEE294HdCQdkUtBK2w9zYY8Vw3060w/yX8Oxes
	Dx9l83OddKeHGS2/8ndTiwzPp0ktwKp/1M082bqPAArGMEXHwT4IzB+yMWsQLJb6
	x1Ba0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfm09v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:00:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cdaf0f934so1612455b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980021; x=1775584821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=;
        b=BrGIMF0FjsGiaQAh7FbSIpD5gw8dA7NnHjhQLJmWOUv9O5odMc1SU7FBvwbI3+CN+T
         aXJodWdYVXTzNdwnLB6M+IZlOX8b+iAmCy2+TA+hHvW8KjhFZ1pSkEypcyDmJLaJ7P/2
         Q3QWeRDEO37B7azwsBjZzeQ+JRawrJh/pWcMbRQMFb/PNx3wvFMscMTSJGEbcbqj0RVH
         xa+55ks4tJHFfqHrwxc3B9lnTpB7SFADPFl94z44MrSx+34dp8w7vP2qc5uppzPbVTrw
         fbEYrZF2At9DnR0ZljbtTy/CZcXJzSmFv4DufrTudBm3tdyNZuXEiJPpHJGTQEz+3+/K
         lRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980021; x=1775584821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS3a+ptOlcMaz3jbXy49Anmk6ZAeQ1zF4OuWWpLrnuI=;
        b=D15QBqy8YVS/Ktc70yFLujP1opFLEaH/MBcs95VNzrzrt1ZzoydGhCcnmG4D+QqFOD
         81vsQ+4tYmXz4m/pt+uM63fXOtMvLU+SyZiLQuwmUWtCWpbdjtyAJO1JGOAgSbjnW7Hq
         2l/7QUMrR67QHy7eKLVJtRk6r5MXRY+slnzICuRAdL1FkBnHO1O9UANQdrUTON2OJupu
         Z0aCagDduzw0tDqG2JZ9T1Ncz/3AoWuRvJ2Z71yLnq7r7UECqrvUqIpCpTckKHjYbJ/O
         lh9eaw9Td2Nvh7QOMuYjFNvBMx4mZg5EJxsJNI5hSAXJi7NZazhScFocci67A8dlTecT
         iR1w==
X-Forwarded-Encrypted: i=1; AJvYcCWc+u71yApfDOYe/dnXuPpPlEyUztev638jRSCBnXgHYX9LPQpujXFIOpfROM/HTGT5FCIkNbPd98cnvfqD@vger.kernel.org
X-Gm-Message-State: AOJu0YycEUhvflhsVQArznkz8kBjDHvG0XJ5sVkSl+78uE4iHcnAqCbB
	zIirPmf4SKxB8Qn5dzMiptSDxKoH2tWbZgZW7tk3VgxuBkYtdUCotyDdGyY85t6m+LRdp+UzOVk
	urRg6K+sXEf1ocQHetEo+BjY29OunDmqIck7DuaXsJHRkS8Ii3ASZT+GCbGQxR2WNxp4T
X-Gm-Gg: ATEYQzyqzTCO+rRkk5PVB+iSrbPcfd7+787U0Y2JcZzeEaIGetL4dLlqmcQsHO2XoBr
	dTRWjb5WMG6VKsKvpaSNyoe7E7FuScozueKcSqwoVU4tMmyv/+b8NVq4THJpg5N8bZFlYWVsA30
	+JJGTpbMgrykQGXss7Sc5S59jmqiie1VAq3V+wgb3Er2KnpMkT3awTXNvM7XiNY4CLiYIQoLPbA
	uGhJeCqj4dgc3Aq0rZfs7FgQZrXOL92l2KTYpZlNBJKWSiXdLjK5oughzsNZaCqJ/7HO+MR2wxk
	jukQLnsn7ymkRMgby8BLGuQ5DTyvugorikJs9m9LJ/LHU6H6qgxDfSaDTX7iNshI3D4iwZH2ypr
	kqr67CGJgfMqsC4a9MvTtVRnDTklriJTVdsrKdrcqkOzI09PMHZeOQJ0=
X-Received: by 2002:a05:6a00:278a:b0:82a:6e7f:4c14 with SMTP id d2e1a72fcca58-82ce89b58c1mr495100b3a.27.1774980020663;
        Tue, 31 Mar 2026 11:00:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:278a:b0:82a:6e7f:4c14 with SMTP id d2e1a72fcca58-82ce89b58c1mr495025b3a.27.1774980019787;
        Tue, 31 Mar 2026 11:00:19 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc72asm11012404b3a.48.2026.03.31.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:00:19 -0700 (PDT)
Message-ID: <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:30:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
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
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <acaMPgRALnoUIHMC@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cc0bb6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=mO+zk3XXGlxjkZV6yCQMJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xx8M9eIzLlJJCfGiN1QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MiBTYWx0ZWRfX6gqjI6cC6CIJ
 vJ5MmGcyqPTWQymoV7yjq4x+htmCjvMWVxY3F44YjLBHpm+X8C1WwNgrGiOKaVb+9hXZ+PIhd8B
 7VmZ4c4ymcscEd+H7WCSa7FyOc3WC0N2XJC9c6OkX7hcgFEZ8KnQSX51BiBjQ1EaQeZXA6dGEf+
 W1mJkVYVB5JebDSZanBlrMdV20PtFDJmSbPcLIvhMIEPS11jeYIHOfXMxeIfmW4DA0YGwiGIHMr
 4SyOBTnfC8KTrjB96EyOVZLLwwa/XAquQ2lf+NpJPvt7JJ+ZG6QcobmChTdDXTKAf1RnO6V62K6
 Ea8lKx+jkDPkBlmy3SYHwy4wdB8k2J95NMnUf335cI2ylAc37YiE4EaGHbo8MNygK0XD8gRqJP1
 mebpNfnecRVrpnA2jrrspWbdtK1DPSYTysz/qkd5KvIs8L2kL+J+Z3eiCXcFZ2gIZHrJ75dw1T4
 Mj8CvaheXbkoQ4GDs8w==
X-Proofpoint-GUID: radqeplpsNkf_TsWmbwOlDXwdUQX_C3b
X-Proofpoint-ORIG-GUID: radqeplpsNkf_TsWmbwOlDXwdUQX_C3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310172
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101112-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B9D136FB74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>> PSCI supports different types of resets like COLD reset, ARCH WARM
>> reset, vendor-specific resets. Currently there is no common driver that
>> handles all supported psci resets at one place. Additionally, there is
>> no common mechanism to issue the supported psci resets from userspace.
>>
>> Add a PSCI reboot mode driver and define two types of PSCI resets in the
>> driver as reboot-modes: predefined resets controlled by Linux
>> reboot_mode and customizable resets defined by SoC vendors in their
>> device tree under the psci:reboot-mode node.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/Kconfig            |  10 +++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++
>>   3 files changed, 130 insertions(+)
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>   
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && ARM_PSCI_FW
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +          the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..86bef195228b0924704c2936b99f6801c14ff1b1
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/device/faux.h>
>> +#include <linux/device.h>
> 
> Nit: swap the two.

Ack. thanks.


>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/psci.h>
>> +#include <linux/reboot.h>
>> +#include <linux/reboot-mode.h>
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Predefined reboot-modes are defined as per the values
>> + * of enum reboot_mode defined in the kernel: reboot.c.
>> + */
>> +static struct mode_info psci_resets[] = {
>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>> +	{ .mode = "cold", .magic = REBOOT_COLD},
>> +};
>> +
>> +static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	INIT_LIST_HEAD(&reboot->predefined_modes);
>> +	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
>> +		/* Prepare the magic with arg1 as 0 and arg2 as per pre-defined mode */
>> +		psci_resets[i].magic = REBOOT_MODE_MAGIC(0, psci_resets[i].magic);
> 
> This looks weird to me, why can't we just initialize the array with the values
> directly ?

Ack. The idea was to avoid Typecasting. Will check on this.

>> +		INIT_LIST_HEAD(&psci_resets[i].list);
>> +		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
>> +	}
>> +}
>> +
>> +/*
>> + * arg1 is reset_type(Low 32 bit of magic).
>> + * arg2 is cookie(High 32 bit of magic).
>> + * If reset_type is 0, cookie will be used to decide the reset command.
>> + */
>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>> +{
>> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
>> +	u32 cookie = REBOOT_MODE_ARG2(magic);
>> +
>> +	if (reset_type == 0) {
>> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
>> +			psci_set_reset_cmd(true, 0, 0);
>> +		else
>> +			psci_set_reset_cmd(false, 0, 0);
>> +	} else {
>> +		psci_set_reset_cmd(true, reset_type, cookie);
>> +	}
> 
> I don't think that psci_set_reset_cmd() has the right interface (and this
> nested if is too complicated for my taste). All we need to pass is reset-type
> and cookie (and if the reset is one of the predefined ones, reset-type is 0
> and cookie is the REBOOT_* cookie).
> 
> Then the PSCI firmware driver will take the action according to what
> resets are available.
> 
> How does it sound ?

So we mean these checks will move to the psci driver? Sorry for 
re-iterating the question.

>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static int psci_reboot_mode_register_device(struct faux_device *fdev)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	int ret;
>> +
>> +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot)
>> +		return -ENOMEM;
>> +
>> +	psci_reboot_mode_set_predefined_modes(reboot);
>> +	reboot->write = psci_reboot_mode_write;
>> +	reboot->dev = &fdev->dev;
>> +
>> +	ret = devm_reboot_mode_register(&fdev->dev, reboot);
>> +	if (ret) {
>> +		dev_err_probe(&fdev->dev, ret, "devm_reboot_mode_register failed %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init psci_reboot_mode_init(void)
>> +{
>> +	struct device_node *psci_np;
>> +	struct faux_device *fdev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +	if (!psci_np)
>> +		return -ENODEV;
>> +	/*
>> +	 * Look for reboot-mode in the psci node. Even if the reboot-mode
>> +	 * node is not defined in psci, continue to register with the
>> +	 * reboot-mode driver and let the dev.ofnode be set as NULL.
>> +	 */
>> +	np = of_find_node_by_name(psci_np, "reboot-mode");
>> +
>> +	fdev = faux_device_create("psci-reboot-mode", NULL, NULL);
> 
> Same comment as Bartosz (have you picked up his work and working towards
> a solution) ?
Working on this via MFD. Some issue as again MFD framework does not 
allows a fwnode based driver registration. Will update.

thanks,
Shivendra


Return-Path: <linux-arm-msm+bounces-101104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKIZKtkHzGn+NQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:43:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04336F37A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B4EF3010BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEF8372663;
	Tue, 31 Mar 2026 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsqMEMDO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnmMhzSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CC036655B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978746; cv=none; b=WtpcQwT4iZNL1pQIRVjRPcAwnjYXtmqKf77DM9x5UXhKey7TTm10Mkr1/R561ts6BO9Mjh6bmEuG8a/YL0PQW4+f3YDhA0p8COQxF/yrjzad1EUY/+twUgd7sf+kCJxpLWe00NYJKXGqmKP4qNm+lJEnhhRpb1EoNCHI83YDTds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978746; c=relaxed/simple;
	bh=aBM9cA+/zLAFZ81e58fygHqSaf46xq33EhRzTPqrH10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwKvj3o7Pta4jxFycsg08XcPsC5iCeOTDqinmejczvy2pEV83H8w7flYteZV0WbAjcwjjjdFwXUcaiazU3ZSQ4/FAIh35VAEgdcQETAIiD0XMgUboC866w8isGPaFzbdiDgZeKbQ92QG+vMz1mWmccCx5mUu+kLlwgL/uJ65bFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsqMEMDO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnmMhzSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdR1V2724187
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=; b=GsqMEMDO2/FdgS7+
	N9+MIpg/jkIS0P3RCWDy5Wzy1G1kHNcLwKyZ1/Mcf7/UTZ2Ms/VTxK+LledQIjfD
	doTjUh01ZKiW5BQGsEYGSwrpvTRm3rbQJ/Vw+Cgbamp253CSyin637QdAyjUQEXv
	lsTQrmkech4U1ufNu+L6X2OflonhABeNEcaibrW+mJQljZYrxpQ1O16vJNWnIGPp
	6u/hRLgaHnFTdGDxZHJRYbKbEWqZx6bfGp721OZKiY81rI3bI8g/bFDzbrd8LhoJ
	b1YD24QPzRgTX8xH1K2YqlCP0oewGiI6ZiUtLHfMVemIU7xAC8R8N2zFFEBs0V9z
	XkM+cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfkvfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:39:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so935425ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774978740; x=1775583540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=;
        b=KnmMhzSD2/3aq1nziNiqM+5bUQOQ6pbzBr0gNLVXPCQiVbY2PgNa7+nbc+1GuI7m6U
         CXP3gEyNQ8GArhgSw93UXQJpc1N49XsZfC8oN5nQTZiFy5W3DfXFXWkw+DN821B/n31v
         y+TrNXR4VK09Pe+IlU7JrAvsErNPob7u8ctzpd9Sjg8nFP7LEUKn2GpnYCZc+8JmR/yF
         pwnKFA9/cqNMLnHvbkJGvKuI8Jnbg1A7wjOHfaej5qvSN2ObYOHWY/hsvgyx8fcPSM/3
         wRqfRq+Tnu+V8q4k3k4h7KU6pLfcDp9RmkccTxMKOl6s0e2nHR8tZS6Tcr1V/VaCRfCY
         4nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978740; x=1775583540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=;
        b=svDEUIpRnan5c/NNfjuHb5FLVGDjouQlcBesHfSZc0XE5YEhsIRIGQUYQmZw9Lo/p6
         MCRGqI2RFfai3bMIb99pE0eY/g2ir01BRwm7xVh7QLywPpzj2yIKlLZcczu9AvQGdx0v
         EvWHKOsOeo18gJgNajFgEDuWcw35nygL1xarx1dpH4S9B7NYVRa2rdrByQ1/uA43xr/4
         hl1bXNlAM66Q4ErA7y/EAmqcl5h8ThJPQxzvD8nmjLAB3gKwT2TpNwf2FfXsAXtaA24V
         sg2lBdkZHhc0ji3uhJF/dlpEjudoqjbFbc8kLneqdFXqIejGFEGRQJE2utKwZq5TyAIP
         ophg==
X-Forwarded-Encrypted: i=1; AJvYcCWks7De9NzietfX9xJ8LqXIb9rtgBvedSDJWZyF8BWsrOJUNhGaD7tau+JFw4MGTOyYZkqVLfVqt2DxETw4@vger.kernel.org
X-Gm-Message-State: AOJu0YwUlOco7KukBHvpNHYMPpPZOCpDHR+nZc4HBQou+mCOU53fzi3a
	Wi3Nbz9PRNa92b/wDTdWNluT1/kBiN+HT32ZkeiZeVSyC+8YxUAnS3tY7WvZ/bTqomarNdxZ/ci
	w6KPbOghsSxwDwTnka3eb8vm1W1FSKDCwcPIgJ08EXK3KFu6mgS6aY4tJh8+Ud9XflNEk
X-Gm-Gg: ATEYQzz51L1nhBmoOtWvz6DJLPgLlT8Ic6esPu5G/FKu/xLqL4DBFIbjBxIlUvc+dS0
	01w1OtrN/KgO9RLSJsJYKeCs8CylmYKJSE07zCT5YExCowe/VVFMa1igpEYlDFSfiuTzkA0Ul8z
	sdM6PWVCOLpLlM2iY/PuSiVlyyseVIQpA+0PypNtJBvXacysLiasXWh0JuhvhhFy0jkdMRF/MV7
	AQGl7ilGMMAzhujxqoknhY3jwOgDzB74veKI3rUrk5DV6qsACyPa1IQM1rXddbQMrAJGUv6hV/i
	sWoBUDMD28Yg/hBE44dm2/gphkiWZxAWYHBiij3zslmSztWnJpOUPAqMdAbXA5eqXICFHPDqKan
	07k7xDhE4f5zwzVgyL1Lpmo3Y8FdSNmbYV5nIEd/+ikXzpRmate3sJK8=
X-Received: by 2002:a17:903:37c4:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2b269743addmr1778125ad.3.1774978739511;
        Tue, 31 Mar 2026 10:38:59 -0700 (PDT)
X-Received: by 2002:a17:903:37c4:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2b269743addmr1777705ad.3.1774978738944;
        Tue, 31 Mar 2026 10:38:58 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642864sm138656795ad.12.2026.03.31.10.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:38:58 -0700 (PDT)
Message-ID: <96079c7d-647f-4843-b847-b1e50e3c7ad3@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:08:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 04/10] firmware: psci: Introduce command-based reset
 in psci_sys_reset
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
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-4-cf7d346b8372@oss.qualcomm.com>
 <acaPCJnX6lb9lxPy@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <acaPCJnX6lb9lxPy@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cc06b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=mO+zk3XXGlxjkZV6yCQMJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fKhT1tDkeSLsOxjvS_wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OCBTYWx0ZWRfX2DozoIrV/Zld
 /feuDORxfbzzlnI8QDYaRAHsRHKZn5XHQx2ppgPNvJiOkgOiMQhdSmMU3bDySGfpmG8it5+HMoi
 J26w6RrghGVPXkHdGonYuLTZcxSvZDyp08oMtzGCVe7C+jyPZtE/ojpPCwtIWYSOrpK+bOOp43h
 IUTpNXdUsFeC975bJqyV+AqA5mDRyUlgzijIhC4gMuCZKuV+MDQl5IvhUVR/nm9yAJH+1C2im+p
 AZuv9Eh2UkKFe++RFUiarVL8ReSP33vW8iy/NvUIakyMlI7+Tt19TcHvx6vp9W4mUf4jMefRjaV
 /MkMS4lznb0yTB76P3kkOCojtbvqLMrXzmVdsmrY4/oE/IvFsFly1lVyNIMfxux2whduyvGPsVp
 SM+5HF23V7Hov8CeCrxSSgFiWmHmit1UtgYw5/bDlhFkew3cLUgNH3h7cdH3SFhdSXr2oLN2LEn
 4lz9pk0jRuud4/2s4cQ==
X-Proofpoint-GUID: vGdCXIhxAMzM_yYjaJ04AoPSF1zwWyrw
X-Proofpoint-ORIG-GUID: vGdCXIhxAMzM_yYjaJ04AoPSF1zwWyrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310168
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
	TAGGED_FROM(0.00)[bounces-101104-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 6B04336F37A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27-03-2026 19:37, Lorenzo Pieralisi wrote:
> On Wed, Mar 04, 2026 at 11:33:04PM +0530, Shivendra Pratap wrote:
>> PSCI currently supports only COLD reset and ARCH WARM reset based on the
>> Linux reboot_mode variable. The PSCI specification now includes
>> SYSTEM_RESET2 for vendor-specific resets, but there's no mechanism to
>> issue these through psci_sys_reset.
>>
>> Add a command-based reset mechanism that allows external drivers to set
>> the psci reset command via a new psci_set_reset_cmd() function.
>>
>> The psci command-based reset is disabled by default and the
>> psci_sys_reset follows its original flow until a psci_reset command is
>> set. In kernel panic path, psci_reset command is ignored.
> 
> If it is function calls you should add parenthesis (eg psci_sys_reset ->
> psci_sys_reset()).
> 
> You must explain why the kernel panic path requires separate handling
> here AND in the code - think about looking at this years down the line
> and figure out why kernel panics are special here.

Ack.

> 
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/firmware/psci/psci.c | 45 ++++++++++++++++++++++++++++++++++++++++++--
>>   include/linux/psci.h         |  2 ++
>>   2 files changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ae6f7a0aead913d740070080d4b2a3da15b29485 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -51,6 +51,15 @@ static int resident_cpu = -1;
>>   struct psci_operations psci_ops;
>>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>   
>> +struct psci_sys_reset_params {
>> +	u32 system_reset;
>> +	u32 reset_type;
>> +	u32 cookie;
>> +	bool cmd;
>> +};
>> +
>> +static struct psci_sys_reset_params psci_reset;
>> +
>>   bool psci_tos_resident_on(int cpu)
>>   {
>>   	return cpu == resident_cpu;
>> @@ -80,6 +89,28 @@ static u32 psci_cpu_suspend_feature;
>>   static bool psci_system_reset2_supported;
>>   static bool psci_system_off2_hibernate_supported;
>>   
>> +/**
>> + * psci_set_reset_cmd - Sets the psci_reset_cmd for command-based
>> + * reset which will be used in psci_sys_reset call.
>> + *
>> + * @cmd_sys_rst2: Set to true for SYSTEM_RESET2 based resets.
>> + * @cmd_reset_type: Set the reset_type argument for psci_sys_reset.
>> + * @cmd_cookie: Set the cookie argument for psci_sys_reset.
>> + */
>> +void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie)
>> +{
> 
> I don't think cmd_sys_rst2 is needed, as a replied in a different thread.

Need bit more clarification. The issue is that at some point we need to 
decide - sys_rst2 or the reboot_mode based reset. Are you suggesting 
that this check should be in psci driver instead of a pre-check in 
psci_reboot_mode driver?

> 
>> +	if (cmd_sys_rst2 && psci_system_reset2_supported) {
>> +		psci_reset.system_reset = PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
>> +		psci_reset.reset_type = cmd_reset_type;
>> +		psci_reset.cookie = cmd_cookie;
>> +	} else {
>> +		psci_reset.system_reset = PSCI_0_2_FN_SYSTEM_RESET;
>> +		psci_reset.reset_type = 0;
>> +		psci_reset.cookie = 0;
>> +	}
>> +	psci_reset.cmd = true;
>> +}
>> +
>>   static inline bool psci_has_ext_power_state(void)
>>   {
>>   	return psci_cpu_suspend_feature &
>> @@ -309,14 +340,24 @@ static int get_set_conduit_method(const struct device_node *np)
>>   static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>   			  void *data)
>>   {
>> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> -	    psci_system_reset2_supported) {
>> +	if (((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> +	     psci_system_reset2_supported) && (panic_in_progress() || !psci_reset.cmd)) {
>>   		/*
>>   		 * reset_type[31] = 0 (architectural)
>>   		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
>>   		 * cookie = 0 (ignored by the implementation)
>>   		 */
>>   		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
>> +	} else if (!panic_in_progress() && psci_reset.cmd) {
>> +		/*
>> +		 * Commands are being set in psci_set_reset_cmd
>> +		 * This issues, SYSTEM_RESET2 arch warm reset or
>> +		 * SYSTEM_RESET2 vendor-specific reset or
>> +		 * a SYSTEM_RESET cold reset in accordance with
>> +		 * the reboot-mode command.
>> +		 */
>> +		invoke_psci_fn(psci_reset.system_reset, psci_reset.reset_type,
>> +			       psci_reset.cookie, 0);
>>   	} else {
>>   		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
> 
> This is very hard to parse. IMO, what you should do is:
> 
> - Split this into two different paths: reboot_mode vs psci_reset.cmd == true.
> - Document very clearly why a panic needs separate handling.
> 
> Something like:
> 
> if (psci_reset.cmd)
> 	handle_reset_cmd();
> else
> 	handle_reboot_mode();
> 
> I don't think we are far from converging but I want to be able to maintain
> this code going forward.

Ack. Will restructure it as suggested.

thanks,
Shivendra


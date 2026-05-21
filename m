Return-Path: <linux-arm-msm+bounces-109027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIM/AyfrDmqwDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A60265A3F40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B8963016B5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3733BE17D;
	Thu, 21 May 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjX4Pqn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HX31AAsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097937DEBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362277; cv=none; b=JPLRDkCvip0jCG3/IFax93hcSfIRIeEI+qLsVm/SnqE4KgnMeXT9UOuQqpDSVVgP6qolj+mB49I487RoAZCwfwO4RcWmoj1A+HG58hzlut5sFtZZ60Zsuz2JcFNKRxI2LCL4uVYfvWRgnv9pof51VC80uJE4qa8Kj2cxJb4Vj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362277; c=relaxed/simple;
	bh=xlK4wR30Get6eubzseSjA3iYaEkpST+adJFHECpBVUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSp1EnfAaZnaKMJNCCk1ooiGRBrajodQgmk0GXtCJj7aTfbeSITfMkhefsiwmJBdEWhuroqOlKIkqNOSCfIP/XMlulTjvXmzh5dG48zGOogAc01w8FUuMC0IPpM20noNr/Iy6xf/LGPIowwqODpyF5ckFLHmk7wTYSVxxeXt79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZjX4Pqn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HX31AAsV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99mlB517698
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjOIjZmNsHI/mHiPsfUA2XrCOYx/OJ3QhhVcNXQP58I=; b=ZjX4Pqn8zPdSGDdm
	ItenlA+6zdadPvXLHk2gZn2oPAZjzKHm1WMHNPyZbeBCfFWnTN6EKeZzkseU3G2b
	1s0pExiaUmIZVhg2HVYr6+H68Z097LH+Zsni9jgRNKC+9YMhdZgE6GL7v/2h58iw
	x2/gtSOmaB+MdXkM1PxnMrAzVxDtaSMRd0+g/6Z5s8FOaPuf+1WxH5TW5gJaq+aw
	sutGds8EdlaDlsADCXD9rXyuujyShFZOpaJew1RHga1dVxHvBpEn7b71cF7OayC8
	vExZUrhxK8OtP8JFizNwEfToO15kqxGepCoEwEpeb1RgAZdKYGiHXqZqinvbCrng
	ICnwTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1xx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:17:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914aa01cc21so8655885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362275; x=1779967075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjOIjZmNsHI/mHiPsfUA2XrCOYx/OJ3QhhVcNXQP58I=;
        b=HX31AAsVjcP9rG1X9QOdV+Geqni2xmKTlTmz1tNr9HQLHMcJBMg+CGTwSChVp2AXze
         7oO4lroQUMdjn66c/arLUk42L+4YyaK+u+UaX9JxA+DFhXY8Rew7R3/ug4oGwORuyYIS
         bR+7wtMSp3ej+T2WMSnUXVOUKQG+XHCeRrFiHOB0zw8Qr52KFj9wNaT3iseCoZ/oTmi6
         Ld69LodISoC2fe89HD++M0jAse7xYaoIX1Fg0uC++3OqFiEn1yK8ucWRnlN1myGe4LH4
         63T64wKvJcRUQejY6g0bva67zmp+J2uH7xg3HAq0SHEm9s/x0abOaAlXrdv3drNYS70C
         i4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362275; x=1779967075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjOIjZmNsHI/mHiPsfUA2XrCOYx/OJ3QhhVcNXQP58I=;
        b=WZzD13a/3DZkzedKtKwHZha+ouKxj5bvKzq/+qMcS3UqyLl5GxGXTtY7xlA62b0gdL
         Z3+77tcpwltMnp4pA8S6PUoOkyKRNT4+0137HpUaTYn4ro4nK0RUzjgLAL6HOkSGuS4b
         QvoIFzXLkgnad6Ams4Fu/OHjgCackre9gR1gEhBY0vm/5F7DzqqlXqwJo23PVHx5phKF
         DizxJ5r1aSp9pl51F9IIxd20Rmkodwg1AfgPa0djiQ348bwUAJG4dCxGYEneWkzxKM0j
         A63UJAqrL1LtsT8kSGnLnzXpBwhFbIqVkqmxoNFFtpzDrZQcT29tac9gY4QDIenB7PRE
         mcfw==
X-Gm-Message-State: AOJu0Yx41osS7obWiM/rqjKTOCdaS5V4g2HyYSSC21B+2r1wFHAkIRF4
	+RaFSDbJc8XGJKay5llMIr3VO5UOWSuSZXjEdG1YvhdMk/b/g90y2DFPa7RwtXSJ1i+qs+6azJ5
	NMSIJ6P6PsCeXlTRsdAKlsTJtPHUDCww2n2ndDfQQOCYo4TUAVaGYFXckaD7V+ePqO40T
X-Gm-Gg: Acq92OGfMI+hoL571B8pe1Ejl8+I2vibnit+ucloIJ9ty92KVR8xpBf7tRyqwxPmP8o
	1cVHaSl7kvq6b1m/J9GgfmYar2D/WsFsPsv8bnUtsAGyju+CNpPu9DkKyDJ9uMEA67VuXhrlK9x
	zyQPclo8MQXUOf7e8Ju5ishdb+nJklpYSn/PYswRNexbE7EtyNRX7Dj0RSur181c3pOAeydjFT1
	ey5ofxMH4gdLk3+nFk8uIJCLEr1tfbiIXGfXPC+AGoTOhRL8uEOpJFewN00SMJIl64wkJ4FPSdB
	DdXevWeKrUhT+oTKgFug3H481zh/84KUozLf2izDxUoDzWbK4bQXmCQMJKtGJeXttyQB+ROm7h6
	YbTt7qFVDKhh8KtqWayUcuc+Z3NU4+1d512h5lcsn/4DVIOvodc81XFlcxqUkVCGCn3oh87lcVi
	1ADoc=
X-Received: by 2002:a05:620a:4804:b0:8d7:a89d:958a with SMTP id af79cd13be357-914a2d2377emr193349185a.6.1779362274989;
        Thu, 21 May 2026 04:17:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:8d7:a89d:958a with SMTP id af79cd13be357-914a2d2377emr193345885a.6.1779362274444;
        Thu, 21 May 2026 04:17:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6887e01f7a6sm26576a12.2.2026.05.21.04.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:17:52 -0700 (PDT)
Message-ID: <e3b15b7e-ba09-43ca-9e6e-b778393d6acf@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfX4j8eSrJlQGJv
 b3zJWAUuD31aG71ypFMwSyjelAYAZGGWSJ4BplHKQMfx9MAO8C9kda3BWmqafvPe/bZDjv707jJ
 atNVdoXyhTOq88MUI+HLiJwO+RyKUciVTCjkRE4OAW2XMYGiKJTPxL1Pdsef2H0FVOPGtxaFO8W
 BKyarYDnNoUE/q3lheiUm6NvVe/DCJbs5E+KbGCYGCFnyjBRe8pTdRz6kWTnllVpBCZhlqOOYNk
 BWOcbxmDCS61+OHqJTexaTRJqKCuWhjSkX1WyknMLwc+JYT+x9ICE+X82Ry3eslTfZ/U2tgA1cV
 /CSG3iu9vGfKLu4zlWnjQp2j/SwaDsGOusXP5rOqUz9WgledZSlNSXtAwBE+n/OO7Mcdgf+EKfM
 +BSpo2TefnlRGsBaKXRdsdO0o3bjGcsq5DllpqVYkAOicfNXBHwKrqxGpg1+ePO7/ZKgk+o1+QJ
 DkE3vaN/VWvjjGfKiFg==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ee9e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dRO4Il1Evtc0n822G-oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vLORRVa9IpktkCEJuEgYDRUY2v3MVRLx
X-Proofpoint-GUID: vLORRVa9IpktkCEJuEgYDRUY2v3MVRLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109027-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A60265A3F40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +/* Constraint configuration */
> +static struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SOC domain constraints */
> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
> +	{ 0x0C, 0x6C, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },

Lowercase hex, please

Can this data be const?

Konrad


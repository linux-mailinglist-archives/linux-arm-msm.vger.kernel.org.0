Return-Path: <linux-arm-msm+bounces-106088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IiIBRcI+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:21:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB484D8883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15455301651C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B520F3DA5BC;
	Wed,  6 May 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaEoqPiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQH62Kgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873A139B971
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059084; cv=none; b=UOj9/t19oolodu2seUS9m4sNgLgLLnT97C/eUOg/JulL3awLYzJcYtRqtdFheu5MVKixJRlgPl0I/eplWoBER6K7oTd6nJfNAmIsHbShQNklTIHR9pp2fxv4DtBG/Rt8YyDC/a4w4tnuDghsoDmH6g+cQhoKVgp7sB3mDIBEnaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059084; c=relaxed/simple;
	bh=cZu8Dc7IIOqi7NBVTWmApBuPht23kcF2cg8i2RkFqmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxufZnl22Y1q+/ED1Z+avd+aqztZDrTt/C7TI/0OChbI6Da3BGcn0yvkYxhBkBOuS107i3dAaq7MUsVxakPDIK07FaukviYMqq7ozpDldyHw/MoSJ4fHWEMeCvfmrfPP/NZrNCmm9e3TKVnKluHr/qaGnbg65mQtk+o7xXFU62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaEoqPiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQH62Kgd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64661GVi3475707
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6kadQVmlDK1YHOLukpnhZWBv8PL4iuDOwYzZZ3aVY0=; b=kaEoqPiJtQeUTcNe
	oqGS1cqVGBe1ZK/Nh5yaK6VULXBAlVd8/49KBcslMfY91pHNVs7BmMeKygMhSxBD
	dgW1YLFhPcpwCzDuFxBl69IL57JUVEylwuIEJE2svzzLpuyysg38R0yN5gRdA+VN
	VTVnF5Dxg+Ei7skYg3G1x8Kx2qhRmCTKnNkEnKkWqhaZW71pg4kxkBRCnSRXisFW
	vbGMLh5BYrIupnfzbUQpqv5J+Y5E6mnoupED2kN1eRDnWukGjB4uheyuxYFT8Pxb
	MnK8QJq6Y2JHgnK7/FRlnEitF6naV2TWWS6OAsI/c+Sx/0NEhiBL5ApOSPU1rYKF
	tn+hww==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgv72t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:18:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5751831fe6dso403882e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059082; x=1778663882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6kadQVmlDK1YHOLukpnhZWBv8PL4iuDOwYzZZ3aVY0=;
        b=ZQH62KgdCXIA9JWP/jlczMw/cMSXXxBX4St9qUJPls/QUUeDpmd81FFleiNQAbnc4y
         IGWAmdDR1PyDgwECoDC7hnV6ShZ8jjS+1+WQWZRIwSFDZjBXkEAeicFnN4IQU+5I6P35
         uNjfebObBpCrdaxnTzkQAnDW2W1SLt5N/GZ+SGuk0J5nFNqdTwfj1rBeCkBl+nhMxnB4
         8Kk+1ldS9wKt1qCJxUAqnKyqmVsvi9h90RdkaMvP2D8x1ylZv/BuywK46f43lJRmm0Kl
         sbrAe+wdvYpbEizU+6cWRqjH9Neez9YKdVRcYQ6sDreMSGj6dTzPJzGNWgMfTu4Udcvu
         5TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059082; x=1778663882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6kadQVmlDK1YHOLukpnhZWBv8PL4iuDOwYzZZ3aVY0=;
        b=cMWq+Uq/a32BpSbHOyMkKviwhcm5tTYlq5A7bbVbhLUEfkknlLHpT/XH8Ahx70/9RN
         Xn0mpEy42zdBXBmYSKdS0D9zoJdbQ2914wq1uak45CKFanM+pUli6GzKJxIJ7T6Mk3Mz
         E/Ff75sKB8u4lDDG2DNnG8NChYGyub8rroJvu7W/fGB4A4rWrn+EJTS4sWJdw0aYmrJ9
         DoGaF6QP7NVR0O3sQs6ipUAp69KM39wQxvFYPUBhrV9D1/gZBdfg7/JrMaodueHHcwd8
         AeNBsXdzynS5hd6eB7XWOV2Cc4UgM8H2K4OWjatFg1O4jZoPIPSxSF/W34Jbz84KudJi
         fsUg==
X-Gm-Message-State: AOJu0YzV4jHt8P2odtXorQ07zVQxVvn4kXLQ9oMCqovHK27FotA/DixX
	842hbU4bKgylIr/EF3dCkuI2iFP6ZVRquy1oAJ4EkFutMP48jSyXHJ7Otn1BlRugN5bRxzz5b+D
	nhSjd4baVjV3gf+i0VuZ6HPiN2gzTVEYtka7kn8qOANzB2T3qwB2MMgSBDHxHUUPF94Ra
X-Gm-Gg: AeBDiesogmBZhgTXIXa26VLxHBKiEMBh5WR1jVpmTkafRpcvkwHok6/s62guuHXdzjz
	kKS/qM/FyYPhjyRsEPpPB2OUq+8GqjgROj0Dd6j7SHG6eTuc1XNoYs6azZ4v9B7hJdERpT0jCUW
	cADWu0lz3I6uSdqid/fRKITGFR6IVSFu7GE8msvrloS+w0bvEbEzlcvaPFgjxa+sxj5OQyeEcw9
	VBLfntkE4aqOyUk5PgT5goO+CU5Gwyo5FqrflRT0zLr2KHlYGH3aDhK+SPv6WAywlReS+hCcqa3
	q7Szid6fvCQdvLwW7Q4VyJupzUWDV5xTY+KDC3+725/L3IxnL69Mwr1Qjv1kVVkEobjafyna7jl
	PXVeCsvi4rAVlJNtMoGdsbZ0dYR4UFfmQH2Bkdcon0rUlvr0WrFhwgReFArrU9KiQwTQxm1qKPk
	xhwVgHW0GaM15uqg==
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr164391e0c.3.1778059081902;
        Wed, 06 May 2026 02:18:01 -0700 (PDT)
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr164380e0c.3.1778059081444;
        Wed, 06 May 2026 02:18:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f00d170sm59259366b.49.2026.05.06.02.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:18:00 -0700 (PDT)
Message-ID: <a5b99e81-04b1-4d9c-be31-7de513d784b2@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
 <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
 <b734a099-b5db-4ff9-8b75-265e7f8194a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b734a099-b5db-4ff9-8b75-265e7f8194a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0mfF5N9s8uM78ail4TsW1U7Snoj-Zfe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfXxUskZIV6Emxp
 s/NOS10ITRW/QOD5GDNuPqjmfPm0Wl1S0BgtX/szIgnF6/pqjyIWQjLbxmtl331+QabXymLuPk8
 Ec2CrGM9beOAE8U+42ueDNcITsxeOqBWqcKEs21M93ndMr5NQ1RHylxt5gfFdSm2m9Dq7y5Q4C2
 z5TsZdresdsAQUv4j0m4yjp3cf344dYsNuZhK6+w0ZlBUp1tdehWSYZNYuleVbGcAmXIUE3M90+
 ym0kksoZNZxZPxBZHEE08KyL4y7GB4ksUXv7eQfzNqhCVGif7SBJ3DL+KoD2NmwiXGaMVj8UsMd
 SFW3kRv1Qum+pRTt9tVwMiqhwbBqwoe74M4MN5uZkqxhFWG4xOUfcVrPcSS6AiCZmDEGtV3QEyH
 okFvPRjM9mqUrkgY+gwufmAES0xqUFMS6dhq2Ghx7W486uXO+aK0j9SCH6ZSFek6WNkgGm01c+l
 BF7fFuxMMcBwvTE9bog==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69fb074a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=jCi_6XWtlY8gP52ikycA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 0mfF5N9s8uM78ail4TsW1U7Snoj-Zfe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090
X-Rspamd-Queue-Id: 6AB484D8883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106088-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 9:16 PM, Umang Chheda wrote:
> 
> 
> On 5/4/2026 6:23 PM, Konrad Dybcio wrote:
>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>> Add initial device tree support for monaco-ac EVK board, based
>>> on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
>>
>> [...]
>>
>>
>>> +&apps_rsc {
>>> +	regulators-0 {
>>> +		vreg_s4a: smps4 {
>>> +			regulator-name = "vreg_s4a";
>>> +			regulator-min-microvolt = <1800000>;
>>> +			regulator-max-microvolt = <1800000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>> +
>>> +		vreg_s9a: smps9 {
>>> +			regulator-name = "vreg_s9a";
>>> +			regulator-min-microvolt = <1352000>;
>>> +			regulator-max-microvolt = <1352000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>
>> Since these are on a PMIC that is present on both full and lite SKUs,
>> are these rails also connected on the other one (perhaps with a
>> different voltage setting)? Currently they're completely absent
> 
> on the other variant the power-grid is little different and these rails
> are not used by any of the consumers on HLOS/APPS side - hence not added.

Alright, thanks for confirming

Konrad


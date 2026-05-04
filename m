Return-Path: <linux-arm-msm+bounces-105809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOygEa3x+GnJ3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:21:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EAC4C326D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28BC93025498
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB30D3FA5D4;
	Mon,  4 May 2026 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgpBtGTC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/KNx5kG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773A3F9F51
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922230; cv=none; b=VIbldNr1GHciU1e21/qi/otd0CyaAu7gNOw2adv+tU8t1VXUmsVrmuIhldFq5k7mjtE0zvbMwGnuncv5W0bL2HyqyLumlTnWBGavErLdzDiHcH6rBqWIPvWSrce+tiz89ZvjVLUwu+znlnQEzaFT219pB3mXjVFBPYuVSo2BCmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922230; c=relaxed/simple;
	bh=76NWrhjV5D1g+WyrjAXtwxC1OH2IXro77m9hkYo0r6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPSyCysEZZpfKXAN8Dp6yL8PTwQyn+5wVvAjdNPljkzEV+eIM5k+U1ubm8H8pMQQujCPzxSf0JokngB2Mn7ZXmGqgG6P0CrPJD5Ztyqc4khz9rmbx9nCVONepVTLiqAoUBPkxuTO5li5VyvGEvohU+BAIzU2dVEbf+rq0n/rXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgpBtGTC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/KNx5kG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644E2h0M1186937
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6G83rJeBMT/sAZJvGczsYskezYbPGxNvoCtVNAkpoc=; b=jgpBtGTCoYB505HP
	zH4Yy6irAGD5XrDcWezuhlx09Qr6g1rcUeJu5jcuJvFhtM5Pdk4+eEumSyQHcLmy
	+nZnJe56NUCEALh219F4bg6KhhdmNkmPWU4W/w9B6HsjQQJiF+nizik6kqkT+ZV0
	VqTTWIlwhsgKkfC+eauEjYDXgUS9wB8PAaL4Y5FxDJn6Qpk5IyJayq/FeOtmOMDo
	EhiXsCEiWAPOBtMOmrt3G9xtMo35NU7pZLjirkppF0dlZqGOXjpudTiXDW+mmsYd
	MAzsFoHOfQ0OXZD3FynYF27AP5pRU/Xz7EFh4UPIpFLeMGR1HS2TiFcC7mSDC5c6
	Aaf+rw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvg98nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:17:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e8fc8af18so414686a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777922226; x=1778527026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6G83rJeBMT/sAZJvGczsYskezYbPGxNvoCtVNAkpoc=;
        b=L/KNx5kGJFtUP4/vLtV+cjn12aSC4ZTLETS2tGmMiGQZGdRtEt5YIAWe//0pqKEkww
         +Zd0Y7fEMPObckyhZ06pSYA/9UPdplqfFer7s7yZYA+aynf0vd62n5vmGAzsQq1hNnyU
         rgk6JPERVNoto44GtoPvehixv/tNyK9k/cmAAwxeJoILLJXPBFCiMHMlEdwUQ+geHp4y
         bhRnZjijXNNWaFSxq0wvrn1v5/a5tBhy7LqRs2H/PdZRq1eRdF9PPIrkQ/4ZtJNVOpiO
         KOrtIZiDvwb1OTQw1XDAzNqPtEOd4tbOBf5+pbYDoW4ErrlMlMPOgWhTkuIiLimpdXtG
         y49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922226; x=1778527026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6G83rJeBMT/sAZJvGczsYskezYbPGxNvoCtVNAkpoc=;
        b=rAa3elAYNSJTAat0UV5OHBhZ/QaQkB1ThMhMFZNpE0GTTJmcOvGkn1VTu1zYZtqj1i
         LcSqfY8PMgh6Lv5UGInGDydaoBdvdcPkJXM1L5SNfc+k7jvZJjPs5KGza7NqqERPWVX3
         MjuMpKRnTKBPrdZh1jFnhtYD4bH4t9pcrzplHjQNie8CzOu7d6Ot3qugLADYyDa1Ffus
         QLBF8wKT3j3e0x2mE2tn7IlFIJBaECJXoV6teno+/438h9+uAh2EoBDSx8+JaiqH2w1f
         ya1qoZ+zjvBsBeikT6JVk0Rx5K5C30NBOCL6Mhlk8L0rt41lyZJc4oj5+G+jfahidZOD
         vVrA==
X-Gm-Message-State: AOJu0YyHeMmzkrBLcOUTFUcmoAchRj3k+vpq9waJszIZpG/YQRakb05Q
	ilvAFROHKvL2a/7ZLP+rnUQHPdUYPOiksF30jlLt2pmutyX7NPQRndwhttKCNoDiIkrlo0Xb5sM
	HzOnj7PA7MIjIamvEyT0O4IgYTIRUfcVFEfhfgPjiDe4O0r+xRwQ63FzV/jbTQwftpaP1ULgtRS
	M4
X-Gm-Gg: AeBDieumf2bUAm6XwEnnjmpUTuhyYT+NXKn6Jubxr1Ep+kRf6XJWbN3HxwVPdJTQbwO
	VZoDLFRz0dsrK2zQgcFSdlfvzONwreWJtpTwWyZwDFub99p2huaFkZczBPvWRcvWJ5s7YUFoWNJ
	4M43iVe6aXrncCCZ/9NNxGYCvNvtzy2a73rWeY3yhoO2z82ziI10/P6UUXC+ircDF5oRmCy57s8
	v4XSfEHpEWmHdwhCneZg+3MwhjJa/48VtUAOtFzbSF0KyvU6PD0Y0v9mUeTPvapKBSxpdoZrufE
	0OcKMnEfVU5gklZ9rM1zLJeZQ50QVWk/8eBDSoFtd2snEKzt8ZOLOy0ZDyibmQAxQCbnCuPFJam
	XofZLuWbhS6o4HA8i65f53XIPpuwDqD9/aX27fHgY5rtlalHjhHN71I5fJBG/
X-Received: by 2002:a17:902:d2c9:b0:2ae:cefd:18ce with SMTP id d9443c01a7336-2b9f252e30bmr58939865ad.2.1777922225998;
        Mon, 04 May 2026 12:17:05 -0700 (PDT)
X-Received: by 2002:a17:902:d2c9:b0:2ae:cefd:18ce with SMTP id d9443c01a7336-2b9f252e30bmr58939615ad.2.1777922225378;
        Mon, 04 May 2026 12:17:05 -0700 (PDT)
Received: from [192.168.0.8] ([49.204.27.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadf8dsm116520485ad.23.2026.05.04.12.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 12:17:04 -0700 (PDT)
Message-ID: <b734a099-b5db-4ff9-8b75-265e7f8194a1@oss.qualcomm.com>
Date: Tue, 5 May 2026 00:46:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
 <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w7MokwHnx2jJZ_f54g6SboZPmwBEYZ0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NyBTYWx0ZWRfX1YvrdhRo6SQd
 krjI86QVpNU2CGx2/q8Q5dIL3SvJpP8VNd7ZQoL0iji3AqTm9gzx1zvyObrv0uTZ4moqse4tSeg
 MZhsUkQvrWTn3JJmoFpOs4jXi0kOFnePM9P2Ir8nbVMxFmlYY0nWFIFEtS0dRpUA/o6hP2hRBL/
 IEAGDs0Y/9BrkswbASFeFKizcJK75wzHXHFFVFsnK8CL1xpIfQ5uH/9BZzFL/NxS/Pu+nR3jeIE
 MFnBBCH5MquBoNo+9dP59gwUQxI3FXox5X4rsCm9eU3eV4NniJ+3J3BkOPMzRLSCw+GFqfaqudq
 opnJS5feMBir6FzsXGcuH19aLGtqovaRCD70cyv1WnObS1iJtuT0khDR6kMqj31TKlYcfaKphnF
 ObhqTv5aBfTyepZzAcms8p5CO81jXehlgdkS/5XtLC/PzULDvqnF7PfSsT9CnX+uQE722/CJo9N
 QAmbHY4f99DbbsBVsJA==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f8f0b4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=U0tfe/lGaXrCh4Nw9m/t+A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=4d7jUEtvsScEJznLE7gA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: w7MokwHnx2jJZ_f54g6SboZPmwBEYZ0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040177
X-Rspamd-Queue-Id: B9EAC4C326D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105809-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/4/2026 6:23 PM, Konrad Dybcio wrote:
> On 4/27/26 7:05 PM, Umang Chheda wrote:
>> Add initial device tree support for monaco-ac EVK board, based
>> on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
> 
> [...]
> 
> 
>> +&apps_rsc {
>> +	regulators-0 {
>> +		vreg_s4a: smps4 {
>> +			regulator-name = "vreg_s4a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s9a: smps9 {
>> +			regulator-name = "vreg_s9a";
>> +			regulator-min-microvolt = <1352000>;
>> +			regulator-max-microvolt = <1352000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
> 
> Since these are on a PMIC that is present on both full and lite SKUs,
> are these rails also connected on the other one (perhaps with a
> different voltage setting)? Currently they're completely absent

on the other variant the power-grid is little different and these rails
are not used by any of the consumers on HLOS/APPS side - hence not added.


> 
> Konrad

Thanks,
Umang





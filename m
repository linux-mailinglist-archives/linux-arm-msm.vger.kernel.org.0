Return-Path: <linux-arm-msm+bounces-82864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F5C7A3B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 05083381197
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CED0350288;
	Fri, 21 Nov 2025 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgNqHIO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaE7BBb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26E34D38B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735293; cv=none; b=AzI4zl2gKiyBRJ3JQMZeIIy3biRjhbSPPy/JTiyieuBxbqDvjq6dZVD2rST/wQU5nhH7pIA2afpN53Q0jzwrSAhXWso3TAyXyb/V43cIvZ2lgIOs1cwfJ27fT9ifWeAsdZfpQ/XbWJ4wyinI7nvhRcr75N03qNbyhyh9AGI9I/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735293; c=relaxed/simple;
	bh=GKq7k+FS/ZykVV5gG/enZ5RpdkYwWozwzaED99QvrSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I79KEGVpciWBSdmZrpSbSPLkP7jSi1YMTIGpNGiQzU2WwcnvtzMbNCt+/PCu/Jb0LwM4rse4iMfupNEmgsD5g57rY+dDX/nVnoZGk+Q/MEmpIzRIb5cfmjl6Jac4sV/YgvC8HG84iTmhCxH9jE03UnERKvuyAuDdA4KU4yZi6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgNqHIO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaE7BBb0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALC8pju2756812
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoI1dUq+oivFqL/OZGcwaq0k7v3b1wwEHa7O76DpWc8=; b=UgNqHIO7Nj81Wryl
	gDRBa8Gg58yY177WxVSXzfMGtsSnDZlqrvp8VpWbJrs8BJxPCuCUe0zdT7ghlfxF
	D5MI0HaxsXPG1hL7Yb4FVvV0/h/4iFPbHwUPHZb6/ATtQyUdUuTbIoEUVKPG+2F3
	CDohNT8K3V60UD2cj54bKgUWFeUPanI94KSwIE47LhYIE7x30OsHgggPHYchXSWm
	HgqS0w/Tib0qVgXFuZbB0TAb4tp3SqV/sNo9Fs/sh0JOJnx7X020LOx+6ntJ1aDO
	4Qx9R0nn0r7fNea7+7GTF6rX1IocLr1gAookMruiVgb1TtU/LiT9P8QkLvpzF84c
	GdIpfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy61qtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:28:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so75791585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763735290; x=1764340090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoI1dUq+oivFqL/OZGcwaq0k7v3b1wwEHa7O76DpWc8=;
        b=QaE7BBb0NYaSKNVnxNK/DZonIDVggrTjf2tabCysxMvhEozncUCQqEyYxUD9GPFxVp
         YB2S9VPbUkGQ1hR4FfZIGFVdP3w/3bXHG9GE1paWnLFIDId7z7T+Calm0JlJh7iQ5NPa
         C2vQlJSlm8q4vmFik0XBLMdycWOVFxMiwWrWGaaDdfkhnwKkmdJMetRHsOvYNMX3AHIR
         pS7bmbUWXmU6RyyyjUiStK68GFHXkGQBOEFNTX9h7smfXFVAqs6rUicE+4bt3AOhLsWl
         5dToHD6om9SWgUvycL1Wa+lRX3T0WFhzTFnWJbB+y+LzIw/74uoRdeN4Bp9Bs5AZ0szO
         X8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735290; x=1764340090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoI1dUq+oivFqL/OZGcwaq0k7v3b1wwEHa7O76DpWc8=;
        b=hxTHOIJM9QKeswAeKsVs5PkBbRfw4Yr8aNa5Fznbvwfz/032dCfflyPoepMP0yQAQo
         Rvr8HqurnwNzcuiCCAQgpcPQV16mWW9B0UlnDc7m6bw90SaJtD3vDXrpy29C6rONFDo4
         9k5dps+xMlS1mYmYyLaftUl3B9PCgp+l/PAMkmUCW1Wtr/uIum4SOlIIjzjIfuRuY3Z8
         fnCyjDhA00Dj+Gj8yb20blEV87etgjIJsokK3CCkvcPFPAova+i+BKLKKmN/lDmi1wD8
         M4DVktf8+Uz/C7u50Be8b2E/9Pq75GPgpygvlTlyF17wNgJGJzY9nVPPkF7zQLdNMFIS
         Jd1Q==
X-Gm-Message-State: AOJu0YybeHD1X7IMM9XkkNtRo/pG+SLbAjuNUFLIbrvfe4lWEK1IxWw4
	7NC2eddrb3q6aVwWsKUzXorrJCi2jTGJa8a4XaDRxSwrMW+OdDbqi2Qgpbookg+b+n5UdQ9YPtI
	x8oL3KfSXH7bU3PDUQi55m2ssVO4+K9UEnwjKujUyJik4tQh78a26FDYicqOCnOkMLOHf
X-Gm-Gg: ASbGncszVrdfz4iqHILQnuHwcTYFHsiP6XEmGKoqIMAh6L+h+qiSBstcw0gbiueq3q1
	77uf/ktdB0dVI13UmmIfmu31pUmCEPb6+BWqK3oPWu86CC4ynhnjeNaBHCjIMPz3c3MAXtMUquR
	iszHpws8BLYtx21NIRUc5rh1zV8Fgg9KhH1TYkWwbUH4ne8swjWORvdb4qbCp9c9E3gJlCHfZWY
	0BN4jdFnX61+wok6/rdT+ZKZNgIg6EHU3qPVQKjtM2ukRXqZlu5kNW8ocOlWAndpx1OnQTvdOL9
	tiKo5XJIx1vP0vBBi14FiHID5its9Bw50dv4mYJgo5piy4u8TlQRV6OXgmsbc91DR/skLSanjas
	WKcEoPGoORg8iwE57/VQ2CWVr8obn5TzH2JZUW4ypj2w97Vc3CdygmQ9a8RXABtz245M=
X-Received: by 2002:a05:620a:1a9f:b0:8b2:df32:b900 with SMTP id af79cd13be357-8b341cc1fafmr136185985a.4.1763735289902;
        Fri, 21 Nov 2025 06:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqN3gooHNCGCBP/6f4HRmCzZ7PnfOrpv9ASGK4PnrV+4Ug9pZjc83V82b8YOPK9fw5ws9zdg==
X-Received: by 2002:a05:620a:1a9f:b0:8b2:df32:b900 with SMTP id af79cd13be357-8b341cc1fafmr136183185a.4.1763735289415;
        Fri, 21 Nov 2025 06:28:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d54cf2sm472598566b.18.2025.11.21.06.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:28:08 -0800 (PST)
Message-ID: <43c3a330-0c46-4dcf-a9ac-86d9bf6573ea@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:28:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ARM: dts: qcom: msm8960: expressatt: Add
 Magnetometer
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
 <20251121-expressatt_nfc_accel_magn_light-v2-4-54ce493cc6cf@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-4-54ce493cc6cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=692076fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=INxY3ozUAYpN26jWuhcA:9 a=QEXdDO2ut3YA:10 a=p80W13QwkFgA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4QdLAmz8K1jruRTjKMMSgVLUc3O-pUwE
X-Proofpoint-GUID: 4QdLAmz8K1jruRTjKMMSgVLUc3O-pUwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNSBTYWx0ZWRfX4knIu6Ortgnx
 Hzh4rQBDDI2t+E2p1E1y/YbDE2zMVfWwBHwyWc9rs47A/A+zWprYKg2k+rOKJ+/PpSgkrVuFP7h
 rho9D6g8dui1fmQ2gx9glysFCAxnAlia/x3b3qAvq4LwUbYwjb0hPTNGLRQXM1vbfcMIengJgsW
 GsERq17XEVzt3xzHaN12cMGrADgVuatbxuNDEPrKrTmh6ylsBj8kFgB14UB0XcxKaUd9jLHtYX5
 gWbsNAKVu9guKN4HgWRu0Xx1l/7beM5d8N0z6GB4tqNeyoAsIp2jrNqA0xMokOpoVwujHJrazmt
 svKMsx8qbFyZyTe+CVX6g/woUtqe7Gc00QaAOdvE4kTStwXiwS8xJ/aQrlAV13O70LHJEDqVAH3
 CUXmJ+Wo3zcV3LTAOnpPucteVtSxiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210105

On 11/21/25 12:44 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the Yamaha magnetometer. Mount Matrix is left as a TODO.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


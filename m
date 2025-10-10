Return-Path: <linux-arm-msm+bounces-76815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E342BCE6D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 21:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04F53B0BDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBC6207A20;
	Fri, 10 Oct 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bzgod6AR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7025CC62
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 19:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760125842; cv=none; b=HX7HT8/EjYFIb5a0SbnN4UQX7UBsYxQNqGK3lZz9iE7Phsp+n2o4kEXEQCpixmtaulvUbGZRzrvQSSEcISLrqziLG11JASsnHysUPBoqd55t7dxvUALBfvK83BWmMpaPeVXq6tX2LNORi5FYgdt0/D9q78+G16aC9qqIZctKX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760125842; c=relaxed/simple;
	bh=sZavcX7kBLt8oeduhQ2bgNxm7Z4DXMA1Hszm3y3UiPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9Y8tav0YJI5v6OmewtQ+egT9cZcLNr87pwFZJDbavJndRxS79sdNiN/HAflcEwHyVT1KURTKKbZg2ReDKD1nCM0ct1/uyFBgpKdsvYWkydeepVDXwRtKB+Sfu75ykVHRsfGA7LU7AK1Uc8dXLsjH/1wp1tQ/uplhCK7BwkBWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bzgod6AR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AEwoVI009339
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 19:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MPyybomxgu4JiJKi3mIjCQ2O6c1a/UTqsQAAvieK8w=; b=Bzgod6AR/YHO0LhP
	VZfBAIInvJ46D4x5BNVlscPwq3gB31xhR+a4pezcrh/GToYoTBfEq6+os1/kh/cp
	EyyZow5wbKZdV2nyKKUTuY9bSrMUcPZxbqEoGicA1hcWNBRc++VtAQoXoAJMkgLD
	H+TjOzxyQKLYElYnb3y7B+IpsqBgFUxM0GHGFye+Ls3R7MYnHbbgR414Y1nYCLGe
	42OOuV1H0B1Cnl1E8ZfDdvTaSEaUtVDGTr2EFWy4uL3GpgggPtWgFRW8QE5km/TH
	kW8pKaKtU5KGFJqEU/iq8zjp/gxtBdgJGKKCmp0zB2Z4PZthFS1nOzkNQKctcgOV
	bEpm3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sqj9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 19:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85d43cd080eso111845285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 12:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760125837; x=1760730637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MPyybomxgu4JiJKi3mIjCQ2O6c1a/UTqsQAAvieK8w=;
        b=B9/rwlAl81L1R7IOz5UaDlW9met2vRWgYd2OHPtCA1aEOMq9GGzov3YE4bTCA+wsqL
         KGf5ejkOrKU1liehkCkLDpVGsKhPR3T8xQi6p1NOZnN8O5eGTpdrpahvwAGNUte5hCwp
         jKUz+xvA/8E13XXfiSx/blNHksSvmvxPJKav5SXX3sNCpFRwulbVFWpt8hMWB0VhfEaF
         BFQGH7ouu4hjnMVR6MYUwSVhArUblm9H+uQj58SGlZwLBdzZWoOes2WtrAZBR2iaPdi1
         pD1e3nOOId5HfAISGzAq//ConZsLzJOtdcLL2sp7FrpDmlpgn686e/zGrpwkTOwfkur/
         FIAw==
X-Forwarded-Encrypted: i=1; AJvYcCVP3fvVNwSZf0fPJEK/aq2ERkbuFi70a0dyrzr66dOUHFPw0qucZYIgU78mOGvdk4GkbkL90Da3Hh/VZyuZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzI33+i2faJ5ql2QiRg7uruSSmus91+msb7DXO3Ncrarmx+riZ9
	m3IHVQKV6f/Eg8ZJleNk+8pZMamanu0JHPhdZdtE7iXWFdYZwkHBmtGNCm11L1EUNQ8KvpCkEvV
	DO5KMwrC8EOwabNG5VTSgl8HsNkCA/wiB0YSQbvhUfwjLalp9h4/bqgCtLIGewdeVoi+a
X-Gm-Gg: ASbGncv0waZVUBz6rrGlGjp+nSPft8rwkFWq/am30ejbgHKTfQocWwSYLMV0wANNrdn
	yxb7XyiUk2xD4m+aDBWEc4cDV2rJkCrRgO/ksrNXwJmdSYP0toEMT/p3wbzD1W+QN324lcQ7UY8
	t68u0HVZA6XVfi3JbUuaBW7qR4UVFlEiy1jyZSTg9qRP2N77ccyob5YmB6nanBekVkZ8T0Ibkqj
	pCdVB9D6hYXBSwC8mEjFQcaYZmv+a75lwvZJV5I4htkxPSjhjWL6hn6Uj9tUUjqkKwZPpr38Y5Q
	ERiWiutAirFNWzqb/RZwjdmypR+JZl1aqt928Q7uosrDTeUV3rVcQ12smVyA+T//eYxuShMrlbi
	Ug8ay5W6ap6jYsNY9ivSM0A==
X-Received: by 2002:a05:620a:4541:b0:7e8:584e:2de0 with SMTP id af79cd13be357-8835069b0a8mr1276201185a.4.1760125837568;
        Fri, 10 Oct 2025 12:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsEIpzwk9aNXeftPka4p5UZjxdoS48MGp75kzj0kB3Zd4ECSA5+ZSrda4I8ze7bAuoZpbvQQ==
X-Received: by 2002:a05:620a:4541:b0:7e8:584e:2de0 with SMTP id af79cd13be357-8835069b0a8mr1276198285a.4.1760125836951;
        Fri, 10 Oct 2025 12:50:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900e432sm291551066b.65.2025.10.10.12.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 12:50:36 -0700 (PDT)
Message-ID: <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 21:50:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
To: Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UGCJCBGeGpgofJFLYd8T5SUKvyQ5GHxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3CnWmAYC3Wjl
 /OnEgf8Fj/gGP/nkYxL4tR0qp5/MnS/PBHN1EqtgXyFI0TJOzcY32K7JrabhXyf21KOxslQxKs4
 z6jLLb0LwaIWNy53CYgKHM0/xG3BHfPNJ3vl/ufdLun1gd9YOlDpckLLalRTU/0k9JdsvBgqaLe
 kwDvM6RKQQFVKGwMPfU7+8Kq+miza8q4T9hbQ1CdJIWa5hzGRVPgJphDEKvyyaQtMGvU/oMSB3W
 IezuffDJwkg2TypP2iLGArSBWimrQuLLGP/h6OSt/CWv460NIkxsWRGjKGu2MODnmMXIyCCbEB2
 PQGym6wrW7zP9Q7XzlfBLU6U3Btn3GV+eKC03W1QSlxr6+B/x26OVn4PxJKZ536c8ZDnnxuMQUw
 t7PEWb7bXVO0O3pTOHGxFGLi6s8heQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e9638e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=XDqENUOH4wWVrXOETPwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UGCJCBGeGpgofJFLYd8T5SUKvyQ5GHxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 9/14/25 10:24 PM, Heiner Kallweit wrote:
> Annotate two places in boardinfo code:
> - __i2c_first_dynamic_bus_num is set in init phase. Annotate it as
>   __ro_after_init to prevent later changes.
> - i2c_register_board_info() is used in init phase only, so annotate it
>   as __init, allowing to free the memory after init phase.
>   This is safe, see comment: "done in board-specific init code near
>   arch_initcall() time"
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
(arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)

gcc-14.2 and clang-20.x

Funnily enough when I build this (albeit on another computer, but also
with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
in the same DT dir), it boots up fine

Konrad


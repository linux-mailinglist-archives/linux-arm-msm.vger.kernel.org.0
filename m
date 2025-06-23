Return-Path: <linux-arm-msm+bounces-62050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802CAE3E06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18416167BF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD1423D2A3;
	Mon, 23 Jun 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTMMMmD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34823C51C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678468; cv=none; b=mlp2bsYpRbGONHjN4HFJ/RdoIEl/BK56ZOxeKfUMv+7KZhuIC1GoZqLDs5aceisrPPA32r8SndUmFrtxXY1M7h9MG1Lb0GSP5SfznwZmMqcYkrxjo896ashMDdkL36DAHqs516I948bHt3gguBexGqu2yo5h/r8LLe2VEicX8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678468; c=relaxed/simple;
	bh=PFy6DZqYijFvvzn5Rs4R3EvlKOJ49HtPp5i9VMENABc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QyBLTGSZwe3sGUKePEkIT7UBBgPoayR3tl8CoJPD1Jt4Kgk1yElWJCWwA0R87Hi4GG67IJhGIo8WPG1XN0M14LoTLt3Q6VvyJIeOX4XKTCnB900FyV5DRIFqzidDyb6nkKuKZHUn2IqEVa1y3NTbJJuKPIm9+h8OTcCeuguOYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTMMMmD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9JKuZ013471
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1P4gqQHkmhqMopG25g3g+FXXW4439jKx8yVBtkS8vRw=; b=kTMMMmD1fSIvw7Jg
	dZO++ktt8Fo/6HzE2zsAUlXoEPPqEKIDUptrbzetKgfBsAs6Fi3S5r4b1AaNQPEf
	UGNbUHMtjHLMdVgxHwX3fdj7oChOJ0vAXjmwCWCKyxAlD6AMy8cT+rgdzxn68ex1
	xC/TnTaG+q9nNorO8ZRk2v/QZgRukXfc1ZtkE0Tm0SnTRiKs8fLZQVJV8FPZ1/Mj
	2KLSTiWYNOswek+bsSP80lx6sd7IbOpYH1vUkZS3PC4DOpaaELFTWTi2EJuKXrO0
	z2q3DfvQas2pkGoEZWoezTUN3PIqXhMp+FecM9Tqg5Jna2UDBV9Wh/1kBMXnr3Kx
	b4EU9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud09mnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:34:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso104542085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 04:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678465; x=1751283265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P4gqQHkmhqMopG25g3g+FXXW4439jKx8yVBtkS8vRw=;
        b=TEfX6bWXF5JD7hPbKf+znVuh39sXhZYCEC3H+CycyNa8sd096TDal6rIXMojN8KPqL
         bLAk/gqwV6JIkQuWCpU95fcSTAZHEKIIzrobNRxv7zLArLQ+meSJjxVtLNLpmiUPVtWJ
         Q0Y/bS6MDm56z9NmiJRggWtRcqTpqrxYvq7+yenSgC3yfZSq69jW2uBbeM5pgtoQouQQ
         w5zIz6KyTjx3g8IDxXVc8ZpeqWWrBV5AnO1//IJqSHz7N+XqytdTtlHPfJWLtFLvuZch
         fD1NCgcMDx7++lh8Ay2z0PZVm+ikUx+T8tHqw4lo8Z+zv5B8917f+Y2RJa9KyaLIpm1L
         6RBg==
X-Forwarded-Encrypted: i=1; AJvYcCXmWCBzvCa5JCKfcdTnSfJQjZyoC0tVKz1aN2xllCFRiMh1PCBEM3YhXpkgWhF76X4dHWRBVhtYeoBi5PNu@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTQuW/J3N5XUeK0ANyzODnkbePB2bIkO+zdOdeLfDuc1jOjHL
	fj7gFEbKlBREXdSz2Jf5/vHaBBgrxvlyloja0Md+/WJsUt27UOxKYzBSmGbflxmNOmjOv7sV7vw
	Jj8qlFUYLfdZ0l+wwVgqmLTHpO6ILP8tH4Rgds2CLjUz8w9BbmsDmTEKZN5rKPSvdwR8B
X-Gm-Gg: ASbGncvosHH8JzX6hKhHzpaHrUE3GSEq/PfmgeIXhkr3Gm/TSca4uAc/Zl4Q/maHyn/
	oSl4em6GaMfEmEqLQIcni9HtiynYR1F+mNsSkXOzRCooxUA+DvIKtrp+Q5mcUYbpoQtJhF0XQqc
	+E3MRR6dMsVzWNsr+9lDK8V0qgv+3tTEvqyiIo3uDQVNNFM+zgNPMmEKgJMw7fDs0uTF/+/PumK
	SvkZamN8O7kV8LOtZJIXN2JH3PoV6PFQ6HBbkldL02RzHnbv/oCCLiUWZxtwVenjlwfDMJKpdnL
	uO2VTod7GJbfz1Df1rflBeNt7/upJDJASglMKKQfKOjK3VYarIyx7KJWDr91h7/HeFwlyWU5M7H
	6lZg=
X-Received: by 2002:a05:622a:8f0f:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a77f807e4fmr40214321cf.1.1750678464674;
        Mon, 23 Jun 2025 04:34:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqS4ZDp8SWWd7RHWhdDGT8Y9mjrW/Hb5L9OlYTHjzT2jbPYQIQhvFBuzyl/0D53huNkma7TQ==
X-Received: by 2002:a05:622a:8f0f:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a77f807e4fmr40214181cf.1.1750678464137;
        Mon, 23 Jun 2025 04:34:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbe9esm688093966b.44.2025.06.23.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:34:23 -0700 (PDT)
Message-ID: <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lumag@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623113227.1754156-1-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: En5J72qRVvt-81Q7SNwiMvZKEL5evGVr
X-Proofpoint-ORIG-GUID: En5J72qRVvt-81Q7SNwiMvZKEL5evGVr
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68593bc2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EVHRmTP1ojgPMQ00PA4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OSBTYWx0ZWRfX2j1teApZe3L+
 oIiWBJkIF9XYHQf4A+wlURue/MUe3OImjn+yv8h7G6sIZjq4zVT3o67oW3eJf1SYeIGzl2anXhE
 IxjTgnmQ/5INI1TNFe8A8QZg9VypQYkCBdoRENirmS23rQ3/rZ4LxPstvxugtAp+Fc7C2RmmTGC
 yz54nkP+HYIrZSLlf8MRDPrSUVobG53SLHBEFqg9SRIhmpt4niZrBUoXM0upDvoRqD8tSUbbX0+
 d8M19V/Ro19A4LjqcldaFGsCSupWlyRR+z0ZdkwWdj9LPl19ndQLnTg5YytltHU9zbgxQigelKc
 M2Dqb6Qqz/O5bqcFOl3QUVD41QOs3A1ZalPi40nFyj7779GytPJrTJZBJ7EFQ1SCDCwON4nwClK
 tbW1cIk0K3dnh8uU284V3/Yk/PpoXbWlliJWzZblvjzAAqbatxw1l04NtSmEYHqBaqhlZmO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=811
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230069

On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
> The min and max voltages on l2 regulator is 850000uV. This was
> incorrectly set at 1800000uV earlier and that affected the
> stability of the networking subsystem.
> 
> Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Shouldn't there be a consumer for it, instead of it being always-on?

Konrad

>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index bdb396afb992..21b04a2c629d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -106,8 +106,8 @@ ipq9574_s1: s1 {
>  		};
>  
>  		mp5496_l2: l2 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> +			regulator-min-microvolt = <850000>;
> +			regulator-max-microvolt = <850000>;
>  			regulator-always-on;
>  			regulator-boot-on;
>  		};
> 
> base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934


Return-Path: <linux-arm-msm+bounces-85512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44464CC7EA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09EF230445AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDC9348880;
	Wed, 17 Dec 2025 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+Qp6wO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7dvgoAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1F340A70
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976488; cv=none; b=CMPEvm8AmzlEXE3jkPu5uyptTEiwYnt9zXcSFAriH5xlNi9/8O+4oJP8djksTUoU5DQ23Lix1vGFco36ZGyOx92g3DU4hLZkbVg+sSUS4towkjxDM7ueBS9CVJKoLH2ruKyVBxwMEHPppWL0j4JUuISFUNeWML4hibwXxbez11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976488; c=relaxed/simple;
	bh=A1C1DVw2kYKq12/0q2dzzBwvYL0KxPDN6q1KBWi9EjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1Xbs7qPP2unLv5xoohimbposCZopQt7UsXV+IqRUc4pzS52fprZZedjFVIVGhuT53KpoGUqGq+FBA7GGmsRE5Xl+pnhyVuMxg1CGbbNUr33iAnrNE4Cmw60McrhZoya149wmVkd9D2cyBZpgez0dNjV8YnBDjWGGiB7sYG9oUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+Qp6wO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7dvgoAS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKwuO2674092
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLspVCdAk3EWHEmP/9FH9J41h2/QBcWk/TBEt+Di6/w=; b=g+Qp6wO0RzGOqaUg
	hAeFK1pwCExQq6JSF+9lJJqwnWhaATJIWJOQcrXtGzf19c/xenrWfjS5GMoFmNXR
	MzWCGMzr+jNWpGDPCSiZspoopyuRCWHm8qk9EAibULqLYkRKfnDkBPnvVz5PcCUA
	AGWbeR0EUnEuIBTnUP9YEJlEgvm8kA2bEHTuDKQFY000GoImLn1J/bIJAABXaEwg
	+Rtdue1qz9b44cSEgFekfbHltJzvaxLoBC0hYunaLnejh37DyiMbwaAsNAmYHED3
	V43kbGhQX82mSogSk83wy2ffTvqSliv0yC3DkPTJr6d1+OVDDjvDrm+1pBiBXhja
	hHFE8g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1n71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:01:25 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-3e895361345so4264481fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976485; x=1766581285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLspVCdAk3EWHEmP/9FH9J41h2/QBcWk/TBEt+Di6/w=;
        b=T7dvgoASnTyQF6U1GXKuknUYG3PUp24E5VBUMQpGHd/vDVQQ9OJHTigK37AmKTb6E9
         7kNsA9W3eoh9P8LDkvE6fofP/QAeqMocJPoIfPKcAFc3vPprZ22w9ApYXGV8pHtD1Msd
         gsQcDrfN689mAkanGmBpShDv/Q+CkjTjruCd/luR+iSfEw6MwgxovHWOcqzyZInwP1w7
         OcYV/teKGptb87s6joecydgLwGeNDL1hnKtQlJiVq9wYgewA1rv+OW3tBHbZ0vkO6ZyR
         s26YdfgBJeuZFXXwHhC6MT98tUkjXI8yrKDzDo95fXf5WXdDCMIUqZ4LiCU1ZW3BFtkN
         cQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976485; x=1766581285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLspVCdAk3EWHEmP/9FH9J41h2/QBcWk/TBEt+Di6/w=;
        b=AJPCetk3lzR8L+Lf1e6YPZX49Y2J+/pS7Oeo65ERfUGzYgSuk2pEP0w8pLp0NCgUx3
         xUicNMswi/iXy2SEx9Mn2kHPubL10WaGkVIuKrlgS2rbBiEifQ1BJQLXU4HBCcZgduMl
         FaNNLavZppgBhYwCoeVieIAHJtY73wRr9nMsRajFfpEeXw+xppqS+nCKmZ47jUryN2S5
         TyXme8eJc8IVxiWt4TlqYkU1LGYXPAIdAT17ZSRFjEvJ5MgeS6M7P4Z7t1owb1DzZWhX
         Uk4J5czqQhmVaHmjDH4VSjhCKkyh+6PoE5YK3iFqnBZ/tKiZ2ZOh76GGnXT7YqOzTZye
         /IYg==
X-Forwarded-Encrypted: i=1; AJvYcCUxNkL1gsyMgiaYZ7u6k2jdYg6k8+BMGY83icLVVRqpUmrxVyqyJA4ktHR/GVqGxSlY1KWZSxU3o2+GIHI5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr2zWHrWkt3Cn+8Gyg4bUw1BM7/eKkBuZl+F1eTitbpkb0pAas
	0mizVTCQUF2bFTr7nVsYdW9QLz1lEoeMMTiqO1iL2vaMbSxX6Dz7fU3MDpfhyVwSOkWqwKOBnD6
	u9FFCRJt2oGP5+1CdBakKajKIYZ64fgcE7hQrnPWK8BMDtq0iHiII/9zgDoIOxIXoEHF2
X-Gm-Gg: AY/fxX5PYsmNBFHCo4E2ptnzuJjfhv+Mua7mEPZGJiT8ulJwgKkV0nqce/IwClGGr/l
	5kAa3XbIjZ+ympJr+X9usdpiSyJiox5pqcPJpXlR2KJlcu/6O7iqtN41kCgnIfbtPFmopHJ4B9C
	swCwKGRp0g1/irqnoRqEcByshULvKZSMwu3M89ghm/IDGs+JOoel4Xgo+dAMjiMRq6bxvmfZTkA
	gB03IXxipV43RUndBQN2JXVzBtzvAWCLTMmo66CZ9rH9YKkXxNU6la7JPbFKUEkPmW3w0EmgNDW
	Pn6utJKQBZ1R+2hseT72bMKBl+J7/r36Hvn8xEgR5VILi11R4tcWnd9j0mDu6v/R536akxtAGID
	Ox4Nx/ux+/rl+VjjIxxqkDEhqTvE8GK8v5Q3/5LMHdbPryUk/ChuWOoVYrHvLVs1ZCg==
X-Received: by 2002:a4a:be83:0:b0:65c:f660:57c0 with SMTP id 006d021491bc7-65cf6605d27mr246364eaf.1.1765976484817;
        Wed, 17 Dec 2025 05:01:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfXurB2tcNJ3nbjzskhO5vlvJezsbyatg1yvX7UfLKzmMg1RdCpvpJB188Epc3uzojFyltZw==
X-Received: by 2002:a4a:be83:0:b0:65c:f660:57c0 with SMTP id 006d021491bc7-65cf6605d27mr246337eaf.1.1765976484138;
        Wed, 17 Dec 2025 05:01:24 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f56b6a0sm2386349a12.29.2025.12.17.05.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:01:22 -0800 (PST)
Message-ID: <1bdf4195-f344-42c0-9ee0-042291fa6f26@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:01:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMSBTYWx0ZWRfX+lsSLNcP7A2H
 OXgV8MYJ9dslnHQy/UxOekg6BIjI13ZncnwR7oNTgBTEaj4Mr/zx4rGj8ft5fo/mKPJnd3jQpAH
 FciYYJpSYKDvs51qrqv1ftl3hqg/0bxb9ooJ8plf4dQnheHpiLWEEADgQRWvSC77gzyV612TOqe
 An51qRvOSGt7o/W0NfGhyLCFYzBLWBOZ7blxeYRgFezjbE/AnmOi7ewlN9U6TyaDfVKcur0HZwG
 +gXEeuCXXK8D+G/Wl0VepGKnr74eTHkw/1NdRNpu3PRItegxmGaFKMAGLnhIUMvhbJ/wet0bI0Z
 90H+xwTHIOqeILjdwFQtspYU7cAkaS2i8GYv6d2jkE0cdIKEvulViFt8zFK1mXPD/Cqo+5XDU7Y
 jHRcJ82GezYrUVfIe2UozQOzBF+UfQ==
X-Proofpoint-ORIG-GUID: HKKxtP-uk3dCdY-Q5eriWuIcHUQr9q1b
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942a9a5 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ii0bGMNOlrnFhgTP-T8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: HKKxtP-uk3dCdY-Q5eriWuIcHUQr9q1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170101

On 12/15/25 10:07 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali QRD board which enables
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added ufs) and Manish Pandey (added SD Card).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


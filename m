Return-Path: <linux-arm-msm+bounces-45922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8712A1A0EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C3816D76C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8061BC3F;
	Thu, 23 Jan 2025 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKLextV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A120C484
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625011; cv=none; b=L9wvZMKZOXnrDzkx2wQbTKbrZqgXwiIirJ3UT59RmKDe0CAWisNp+daPo/F8eJ2WAQeeeVrYf9UqvGlsU3QphO8DaYR50DKmeHLa+HNxiOx2F3/WN/kzT0TTUbH06scg5776AoZoEykKjtgX31eNXq+//6cJak/wLIb64oBaXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625011; c=relaxed/simple;
	bh=pLA1VAdysi3QWT1YzWWAofzAgcdNkyhXQCeIS61SqaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lucCXff/HS01SSA6TtIPTHGi15giZ2eU8GyJj702D2dyZltfdgyy4KgNC2fdR2kloWCLv18D+oG0KiePjs/973ZgEsKCYlXZsD1ujmNndzSh4MYf/qpmAdlCFZX5OiPLw6SDixkTQs4hfx/QU2exvLiGrIa+lJhaE2n/9awXrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKLextV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7lXQo010430
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDpDsEyaq84PXMnMErRjHhaGy20cS9ppfxY27+Hx0NE=; b=lKLextV107Tz1JOp
	ZORVlw2nO3eSBX0HOITuZQn3aJGVemwvy6wVwkWs6i3XrzqKvQr2+WROJEbi0UtP
	n3Gq3LfExCtxW96Y1RBlPFLxi66yAFz8uqyekH5AhNGqoF3vZbyM2a+0N1OCVZai
	5T4tlbR4ql7j9NggQDzD9/b8Y6tXPLj4HICR/8cIPMFoC4KHFymClV/S62mw5/Un
	L2T9E8YE1kT0BSneyU/jFgeXqlBtppe+Y8663hkAfxeeix0lXP5qu0weNfCXImLQ
	cd5VB4PbNowWcLRX33bo8QJufXFSyxdk83Kax4r5qiMuPX9PybjF5rUmAZC4/XaU
	dGUe5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bhpm88rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:36:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216717543b7so18576965ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 01:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625008; x=1738229808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDpDsEyaq84PXMnMErRjHhaGy20cS9ppfxY27+Hx0NE=;
        b=visSJLz9nIDEKBIM6jEJXYS4rLFnMTP37PFeCBx6rq+lzwEyTRmurn9mtRy+VLxPpX
         kX7eP/J/RmFLhYqtyN2r/UUJoojkC9A30yXobI47iFYVer3IoaWXtMzq1G5uTXVMN4mJ
         QyR0m9sLfZA5z5gPI4vjU/cQ8+JolNQHqvispumrOgBo89y4IWdOJpbIE/hlxayjrQNc
         d2pqB0Afo8yWRnbRZr457j+qSKkNTON8H/co+zmwB1YjaBKT5ck7zBO8SeCNp8/ea8dm
         X9DygttoDL7I84TRLNbkK6jELBvuy13BexIGutJuglhjySRakkHvrDOMyppB/AGLu8fQ
         TTEw==
X-Forwarded-Encrypted: i=1; AJvYcCWLuc+14jeVVWrjQUgGOciw/8QEWdFC3e067GppDNX52qiTkcrJxw2PKj4eYQgcH/HMRV7biKCfgHAslVns@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBjQfYXZSVdNgNSat7Q54yZBHKhgvZk6eSSOYcyF4kNYeAMGk
	T/hpwUyDGdUJ3iFFKEF7u0sNPYvm1tg1ryxMsiRhblxJch1AOMREHMddAS/10T/AU/SSJvZm5Dt
	Y4dS2BAiDzl9k0UAr2TC7hKQ1WD1ExXfhMDBWoJlXxbIrFo4FNhDKqPj6XFbRGezH
X-Gm-Gg: ASbGncsxirZeHzEcaBImiDPm4Vp7s8br9Rg5n82xGr9bU7dWpGjpk30MH0hGaMuk1Sv
	FVw+BIyCBfSxLDuxU9geaKzIue7HLkbMnAZIQMa3hYUxDKvGQhoqChixdaBlS9Vj2i8bghVU4Ie
	M2YuHB5rEpFH1qpF0eIPlPERYGWWzpnUZYriC/8YmYahvSO3zVxOkSvptjD7mHxTBoFtyB6oyTm
	ZcZQYvC26ubmxx+/4UENNmQ7jS20rNxcC2fBZyHtnnTgdo0KVJrSeh3o4Ave9O1ruB/MY2dHKaF
	FLAsHAJNAH8=
X-Received: by 2002:a17:903:2341:b0:216:45b9:43ad with SMTP id d9443c01a7336-21c355bf95emr381085725ad.34.1737625007899;
        Thu, 23 Jan 2025 01:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrG+ixy5+z5LdUN/la2h/iEkjxoQA/MQg3UkFsFXd4eWsquZuzJYsVHcv9f4B42mCexMbeXw==
X-Received: by 2002:a17:903:2341:b0:216:45b9:43ad with SMTP id d9443c01a7336-21c355bf95emr381085365ad.34.1737625007536;
        Thu, 23 Jan 2025 01:36:47 -0800 (PST)
Received: from [10.64.68.153] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21d9220f9c9sm23006775ad.59.2025.01.23.01.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 01:36:46 -0800 (PST)
Message-ID: <a89e32d6-a88c-4f08-9d2a-93d9b75f3047@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 17:36:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove cdsp
 compute-cb@10
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
        quic_kartsana@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <cover.1737615222.git.quic_lxu5@quicinc.com>
 <45e0882efe080d882fa083c16c51f613f70e52aa.1737615222.git.quic_lxu5@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <45e0882efe080d882fa083c16c51f613f70e52aa.1737615222.git.quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6nAQLTLakv0D540qRp8B6wK870ox93jb
X-Proofpoint-ORIG-GUID: 6nAQLTLakv0D540qRp8B6wK870ox93jb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=865 lowpriorityscore=0 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230073



On 1/23/2025 5:19 PM, Ling Xu wrote:
> Need to remove the context bank compute-cb@10 because secure cdsp
> uses the s2-only stream.
You need a line below just before your commit message if you are not the 
original author.
From: From Author <from@author.example.org>

> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@kernel.org
> Signed-off-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 0aa27db21f3d..81b2fba94841 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4585,14 +4585,6 @@ compute-cb@9 {
>   						dma-coherent;
>   					};
>   
> -					compute-cb@10 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> -						iommus = <&apps_smmu 0x214a 0x04a0>,
> -							 <&apps_smmu 0x218a 0x0400>;
> -						dma-coherent;
> -					};
> -
>   					compute-cb@11 {
>   						compatible = "qcom,fastrpc-compute-cb";
>   						reg = <11>;


Thanks,
Jie


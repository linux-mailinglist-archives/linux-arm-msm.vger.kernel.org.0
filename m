Return-Path: <linux-arm-msm+bounces-54253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA7A88494
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 16:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0C4190288D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DF528E5FD;
	Mon, 14 Apr 2025 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUZxv8Ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB628E5F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638537; cv=none; b=gFGIlMb20EgQux2rutkwlEv7dLqiPPQFQ54ohLFyF06kQi2y4MWBeVnAcpeY7HRGf6UsE/YiEyLgWFkK5b8H3en7Q8ncDLevzicxUyx8AEFqEt+1PqYiq+r3sqxOAF5PcyHu2mT4JRuj1eKQmT3POMl5zVFn9gNnPgH0hHy/LLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638537; c=relaxed/simple;
	bh=np9hmuuv/xFfm2pC735FXo2uI8JBzBXFBa4WLOBK+kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDORR0iu7vvF+Jotigzmrf+BBnT78zEu+TpvFfVFhnBcP0kFuyvsi+ElJJqgygisiH9byGY52TkpV0I4WWwLXw467BoPV4i8fC2OjR2XuxHh5AHRLA33ufU56wNghzr7q2LLeH+ZjIihxpnhqkSZU7RYkyCt9jBC59Eu7RvCG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUZxv8Ki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qOs001760
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=; b=cUZxv8KiEnifrGyg
	NPkbNKmnHQrRHd/LGWOuhOoRpWONaljJkArdhzfyUj2kGWz6bIni3rJTE3ov6OXU
	AqFu2ouknX4VOljQHsMZGnwPhkDskIzY7nssZhRwaAdLnokCgcF7Ccp9THO1sE/D
	dmtD5iyiD0rTAUdbjIKxDUbENI2SAjwkniQ1bYChm/oi7FYC4O35+4xL4Oulp5sB
	K9JrHUpHwh0zpmnuxgthNYhywKyJ3z+LctE4vPcGJ2xfZRktgPPqLLpCazkoyMul
	ZYuXQ4wfbHpfROADIIfb1O1jU1YiZ8Em5VhLhK2F6Vfw5pd0VP4B12iWchtclZcv
	w+KCgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq4xx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:48:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54be4b03aso86995485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 06:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638534; x=1745243334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=;
        b=KjVe9Z9uf2kdXKk9NvHmB1BRWMn6BmRpdnnkYUcLriQ12EJOTk5vLGUoN57O6d/W89
         gh+8QpVW01s0bnGuwLDx23ZBfgpy3ikJtk2qUScl+hhHPrmIiAikc9VnPYhiDd0VUx/a
         qhdJCPdWMoei4iWvn26WPkr2XPS8U/YT/zqY4ayntQvabjToQtaRvwTKzr3F7FKeAhJA
         kcOPbH9su+LEBRnrkInxN1P0AgMq98tRF6BdALE9rGPh8O4PiPAvMFPU2OBuYUuo7MWS
         kDP6GCiZxbkgZ2AZBvSVJfk69bohMse/rRgt9YGZGxbX3uICR23lJV2W0fIgHcxX3os5
         yLGw==
X-Forwarded-Encrypted: i=1; AJvYcCXTMO5lIP6WG8HxZnMaFb257EmR7+ppSB1dzwnBihcPhAGJM4z4eb/L9Kns48balT7orzqDQcv6Oqc4mBfi@vger.kernel.org
X-Gm-Message-State: AOJu0YyzI3PgZxq/xCWRyGGvktFLXwTHhEXn3wOra4zCrM0CNJtU/m8s
	NikpfMLV0WXOoidGRionpw6eBETE35Rua2UIPkf21IHc4I0ZFtjkY1JKU9GP0uZUabaBmzd4UwY
	4ZHHNVF52BOICzayhvJ/+gWLyCPb0Cr/E6sBhUGeONYSEoDLaIbI5AgbXPXpaDRp1
X-Gm-Gg: ASbGncuqo7vNiSQUH03pAq0t2Y250ido05WNw1GFpV5nbNx1YRDbObS/PqB69vmPC14
	m3peMsEX8Iqensy4DDQGEI8zw57swIyVf0v1Ln3nDQpK9SNu9/DdbtF7H8aNsiW1Vy7LmT59WRM
	7R8i9/h2fKFN43EQ4elmKoVFA7KGBXsIaI+8e+RG0qg9To7aVhBv1VgmDlJtR1GmKOaDk2DwYEm
	haXfx0IFbyhs9xmgQcxGZ4bIkLcJuWd4+Vw0IRRAdht2T8dv8kf6mn99eHJ5eFFSvDDI/XwqMdI
	l5DJHJFyhOYP0y0CSDf5Dfgp6VtEVEMKAKlufZ3Z2Oxd4zGSOztn6yw7zlYq8yr9UA==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547103085a.15.1744638533654;
        Mon, 14 Apr 2025 06:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4O+qSr5lYuI0xXci8UwClLylPYXi2as5JPMMjmn1VLvTa5A/AYniUqnKC46HZ2UH6QSe5w==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547100885a.15.1744638532970;
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c02227sm905491966b.81.2025.04.14.06.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Message-ID: <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:48:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Wqrs0y9ukrvAS-CZ-3O1JXCeA7QBcJr
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fd1246 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iMC0Jze56uYpCOfz6HIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6Wqrs0y9ukrvAS-CZ-3O1JXCeA7QBcJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=773
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140100

On 2/10/25 4:56 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,

760> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,

759

> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,

762

> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,

761

Konrad


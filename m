Return-Path: <linux-arm-msm+bounces-81005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277DC4677D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52F961883BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA6130ACFB;
	Mon, 10 Nov 2025 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6Hx6yxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXoj39u0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950C2FE585
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776293; cv=none; b=VdbdFUbSlQD6ORv+HWK8KtaWyI9zI79EgzDaUH7nUMzENubihQg61MHeYUavZFMk6w/E3BjoqmawPVu4tkh8ak8XMkxW0yGIOo6Oge/nvCy2NHzRYD9dFYXj2SXJfldWCCiSyHXuXttH3j4p1ThO+EjXjjp084J3uYhiKEVG6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776293; c=relaxed/simple;
	bh=cOexLxwVZ+7RbJqpXHMGiW7UdplvSqF86AoVD2IzWmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rprMXFN1wl0/sD+hJzHbi6MyiMfNXJm4UIpzNFIAqrUpXv5jgDRXdUdNB/c2ifafBLplaC1tTX50yMPJEo/Kh0hGCc8GgWjqASS3datlmplu9klBw5jipGgtsGs+GhzW8in7lvwt3Gr+6gdAWWd0X1DRI2BAFEy6og27Q/YUrAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6Hx6yxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXoj39u0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8289O1410082
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAMlSP1cES968wwO9rlfMbzdj2xWrLcU9q2FW6trd6I=; b=d6Hx6yxa60IwSD0d
	RH28GrzDrKbhwrb8wZ0rihWmrZoldrXU1Y0mIJcC22Oo/17Z3w9TMLawCmn1lLlR
	L0CwwJAW5Oi4UskmEZgZ1CBhpz2F+upHpEGGw0yo7bHyPU9zIhK1wBxom14k5UOV
	cmTG8otm9uY115nKigNPMyvC0GanGB0jHr5RoJDfQXHRzqu+EtVgbIpP7wobv9Ts
	lsmeDYTYO9M7maPPfrWwtRzUxj6LBD4lJrR8D6d2LZB7mgsojudiGmtiw0BTjwoE
	tRgkxh/1yMEXO7TmWqhotr6O4tLJEj3W9Bi0f5FOcxi4GxaP2F7uzhrPwOm9RzCC
	6dhgbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0jg1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:04:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso8098011cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762776290; x=1763381090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAMlSP1cES968wwO9rlfMbzdj2xWrLcU9q2FW6trd6I=;
        b=XXoj39u01KvSfnFr+bZgGSYLzqWN0Y3lzc/RTNOWsRCaneBClTASXTXGWJardQ+7DU
         PodX9CaS964MOpqWmFGvvxqJtr41TLXo1Rk7FDEKNpCY/YRmdssXH8faYcMspGxnhO7/
         Tja1uB33m6Qv7dy9awLlDwmenruLLlPWGX9p29JSAi2rYjpvBiwq/cT0+zoGsJNwH7jb
         COfktdJb7N1MnRdnH2ZGzSc4+npgCADgUJJQdJqDKtkOe2bNOz9YR37HGpK6SeCPU6WW
         hJBzE/LpdH/9V6amV7DrsUtjKFYgQvgcPSxMAtdrKSqyrLb6bWN47E9XVnSkjJO8PmqR
         oU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776290; x=1763381090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAMlSP1cES968wwO9rlfMbzdj2xWrLcU9q2FW6trd6I=;
        b=R1F6vww0Yf4Wrmavwls4qCuaJIO7gYPaA06f80mSvZDhdaK9CiDUv79uE65QXL1zHP
         5kCOX4bAp9ny1oRmcPZu3PRTVhMBiT3bQInBErOrCpUM+3QnQ2id1hISOw4mF4NkzFkQ
         nC7UwCqIjbRHdZw0atSZ2rYXfP6LnQINXDCTt8Kw0dPP7IRcyG1ioIOxebybAsVEkzca
         lSfwYKih5aK21n+ly24r5RLKtUgiGVuD4MnUANURpkVbjTGtYQtuAICQGDqDBqZDxEg+
         SV6EZDwAFzwhWcd01qIVv5jz9KlOc/WrDBAew8VjKtqanW94TFKTeZqOmbCD9VAfEWSB
         qVnA==
X-Gm-Message-State: AOJu0YwWT7GsrzGyvNLbm2bQ6Ze0cu85TPgsDYXnyxXoNuGSy6tj1P94
	IlXbZS8E1unQcmnii8UBXotocKZkDcgl0+zvtYe4whXoRAICa7kPX/27nSHRnBff7oii96jSpoA
	ad8Xwmx84FIIHoKp0dylrmCvu+j+Cptyg/+Ic+h8x6zqmdOHR/AOjLIH3+bkHF/FgrdN6
X-Gm-Gg: ASbGncuGZ4UJ1Iw2oXUCtgN3yEQmw9qFVnYuUTgBDQzp3ET0wIrYDeNLZ/c1mlCpYvG
	lGN1UdC3NUq/WWq8aL2hXTmZIYROWNnq5MpZc2EmuO3/wVIJqhuzwGhRLV9Od2fcKNRCi0UYAWZ
	RdgLuE1kpwaZz/hzkTD3DdDrKs1078NJmJPVDEwJGMerlmdnGyDxSxlqVB8+7XHLO41Tkcmfo8Y
	MvaeULlF18XldFkJrBNJ4JKyq/gzMdSd8Z9M05mWXSTPkQd8MV7ICSQHvWnj8jHZfKkjn8X5x8T
	Ki9oqFnKN1LRguk2uFxi02Ql8wByj1SggwwfFK71c8QvzILiug9i8x1ZFv0SZzoXTGLB3y0SWsN
	LDu+ALhFG1LnCM9ajQGogyAJytsUWKe8QusYNQIbcoB2WGQ8+5Frwwpv7
X-Received: by 2002:a05:622a:3cb:b0:4e8:a001:226d with SMTP id d75a77b69052e-4edc6055c83mr3412231cf.7.1762776290206;
        Mon, 10 Nov 2025 04:04:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzDbbLjdzMiLA+y68+aSiGVjpIJDyiwSr5crhClqs7TwZ7jR7Ff37L74FLOF28viWzc1ZsFg==
X-Received: by 2002:a05:622a:3cb:b0:4e8:a001:226d with SMTP id d75a77b69052e-4edc6055c83mr3411801cf.7.1762776289668;
        Mon, 10 Nov 2025 04:04:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf4fbf3csm1069581766b.26.2025.11.10.04.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:04:49 -0800 (PST)
Message-ID: <454ad8d6-43c9-4819-b849-c123fa9d33bd@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 13:04:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] add vdda-aux regulator support for QMP PHY on QCS6490
To: Amit Singh <quic_amitsi@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        lumag@kernel.org, neil.armstrong@linaro.org, quic_wcheng@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AeqjL8LCXV0g4xhOQDJAzicElnMxszW6
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=6911d4e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yJhrbEhF6J9Oi74tKswA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AeqjL8LCXV0g4xhOQDJAzicElnMxszW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwNCBTYWx0ZWRfXzj9PBU9cMmsK
 vfpnIXkSAj0FMZeYXWWRmTyh6k6my1TgS5/e614He8MOBBIyg4w5hTLJsqfk/MPVYVwVKjBYq/I
 Kxpz58a8oHCg2a+h8f25T9DCDQ7/mYv3FTifDBqtzWLUtAFkaCPOD/f8DgTDlJoaT9A9Mt0wFI5
 l4fV8n/UGJ70E6I2zRVuhoKRSPw0pcnImmwOzzHCtiLh++fO3EwVxehGPntzOaLMJVFeIjm1RLu
 tytMiAU+v1D9A2BL8SpKLIc5W9im8VwaSgbMwcN1xmmp4YsAPpm6c6inAoCJf+KM/klTMIEJpuX
 ZyWhNORphfRaGXIJlpSiXd3wr7DZvWDnobG85silQ3gpHbg4FYHAp6AnEMOH4bzTm/lBFRwlFJw
 w1I9aGbu+KDXBdBoIDyHTAkAxcI2sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100104

On 11/10/25 12:58 PM, Amit Singh wrote:
> The `vdda-aux` supply is necessary for proper power sequencing and reliable
> USB enumeration on platforms that provide this rail.
> 
> This series adds support for the `vdda-aux` regulator to the QMP PHY driver
> and updates the QCS6490 RB3 Gen2 device tree to provide the required
> auxiliary 3.0 V rail for stable USB PHY operation.
> Platforms that do not define `vdda-aux` remain unaffected.
> 
> Tested on RB3 Gen2 (QCS6490) platform to ensure proper USB enumeration and
> PHY stability.

I don't see this vreg going to the SoC on the schematics.

What is it actually powering?

Konrad


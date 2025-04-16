Return-Path: <linux-arm-msm+bounces-54522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B9A906E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 16:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73A7C3AF742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716DB1DDC1A;
	Wed, 16 Apr 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dz4zqy/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079211AE005
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814927; cv=none; b=gwKXZym4KpEiwBGDy6zmzdOYzJ2eAYd/HFMjPuwJE+Lto3brKaZtKnZioFefYZHthmT0WdIHc0NV64hPpzLxSfad9B3WhUblA3EyucQDCz4MRHNuwVxPyVf0ouFvUhqsleg47EGRdv1lh9RGhaL/T02Kf0UEouyaEN223PwZgs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814927; c=relaxed/simple;
	bh=8dD7WL72ycDqS6z1+llLytPSkxmuuALcpWy2/T2M4hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIzVoCj4bmpdbqYYZwhDqWRnZCUuDkyjqW/2V4h9RmYNu3vvDZUwTcyBwu/CnYYB9Tge+DgYeBC7agtEOmWG8xpt+SBMYrIILzitDtmZvi+oNa7FsMjjyhtmNr6Ao8Tdn/BfpJQSklF4seQV0RVbqAfIcm2HjLoEwDt6QzqBoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dz4zqy/e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mIg5029927
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLHNH1mEBAuKA0SDkBK96nq30a4xdSQwQXtN2iXj0S0=; b=Dz4zqy/eUzKgbOzr
	SJR4mX2My75TcJvEuuC/cgiub5b6wgbXjvzlXEeHBfHqfqrbGPVxcUuINRdlm5h2
	nhuPaiqodzAP7S/Bq07lh7H4I8eDvGzi0dWMXUnv1M+7Can7/DAKuHglpHNJRTmF
	df+dH2DPdTG3vqXJRoy5XvYODCAf6jXBa2DerXsfUkXtiULwIM3idBi1yuWe3G7M
	Vt8e9U88C27eAisD+4W8r02aNZILkMgHLUhQL6+ud9t9CyfwNqaMtCscyoDuAgcb
	0LXwZp/UPmNCvz3Y0xz8zimgHY2XMNrpcWZ019H3xBbXRYxWMFWpossb/odvPP8m
	C9A9Gw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk3ry1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:48:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so21218976d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 07:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814924; x=1745419724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLHNH1mEBAuKA0SDkBK96nq30a4xdSQwQXtN2iXj0S0=;
        b=e9Y4car+yGL+lW38+0S0ARw+PPZLftStGSaX1rOy/mf2wUclNMVv13M1L84HiB8NLx
         +6OiAdPioG0DvMJmXOpa5NjAlP9ZLZxk9PT82XVP+X5fywvlmXLgpKwmQqFeVLBZUHS8
         m0LbFKXahj49DR0RTuoI3KBYDJ2xyEc+hJR+G3VyLDsPU2k6fkRFJNzjjhE7T0ovCsI3
         2URK4Lfor5pIaFrH2D+Ct1Dx0+Ii45lifEMvIG7buXCIZ8BRXroFZ29E+Xty8LSKSyof
         mTjWJWWQqDqVOLdZr0r4AOYaw33oWJ2G9EZ4NDXpN+pxmsHtm5XP+uaSwZTAU1Hbi7rS
         tq4A==
X-Forwarded-Encrypted: i=1; AJvYcCXPX6TIK+s0tzKbRlFcbdy+3F2B3vI6FGR4DPmkDwDbft3JH+A1LimHcHcUnZJAniB+ti7GojR0TWP8W0iE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XbSj4gjCCox0oNCthR+TG1LPwpg/HY19j+FTXbYPAgVc4gMM
	G6SRnNCh1vlbTNN4k1uUeAzbOAeNz7tbqPn/6feVdL3tKr6pLKNNAE9mLbXfs9jr285Y59wvMcQ
	jyk0E7uIq/BKmn9I4MPLZ9DBnMRVier71VnaOnBv8laG6fKXT+uyaEC8mOGJR12l9
X-Gm-Gg: ASbGnctVPRQ3XveDDlLCYkAF7yWy6MMBbaaP/PBLjGhfUKanYGhK9gz7OhN8wJEfA3g
	FDx/EvDkv3upjG1D18ywOSj9mfDmiR26lVz2NC/qB06FaWraqZVHBQfJY3bkqs9xAVq1KC8GNlO
	zYLFSJvKrr7nScDt/sw+ICbCZ9WyWvXumVyewJwWAr8xK6+INzvZxRAKUUYTdIuFj3a8OD/XtRI
	rXkPEqUxUoa6AnEWBKL4+fTfTkZSjcUKdEKvbi4yUmRaUNg9owrBIV+oZnqbgRuCTXpbwg+Wisl
	HxVpCOkDKT5XrX7hy2kCz7pLKFZqGRWQfU5mWVKlToYKnZiksp7vaJSS2hetO6lW9PI=
X-Received: by 2002:a05:6214:76a:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f2b2f1dfedmr10440786d6.2.1744814923804;
        Wed, 16 Apr 2025 07:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+eTe1g/KqvUYGtgkcxP7uScjinYQjCvuOHrRH8bUDe9HEr3/n2mZNqp4yvxrKn2SbcNr9ow==
X-Received: by 2002:a05:6214:76a:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f2b2f1dfedmr10440546d6.2.1744814923336;
        Wed, 16 Apr 2025 07:48:43 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdd5ac7sm138213566b.48.2025.04.16.07.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:48:42 -0700 (PDT)
Message-ID: <4b784194-d5e0-496e-a676-e76d7ddc0d6f@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250416122538.2953658-1-quic_mmanikan@quicinc.com>
 <20250416122538.2953658-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416122538.2953658-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67ffc34d cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1aPbRelaT9uNhyfCM7QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NLuXuDCCKYSEM6NMN1taOz3y3LqLKkyQ
X-Proofpoint-ORIG-GUID: NLuXuDCCKYSEM6NMN1taOz3y3LqLKkyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=698 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160121

On 4/16/25 2:25 PM, Manikanta Mylavarapu wrote:
> Enable the PCIe controller and PHY nodes corresponding to RDP466.
> The IPQ5424 RDP466 does not have a wake gpio because it does not
> support low power mode. It only supports a perst gpio.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


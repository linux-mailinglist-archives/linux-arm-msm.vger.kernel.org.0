Return-Path: <linux-arm-msm+bounces-40619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC79E5FFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 22:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3B89282111
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 21:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E2F2309AB;
	Thu,  5 Dec 2024 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeoazlrO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE66F22F3BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733433569; cv=none; b=mNBOH+DIaMlD1kGXztjBZA3imQornfPseCMLLtzdgR/n8Xd2FalON6gbhfMG6cQYW3mEHObYF7i2Enq6R27zLz4sqfZzhrI7+oC3HTAbT7YjTIcOwE4409HoHGa9QXA0XA5GZu7vTTdLtX1uW/UZNnvgc4qyf2IELH+HpsQ4FZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733433569; c=relaxed/simple;
	bh=aJapw3WyYccafxnKr7q4m6K3gYLXIYlv3ohQbrLcTFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+ubyshqH6+ehwRwTRef4fTFZkeBT7vlm5gkuoqjf+BqbIT7cxhgxjCOSDQMc8EdvHY1wlZag8mCLdItVgApuuHXlsIH5/pOG4e76lszDD4al451Tx1hbcJvS8YKF0ghRXgXTO1Z+oK89GbEfC5HlJHElPnPf56vmBlTDtq3Leg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeoazlrO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HapdA007706
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 21:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQfISVsXdxQW6JtVPLqLwHHCBEV9bwyCTS/zkVZgSsM=; b=GeoazlrO4tScntBa
	G8use33MVnlzfjS5aGV4MK+/4QRhple/OlwsiY32Ryv99Wht6jE4xZmHIXJ3zSJN
	NqkeYTN9hGJddbtZRVQCOGzblSmxnBYrTVEeLJI50YHmMCoyMQHWHET4AcjztPd8
	ed3EvpNTTGTgEupqIddYn9bg6gxybXALNef2Q70+l7zf8uJaM5YKPoGRs6cpVgfR
	iGgCA9IM/AhGy89xoppugpISpXoXmzqmo2lQGTkeOvABOKTuwF86yeidCTjU/BRX
	B5oGPaB/Cej1O5aG8LTbWnKQ1LyqhfywhdPP7fybEiFpwbnFY3f1QDQY8vMdnlZt
	vlBKag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben88wft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 21:19:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46692fb862bso2862271cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 13:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733433565; x=1734038365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQfISVsXdxQW6JtVPLqLwHHCBEV9bwyCTS/zkVZgSsM=;
        b=AZmiuvAMWdC1xQX61Y0dlWhDlZXdlpEvxWkAoSSjWkOQ3/4x3dSfBcxvsgIKIf4Hrw
         ThmIBTbWZT5bRErVXXzVAZnKXNfaEUAv4+xcxlj6eYOphH4CauEWnuQxj17eLRBSBXAH
         mUVPQX2Jq0jggBu3Ypt92gl/1O37fxeNjrofmsWC77ZTwe0/KeYATE2/oKlOXNnflb6h
         VEhPErbCoMqIi4dpr2yD5bqKDU0Wd7Q8RB8wYQqqVAEKfvJfHuAGbvIv/YG87Qw9zquX
         lm1OkKiljsgwEMmYhByZ4EFEjROzSPpr5f4D86Rw4eeP8wEu/bE0dgxDeYDHFzTxN7ak
         awOg==
X-Gm-Message-State: AOJu0Yz3YASV/q+x8BiVeamYvJxv6TyEv1jLAYI03jedJX1Vu9HSJIOl
	fv5H8JA0DH7BO8o0Hhbce3bQUuTx7CJfKYS1fWSa9lC6Z/iFLJlU8dHgueq4XPNVKIIU3bct0G7
	NAGs1RRJl/dOth6pBR0cm+5tq+J91ws38VVv2VJxU1CBQIXePtHoFv7ZFw+RtjoLj
X-Gm-Gg: ASbGncuzcylTzXVTOtQzrkKa2ZO3XV7wUGguo1OaggDbZg1sgXKK1ib7lP3xzySP8U6
	HbeY2MOM5wl4ISiowp7nuNjec0VbccTC1vRbdA7XzXbcJSqjYac/mtPqSDs6EizQJiGl0kvgkpI
	MJTnOOrPrOAh9+UuKrlQzK5GIv2vIvDKUSKtoWMRIEbTyCOkwJkBbQm2XPimIVxUe4/SfsmPjH+
	tfpJb248x33JrGk1OWDQWI2H/fUCfHky7h0OKumZ5ZIqj1y9jWyiaXuvgz5MhLrECugyxZkYX9Y
	1zBo+vLn9AiiEUJw2Diiq8MIha5pZqM=
X-Received: by 2002:a05:622a:178e:b0:466:8c48:7232 with SMTP id d75a77b69052e-46734c8eddcmr4700661cf.1.1733433565459;
        Thu, 05 Dec 2024 13:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAzTu5V9J+dNt0Zva5G7WWSe0sMoz64KA05UqDj/rEMMvGL2xQ+bWsjaqu65qlF8wRjNcpNw==
X-Received: by 2002:a05:622a:178e:b0:466:8c48:7232 with SMTP id d75a77b69052e-46734c8eddcmr4700241cf.1.1733433564563;
        Thu, 05 Dec 2024 13:19:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a48ab4sm1263345a12.27.2024.12.05.13.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:19:24 -0800 (PST)
Message-ID: <d2f0b021-7b0c-4bd6-aad9-2619a91abdec@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 22:19:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>,
        xlazom00@gmail.com
References: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
 <20241202-jg-blackrock-for-upstream-v9-3-385bb46ca122@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241202-jg-blackrock-for-upstream-v9-3-385bb46ca122@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -ksR3zHIjam9o2Kgwt8ySfzAoACkycV-
X-Proofpoint-GUID: -ksR3zHIjam9o2Kgwt8ySfzAoACkycV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=808 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050158

On 2.12.2024 8:59 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <linux-arm-msm+bounces-67995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B81B1D6B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093CA727A09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 11:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65FE2798E3;
	Thu,  7 Aug 2025 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLAGSglU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490742797A5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754566242; cv=none; b=WINCKOKUPuTaGYlLma7+B/Kzbyweomqaf8RpPKZZ7n1oDl6KO/LhZJqI0SlcbTkvRXpJZ5y0ep7XjNKbFB4HjMum21jPTolgOk1Hwh2tT8y8T04F60Uc2Ly4rsCs3iwIwtzofadGImidTTt9CT6Ys7woAWy0pF4lTQ0YfksEtYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754566242; c=relaxed/simple;
	bh=1ll+EBd5lYDpGgeKjrKYbgl28Q2HDI13rIt9slkcFLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJrEOPbkPZ5rPFS/rR6bT9R44TKl3gkldf1cFb1VNG5biaWYGSKyEH9lC1RVS4P4ovTFB6jwyvN9SlPlddxhAGIaj17xjIH2O4WxOjh2B1emwlLks1244uUlu8/H6z+A5NX0uMS8IVrbEA0KYRjq4imDLkTu5HRgLPj7v7518cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLAGSglU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D6BJ008394
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 11:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i07QIqXhNjjKtS5Fw1YccCoO4yzv0J/LSujugm/+4jM=; b=HLAGSglUTlZq93XQ
	yRncmEvWj4OIWX3Kjh3HFEb7vVO2YPECaOipD6GBFb6T7UX3hQDO+tG9MT+u/xOz
	U3W/N7seJ7UWrDTs0IF6xRJ+Fj/PBZzc7s74ziAyVAxOG7D6ahQed2wpy0Xod5nD
	byhEfOcrYmR9Rb8lsSESbVmZYz0gDcj9Hdl3Bx0hq24D5/Tt3YWIfFhy1Zoffd9k
	fpBPmV5hbxE3/jWeslSuyqPuuUiPwF0EbJmeaQlbCgrwSGYWpcIHBdbyAifhbI2u
	SdB+C6Ez2WUaITridhA08Wq6/fUF1Zat0uibHCvRdDiSN0htsYSfV3Qcur1Fa4Yh
	RPeMUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u233un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 11:30:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e800094c82so27666885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 04:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754566238; x=1755171038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i07QIqXhNjjKtS5Fw1YccCoO4yzv0J/LSujugm/+4jM=;
        b=LvNJWrS6OzX0BGZOYL770wTiCyn3k8DLZE6IOVrnA4nt+fmo5Mx7eoUn+7p90uxlzs
         EzOu+nd6rW2PPxnhuJibH9IfikCQxntcQxN+MyL2477hE5R+7MelqIDGek1I3XLvhkmy
         P7baJHyHbbKCofZXCt4WwzKFuTpLwwh+gdBOOBPjwPoZceO7/r5pq6AoXlmdQeTL5AJg
         9TtSp1NkNRXS0yuSbEBBvcAzQ56WRlZrDOqy5+MqYA4/JOtE3Vi4m+pgFjEGU/+c6qSI
         YMH167oOwBTYJSi2+JwSKDm+6mBipKwoqHzlcGCX44tPTyz2/LPn0FV5LLriaB/tUs5U
         VCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4Q4C7eP36A8oh9MSFkn7xHkTQ2tipVJOORl7ltqZFzJnNgQ6gKAhIo+Q/IzKDsfaTw7ka2Qt2C6LsLHV@vger.kernel.org
X-Gm-Message-State: AOJu0YyhaA2/R2ovICcHneSO35BL1tZTL5+ynqzQSLF/iVCHU/gVmaMv
	Zn/f+EudTErlrSDtqTH6I3RL0KApJeFFU1+mrokA5wL5PltSrklaylEe1NOx38N0zosHSYc48OJ
	1meewMw+LHKQqtjM2uJnukKQ9kY/viKmeIDZHGuQ7UB6dIeuRC4/hOwUtaTmjZ7pgReU6
X-Gm-Gg: ASbGncuJqApayeLpak9MuGf9DcO+eGzVA8NZiDFGuitrDlBTuyqHV0b/svp3/QT8ri6
	d5lBo5A5hZifjUxMZ6pFODS5740VdTsCVFjNA3e7vfMbOHDdO/g0UUT4/YF2UeATKoKfqqsIvBr
	3dzqIEQT+nsDcKAjtcCoitmSqAc5ic3BOVC9OR3cww0N3S45TVU65PwgD2ldF+Lr30sTrU32kTM
	Jc6PNnFeXeyoe42f8YYoaxssHckE3vL83ecD6TsRTpObmaDjIsTiHtvR/i82p1PboXRfwWzDTaJ
	e/LyDxjYbJhs+S01hGtdwJjcEY0vsSVwDFjMftz+VGx4T+9UBXZ5o3Wg8zNfuVF6pNNGXGoqFf1
	Dh+DyclOt6B5KJCnz3w==
X-Received: by 2002:a05:6214:1c81:b0:709:8842:56f5 with SMTP id 6a1803df08f44-70988425dfbmr20817666d6.3.1754566237857;
        Thu, 07 Aug 2025 04:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnXnONHbLA12/95Kl68dFu09ciwfUyG+iTcQrE/PkzMq5QqD4Es4erSTnNv0lGdP5+u6x8zQ==
X-Received: by 2002:a05:6214:1c81:b0:709:8842:56f5 with SMTP id 6a1803df08f44-70988425dfbmr20817256d6.3.1754566237129;
        Thu, 07 Aug 2025 04:30:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f16062sm11590909a12.18.2025.08.07.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:30:36 -0700 (PDT)
Message-ID: <4d2140ee-f757-425c-8014-3909873e7de3@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: spi-qpic-snand: fix calculating of ECC OOB
 regions' properties
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UXk0j-GRsyvF5ejive8dwizy-iqd31a6
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68948e5f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Al3NFTvqZ0TCkL53jQIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UXk0j-GRsyvF5ejive8dwizy-iqd31a6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX+/Q8XHJX5aGu
 svGHO4Z7Trlc/4lJLoaml/j+j+C/YDNf5ORXS+8EsiZx2K1CkU7taRdi3iqtb6OzBFm0K+t4rPs
 mYASoNdkE5r8G4LWZmEMk8r36aC+zw8xiIPaP7CKUc1mge3yuuHiKttf2/TOqu+aDQIMdtzheai
 GSVX4lK6iNOuY5oJDL59N1JwWRcEnHloU5YacN8oVhDgayyGY3Sq/xoIjO4tOV3873NzmybuSmu
 m+NCXnpHAcyAdMkL3pMxHwOOhnTw8DYbBL4XG+Gf5BZvWFdBbNXosj1m4QpnKPSO3V5kZ2AZUSr
 sgCQrxKsEyoqRp7OblD3Pj/RN4Gsd06PFcKppGh4wxxNZKAEd97AMfJdpNCyiUtKjEe4Zn+AgB+
 w4D38RNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

On 8/5/25 6:05 PM, Gabor Juhos wrote:
> The OOB layout used by the driver has two distinct regions which contains
> hardware specific ECC data, yet the qcom_spi_ooblayout_ecc() function sets
> the same offset and length values for both regions which is clearly wrong.
> 
> Change the code to calculate the correct values for both regions.
> 
> For reference, the following table shows the computed offset and length
> values for various OOB size/ECC strength configurations:
> 
>                               +-----------------+-----------------+
>                               |before the change| after the change|
>   +-------+----------+--------+--------+--------+--------+--------+
>   |  OOB  |   ECC    | region | region | region | region | region |
>   |  size | strength | index  | offset | length | offset | length |
>   +-------+----------+--------+--------+--------+--------+--------+
>   |  128  |     8    |    0   |   113  |   15   |    0   |   49   |
>   |       |          |    1   |   113  |   15   |   65   |   63   |
>   +-------+----------+--------+--------+--------+--------+--------+
>   |  128  |     4    |    0   |   117  |   11   |    0   |   37   |
>   |       |          |    1   |   117  |   11   |   53   |   75   |
>   +-------+----------+--------+--------+--------+--------+--------+
>   |   64  |     4    |    0   |    53  |   11   |    0   |   37   |
>   |       |          |    1   |    53  |   11   |   53   |   11   |
>   +-------+----------+--------+--------+--------+--------+--------+
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


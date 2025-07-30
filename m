Return-Path: <linux-arm-msm+bounces-67150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB3B160C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7DB1AA1041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BDE2980A6;
	Wed, 30 Jul 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n88pAn9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2729617F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880118; cv=none; b=QkKxlkNpPYIa/IHFjF4TBLb+D9wpSwXvIt/3fbVH/yk2WRw/oaR4XTNLFYuCzkqVuMEPKvV7/U6BPRGfcYsLvWo0KtbNq5ASHNR7et4d4UU18mNVSKnY0tzP/7QDbzG4mC/QNK1/WobhYH92CDG0YwbcnUaJR6ODMHtSG4yvMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880118; c=relaxed/simple;
	bh=IcwJxjGaUBs19PI+lV/YEtHO4tM8mpf5SsPGKdXjFsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VG8ej9wJThB5qDmKmOs+bipu6BupqJ99Vp24mCzofc4XVTZtkPfWsLofweeqXL2UKW43IkvJkTrxFvpXSqhqjC+RbAHE73v73y4nytvK9jb97CXS86RxiLKfYXmN3m+f3K0Meeep94FcTehy28mnFEt8H4aGk+ABhQ3as60BcJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n88pAn9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbYFY024996
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iisB83FXZI4F5QXhoqp7ipsU6/LoD+KKvHx3mOfRmCA=; b=n88pAn9AFVyF+/AO
	CAxtSYZSKMdeJcLofbK5pr6fSTiWeaqdc124dFcpO+QnUzyTrMYd52Y6nO6uMLWs
	gZ2PUzW7iywdrJhJMBDj0z91kJO1UJY6L5HJd9Wl/4KF1DxLJahGA+d7dwWyRJ27
	gjQKYncf9dGYv+bwW0MH/jGQxcXy+x+uZJzQobpcusZIKYzAavoFam56tOLI9AKQ
	7acLZJPOCtwx9QX7Qy1S1867bc8bUf6sAN7u5zrhi+KushZ1+G/UtkhIiiLnUp5P
	v6KfFwRdrjmBunj3SBQRR7yWjROIVQKlUdDElkwsEag0W5Iq2yzZhvYdY7UNP8Hn
	zyiq7A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qusrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:55:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fafb22f5daso6309326d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880115; x=1754484915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iisB83FXZI4F5QXhoqp7ipsU6/LoD+KKvHx3mOfRmCA=;
        b=R2oCHTt/rqtU2NwmU5mGfO28s0RbOmSxqT9ffZB5PFRgbatgT2QED/KzBLOSUIjQVb
         seLshHP6hk+AvNOBprK9hWuqgyVTUMHNNricCc/+eJ3kCIftC+39rkCZfTXwtv+Art89
         bMiorT5SFYm/h8juP9yzR5kGvlySW3HNWrKigfJX0Iuy5vDPW1nUp/MxqMSRgt01D+F1
         YrW6yJTD2yi2X/PYBzZ8THiB2MWFLHfZ2T4Z7OpT6N85vxBVEIoW+VVeYLNHsLd6m3XS
         l0Qsoe257mb/QKMK/Q+0d2b+zSiamkiqCSL4vyJJwJApe8qukTgkLovHVbiVbX9e5IQe
         WGpA==
X-Gm-Message-State: AOJu0YwcIBfSehVZGIn3V0yqk8AxLs6iI1bDJpjjUxLyTBZo2m5ubwAi
	OHs32RgXUReQCO9QU6Xf/3JsVOXWQORxRJ+N8qGoPQTu9QYgSL5o1FgEhaTt0AmTxJPpFUZxcBK
	lWJaKLXH+Du+VlPL/OjLBFYwVoZC3ptXIvGgjJ9hOlYyyhGZ+ztFmi4y/5/NyqIRYzzDG
X-Gm-Gg: ASbGncuScMwT1EX0VD4LrTGdvDPQ/oEsQywE0Kok/BYG743JJcBISIhuNaBjB8YUYhf
	rlX2VAgTEDE3fTWM870k/Jo0wRoWDd4ei+lwuqdTpwoMohcKXkRJ1Y8zAnddcUW0PxowvieeeKp
	2sekfPnsXIkh/dzsWlNPKTe9piUCMGAfoffnQ2j24MFrttbNaNzx1mPUPa0Ct4tKUrmx262gM4J
	9xsUdWgItn0Q14xcpZap4MMlUOkiHSNig5fonYKTLvGkzbDQ3EV1UKug6os9hsNtt82MGxmrsnd
	GD/GNKvF9S1u5UOPxmjQpO0kddEjv5vYQGLd+hoxJS3weE/sH6SJZBnKi1udeGnJxdCJlPl1WlT
	RdNE743fTiHuFmUT5rg==
X-Received: by 2002:a05:620a:7017:b0:7df:d668:22ff with SMTP id af79cd13be357-7e66ef8c17bmr195813085a.4.1753880114709;
        Wed, 30 Jul 2025 05:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoyY3D0wsO5SLEh90EjUNCQ22vc89hWUifUn//akyEBL9q7sBkSC+N4U7QQomA6VAv1Ej6iw==
X-Received: by 2002:a05:620a:7017:b0:7df:d668:22ff with SMTP id af79cd13be357-7e66ef8c17bmr195811685a.4.1753880114339;
        Wed, 30 Jul 2025 05:55:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a183csm744196666b.50.2025.07.30.05.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:55:13 -0700 (PDT)
Message-ID: <2ca6af52-af35-4968-888f-390eee8b3bc3@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:55:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display
 Port
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
 <20250730-dts_qcs8300-v4-2-5e2dd12ddf6d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-dts_qcs8300-v4-2-5e2dd12ddf6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MiBTYWx0ZWRfXxDj0urISnGnT
 z67B6DxbKhEXnwZR/GB2ni0CCi4mTy0Faw16G9ePttz49VV/mz2zr4uJElG0VBtCc5k1qgZ4JnM
 OM6Sot+aF8MN9aHY7OfHhK2OkHdyWMY9C7uqHmPJNZhEw/czOHBYW11o2oZaqUUOiMAZ4+QA09I
 ysVSXw+1aU2UBgvQ9qP0Dz4yfZnECe3G0Tjxo2eezaKFsacbUzH4+OOvibZUlB5mge8Na65H2N/
 59HIr2jVZWmHT8+1flXp3nBwr4iJamjDIUFOslj82d5rvsGNE3Al6rhb2gqHhU/sedYsRLmGPPa
 QzBVsa2NEAoE3hJcUBUINvYtA3t+2d7cBERgIO9RjUzKWdfYWL2IuPWKxiru5S2xuJyUCZJqetz
 tlIc7L4gIjY+JX1BfgCzTv7+sSe/epkReZK6DIZ7/OFTZl5Mjy3zyBonqpS87HUGU5tcM4HV
X-Proofpoint-ORIG-GUID: SgTd79ic7fprmJ1sgc2j4izvx7ZyXwBP
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688a1634 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=QYiTujBYGv1OOWMMav4A:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SgTd79ic7fprmJ1sgc2j4izvx7ZyXwBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300092

On 7/30/25 11:49 AM, Yongxing Mou wrote:
> Enable DPTX0 along with their corresponding PHYs for
> qcs8300-ride platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

[...]

>  &tlmm {
> +	dp_hot_plug_det: dp-hot-plug-det-state {
> +		pins = "gpio94";

Please sort TLMM entries by the pin index

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

lgtm otherwise

Konrad


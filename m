Return-Path: <linux-arm-msm+bounces-50697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395EA57B29
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A879A16F6AC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 14:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9245D1DDC22;
	Sat,  8 Mar 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzoEYDYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3189E1CAA94
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741445037; cv=none; b=U3CqjMvKgwu1AlISIoQS6Stjm4xFYLzwstPl2rbu75LYzac9MXJo6zN8+A1vh9iCg04yDNi5XUNRpDWD5WSsuyTHyQwK+bAkUAfpWWvjwImgdt0CELmaoRk0fsRCsqJFmHSpNJHMIogjQWJ1wBg6EI+bEshTU8nnxh0vkoiRmws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741445037; c=relaxed/simple;
	bh=a6AccKTd3hzMWrFUUvxgu9sE35uOrACw4tH62Zq6Gnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtepPqQuVKEkhW+7ACFy1xmOXq28r9V3N/haFThIXX0VNqyabZPVzYrgukfBoJQZSzyP4NRtUFhTByyx9QkjZEHWvjRRFg/9zv1KVCS+TdK4imZt0Tw4Bcz+gXqmvzpCbNqiH296m+iW1MLiRYmsCwiYiq0l0OLQPXw/O4myo9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzoEYDYM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528De1a2024731
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 14:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTvFf2pDl+XrqwaWQVGdTUVg+Pbrdc7UejyBbgMQ13w=; b=jzoEYDYMv0VVt+B0
	x1Onplyye5sBhyTweHqno1XKCzADt44pF+ROEvmqCd1iBIyoX154fNOjDTzLvDgl
	VUDqYwOGDh3lsglJHiQLj7elOyaZOB3n7tYWDN8QfmrCnAQY2croatvaDMSR/PlW
	HUSnL13yQBm/NMzF6lOwpMgpnrRupAAdCUa1VA6JduGk3nZ+EWBUN0HXkBr4d4vA
	fVjJh6/Lwlu1vWkPGg+hlgMbCmrY5X5EkTFk7AX2ELiUGQ0oCh2zHqXxLwpcFJc1
	RDSSqJztJ8IuJiMrGoJ4iiqcnAcsIaSf8JKEBkhjlEs4LRrHD8zeuHrRot2xHBUL
	+PxYUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rq13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 14:43:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c638248bso55422285a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 06:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741445034; x=1742049834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTvFf2pDl+XrqwaWQVGdTUVg+Pbrdc7UejyBbgMQ13w=;
        b=ZD2CBWI4GjEgSXuDxzAJ487szjzLdi7YaJSaFmN18G5UIPXMFSXxmJ3EEFvC586HYf
         aDp40UFFvYkAN23bVbFhoMuxk2tmWIvIKOMYF7Xx4U3rVRu9/NpfUDaJB0y3Pbc2pfcD
         iiKRZF0Bpq0f/9vk0+sqBYVV0mJN5e7AziY0hq1/+E4rPuKzLlgJbmaIKhAlqIA2UsQ3
         oNgDeypG02h+EqZxuewkrJ05oU9pqbbbk+nHQNTwXKw806AxrXitsQiqA7ZXBIhDq50S
         zs/wh7T7lRsl13GfS9rzFXlkTc1qzLQoC7Roqt7OGuQdJrXKIX33CFvovGiqjstzbfoN
         mLPQ==
X-Gm-Message-State: AOJu0Yxq9p9TCIGL50xigTpQTEoKhREw8wFmSqqiGzgVrhes4ql3TOxs
	lV/5P6iVe4S5LLrEsKh0oas53YvJRe9wLcsBq3iH6sCNBA9ELMUM0A8249hiXALFbwJEw6sPRpc
	basb67UWiNguGoBazPy85ZHQfhWQS8C8XyfZpnIClZ++LYR0lPG4GaCN0YFyX0GNf
X-Gm-Gg: ASbGncvtMIMT8LhA4lkyV2VbDizrfZF4sH/csb/6FmsYMgVaRSaZ8XDtG5PQdTvYhZH
	FFaHkuvLmFOMFTm4t8nbFXPxKbqw2PYawduxb2bwyEc4ayyXZssncRZv5PU418Ew/IKSuClzTUd
	VFOOhnO0nqN/SCZuwYP5BfoKkjtLQNJ9I3p+hWUXAGUAyia7AlUFs2IdaHnvgXyW2bE9mh0bFN6
	45CkG38eafk6n1eo0Oxud4ixpDpygJBg477S34atciY/IlvrmTrYzLvxA8pTvqZDE69ks4B6jh/
	s0O0eVX6n61Z2qPlh2KLOk3PXAhlAUgwyiAjMy843TymLMGzLURWwLn0y5z7xk7Pcua3+g==
X-Received: by 2002:ad4:5baa:0:b0:6e8:9fc6:e41 with SMTP id 6a1803df08f44-6e908ddbad8mr15717016d6.10.1741445033890;
        Sat, 08 Mar 2025 06:43:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGUnI2FVM82LalckmE1gIl7KsKmJdBtVdyGmQ0HQO/+XDZwVpqM/Fb4ITYsenrofTKHJt05Q==
X-Received: by 2002:ad4:5baa:0:b0:6e8:9fc6:e41 with SMTP id 6a1803df08f44-6e908ddbad8mr15716936d6.10.1741445033526;
        Sat, 08 Mar 2025 06:43:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2523d940csm318868566b.178.2025.03.08.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:43:53 -0800 (PST)
Message-ID: <4232ba8a-cf8f-491c-8a96-97b16cd4a9ff@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:43:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] arm64: dts: qcom: ipq6018: Add missing MSI and
 'global' IRQs
To: manivannan.sadhasivam@linaro.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227-pcie-global-irq-v1-0-2b70a7819d1e@linaro.org>
 <20250227-pcie-global-irq-v1-19-2b70a7819d1e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-pcie-global-irq-v1-19-2b70a7819d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc57ab cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DV3kMMkrmgS254hfeM8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CV2OzbWtu7h52lSvfgRY5YOcrqj7gLbg
X-Proofpoint-ORIG-GUID: CV2OzbWtu7h52lSvfgRY5YOcrqj7gLbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=631 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080111

On 27.02.2025 2:41 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> IPQ6018 has 8 MSI SPI interrupts and one 'global' interrupt.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


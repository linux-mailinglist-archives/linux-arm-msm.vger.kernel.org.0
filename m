Return-Path: <linux-arm-msm+bounces-71912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF278B4262D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 18:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058A41B26C4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8DA2BE635;
	Wed,  3 Sep 2025 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paMOUG4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073529E0F8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915328; cv=none; b=kNZFEDXgkwMZnU68aqzsyYxFqmYCL9HTpDh+oQvdsTg2C2Yqj1uZTmqlIAHkD1GlrBJBnVlzdVYwf5LdNBgOiqd14mZfSVpD1xrQ16YPdtjPerjHOnqMrxSGOjpGl8DIlgptL53eAnoxkZOEBuv6uOdC3jLFzXWmCtW7s7W4Kh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915328; c=relaxed/simple;
	bh=duCAr7CO/N1Ze4ijxMI+nhb3sedWh7XRQtNULBNw7Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RB3Ge0Kru3/jGzdMSnR/BjTn7UErhv2TETuf1Y/cR9qP+onjEq9RqVGN7p+WfyMkmbRCRiqdfcskMhuDTomLYAdwLnYHLgG23c39wmUGSoVM1XsEvNzkdu+NbUdKxUWdhTgGTgQ7y5Y7Ke1G7dxKEDlhBwg3O/S3DYcwpBGen04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paMOUG4f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxR5P029667
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 16:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufkKfMtF2sFaOT1A75ow461HdClQcHWGVHzSfn9/S2w=; b=paMOUG4f4olZvDlC
	gma5g/I5WSNuYq6qS1l+Xt6+llYCURDMNeeKgTlridcomHF2zBXLevGozYUQ6HdP
	8Zyl2KaS1A2nShuiQGZcOjMzi3Y7JEU3y3yjqAvl8vMvAxLxVU25QWGajl2viDag
	nUh+NH31cs1QvoiV0hQAo2DMIp5LcEtZ9OqCSzpLk6kYCfrSd8T5yrPD8oAaMroa
	uf5OTH2qi8QLRjthJJPE7W/XASU8xBxDzAqzWNoo2r5jPxzs0JD+1VNt1tzJJhi2
	VshNLVDDR3CD3+AaHAX96YNNYnpYh2SFdiEyKokd4j2HVom68+vlgNj9L1nYqdrT
	o3cf6A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw04bp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 16:02:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-52a6b02c954so3018137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915325; x=1757520125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufkKfMtF2sFaOT1A75ow461HdClQcHWGVHzSfn9/S2w=;
        b=EUvl0itw16eBauo5iyoS5M2tJaj9R/YwbTQhecLyDVZZ3KV64d+EVFc77JtBi01OMf
         i9nFg8iIHlPRi4KRrkVZyVJN708KJKIBRVcKD3B1LeTbKMCL/yvzNXgJeofxkwqtVZ3N
         LIV9JawkyX5sewiXZS8xTWUhmlpVkbRqi9NIEKZW3n77UbRP2vEIKc0XcbEGylTH+pmT
         WwyIJSOxPHizfR7xl1Lgt/BsRNjpGjJa2nk0ihxnpzf4/1wpQYmzS7Sd8lcamIO7INYL
         nkePFQIhKYu+8N6YLvV2/XnanSfEKAo9ZpugSmcmGOhQaP9Qjme+5kMQaPz+aKogr6uz
         Ij/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjqLHSLYt8uJJVXAKUL6A5OQDIByqRudM8E08IUDtgQkXG1ujI8zTS0JYNLawGmLY/AI6xbFAjOr4XALNg@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYCMNODhmUOedJPaSzsDssJROSJlRwXf7G3X3WLZYNV1eZndz
	NKeJGX/cfz7tfOtNh+vyLKww34qpS9EDuV1cOwdxgImWakP8bu4QNfzP0rjIpX3ai7ctg4qNBde
	Ulgt4AcFGKpRPeGbLEQiTJa3AAO+isJkmwFJAa/XzPz2zTY74a3/7JY7tsUZp6TOTdxfS
X-Gm-Gg: ASbGncsho8HWI+gSpZHmhCcWb+2g0up49kLQF74tN8w0eyqVROZpZM1QVZpULcC2oYS
	jnkfW6z61IDwbg+l7TfXLot0Ml2MOnd04umdV/fZ7w0muZJ/l9mKn5gxqVAiiAlJUcBjguTce6v
	iLALn+zyngrWmD2uY+M1y4o49mCVAUqaLdnhetHdcGJ5P+dzMGFj2OVrf2vqTmlgycEBwHs6rV+
	Cjb393yYeZ/+wAaqYhwDzMbJ37LrvXslQfYAOtZ5ppedZx+b0xkavepGPAHeokewVP08PGwLuuh
	4UY9SqOBECT/JHN44ORxgMvNISLvpe3y1Fc7TQOBhOiB3jcJWdQasoSFwHUybLkDIz3PNqIEISA
	sUm+qUrNl6sbNs17fmpAWAQ==
X-Received: by 2002:a05:6122:2015:b0:544:91a8:a8c9 with SMTP id 71dfb90a1353d-5449592885fmr2297777e0c.3.1756915323667;
        Wed, 03 Sep 2025 09:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNOwCrprQOUcxuZaV/B20qgOB8K6FfIsDK3UCpWlIJhUbywwkcF3iym3uiTsjk25+FxGpDqA==
X-Received: by 2002:a05:6122:2015:b0:544:91a8:a8c9 with SMTP id 71dfb90a1353d-5449592885fmr2297638e0c.3.1756915322699;
        Wed, 03 Sep 2025 09:02:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7dfesm12285170a12.7.2025.09.03.09.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:02:01 -0700 (PDT)
Message-ID: <ca2b6089-54f8-459e-8cc0-accf802026e2@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 18:01:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5424: add i2c nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_msavaliy@quicinc.com,
        quic_vdadhani@quicinc.com, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        kathiravan.thirumoorthy@oss.qualcomm.com
References: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
 <20250903080948.3898671-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903080948.3898671-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nFpSqPZ8zR1-vmfp2tXIIj8ABQCDvNDQ
X-Proofpoint-ORIG-GUID: nFpSqPZ8zR1-vmfp2tXIIj8ABQCDvNDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX0Aum4tsNSJZm
 ntSf95HOfqDDL5oiQaISewRpZFKjyDRJBsNtHroWWwv5K6jZx6OHk17+E68krrz9vsR2sJmttMt
 HvRu/Pp5rNdxkmmktXBetbe1/TxxMzaL7GsZ3Vrt3ePjHP37aOtErGs/3mToEQC0HLRtBYN43X3
 YwVgm0LS2+qDDvt7xrALykS3HBSAsO9HnkzNNz6NvjiBQyRYNKXdgKLRUjNEM0u1Sg87OLAzl2t
 +W3GjBrBspJRXiGlDPmraWkpgdSxywwtDj9P/tHBHLW/rBuwWahUjszcsLB8e9SHUlpjbA+suW4
 T8udervYc7HsIJTTKAeljsIG4WYcaXSLo19NNOBMyouM1ebdgwbfV1k22sbZjJNDdfZohU/uymD
 OwKx2g3v
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b8667e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=v5yAd65IgAm86a0TdQQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/3/25 10:09 AM, Manikanta Mylavarapu wrote:
> Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
> operates on serial engine 2, designated as i2c0, and on serial engine 3,
> designated as i2c1. Add both the i2c0 and i2c1 nodes.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


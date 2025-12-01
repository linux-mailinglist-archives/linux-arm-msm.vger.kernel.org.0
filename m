Return-Path: <linux-arm-msm+bounces-83991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0CC97FA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 16:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1380A3A4560
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58643164DF;
	Mon,  1 Dec 2025 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJTjUsNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrfH0wEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6F313E0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601787; cv=none; b=mx1tKM1Fx5vsaVt1KUqdIjxwPq5RNqnYNucUqr7B+tNnXrBmMI0IATZv/u+WWlRnle0RiJm62bwOQUeQYCS81klR/Ccf0sknPsfPtPD5FB677yG3XePg8A2bvK+WZWXfv3RjYnN8s1Fwu+SzU6VINXip8Yo4zIqcK47OclcMFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601787; c=relaxed/simple;
	bh=YGSSDKFg5jrGbiSq4AkXaxodG2ZTxYZiOQtMhSy+4z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaoeuuFYjWZcKYN9ghA520hBTnUVjBkF50qV54mzZWJ3Sr5y93c5BPIdlspZu3i7XJjfk89Qwql3jgjOTIzF71jcCdLSy/pcZlffjb8HB4wZJt1wca7yl7MSyIJt0d+X/bLyV4XoCsGQFFgMG3H8MmKL6An2tI25/4if7Qswc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJTjUsNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrfH0wEp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B5bCb396678
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 15:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3t1Xs6zgjRdXhFfVBguGwwnqAOk/Svbih2vGB4uC6Y=; b=nJTjUsNjRIHHpY2D
	J1AaiSet+6NiDLpnynoJhuerpyahkAZJTZUSrSvCFDRLJ6basaXXifhR4b/ibpDl
	WWnKwjiQ4x0TgMlfBwUJQOdqlHAt50McNg8Rlgk4FXgW1P+neRJEQezVWEgsq75z
	97tVh9xpLvOsBDHyuY1PSAcaijAGOEfqyVYs+LTP1rsgomLMbhCdBKjWO9AQ0KrO
	xSuJlcw7cKV8UlqRrrpa7NC9dancKajDaDNXuFnKF8WSnmWlbaWntE/CtY0cvf16
	SbmmZsj4wIYVFPSKWk+fvcJHIdZn5Lh8azZpO3xfJuWEMVeyAA6/VzbR68AiD0wZ
	wvNuEQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug0ntd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 15:09:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5e1fde1f025so444275137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764601784; x=1765206584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3t1Xs6zgjRdXhFfVBguGwwnqAOk/Svbih2vGB4uC6Y=;
        b=YrfH0wEpKWfIrIE4LaS99smO9kpjI42H+pd7bhnLR/JCgbNvgIlOxCRbzhcak1232O
         7wMKZ8Ajo8IZvGqAbUKXzVKesZiRfRZQumXtvxhSyNo5LjSUH2tPghCdbkcNlyhBSVTR
         cG8DJB/KmHhTQZ61IoQTAsjreln8pyOPSMwKaJNalN3W9iFxHYnBEFbTFQlo6iuXmUI8
         HRnsj7jPck2N/wj8m5KMONcudbRkUgkjhfgrI8Bcn5VHHG635tNLCphrnMbIz2j96uue
         rrRyW/x+aYdFziMJlztLoU6dg1q4EKfDQ7LqdM+kmRtXARTMECpGZFafBNF7bVpXi6PM
         nWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601784; x=1765206584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3t1Xs6zgjRdXhFfVBguGwwnqAOk/Svbih2vGB4uC6Y=;
        b=WwSs8qSWm2WIDUYDKVe52GM4N1C43VMkOarn4pYZRyoeMRM0djPqTv0Bq/Om8/BTvc
         TPJsL+f9+sH2K0Y0QNtBz1ZqfWCk4W+DDRda+4UiriN8ex8rHrbNdtZElzLtafSaqyHs
         LCjYDLbe2z7pUm3z9mk+qsRIzECxAasR5+Sw6eXNDz4lmW14HpIsOSuFa3AC2ai36751
         oWWo5f/TRZfb8pKxdKrtZp2IdIszoa5I9caaqNGyNzM53pPQXiLYVVVy6qzCABqd66tM
         PTknFS0tGXU42Qq8y8b9UK0gFTVsVsuxRjbuqUBRscLpNOmd0ciciNe9rTsD/0DDIfWH
         LMfg==
X-Forwarded-Encrypted: i=1; AJvYcCXboSjMN9DhtW0oZOyL+AEo815WOVqlYPPRTKLZOLaCZx2eRVor8mczTqj87XFpqdXnHTqsEf91mVHaxoeu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vnbIlWjtfzBCJLDsceNDJ6k7SIxkRho+uC6JMe4IYqFbPBTV
	JW6G+BeURVYCJ9HFyI5lP/IT9bvHpUOLlDlkheIIVKGpHQnTMNaaLrFZmlWeoV2eSHK5YHzfwQB
	FhmooJ1EGMDIfToa02FcBOFoXzHFs1Atb8Kty8lZioS55C2AONHRlI8DsflveI+a8wuCf
X-Gm-Gg: ASbGncsDQM3D2kMPmm/gQy94rKqSnCQ2SZakRx5EFkOJsPjfd39fDa9ZXu8bE1NLN+X
	dKJserZOYMi6Vs4Ob7L8fUSqAuhqPuuz68SkLK0z5yCR/vF4NOT581UphqGi2oQxBRzDfdcCRvU
	923flH+fxwGsbZorhP2u+MAdaGN/0YBcdx92388H6RUGMmNkriCDcC8gasBmmFnFT45bq8zLkSx
	UWMY2IRW+tZFm3aZUtnIhRptUxLn7Xmpbv9D7ErPXSu9g7gHsW5hedXRWVYnDvBP04TJdKu2iw8
	WVnSLYHwaiHFrUyly2x3X8ndN0RHtZihrU2PuCGAUZAutIIZ9hAb/k0LzLv22na+dnjba1Pmcm2
	8WZx2WSz46n3INyntkD3nsuYv6ilbuSIrzIfKsEI8tzO/W1KrtBElCbySHu7Rlk36pQE=
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr7861925137.8.1764601779872;
        Mon, 01 Dec 2025 07:09:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqJ/bOtUtruLfvAMP21Fx4vb+d1CVVf6E0IukYWZBWR+luXF1KzuKUUzQCJI+z3Ap2EQMNNg==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr7861677137.8.1764601777393;
        Mon, 01 Dec 2025 07:09:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a265d4sm1236160666b.60.2025.12.01.07.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:09:36 -0800 (PST)
Message-ID: <4f8a5842-2132-46f3-a3a4-1243e5342f6c@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 16:09:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs8300: Add clocks for QoS
 configuration
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-4-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128150106.13849-4-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyMyBTYWx0ZWRfX49xkewnNQeJ4
 EC4A1aLrs8VEmr7wcUBV1dPMzvl5NWpSFUCPXCmCuGMbFfknr+ih7uD5JBC6AV6/putj4eZBCnZ
 h1y2HrlDiRWahlDydEPLOFF3l98g/RqtmQgaOdZyVMUC2sTu9/bvr0RPLneAXyrvXDxVc0ogOOk
 8ctIXWYkK7F5TAF9c7rJj4C7nwA/7NL9WiX7mD9RGSWx4Pz+5uFLDcytOBBGTwuva458FYatnqd
 JyZ6kNlAVWJ8Iwo8QPSriPN1tscKCtulyt4JiRBmh/8F34w6+Ioc8KTlNm5o3+4Y8fmqvkGpItk
 8j7ot3yQiOcKoUGBAZjEpkKzaEG99kGSf3SxenWF5ouBYc+aepW3EflzekbkXdS6X9d5SrMIfBL
 S3f1nehNo8iDk3EHeq9VMRr5cJscsA==
X-Proofpoint-GUID: AclxuPaGjM9pstavkOwy4mFzUbBjH53x
X-Proofpoint-ORIG-GUID: AclxuPaGjM9pstavkOwy4mFzUbBjH53x
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692dafb9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PHHq1DDFEsKsDgH6OmAA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010123

On 11/28/25 4:01 PM, Odelu Kukatla wrote:
> Add clocks which need to be enabled for configuring QoS on
> qcs8300 SoC.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---

I don't have a good reference for this, but it seems like there's
a lot more various AXI_CLKs (PCIe, ethernet, camera) - do we need
any of them too?

Konrad


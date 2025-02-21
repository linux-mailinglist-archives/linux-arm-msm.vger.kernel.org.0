Return-Path: <linux-arm-msm+bounces-48982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251EA3FF47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AACC91887A06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F3F25291B;
	Fri, 21 Feb 2025 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmkvTkO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA052512DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164615; cv=none; b=pdejBiEN7rF9ZskmmuT7mtIIp8DmXv3/3q4K9wx/mj9TU83U6+dPZCiAsLFWU2TD6zn0QDDrOlLhDYJS+oenv6QxjGCmGmZPK4gyry3XxhliwPpyC9a/SJuqJYWaJ3ouif4K7A+h98t8F2JHZkXQdbgyAR4EvUQfkcTV6w1R3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164615; c=relaxed/simple;
	bh=HqPF4+t0U3+VICuHr2MMMkWIevGm+5cDUFST1b+1S6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/IasyM6HsKf7sWC8jx9SVFjRxpqOmyy3R8kZEg01DBzt0Fo4s8/VurwBFC+2WWKPsVHa7ushAR7Bt4xsjKDcwoc2y7z1HH5rU1xJ109RlYHfdYHe1DMNywv4WiR4aRCdpULfc012J+8m1glkBLWDPUn6+2d30f06jV2Ou71ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmkvTkO4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LJ0uVC011936
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	874MfgMIlUvgyTuHZ9EhHcv3WgxH2uNjqVh1gBPjDWI=; b=QmkvTkO4FpTd9bqv
	2gOY+mSY5cOmDVOwaQ4AsSnSqyHbNyHZZBtUt1lvsbHP/XrFMFKMsue57y0p7FXH
	/pVPUe88UpICfYGQiP6p3mCuQUyou9rxNFpxrmUmLekrhBAPfHRZA1iQIajKlaBe
	oRyuo59kD5+ERG6Lf8CDs4tC5v04MUV3Fs7CynnPFdCGRzlV5UUE1cV9ArFSwm0i
	g9MOXTvG17UrBCxnau/awN10inZjFrt2Gq6sTdy1sLSPgyszkWQpW6YDe59ZfXUV
	6Sn/clhMlXh1t9t2NmehzJSfXJEqMfJZs/PZ35n0McThNYLAWSnHxHiqkkwArIZr
	d0OEKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xbd5ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:03:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e66e017ea4so3521766d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164611; x=1740769411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=874MfgMIlUvgyTuHZ9EhHcv3WgxH2uNjqVh1gBPjDWI=;
        b=pSvf9uMxCVU/5VUNAbcKIIRlopAoLknUvjkrZZf/LMyZ7jZO06nuYkyK8F+hBK9WnV
         CmRDJ0oz+IFVqNwbICOFQyGy7aEFZVSic7OV710zOxYqzH4tbmE4G7iZY639qdtIG/8U
         nkxPwmZtTjgY8/LeaZZ9sy/XgYSMy0BmS3cSruCM8T1he1ziYalhmr6btS8RSmiRA0GF
         wZ/Q+ZI2NpXAOHZuWHz3rKsm+3pwZlJ3Igg6UeEE5Yxu/0nSCL8UCUpo2CQlE1/dhUJP
         5k/CsxhSaqk1mHJI/iitPzDi7NY7hKJqMuR0V2UdRaCrM01LDySd38YgnQ67DUdG1KL6
         5rMw==
X-Forwarded-Encrypted: i=1; AJvYcCXVUNtZ8P1al4BfGZTLFxG0fYQycl3OWZJYnX8RnTk9xtzX86fu6whb7r7VdejliPXYYfOqc/Q9jGDB8b/T@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfJVERLnuKG9IBPgkgkAHODqky9T+j9chvKP5XxcYEQVWhDt4
	aCLHQVTweTsjwFYpTRJQtqveDrMh4H7s3MWNgOU+VRvB6RWJhSghCHJewW7kqwxSx9Vi4LxFzah
	LszBsR9C+Am27xW469ExESTgriYsffybaJRxHAKo1Aj347uFMemSTG6JV6rgXZZkZ
X-Gm-Gg: ASbGnct74uS95k/xg+ocqurgD/DfEVPAIzeK2WD6iAGsamGRNaJCOoGmbYfCr7OOp7W
	4+cUr7n4bf3lSvZbjI2evBSG54wnA7V9MnAww5rb6VUbiNF5YuIcJp1SjngT46xBucs9FRmrbA5
	zRIKbYN+3aILSHNMdRFSa6l441LWW6YnMq5E5uCN+lbzeHd/CQV8EQGL145Nm0B+BGoWDFLkAW2
	JtHCj03wARUoAEbee1HC6y5OgU9IPh8eVFCcMDPE0/AjQXwWYi9mS8Pu0pTUWS3J9qANVceJqN0
	mszxqL6YJyvdSRXREow5sG/+NeTkBzgCze5+/FCD2oN6nktHRAwFl00rUTKgHSEF5Va5mw==
X-Received: by 2002:a05:6214:4005:b0:6e4:4f27:7754 with SMTP id 6a1803df08f44-6e6ae8019b7mr19814626d6.4.1740164611162;
        Fri, 21 Feb 2025 11:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSAKEMe6WySvB0jR3beWBB9DVJckgwZ0pCEh51Yko1mA5B0fTJzLtYCqsZejAHtIgYg0qOuA==
X-Received: by 2002:a05:6214:4005:b0:6e4:4f27:7754 with SMTP id 6a1803df08f44-6e6ae8019b7mr19814516d6.4.1740164610746;
        Fri, 21 Feb 2025 11:03:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9da9f0desm1009014566b.105.2025.02.21.11.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:03:30 -0800 (PST)
Message-ID: <e03f3e0b-5e1b-41e0-a42a-5cae0becf7c7@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 20:03:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 3/4] arm64: dts: qcom: x1e80100-t14s: Describe
 the Parade PS8830 retimers
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-3-380a3e0e7edc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-3-380a3e0e7edc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w7bAIUfUSWeDXaWG22CEv9BNTzVuq6CE
X-Proofpoint-ORIG-GUID: w7bAIUfUSWeDXaWG22CEv9BNTzVuq6CE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=969 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210131

On 20.02.2025 6:42 PM, Abel Vesa wrote:
> The Lenovo ThinkPad T14s Gen6 laptop comes with 3 Parade PS8830 retimers,
> one for each Type-C port. These handle the orientation and altmode
> switching and are controlled over I2C. In the connection chain, they sit
> between the USB/DisplayPort combo PHY and the Type-C connector.
> 
> Describe the retimers and all gpio controlled voltage regulators used by
> each retimer. Also, modify the pmic glink graph to include the retimers in
> between the SuperSpeed/Sideband in endpoints and the QMP PHY out
> endpoints.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


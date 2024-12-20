Return-Path: <linux-arm-msm+bounces-42951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 623209F8F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7016618975B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B341AF0BB;
	Fri, 20 Dec 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dx58ElI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF61A7044
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687978; cv=none; b=Zoif/PDtOBTWlJF8fs8xoVxinVF7jwISl29pgIKcbo3SspEc7RygXumVYRoQbd88n8eKFegwf8g4uR7MJsL4K/v4ifx9u/q5hii7Cp7LwhLUjWOXJIGYvYjS9oM84KFRztLNaxyB0zEyzgXJVncV7YKSMnEKLMICpjFOohpWNG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687978; c=relaxed/simple;
	bh=XHHy09ydsqCogMppSGJ+Gt2u83nx58u4mpJvkQh0Qj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCv7cO5HtCZC7ZXT6KbO8j7nSk24JAgDFrv21a5Xj4Ows0cJICdUxr2BNvxnUSKZpXGBiGlRmX06REgPigLQuPJwD7pYp9gg7xq8+dvyAHsCH1JNKJda5wvNc4trNcM17pobWr7C1p2KyErXtMlkFZXstabA2u1uImEib5g8Kxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dx58ElI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4PZpS024611
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uu3beV9nqgRt6bygJC+dToUOYiThZQ4t4YOU0oZYnnQ=; b=Dx58ElI4/IVvGuiM
	/TCemoA9x4t7pKRLhMmdz+33m/1hNAl/3J4Gty/s1cX0pHVaDIo3voCxTcUImMrc
	QCZ2QPZTZM/8f6qRBwDbbOsRKVerPGDbdwQdoP64rF9A7eu/DlvoKsc0mOx34Xzq
	B4LV2q7NtsSPN1lPCFGfXCXcDF3WNnKP03TCF82+yjCt+kPZwZf6H4bL8GzCaoyH
	tytkG0H2T9WsA6XLZwpuIJAMpZJrvWn/1YeaIUbV1podSPWslNr0yIDlr1O2e4EO
	yUS499jWjcfGrcDFrIiHj3vJ3VzUf8RG8A6zhoQZpeCWGru4X0dqStnS9pEUaH8f
	yqHWhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx0t8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:46:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a437e5feso4059291cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687975; x=1735292775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uu3beV9nqgRt6bygJC+dToUOYiThZQ4t4YOU0oZYnnQ=;
        b=ZV2vvhvTg/7mz1D9v8ligaaN1i1tc9BZSfLUZCZk18cl0WT8p/UrQJKgHO12A8F2Ao
         7ho4ajB2MFZIIjMjb9X9f8HstbHAoQ7p6+8Z3U4LVTBTrhjXRZdbilcnaou2rp74VW1M
         KvKXMwuH0RZ1p7mPvH9g2QssJSQfsf9yFJPGIFMFdXqrHPqc2H65UbPkrDSBGoKENcFx
         g+eF68xS1zggQXmJiR74Qk92vujnD2RjoBwq4VYu1HhLE00X+tcwUJTzyH9aAmFyF+yM
         Cnhyhc/KF8nXK2pbPO4OxlsqEygG6ngTDGW8oy441kAksVyrcNxoZPIpmV21+G5T3OY/
         e4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU5TbSJD2EXCQ4KvOaZS/qMBOeumIn/Wl7P/wr7S3PzbEmIaklplCdSJLTxnGSEPWL0cBZxd15wqQaoKAsC@vger.kernel.org
X-Gm-Message-State: AOJu0YwRX1Yu7gGjxaFLg5SbpOk0gHf0xO91/LzQ+o1uJLW3w0Xuv/rg
	gyG3wkGLKH2MdgZT2A4ipih9yLMVGK/XQGd0WZbXnSO706xH28eXIq7FxjnhgKPjVlSrwt+F3UK
	DbFdFb2l0H5ZF/4Lu8PwbUdMA+MB/sY+X0pLbZIJN7Mkq9w6UYF4m80axDMuhFE1iRSYQpKlh
X-Gm-Gg: ASbGncuBxuGg2j+BB+3Gzu+QNBNFahnZLH20tPduJ0gueVzSbqlViwvXUcnY86fUhWe
	xkX/jE+bzF0Zx9WCCUyp2mgbcVjItupuRxr7zaQygHDCgsmIjboO6F4G58dzxGLMlHBlHXQhvm3
	lrgtEiscX1VJTVJkAHRuUyDbgx3rb1R8OZ6KjRd6/V9HnP4Qu7YoJvrlG/oq/nYQWCwH06SWr95
	bZwO3LcNMIwWlIok/bbfEWrTobZNZ7B15oXH6TbHV5hmmdGFtQLF572kVknambiyQycMdHQkuOl
	Iz6cqgWcDH8ME4pwcJzX9XoZwkkTg+QoE9Y=
X-Received: by 2002:a05:622a:14ce:b0:460:9026:6861 with SMTP id d75a77b69052e-46a4a8f9fa9mr10841321cf.9.1734687975099;
        Fri, 20 Dec 2024 01:46:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHr/MgWCLpFfmBCHnmU7oC+VsuVtB577PXhAqjgeyJSW6elrf+t820pkkN7X+Ky9ExDPpSwNw==
X-Received: by 2002:a05:622a:14ce:b0:460:9026:6861 with SMTP id d75a77b69052e-46a4a8f9fa9mr10841261cf.9.1734687974788;
        Fri, 20 Dec 2024 01:46:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae3a7bsm155719366b.83.2024.12.20.01.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:46:14 -0800 (PST)
Message-ID: <49cccc44-09d5-4756-aaa0-1c8cef473c82@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:46:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: ipq9574: update TRNG compatible
To: Md Sadre Alam <quic_mdalam@quicinc.com>, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_mmanikan@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
 <20241220070036.3434658-4-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220070036.3434658-4-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P66Zc7d_wY7f2fW9__Vw4b1lc1dHOWQz
X-Proofpoint-ORIG-GUID: P66Zc7d_wY7f2fW9__Vw4b1lc1dHOWQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=697 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 8:00 AM, Md Sadre Alam wrote:
> RNG hardware versions greater than 3.0 are Truly Random Number
> Generators (TRNG). In IPQ9574, the RNGblock is a TRNG.
> 
> This patch corrects the compatible property which correctly describes
> the hardware without making any functional changes
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


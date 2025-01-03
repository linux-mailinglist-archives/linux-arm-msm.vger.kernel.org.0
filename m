Return-Path: <linux-arm-msm+bounces-43878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA85A0093D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE38B1884486
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67FF1FA152;
	Fri,  3 Jan 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxKKxmQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9C219E0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907370; cv=none; b=iWezgC7ZsE3SxdgRTcbY+1QwhrLY+1Nl+5E3HHESwLbz2pfKwBfXetpfi4wE5dxKxSDXRIby20s8+3pshQPLqyf9082UPTe7Hd4y3pPKXZGVp2z/Mx2QxrTMQT9scvCCYu8kL7vNE3Y6FNIWLTWMUCLgs+tL1nsexbWHgRt81EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907370; c=relaxed/simple;
	bh=xHazg5b8gtkTWxJX3vtZAwoqv7ie/sQQD78OTSbMw8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkFubB/5P8MmFSB/jJpYWLJknCvjE42w3hvkM/oc+tXbfBJSQqQk6hCGJ2filVuNqIzHBlrhkX/wjJs+V7RY2W58FIB5dwrnMJ/xCvO3sTmFdAQA8aNJyWLyT+4Dj3MXxqbPIn7fwGxWKHKVHxgYL0NvjxoXELOQXrF3z47CCjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxKKxmQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036Yk3L010638
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8P5uG6PJun8R28epOEw5Y3NzJYkBGc9o295jGAaImU=; b=cxKKxmQgFR1yBhai
	rRpv8IdII+TYkdgoCRUDyn01N/i4cndolm08quge1CqXUASsHlrMxuBr7U3dJqVm
	YB9gaeNGlUlA1sYkKmDud6tZ9kNbTetV2a+h1gdujhU2fh21mzkHhHP/fv7aqX9Z
	i3JSQY7ZNlrqTRnHVIEbRmifAmntLBknVKFuGTaZM9iR3NPrdXDhK3JLGdivkF4u
	X74lW81Nui7Nmp3l6HI9y7Yly2vxDaWlInFzVusG4YUAEx28TrNKokpFcdxbbzcK
	rCmKForCrZ0Cyguv2JvM7BfxJQbXWsLXTFV2f9ZCIav8aXnozPDp+i7PFmIVLwMd
	/KpR0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xardgr9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:29:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4679d6f9587so34415611cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907367; x=1736512167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8P5uG6PJun8R28epOEw5Y3NzJYkBGc9o295jGAaImU=;
        b=UInTHzs7iRQbcFPSKFG6pJzAICs4amwQIQlNetu9XbUMQVrvxyTG5sAFa7khYpiY81
         xocxPHfkgClyuwX3KNqeqmn/GMmf5Es+UcWisULL9GIAuduvyCZ9Sifyw10GUlKn68T2
         7dOOgTpXCZvEcJzXDVIOz92uyHeNwB9Bj0t3SApS2+6C//RqyRqF18MEQQAgwT4DX8Xb
         2U418xfbftFVQBHgXgZmLCAOdqxJzE1imuuqMmxJB5Zn/FsChYt8FJc9MsKbFgxyhPFV
         LyG26tivHZvag/l2jF19PgRGwrRriVETWoFRKbMMNSxuMOSNG9bzlVVE3ZUMt2QxUt9r
         0lZA==
X-Gm-Message-State: AOJu0Yysmlc+YqZt++bLTqGQa86HWfhpwcn4M014AvVLbaJl2yOcrlKM
	2Z3hwMA7nihbQ7ezd2EdWru17D8F98rmC/Wt/CwS++IoagyoLnRh3bVxp4ZLihOJ0khHCr+IYXj
	hN5ohXQLF+K7lxKdB4sM/aDJaCqGJJ8i03LeoZ373Q5T4GD9g6E4sJ8zKPIyao0z+
X-Gm-Gg: ASbGncsv8rkP0s0p7j5c9tT9iMSN42w2jzzIrnwrc2hkNr2V0vPYt76OXWQPL3cqlq2
	d4GSpdnq3DeOJhzOUYXgC9My5Th+1F160AsNYM5++JiNxVh+MGZR6i+55ApV/k59eTW7PhS6AHe
	lwkCExuIL81F6ICukLeZXy12Gmp4uden3mQ64gjVYaVgFlVxAAKqtmLpye+4Estx9viASGxNMW+
	AtTNLurl8xhVxN8KvWxBrkkJeUzQ1uHzStuottTuMe08zvxBQqz3kjOyWBGXvydOw7uGQG1Co7D
	3UU3FCWJjlg+v9q1DWBzlyhyG+pKM9cTe+c=
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr283345361cf.2.1735907365716;
        Fri, 03 Jan 2025 04:29:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBd+GaPxhspkqPCI+ugt43bRmXkPYvV99w0sa5IQCFi9Om8iHkk3NOJSw1+HKaMtuKdDJdUA==
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr283344581cf.2.1735907363816;
        Fri, 03 Jan 2025 04:29:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894b60sm1919353666b.68.2025.01.03.04.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:29:23 -0800 (PST)
Message-ID: <a40f05c1-6897-46e0-a9e6-8f898e97b5e1@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:29:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
 <20250103-qcom_ipq_cmnpll-v8-2-c89fb4d4849d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-2-c89fb4d4849d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JBdUjknHgQHL5RNdAP6wr18-K_Xh3Rq2
X-Proofpoint-ORIG-GUID: JBdUjknHgQHL5RNdAP6wr18-K_Xh3Rq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501030110

On 3.01.2025 8:31 AM, Luo Jie wrote:
> The CMN PLL clock controller supplies clocks to the hardware
> blocks that together make up the Ethernet function on Qualcomm
> IPQ SoCs and to GCC. The driver is initially supported for
> IPQ9574 SoC.
> 
> The CMN PLL clock controller expects a reference input clock
> from the on-board Wi-Fi block acting as clock source. The input
> reference clock needs to be configured to one of the supported
> clock rates.
> 
> The controller supplies a number of fixed-rate output clocks.
> For the IPQ9574, there is one output clock of 353 MHZ to PPE
> (Packet Process Engine) hardware block, three 50 MHZ output
> clocks and an additional 25 MHZ output clock supplied to the
> connected Ethernet devices. The PLL also supplies a 24 MHZ
> clock as XO and a 32 KHZ sleep clock to GCC, and one 31.25
> MHZ clock to PCS.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <linux-arm-msm+bounces-44789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE4EA0A2A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 11:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1845188BC71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4047018B492;
	Sat, 11 Jan 2025 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvMHHIKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC41C170A23
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590586; cv=none; b=VS7E0hYD08AtPRMAv1h3ee0X+NEQJByWO7lximKOqz1vD6BdKxGoHYRoVsyWnsZYWUHMoc+BPeyWVFS9sLyJ5ORLrMUDKqBs2hwQdgwL1lWwtk5/hSkYm9GOmSnEoYB96OOtWlNo4uyqRrRo3MLLfHh+zNO3i66axDdpch971M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590586; c=relaxed/simple;
	bh=+0C8BlzusYxOPptL9BVR6fsXIYLEOTda+I65CwE8f6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kt6lWNHra0gJojo99XLARAk/ik4TM2nmNkmyB7eE5XqXpQPlMKbttdnams05y9FB9oMeWjnB6uNtwo7SGK2JTw258xxmQlle13gtLiP0X10x0guLRTW5stwFZKGu8AO+M0ZjPGPLw35+htdlpVpmh8t4bjIFquSvXALTTIf7Qlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvMHHIKc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50B6JQ5v004066
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 10:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9+WyrSy4Bt0wnJHAm346WUu/Hgt2IxkMJO9OgJiDVk=; b=WvMHHIKcThoftU1l
	tyqz4wdCu8/6zpzR+OueS+H6hJRx8cr+QuiZpuvk0Z9qzfp5XLFlZw4D3hQqSnvf
	Fr1Jdcl+tXbti2eLo+9ekEo/OZjyFgQIRs1Mg80ul/HzafkhGQZE6yNMRfwLTrEd
	YSwA/It/Saj6DzHYF1yl2h9L8FRu1efb/AKYAsEZfkgBDv7fHH3buCbBcpMDgZh1
	KwjYPb7V1CvoQkSw+jcfLl+0OZxwG94lIr+WO+D5yJooJmR0DejX3ynZOGtnTVjz
	/PkgwOsLnn/NgKFrNlfi+lrYxvUBO0483+e167Acd/rCg9SapjbXA/PHFGJjyWdD
	me0E3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hjk8cyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 10:16:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a437e5feso7421611cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 02:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736590569; x=1737195369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9+WyrSy4Bt0wnJHAm346WUu/Hgt2IxkMJO9OgJiDVk=;
        b=iqDCSKNMPiVQoKzHFSwzfwjgO8NHhi45bLqfFSNGG4Wd/xpr5DCG0fXH0OQRbgSfUc
         C5p1KYqWBgMZ3fTqPI5lmRDle0bSEgToubmr4CQ+Zl9+bsc4X2HOzDHRYt0OJSQOCFEU
         wmXwM/uFvluMek92n5nU+Svs9hxP6Lnkr1drr5egxgc7pEdNcuoza+SgJVU+9z5BIX4t
         nBqQ8UPmXjp+ICPo+I9zgXB1OhHHhCyjhzpy6dYR4OvN253or6cIcEQOELiLjMINqQH2
         D9MxhWyJcgeWl73wHZAdlg/PMvq8jl7y5NjNL2ssYzoTsp2DOLpW0VsEtBYeCu4IJR1Z
         spLw==
X-Gm-Message-State: AOJu0YwSHvlrYjHtpzsCG87T3o0LbdVtLSYuLLyygPy0qz34K9ukrsxi
	Pm88DCP5sWIFnGvKEy7P6HI0ByfikHX8JDqJUIIdtqaWYNNX+UsXODnCSOFiOh9xzkEs9lpHSQ2
	9SSsNBuibyIwaksmtRQS06e5ZF+kEiofBZdYsZTQqOpLAunj/vsBdddPxCafS6S2tYR5R3afo
X-Gm-Gg: ASbGncsKPZHk36d1+LN8wxrpgP/Koii7MBNfzHw3+xCNSwK2pJJK1dEFSmzGV0EX4wb
	QFeM31bR1KYB1pZjHMQ5+wGLYakfkXxWxfF3gGjaPIHf7rzskESudpjJRhz7BUhZ7H6jWRvIW7Z
	Ew3G2NFi6AFLR14B8fm+pj/ORxrYfraBh9NbWGVp7vSNF3Y7i0vuKTWJ7somdpMvt+Ix/uWbcfA
	pf7Oi4zbN7nkXEf9hAx2OD5t64fX1sesg246ouFWUNNArc+2VCMFS7oc7kn0263p4TyGFaS5qE8
	1neBNcJyTQZY49hRSd1RGx0Ykwaq8uEHw4U=
X-Received: by 2002:a05:622a:450:b0:460:9026:6861 with SMTP id d75a77b69052e-46c7102be4cmr82952681cf.9.1736590569474;
        Sat, 11 Jan 2025 02:16:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbKnV/v9Y7xtZ/lsEvPDhcI9HeXBzrrHAPAicTsOH8LPJnx7Wcrgu8KbVeasp8ehZ3y4BjQQ==
X-Received: by 2002:a05:622a:450:b0:460:9026:6861 with SMTP id d75a77b69052e-46c7102be4cmr82952551cf.9.1736590569059;
        Sat, 11 Jan 2025 02:16:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c3cdsm2548085a12.1.2025.01.11.02.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 02:16:07 -0800 (PST)
Message-ID: <a087a20a-04f1-496a-adb0-1462bd79b5be@oss.qualcomm.com>
Date: Sat, 11 Jan 2025 11:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8650: add OSM L3 node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250110-topic-sm8650-ddr-bw-scaling-v1-0-041d836b084c@linaro.org>
 <20250110-topic-sm8650-ddr-bw-scaling-v1-2-041d836b084c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250110-topic-sm8650-ddr-bw-scaling-v1-2-041d836b084c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FBszjtHUbTiRG3YKixHNUpKaKL8A19J7
X-Proofpoint-ORIG-GUID: FBszjtHUbTiRG3YKixHNUpKaKL8A19J7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=785
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501110089

On 10.01.2025 4:21 PM, Neil Armstrong wrote:
> Add the OSC L3 Cache controller node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


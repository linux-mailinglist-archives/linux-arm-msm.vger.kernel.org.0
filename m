Return-Path: <linux-arm-msm+bounces-41796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33D9EF288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823E7285E0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94CF22C37B;
	Thu, 12 Dec 2024 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4tNv6W3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D421E085
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021606; cv=none; b=Qy36vY8h67r7/e6l/w7auXfoLkh+aiqLhMIH4jpRL6iMKObZR14ntIK8HuIIBgdCmWK9xLshr6P8PIercgTYdJR/eyHKnZTPBb/cNNhXHA1BF3kgTzZ2RCwX83wEEWjCkRckITbXiqjk9qcZSVP9z8tICzbHhGGsIR2XU3a7mMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021606; c=relaxed/simple;
	bh=kEb3ESkZIpLBxO6ChQiW2DNV3iem/uNx8Umljn2afxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xy0dyn4cx/PLej/KKlBv1/MM5K+iRZ1ihma3VRii0VopzMyltbgCZJ0pqhzP966yw+G92ak+FgLjtywOZ8P6BpC3kR9HHv2W8/+jtg2L7Xp+oSa2vUeRzs13BnOFWrbw6pcGZplNB97MsqsSBKIj47FPENPQWAzhcy270p+DxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4tNv6W3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7wCvG030187
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEb3ESkZIpLBxO6ChQiW2DNV3iem/uNx8Umljn2afxw=; b=i4tNv6W3zFrwF6Lz
	U/YjN2U8CUtzwk18QI3LAExBBwxyDKk65ly/sjvMIkaeUu7cYrlLMiGd6WQDoCBL
	oa3fM/o3kGxJLHLgPzbjgrKyCf45BuktOChaqTl205j+kSqmwAfMDbshikCc+CSu
	l4JZ7gh/2kwnj0Ci/kURxfZjxiA0SF9DJfJolm0eXyNOoWvrLVJLiSQ5Dpxm6Si+
	bTxEN2d7CdcHnCLn4XQFBlf7twbsN66Nxl5+02UrxwlCqzSd6kysEkcrScSgw5pZ
	PcdR5PI7UZzY6J85ehJWHK8Kfr0+46pJ5v3THx3GIvfYkH6aDc3+z6gSmrZ1PAhs
	fsdYRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4c11d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:40:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46748e53285so1691561cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021603; x=1734626403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEb3ESkZIpLBxO6ChQiW2DNV3iem/uNx8Umljn2afxw=;
        b=Zxg4xxwqdaIY2vALeAixJRq3V+/jhW3lSGZYH5j+C+MRio6bdYmpogzH4R5QNk8D5W
         5IOyQIMIaXiXI2k58YlroYZZPS0T7vUMWDduxj5Fw4+FT+y1Ug6nPDd6RF1fxqgQt+qK
         GOVrPfT6dOErCPTGbU/lQlZ3ulUToLb6aem0m4pq9DaKU78NmWrcFZ7Vf+YvxHSXjcMw
         i/fHYwttfywz1+jc5I+5WtI5Jl/dpZkJYI4pIK0nMZ4MxlyEOw2+japQEQfjHDd4LG/k
         eqkD2VDxtZgXGvWV156QQTYYvhgUD64d+C6bTH3NNVorayUXZLdQS2fiiq1Cdk4LkL1e
         4Ihg==
X-Forwarded-Encrypted: i=1; AJvYcCVWN92Ge1UdAJGPLxLCB4yGJISMt0gsZJQCmnLOlAF2mvIL5VDNqKs+CQjHAn27bwlFcQtEJ7iu7ld1AlS/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9SWK95eo6LiWnxDT/f/aLHaXlG+0RvdwcCVhsBiKcxAjtf0T
	iHInI/J/x6NpwNLQFW0CoYxAkULQ98Q/+V1A8iCE9TaYg95OqJC/yoXTAtGQuTE0YttJLtlFZkJ
	0kkUaS4IPa39BTMguD9Cr9k3NG0Z/qjXhr9QIDzha08wKYLUQY61lrtZGlfkTgu95
X-Gm-Gg: ASbGncvSHPlWRhI7HvASMxSYQfcRlhxa8WyHlw3KTaMhVzy89y+6xaxZ2w1CEqbrhpu
	VaGSwxIrMGV1+VH+C3MgzaW/KrTdGKRXH1KRfMMS/4tsTr0meLlzmXDst8q1BKbYi2KIU/IbXCl
	DIsXycp+lFCtQB82z1qJeILpQfxJX/zxPiXQ3Un6eUyaE+zjr6ZO5O1/Li5B42+RMlGEuU5J7G6
	jV525vVa6GNjJ6UEDhD5GCXnewiOfo8KExhGIQtbYcT3wmY3y3u0Fn/ucD/CwXn3BwQe+L+erPm
	qlWGZWJZItsKtbqoQ4rmETF0IJQ8jj8MIl+lsA==
X-Received: by 2002:a05:622a:a:b0:467:885e:2c6e with SMTP id d75a77b69052e-467a14ceb0amr6505861cf.1.1734021603231;
        Thu, 12 Dec 2024 08:40:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLvFj8TYhHqAdCQaswyICMngZInZ1e+XWLZkhVURT+fAjQH7mI/i/omj8bnfV+3LE8tBfFAQ==
X-Received: by 2002:a05:622a:a:b0:467:885e:2c6e with SMTP id d75a77b69052e-467a14ceb0amr6505581cf.1.1734021602915;
        Thu, 12 Dec 2024 08:40:02 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69dd81272sm450830866b.161.2024.12.12.08.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:40:02 -0800 (PST)
Message-ID: <1b25b929-b14a-44be-acd0-b5f4f95241b7@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:39:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-10-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-10-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uzdpgo8MrVnLilVjU37q-BhDgFPydER5
X-Proofpoint-GUID: uzdpgo8MrVnLilVjU37q-BhDgFPydER5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=798
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120119

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> WSA881X also supports analog mode when device is configured via i2c
> only. Document it, add properties, new compatibles and example.

IIUC, this can work both with i2c only and soundwire only. That's
not fun to describe in bindings..

I was thinking, maybe something like [1] referencing and i2c host
would be fitting, but now I doubt that given we don't even need a
swr device node..

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20241112-qps615_pwr-v3-1-29a1e98aa2b0@quicinc.com/


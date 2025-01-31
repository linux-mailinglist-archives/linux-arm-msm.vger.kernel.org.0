Return-Path: <linux-arm-msm+bounces-46598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33580A23E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 13:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC7F3A8016
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 12:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF711C07FE;
	Fri, 31 Jan 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLVsKmkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E21DFF0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328121; cv=none; b=cvXu20hnsq5FrAuiV9wJdvuuyOm5eESfrszx+Fvj1B91DQRccJwc2bDO9ao/Ip4A60v2txSDuhJusv42xya0qGRB1sFEMIFgjxK6DEdoO6lVHwUmPXtLfBrKMvHeqUmcOS0FetuDAYBtpq7+brE7nCArpEuXRBSii7ZhvjSCwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328121; c=relaxed/simple;
	bh=4voU1ARq8K+IDYbZ16Vqqk3bx5a+nqiyeDrprWrgBcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCVgGmuxnPR83jaGzGmq/PIqHz7IwbxHJ3mUvgFkoUBaSs3sy+IV47pTH0vu2k8jjkWkw/K5xQ/h1OMwA6uXQJieT0BVguAoXNG9C26jEN9jnNd5hSLFtST+EPCXqWNZ8Ioc0JXIV5gk/m5kiLvmuAWON0yu69IDEPYhX6WrjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLVsKmkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V6eMwn029854
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9XMNZsakzqgTSXYDETlQtlmDuyrsoxJIFMvbaSU3N4=; b=NLVsKmkHYSjWbIqZ
	MQB2yb/RkXJ+u2FIffEgpN/ZExXvwyIemQ+6691RcJyl/9n8kY5T/cCxMRpjKo/Q
	7HhbtpLczLSwt+QntfdBrp2xxFaAqqQ6cQPy+MyGAgECFSZUeso++p+5FCQOuUdP
	WHTQ1/EPEspWuXWmAXmcBkQp8ZQByrmdpWOQcjMFTpNRr1Ur3Qo+LI1SGkR0Py7S
	pa4HvKqDU6kED/UK7og9kcobg0tyYQ2r16xzyGiBIBBpteAwA3RIfKj+3p1ktUuG
	0g6T2VS3Wtq7tHHksDPdVxJR+r7frxUmbAcV6QeyvhB65amBETSosToY1t34qYtP
	SflEAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gses0rkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6f28dc247so42250585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328118; x=1738932918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9XMNZsakzqgTSXYDETlQtlmDuyrsoxJIFMvbaSU3N4=;
        b=B/0tVW5IDD0h1Qmoo9ScpJcYFWKGg3AAI/c8i3+aB7DICiT/aNhCweajG7Xd5W2tg7
         6uIbivuQo7UIUxj/XwWvCXTFH3J2KU+5He+lqVeA/VO9TYMHRKczl9f7wcl9uAGNiZ9C
         EmmhZXN7Epimow2t9j/OOZkZbSe2BP3hFAAjnKlxZUjKQzE93I8S0jRG2q0p81ekI9FK
         lIbi64AB6TWg59VQX/L8ZdqEnooDXUepWkrFbB3wp3hZNBzvaXOhyKQYMPH6s0OKIKPW
         D/a0Yeh9Dm6vfNEs+8C4gdm4B4ggt4C/EP5DD4hKVpHMAr3cWp67B4CnX+eVEKo2ye8Q
         ZhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA25C/YAaUfJ8ddENGSlRamKm4PZrLUK8wYyob4TMzx24L1JAfiS9PEu1lRsK03ZCNhYafFDw9jYdjfLSG@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOwM1h5lXzygUL7Hd3UpA9zvrsjebZd9dj4NY6NzjfWn1AjTq
	YXU33mxZdt4rS321Juvaasuo+iFKF1qD22h1PuvQgaM65YFIVrzTFefsGtrWKbFrxPxUCnmAmBy
	ERvlElTCSyx/2vUuUuoRp5U4iAGfuiQhKwuAnoD75EYiDv3uYw17RxHffhq07WC18
X-Gm-Gg: ASbGncvjspk0HLGEy4lMJI65TZHiX3yAK200TlMy9vQijTDXR4FP8GQ3lVS9DNlXKSe
	JPvED3ARmf2tplf2CvZwr9ckCQsVa96aSi48nF/E9fmGR2e7ffJ5Az97V4r/vpgFgDFyoIsFbAh
	oYzHBqQnTIxhTXNEGH61BbwfjIcb4KhJrl7/1GAk9C4d56u1KtC8zAX3KiF/x41/yikRzW3E/yJ
	W4AkZRhqWbDtjeBGxAXzvP9oUk0PK6XMXDkydAElFDl4xAKqq/XBoGe/GdnLt7eT1q0KQ1cVrdh
	fyJNlwXqQaBuWyFYfYiSiDqUwh5ViT7jyqGlp97JiGwcOO+NYOmboZ/llFk=
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr600533985a.12.1738328117971;
        Fri, 31 Jan 2025 04:55:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMVxyaytYmw+jjx4Ac97ZKB2a0FMxruFitQESJaPsVpyHuARSgtzgS3LBseJLa814PhTou0A==
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr600531685a.12.1738328117549;
        Fri, 31 Jan 2025 04:55:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c93d9sm2787473a12.68.2025.01.31.04.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:55:16 -0800 (PST)
Message-ID: <53a8feea-27a5-473c-8d87-852008b88fc7@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing resets to
 mmc blocks
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-3-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-3-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XPg_oYfbvp5SmRLJIbKWxdW1kTpJnBCf
X-Proofpoint-ORIG-GUID: XPg_oYfbvp5SmRLJIbKWxdW1kTpJnBCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=947 clxscore=1015 mlxscore=0 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310098

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> Add resets to eMMC/SD card blocks so linux can properly reset
> them during initialization.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


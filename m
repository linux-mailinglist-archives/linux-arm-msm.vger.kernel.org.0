Return-Path: <linux-arm-msm+bounces-53272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C5A7C68E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 01:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C8093B6754
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 23:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894D01C84A3;
	Fri,  4 Apr 2025 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMiuflqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2D415990C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743808099; cv=none; b=osCN9CyHSui2hYWx7DX8+lAsxgtVEzvnV8MDoHo0GXmGfbSMMaFj7fKOtHgKzQ/tcqjf5qYbb5beqUSpXzcxF6o3wnFRrZano+E0EM/sqfRiF3Z5FBT6vXMScx+XXwzjYWraHnOXVTOYa675Vqz6jmLtZzN77O/ogLIvlKDwTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743808099; c=relaxed/simple;
	bh=PqFvShj92qaGVbauaVytIyDCuf+VfPjCh/kPHIG9tzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h01//vA/cJHgoF5M/WhaQUZcLg3/T+3md8pyXnoWmIv9RdMxqgzpYILJIX8s2oVt3c4zeLZ7qMXZH/Z+JeN5iR1Ea92p7gainM0PuoccYR/TibCnzRY7GJyQXhYExGCnGP5Tax2srsE4/BuvvsKuuPBk6q9Hr1fbPyMyXhHxExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMiuflqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JFJCZ001265
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 23:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgbvSkQhhfBvSUS6o+osFT06zTOepRW6pa2h+jBNXPo=; b=kMiuflqqt7A8IsiB
	aQNgwSgDX/4rN8abjFQgUdWal5YPYp9YhyEbDGMdACodXc8KSp66KgJ2v3vkI8wh
	44/2M+L+Il7esjfGu3gTXlxbiiDOOT2YeNmNKdTGHlrOYnIisueFhUYzhjDvz1/a
	MuGdnZQnlUuw4xjqDFzeFQDj9P1cWQeuq/XqGVunCcOrcO+OKtnY9nsCB4iU9saf
	j3NrOAfu+ThiWgg+X+kIss+owH+1bleKhBp3P6dd9TtvTocGAiLJ7Opce+V0SkDW
	XB0QyKqGyO1DBu244JQZU0LVybKIfYiuuEloZFhMS6Kerg0kjVSGiD4i3Etxh/9S
	fH9vhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8u3d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 23:08:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5466ca3e9so31808785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 16:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743808096; x=1744412896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgbvSkQhhfBvSUS6o+osFT06zTOepRW6pa2h+jBNXPo=;
        b=ab1fnABxijJKYy2+C6rjR/JFbniV1PvZmlwc86a//Bmqw5csrKSGVNcvg67gtzUkw3
         qnxVw0092aRFzFOoRzW6QNo1+5lXMDtwEdbm0QIb6at28bALqkZTTGYW8KaaSDHpQEqz
         T8+Bwjr+XsJ8pFD/URE9S4Erd1fEG5ZtBu0u3VPi4gKqtVyLDLiU5Y7yMGh2Z1MVJU4T
         s27VlQRGtetfgg7qq3Rk/EmL8B3YJWmiDtiLZ2cPUSNySHJoo/flEekcSA/fBpqB0Tz/
         5w4lIS5QRWHEAAQhlU0gQTbuylNBELIsR4ELWYm3AuHS7v4+x22OvyjjGyJIQ899/ZNc
         J6EA==
X-Forwarded-Encrypted: i=1; AJvYcCWEht+WmcZKxjagSKaqCOTyrgOaPFAMw6U9P9Ej7KWOlMBqeaaXbSPzudYkxpsiYn+yvM5CXjXU9tL7E8GY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50mtsywvZH+FUUL/h0+qCh1hTF3oMEKOLIwBRJi3arotl0V+O
	fBiBWcyQW+irUqTUjAzMoZFrgezmVSnyppeq6RoTHiUIF/wSRd1CruYCLJxb0kx7CtP2BtA8G+p
	jCr/JgaCnT7mAbPhHUUE9Z5DtHqiGUHNaUyInE42Z48vjzxBPqm62xc82rYuHRyYu
X-Gm-Gg: ASbGncvZ4LudnONnvyZEhm15BPxiFF9bHgAjGICuG3tUNwwRib1v8aEMf3APbNBavAe
	CFnsJhKMiP38B0NhaXFfIMCNeqQxkcsfu/YLHgec/rueI4FqHa8OarOZcy3VuqBRerBOH/gxgvS
	CsbbUMg0tv41rHb1wlVBvr24f+Vc2BjxxaGUk6+W+CNw0X/EEsXIs+hexYDbVqLkhfEyUF+MTJX
	FQoiVCIaL5qZl03AItGsHh6G7I5Xowg5AcNxkmynZGpw8GnYZUn9+LC1ZDxLI47O22aLTIoG9+l
	gK3oH1ZKk0rpD+Ljv5aTke3ovwS92wTBCsCw8jefXXIyw+4qwcuIvY2f6CHmo8pAGHayWQ==
X-Received: by 2002:a05:620a:40cc:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c774d13d6cmr255813585a.3.1743808095971;
        Fri, 04 Apr 2025 16:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuEN/s9si0RjxkK2e8Gy/4GKq/tlSjcGV3mTg6/gNS4N5w4gPzjun5kYd/0gJiCctmo6dNvg==
X-Received: by 2002:a05:620a:40cc:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c774d13d6cmr255811485a.3.1743808095663;
        Fri, 04 Apr 2025 16:08:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d442sm324211966b.26.2025.04.04.16.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:08:15 -0700 (PDT)
Message-ID: <b1a3643c-4007-4c32-b2b3-f3a1fe78773b@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 01:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e001de-devkit: Describe USB
 retimers resets pin configs
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
 <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-1-1c092f630b0c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-1-1c092f630b0c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rgGwaD1wSfviufjxYUqQkmQRQ3FzcAgc
X-Authority-Analysis: v=2.4 cv=IeOHWXqa c=1 sm=1 tr=0 ts=67f06661 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KgBs3jkt_KH1y_X1VH4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rgGwaD1wSfviufjxYUqQkmQRQ3FzcAgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=902 spamscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040160

On 3/18/25 4:50 PM, Abel Vesa wrote:
> Currently, on the X Elite Devkit, the pin configuration of the reset
> gpios for all three PS8830 USB retimers are left configured by the
> bootloader.
> 
> Fix that by describing their pin configuration.
> 
> Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <linux-arm-msm+bounces-86848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A4CE6C53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0294930006E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2633C313528;
	Mon, 29 Dec 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xw2YxRya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpJ0hwBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E6DAD5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012865; cv=none; b=sQ6KUZHIgrFAYrr4UEqItAbkqgVfAyl7Bv9G3wB3u1++1fg4zTecCiCBc5o/E3tP/3rSGab5mWwuP1wdu+ujYwDGdzktS22eTWCBQ2lSLngsMFjXVUiKvHZ54agEHqNdF00T5H47AXcamTldvPwLUIrM4DMzVNZ/p99V+rBG2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012865; c=relaxed/simple;
	bh=Ywq+qat8veOaPUJ/o2Dy8je2/ymLEQvhBnUFK/B0CTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=quRfR04dKa9wqV0xkA0jB5xKWPsn9yHs6URFhcX1Bx1TMQ8UIQkQx0lWuSgJlK9xJfpVY53IkShX+7EREgeM5HaY0XHEkgrSD/j7/ycFxfNQ+n7J/kNhsKZzO0V5aAcH3kg3nW/+LCULRBUW7p7sduJVzz0zA5NnTBpI/GKdxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xw2YxRya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpJ0hwBI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA0prT4095501
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLVhadAPx+W4sRb+akST4Yy+lIb9kNuFObaO4aJRIsI=; b=Xw2YxRyaxKqNHnd4
	CtFJRDEln1KJetD44mrVjxwDdDdNgDJc3MsFyraWmuhqZ32QvYmoqIFDtglDzwFE
	TlClHBu/PGShuR4sD9LS/bBOVHVo9KmRGUl8RUP5UqMGdO9SCwOrdY73jCdwwGzM
	VjqigOwdlFH4h5rNxYNYOlp0d3DJQTTeS0LdKydclwXVgKbEA385FT/dv9hSGMgg
	5ia76MY/LEUv8rzaoZaUveG35XTcYITWg3k0pIsKpNjV03+ZHWfqCIGyk7caeApt
	3b8SBOmBbSudod6madHa5d1w9caJl37rH10WnvFrM9ncBvEaZzzWXWjYIWZwTuDc
	DfnIaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5maj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:54:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea2b51cfso272518785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012862; x=1767617662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLVhadAPx+W4sRb+akST4Yy+lIb9kNuFObaO4aJRIsI=;
        b=JpJ0hwBIqto3FH+NoR6tcoQIe3C4bt50SAOjVMyWDzFyHph7k6jasMGMrfhvyRmUbC
         pajcsYbUyK3XsxMHuvOjlkSqcFMLOXTJNw9DsqZV5QVQfPcu+fysfIPuF2Y8Q5vXGEAd
         gONPIV+7j/eQGcm4eoQYIBy2Jv0zlii6QFZWCYNapoDCJQrkgR81X9HxaeercJZCIMoO
         gMULiyL9jnC74vwv3c6J8tPS7FKbK6a+LIcw6L8PnY+ocWpkKwE9eZ2Rb0JSc4vCIU//
         6fK2xceaEjPEiWWiEgm/9arUSTazqjaqIhPSOW1R2YNFXF7SLCuanNlmMMFmAqtwJiiI
         N6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012862; x=1767617662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLVhadAPx+W4sRb+akST4Yy+lIb9kNuFObaO4aJRIsI=;
        b=ati8JhtO2WECk7R4yjupIBkR+mAfXbvRB+JD4mTVONMGXh4BpPk7FN75vgEAnpjaQ/
         CFQQRRZdvZsifObMYOmj4farNLrsacgq9b0Q79W8xg8AkFktQyWYW4bHXs/wqgDDohXC
         7BFRtgqew/C2GJQdzry42AF9HhVIHO9rPejR2OXEyd969Ym/App6zM7CZbUxrSxqpbxS
         qdi0RK2b8RXB4FK+bMqJH5EdDZ8bRNyIhtmdMoU6TRc5U+x5HyZJCGUiIl8uOIoIfJC2
         BipdxPYYVXsnpPrKLn4ZIkSfA86XTMQg+wl3bBGPupFTqMBYSquHh8M1Zz6XkZM/aOfO
         ZRUA==
X-Gm-Message-State: AOJu0YwTgWxuI8LkmYLfv7XmweBycPhqUcdhS0HhGzjBEXKDS5MTMFks
	8++WGYeaYTul14gE9KhjlifkzO4ER+7Ej2mK0X9QVeB/9tSBNMFSRSEEDzobMT1JKOv7gn8wKtJ
	tvmLK4UadavhLvrUXCYXcttFf7ylWxJopyHYrGO0OYwlqtD3EXEfvvHy4W47ty4ZsCqTZ
X-Gm-Gg: AY/fxX7pc/YqzEavAKwHwg09pTiqPQjLLr6hOdza90q/RA/0+f7j4E910vQDU3Rg9gE
	kDTJwv2sRAuhQGjIItzSLy7CUQrFOISPvw7V2xWhdkH6ox9Owe77UPnYQPAZVsaqtCUDFY1uw9l
	B3M5zoiUJ55vQr5RbUcBTBDByEa93d3mfvoR9sQ2PEqKvchL/nx69dlbhWjyzvX+GcirxvnSqpg
	54BgNd8U1yU7deV2dtQTBAvVHrcuKV07A8qVMtx7c3Tqm/pQq2eqcby5KaGsbioOVO9qQYN3cK0
	Mp+o8ajbCbxEAS7k8Q/hQkBxjoadlxdIfKrTMyKsajdU4NTtoEajZrV5xTrr2lQmjNkw+iGZu6l
	54czAFU2jfMxZR5t8F3z6b4CH9gBoen+biHPune8MPzt0tb2UdEIm2gimcSvlc6oGQg==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr317143851cf.6.1767012862082;
        Mon, 29 Dec 2025 04:54:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDTbH9paS8iD+8PShRAogQ36e3KaIf/wn4/5WKMCeQiZIf99+6FbyMDr76P2qUlp1RiOn4SQ==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr317143601cf.6.1767012861632;
        Mon, 29 Dec 2025 04:54:21 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm3311502166b.24.2025.12.29.04.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:54:21 -0800 (PST)
Message-ID: <bd496706-4cf9-4829-8cc8-322bccf58e27@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:54:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: add QCrypto node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251224-enable-qualcomm-crypto-engine-for-lemans-v2-1-a707e3d38765@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224-enable-qualcomm-crypto-engine-for-lemans-v2-1-a707e3d38765@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mSbRjUHL17slyA5eKGqTcKAEl40KptYG
X-Proofpoint-ORIG-GUID: mSbRjUHL17slyA5eKGqTcKAEl40KptYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOSBTYWx0ZWRfXw3zR4wgpXQiA
 HwxHfmquVDO409QHCg0P+2H6I++TZ2cEMNFBGydAkrkavj1R1Lrz8SHpi2+l/DTvVBYF5dOcV5s
 Tmhn46KuYknznI6qVvEufzFi2oL4PJPUC1WRqIksXhrBovfIEv7efJCs91ZgZ989zGJbrMQ1AB6
 WZXYCNj2JWjvubbpMD0DrMw3wum66GhU/wFg1pvxnfr1j+ReUViZejJQNKlR2ydGIl3oU2UZQL3
 meKDouUXuJgbyFmeFXnP0ENMGQQhIae3ubVohmLbMpgn+P+kPqacfzitfXu28Njv7jNc9ZsPz1c
 a8znRcFOWhMcKZt4QV3KyTuMB7m93dRMyp0Ay8i1wIzxIgfEYj5ZszqahF8svgGAYZ8HCT7y11y
 g4WVNOjfjGpQAuBZRz27VBZR3NaROFoWyNPVK4T0Zw7JXckNkFfo/9MUbkaoA1QI4NnM5mcKLxP
 IAcNjHkjxz2mowvBypg==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=695279fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BncDaAcCVASL_8A1HS4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290119

On 12/24/25 11:20 AM, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for LeMans platform.
> 
> QCE and Crypto DMA nodes patch was applied as part of the
> commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add QCrypto nodes"),
> however was partially reverted by commit 92979f12a201 ("arm64: dts: qcom:
> sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"")
> due to compatible-string being miss-matched against schema.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


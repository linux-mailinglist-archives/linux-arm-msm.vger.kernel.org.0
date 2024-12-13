Return-Path: <linux-arm-msm+bounces-42166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A29F1A52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F64162D49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EF71B5EBC;
	Fri, 13 Dec 2024 23:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BM8PfZh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD937190696
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734133977; cv=none; b=KOZah3C3E4mNEzPMIiyRa54aTRCywndHWOIOPOTud/X01hhevI+X0XIDtBuhlbsSdh2wzlH5jVuTLPShmWy53KDr6T/lQayQWf55Kf8cN0skRRsD1V8Q9XhtiSD2yx4e5G4QlLOXcbXf81iZVnUyBZSwdt2wIPy5SsSXfq/ob0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734133977; c=relaxed/simple;
	bh=RfB4J/3OZIKe8oDeYe/PcMGp8YLFFYtl7NrwaLuaBwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ro2fL1QsqlszZZSOdQ3nJkc1F2FBCP+rpGatK3eFOt/MyUcwNCC6SLdAuTWoQqbnu24Ru59whkCcQhnh6CSfzhCIwPFtsnT7Sfg5QE38sRFCROtc2R+nfOv9oprMRIhQFXx1CSOK8Y210OOXaE5GIQWLmxP36aFn0A+We9FTuMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BM8PfZh4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEM6rh018816
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N37b5CHVNpbNO3mJy1xrr3qdkEzMazP7Mp7+movUY3w=; b=BM8PfZh4byuz78PH
	yQlZaa6IQbEyMitNoLN+6cdTRB9IfdxZWGThs6y9feLG8aCbg+PA66rGxdxDGCRC
	ukkX9HzDWmLAg0k5pTxEpvePPWTJ0Pdx0n/3isAdAipHtd1fwPwYPNuoJqla02xg
	i6mYIROb/w7q/BjskevJlLLSXcgFyeSVTYc/TmpC8xO1C84OGW2n/VqwdRZ8Zqka
	Ig9DNXZ7AxT80pzQqc3LASPB8mIfcf87x28Cqef8zhKmHn2YoeJCsYaKbMmOBet5
	JKOlz/qhxg0ChLk8iEj04uTGb8ihT5jSxT1bDgkHMJ2XW9/8mel0AqpyrdhQHEZh
	p6XT3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn2r5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:52:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6dadb08366eso3849656d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734133973; x=1734738773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N37b5CHVNpbNO3mJy1xrr3qdkEzMazP7Mp7+movUY3w=;
        b=q31gQbGqY+9MVSs3Xg7K7DL1CAQiqN5c2NkVpN9oX/G/H3cJ2NPcF2mCodPMrpb354
         N5YBVAYXTDtErLYSvarRjHp3o+4S6c1vAKJj/i68MWxUHhU+s5O/oRYjKE/oe0bWPyQn
         54rCOqS1vXAHDKAAfkS3G3tp1F6r0y47Ba8+rA4o/0kwlHy2urAYQneKF3Cg4wQWbpbM
         dclk1qHI6RQmuMhQ+mprZl1OOOoVZM6R530VNyDfqk6GfegcfbNkiT4pu1BbfIsxz/Ew
         Il1cixYybPs1AOqnrGb/pKz2W85mg+aE5jQcK8MKG0g910jhzuzF3VPaug9uyK9TjwPO
         wWrQ==
X-Gm-Message-State: AOJu0Ywrtii8gzWKFZH5CHkR2UNOYj/UEcPa8NdtIct8wzUMQuSQRk83
	H8w88P74RO7czNwRg3XSGyYNOlZ5v0YedDTqUA9l/yPb2AVUwgdGqVrViDVzOqFoiqXCbvYcLrp
	WXlz8aQYaalivivUbKSVp44zh6k4c8SC4UaDeYB0Dqr3JfPsEUV/PFpru0iwhBJ1o
X-Gm-Gg: ASbGncv/3mxzZlCW2srBy1mOUfA9ozLd5Vul+qHBjXsxXp+8Tg6HDVqTeKTGZ+Y24+z
	70ocq0Q2NAn1obm5Oml0DBGlk3QshMg2aqS6ywYxuMM6KpyqU7SLBwj+ZWJ566+NGO1bOBgrttT
	D1RLe4CgvKZDVHiz6z24ZDw7mG8HUJeIPuo+JPur7CWosJt5e4FJq45s+EZIqUphx88iUf9et7b
	DtbdZ1Uu4GnpfkplObaJ3Pux7HslqUhHlFRE3iCN+/ZNSq43dOaFRL6+HBV5IVnrntnintWGyYB
	ts3RISzfrykYuiyKS6LuSYaKVVxQ1yk2WJ0=
X-Received: by 2002:a05:620a:191c:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6fbee75e0mr248718285a.5.1734133973580;
        Fri, 13 Dec 2024 15:52:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJPdM/1J33q3OBU4K148O8fBOXwXDUj5yh7R2/a6WIaqHivQbWtTXdCwgOTQEJLpcofie15w==
X-Received: by 2002:a05:620a:191c:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6fbee75e0mr248716385a.5.1734133973145;
        Fri, 13 Dec 2024 15:52:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ace9sm25242466b.136.2024.12.13.15.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:52:51 -0800 (PST)
Message-ID: <309303a2-995f-400e-9fc3-c24b5ea703dd@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:52:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-5-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119174954.1219002-5-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oOrqHm7v7NxyMeGlZ_VjIpK31_a1suMV
X-Proofpoint-ORIG-GUID: oOrqHm7v7NxyMeGlZ_VjIpK31_a1suMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=779
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130170

On 19.11.2024 6:49 PM, Wasim Nazir wrote:
> Add initial device tree support for the RB8 board
> based on Qualcomm's QCS9075.
> 
> Basic changes are supported for boot to shell.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


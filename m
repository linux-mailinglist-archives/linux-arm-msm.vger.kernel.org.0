Return-Path: <linux-arm-msm+bounces-51963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6AA68F13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E10327A29CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8421531D5;
	Wed, 19 Mar 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jidskT9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC4185935
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394552; cv=none; b=cmnpmIWJlQwnHJzVh0pKocGzZtIhvZSe3i5ziln1dVh0Ps9izXWlUq+ncwmR9hm33FrO2jTzgMzN/UpPzrEFpgGkp2112VlefSbBejmqxYIHojFhaNK8Shgvvx+MgTNLtuNjkz2eWFDNI1qkQOyJQ5M8HexWzooRDczeJZd7vJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394552; c=relaxed/simple;
	bh=PPZLdfO+H8+51WB+h2FEysHxkXIQ9ncokH62QnpvIBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWnnbVDFBbVkgBJXBD02XjFwFfIaMeClfvekMHDd1Sx8n1XzWGu4Oq1WeG85rL19a9dXTR2yPRmqJkzsybtH4E+qKRhNxMOvDVV6DOGWlbhzGLDpJ3zMndi+rEaCPLC8gPwlTrgSNsaa9TTjBymRrGJhCdGTq6BBhhwaw+pWRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jidskT9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE60o8019816
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l63o9PxYJ7IYk7anlY9p2pUAHNfwefM8iz2O0O0wiAQ=; b=jidskT9GjqqBWQzR
	+Lzssy5tHVmKp3lR/+6CvYSfjam87BvNUP9aw23Fr5zExKzdkBG00y0noPFOyC+m
	og+gmXYakVUHreNTIWlsk0qXV1j+LqHVqXy6tqC4kn//H5KT0K3pfKPBq8Qa5Myu
	udzmvrHvnAJOgRk3Xbyt3JB7X+cre5UzyLi2biuDjyYhtk60qs8RvGJZ1cpWqboH
	0hZyccZ1QMT/UfJ0yM06mNiAdbBRR8KktbvQrOfa4l0sJbyuZJ5/Lm7aOHJN6Rlo
	EFlKh8KR7QRxIrEfdBHJDnw/zDcZ8smU2Z36n8pMCmS1+uRRDIFyBwQzY3qM4jnp
	vlo32Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu3xka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:29:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso112013285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742394548; x=1742999348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l63o9PxYJ7IYk7anlY9p2pUAHNfwefM8iz2O0O0wiAQ=;
        b=IQyoYnNYU8fUzSDKQBaFYLESNik/4A8eRiRW/C8mIiBtQ5a++fsxgXlV4S+jur2iQJ
         p6+YgPKw8wVxG0N0fBsPa/GnggJwEwW0BHArAtwY/+ynOsYKNVWOb2OX16sJ8gRsjIl4
         /bPABqcUf5M0Tj67IiunfmLQhZwxmAe1uudjuENBg0HINEjZ91rD/Mrot5S8zbMBr2p+
         JiyREK7SCz3IcJADqAW3KuTjSlrs4fuxbYKYmXfFIUxn28weypQTb5HHcduZU8ybL/63
         jG1CMH6aq3WWux/MnDymqOrzE3PF6vLwurlEWemUlCXy/WHR0JCLP6blvFb0wNOqflwa
         NnPA==
X-Forwarded-Encrypted: i=1; AJvYcCXQfFuTLUcA8inBcfnv6yb8Da2I7kdzaX2PP6OfqjDh67DbpfOaqQdGlAu5PovarCR+bVmSHadvbkW0bALT@vger.kernel.org
X-Gm-Message-State: AOJu0YwMC3Thc4VlJXCQeKO7OBcKhBX5wBw0X4TIIsnHwj9Ax8th+yic
	V1OaDj3jc9gsJSXEEr9DlPGBQ+4ejUQadk5BZ+upvdMm6TZkxLdmCRiNWYsW3ykl4mO7Eq2Hvgi
	TNc23SfpgEoBFm2wNa0/xJmem+ItPswR9jQIuUzAZzhXcKUhRWUHZU9WN5fLRQSR6
X-Gm-Gg: ASbGncseSMWFrqTH5m7cIdFT58B+40EwQsjSNE5Ux/iOT1YMoFAW8z5boTUe1Qv7yHw
	JGgUufGzAf7KmzXNH7jrEjuTbzmYTSYDdjRo0Z7CQHIIb/GAn1vvkWjNShE3qRfi4AfCT4mXf5U
	5lHPANdlpRNsrOB1BjPXXhzwzTZwOg/AguoGE+Dg9gYZ1lD7MivrkNpBPXMTJzvlcOSTishkZd2
	jl/wnRQIEh4O3SS3dw94H/1grZj9crWRZQrPQh38uMHefZMFsUqzttBegU25KBkper29QVtNCuo
	H76yEzjLig+uoRGSm7jh8qsm5h8wySCg2ABhlMb2Iuqzm7s6rG7kEhBZIGQ5NjMe2fba8g==
X-Received: by 2002:a05:620a:2a16:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c5a845daaamr149573785a.10.1742394548488;
        Wed, 19 Mar 2025 07:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVewRW74gtZU1oD2rXTbBPlZetJJMVDf3b6nZ6/HNqN2o/B9AHtzPooKP8wbpbPMg5EGv5VQ==
X-Received: by 2002:a05:620a:2a16:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c5a845daaamr149570785a.10.1742394548002;
        Wed, 19 Mar 2025 07:29:08 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31484bf27sm1002942766b.79.2025.03.19.07.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 07:29:07 -0700 (PDT)
Message-ID: <a710034f-1c49-4d9a-b39b-d08f6c7c947a@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 15:29:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
To: bjorn.andersson@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
 <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67dad4b5 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=N1jLX2bt0puczyyA89AA:9 a=QEXdDO2ut3YA:10
 a=0t72Ts4ygAavhsGdmO0z:22 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: edHJDZuLsidTSIsFyUhzv6hpAj3JlBKt
X-Proofpoint-ORIG-GUID: edHJDZuLsidTSIsFyUhzv6hpAj3JlBKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=690
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190098

On 3/19/25 4:22 AM, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> The fingerprint sensor, hidden in the power button, is connected to one
> of the USB multiport ports; while the other port is unused.
> 
> Describe the USB controller, the four phys and the repeater involved to
> make the fingerprint sensor operational.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


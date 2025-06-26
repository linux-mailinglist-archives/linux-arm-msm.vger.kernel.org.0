Return-Path: <linux-arm-msm+bounces-62687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9CAEA60E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 21:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEFFD5606F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 19:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F692EF66D;
	Thu, 26 Jun 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6jtoCF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD72EE96C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964763; cv=none; b=jeD9OzhMQGrUxrpRw1QFmRQOONOiyxqtY0rq7QLcNnIpW/3bQnuAtaZTYOKRfif2JKgTjHTzqqCb0QiUHPl8BgOLuWUuBpAl3E8P2Zqy9A9cvR91xirRiJnQ2gjjCBVMxa6BA532CAdeHpyPfyG586f3NxLLeFe775OqIwC7ncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964763; c=relaxed/simple;
	bh=hzWSJSh9ZjdKk+l3TLWOpD9SQ8gWkmCymR4OspvLhfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goY4l7bZuE5k1/33Te+wWNCdHQEzseRwr23NdipJFh0CjvHGkKlHaMSACk84Gu0kJzHU5ZtX0Mzph/s2FjyKgcyf1doeEsl+1cYS9ETc69daG8YinBRQheeFx1sgeBmIJbzbGD6Y5k3+zyDjANFKpZWeMf0qnhy+R8M3efZeS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6jtoCF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QILpvu018613
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kff1UkLbIixnPa65vM8m196vhjIFkw4/no9zeyyQcKk=; b=P6jtoCF7Mjx1xcQd
	ZE7nTkYUwVgkvWEwqHneYaqxGop6RhO4FNLYPfyy9b1eHxzs2QEzJnLPV5dwX92/
	INMT+LbzNNFCU736ixn80YhmoVNQn/4N0Q3rNPhAeEMObna6UneyFSYGW7i4zjFj
	G1kYHN6vDYp/9YgekBJPQwQXJM+dgcjbX8sv3a94h/B+UObVy1ND6bB0XczBsf8A
	GZoTasrdnbacvtTb0IN4gnkmN3rX5hK/RKEgtqEgOl89FlRfSJFvVg9MvXsEMEN2
	MBAPItYzfEv9vW/G/XTNBwJCtpxFVK1VKM9aI4GU5KxrpVpJNEV0cGpxYZg/e1Lr
	O/klkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26er0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:06:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ea727700so17851085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964759; x=1751569559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kff1UkLbIixnPa65vM8m196vhjIFkw4/no9zeyyQcKk=;
        b=o9oAzhBe8rMGFY33g61J/xqGj/bUQbE1ktyD02QsqrqLhwAxrt6+zRo55pqy+IGn1R
         tdYfjTjEkwMKTHGEwf1geFofc/AdDsw8ebQfUflykWyVKFtOdSj+oel6H6MPw1XiB4TW
         ZI9nszOY5ExkEzoC3jKNhjrv6V4fVdQwLSKuSQD4FJijgZPeT6/MFy3TarSDJppPkwOx
         ZP/+fvchagY2U9kLs9Y0gAzPCirOUi2WkOc18+oY7rFk1hetw8Pl5bzmXwPJp4DxQSKg
         KzdaW3P0wTstKJeS08SPoEsrM1QGyFik+yh5Pti58xd4KHx4q744EN0dJEHI8AQXBpn0
         R4Kg==
X-Gm-Message-State: AOJu0Yz6LkC4Egiax5aYhlUloSFQ1oQziSdweeMHo8gG4gVfbAKyC/CQ
	GyemxqkcwnnUEp2UHq++kJ14TZmEdvzAYedUcwVsp/lZB+BaUqs4+ElPKnQ85+GJrAwQcE0zqj+
	qc43FNFvdgbziVH85cOdJ1dl6eIpGHC8e98F/aMTcTjbGU6CfuCXd+fw7a12oEgAbLB62
X-Gm-Gg: ASbGncusJyw5wAn4Unf6r1lrrnQtSVTROwd5zrHVlBV5UNrRaXL5d9GBPn4LXZom+4z
	DmwXIkWOYow3CX0MsdHbWAtheBA+2HdPjpGO8DG4XiiKUXKmNrJkqGiNTBg2sQaZ7uNq06e6rb1
	Wle9PVhO7ecKQMwRrdBdm7jCj+Rvi/qJt8hFU4yhfPhZ/c6a8LaHLkhTdNJPL6udqDwOlwaoOtZ
	Y9ACL5RLDfRu2PXdL8BL6zFM5s9B6lna9UXqZ6K3mvFkJvRAYhsZkGMvFlxVI4OJ4qiROM8Fs/q
	vpfMvqVoUWxLwjOZKJ4l/FCyFMcYpuTCLYoc+C5cxS1IhR6jViPCUhZ7t4dSKlw90jLIFLjqMX5
	uUp4=
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr34374285a.11.1750964758821;
        Thu, 26 Jun 2025 12:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdvfCTQdfFP0SCpdMbBKY095dyxBl7NMLUmqNDaDx9nn2uN6YU/442hwfaXLvkQ2HJfXqedg==
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr34372885a.11.1750964758406;
        Thu, 26 Jun 2025 12:05:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d949csm39521766b.81.2025.06.26.12.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:05:57 -0700 (PDT)
Message-ID: <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:05:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625153711.194208-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625153711.194208-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MCBTYWx0ZWRfXz8t+y5WvmNqc
 gv5b02SQ2KwN3ItfQgcrTO6anqH1g3M6dDKjVuxMTNh5D6ep0x7K3NokZuowuaX1rLkh517S/2N
 pvFKl+xIQ90zdWnQUn1JHZIORdW9kzazURFv6mak8jXDmshG2tbz8azdoH4M+9ACxTK5tMBZy5H
 c0G6pFF821AlmJhxCGQhm8VI7Mc0i8ZZPQsDZd0ydtDp5qauHlM1n7IT1TZ6eFlU/+2LrG0ao4U
 8ylb2tGFMDxwTpWVrI1xZ5cv7Ky+BpvnUVuY6aWnVESngsN3h6JOVBTNhhonhMPmFj3yx08rSmU
 UJ6oir+P/25qA4au6o6pkG8F2ppAvd9wsNNcvv8qXa/DpcHxs/HW0XYI1ok9qQE0Ij+yTsTR3yK
 ma2mZOA9hheYe4mWKlyx8d4SkleMIx70gn2P8JNJXoE3O+2eamvRRXXH5onNNuQ5btu6Buhu
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685d9a18 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=sOBEMjS50dyNa0exkEgA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Rk-MKYTCYJEnBpyyLJ9smSJaxueIHkYu
X-Proofpoint-ORIG-GUID: Rk-MKYTCYJEnBpyyLJ9smSJaxueIHkYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=899 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260160

On 6/25/25 5:37 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

SC8280XP CRD breaks with this.. looks like there's a conflict between
regulator-fixed accessing the pin with gpiod APIs and setting a pinmux:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)


Konrad


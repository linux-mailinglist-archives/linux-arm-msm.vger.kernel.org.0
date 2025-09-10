Return-Path: <linux-arm-msm+bounces-72881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F2B5098C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 02:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5845556208F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 00:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB2F46B5;
	Wed, 10 Sep 2025 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKwuHsJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2163C2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462956; cv=none; b=tFp33ybZ9d33as8Y+VQER5pbPXJoX/5bbncmrDBdamOD5svoYh0nxln2vRzOkoPMcuUu9ZYDTc4p9K4QvSW4eJYemSyxk4Ibe7GrmQ3tZ1pY9GzzpRavMca2VS0JLT/cDIf9wxqcazHGt/HwUhcNn6S8N197ctviPzKCFYxzTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462956; c=relaxed/simple;
	bh=yk5ImnQB+z/3kfgA+C3ZVSqiY7128gf6LJmCiI7OlfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggsz4Z8Bd1mAJhkBHMs6rLhJQZEoTvmYXYahPngd4FJV148xe2RPInd7R5/Yyl+yBfh00SX/nQlamtUzKxZOm6edWRBY5kRnerA0cQxgzZ02i+nkZuQbTBJhSD+wZBSjxienvOQJXrhYPmcpWF8x+OgCWgtZ4tVEfYBp8ecHb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKwuHsJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HZQ9r024393
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8F10QCpUiLVzJPw+UL06BFtU
	zGaST0MXFm7x6XtuE+g=; b=VKwuHsJQhKm3S2BfssmOObPxWFqnlaU0/LA81vn7
	j1qNZIMaUcEf6AkmmSWEvlBzuzjjqNFGY9ZPS6IqLmIRBosjEidIhhihpUAo9L48
	DRTFTZDntUAUynxcbgVmHDlZD6yADV0HCVMOAWASbFvNbkkapmbNH4SgsKiaCOyt
	0zjwIDMLtcdY4ucU252ogdgl+JA0nAy1gMTaTi8hc1wyVdMRPKpn8nOdIjig9Iif
	2NHvRGsSVqJHVhqavKRK/Vc3yGhg0m8cz01cm4Rr0t4yRn9QXydj4yj3W3oBwpaN
	SHuAG7mJd9MKJaF0czQqLBDbdwVEP4cRXMKZjqz7e0DySw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by921y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:09:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b31bea5896so68876951cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 17:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462953; x=1758067753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F10QCpUiLVzJPw+UL06BFtUzGaST0MXFm7x6XtuE+g=;
        b=ATt2c2XuHa9HWqlVtTtsA4muwX8nx1IVD3BJdWIXJ8YV5AReJfZss8P1Q5U3/YjYfG
         KCJAQesvHQ2ONSrHhCDjbNYeaDmM3B9vsFSA0QWy9sYkoQBtk3Y50ANESTn8DIC9qjzR
         9JgxfjqjqJq7RtpEVIAhJS+ENV7C0MfjDdIHRdxdv1g2RXU4zTTjHGHjhZHjuEyISYGt
         5q31W1+zt/+ooVemFTLSoxU12FCIG3bJEjVTs3EMRkZhku5yOTZ5k0Sp/BTnkyKHVhi9
         Zxrv9dVVyw2B5HobJmEx4i0Aio9EW59h4m3R0GgvJf8a4am2KlUUwJR4vG/A9nzzK4QX
         gpkw==
X-Forwarded-Encrypted: i=1; AJvYcCX4epWSFwxFtYNa6YFpWf+/LkB9ybhFUXvcjwACwv/UwuRH8t/kJcmujv6L0x2jxWTMn7rNCA6Ra0mWD2iy@vger.kernel.org
X-Gm-Message-State: AOJu0YxyHmk4wHKEA4360wO7CwDAGljrKtn6rs5PxKT9iMt1WfKdYwNe
	q68jJB9/Hd3T1qBcSZOLwB2eUoEugSDGwgbEOI8NVFuoHGVgE4/ndZ5MC9BYcQGpeAZ5kO63Aon
	TAeaecfCSIimLrOTouENa2zPGdKhcZTO2yRmBlmcvYOQpsr7Q/KObFEFQ6oP9tjfua0fA
X-Gm-Gg: ASbGnctqFdBIR7uqDUlZAKjYcJvxO9cgXPvILFM/GVKzjWIM9/8rF61LmabP1lZLATX
	GNUq6jFjPLN2FuH0N2BgNzaTg0AnbzqzSXfZvY2U36bp6z6Vb8s1pe5Hr9oFpdpNFsL2qg+940u
	dSzGLXC5AkBX0pn/2onKFSkgKCiw1FAqsDrKrfvEGLC+7Up5vAxdu6L8m2Y3VcjYURrTjqoyGA9
	G7RZuikMg977zOKTcLaVhv8cha47X6iT9Unigbty7wJ54h/Iolb9FSNNjimc7gfSxwTGE6GMe5X
	GD8H55UjguIK22RBi/lXs2jOR/zAWlnGW4Y/Y9mdDoD1U1dmg+5t1bfQQtoXdJ+cQX4JLS654yC
	IT4FqedTNjgoIJ2iMxB1cuHnPCnlJ8QpESm4XB7d2LODtf969JAzq
X-Received: by 2002:a05:622a:cd:b0:4b6:23ce:cf20 with SMTP id d75a77b69052e-4b623ced62dmr19655291cf.17.1757462953159;
        Tue, 09 Sep 2025 17:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJos9tcQgpDw4j08EtBm9ODFbRFcMGqjf57yOG/Oy0HUY+141A/XYaXvZR3DqcnI6SyZbBlw==
X-Received: by 2002:a05:622a:cd:b0:4b6:23ce:cf20 with SMTP id d75a77b69052e-4b623ced62dmr19655071cf.17.1757462952706;
        Tue, 09 Sep 2025 17:09:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3380653144asm36061271fa.27.2025.09.09.17.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:09:11 -0700 (PDT)
Date: Wed, 10 Sep 2025 03:09:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: enable camera clock controller
 by default
Message-ID: <mrc4k6gcf2sudvm6cghnnpgz57hw5jv6a2xt4bacu6b22sibcv@2i4i52vi7jci>
References: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c0c1aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oxRLwV8hnwBTO02F5ccA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lPPpNzTS9tSarZ8VnPsWvgss_uv75NyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXzzKAbn93LIKK
 r1ZeEoI44IwCS/pIGpdNholKE/CxU4OA1d7Ly2PJjigvG2PUvcFUZ+ksJMWlqPAFJYKAJmz+/AT
 /RXi5AR6u99K1xLPxoar3AwwlhScgp84j8Hzf/REvPIQPQz9SX2Boh76qB73V554bOb13nIG2Bm
 d8Sa+KbqPogXjCmSqKExXxix6XkFS+bgfGd8/VGq/0SkA6/WwclQ/KyAzD2mMgCxe2dnSKmnfab
 to03v4Kmne5MBpM15XN1oFLVKubK+K1XKN177oxkDgtCz3xNZ+h4APjriI+Lo1cb7peENtZFbYY
 U6aqYAQRxJKQtyuUd+jwz1GIu7iYWeIF6aLMBasUqY2iaCxMMGCm3oVk9TspB7Jnlk18S5jn0Qb
 aFmX1uFO
X-Proofpoint-ORIG-GUID: lPPpNzTS9tSarZ8VnPsWvgss_uv75NyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Wed, Sep 10, 2025 at 02:55:47AM +0300, Vladimir Zapolskiy wrote:
> Enable camera clock controller on Qualcomm SM8450 boards by default
> due to a reasonable agreement of having all clock controllers enabled.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> The change is based on Bjorn's qcom/arm64-for-6.18 branch.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


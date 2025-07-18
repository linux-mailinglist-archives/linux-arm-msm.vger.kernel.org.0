Return-Path: <linux-arm-msm+bounces-65709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F0B0A9EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 20:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7FA1C47BB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFDF1E520A;
	Fri, 18 Jul 2025 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlBv1BDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D81E5718
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752861768; cv=none; b=mtxHfiLnejqATxqHFLLRFW9Y0oHaunAaClq/2GNdOzHpdmw/o5aUEzdXchwLsQUarULEJdkNEW8yoQeu5C7uswkJaurQDreYYGl6bxik1KcXnLUxJtxCr4GICIGe9ravTD0sktY6msGAl+X+Gx+1Yf00i5tDBIfaVnG/XD41fDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752861768; c=relaxed/simple;
	bh=ZMQVxjcZ4u1K9IUYXf5lFTqRw0TDlpBU1zJv1xX7b6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXFEXretCYm2D/2rMXDLR/wrZpmONRMYOTF8tR+t3q9SPP7M5k+7y3smB4rVX+CYxPSsdE6nB0C/zYepcHA0LSrIjxpFUyta42dWo32SqdrKAd8NBx2SmbekVjO2PxqAl/cPE12ew5116lnl+t6CQuMp5NsF88X8N1B3rbU+bmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlBv1BDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGOPgJ015738
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 18:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SFlicwMuaMl9H1w874hFttUH
	ryovYPVC6D6myUsxgMw=; b=RlBv1BDjcFuXbXDYbk6FXeHa0StMwFFzr3+UP3RW
	08ta8xXbk51wb60bVnp8nk7grsSwYVcvlsJLwwJ7k6bC4TQ09iuYljD8xJJbB2XW
	A1/877F2AV9yjN4zUHokhRfqfZdCz0oV6h5nm7W/QkpaWNUOYTEUgwrRfJQscOJU
	/C/71/roxi++lqtMUXC4jQKrJF8OE0wT3sYXBF29hq4Tmq9OVHHJRY6V2nVLygcx
	x/Pu3DcIIBehojMPZ7VDVRsoeTe2S9Qjb0RHnwP+0KBVIAiF1jbzttRrvW7AjjsG
	md9Mbx3QSt+WmS8o0//bayF9mAp5uFYhhoYCXljWDp//lw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyyeww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 18:02:46 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2ffa240fc03so1698413fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752861765; x=1753466565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFlicwMuaMl9H1w874hFttUHryovYPVC6D6myUsxgMw=;
        b=Wg0UJIx5CI2sQ8+8w7htpu5tIclq+o/DBSsBijYZK7/um9m80gGDcF5bgi4TjKOidB
         AqNwlhXiRBpMmnUy1qQSQOCVm+zXiWPdPlR27munzHfBUFQJst0gT60jyYYjbwcDW1Zt
         1TBe/kLhqkgoOayxkpToTcnjH5v1cAQpZRLNTe1sjsdUJ5MDzfG/aRAb50gsUzJ4b3vX
         qdNdUE9sAuUKSnsADkWWp8VuDBi8vK6B928LRp0w24AwJephdhSi8VSKf0JB89J3wd3o
         dfpqtLlzK7RkK2oGb0h0Io0bwkVCtq58P/APnwm8GIpgc0DAZdP0xbW/BJseqTrobnlD
         p6pg==
X-Forwarded-Encrypted: i=1; AJvYcCWNu4A6LdduII7TxrFGm+Sk4m3KmJfoRVYxS1O1SrQ9G4jSxWR3axsVXhywW9fo2JcSqfhx0zKpJ62DdbEu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41Ro9gyweYFYqnmweCQVRQMopIfkSV9/XnU1sKkAWKPTexGGF
	zWUR7PHoE0CDj1I2iV+VwbHqpKVMBEMxRtdIqxPNeVJm6Wz2AuWYislXb8S+5KF3Bm9F0RIgQYZ
	7NlGBxM97rx5u3HYLAeJ85ttmtRUJERrVXarmN7inpaezdqP6+8JvQNp+i/Jleuy7XuPU
X-Gm-Gg: ASbGncsqvcngbGX9tXjkZJoXdWKic1kzN0/KRalaJsO+e/p1g4S/H7f3WtWPdZvrHds
	ZU9q1T19CtRo9IwRgAROgjsQ7dPv5srWi8eTLwX4earcBhn/v08YANwTmJvQ4rN5kpDBmMhUgg/
	aKQcHHJH4J63YPENl5KxLGH7nV2bgGhWE/9UubqvY4GXZ3orMAV+2ZOnTk8K3NfYG0FU4ExMtDY
	YqDYYjEkiW2h/4VgV1jtiELfGxGi+0lA7MGv9jjs39Zoh8iub0uLGPJ8q23cw3+6PTLRnCuTo8y
	A6hP3Jrcv0qhcmvJH5q+hMfoVDrwCkQvI4unXXM3z3BzKu2/91m00GCuAzNhNTZCt087umlbeMA
	iaZ0ndg5olYKYyxPw/XRr3VnLKEA1S/olB4iPMjHm52DWCojEiLLS
X-Received: by 2002:a05:6871:522a:b0:2c2:d2b8:e179 with SMTP id 586e51a60fabf-2ffb223dc4fmr8946884fac.4.1752861764590;
        Fri, 18 Jul 2025 11:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEVjjKezrsu1NYnvqFe7iGQyTNkmq+wUMu6RiaT0vvLy+hq3N4akMOiv69zLcknV3GFGKHFw==
X-Received: by 2002:a05:6871:522a:b0:2c2:d2b8:e179 with SMTP id 586e51a60fabf-2ffb223dc4fmr8946814fac.4.1752861763913;
        Fri, 18 Jul 2025 11:02:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91036cdsm2993051fa.26.2025.07.18.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 11:02:41 -0700 (PDT)
Date: Fri, 18 Jul 2025 21:02:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Li Liu <quic_lliu6@quicinc.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <qedgprcfzy3uclerm5atesk5wvzjchgmh6wztcibkpmbonvyzz@rgbc4blhcgcb>
References: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
 <20250718-add-display-support-for-qcs615-platform-v5-2-8579788ea195@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-add-display-support-for-qcs615-platform-v5-2-8579788ea195@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bsN2FrpKD8VV_ZW6q-upJI3E27PyIh0s
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a8c46 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b2IyaSue4eXt-_9sqM8A:9
 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0MyBTYWx0ZWRfX1e8PHMlUUYJs
 dNkPaJZXvXrJ/PAgdD74BHcL5u0YPC1fe+vh3Z30bJdnc/B7GhqFlXlHpjBSgz9XSCVTvE65rsC
 y4rYI8Awtt8X0OgWv+u4DozAiWgIJUBI17ttOGL1JOzZqx6sZE32oOtt1VIFlK33Nmfru93b3l3
 rzeeDZHHplWUd1wFYloDz6TiHzJyIes2gm9yRcHqttP7akeRVnl9hWmN3d7ddzO5UoZi4DL14et
 7SBCGXJtuC0xYV9DRu1uC7723AhEKll45dF3UZbpSZT8jHu3+RtU1iTHD7hUKGgzLvOOTkl9umz
 Acj42UShNQ4IdomzrCFrAKEQ1pfsMV1WV1EllpJY9LPEfhrKx8lU5ouSh36jz9Uf88AbiSUqYrr
 qZ8VYjI6sd9smpnbbt9Y2MVkq70IRC6ylui7DpYCvBFvN8WQ7oZe/5kch3nb8hcqMxpkykh/
X-Proofpoint-GUID: bsN2FrpKD8VV_ZW6q-upJI3E27PyIh0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180143

On Fri, Jul 18, 2025 at 08:56:33PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 90 ++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-87741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C212CCFA83E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6FA432D0580
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAA13451B5;
	Tue,  6 Jan 2026 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcsvUPbO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZr5z+7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F88D34D928
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724175; cv=none; b=HEx31/f6wQ/TwmTEQX92MgUF5lSNgP4OMYsAyuJ2RPgCb9p9njGxN446z8IfOOpgktTsZJTvmBrt75u/8XJ1VLrUb+W55rlRCrMpQWhAV4A15oewNr+3yJJazs+dd4PrCdDHdoD4xAOQErtUlHmax7Gm7pJK03mVp4IOtV+fpgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724175; c=relaxed/simple;
	bh=EKwgbRjyFc0r5AWUEnHVthwLynoqvUWqfKVMs30yVYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPypSEFy6A+NZ/SVjZf2aNOUwk4F4x6BTKyfMdkbKI7e7IRU/nG+KqcbikZq62QskUm1vqfSLm1SfyLU7yvKjVV1W0CuXn2z9wO684H3tIXxUdPZD39rgGnLjchYPjFB9CtDOZvONqA/ldWcVa0yMg8CtdVoB0YkzEZ2TovFFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcsvUPbO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZr5z+7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AhDni1462988
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=df7CCdKJkxiAg99DIee87WT6
	5pqufwMeHAjkXo8qe+o=; b=hcsvUPbOLiqzS7Mn7GRcL2+0oDRo3kzwSl9vzTHx
	NCgsZoj+3HjQN1SYvAAwtYk3pE4y9EB9xRyiXWIs9+dko0cg5c/BJ25Tp2dMZ5qG
	MPlS7diJQvn6PwbfIKL8LhSwgKdjcd8GAZLl5fknjn1HnYBbg7RhIuIM5ibtn8P2
	wl1umhZ+XK5lvfFrAptRjQ9aYlNAclJAz/eu4xifLVFznbLUDQYiZmhUHGV44h7s
	JFmLVY6P4lppzdtbjV6v7Y8jfF+0lo8URmOL+uKT1gLTq4/S4ehyWgfIhMXRdytw
	ceUYdYRGYMKhVQFbr2afQyub0OQTHS2PUbfGM8Jq3wVMvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm1ccv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:29:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-880501dcc67so50378166d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724169; x=1768328969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=df7CCdKJkxiAg99DIee87WT65pqufwMeHAjkXo8qe+o=;
        b=DZr5z+7PNAdYSKAfJ/SfTbqUyIlp/xohcLw6yLktveFOrWxfIWzCI9eZO6ruz729+E
         Q8ilJJMQYAOXLsWuoxzHcnozHuDVAo6rNzK7wVkPnr7woF3WjAExA90yoPpycLxNb6mh
         3AgMKH9gMavMPqGMzcmg8J+DJ0QxSIyMF84/d29dEWApTW8PHEmUYgdI9Z3hhemmTykO
         /F4xRbYiQP0tKt9cXATfQY+2WyQSEV313nFKGp+h+35A4vRkDqgXR3C64FlvH0EAHwhk
         mpOsBZiLjxm6Kuk8oZij1qoEzi5gLm2YbflifDEEGbE5vTvblvQFkzQV8sypMPZ27mxG
         TCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724169; x=1768328969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df7CCdKJkxiAg99DIee87WT65pqufwMeHAjkXo8qe+o=;
        b=hoBLhw+f1rFlKWUIwvp4iI5bAgYkxM9bY3DyQToinWJvcrh0ka9kAYKWEZ3MQGORrK
         o/FAjfZQg5tJOAx6sdxDcenfqhAKw2UlSe4VndZsMFl95jln7rj7BssHkJXzjyrZqNPC
         yiPssQTBz4K7/nvRPioDJ50lDGQfOKLg3bVpww4rPEOlgYVXVbnIv8V3+76afdXJ4n65
         HIWxAVJlLzrGPP94b79QbIPEtMc5HYYZJiTmtsAK5aNSBJm4Jp5q+Mg67h4SziCkmhCd
         nIJRkip3+Z+DqCH+F6X21eWHNMk9Xw7RjvgVlMWdIA7ykDosW48nwPlrzLsQaMjEpFNy
         WGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUriBlAe4eRPRvbUujPFgWfqpg0ZSRYEcGeZ2LECBLu3cxhra/m9gjqL7lEpnErcQJmbH6QPpK9A6nZd5el@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vygrWoQuH7Q5mDNcYS1ROavRRNw4YUkZ4GvfRoBpD/0VF6/q
	y8CIbZd+KL8Z6lirX7eYuzp457PJIVsVYvu00atARsA65SlbhjbkfwwSuS8xEqqOAwsE2yRcwW1
	gmpPG0G8UGX1NKL5iy/3CBEBZR5rYgNMkVlw/H4SuGMpdg28MDi1RhQYXytp8jYoQ7KSj
X-Gm-Gg: AY/fxX44FX0dfdfJ7XSHBJFzIgpYRHj1Jr8sW/G/6YAM3yVytyd7Ybju482d+nGnpDh
	dYc8MNAm5ait40E14GBqkVZUjR4ykKEZYYCGVFBc7rqVXKjzAQzi3ZogiBWbU2EIeK8GYN+F17f
	ewralpvMHSOFJ7YuJ88d4jhffsRqswQ0JLxa3+pvVZxbJ6MFyiT2Ies9kILe5zGJ7FGiC7AWOcq
	iIUib86pOllwv2rnTf6tLLa7nkBHtKxGYVBHUE913Cvxw1rbYOTDkmifttbfRg4+JMtrlccBq+A
	HaV3p+AiThYpejJJmqsIyjvjIvHB2Eb20Eo8rXZlAVmo71/DUb7IL6iOmkwrnQy7O1JzKcmH3SX
	CBN+NljUjpIa0TZgMPyUc1JEXcgH1eBsUkvm1KnhmxT1YRhdrOwsIzCRQwp05yYz1OD5/uZOX0K
	l2BA4w2FU1bkUMLJ9/mgDl6Hg=
X-Received: by 2002:a05:622a:124a:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4ffa787bf6amr57406681cf.79.1767724169085;
        Tue, 06 Jan 2026 10:29:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxJN/WZDh92ZrPdxWZQv073OHQmrZShWs/3kKOTTEht6iTJrhYMaZproAIKiVmgT1svYDhjw==
X-Received: by 2002:a05:622a:124a:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4ffa787bf6amr57406351cf.79.1767724168569;
        Tue, 06 Jan 2026 10:29:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5dcbfsm739376e87.59.2026.01.06.10.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:29:27 -0800 (PST)
Date: Tue, 6 Jan 2026 20:29:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Message-ID: <ihuiw4yxk7zqffidhbaixwzxmqgn5xcnt7ernygiuzm6gphud4@tkcuyqzgl6vr>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695d548a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OD7J8LUZfBhgY_nOwAcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: kiu9TKGhZV5AnmIzAglM3Ju0XU2ktwYv
X-Proofpoint-ORIG-GUID: kiu9TKGhZV5AnmIzAglM3Ju0XU2ktwYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MCBTYWx0ZWRfXwJMoMfe8eqwu
 M4fQZJh5N02jo2zxTeUau8ChyU4VIozCG12MO1w6jfpwQXd7F5vvN1hVXxM2jvXYd8KhecpzED3
 6EtaPqGC605tyNfhz0nGInpX0b7n/WXfmQiMSNw7GU1j+lGXa80+qhVG5L/YqNz5xKthknA5Qoh
 9S3XTTgURwKnyOGdHsGebbNT20dbGWx4jHdqsdq6oVz4OiSgp09wgprrcBM6fRY5hsyW0F3FhGN
 7qUFhseX3WSl9+3LPwJOr3dnjA9o9RNdSysFp8VByv95QOH9cgTIOx6bRvNMw7ISSUDvCOsg7rZ
 mcWeoSZ/1d00TA4l31Qkuc7tXjXbfeokxJLU4cbb97ebS+TXWXExkuwO3Jlm7cpf2gqwiw6WgG3
 tGV3EJIiXs3CDrj0A1OTHqx82m6FTIJf6HKOJsHaFr4xutLJrYVgZ5+CJmHqfuKly/h8poPQRnX
 mQTbYJ91gOToERkUOGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060160

On Tue, Jan 06, 2026 at 05:39:55PM +0800, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


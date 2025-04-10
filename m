Return-Path: <linux-arm-msm+bounces-53912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7449A84DD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 22:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89A99A6811
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 20:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB6028FFCD;
	Thu, 10 Apr 2025 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnkCpYic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581AB204C2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315425; cv=none; b=LYv8idOYEs0d/tPvKA1M4H86bRLKad4En/BmBXA5jwGQEX2Z4+fJrhMLAINokg4ZICHpy1zB+sQ7+gqDxnAabGOLekGuvM3HANiecfgmk9x7PNsxSfw+bryJcVmqVSEevIMliweIExjRmOTFPB7Rb6WdFderqrk5Jq4pSwTGuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315425; c=relaxed/simple;
	bh=NWcPs9dJlr4e72gBYoopMHmE1Hy8Lc7icWGwbBWFask=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCIKu1iUfLuOVflzQcm6CrxYIFYdWfinsdpW3ycpTH5UMIBZUNvwrJS7vH6LJ7hj4t5oXvO5up6wk/zAVxi5TXruPEASr/gvEg1rI12eDeipmHxiodxu63tm7/Hd1V8Or+97/60Oix09ZDs/l9vRUNG6OyUwQjc5pI+f9NAKQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnkCpYic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFtoBQ030658
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kkt93pGWQtZDGdDcKrtGNfoL
	msIHhPGO8JKGQOAKQVU=; b=nnkCpYiccI/XZjH9JnufUDAcgWqucI6WANSAKpot
	zfLpHaFRrCKNPYrkkwYY78e2LSADXdP8ovU6GqRAV1b/bNpwbN1sK7KGCjz/GIJ/
	QC0oR5i5XL83I20E+ZtyA3tIDx41jz493ieotQMaRV1Y8LWepaE32Li2vJIe5IfS
	An0TDqG2VwIC75eyfO/Br23b+yykzJkGMxzvm1EbVGvPW25IseKJClBMjjBV7CGB
	xPgXo1P8MQuFq3rbU4UKaH0/tKhKtctdAc1TmRr16Zna6u5o6/Ow7ZMOsiGwWw8J
	NpwNk/61jFYbDvjXsJzG/5r4UhvqBRTc3bhwfKt6St5roA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftr02x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:03:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so237721385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315422; x=1744920222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkt93pGWQtZDGdDcKrtGNfoLmsIHhPGO8JKGQOAKQVU=;
        b=K/LMaJxAtmBn6b5zOXmpECSx7b5bFCEcpaiVabdp9lbI/4BuhrgUgXCnNe54W9s3fx
         QnMxfJZ0Tauxl/MMMSetzmd9b5VK/Qm8HlQRX3pzlzpMW8VgumIG27vftpKYgzcNkGIs
         CiQuppOOARIN7ZdTMuax+1YdGRUk3M0UQMc9fVc9M58/bC6bND3GTja7j22i5TfEsHQg
         yMvHrwQOHuDAG94YLsjqW4aJ4JHQU1KI4qXxS1oOrmqxryqNoDaGXfUT0fTlgDS+c1Hc
         OhKINSHBSRjmhtwXh+x1XT9ehwif83LzB9fG66r2R4WES2S+UUO3h/oGkNp09PucaXoY
         mGOw==
X-Forwarded-Encrypted: i=1; AJvYcCUJEDJmg0QJH4zi1Cdy4iMgeWYRSUy6+z6coed4Op3i3BDJfrUZnwnSGNWqqoYbXWko6L5CrWTZu0AeivLV@vger.kernel.org
X-Gm-Message-State: AOJu0YwgGx5VIzTcSkmcZGTN6B799a6mPxICwZkuOk8A+G3lY/ya531S
	OR3aQql3sXJjivr8u/bqaH7Ge2EpTvqHdHRLwcs78C+GJs6WjiayVEQcOJ8CJrhCtNX3XC+OJTj
	GgvNS4qvYivHzS8t9y+nHMXZxY9lLQO2kCIUskQKzMsZPv7O9jHNnCJIIRcJajj1E
X-Gm-Gg: ASbGnctI8liB3g6J3AmG9egr1Q823eh2jOTQbB6gxfpi6j48VmN/YBHbPYNtDohcXqn
	v5mKEx9Yg1A1QdM9Vi3uHfEFQq//iSiAKYlLHWyOLQsTsbnU/Xq2NHMm8eE693IRQ9Ewp96/dK8
	LHcqFeal7f+c1MBfdiDc4pmbq+WW0dP7dJP0I40X7RXAmHJcx9JpKbABGpAwzXcQ/BJCT1BbBMg
	NiEnmvpow76+uMcPhXMB+wf4R3qBmuO+vP/0ZqZwfZABRJKeagzPsbNbYlDFcSsbRz1RB/XU908
	Lf+Bt+2uSFaYWTKGUvDo3oV0wDU4CyzbMXkcF92/PXlADZJjeBCOYZrVM5ooAG7RZ+6HybTr6DI
	=
X-Received: by 2002:a05:620a:31a5:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c7af1cab68mr44906685a.40.1744315422236;
        Thu, 10 Apr 2025 13:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErzArwpma2b275ZwbVv4rcYzwYFQlldzDqMMZoZrFpYHV1BBbany2XaU1T708C9/2OcW/Hcw==
X-Received: by 2002:a05:620a:31a5:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c7af1cab68mr44902485a.40.1744315421903;
        Thu, 10 Apr 2025 13:03:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d234204sm233356e87.54.2025.04.10.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:03:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:03:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter
 callbacks
Message-ID: <cpgwcuj3msm244x3ivchkhrvdwzpd7dzre4gbbpcskjxkuduyj@ioazb45ybzc6>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8241f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zO7X93q5r17TlLPyEqMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lyfmErcVp5XnAI42gowgOhdC86pJhdX7
X-Proofpoint-ORIG-GUID: lyfmErcVp5XnAI42gowgOhdC86pJhdX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=550
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 11:34:42AM +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. Convert all
> Qualcomm pinctrl drivers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (6):
>       pinctrl: qcom: lpass-lpi: use new GPIO line value setter callbacks
>       pinctrl: qcom: msm: use new GPIO line value setter callbacks
>       pinctrl: qcom: spmi-gpio: use new GPIO line value setter callbacks
>       pinctrl: qcom: spmi-mpp: use new GPIO line value setter callbacks
>       pinctrl: qcom: ssbi-gpio: use new GPIO line value setter callbacks
>       pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


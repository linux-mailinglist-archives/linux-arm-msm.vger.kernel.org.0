Return-Path: <linux-arm-msm+bounces-87013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A2CEA71F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 19:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC3F3009834
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4308632D432;
	Tue, 30 Dec 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcUq3ATE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8kIGFYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26632C95B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118305; cv=none; b=arXiJYq5eJjFHHhS0mT+oIn1n15SwojU+jnfoRDIlUi5g5gErZ1Ee8PLZT7xSx+W9ganXztEMLWqyCIBfE9Ytgrs26HBb40gjGjC1LblDa/vNzU0bD3OWVBeg2eD8ClSsRiwo0Wt/bxDBSKPB+VRVs2rrgD99WEJmJXodloPWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118305; c=relaxed/simple;
	bh=AsfXHPjfughjCw1oztFOjFkk8oxo6dEWaRReSexoSaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKjWVCb1ys7QzixyC1DyygAkusIyMB9YRE7+X4z3u5RiGfzOF/yNu6ioCjwG954LtzME5PKk873WozUt8uByWgv++sGETX/+4TGwnqu3AUefTLV0CMvWBWI0iiqxmROxMavZ5dwArCap8DVe383qanbcT+DIgfZ8rc4tes23k9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcUq3ATE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8kIGFYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCmfNb2547358
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HPNCoFW0b1ET+3JulFr+b4L0
	SqkCQC1DxA4qIwg6NPc=; b=JcUq3ATEUmLzbxJpIZjjgwKJrX2YQkrbILoNvTKJ
	PqFopB2qaDTGSp3+zgEqlrlZE/oos1WDqrWj7a0wE+miIj/T1IETgS+DxqFL7Wmw
	XG//pFvAJ+pgqNEruX1NHNFFJjrGI7bszquBxmkuVAqP9nSqVZZmn1nvFWoQ5vfv
	SjgOS43JCEVWOZO/qB2s6g2JCek1lEo7VqXI4m5O5qjLpqNFXdtVWim6SX/E1SzL
	yasCK/nhu/fdaZkvt4NM3H3WIozK+4Z7VLWaf72s3/Lj+iGjZIP+oSZuoQcD/O4v
	22qMk5ekGf4hLaVpc/YwzSQZbXJnT8Z0fJ4OEFhoFKZ53w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399wxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:11:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso181121681cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767118301; x=1767723101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPNCoFW0b1ET+3JulFr+b4L0SqkCQC1DxA4qIwg6NPc=;
        b=V8kIGFYqweTYbgul/DZSrZwdZlWJfKLVIWg4XxNqJ0vpNgdsdTyAEKJM3DmDJ7/y31
         kMTASvu2ef1t5Z1BOe1fTfmOSZZdrafV9aT/c03tdHn5zXD0IR1P4SHqtOJq3lexFAEf
         SCyMyMAXmjS/4MhY2cqxMVTa29XN+6NoLnrxIZD/od4DeJMQJqbWB7/4motrd36rvo1b
         uRxxT8E9/LvyHyYyO6QmhKijQwXkF2/W2nIwzd62+/DATeXTa/Qn+nTxbzkSBY0XsQ0H
         AamoNfNu3UtPnC6iiusEXOvV2JmxeaPUk32bkvotVb1Oysc2P0RnKgXD6qtHUVwMYl62
         BWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118301; x=1767723101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPNCoFW0b1ET+3JulFr+b4L0SqkCQC1DxA4qIwg6NPc=;
        b=gH9Gn4XG1/QtzsHJ8WImv0RBWKr17EPhSG0Sq7XhHAas+9MNuwXP5eZg8GklWsyvJM
         c+8KgMNzqvTxzxxs5Jfu/sBdaWGhEfnMffeqOpATDengf/53z4jRpG6ivrc2aozNk8as
         +XwOfAKLvcdzG19gc8larqSUf7HxvKnyzd1c/0dlsmcRBMYj2xc43m95MBFtmpf8eMY1
         lkepmRrGgYmMcTR+4kSPZfg6U3dph4NoGuu03JJIoaottBpwvtQ7Ga9cge4ar5ijjynw
         ZMW6vOaSTG8UuEoH4Mlx1w6D0IozvuH8XSkOP1C3CCygdFinhIInDzT9FQPMozm1fR8N
         HiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu5JgyEqkwBU+5MSmaE2FJ9Y73Oe7qa/HPxOZP/BLBPnT91NWXbMyFD4Mol1Z/ZjBC8fseuzomuTZFdDGf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXhi0HlMH9VHm073TQ7VDsdECKl3aqxV8nPEFJ2CnqWy1jiBRN
	3SZvPFCZ5ZFGe//YhWrpz8zNHwamCaMrpT5jtRcPywb+iiuDkx/S1c4gGSYHymAzfMLG+bRqVX2
	yl7jNQbqtRii3ZQ6mH/xwQO7T072jNLVpLfPuY4Qu/3D/eJnbpXaeyv1QKbwIIO87e2eU
X-Gm-Gg: AY/fxX5Y2egQBfB0eYo1TeDzAFxiAr96ULt5teZ3qNrG9k46pdSBmvvo64yjH5+QyoP
	vwTf968poXSiqIF7j41YtcsEObYh4Lzn9XEyPDnKvS3xeubVZRxaxP6/J4Vsl5Lw9MMwBW4xjt5
	sxauRHoR1JMjVpQmygTCR7AEyDcpJhuxGL+2EtbHMALj8/SnX1O6ocTogn9BCvpwQcgLHsrnPtA
	yCm/7ichTaY5U0+OEQC5S81XWtl8DD0MSVc0CrbsNXuVj+2Nj2YY0hXHEB+ii2Xco9bOh0MX7J/
	lJak4WmYXlvdFe+dOXtOac6BgATBdqOpEBfJ1swaYyYbi7zFvht2PN2Hwwj+J5khmiD/Ky1nj/M
	u6LlNZbuQmxZXyZ6yQAXisMKdQm0ug9nVdDBGpjdYDNSpFqRmoBRkIAeTh9aTOOvca+S5DfNh0S
	ydQNdlpfhsM17ioHe+Pk5PKLI=
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id d75a77b69052e-4f4abdf0a9fmr509773191cf.81.1767118301281;
        Tue, 30 Dec 2025 10:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIGCnUN1Iw2knaNpvsFWnvKFe/sZ9X6NUNsCPxK4IICAv/qOnSJjlR9vMcYrxElHEnMhkGxw==
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id d75a77b69052e-4f4abdf0a9fmr509772661cf.81.1767118300838;
        Tue, 30 Dec 2025 10:11:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5cbesm10707751e87.13.2025.12.30.10.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:40 -0800 (PST)
Date: Tue, 30 Dec 2025 20:11:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU
 regions
Message-ID: <n2tagk2qxv3bhblivjjhrjaahzhyscz4gi7s2vvwadikgphtka@rxv7rmhxbshn>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
 <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
X-Proofpoint-GUID: V5l_NF5cFHDVuqL4YOXS90sPsXSi9Vnv
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695415de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZSAiGDBkxcGykqJOsrAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2MyBTYWx0ZWRfX195hDu2tzAC1
 tYTgx6W6wWtf87BieEUWG4l6Q0j4DXvuLuDRnjoyCpgpDGJHNeydNr9fBvrKSt6GreZ5IRKvQU3
 a+Ficu6xs60pZ2gt/JOYmL0wdqjoJmfUekR3DWsMXe+/yqA5So+wCu+rYTOGX7VPB0Py7eImuZz
 NU6ApEbVB2/Mfr0X5RMkvAd3pFo9/GTPdqtD3BZjwIwNFMm7NC8unF5Ft+cTYkvdn3YJUCRDwNi
 DF08dm6VH353K5RmjTGQ3Zgseenv4L5QzxqTkTJIcJa9adyTXJdQQG+ryyPjh8cZpmkEYyUtNUH
 bEKNRenrxDi5Z9Qs6gVRaavCWEV+dJqxeMZmIEDum+AyR+Bp+MNAjXTyICyE5Sqe6ZzLfjpJcHO
 znRjvSm7h7gzyiWUijwWdupml45Alo7LMpaylJqJ9h4lGqXsYxiyOJ4DZS03tf0uJx+0QpjPY5Q
 WjXcoDucJM8k1s29OmA==
X-Proofpoint-ORIG-GUID: V5l_NF5cFHDVuqL4YOXS90sPsXSi9Vnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300163

On Mon, Dec 29, 2025 at 09:47:40PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the GPU register regions, with the former existing but not
> being used much if at all on this silicon, and the latter containing
> various debugging levers generally related to dumping the state of
> the IP upon a crash.
> 
> Fixes: 4faeef52c8e6 ("arm64: dts: qcom: qcm2290: Add GPU nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


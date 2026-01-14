Return-Path: <linux-arm-msm+bounces-89082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 414EAD21775
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F082E3017841
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F6F3A963C;
	Wed, 14 Jan 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5b1XL0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzUQSqSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A983A89D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427769; cv=none; b=n0K3O8W2M/e/i+oFjNfAaV+jy3kNgJgo4fF1MgllTKF8UVEOKWxHnNlv5Sf9bkb224nLjHceWqzycT6mzFSaPYuKVALnSZc0kYRVymJFYpbyCBgfowmoOxpRbJ2/R07r1Sk4SUx9HpZMf5RyVYim6liP38B5mG6mY2zze5am8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427769; c=relaxed/simple;
	bh=Rf41Hh6Oag68iOrWE1QpC0+XSAL1gkMR7La6D1LAdJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePjrVBDi4030fymsBW4YiadKXlMECw90NpoVrljloxSmCKXD4Ii1mS/q26Pz5n/PNtTfZXVEc5NCaKBBFHA9S0xULellmRsCP1QpItmwwqnowPjrcXaZJQ0CkLhQpbjbcvIyvCZt9kjfxEeNd7PJgRe/6DleMr15DZ0i5cw/iKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5b1XL0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzUQSqSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ELb9Ff2736174
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NFjgwoBJaRJ8olK+wRRmvtQT
	aHz6ADIqJ6R1SBtoKis=; b=d5b1XL0CjIL0U6k7+AOti/YF40rQSbYQebieiPuZ
	OlauTqhCngpQc+sysAEo7GLe2eUAvE1zqPKdXroS+WBKQsOcVM61Zgtuhizkvela
	Zfei5AFHanhAIvnrXL9Q+xv38+4bqH+m6OHa5v8NHtA+OMrCeg+UGmdsy8qCMSne
	TA5lG53nAyotVv8WZeY5MATd17yiLx6ybz+UTAlsIrbu+NRGEiTurygZy2+Ip1gj
	91Ruor/0Y8bkCTFkWjr9zVoeJQcLaYsnUtyIRuARanYFA1weuhqiAeLKOdfUFkA0
	upL5tQQAhxurfWP4pPU6pPRHOuO6Q4bP5cW9mLhqOdkCpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5hqnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:55:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so78054385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427752; x=1769032552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFjgwoBJaRJ8olK+wRRmvtQTaHz6ADIqJ6R1SBtoKis=;
        b=hzUQSqSEr6VN9fpElApNaQ72oskBFIVkvvbxKn2IzB634tE6kwEhRTcP0uhU6m1OL8
         QU7T+8HYMzPggZPHY8Ni8NIbMOpR35wDubpT1EYF5k3OcoZgwrfEbmRaEVsDq5kOdTtP
         zwno6iMUe350cHg7ZzERLtVGgAp7Nl+7tqqOOdtu7AC947NBglxUjM0VjuIRbodb4DIL
         amcpH6FIRTRdWiHX/+7Ubd63YNCXfs2Sqi966JLRtbEvvR8k5N0K/9QGnzmko9mtn7p4
         QaUA34ZOL3qDXmE+8WRJqyX0GHcuZfibIwGUL/yGA+rs4phOo56kEsdJ59+2WkiZGCri
         MDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427752; x=1769032552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFjgwoBJaRJ8olK+wRRmvtQTaHz6ADIqJ6R1SBtoKis=;
        b=d4pFqTp1AjBuOFB7g2kO7vsqgavU7oImrcfXy3XuJHHNdmf4/BQ2awk0ZWSrBgkvNb
         1I38h06vj7cbA7rkhUZi8bT+7+Qp0zh3Nv6kDcUMq5v7QA/qp8/Z8z6VEHUUscsdy62H
         Ps6dvFIB4aJGJu8AhJXlsXHmcEgHn05rAgmqs6Ybvr5z5OGnxUmZsmCaQOvIyOB7BBDD
         ppUGwvzWNyfyhnbg+tcVpF3YC3QTRxz2rasuymQ4s34JPnytBWZ1xp3XyCTt0GGLJWW4
         EdyV176SISJSXc6kd1aAQ3EosIL6pDVP9OrXiMOlBfvBafxzU2HOQc1KhYtBVEPGuinZ
         YM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr16ibV6DSBDNYOyaF74nFMa05Dhjby2p93D5hr1h5RMZ4GHzuSw7MnTONkFgVNZEa2RuE96zznD4Gn0XT@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQlTwFH3j5xNjAaVPdETybh+5ovzBZeRPPuJW3b49xlTmdbcE
	dgtrrR8h2wZ71/B65m/35viiMAnINRwvQF/B9+RMbKexpoXhPJrlSxd4cUYHwClXYGfxXfnYfq9
	FIKfbPvm/ImgGE4B89Iz4xVTkbtGS582NipT1yZcZmeRQHyIfDO9EUOAEUHelA9wHjwnL
X-Gm-Gg: AY/fxX4y2SfIIiBm6VD1FsIWqBoavR1nECccO2Trz78NlFuFMf3SW+aRIpy1lndm3MX
	4HJq4uNKGcpd0ZgSVEHbJsiLilWRLwdZUzKLC4V5DnIOELPSvUq2FlXFHB7QN5cLIoEyHD0GYTL
	iGqRK2rB9/8eU9EQZ2XC6K2h4k1JI9vDlsP19iq4gpuDT803LaGq4ER016o4iN3lH3/l7BlxujV
	lrKngRylQThJkyUWZ49PHe0cBIXPIpW0xJKZdAxfnSkJyJkykiBR0Pi5NeaCLLkbYB5IMVDJAax
	r0MP2ed85NvtJXzWuWTB1BY/LR9KU8n1p39/XVbm+TQDmfly+y1467i7yx5oyO6amllq09Nrmoq
	bBGDgbC2u5oUSq3X74BWsLeyJDuZWyknVXZjXrspoPsX8JLa3jhp1DPjCmadPMpCycZtW8eUNlY
	lbioGPsEt/rY2Y2v1cL3KJZHA=
X-Received: by 2002:a05:620a:d81:b0:8b2:eb66:c64 with SMTP id af79cd13be357-8c52fb1cd6amr671275685a.29.1768427751875;
        Wed, 14 Jan 2026 13:55:51 -0800 (PST)
X-Received: by 2002:a05:620a:d81:b0:8b2:eb66:c64 with SMTP id af79cd13be357-8c52fb1cd6amr671272785a.29.1768427751337;
        Wed, 14 Jan 2026 13:55:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba0fe92cdsm1053829e87.0.2026.01.14.13.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:55:50 -0800 (PST)
Date: Wed, 14 Jan 2026 23:55:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-dell-thena: Move PERST and Wake
 GPIOs to PCIe port nodes
Message-ID: <qaung6kmsrzzfuv3vtivqns6kdjoojdqsaahe4wyfxsnhpktx6@e5qwtvbnijim>
References: <20260114203600.5617-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114203600.5617-1-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE4MCBTYWx0ZWRfXy6KExVBpxQos
 9SabS5mmvu5t3rygDtpHYO7iiQnfcLAeaSd5svD6GLkV2Di1WQTpJNNDwUUb37mR6JrCCxG0d2B
 CAIOeysaYcfjT4fXDtlU8yIi36FMMwu9AurAQU5+BcpRMF8TcWY07nkdn+iuAaaQsuSO0hd4I0C
 0bHFeNb79xWFzcCsiyQ0PkEtsKZWrJrxgAqgWL8yOGEclRjfT8aadWsBjAu3hMnQQskJvMuk6rt
 /8mEutvsgjUEUfWNp2KQJ4PgRd7zo1uZciSG1VVwQNAeH2fBlv3wj7i7RWabTnKNldCUw68+wAa
 fhsb9cfQ/O8kEHHcW7Gks2Jyq+CHu3uZOn9ph9UAmKCZkZlwYEej2dscABp4B5F9oF7elzaj66R
 2Ta5+1czMXqdcH7yMjhQ01RLVy1Y2GqAOXWMF+9sEKGzX3r0+75qXROPpd9zB83lrfpStvhiN+r
 5ZoXTASzNPs80UN9hMg==
X-Proofpoint-ORIG-GUID: shRzLupthhWTFEGSAaXRZajK0CVd7tLH
X-Proofpoint-GUID: shRzLupthhWTFEGSAaXRZajK0CVd7tLH
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=696810e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=a63MunIuUH75B-7c0cQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140180

On Wed, Jan 14, 2026 at 05:33:32PM -0300, Val Packett wrote:
> A recent commit, 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST,
> and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> has modified the DTs for most Hamoa-based devices, but skipped the Thena
> dtsi (common for Dell Latitude and Inspiron SKUs). Apply the change to it.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


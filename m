Return-Path: <linux-arm-msm+bounces-75201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF5BA1877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E378E4E0447
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E682D0606;
	Thu, 25 Sep 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdh4RSoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C248831D368
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835597; cv=none; b=d0e0YTmaCS8LOQKEEM4WML1bP6VUbp+CO1Nvx5QvcF2X62qhzYepM5REAB1liLDVQXDatNSuFXFnezTtEJ5FHSmcLaQwg5WgQZOKoFIvWMqI22b1Zo1WJiDjacMKmEMfBYRjLKFszaO1fgo183rSSy9W0c72m825CfQh8M25SA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835597; c=relaxed/simple;
	bh=k0yjSh2ANN6eecUIqxnDtUriloBzJfvWyMx9nup5pZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUGz/vUhUdT11EGGpZwmbRsf6d8aFxS/yLdKsOHQtVtgZQG5MxScR8/MILyWuK6nFLKLrEc5yw7cuiau6R5vrsvFH/37sAWkfa3+Tprf1tCsrArocfZ9zfdUWbAoIGKPL+Q1k0rW7ewikzDrEZvpJAtqhWltCMH9XeZgVKmNaCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdh4RSoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUZrf005096
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNofiBLmX+3scjm7ESiysXbi
	J9+y7g4bNVHA/dL9wFo=; b=Rdh4RSoDuySpRfTy9imujpPKVMr0+/f+/vjmsEVf
	HnrhSNPCiLvE7k7sHTljl1qX1Ey0TxQtJzc23QhRNgWDhP5E99JRwsABIwiM8pBk
	I98IAZbXKeZocyZhWmK+T0vtFsDQYHW5VIdR08MtvzuSZ99n3e0zdkxSC8LPfCWd
	2Na39j9GFgmtb4EnJjmRgUMJT5TS0oN/d+78RRAJ74kRKvqca2hW8SSfI/iFvqrr
	3J8gjDySCXfCF+kjFHFH4iYjfGYdNraazRCvt3BnjNHp4EeH15clO7DDtN3B1eNC
	vCDvs3pufEoSfTWpO+0SjMVjEF1O34DvM1fga4mP6prMXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db320dsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:26:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dd932741cfso17071cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835593; x=1759440393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNofiBLmX+3scjm7ESiysXbiJ9+y7g4bNVHA/dL9wFo=;
        b=hDgPXJ26cFiFmoF/SiyepZg71H5rJETfPkpk9PrruTfDThu7GrP5U4lqCeBaVoD/69
         FtwwSNXee2ycddKFZVC9plkO639XbNeuoV/FfetRa+Tfp9z1Y7JwRoWw+OAVJ1EFCoMx
         1dUYP0xN6i5YhlFjSHrYx5q9MzKQ+DJfp1BtkcrzA1Fd8bxKEd9Ea14WR531pFkLahkk
         W8kZq1/D1pTRLAINrFld6YNbM4779DEWJJ79P83Jm4uOIswWqr9p6BIqwIp+WBaBX58D
         XoZvjpX699j8xSeCHLO9tJ9fi7d21TYKaZfqD7r+KgVnW88ACZrfWUufSVuvM6k65BDs
         W62g==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7qdRlcNiYsAF3+pGIYrxtb03sXFGfdJoXk73pN9VauFFoiLMoqoeRIipumvfD67Jge3KdGknj3fEkulg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzivzua+5X4P14eP3bONrxoWYJ4pHwp/wItwgKQhvXwV8mu9W6J
	PuDA+B0+WgzO0IFid3V6sGTXUxoFW9NpHXczJLnqxTjkQvUHaH7OhuoeGmtKtPUVkWW0QR80oKL
	XYR+ByWxoWajawHwjAUYqrYCLrxXHDUBPs3wMhK5eaLm7uPxMti8SC2KilgBPSeHFAUW4
X-Gm-Gg: ASbGncu++0qayIq7HMr4a6w/NCcLbxY0RZS37bOHRA1O9DHFAe4XYXSJNZUxhCTqQ+K
	//fPZP1XCWrSUuIYZzkP61vR7/QbOtOHyqVlQQBuTmkm0uRlJDbInemanyfjCgDvsHk3txnj8sK
	SQEUbrMP6scsa+r6E/C13jNFHjx7IR4agpuevK6mmfGmO3Z/VpU5T82IPC+qAR0wdamo4xYswdH
	BFGN/xjRoAn+tw8ldhmczHTFswL0R1R//7NmecccUJK3RxNshAgKCc4K+fvh6+K98iCYEKK1i4t
	CAK+FezfLEk50ecX8LIgRuPGjnURz537hgvGrYuzep8n3jpBTBLgaiN6O9sbteaE8NAgPrj8Csy
	s9bdyT6g+umncP/zAijc93L9XlDRS5wj8nbjTPEG8QDkWcWpkpXbo
X-Received: by 2002:a05:622a:14:b0:4cd:fa3d:9c0a with SMTP id d75a77b69052e-4da4c39d3b2mr69916521cf.63.1758835593324;
        Thu, 25 Sep 2025 14:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJSdxhuD1dfzzIzvxJqoo52XPqJp9hoPrRGGFcB4BT/HealsuaBlfh5g8fOW/NRvXrmYui7w==
X-Received: by 2002:a05:622a:14:b0:4cd:fa3d:9c0a with SMTP id d75a77b69052e-4da4c39d3b2mr69916241cf.63.1758835592884;
        Thu, 25 Sep 2025 14:26:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fb60esm1142055e87.47.2025.09.25.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:26:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:26:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 6/9] clk: qcom: Add support for Global clock controller
 on Kaanapali
Message-ID: <jfcnilahauqhinz7mlsyjcqpovy2bspithahhotqayfxjqbtlp@fzkqchygd5hd>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-6-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-6-29b02b818782@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d5b38a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=F7eGajQwVCTwq7oO_cwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RfpF-SCPoyUKhvg_Zmu9lmWnydl8afJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX42tUBkEf2jCa
 S5muKp5QiKY6bBG2qK5jcAPhyGDJN6X3JGPOxIB3uMa50DkvDS5px9DZS6KHf8RBrAMTqS4m1UD
 3cSnh9w0Vr+SwPqS0rtR14de3e878hDp6h/FKJykigteGo4rPMtgFCjUcI4L3r1dZgycm9ge+9Q
 F0UiRDIvMxFStNcyW8lBxjB3cAfIKvpqIWwin5dQ9WFm8fb+FNUymFAwvAt+wUPcHGG94p4zN1V
 vz3nn60WOnBWLikJRv4OeLupCBGwf9lijyEcK3lVOyifrz5zP6ykNSmqPta2ZbmlQ5yv+E2ZoP0
 eZlsP6U1hQegDBOE1Ln0eTBA8U9FG8DxMQnbsyb1viBP+CXH38fd9I1S/d9gIN0PmBLNC/BHvra
 1ItCmIWuJNVv8f+zfOXhoa5eHXJzFQ==
X-Proofpoint-GUID: RfpF-SCPoyUKhvg_Zmu9lmWnydl8afJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On Wed, Sep 24, 2025 at 03:58:58PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Kaanapali Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |    9 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/gcc-kaanapali.c | 3541 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3551 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


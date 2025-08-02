Return-Path: <linux-arm-msm+bounces-67510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720DB18E89
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 14:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B80189DEED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 12:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A248235047;
	Sat,  2 Aug 2025 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEWjyQz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C31E89C
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754139005; cv=none; b=GG5WqWnnPa4WrO4uLrBckt9epqEip9oI5aTAi5zF7i8iZw65ZXym/AjRx2Zqy/QdBa5vNtPF3Kd9Bg0cT8gR2urSED8DZazQ2itFEJz3+MGsm8xOHMs9VRUg1/M2AwWQ8CnX+zk7P45hYeaX/Eue2VNFEzdIkfaTOhZe2uerQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754139005; c=relaxed/simple;
	bh=DDMxBlOpeXigU7SdNlj4+9RZ77YTA2Gt3b2HP27L7dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRgRhZQNE+TGxHg7ZvtKC8yLpVG3G1tK+tmYmhW3yAOWpxvfdTtf6hoqt5qP+Cwk8ALUQjBcTUzoh0H1RZckGX1fN6fLQh8t0DSYqtywpt5QW+c3fL8xBnWVM4cI2oYRyYXLgqjIvW9bNgAsyXljNb5KL8GuRtLUbQNfcvKdXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEWjyQz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725f2n6009225
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Aug 2025 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=shOOynL8Ccw5asfZKPoZ1X7+
	Lw+OuwsF+Sk8PffaCnU=; b=AEWjyQz2hvb5rWPynNineWgSEZK/fr1jF4IE+SL4
	z0gqtSCLUozdo4OnnS0C7mIqXPNpDCA8cfnv4otHy90lH/iLlYICv2KHev50N1lC
	gF8chnEef6WBTLezUB4Gwc8GAtLJHK32q+dNTRGRMOt/wWJxREh+GDG7zeh/NrPS
	KhHCfML0n+e7oc+AhPxpDk/d+2NJtnie+P7OoSqriQXvrI4u5QezcOGlkqW46Ymw
	vja6NQCtHdF1byJ1aGvgbkNCgRUtTWIyKPaexBvVujf+9UEgXs+CAwSX0Fd7cFFb
	MJHyV/DIqnd/s2wXGv7x+n0o6emUrHAiSyEGM47W9NR8Aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a91rumf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 12:50:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e667b614ecso552058485a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 05:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754139002; x=1754743802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shOOynL8Ccw5asfZKPoZ1X7+Lw+OuwsF+Sk8PffaCnU=;
        b=TEqYuz9nysvXyh/PDsUu+u/fcw3OIxZ42TtLHKF+AbXG1NfkIgrAedq9IkhY/YtWqA
         YgJafX/+laUd4CqQdrb17FD13UYjxTLTLbcVLc6DRj0PT+wtnljsPdc/faLTPEfkJG5z
         siRU+DQtlBMXcTH4HUFrBVJIudY1zwgCo4hLyVk32yQrGCB5zLH8LCUHyLA1S+DQidxL
         zh+Im21US6zA2/TG0EBucOOwW4tjlMSzgaGTXfhp6llKa70dyOWyLJZbEhdqgMktTm+P
         KicBtMmBtz3bVZQd+9Y1QJlkHAZNDxxMUYDN1bm6LKNY55EAJlNyTk4JcMFtkkbNzWYi
         q6WA==
X-Forwarded-Encrypted: i=1; AJvYcCUrFXGVpyupmJfSnMNALp8SwuxOgWO3RFhWyOJji8a9WIdIodXJmyfnaS8G65Z30kMR0BWJiyCQnqDZbIQK@vger.kernel.org
X-Gm-Message-State: AOJu0Yye9Zkl5nsYh5wJa6/JCdKOQEj9XyAAphWNsU7k19fOgjGBrwy9
	rc5dRMfRq64oi50MXDjmzbK/Id+oDoYGKJKI9y0U8UHjpZ2liwDhDPp5LyMkP41PkVwtXifMoQC
	SEL1WcYf3kyRVZx/pi0wD3GUKq4I8Kc5APmDXtOOHOJh2wvatKwTOhoKQt3bFTyBM07mR
X-Gm-Gg: ASbGncsFnIeDrchvMCF+Qgrup13Cd1MXi71ULbsBEpnBGk2SyV2rEcUV9YDwY/WNFjs
	g7I0l56fQDlIQ8iks5S6WKJvSpoT3qtsPBhX3B2bCVCXOHYdE3yBtWzCsISVkZiw5CA2gkpVEJd
	Ks4aAS8ymYuiwS5qKuMhdQNwS+3gwmE/8kH6TDYAXAVgwcl5LRFgtk1l6tvkeFvI88NmaWhpdkX
	65TWBJhTAcA1PvEHrw70NqsW5Y8mQGhNPv+S6aDF0xeZ4oEPyf++gQm9Xsd2HRaBk9vkK9v7uAq
	sebOdXOxVA8G9NkANln2akX+gfCHA41CX5riVei99VHOTCgtWu6iMycgcldSrndEPK76yHLsYUF
	RyNL2gox4rRLS/sMG/3b/QlP6XJlqsM8ePs112nv1NWK+WkNtm7f6
X-Received: by 2002:a05:622a:1ba3:b0:4ab:3b66:55dd with SMTP id d75a77b69052e-4af1092f38cmr51204851cf.17.1754139001844;
        Sat, 02 Aug 2025 05:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkTUAPmdqW3GA3NPJwI8LqzCsK5Fu9z5hE49dbLUGEiD4djuJtZr6faz2CbncWbE7dsaBxlg==
X-Received: by 2002:a05:622a:1ba3:b0:4ab:3b66:55dd with SMTP id d75a77b69052e-4af1092f38cmr51204371cf.17.1754139001330;
        Sat, 02 Aug 2025 05:50:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88daec97sm975399e87.189.2025.08.02.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 05:50:00 -0700 (PDT)
Date: Sat, 2 Aug 2025 15:49:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: Remove double-space after assignment operator
Message-ID: <dnph3mrkujlutt3bqvahvby2fmmmyfzxk7ighvx5kqqfbbctuo@akernmcqntdb>
References: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CNo6DlvwFTJ1aG7yc34phnZrzvjxR5WN
X-Proofpoint-GUID: CNo6DlvwFTJ1aG7yc34phnZrzvjxR5WN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDEwNyBTYWx0ZWRfX/IX2kP/cP2ec
 XScC4InBvSCZzTzQcQ4kufmRKPFxQSevdo9Ge9LLAxW7AW/Kqa/Foj+2YCemo3MwKwRqaqt5lpx
 q3VzwJxgKdcsHT0QiEunqn6diFNK5eIfeReDCmurUWZc/oQ1NB/PqDQE1p8gZlKZSGRPzySyZgi
 JI30H35pUOd7/oCOrubOLH0SFnDr9V2SUsHWLTZ82saTF/KN5WTEzd8UfbODBVGGXmLoPRmUz0T
 4Qcnv1GQQLHSzyHO+2u5819yfpDwRwEGg96EJVfQdbQBR8eSj2KjmiZGCjynmg82JoaASl1a0Qe
 /vJZvq1fP1Prdi/Zr+KJW714q7yBRsKb7b0Ayl1j5qVFNIqhMHJERWIKwqnrbJnppO8akcCjWRh
 d7zlxKTCioB0bAOXn7jTktdEPV7OA2wAq8eYCKSvXyOUzJsBfhKoDPQvdGj3OPzKKomNdfqV
X-Authority-Analysis: v=2.4 cv=UdpRSLSN c=1 sm=1 tr=0 ts=688e097a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wXdJWVuGbmjov8BqX20A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=927
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020107

On Sat, Aug 02, 2025 at 01:44:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is an oddly common hiccup across clk/qcom.. Remove it in hopes to
> reduce spread through copy-paste.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/a7-pll.c              |  2 +-
>  drivers/clk/qcom/clk-alpha-pll.c       | 26 +++++++++++++-------------
>  drivers/clk/qcom/clk-rcg.c             |  2 +-
>  drivers/clk/qcom/clk-rcg2.c            |  8 ++++----
>  drivers/clk/qcom/clk-rpmh.c            |  6 +++---
>  drivers/clk/qcom/clk-smd-rpm.c         |  8 ++++----
>  drivers/clk/qcom/gcc-qcs404.c          |  2 +-
>  drivers/clk/qcom/gpucc-sa8775p.c       |  6 +++---
>  drivers/clk/qcom/gpucc-sc7180.c        |  2 +-
>  drivers/clk/qcom/gpucc-sm6350.c        |  4 ++--
>  drivers/clk/qcom/gpucc-sm8150.c        |  2 +-
>  drivers/clk/qcom/gpucc-sm8250.c        |  2 +-
>  drivers/clk/qcom/lpassaudiocc-sc7280.c |  4 ++--
>  drivers/clk/qcom/lpasscc-sc8280xp.c    |  4 ++--
>  drivers/clk/qcom/lpasscc-sm6115.c      |  2 +-
>  drivers/clk/qcom/lpasscorecc-sc7180.c  |  2 +-
>  drivers/clk/qcom/mmcc-sdm660.c         |  2 +-
>  drivers/clk/qcom/nsscc-ipq9574.c       |  2 +-
>  18 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry


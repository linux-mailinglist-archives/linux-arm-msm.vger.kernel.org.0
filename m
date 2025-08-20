Return-Path: <linux-arm-msm+bounces-70002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C67DBB2E3D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 19:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCEE05E759E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 17:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B843325783F;
	Wed, 20 Aug 2025 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZGc/RFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29B338F51
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710343; cv=none; b=iNWatbJA5ExEXA9bnlDWD/oXOp2hVT3e4WaBizjS/NxIwkHbHIvqady8O6lqfRLA65DtEFkX9QvBFiP/R42lgl+lbknZ4ufCX05geSKMb6e6bS6G/8ZnBPooAhTetai8EeSJBU/7HhB5XgYoOYuRYYsT+16E1nQx/yExOxNZ6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710343; c=relaxed/simple;
	bh=G6X07DMJoJGHfvSbycLea+tudvMXf5oz0RpWYgY0qMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+0N8mFbCLJYbUiq4D9EA/zQWejfgeUSnUTY/EwSqK/NGo/jNExraFM3pBKOaPqAC2QUoGPCID1LKScIDLJB+NA0GaRqvI3UbRRmFYcTYYKxq4rD0ymlDzK+uZHPiLFyQ4NMH4tHG5vvwiB9eSUMfuhCUeuaTssNiMW4gdIhbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZGc/RFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmhu8006363
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4c6VjJCxHwNMdHY8pDWjWO0
	85ZA1m3/u33QomEdPGY=; b=QZGc/RFPA8AMae48g6OvIQGNkf3YiSAQVucXFO9f
	qtb6l585YnHzzGlmjmWsDrhEn4ljF3RlTZMZwyDgvNxpaxLVFcZTfiJQqdMOeH9E
	FLbM6mlrihlzrxjId669nd16XbZ/JXe2WZMfIoZdB8hMXUtKy9o6pMX3QK1djRnI
	VWF3/Rgc8XR88Oa2wHM0cAbOKcf4q2GgmRbYrVNeadAytIG8kLefHEhOu69ks0j0
	BfEcx8akS2rRni/0wFmPEbuQHp9JXEJP06aepQFrYYoJcto12jqPOGup+dXQmFEm
	9MNZhdNAqpib46BnlhCMJJnT82u+/sN7ZeKtbxMS3HHCqg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528tgkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:18:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88ddec70so1912646d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 10:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710334; x=1756315134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4c6VjJCxHwNMdHY8pDWjWO085ZA1m3/u33QomEdPGY=;
        b=WQtWKhIcmJq5J/G8nvAq2LcxNoeSMj+qLxltLqu0yFOzgmJNHVl88RcDBqXBa5q4zp
         Oi23B3KcPPvQef/6xhnzw/+WGrFiBNKu1tfUffouW6u+kag6qYZWPfqIiH4hzlRuvLZl
         pyGvqta6DUPB5wxPuzaCRDok32hj2fLMtCZ+bjui6lpaK8i0MjQjxJ/BgBCjpAD1nNCd
         FttGDrUb9tShVjI4Izo40J/RDjWyz1dcnWvNCZh7iJBZINcb8Xq8U7cItviDzAoCqGJG
         YFOVf48eTvTZWkgrebxMp9H7iPo00rSfrSEByyEAcII7w1qOk7N1VzyWmHqOPqNDFOBm
         Kk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn72RcOZ4mHI7vD7txcP6rIr9Kc7r4z8EoOz2M+q6Abjhd9DCJe3mfQHqpVe5uuNtZxDxQhBdVV86/k5qW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9usjjfXXprnPnU2fUlLmpERP0rQ3I1dJWxtIwkj+DUCGzkw0
	VMXl7hVLkTFYhZ5BnycuMEaf4Yuo+GQ+zQXJvGNTJoJYXm4OTS8bn9QwVVOOB4ozVIshvdMnDoG
	UxfC04Kdy07iDcz+v/TmBHFKtu6Qb//ctZr1ixaE2cl1GYICsRiNd+WPSCQze6Lu4EFSrI88rPI
	TD
X-Gm-Gg: ASbGncuv9VHuirGQhkj2ocihDMsLD9ogxl+mfPv1iO1H35tpxIqVeTg6L399btvdvip
	oA890cHGLHavAyYw5f5cyaMojPb5n/ifUwEEI34ab31iQh5PRMXxLv/j0FPabxD1de+E5hRXqxj
	hLF7zXj6jmGEqfBxHjpEeN3dZPeHxBzMa8FxS2il/a3gXpJLb/+iwK3cV8y7R/Q7cJ3cgwDfRxy
	wW3rCg6g0sgg4pfk96wP6yyMNwE4u+rk5xWnz04qQ7pEGrBJrt1mZWutBCTvetp7B0IlWLg9wcK
	HsypkkN2nD2DAjas1iFruvbN0KXS+H7IS/2hCVQshGPC8uJ2PzYugdvOxNLSppGVJsy1u1he/5W
	uFX/nWlA4A1Luv0ukNDfsZXY3EKd9pvFGTVNBsCe5quUuuEqGxXHx
X-Received: by 2002:a05:6214:21e8:b0:70b:af9c:d0ed with SMTP id 6a1803df08f44-70d770ec90cmr33161696d6.32.1755710334173;
        Wed, 20 Aug 2025 10:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJMbKVOPkMoNV4lYsAx4gpHUcgozCfe+fx8N/3mB2f42zwfWVqWvV8n+duLWyQQLwTizWwFg==
X-Received: by 2002:a05:6214:21e8:b0:70b:af9c:d0ed with SMTP id 6a1803df08f44-70d770ec90cmr33161366d6.32.1755710333680;
        Wed, 20 Aug 2025 10:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f481esm2666722e87.126.2025.08.20.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:52 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:18:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom_q6v5_pas: Drop redundant
 assignment to ret
Message-ID: <5eh6q3hry4zchaptogbxykiiuaul7dkrshzlmfay7w7tondues@irxamm7vt6en>
References: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
 <20250820-rproc-qcom-q6v5-fixes-v2-4-910b1a3aff71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-rproc-qcom-q6v5-fixes-v2-4-910b1a3aff71@linaro.org>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a6037f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gpV1-yxKdiVEvkH9OoIA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: glpWhH0FAqyUSrzhKBKOMmpQLsqx29sS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5ylEo2l5cXip
 aaMdfkDU5OO3jibes6exQ/u7jSjZr9EM8BpfnLW4VIGBWMhnmkNwwX0gtVA/7PLvh7aHzxFTqci
 5Bkt927x32AtA7zerUHLMdRr/33+AqG/dTIUgXGlBoaWuehYH7HVTP6BHEFNKE+GvAe9/IKpmL8
 YFEFw1Ok3wixSgUek08Hb2zKEB+rzA7Ppxgtq0j4x0/Pyh0EffXLjZfpVIpPbS0rMLc/DZP9Qfb
 IKQ2Z3Fsduo/GfvpGzYoT29PSV40mBbOaJx1KsNMsp9raThJ3fQTYKhxC5+leEZH8hf2hEYeZ+k
 JHQhPSNqOiKQiYS/XHoJ7YAA0+4FDzc7Yq0CualHHLEwEw0ZLRFs3l3o1NDDt4AGxxksQoicBi8
 Rr3E2XzRb5LSjwqdhvD3FgKhHQyKsg==
X-Proofpoint-ORIG-GUID: glpWhH0FAqyUSrzhKBKOMmpQLsqx29sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 06:02:36PM +0200, Stephan Gerhold wrote:
> We don't have a way to detect if the lite firmware is actually running yet,
> so we should ignore the return status of qcom_scm_pas_shutdown() for now.
> The assignment to "ret" is not used anywhere, so just drop it.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


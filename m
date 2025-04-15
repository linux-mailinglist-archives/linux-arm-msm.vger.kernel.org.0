Return-Path: <linux-arm-msm+bounces-54365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FEBA899F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CD23B590B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B2228BAA7;
	Tue, 15 Apr 2025 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwPR7RV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DD27A119
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712800; cv=none; b=UM1C4EQ+XiSaIO3uhY14qPop5deh3UYjMpixSmr/8NAEhLLtWLpHNeuqIbSCMboE085VQhas+bTXfAB0ygqVyIGSAPV3mpUsGSBQHfNJtwwOKSmDteqwnrRUO+eG4NULL6p3WNIPN8l5JlUhko8piPZJckMQpa8rinjGi+YVYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712800; c=relaxed/simple;
	bh=8Wk68rfSswMYXy4roNkEMzhagEBd/xVnpM63L5n14j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHs5vsDwx3WcCEQjW4oIHt5TJlPz/Id0G2tYOTANk2Vx1/ejtZ/PSCxdj3zeIUvAq1upQImxAppIugABGBRDtmVyi+CJzmBgHz1905qj3ZPK72gLUpVnKVf2U6x8wmWGZF9SiBCRkPg+nq5cjuQYQ7vhXABV6bGeFpI1z2eSWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwPR7RV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tgMJ002581
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8KNMl+h+dY8TN+P2t92AbEQx
	GBdTUq047ce2xAkYaWs=; b=lwPR7RV0H9w31lCgPQHCfO/3zAqgwzJ7FdTwzR3v
	4Il6bqLaGqihXyXpEvf0aSrybbLT7DexWI63wE7NgP/Cb+59VY+9aJiqpEC+rVa7
	Ho6k8xU5DS7m7jxOG1bQYMHlwi1wPtu/xKGK+EIWGiD7+EgvyS1AvyWaUGoY8Vzq
	IBB/4qG2MZUckTGzJsmhMaUwNxTQGTGFivb0fahp1kWrM/jQreraGUAm0ndR4fdI
	ITvf2Ij/H9Xsi/EYHs6FuXUCN4T3NMcH1u5LDXHL849C9kMWJl1sgYLJ98gDTAjh
	5o5UlLrirTNLh9wHg2QtV+BWtPLUzEyEmE4ma87/gfNUgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfs24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so959584285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712795; x=1745317595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KNMl+h+dY8TN+P2t92AbEQxGBdTUq047ce2xAkYaWs=;
        b=ZaQ8qZHPy5WhqtLnTQtLgqOZIAJQ5pULer3hhincY27ND9DyyyS8YL14U+/wHGwW3N
         bMaHMFc+679ALOXLhRGVVk/mmEoV/TsE3+5BspxBKDguaR1pXUkny0b3xFZq23qN1ioX
         AVwDSq7OjpshHnb48h1e8t2+sz6ALLGSlxsy1pjUV2BUm6iL8zOsx+CgdKOyFi0Ouj2s
         qYGrKIwqQ7lcqZqdUv7MVPUwv50oSofyff0iTjM2iPJeJEe5WZULhVpFGoncaPySXde8
         XJOC2oM56FhgnmOL9y/5tWH/vBzAlq6ObW+KSzSTgPlTMVJTAXJVYgO5uRTIF6wSXxIH
         Z16A==
X-Forwarded-Encrypted: i=1; AJvYcCVQpGV/7l51gxmZUTrFrYNb+CInRk7wYvyuctjIm7AVRiVvO6FHYXqWxn2fC5RrQBIzjeQZQqIMnSG6lgPV@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9ntYJTdu81xhLHa6StC97ePk52sG/XOuo/xfDcOXLuK18FAW
	2x49iQaBZWE+aIq8aXo/JrLJGg6t/aulyvfYYFt+IN6iJZfACFN5US+y0/9PYcZI0nUIF9k/5JE
	KvBVeaF8AfTpM63WXf0wTVfz9IB7rRLC43jKAJkh7Xd7x5aSIeGl5HW/GDRVmHhl2
X-Gm-Gg: ASbGncuva+EAFYAEMtUEd9jON5lY9z+NSZ5OxFrZxKrbl9ZRnYVsDxQJjAa/WnWNVJO
	PsUdSRTwdaZHDtAl7VQm4P4gewcz/7Ls8JgV+2ICwtt3Hw6Lx50U+xMx7nu8fkCrc+UUhkgUgFX
	cFAKZygwSyNrlvDg4C5GP+hoWGNgnEfu2MErRyJELoZdsyPcKxQNn1gTrZ1f1GXCz2SOnheiHOG
	3NdlaZr/0zT7BQpD3iYOXcmP5PsK81jb8eovf8a4vTeItpJlye3BdDbIBNFWUFAHa14dVyTM6kU
	d9hNd0q7TVyuSo9nBYJ3mOinKNwih4HpcVErE3JGkiQOQIW61zX8xCGyAxEeMp9mifr/Dsc7Vcw
	=
X-Received: by 2002:a05:620a:28d5:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c7af1f3d4emr2124437785a.41.1744712795099;
        Tue, 15 Apr 2025 03:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPAUNy95g+BxEoF3m9T+D1BmAcO0ZWmAE4FI2u67ljC8uUUpC++8Ix1n9dNmZZNjqqGE/GOw==
X-Received: by 2002:a05:620a:28d5:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c7af1f3d4emr2124435285a.41.1744712794773;
        Tue, 15 Apr 2025 03:26:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123137sm1387306e87.40.2025.04.15.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:33 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:26:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: vkoul@kernel.org, kishon@kernel.org, lumag@kernel.org,
        quic_kriskura@quicinc.com, manivannan.sadhasivam@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_varada@quicinc.com,
        quic_kbajaj@quicinc.com, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-ID: <x2hqk3yabe3ntp4b452tseyuuen76mtttievka7zgjajxxxobb@srrgiu7k6eyp>
References: <20250414125050.2118619-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414125050.2118619-1-chenyuan0y@gmail.com>
X-Proofpoint-ORIG-GUID: 2Sh-97jLCly0-n3O-zWLQp2aTTnJ9nOx
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe345c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vPHRA5kXY3h_Fp5QcTsA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2Sh-97jLCly0-n3O-zWLQp2aTTnJ9nOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=898 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

On Mon, Apr 14, 2025 at 07:50:50AM -0500, Chenyuan Yang wrote:
> The qmp_usb_iomap() helper function currently returns the raw result of
> devm_ioremap() for non-exclusive mappings. Since devm_ioremap() may return
> a NULL pointer and the caller only checks error pointers with IS_ERR(),
> NULL could bypass the check and lead to an invalid dereference.
> 
> Fix the issue by checking if devm_ioremap() returns NULL. When it does,
> qmp_usb_iomap() now returns an error pointer via IOMEM_ERR_PTR(-ENOMEM),
> ensuring safe and consistent error handling.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: a5d6b1ac56cb ("phy: qcom-qmp-usb: fix memleak on probe deferral")
> CC: Johan Hovold <johan@kernel.org>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


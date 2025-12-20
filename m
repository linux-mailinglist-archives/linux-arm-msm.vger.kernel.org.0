Return-Path: <linux-arm-msm+bounces-86050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B9CD3557
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 19:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EE82300D48B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685072D8362;
	Sat, 20 Dec 2025 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4CYWt8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxMQ/SM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903C26059D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256516; cv=none; b=heKd/A6Ui1Yu0j5mFRuUXpyOPxkRSLi1+6oweLwkslB+deTNnoMKxSFniUKc7cLvJAph2GF3Vm5HQ2mOU3W/CcLO5W+FZVBpIBBer8ZJi/PT90pFuvTSRXXrkaws8jJaA93UJ40mOvySndCzNWIt2x8SRZO9NY3UoA8rGu1lueg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256516; c=relaxed/simple;
	bh=i8iv3/jn9WvJ45FYBYf2EAZyfrj2h7j/zEF+shI7tL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeRiFKA2EUu/CqDX6KzaSM57IUpuuOZ45zpXFD+ALev8wpHmeimhKFZVcIiJrgxdg3aIfMs8gnNdYXima8Sfih6sl/1E6/OTbPX7hv+NVwxt0XuyQ71Dsc6Pl4/A8kPNFJbt4rpRiZOTAKogaR0GHOCVY2koe75NyInYkf5RsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4CYWt8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxMQ/SM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKCUH6T3941953
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xERzpYbUCmTz/aMOCeV3zYq9
	BgDGuXQZs0GEQ4uOY2I=; b=F4CYWt8sbF6Kn4aK8B0PANaf/cTiY4IucBSrbwdg
	cIPsg+kIMuhgsHiK6thMuBGRbHCMTqI2leMxlN8vFDQefL6pqNrJFSBN+YLsmIA5
	6cOiCavPwGP+mvz1JBO7ExupAWV20Bx8zWgvaf+VT5QwF6M5OBevtEsX1msIl6Qr
	OVvgsjmNdmB8+i14yY8vD9+0pqBsQyBp0f03VyViscBhqihruNSFkNT2283aZDLz
	J7diGAqbanmEqnSwHx6SRf4aMLjPSIy7oKU8A1puOHJp2MzJXNe5ZwTgY3cjuebv
	6Wlk8B5IPIHuJXByOZOTIf5O4TgOOVP41rv5z9Mb4UJS/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru151m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:48:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so71489501cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766256513; x=1766861313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xERzpYbUCmTz/aMOCeV3zYq9BgDGuXQZs0GEQ4uOY2I=;
        b=FxMQ/SM6BkaqPstk4RqnmhCCZf8eVz55/ZLulZaLVFM4GeDmDvZ/MjU/T40shLRn9O
         ppGjSCYQJmFzdBCFuCTnaEAVWn3fJEeKSfXOh4ERBm5nNoPNIBFkikBfF2gHOX+wa1BC
         +0qyw2OOK+mC64CZHZGBk4HmIhg1eWkPlPEk38Q8zR06YeaMEU5e4dQkT+Fp1yYs5XFk
         ao1LBvLwY+02WXjjjlrz+BdfTGCdQ87a7+JVyU+VNtJa9hAig5GbasG+rbuJMlYuCi3u
         vNvrJRyNkHLbo+oyhG+7q/+W+BNMSgc47qWUVCVuLfQdlqA4jyVJtOHP7J04gacwm/Up
         MMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766256513; x=1766861313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xERzpYbUCmTz/aMOCeV3zYq9BgDGuXQZs0GEQ4uOY2I=;
        b=kukcKWWQZtg5kQ6BahZO/Iyln/0uXakC+aVuaKjRYeYP7k9eIxF2axynjs452uj9eZ
         ixHNf1B6k0Z2efXXtKCVS1BWqVu2lQI/9Jw7w42x9o7HnIlURg5MDJpJBeoLzeypt9Yb
         GedXfQ6cxTiWAV/WL8ldhLggyz2rR1c0u2XClL59bpl2MriZ8L8vQgrsrsGyjXWz0pBP
         UgJMti73WJtea4/IpKU0Ol5Ww1IGNg+B4uuw8Ci/4PWkAGO2jEhWuKoxD/dcgPwm9HAX
         TwSdtsI9yZWWXC3qShykhhgB8jxQghKhgKy9/Gvvnkgb7t0lRXWkE31eQh3MPEV9wpLX
         GTSg==
X-Forwarded-Encrypted: i=1; AJvYcCWuuAJswRpzzGP4KyCC8aL6fs8DNGAodG8aY53z3CyMmK9Wm3XdiGg8znL7K6Q8BmbLdhqWZYrFHQUmTpaF@vger.kernel.org
X-Gm-Message-State: AOJu0YwAKS/RtV0CtuY7KIMIovLkQkhrSS2s79kDXPhgyhYS7teEW/PA
	erYdIrsALiJPMchNk+qjx9NWoSsoV6bsmNDHSbXmbmrTfezqEJzwOXyi1prou9kH0NyJ2hp4dvb
	+A/bUOcNY6TSdJtld+7X2cOGQNUKchvgrjJazaW7JQgJuOA/mjVon/gPPYyhevXrguhBk
X-Gm-Gg: AY/fxX4UoVyM8xBHA8+wi3gK9ZIDZUDzLlB2OyU7yzzAWziSo2n5FVMrECmdR7xXVID
	3hsLq++2hYoBVn4mLg+5z8qej9f+XOYMrSLplnmtoNFJWd6/lfCFw1AzYiwJYNpHu/Xvbzsc/Ij
	+H/znyIf9QIkas8UgIEsxlpiX2goXxCA3h8MRqGn1/onY3DbnOTHMAMubxOz/SKaSz2AgRxyoOC
	Ilo9EqWb09wgAYC6+jIaRZdB4NTmxjV27G9uzjn0Dgk1VlGCvomRhcLLQjG5to4WxMK2w0k/RTM
	xrBoksu6PYvRL9Y4w81nbIQ65yPM4ZtZhodOgJSZ0Lg8gPefpv7l1QUU6wHVl3KZaocXzYXz7K9
	K01bqAT+Kd4I5n2XXQH7hVsnCzEKGKRAZEujn5D7E78/DGb7OEhXs0cLunSNbp1m76RSvJNITL4
	KBqo98/YgjXFmVZS716ip6tHg=
X-Received: by 2002:ac8:57c1:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4f4abd79a7bmr90473421cf.50.1766256513019;
        Sat, 20 Dec 2025 10:48:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTiVZkKZXhWsQakvsFdgelaE4YqEi4Thf+tWe5lz8p7UM7yX2U0FBpzvG6UMkaGZ9Z6mbLAg==
X-Received: by 2002:ac8:57c1:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4f4abd79a7bmr90473121cf.50.1766256512521;
        Sat, 20 Dec 2025 10:48:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm1709288e87.69.2025.12.20.10.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:48:31 -0800 (PST)
Date: Sat, 20 Dec 2025 20:48:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
Message-ID: <eyaa3yvxn2bhij6wlph2bumvnvb42uaaaarlw4abqvnufafo7n@zruswakclytg>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE2NSBTYWx0ZWRfXwN0drFZIjtdr
 GoBTCNudO8Dk9JYxvdz6l2K4TYx98lxrKZ6MP1Ums/9FIalCryoIIFZlmDeq3FezOwPwUjQmve4
 sebQMrLlcLU6+a7wTnij9bnFtGvD3q9uTyLvWBP8SfGL/NvEwMA2ghcSLtyk0MjCcA7mRTxaRPj
 w9eRHfxhdXgepUaRLHh1nTAe92YwUl0HoIIpER6bzm1WjCGOnCeLJ3RkZgwJcMwJjFi2fTDGaOn
 eNTlHm76YWHFIk0wNK/ApiNuzffAHB0f4f3O7+jhP7VPOZ5h8roScAjNOX7e9s15cDr8Qzb1T7Q
 y1tmEVrr7RLQ24D3cTTYjsYWPL5QxWPaF+/FosJh+mSNePRNI2uuAVnOCrq05cxpTgZNpMXLtY0
 y1V9iW/FSMrIsrDnSVkWYATha/2WwyRO5dky7cKnUbfmU9TYTd0Yb6yLXsFA2m9pUgNO+3Gq1bL
 Qq3IOLeBDrgZVQFZpJA==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=6946ef82 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iJjC-FjJdm91r3in29wA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sOKUQvI4dLuBHrp14dNjrneBkwOB_L41
X-Proofpoint-GUID: sOKUQvI4dLuBHrp14dNjrneBkwOB_L41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200165

On Fri, Dec 19, 2025 at 08:16:57PM +0530, Pankaj Patil wrote:
> Add initial device tree support for the Glymur Compute Reference
> Device(CRD) board, with this board dts glymur crd can boot to shell
> with rootfs on nvme and uart21 as serial console
> 
> Features enabled are:
> - Regulators 0 - 4
> - Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
>   PCIe3b/4/5/6 controllers and PHYs
> - QUPv3 instances
> - PMIC thermal-zone updates
> 
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 860 ++++++++++++++++++++++++++++++++
>  2 files changed, 861 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


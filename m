Return-Path: <linux-arm-msm+bounces-87931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DACFEFD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 18:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37DB53004298
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 17:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06561344042;
	Wed,  7 Jan 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7ommpBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8yxXXHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415C5345CDF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802706; cv=none; b=rwhHhYeaI3ZhBCcr0bQ7fkQZCXpiAQIdrDUEtgzAU3Usyc+vvM4xZ7SjAzDNcDS+f5YtLGCwp4uubI0gOzKhWX2W/RYk0b9HMS5BS3ByrTxELBOHMCIT+keIq5uEjXNU8Ea3ewSiiSpJOvrOFOCvUA9QmRMe1+qbUPquOuhhyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802706; c=relaxed/simple;
	bh=QyFvZY01qp66pSTuvlh4IWF/M+0kAl3dI8MS/igN/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+q0S048pkes0yFxCO2mZHM1jWn/cTN+Dqz2kVhGNfEtSk+SzEPEHBRu0iOFiEFtiPNSPo86WvouKbRfJNqVmCehSRvDNeqQi9FS+bGIPfNjS9DFbdDQdsP8Du8lkcVQ/sIyBVdupY1sW/oWrQbuv7e8W/nhkQsxpLWa8zLqsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7ommpBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8yxXXHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607AWdeI4137048
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 16:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVuHe0wt1etXnyCGWeXSp+IZ
	3Qg2MMH2Kny/0EnRpgQ=; b=M7ommpBtDPH5Y2ncr1awtSMNvETTSlM1jTl+9vJP
	WmQGzKpcCpRugST+xcH7Z+lv0RagNJ3ZEMe3aWzIMur6OwWqMElh6SRhrGC9dwA3
	as6c/lkESylKRgTqvcR6XUUXU521nL83yf+ZKdUrwg8CYucGIXKKLcQm2s7PUWiN
	y2JGdPQ0F+R5YOrPPthSHj64qgu7sE/UFbEA8cckO1mP7n6eGkOqyXUiNT1p2Sd0
	AfrACZnMFWHwgiXaszqyXKUJ+Zdx7hs1C6fD2His0GATr+lbzn+v+fqAenK2O6yx
	vg4roz1ujWe2Z6j5IyU9jKTuSkZJq8J2F+zhsgzVNgYA6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e40s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 16:18:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c38129a433so567464485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802694; x=1768407494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
        b=X8yxXXHDddDwz8KvvEkBCECN0V4T+PD4OS+Iac5M3brcfsJErf2Ig4wAsqlXtYHFwM
         B4U8hhaPl+mbEqqZbwj8JYz5YFPZ/dqFHUw63jaZgzyXPWrvWCu9H9zLw0puQWSUt8jY
         U9nm8nYhNE+vwzGERtn3+d4xe2opFa2N/p4DssAfmgMYray3SMSeP4A9dXzWiTEosRkF
         CDybyEkrKCCQVSrVLFGCM3FjLquR11rfCS0ka5XYDDdHls1v4zHloo1xuuyVljVOt1FJ
         2ghAl+zS2rO3JN+wOZPzeWJFuDI5XGGHLjvwwWbKtCoFQVOmTyzBunmcjQCnqmhc9bJH
         I6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802694; x=1768407494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
        b=g0a7wR7MhXhqDVT5ZSyrUZcS2ao/fnXsOK1qvY3UwsB1lbw6WqXbxe5g40yKffuuKs
         lU7X3wLeQrmUUpeH81h8qUV10RnnNh0T5F/VzkH8Rc6bfNB1TUjGJ5DqFO4J651gCQwo
         e4UvxtJRBKo8ZbnSlcK8fVqb/CwXLWCgBoq6B+3NSdqrXztwaPJu84liicwHHxjkIkTl
         KeJ7PXJRLp1FUGr+6Lwge9dUG5EPiE0pdwEI/IkN3hmXz1jMIe2rGuaVmyVUw1oa7xwt
         2k6bcYS1WYLiWFidQ3o1B8FAstR7kQiGsBvlmtzcximcVxmWLlkWjc8It4FEh1mfxsVI
         kz6g==
X-Forwarded-Encrypted: i=1; AJvYcCWML2bb+p4ZLIDfeIzmKEdah11EpfNPgTB8k2HR91J0KrnSvYlq4/4pjbGWXCix88tq+kntCyLgs/8peAVb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6vRh0Eikrm8ZRPRPU+rTiMB2Z7WH6885aYvVhARYoyudpLE0
	jRUPidjkNjft/SUzqAfK4BvhPVUHUxlAiH7d/L3fsyuAfU1G6jN295AGLW/AytAE0EK/kVDtEbZ
	hE5glGn4IUUudjYb2gPrfnZAkIb8kT+TUREDJzEd5LJeUqC961/TR4S8SKX6Ls1QAPV2c
X-Gm-Gg: AY/fxX4cjISHyH2LPx3Aljb6ufrPH3GlwhCqHFahPiP5RCdLTruZrX4asHTM2lFGlX+
	c91nkeE1WGa3EgSmA3taiLH74WhabYG0D8PCPnN9uh9oGNB20+LCdbOCLlOqlfeDy+Mdq5TJkJa
	vaedDjhRioL3swsKGC6rvbXD/YL/ABoZikazpdr1XbKQEFkDG9wn1QWzpmiZap1eBWcSPBPN0I4
	YANPIoz8M2jNpitbzFs0hKSntLmpFrIodSutS+ILCTnztsO7xzKklc+T5/N6DeepmwGZwp4CZ5N
	SnUEF/Pu7jE2dOe5i4ZZXF/sX+9HhZyP3SkMA40nqrn9tUw+3OY7veBFE4YxtwBpd4V9qneDmPG
	acn43Qh/Q4d5BopQp0zQ6hWz7E2oZSvHAKJgiyda6keyL8+7TqRWx7D6LiBz+oZZYnP0cBVE/ZQ
	cMUNSbZSgEYKR8WNUujDajX6E=
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id d75a77b69052e-4ffb4b5da0emr34184401cf.82.1767802694059;
        Wed, 07 Jan 2026 08:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHY38emXXXkVnOMgdE65Id2wbfbRgInUDB1ehakjGirLO2ZFzXh0B1U67TMsqyhlMzUF0FBw==
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id d75a77b69052e-4ffb4b5da0emr34183661cf.82.1767802693489;
        Wed, 07 Jan 2026 08:18:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65ced9absm1402000e87.5.2026.01.07.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:18:12 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
Message-ID: <cfp2ukahbgay4fbm5bqq22mn2jumj5o577wskrfsjtftpznpa3@cksi2qp7igjm>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX1mfh8ynEYNMz
 s5WFS3v4H0qA2br2qoddXQ+wbsx4eOHYMR0+Lx0AgwkswQ6hJVhKNzd8QxfVxAYTy8U8cnMN2+F
 SCDjM7CfD13sbq1Z4XBgTaLhXjy3g7aRndndiNSAKWyQa4p5kLQCfllrZg0uUgGZB58a2aVH3eb
 LuwmMBEnrVWnQicuqclbxctJePLw0ypouODsKsAt3QTmkQxL4/tAhW7CT0Fn6hxxfXPBblUmRe5
 cZPHNlTyPdLaxQUihpM2Z/xkjp9lcHWD3y17Q9P0z4ps5k0v19yC3UfSqX/C2Jttf/YQ6gIjp7h
 Uc68pWPro8FSVD1tFzuFA2Wae9pXbQxYS+LVy9L4VcmgEeXncHZj4So4JxkZsEsNwXUODRZbq57
 w4ut08gOPYlgF25MBU21Yml56wKgFeqxroknnbS4yZXsZrniJ9hQXO+xG9Wh1mobkDn1I0wZPcq
 C8O3Z7fBCIqdmoq8hHw==
X-Proofpoint-GUID: 05O3eeE-EkgJCl_HIhYDbd91cwgTGwd1
X-Proofpoint-ORIG-GUID: 05O3eeE-EkgJCl_HIhYDbd91cwgTGwd1
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e8747 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0FKzuNh7WTnq1YNKSakA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127

On Wed, Jan 07, 2026 at 03:13:13PM +0530, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig             |   9 +
>  drivers/clk/qcom/Makefile            |   1 +
>  drivers/clk/qcom/videocc-kaanapali.c | 821 +++++++++++++++++++++++++++++++++++
>  3 files changed, 831 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


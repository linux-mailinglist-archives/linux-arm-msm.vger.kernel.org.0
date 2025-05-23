Return-Path: <linux-arm-msm+bounces-59232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB59AC2875
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44D41B68517
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4EA297B9A;
	Fri, 23 May 2025 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA+WO9AH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998BC224AEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020873; cv=none; b=ZsqFe7qx4MnybKO5Om/zd0121LjZ00jEFa05qOGAyrs6blgztXJlA7NCJrQ40J1Y4xKdY50tjtqJzUq0Mc3X6TSpAYolfvWDFLcfJPlICvRIg/rEpOuCh0/G+tGYiHOUklFJYpjjn4hljOzhIv0YNVIirWitVuiSSSfTwly07JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020873; c=relaxed/simple;
	bh=T8wZauKdz0BCeQ/hFygSPsmKN+sR89xhbgvVsyDEPLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7yqMav4YnDuAAubxndP3SoQn4wkA5qmX4hCejTjYuS6H9jc5ejbBn4e/0to2kymL3IOl4K/elZQ1sbO5z5rk4DhbGewGERF58Pj6JaymW2ZvqKrwIq25WxmkfUrkI2i3hI8cv9MAYwPROv1YA7QLJWuqnij/zdsfKqmDcv5YAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA+WO9AH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCgYGY028470
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOeJ/YiI8e12fm2dAGxoe8Rm
	z3Oyrn7Nh3nN6MptXKs=; b=jA+WO9AH+rgfSlKGcCcc9D0hEV8twve1YSHej4s7
	uZSl2MxD61YJJTXPHau9GnWwuOma8kuJt/3MoIePPZIsN0bE5g5IPYYW+XUWUBlq
	t9oAZKpi0BngcwHb+dbw+zWQKqxF4IHwnUjLBktWcUg9cYnbnxZDeHMsgLVC/Rx8
	zHLbrxc7cZUio9ZqDRPvio2lcjQYiX4gjnxsFGrQP20cZRYmiTcTUXSG/dtMQUjj
	CKxfGlyUXhVOSCECGQlog1gAcLQgLjPxP47ICqU4yMAg2R37evj/W4v5MJ/46MTr
	DCmOxYYuuAHLpuW+4A0d8jgYXiv1b4gMEFDNN7T0cs6mtg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts28w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:21:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d0c8e917so555726d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020868; x=1748625668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOeJ/YiI8e12fm2dAGxoe8Rmz3Oyrn7Nh3nN6MptXKs=;
        b=MpfrcCj0X60OZi16YBCWJrlhyw/PKRXd+f6PS3JjYu6/JgRGERN60Ui0oabcldiGnj
         JWpjnI+lCyxgBRokgORgutduDUikCQU8eVW8Zt0yhhUqDx+07vXyap6yoUYNhsJq5HYc
         6slZCxPjhU30dGLkheO5uTVXl+9+AcrWXjVN98YoSQFxMuLJySr3+cuYTAyCvMj0/1QF
         SIEurs5bwIES+CMYdjUzVeaR//WTD+rRZfPZmmWZWdgcIqUSvu78z/b2UoHxvQOjjm6v
         WzhiPzrRx4v8FVqsc/Ss4iNLtsUcvAIp/kScpAIBVKyEC1uM+2KZfP05JTSHBqO67la9
         pdOw==
X-Forwarded-Encrypted: i=1; AJvYcCUVLMz8eK21CuHZY/O3FJIVAdiiakOOJXnAPjq9gO5/L9oiv2zAB7EZcQoWxkFmDyJmOvijhBCRdkC9HJrd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3B9naOmulfFz8Lm7OIStgLcsQbPsUy95MpQ4656jiqzikS0ZI
	9ceKhO0MU5Gn++gm2JHcmnzbJ9YZ715F+mOYa6ToaHBXfk/8Yh7nrbknOm8sWq+DbqVgCw0jYvK
	E6R+kuUM/3Vsb7aFH5vv0+G0U0gKJlK3z3ED7uzAc79BukZvE4qvdn2qcjwcY/WY3gJBp
X-Gm-Gg: ASbGnctH0IWjVJ3jp6TiVet46GHTTEBjIl3PAcxaNPY5wkv1/EyzYYE0w7NmxtrRYH3
	VTg1dU5g7IB+tZgyadt7hIIZENSFtZ9lIDKh25F5KGOSP+mhCrjgWr/AwPE6psZllpReEPzmONM
	ME82aeGJujRzRPdbuRW5EajywpLJ2DGXZUezWvNv3B8cUzgHA/pZv2K+loypvI+7WqpEUbbq5ZF
	b79LNfaAQV+H/NlvEC5IXjr3qbd/l2EGtTyd0u/GvYAm9zbT5956TMbZ7hvQ9v4qr/pHatUM86S
	eAuuiglFY6qedQd0HwXGJdU1/QQG2rZBNojThtNKxrGcO3ShTL+QdroV1gqKxcTijSpPycYxjZc
	=
X-Received: by 2002:a05:6214:2421:b0:6e8:eabf:fd44 with SMTP id 6a1803df08f44-6fa9d164c6amr5107426d6.27.1748020868423;
        Fri, 23 May 2025 10:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAwI+WOeejjHyUSuLpRFabtnlXhNit49HAfJqjK62r1LhKzwWGL9glcTDdMCXNFX/SZfAESA==
X-Received: by 2002:a05:6214:2421:b0:6e8:eabf:fd44 with SMTP id 6a1803df08f44-6fa9d164c6amr5107016d6.27.1748020868070;
        Fri, 23 May 2025 10:21:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc06fdc1sm2032229e87.110.2025.05.23.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:21:07 -0700 (PDT)
Date: Fri, 23 May 2025 20:21:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Eric Biggers <ebiggers@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Nishanth Menon <nm@ti.com>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Message-ID: <z75sarbxjtrrsrew2e33xelvl2oa6auchndjztz6ym3emy6mer@imoqowpg65hp>
References: <20250523115630.459249-3-casey.connolly@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523115630.459249-3-casey.connolly@linaro.org>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830ae85 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ko6UrOkXu6_aCceG0REA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Lrco3TX2F-6dtbc7PFq9XWa752BG2NIx
X-Proofpoint-GUID: Lrco3TX2F-6dtbc7PFq9XWa752BG2NIx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OCBTYWx0ZWRfX7mrd6E78t+/V
 t02rmz3jFxDlFuGbbPGQKO+44xdngDmRBbjgB/zqvuNAvz0qvVITo0P0fN6+Z3EzVsNd2xd+f0l
 r2jLJFoDfSNtAuuNK6qiOUWGq34O4qzLKN796xHWX04uYM3/+AhegHMyJnA4c9iBPkqUulaeD0Z
 Wo4xAosmXQp3Im4eJgf/mLVO8zBlXoR7Un4XpUR8vNeBb+L82oCqqbX1kE5JWwbeEG2E2QVIc9x
 Yggh3Pz04r1EdVPIlnf3uATtBmmnhM7MiXyLtsqqQKtX/C2cDTLbs4bUVx5l6uQfhr71ahqb10q
 zw60jHreXZUjz4g1a7gJxovpDTFkiJVe5aOBjMnRKoViySp9MpXfKlghGxaCo5GMVp2JsapLBPA
 4t+7dSk1Xk67vtIYmT8rwUnog2zFe7QXroPgvJg1jvY2sKhVQOv4cDhN0q/Og+iMya2qmyOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=628 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230158

On Fri, May 23, 2025 at 01:55:34PM +0200, Casey Connolly wrote:
> This config option was renamed, update the defconfig to match.
> 
> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
> Resend to correct Fixes tag
> 
> Cc: linux-arm-msm@vger.kernel.org

This CC is likely ignored

Nevertheless

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
With best wishes
Dmitry


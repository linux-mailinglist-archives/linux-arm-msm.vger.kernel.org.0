Return-Path: <linux-arm-msm+bounces-76133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA20BBFF2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97F83C4EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6F820101D;
	Tue,  7 Oct 2025 01:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjyGWNAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96921F3D58
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800259; cv=none; b=UlSjC5Ptd+84afAlOvKK+xoKzOLgX9tE3zJVURKDeBI62Dk+h7IYoveHrUphcTvdNoeeQ4y9GhQ/ZX+kqDxpoBnSgPU++zp0sdqLa7Zq6NRVnzTqgJCdBrFwGOOhIDBWd3cyvn/VZ4oOs5tRiFjn0m/Ba8qxGpltpGi4yxHvnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800259; c=relaxed/simple;
	bh=K8Ito6N/92UmC74Spy9HYuGQHrNOoq6p4xRrDPVTJ+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVKTsq96EMbjxOfKp84DgxQlusKal8lJj9OFBDeV5uy1pCCJcW4aInIWGdQg9XzWzTzVR8mlNO94pLNJMrhQoGWf0aFFd+tDotqwPxAMM0MwyO3gIY03LKrYSUtbfEpwxoUpdU7vCMxHVTerV3JPpfm+YTA8eQAWQbGmK632Wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjyGWNAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FBlAb025010
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 01:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66P1iIdEuvGo5diDEZmJaYVv
	t9N9VnWj2nfgQmKd5qw=; b=QjyGWNApzIqB97CD1aJHkp4L1wPftj+T2iyf2kX8
	Y5N67B/2481e1p1wyz6XjJtaXpoK6MiO6G1LV7E+dVnre5e1QLfQ6dDTws/OSxaR
	VP5NiXYEkJwIVKrcMQqUt55/0Dxyic6N51zUUuwBtDVfPA7t1y5LiBeCNf4HLTy4
	OO6+i4epvCyjn1wGNC84PshJR5gT0eWb89Tof/4pQjV2RuRYYZJZgBDBdizC7udw
	jiYqU4UpLlpO5I/K+bMiREmq6ElmOiFQyDdjo8yzj8KLump2pBt/Q+wGY9s6sAQW
	vJj75CjdTuB/JX2vzCbKmB1+nBM1AV3uPgiofSZ34zyNhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6a9chs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 01:24:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso168881751cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800252; x=1760405052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66P1iIdEuvGo5diDEZmJaYVvt9N9VnWj2nfgQmKd5qw=;
        b=imJYCo/u0E0U83Fm6VfE0ZfeJJL5x1f5pQV3bBQjru+hvQgluRMh46SkS5zfxNYOIv
         /RKSVbktu8/TGPk/eSY5v6L9zS4uBlCpaBrxRBRNg/cTnRiq6nptCeYOn13sUmAHh/ic
         iqVVn3qi2oe0Rg6vkKBxXyn3G0dPTrj8YQnDUAWtY8/gw8P2fp9x9odn3dO3KRiI3rax
         JD6HiZ1jVQ8sqZjSziI0B6UlifqW8ihNbplwPvIq/N92OSLY+fDBj23Wi6keHeO0fnw5
         j0veGbrimYC9UM94QWYhZ8fW8jx1nW8v91EZuRud2/PO5WafhgaFV3rS0QsGJJlaig55
         4zXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvz92YmMFx14ZgK642R6AMd2FxXgqJhSWFiefsx4LhVY4KGwgF+aG2SvGSiKoYQC4bBsJU3NHBrcJHmTrm@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmej1su2/8+P8qKnY8tC74+27tO1DMglpCLYmNKjvrUeACa1O
	9X1pxmm7cCXVtkJi3OCn/Co6iAB6ej67rYZ2MrLdp2U9vX2q2p3GnbGVIysKGo3FJaTr9uSvLA/
	v2E/Zz6UwCZgR5bKtDQVu6O+eNfn48NgU34Qc7U68HBz/qDv7wxyCsh/PS1nP2GqmZ+8T
X-Gm-Gg: ASbGnctc28C+l+PZOR3Kq9Vnka4m9vLLMEzKp5jLRVnLGU7AkQKZDPpYLi6BDf3pIMf
	dorFlLm25IHCzvJfqFionnqOcMEnSWRvDc5Cwcskb1r1BR6l5BhQO4grBYzVZ1x78rBrZ51MzaS
	IsiME8Gi3r2YNnvIIqMfLI1rw+BMCnRxu86KpDHVGYu5QQKScG6348d/tPOehSb+lWC4ZfFOKRS
	P8xZmfw7b9L6k/p0p4WvimvnXzfcFTbB7DlzZkHdeyA651Rai2a3BMdkntSDK1OOWwWgENUfX6w
	34sG3HPmBN/ctucyepNHdxp41g3iNiQIYrkVo3we5EzgVCHEZc8V6SoGxiL8uiAgRHtQU7Hnj3t
	50dTlBYj4Lfy3NBcmAqk0gBCNjVHCzud7zYY3PU4yki7hJLBcv25xxOIHDQ==
X-Received: by 2002:a05:622a:50d:b0:4b4:95ec:c830 with SMTP id d75a77b69052e-4e6de93596cmr23862091cf.42.1759800252465;
        Mon, 06 Oct 2025 18:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEikV73yqB+TdwAmKQ1pcop3SJZ414TP6d8b9XiKWBJUcVMyY265dINYELgJj65zxVKuqbsgw==
X-Received: by 2002:a05:622a:50d:b0:4b4:95ec:c830 with SMTP id d75a77b69052e-4e6de93596cmr23861911cf.42.1759800252004;
        Mon, 06 Oct 2025 18:24:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113491asm5543464e87.36.2025.10.06.18.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:24:11 -0700 (PDT)
Date: Tue, 7 Oct 2025 04:24:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 04/20] arm64: dts: qcom: kaanapali: Add support for PCIe0
 on Kaanapali
Message-ID: <noonr5lrw3ig373pi4c7efakil34vsaej6cshs52us35n2bbmd@7xmq35w6wetc>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-4-3fdbc4b9e1b1@oss.qualcomm.com>
 <68fbfa0a-605c-4b6f-8ef6-33ebeea8909a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68fbfa0a-605c-4b6f-8ef6-33ebeea8909a@kernel.org>
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e46bbd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pzI5C_7f7Ztj6dnNTwcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rUBc5uLmvDVFnCR-WPbXvuJHQisvsPpf
X-Proofpoint-GUID: rUBc5uLmvDVFnCR-WPbXvuJHQisvsPpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfXyd15krgw4GNC
 4R3R8aoQIXYExW0leRcJTVgRtx950iYFwv8MADD6wINgSdQXbkp4kS+08/jc1ZPFY6Xtv/GJTgG
 8rQ4aMJvojb+IVoSR5ImXjc1FjkMcwglPL0ewDZFRyaCWsKeBfjGzG6FijtC3LzNMkaxzVadNOH
 lkNkL+kTPO7s78NXZQ8G8RQsIAA+fJtBOqtc/ZRNf8EckvP4Ad1WznpRH9YXmYT3tWebo8DliJI
 b2J07jGKEVHOnYgx77UWAJ4CR8dhlXgsUDzJQtIiTKr64sqDHk6u/+8OHnGUO16aTnLPNcaC3X9
 6lOeYXxs2qNLAOzU9R0Rv0AxfFKkycKcURxh1JsOftD0wCJy43oC9qfmr42LuQ+b6/7cFuIKrcQ
 Ds8E/pG//BeMs+Y+F4g3kChRBWRkkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121

On Mon, Oct 06, 2025 at 11:23:23PM +0900, Krzysztof Kozlowski wrote:
> On 25/09/2025 09:17, Jingyi Wang wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Describe PCIe0 controller and PHY. Also add required system resources like
> > regulators, clocks, interrupts and registers configuration for PCIe0.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 182 +++++++++++++++++++++++++++++++-
> >  1 file changed, 181 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > index b385b4642883..07dc112065d1 100644
> > --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > @@ -452,7 +452,7 @@ gcc: clock-controller@100000 {
> >  			clocks = <&bi_tcxo_div2>,
> >  				 <0>,
> >  				 <&sleep_clk>,
> > -				 <0>,
> 
> 
> Why are you removing lines which you just added? What sort of buggy
> patch was before?

Weirdly enough, it's correct: this patch adds clock provider, which gets
used by the GCC. You might argue about the split, but there is no bug
here.

> 
> > +				 <&pcie0_phy>,
> >  				 <0>,
> >  				 <0>,
> >  				 <0>,
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-76492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69169BC6679
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 21:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A04619E0A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 19:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7722928D83F;
	Wed,  8 Oct 2025 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCl5f/mB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65934BA3B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950293; cv=none; b=RJ4S5M7fYWK6PvYMlyu4T4okLV9Dl/FI7Sz4A8uKl3vHZpIUH0CT1rPl1hL/74Ndr1D1zwbFulhwhfpjZ7TBBEOwPPsJszaVx7ymcdW0buZJXsyyKF87RAPRqwkKB4Jk3VZAzJtzu5T5XU9+1eHp9jeyzFMYN+DqlnpO0Dykurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950293; c=relaxed/simple;
	bh=F5j7+pfFJ0zioBtIlqjIf0yKgyL15Xepcs2kVFSkMS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rha7jxZZxQut92Xp8SxHui7THImZTCs0AHXzhsGmqNxhNnnznJH45Qef9el7rbNfKaUwfQVGCGXqq1LE9ee2ZxIeBX6egoqnhulw98rsFSpWNI9NBrThXEciWJUBCWEWp5h+yOwv7Jz6tkLybqDwTn06VLuo8cgoF3mIW4E60dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCl5f/mB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HRk020544
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 19:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vLkdhzU4dB9t0lL881Qj037K
	WlsULwSrkxUDXDtfwCk=; b=MCl5f/mBtxOaP84V9D8JhUqzwD1cuKxkagK9splk
	nvmkRPGFWmTr0Z4wzbI8f3xvF9SK4y7wrfb6JZD8aYLLhBycL/B8pQk5fhFghrGI
	THLnkeIXjLMrVm6Z0LFRsAxGw8l30/iKQBZuZvSANz1OXU+tz56st/6I0ckX9B6M
	VclFPJo5wlpSLgXPQ4YXK3kSgMLUkpYxs7snAhSEg7YqCVjRENoyjhOaYNweUIWq
	Nq14eVIGkbbECmCL/4xkHnWoZAlPwMNVAHun7srRs5IN6e0FGQE654AkhRDyNn4+
	iHxDvtcymMrc/7LXY+42yk28hIOxwYh8rG/DeVynvbRTQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kgakx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:04:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dbd8484abbso2908201cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950290; x=1760555090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLkdhzU4dB9t0lL881Qj037KWlsULwSrkxUDXDtfwCk=;
        b=lrw3AhazG0EjnCgnrwUDoRH9PS+5CByyd02XMe0jEn+fqJoXnVTw/MVLSiQh9cqwin
         AwlgsVX161t2jGMA7YH0Ndwbm8fnDyxebCoAc8MkpK10MxwMla7djoock670Of2V8tEV
         QEk8eCzx5OdyBlFMLdFj8MW0kw3lcrBA0HaCy/LdXKUSYqxiVtIT8sUOtjzFBKyQFAJN
         K9IVfc3wWIZC5y9PZfS0Z9fXG/Z0UJKJVTZOg1QgE9Ns3X/5st4lqdG29PtCd3yLD6+w
         UvIUbUWhjUJQqQOY5d4ZIpPKzdkaiael+bami+6lB5OM3oKdttZcb39g4JSq+MV4fCV1
         WXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0w/ZFizNVHaN93RfupYzegIO99sQk9CS2F9ucJ/fs8Dp3xAeoEz1+2SHU9iNErfpQPQHa+RM9mRloGld@vger.kernel.org
X-Gm-Message-State: AOJu0YxCiQVfgo2vAevaRMuZXxKExm/Ad3iyXgujP1+F7EKDIMUtnBvE
	tS30Vm/Lzng07A+30DGxnZVxA2XkphFFuIyPv3lQBZoEuqfmI9gsAwew11yKkqeH8ruWJI1KBkw
	xrxbhUmw03axWNxlJMjHeM7cOP5OycTPeP1tmuMhg/KXjzayJNDoONvkFB8PxsqZg8kau
X-Gm-Gg: ASbGncvoeeTHdrpbubVLs7r0sNNye8pf4+dvEFEO7dWWVo9iWglhBYzRsA8jIWJmQxg
	XguOMKQfVppI/aXfUwwfRT8EM7Q9SuKdTeGlf+L3PlX2utW/HgEmNps7aMCWoD2UFC56y3rTdhL
	MrGIrgUiQsYVV6b/c9pcVNnqwZ3kXbi3KKuUD/2YA7Nz9rSeacjLSW11RJ2TdrC78QQQw20T67P
	bDo6MzuCIKgqtzowl/VECwVMUnK4NdTRi7BwJMHrl+kfMercgH5PBpLMdnnzYtbzhbMY/djrbzx
	3NuGh+lxTFX62ai4zdoAFxNHuR9tYzqzV9JvASgG8XHdzlNHbwAMO7woSVBlF/1SAVO+gDI/Ry5
	KKU5rkr05QCv9F8gbFcUxKpJ6mUBBFe1g45V/9ea9DkyDPy3w3hjd3d9K/A==
X-Received: by 2002:a05:622a:4814:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e6ead58053mr70078331cf.41.1759950289349;
        Wed, 08 Oct 2025 12:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFWF/s5ht/T1nn9ZhhX03tqHdiImT9nJZ78m+w7Uds+CFfUB96ert6VvJukBJuf2++atRTiA==
X-Received: by 2002:a05:622a:4814:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e6ead58053mr70077361cf.41.1759950288698;
        Wed, 08 Oct 2025 12:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39d50b2sm22349511fa.9.2025.10.08.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:04:47 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:04:46 +0300
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
Message-ID: <cydoo3odr5nh2i2grhx5pnvntt7yxvy7wzf62hf63krweeqyyp@kjwjiugjmfa3>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-4-3fdbc4b9e1b1@oss.qualcomm.com>
 <68fbfa0a-605c-4b6f-8ef6-33ebeea8909a@kernel.org>
 <noonr5lrw3ig373pi4c7efakil34vsaej6cshs52us35n2bbmd@7xmq35w6wetc>
 <f16508fd-05e9-477c-92d9-26f4f04bc056@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f16508fd-05e9-477c-92d9-26f4f04bc056@kernel.org>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e6b5d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=LsMgGdHZQkRXl9bu1foA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EaWZ7kVAEKhMdq9JBbkaQqjcjWNa2vJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4WNqac5u3ZfC
 AEiBfdDrRiXt+e/wDJRnfGR0ZWnFS/ZgVdaq8d02XLoGWVNGRvjCuscmGmul5bTyJcUQshmilzP
 KY/KHkTBPd1LUM8uqX8jPGfFiBf8c7dC3B0pXFD3CZEmS6Z2p0HGU6QAG5pBXa6IR/x01BlXIUK
 vBYpG0UKd3z73BUwVmOa4vLFVOSL8XGEuYGTCxmfgoliX0gwtqU1cPhuuGhyXZ35NqTJQOI2MSe
 JJgsSP+3p9kAJic75qnZoHtIYl6/f+ArT28kq6lLb17g+1fSNfosCU06+PFgGs83e+1UP2Zx6o/
 X/mBnXASm2fiA7MfAmS5aW+tkOatsJyShoV3K+Jl5k/CF5tbXkGO+QrMy0QLo+vDwnWMMHlhcHw
 6n+vFyYZsWJPe5A0pDfU7AlwXU3GGQ==
X-Proofpoint-ORIG-GUID: EaWZ7kVAEKhMdq9JBbkaQqjcjWNa2vJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Tue, Oct 07, 2025 at 10:46:29AM +0900, Krzysztof Kozlowski wrote:
> On 07/10/2025 10:24, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 11:23:23PM +0900, Krzysztof Kozlowski wrote:
> >> On 25/09/2025 09:17, Jingyi Wang wrote:
> >>> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>
> >>> Describe PCIe0 controller and PHY. Also add required system resources like
> >>> regulators, clocks, interrupts and registers configuration for PCIe0.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 182 +++++++++++++++++++++++++++++++-
> >>>  1 file changed, 181 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> >>> index b385b4642883..07dc112065d1 100644
> >>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> >>> @@ -452,7 +452,7 @@ gcc: clock-controller@100000 {
> >>>  			clocks = <&bi_tcxo_div2>,
> >>>  				 <0>,
> >>>  				 <&sleep_clk>,
> >>> -				 <0>,
> >>
> >>
> >> Why are you removing lines which you just added? What sort of buggy
> >> patch was before?
> > 
> > Weirdly enough, it's correct: this patch adds clock provider, which gets
> > used by the GCC. You might argue about the split, but there is no bug
> > here.
> 
> 
> Yes, I argue about the split. This is new SoC, so any patch removing
> something from previous patches means split was done wrongly.

I agree that the split is weird. But it's not buggy. Anyway, let's wait
for the next iteration, which will hopefully sort out everything.

> It's just confusing and previous patch (the one with lines removed here)
> just shows incomplete picture.

-- 
With best wishes
Dmitry


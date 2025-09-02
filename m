Return-Path: <linux-arm-msm+bounces-71473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6722B3F348
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997A0481A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79FF2E0924;
	Tue,  2 Sep 2025 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gP/jN5XW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C4528750A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756785899; cv=none; b=NxauTZbEjocS30zRmYC6bQA3P5rCN5jujg13WbYhZK3CVbfdO6zXfxY3uHQhwpyH7ASp5yUAHftATOJEwZtGt01/A5AJACtYUiUD5KwsORsWB7/B1qk/hlibm+loZXWFIkEUGxKTlFvkSIDsRBGiinH1sQFGdnTNvuQQpuLNcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756785899; c=relaxed/simple;
	bh=v/2+YAxpFamUsg/nWMPyIxlBsarZEf/G8aP+4cqfoxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcwlUCeeRS2kshW3sd5wB3cmPFwQd2MZVYMXAY0KaZ7udYE/IcEjdjj9aWYhj+2458r20ox1l4PeQIAqgBMdPcPgHD3tomLkv0SI5C+pUmqSmVt7CdOV+S/vGb4ZXC4zFfreWno1EXkMBLy7W2G9Y0tgGDX/lhaWqYwKbAuI/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gP/jN5XW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SEHg030688
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FUbG3HJcyuVo1E28CzJ/QWui
	hMmGUR1E5R08lzHdUPg=; b=gP/jN5XWvMLs2zd9d6V46MgZe3bIzErGTzU4YfNg
	vJHsTcL+yGJEajqipi0uVENLvNkmWpRFlhrXozMkKaJNpHqvV4/mF/OwqAE7pLoB
	af6ZXmmhVzQpNYhBEsy29uATObgagA0RRcsXbcyvE50tZu/bv/cGkAN4Zj36yxNT
	wAXVyg+UKOaO5FovU0mdIl7PrV17/3XrAAZdSvAdfZXG2EmHsc5OG2+iyOG+9Fvg
	PvR2WXTn0sJ56aDlJlygvovjSOrIlT+bmchpGyH0X+K64sGCEvcAUHcKF1rpU7z5
	XfYtRwnUbL1KW7HI13iAeoiAmubF7RcADqggYkHyr8yGxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8pd88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:04:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72108a28f05so5559186d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756785895; x=1757390695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUbG3HJcyuVo1E28CzJ/QWuihMmGUR1E5R08lzHdUPg=;
        b=soQyfHSLxb+DX2KQoksiKjOGN0mOJRM8mqc99MBqSWc6ySaLlWRihMSFJCKkujtO/Z
         WpIgtWcFSWq4xtqNtMh4rdnuaaz9M0v7qSRDYy5SafzrsaHqNAWSjY0PQtaty2mZUmuM
         R9OabdmnpHmDmmOV7hmge2FUjRC63hGjzc9Y1QWhlIY3aDfPbknIcTl6+eoSYhICdtf7
         9jgmHw5kYZw00vmxpgTB6qv4KV2jagmGxTbO/tkMtPFl5Zi47jsnTyVPB2rUYTrS9XpC
         HMUZ2mwBqu/HH51+LFhQn47VhGenSXqqydejJDh4VaU7vw8sEzPnaaTw/zvmXykFiFkm
         ub3w==
X-Forwarded-Encrypted: i=1; AJvYcCUhpKS7EaGqiyYezQrzYwVScfYn8YbTJKGg3ohKg5OIUema6/EBreQOi/6NnLAyrXBxVl7SGl14UjEP6Qzs@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHKnUSokyDqxVpCa03yUkkmhxLj7JUU9wsDFkuiDejYraiYue
	u/KqqcEb5hmXoYcUFp4ImRTJV8DoYoY+qi9Eitn6rhgE7YZeZvme3vraUHv/+kk+NnYSXZ72ktR
	10devzvTa3asvrjeLD6Sr6YNCCuYx2me7s+BeEOXLW7xJawhDoADdY4WhLyC+9d9LaI5z
X-Gm-Gg: ASbGncsDsXBdODD92XI0p807nkOfIgqEc4HofPPcHKKjgDVPlaz9lya2h3r/31d8Ewu
	SgXcwZVPRWnkB8JXeV+9Xh2f6v7fOdleVS8wX8rM8rTW2DmyYIDvogFR69rwFMWdo685ANQxVBO
	+AVDwgPQ4zKm5gwm1tsX93bI88FoVfJcWDKejUTRwbkY94aKCqI4X5N9nQREvNvSsal+OZBEb8L
	H7YPalHMAZqkCwUAM3BWK6m+gkoV9JUQnCxYnhKFIO0E1a55l0OMxPP0JT5XiGBXI1JRETr8w3w
	DDibyibA+MGHSaxW5MBkT2YZbaDAoYFM7wDIwBWD1BsopN0FSTZ6TxWElR050Zakow2KwWXIm8J
	vfcLxlQYivzNoDiIgRkE+vJ9VfXKnJpw8Usgq5cbm989fpS96q9/z
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id 6a1803df08f44-716856c0613mr77343976d6.43.1756785894781;
        Mon, 01 Sep 2025 21:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHprcraanQwhdW2zFPLdUXnmfkEq2gAsf7egUurUvHlfjuXEEHMuXLdIs7YBM69Sknlftw1mg==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id 6a1803df08f44-716856c0613mr77343796d6.43.1756785894311;
        Mon, 01 Sep 2025 21:04:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032caasm1932141fa.35.2025.09.01.21.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:04:52 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:04:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP
 compatibility strings
Message-ID: <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-defiant-illegal-marmot-7ce0db@kuoka>
X-Proofpoint-ORIG-GUID: KbY4ch8_NX9AtanQR5KEtSn3rJjG6rcP
X-Proofpoint-GUID: KbY4ch8_NX9AtanQR5KEtSn3rJjG6rcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+KhkOKvv2pbH
 oX04frNgVjMGs12KMQqRnC71JECQH566czFHKw3wxYJVaIf07CrWCof/CZ9KhNMEi1nBCi5oGEW
 J5ivbCxaasQADmiZQ9Y12vJ7GXPLYzeRcODrhJ6BCxvtqABfR9m/O+ExjiGd/tiJjSEqSgdmWwx
 p7oNnlKrcaOOq/1YAx461U0F7hEyGUKxPVnGL2TJxllPmnBugiFUm2YiQh94B2S05lusgn1urd/
 //WX+ZlgZT2+2BGOJ2xiTikT+nBH4YiCjos39xqU1O/Ijil6Cc4bMGm4edBc/9ihdowRchhjFWg
 rPbcX5jmXvy4+qbrBviJ/rOaQJmsUn79OY+YvJALHSi/twuYvZ92L80RvXEGPpInmENh6UPAMwi
 a+AVkZur
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b66ce7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lkS1JMb0PDcYJWSia6EA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Mon, Sep 01, 2025 at 05:47:04AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Aug 29, 2025 at 01:48:21AM +0300, Dmitry Baryshkov wrote:
> > SM6350 doesn't have MST support, as such in DT schema it has been
> > switched to use SC7180 as a fallback compatible. Make DT file implement
> 
> That's insufficient. You basically claim to do it only because bindings
> change. Bindings were changed only because devices differ, so that's
> your true explanation here as well.
> 
> > this change.
> > 
> > Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -2249,7 +2249,7 @@ opp-560000000 {
> >  			};
> >  
> >  			mdss_dp: displayport-controller@ae90000 {
> > -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> > +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
> 
> No, that's breaking all the users.

WHy though? Both old and new lines are using fallbacks to bind the
driver to the device.

-- 
With best wishes
Dmitry


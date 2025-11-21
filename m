Return-Path: <linux-arm-msm+bounces-82890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE5C7AEB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50D854E61A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B932C1780;
	Fri, 21 Nov 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJPRmsC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Or9nq7xS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F72DA779
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743382; cv=none; b=ntZyZFdO6uqHFi39QSKixx+FF5D8PMDFe0TduioV/xKfzIvKf6F5JFI7w2tD37H9QKEcl3y+ayaW3h9BLnG3h4+VaVkbkbGeRVmU7ulKyLUdWNzvFKAy+sjXNuWQkGwGb00aQXEUEqM7sBv1xFqfmL/knaj/9+V6ljW86aFsjHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743382; c=relaxed/simple;
	bh=TfgdA3tajQofoWJISxRivlGW6zPDPAv6HMO3aOPJqm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeVeDpO9zR/DGWw9I2HiIV8B8VdA5MEo8jpci83uBVnvpWjQx1iPQ3AqVRXx2xCUfYYCVOJaG9BlhPPOlB0GdSQzxlZ+qp9LWpzbwqiXWv2PcruqJgcnWj7O1Mg/fqWPG9FjknxawZFbQpBGTgIaElVCUCJ8fupWycA+5z5i0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJPRmsC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Or9nq7xS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALEMKnf1390819
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=09MGYUy+aC++hYJhkqJKDpJA
	umAjMYKueV5atsqaQBA=; b=GJPRmsC7oO6yeYSQvm7n0aJ3wi2LduGMR3Xp2Yu1
	NndVPVzJCC3UFEdIUAhSl7YLwDCvTqKfBoSTvNkaVzUbs5qpMP7lx45947nZdGEt
	JGIkq0dVfU1M4V7OdpStEeJLcsiNZ2VSsa8VtrENVqXFS3zGK74cV56R+qqDXSVd
	O7fauNnnl4dhsEuymX91j6iu+8HXhvKkDpoAPu0Y8G9XFmzQ1EZ1bQa/+3fAKQRi
	CXFDLlz3QNZbO0LWgSu+ti9GLXuj3Fa79qEYqziV75at350GsQq9jUyFThJ/qELh
	ecd+NRnUqgtyQfooUUxCgPOdjEGbkmpPufQd+KogOvSFHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb533990-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:43:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so683335485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763743379; x=1764348179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=;
        b=Or9nq7xSHnvhA3IuCUPRimG7l3qhegiaJVE+CPK0bgtp1+AydV9q/oTqh+2xFm6zRu
         at8t0tUty4Q1TTEE22XwJIyj50B5CksXG1jSbTqhhoEPSy5CzqGfdGmT2DsHKgck29Oe
         EfMpGPa8Ssfu6nV1Y9n8iGr22bLN4iuu5hN1sSRUiZvoOlYh7RidxfzMOB+PVQmuWJjk
         dt33Pg0x4UaY/gBSJ2XHWhq6HXmnLCiZP/UzSQEKofvP/3b6q7IaX+WaWaTu/IbK69sP
         5bmFQZrklbUA36QzhAtvp5DnbZrJXLBeiQWMcd16/AdVEDGUl9dFVhzHs/afJS+k8W3e
         mqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743379; x=1764348179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=;
        b=RYOl9Iu8rrUU85oocpsFPDm2Qr4GgMkmSGMGlFBmlrkc4NfNmM7zB/2CTgFIVWvQ0J
         +mqPB2L2yrn77EqVGLYvEGS0j7Fi8jl+bAeT1P5ptCvnJrV7wSuZN3/6QOViMrKRh71Z
         51R6iTg7V8L7AJ6Sj6olMYiMbMotdYZA5i4B0KTFiyJ5kECn52g0cI28hF2Py7r6SZsd
         Gj6D7a5IkI/OXSw7lLOcf5SZTW/rPudP6P9n+M7NNqM0RYFWYhQzEwnzKil1i5jkeYAN
         qsHpwALr4nHLgrhCFyvVM1C2rSD8ECt9Rs8E4CmoWrku9Fi+DI5TQqW3lZ/xgTzOyyIZ
         M3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXnIYOtcv/QqqXZuMbmtAljYKVuderj38CJ9TsyCITMiFbLJnXMQOX5IXluKXgg3yT/faX8fQjRyatJgO7s@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKcxSoqqRXW+d4QNs5Lz+wIH4c97uGMW9lG5eGQ7LuCZ4qkJ5
	itM1NnBVhoO7TPfXJNCS5i7NsOFnsfoLO1npgG4JvtRptbGGxAUhwb+spU1XFfRMYddfRaAr97w
	KeJgIWDVvnRJqwOn9HkSj9lNgMpsWvYWLveQ44463+Kd01bEA00KLQwcdLKoD3wvfkoU0
X-Gm-Gg: ASbGncuoiu8oRVAFWLuOoXOQvQ6Hr5HZ95Xe0zudZEhpQH3aDN1vo1jyCZmnk6UH0Fp
	hXJFgCH0myMGedFaqvfOVh2XjndAA4RAmTz3OBo4fr1i0B+Io6BjMrd1N/Yw9qa+OZ4ihHoARqk
	13IICMnXNX2GaJpeRnPGCyN0Qxrr7J5FSFNSSnJPk+5mum3to4NyrVW+c42peDQnpinFd/bFqFr
	6p+Dt8iDuODkCt49GDlDdtUJf2tbqaLkFNnuf3KdoAYcgXwXnA2CJRT5WU+BNdHcFe9CmFLiP1b
	oX4S/gnIrzLnwjwx7Ll7ZCz6cIIwezEIO45HZRfbtJzcBMuCDhP9M0S+dcND2m/X75be+1vOq6q
	h7zcaVZqpnSxedddAdcDvWQ+h+vzwSMPPAOWTKFo/qoHkJoBD1VLz77QXY98F1gEQbiOTPKT6NO
	Tx3wyCD2I8xMRwFB95DYvJpC8=
X-Received: by 2002:a05:620a:4494:b0:8a3:fa43:321b with SMTP id af79cd13be357-8b33d2639acmr332539085a.27.1763743379199;
        Fri, 21 Nov 2025 08:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIkTPz5TB8xN3lLtop+PT42zQtIBGl03bkK0iuHS9jXAS96lGvlh3BNb2mfJskgsh+6Sec3w==
X-Received: by 2002:a05:620a:4494:b0:8a3:fa43:321b with SMTP id af79cd13be357-8b33d2639acmr332533485a.27.1763743378634;
        Fri, 21 Nov 2025 08:42:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db74711sm1761230e87.12.2025.11.21.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:42:57 -0800 (PST)
Date: Fri, 21 Nov 2025 18:42:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
X-Proofpoint-GUID: W2LOIHXpa6TTU5Xb2H4FzpnpN4K0JX3f
X-Proofpoint-ORIG-GUID: W2LOIHXpa6TTU5Xb2H4FzpnpN4K0JX3f
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=69209694 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=WPgZoJjWRBIEHdDhQE0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNCBTYWx0ZWRfXxQKpUTf8xgaU
 955FIy8SpcanfrVR/zu0t+hHnvhl9hFuUSRik40UamderXf1uagWMLijxWOFYyMsOZcFskclg9D
 A0ovLx0adnzVBI3ur9fLFCZP9nucaTA1yA9YJl2C+FcJvIx15aZP65AG0yLfqWYivlm56t4bKg7
 wIUUidKCpdwuIVxxOyyhq2yA7AtGc7kZYnuJRPDQAcBF/W1RLgye5c91KMYFp4LYk6yuskhtpmB
 p6MFSkp+lTJKHUve2c2vc1U8SF6RWpd8M1wYT2Eq4zhyA612IsrvdFqkRqG4VTFnxfAviyJwRe/
 Fx2BwKT0JBZlM56Y6EF2bKpMnV5GwjYMj4L0dvsmt2WvAMbv4Lm/2b52RG6YLt5u4tBD/ANvivW
 YPPz9u/EIjeuKPsi+ui/ruX2p7Tguw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210124

On Thu, Nov 20, 2025 at 02:25:01PM +0530, Mani Chandana Kuntumalla wrote:
> 
> 
> On 10/8/2025 6:10 PM, Konrad Dybcio wrote:
> > On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> > > Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> > > with their corresponding PHYs.
> > > 
> > > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > > +			mdss1_dp0: displayport-controller@22154000 {
> > > +				compatible = "qcom,sa8775p-dp";
> > > +
> > > +				reg = <0x0 0x22154000 0x0 0x104>,
> > 
> > sz = 0x200
> > 
> > > +				      <0x0 0x22154200 0x0 0x0c0>,
> > 
> > sz = 0x200
> > 
> > > +				      <0x0 0x22155000 0x0 0x770>,
> > 
> > sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> > > +				      <0x0 0x22157000 0x0 0x09c>,
> > > +				      <0x0 0x22158000 0x0 0x09c>,
> > > +				      <0x0 0x22159000 0x0 0x09c>,
> > 
> > sz = 0x400 for all 0x9c
> > 
> > > +				      <0x0 0x2215a000 0x0 0x23c>,
> > > +				      <0x0 0x2215b000 0x0 0x23c>;
> > 
> > 0x23c -> 0x600
> > 
> > [...]
> > 
> > 
> > > +			mdss1_dp1: displayport-controller@2215c000 {
> > > +				compatible = "qcom,sa8775p-dp";
> > > +
> > > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > > +				      <0x0 0x2215d000 0x0 0x770>,
> > > +				      <0x0 0x2215e000 0x0 0x09c>,
> > > +				      <0x0 0x2215f000 0x0 0x09c>,
> > > +				      <0x0 0x22160000 0x0 0x09c>,
> > > +				      <0x0 0x22161000 0x0 0x09c>,
> > > +				      <0x0 0x22162000 0x0 0x23c>,
> > > +				      <0x0 0x22163000 0x0 0x23c>;
> > 
> > 0x2216_2000 and _3000 don't exist, there's no MST2/3
> > 
> > sizes should be changed similarly
> 
> MST2/3 is supported for MDSS1 DPTX0.

This is MDSS1 DPTX1

-- 
With best wishes
Dmitry


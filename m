Return-Path: <linux-arm-msm+bounces-79740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2EBC21AC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 527A54F2BD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540B436CA89;
	Thu, 30 Oct 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWetDbam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JG650cJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10AB2773D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847133; cv=none; b=IJjaVGr6XW89RIIoDDWpLwhvhpNjWv5rdHTyMTT2Dj6QLTdjup5jeEAHzveMJ/rwdh8O6n57QG8U2fYtPzZbEXwP2eDtHw7UE97pRoALEtcctn7ZTIioB9KzHsUoDCtQDAd90CW9pLkObL841kI3FEwcjp4pwo9xiMcygUz9aOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847133; c=relaxed/simple;
	bh=Q52OrGfLDGta4QWoGq5iz5GAVO2sT37KfMJDoKNIZe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwUe5UZPfcfFR9HtshkhWeMIMNfgdoK/nhhfOC9LKxDZAJBjeHhzBL3TAZ9RPGowyzTVfGXDSALUk5Xb2YWW9oAJJtDeAjzn7x2YpG2xGSUAy5VYVD9ApTZl+XwYneOrH7Ne+w1OgJ151T94xtWlkthSfF4wtuzpf7GYpGvFWLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWetDbam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JG650cJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9V7t21995213
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Q0deErh+I54GhIS1z7OGdth
	5B/KTJBRbE+7iTB3hcw=; b=VWetDbameGekInwSnlRyNh7GOnjGcynxubTf4xBC
	maKc1jX6pXd6QtsZunBVwz88enhEIpfl12MyLKasK7LnZ6Nv9BMDzxL4SUYVIW5U
	qh3AJoydlaZStSkExjf1XvMfAFaE/lwYgWE7Ns/n26BsY9MVh8IasnkJ26kV0pJ4
	vNii05aQ/eOoZI8XIoawFzX224h+fusm2TvXDawh3+HkEF15Xl1s3D5e1+iS5Dmp
	WdVXaWqkY4tovjYlTdT5xCS11TQRCRoCPq7VubjJG6pk7KmGlVTznSJwqm45TT3w
	VJUFR32zqVP4EYgiI4RQy2r4PKtEPCaRzBzxEKMRfJBhMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72s0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:58:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eba930d6ecso33642661cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761847130; x=1762451930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q0deErh+I54GhIS1z7OGdth5B/KTJBRbE+7iTB3hcw=;
        b=JG650cJMpJHPpCZEXRwGWABGl02ZR7WQmIih+EMW1cjdzGL1jwOcR+Z75mJf+actTl
         d9a/dIGNyZM1TQo4eSGPX2PTWcfRMt3tlAzIyNOm8zGOwonx59ubVTTqEkrO5sqEO7TR
         Xgvmpo54X4DQsHZsapo5iX7BgWY+aBfKyLSLAVxUG12C6qT6yPY70Top0PtfdQ3LLVN9
         We7b//RJL0jYCFCTfB9Uu2CAM/Nx1EjN1gy7eF8sBQy5FtbZHLOF7wz/04MarnF4Zg+H
         PiJ6ZebK6e0Y8/bPwmTosqqSECNaP9ML3gazSVqe0aJ+P7wKkARyEYFsCXGaqlCBFVgg
         GPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847130; x=1762451930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q0deErh+I54GhIS1z7OGdth5B/KTJBRbE+7iTB3hcw=;
        b=sKgGEeLjlK2QLD7fq9DoUXwwo95GItdUm9R7qd+23NR/ewMJx9Ik+MV4K+76Qm9SqD
         jZHTLnLQ0Msye+6YiPSPtpyf2ZZSg62o3HF8goBH7JDI0icsqLNfrXL83yarcdj9KX5C
         bD3MEnashWNLn08+H1F2yez/ur1xFENxJWcVRZlM7NZUOR8EC289G+zZ0FuiAr45amM1
         if8M4KQIqbGocaU2XxZ9C44KP5Vk8CL8T+vN7mV35Hp3jNGI0mk+0HyJgkqdJRj+Hlse
         iWAtNKcSPjk8FETFo6HJ9t0bYrgqutIy3VXoiLeTIz5G0OhQ1VGS+hncyOitKDecWr/6
         LGmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ttbv0YoXj5BtQfkZNa/hyxgJEir6akGpYGupvZF17ny1SmQILLXKDRweNB2N4sC4WCmP52lBCoYbFBPS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2oUyuExdGUSu4MvfhoLYWmxQKwUh5sBnmKMXwb8/za92xM0mW
	pRtyEj5snsJjVo00xLgdZcQe0Iekfgt2H8GvdqUy+KCu0W93P6cHEEWAAuCl1R6amjEYxU1awFq
	CkRDYzY9mhPjL7tGcriSLwnNpIvtUFDAq4EAvSJM5QvErgvFuQttulOhIyIIA+P2McWOR
X-Gm-Gg: ASbGnctjcIJyMT0ZyxhRUq8TUNWvgMG4NKG+TRBu8Vo5rJesczfyGowKNanoFlayIG4
	by7Ut8oZPdTpRm98xZ5wt1ckPyOzeTIZksQ7YzBmeShH+lJprtxcTkmSifnQfC1HEdiBZuXn2nz
	LZvfNYlgV5+/Gd6WyrvDNKvSy4lDdFRS4C2z3z/J6/JR6u5jOoSIlanvBGCHMSD3K5S+XeU8zel
	w8becmQ/PbT1CPUOvxlZB0s2vicFrP/RJ+122C3K0qRxHe8iYZGAJ9M2/QAjTDlyW0zDCH5ZILy
	Zp9RfzKmN3x1nM2xcosKlZ3yJUide7Amdwg80kl0QX+8OQiwwSlpTxNh2Q7wm4oVXsvKbwyYJQp
	/msa0kwQCJrnTNR47KWaXCIX8bf2Vy6Tpu0QbXUOpowNbnUuj4JmhycgL+Thh7jBf0zsDCmJ0Mx
	dUyuBZhUfcVxCU
X-Received: by 2002:a05:622a:1886:b0:4e8:aad2:391c with SMTP id d75a77b69052e-4ed30da2680mr6940791cf.1.1761847129352;
        Thu, 30 Oct 2025 10:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnEyIEQZlV9AL9hQo39GA8tkdTMFXooFYwSJ4HzSOksJTmwx0/qrIgEOylTfOt9zo+f+r2yA==
X-Received: by 2002:a05:622a:1886:b0:4e8:aad2:391c with SMTP id d75a77b69052e-4ed30da2680mr6940501cf.1.1761847128768;
        Thu, 30 Oct 2025 10:58:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5bba2sm4718168e87.52.2025.10.30.10.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:48 -0700 (PDT)
Date: Thu, 30 Oct 2025 19:58:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
Message-ID: <p5apfg5cbwcdmilfr3omoncvuj7z7zbj6dkex2eicjdubkyxwj@h42bzzhx4amt>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
 <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
 <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>
 <weyze7a2pqmt2klt763lbwyvpezqndm5rjnitexalru7hy3xhh@tdqx6xeqp3qu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <weyze7a2pqmt2klt763lbwyvpezqndm5rjnitexalru7hy3xhh@tdqx6xeqp3qu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0OCBTYWx0ZWRfX8Gx4ucHd033q
 1dGgFJl02GKuPTSJ9K44fqXH+cXTjdagBp251M4tEVpMx6YBcKGiDslKllsxh4ZfQnhRnpqh4GK
 pevsSGl5VmTlPF5OOdPiJRYHHnfuzAru94issGAH0jQ2pc1fxY4BGPfZFpdO9+TAVAr7FDYBk5q
 k8snf6vz5lkOeYrQERHa+A9AC4nK/bh7Ad/wOW4IIjSjH55tJ/lGxGEfY/civEFY/rQkkclyrZP
 peF+LtETERCwHh+F0wOl1SjYZsOTMDuk2RFZCN0dhKaCT50RsbzVQT3ojXGDf5NIMMlvTMZNSc3
 MUH418GWbDK6XabMzhf6fR7juUNPQIbIcfejSWv/EcJNh9pdhWIeF2DJQ8FTQtxxe9hy1UAOUFO
 usvwdIhJHl2DKIYKlVYVWSWzthA3Jw==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903a75a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=76FKqnuqe-XMp3VuG3UA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: gf2rubdF90i8pfQKBumaP1Lx-H4eV65t
X-Proofpoint-GUID: gf2rubdF90i8pfQKBumaP1Lx-H4eV65t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300148

On Thu, Oct 30, 2025 at 12:28:31PM -0500, Bjorn Andersson wrote:
> On Thu, Oct 30, 2025 at 11:59:00AM +0100, Konrad Dybcio wrote:
> > On 10/30/25 11:58 AM, Konrad Dybcio wrote:
> > > On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> > >> In order to reduce duplication, move common GPU memory configuration
> > >> from individual board files to sc8180x.dtsi.
> > >>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >> ---
> > > 
> > > [...]
> > > 
> > >> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> > >> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
> > >> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> > >> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> > >> @@ -14,6 +14,8 @@
> > >>  #include "sc8180x.dtsi"
> > >>  #include "sc8180x-pmics.dtsi"
> > >>  
> > >> +/delete-node/ &gpu_mem;
> 
> I agree with your hmm, seems this line should be dropped(?)
> 
> Dmitry, please confirm and I can fix it up as I'm applying the series.

Oh, and this line is necessary, because sc8180x-primus has its own
location for the gpu_mem.


-- 
With best wishes
Dmitry


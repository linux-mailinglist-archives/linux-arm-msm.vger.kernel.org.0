Return-Path: <linux-arm-msm+bounces-51720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AEA673E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B8C3B05BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155BF20C033;
	Tue, 18 Mar 2025 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeypgvoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DE20C03A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300867; cv=none; b=lSDAuAHEnt534F0/f20NZuaCaFuTIdMalp3Q4/JDwMXdcVM9S5Y3jjLYubZfUqVTVmywT6VCftERgptZE6i0q9nMgzNNhMWDwF2F2ifni6ZdM7wRXY75F43QYwhVGtgSyIWg8s7HwepRETyXfqC2pX6E+zN8eo6GbXpZw1jweDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300867; c=relaxed/simple;
	bh=qdGlnoK6Arp0cV/3NuPTFqvyKtKicq/u2AwoOwpGrWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiPngNzXQzBaOrqoapzjU4GDlucFgk/U0F9e923UdzPEdu4lMnSXjNAe/NbDXbJrdLQeZOezR0Gbcg6O5kfAjm2wM0K8VgEa3cJf2oWtP0WjLtB1Y7TzT7QES+BRJAGinSoyTgM3Y7QTMQ/BrOIzassZ6qmthCt/dDVKBUz8lNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeypgvoU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9DRCV026060
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQvm5ggtbOCQSK3nymPppIX8
	0f9DFkotxhkHRb0WarA=; b=SeypgvoU+gdG6Ukfr5ZLaqvd25tu9MhRZNXFTSl4
	seQBRzEzA46hOlTpxNKZQxvO6mO2aXUQP1ahTXVzSee1Gz+hx/j7tYaClPsI6ZVi
	+UGaIDLoa8NpPDojLo5HxurMTRHe8elKNUv05mlGGJ2GKjYZZwnxcmy6r6tUqNpP
	HuQ3y5gllvp5OOSdEI6wUdYOdLBOY2Oy5PPyEyzgkrEu4/sH7NBQZBkfYm2RYPc8
	YeMFxZlEkGj7288wLpTyKCU6rkCR7xBDFcYjTt6MtNuCUd2tETe9/fGvnkelBagI
	TL+M4GdLDN43HyM6GEGCvCCvP19k5VBpV89aXEXRTq+9zg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy04e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:27:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f4367446so67818376d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300846; x=1742905646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQvm5ggtbOCQSK3nymPppIX80f9DFkotxhkHRb0WarA=;
        b=mHwzPm9Pg99+LcCdegL4S8ghTU8NO6LmF80pnnwXvHGw0M0Ai2ZGljx39+MbQvPTnl
         i5cJ9WMa4jCTOoncOS0XOoMuvM33EkBL0rbQfXt7WK4Ud2eIcuYeTG512HTCbIv57qxg
         e3MlSSFvB2xdgRDJ/DGfvvLKeTKJMgoxe2b8y6gNfleUQyRQl9dUPZNOJk1qh0vpR3sp
         AxeeCmGfKc6CpFYA/dFoe1VbuYe8wBwBOTUkVU0QXJiD2vL14IVtd0Q3kEOzI2lAQikt
         nPhd3daYQg0LTyHnJ3lXgGkYif76/7CgVLcWs2qoEjnf77mmlZqPmwWLOPWcchGWFK6g
         Obcw==
X-Forwarded-Encrypted: i=1; AJvYcCVW/z5YbTn0LDAOQCxZYSyOLqvdaZhtbb2yypFi7VdNZpHbRW0/Pg2/V2XcIdi8Ycyrkr29H9BMIvvtOhJr@vger.kernel.org
X-Gm-Message-State: AOJu0YyquhEESdzbBwN3QcfL7mXwhDPv0WyDSpjoxaFdqKgcpnmdy07u
	1YC4EUqBFpDzzZGGUSmlWCwhC/yqb1RRzdc4o/6iQN25C4XaP48UiodQvaVzAFiAmZWWduvM2pu
	ncFRF+HF4AUPYbZ8EZJzMDbKNEshEIA4MNwsxL+aEeP/OtZ7wL0zqG4YmzKFkLm9W
X-Gm-Gg: ASbGnctAIBMHNXmkhLcbNRCOsho1DDQ9qHQdGdhvWzyVBk7LGrlD9VnpLLYi8a1S+Ox
	+crZmdGaOK3e8ItMZJiulnuJ7SaUboZllelnQ6wILtDHHAcMzu04bZSvzgtKsCTyEA5CeYFISSH
	jmehfavKJp/xzVUEtnfSWR+Ohn3yK/93KxnbMeHpexfpI+t6eAuotlwS1tA4xyfF7FWshV2DbGJ
	bP9JA1kvimJhRcZXH2FE+UnmnTm8f+GpHIKXGqKeseWEkXDDH+rCq0Ogf+XgfR1xsXZUR3obDk0
	V5N+tWizG4zrbiPSqDSM+6q7rFmiFCgLyyzvAxqFW3+Hp1+kJYTVh0Q0nDRb2gLJD5uGzxZz7pU
	wmek=
X-Received: by 2002:a05:6214:202e:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6eaeaaecabamr227559466d6.40.1742300846232;
        Tue, 18 Mar 2025 05:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwR7+iJ5oOeO+aBGprQHwdADJEmV6itZoPrskcrm0NWrJsFokzpnQutdgU3GCkevB+AxS3LQ==
X-Received: by 2002:a05:6214:202e:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6eaeaaecabamr227559086d6.40.1742300845903;
        Tue, 18 Mar 2025 05:27:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88332dsm1627986e87.181.2025.03.18.05.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:27:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:27:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc
 node
Message-ID: <nr5xdpt5sm6xwghcjwmwv4higr2saddewaifwdi7ysztyvh56i@26omyq26f4cy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
 <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
X-Proofpoint-GUID: T2mYv8zmIIB6yf_eFp8qurTSpZ-jyEM2
X-Proofpoint-ORIG-GUID: T2mYv8zmIIB6yf_eFp8qurTSpZ-jyEM2
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d966bc cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=zvJQgSryfyOLS6Et4DYA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=894 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092

On Tue, Mar 18, 2025 at 01:15:16PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > The CoreSight replicator device isn't a part of the system MMIO bus, as
> 
> the static kind, anyway - the dynamic ones are
> 
> > such it should not be a part of the soc node. Follow the example of
> > other platforms and move it out of the soc bus to the top-level.
> > 
> > Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
> >  1 file changed, 33 insertions(+), 33 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -278,6 +278,39 @@ scm {
> >  		};
> >  	};
> >  
> > +	replicator {
> > +		compatible = "arm,coresight-static-replicator";
> > +
> > +		clocks = <&rpmcc RPM_QDSS_CLK>;
> > +		clock-names = "apb_pclk";
> > +
> > +		out-ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				replicator_out0: endpoint {
> 
> Please take the artistic liberty to add a newline before subnodes and re-sort
> the in/out-ports to make them alphabetical

Ack

-- 
With best wishes
Dmitry


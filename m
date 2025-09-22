Return-Path: <linux-arm-msm+bounces-74414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FCAB904C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6FD17A466
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADC52F1FD6;
	Mon, 22 Sep 2025 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbahpWYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1A28CF5F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758539173; cv=none; b=BGuVgCv3SZs0ayav+Iv057zdWBdeC66tT62dGxJEUwHd7RVcsOeAUiH8P9SvdOpoz/2UTBOnQN4vV29xOzvQ2G4mRTZbe/7flawieJUcuiFI4PFGOXfT+pzL5r+4plHX9CFzRzZUH6MukOdBYOoK7ZTH2jugVr08ZlTm7J8V/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758539173; c=relaxed/simple;
	bh=3D33e54vFhRkI7EB8+PnC2w+49AByFHdS9kX4QjscAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5kp/bKtzD1nNBPIvs2eISmlrbmbxDfIKnRjbPNbi+5gd6sICuBLypKU2JyN8yKdh6gSnjTW9j61e94xO9Wxv7Xozf8UyKQYtbvNSdib89QRXGl/ewP/hktUoDrAMyXGJrh/lYXjpyis1KJmpB32gQcAItTP3qypoEb3wJRLqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbahpWYo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vsRp018208
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S4CvBzH+MPUnDHcYLcfIlZx7
	moXTcebiVUDcApcFnoc=; b=ZbahpWYo7mctjwmh44uYPTd9LOjdNoCQ5c/mb+dj
	idaRQGxqcRZncSRCj2NY/XGspHjL/Hw2siyU/x6W/kDyrZmvZBE7//AVXubf1jRX
	djadF0lEeCbVIQHF2xo2aCXwMsY8kadE3eCtp+jMaJlYqGtU5l637uQZYJzt8mmZ
	HVnKrRWB46MjY6wfhUnFJGxzXSvT0hNLf8cQWjDU8WMJEhFbaQUjcuzc07gQKwT1
	yPhLoA5/MEED+ogwbA3OME/KvGsvCJ+tl+L2sJRbVOjBNwYkcKvVdpzpdH6SJ3Ce
	X/1pnqwT3eYZu2zDYjKm8Np+GOI3SQ4jy5wR3qr8XkTQmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg34fud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:06:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-775f709b3ceso5949841b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 04:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539169; x=1759143969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4CvBzH+MPUnDHcYLcfIlZx7moXTcebiVUDcApcFnoc=;
        b=bZPh6ba1KHf5GidUFLrI5gbupqOQzKP7u0E69QM6v/pvF9O4BGQsqBfSZEINxiSyTn
         DOLkLjaU0dRdVNoYXfOHJCbwpLRm/UcnwARaKMjFFReGHL0Iz8DUqoNiIbfNbRJ2ynq7
         iVH5T4KyltH0mzhCrfic9NqiDRHel8e/eK/ZExrwT44yDZ9c4FwQaEHtv3hV2choEMiK
         3LKeYTvwWGH68m1fCAykvSrKVahU81da8GuT+CTPUN9lSrWt6bM3xp1Mxk1qkIaEF9Pv
         vaLrw/UJGPI2KgCZOw0In2u/g5M6o5L1FY0nC5Pt2MlZR35GvFWASVzJI/E6TiIr6jQ0
         XeRg==
X-Forwarded-Encrypted: i=1; AJvYcCU/KZyvcAdPZZOqhLGhYzf6vi5EK1BvzHMuHy4xohyUzEBTVwG+gFYTVd3yvu/Da1hEpSintAwCP7dpORsL@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqYS6r0jj36wsiqvE778SdFgannMHscOhBpc0+CbQPwuWWX5Y
	vqXxL7GgHSO86nwze/qIAUsKmUGU9kFxytut5bzutt8HGBvrfMCZ9Z/Omd4TFXQl8lAaYes5jd0
	XK25QwYPlN9Qb1k4ZreC7zbRVTDqPVNpa7y2bpJgyHJgNn6y/lLfyZxxryevknSlfYxO8XuX89C
	Rv
X-Gm-Gg: ASbGncvZTiWXZOm5MsvcmD+3VmXfjw0Bz4RY4HMyjIONX004oarc0cqwpCmZ44rd26u
	AWaC1QqAijv6iC4s7cWlLl5+5MDfV/sLb4kTaxn/yQjfMVF4cCj8dJmcwl1po37VYT2QP3MYtsa
	d1yrgDcibO2bSvcwlRrTCVqj+zGkSsoFScZSgRjgeZZXi/AiieZSR5mxzajYpHOV+F1JZBnP/C7
	eyktsy1rhlxdzFp1+iENKiSljGwYJ/ty4TfpXvgcA6WshOTVYrye/JHItw2gcHTo4+N29NuqYLH
	oNTf3rb6lwiBwfLjiUeEP1vQFLN1XLF5mwQB5QKOTBP4LW+qRJa60wVfKN4EzuJe1Vs=
X-Received: by 2002:a05:6a00:3e0a:b0:776:14f1:492c with SMTP id d2e1a72fcca58-77e4d327e41mr14478806b3a.12.1758539169336;
        Mon, 22 Sep 2025 04:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPlxb5HFtEJq1avVq3T3B7QdoJC7m3+GxYqUNnMVNDzH3ajVELMS6MIjbhEI1W1jB2moytPQ==
X-Received: by 2002:a05:6a00:3e0a:b0:776:14f1:492c with SMTP id d2e1a72fcca58-77e4d327e41mr14478767b3a.12.1758539168741;
        Mon, 22 Sep 2025 04:06:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dbc8e7cc4sm10919973b3a.29.2025.09.22.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:06:08 -0700 (PDT)
Date: Mon, 22 Sep 2025 16:36:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <20250922110602.ygduy4miw73642l6@hu-mojha-hyd.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <20250921-kvm_rproc_pas-v3-12-458f09647920@oss.qualcomm.com>
 <aNEHJv92i8NlaSO3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNEHJv92i8NlaSO3@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX6piBg5ILfObX
 HvD+0Ku3nBqUeUTYdG+diMu2l2Jht3fMfPxhwT9O6CqZWRWYf7chRdRUEPEioNZRDcYNTyaoyCw
 lTzd6OBFS1o5QOeqfMkhPsookoZg3lRziaeqkZBYBfk5F/FBBNOuoCoctS1BxbLaLswF3Zf+ke4
 E10QMlUfoFE7VCOYRXr4xYHgmfZYB5FLEBFFV/wtBrPcad44M8FGiHdrMbXZrd0ANExy0qQabLO
 rbrD2tatJlap/T7pmf2J+D3leGnBgcoU37HQbtJg8UxE70WusY8FAYYMXytlU69Hofmb9ysN7Kj
 b3HGI/PWTTniztFcyg17aPqr4lzZqSgHnhMqYAinVSHU+Ba6AD6B7cnOK+KH94g0RlDZHG9q/Eb
 H3DL8mMx
X-Proofpoint-GUID: 50cWRG2MR9fa2Bk-jdKTnIF8k8I9pdNc
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d12da2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=4ayB-8Y9th5rXJvH6UAA:9 a=CjuIK1q_8ugA:10 a=eSe6kog-UzkA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 50cWRG2MR9fa2Bk-jdKTnIF8k8I9pdNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

On Mon, Sep 22, 2025 at 10:21:58AM +0200, Stephan Gerhold wrote:
> On Sun, Sep 21, 2025 at 01:11:10AM +0530, Mukesh Ojha wrote:
> > All the Lemans IOT variants boards are using Gunyah hypervisor which
> > means that, so far, Linux-based OS could only boot in EL1 on those
> > devices.  However, it is possible for us to boot Linux at EL2 on these
> > devices [1].
> > 
> > When running under Gunyah, remote processor firmware IOMMU streams is
> > controlled by the Gunyah however when Linux take ownership of it in EL2,
> > It need to configure it properly to use remote processor.
> > 
> > Add a EL2-specific DT overlay and apply it to Lemans IOT variant
> > devices to create -el2.dtb for each of them alongside "normal" dtb.
> > 
> > [1]
> > https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |  7 ++++++-
> >  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 296688f7cb26..e2eb6c4f8e25 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> >  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
> > +lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> > @@ -136,7 +138,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > +qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb qcs9100-ride-el2.dtb
> > +qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb qcs9100-ride-r3-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> > new file mode 100644
> > index 000000000000..55a2a9e2b10d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/*
> > + * Lemans specific modifications required to boot in EL2.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/*
> > + * When running under Gunyah, remote processor firmware IOMMU streams is
> > + * controlled by the Gunyah however when we take ownership of it in EL2,
> > + * we need to configure it properly to use remote processor.
> > + */
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x3000 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp0 {
> > +	iommus = <&apps_smmu 0x21c0 0x0400>;
> > +};
> > +
> > +&remoteproc_cdsp1 {
> > +	iommus = <&apps_smmu 0x29c0 0x0400>;
> > +};
> > 
> 
> Would be good to disable &iris here for now similar to
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=c0f045e303e014cec5d883edf82fe5de74769944
> (I'm assuming it is broken without specifying the iommus?)

You are right, I should disable all the subsystem which is not tested
to work as of now.

> 
> What about GPU? You can load the GPU zap shader in EL2 without further
> changes in the drm/msm driver?
> 
> What about &remoteproc_gpdsp0 and &remoteproc_gpdsp1?

gpu, gpdsp0, gpdsp1 should be disabled for now.

> 
> Please make the changes in a way that they result in a properly
> functional boot without errors. Disable functionality that needs
> more work before it can be enabled in EL2.

Sure, thank you.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha


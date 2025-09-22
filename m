Return-Path: <linux-arm-msm+bounces-74405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F2B8FD3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 323A72A0036
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F1827701E;
	Mon, 22 Sep 2025 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSP6ajeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72026E715
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534354; cv=none; b=VKy2Ds8h0/QCd4Fx6JbKSdmvwM7PQX2pLeOO2vEgFDpj6Av1yCFTZxyiYOYqmbIqgoAUdr8DV+V+7JJO/BJ6S/j/zbOQtuSyRCO/7cItCTJqu2690fGQkqTe4rRJYoVvlabED5NbM2Sk9gexqmaV7b+hKSJqPnCErYLOZCNo+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534354; c=relaxed/simple;
	bh=jR7Vg3/b9fUyQ+tl410ezllkEOW4qNcBuf+lcTr3wFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn3Hyl5oFhMC27uNFAaVDaZ6m6AeduIW+qYvoxzSKMp2d1spbF2FunbY6P68gYldjssQJfc+hXJcztNJGJhZmG2+BKM0oD+M+DXythND1BMCMh+yXY2tQ0AGgDBdadUNZyPCjP7wJSxIAgiMpxq93GgQmZMyREzzxO5LREYoPtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSP6ajeF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90s3X007045
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W0EkpJuNJzvM/UpMfzArfzg8
	rpKA+/ukTR6O+NEzO9M=; b=QSP6ajeF1p/OfoerwhXLINeYQgKv7w2MFtTvWBPH
	VGHxDfpuGAJ8mqotT+1GssKRPo0jOBfkPEK3Ra3PqauPm9iiFiAsVNrHgE5DLi5Y
	hqfWGGmq4hauxTgN/tjREy48YBE5hIUNFu93dHFSXGJiW3c6xxPg4dOnqgeok5DR
	YTWacIRA9Wdk/7QklFfSb2/TRsKfiZBj2iRE5lazQlaheV9YHzX6+zPVsakJTRsj
	cBHN+D4yirfglFJjTLzLz1tAr8V0ypuDfKquibikQc0zF3cpmSDM8kbNrhyBrCDR
	9pJEAnL4MkNO78sauWoVTObFvc7TPYCQy1Ak6r7qLdvlmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnmhr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:45:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f290579aso86663391cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 02:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534351; x=1759139151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0EkpJuNJzvM/UpMfzArfzg8rpKA+/ukTR6O+NEzO9M=;
        b=FNwPyvuOwbNw8XQ6KLqx9I5urTlLzuyYxcQRGvtsYUjNdnBTLFVJuCYx8smzh5bbdj
         iiO9cPKQvpWjRgM1penUJlD5oxSHawJXryVWBVxNVktiur1fshdBA6mxno1+qr+l9ILf
         RIK6XXSdrYkHIcMpy3mYiHaQtH3MHcYV6TDr8ZcEkJOYuKwoBrcR8j0447OX6ZYenVvL
         TANPh9ws02rCgENRhenpBDxL85TVpSPZxkd9ZsAs5DX0Pmb0Mkdyrc/8YUpIUGYFS7gI
         cLRk+HA/mE8nU3j8qFv3L4BLhNz3AkbnYdKvR3IuiaeLpn6EcAkKX9XabrmolIEb8vfG
         frdA==
X-Forwarded-Encrypted: i=1; AJvYcCVBd0zR/Y4VfPv2VzFvIJIhJaO4yR051ZWVkly5tv4S0XNpyNfR0Er4KvhxH5i092P43iPJwck/Dx/SQR4r@vger.kernel.org
X-Gm-Message-State: AOJu0YyH48USgFgS9+JNk8IIUA2kYbsUkVPRetnz/hk0Q/pw00bkkTO+
	h5AgQVy919dbz0J6okFsU4G6WpMAYsLoD8CIl6tSLfVz0/l03qRTxscHMiC+MAFcHvKckXddnP9
	+t0Ow4kxbEI1mcPAcmq1gtDav82yWjEjmUUN7GET/NPE9qaT1xufcwAIu1GTIqaiQgXXG
X-Gm-Gg: ASbGncsFQvGbzK0ChxTKe3yd7dDvTBXZyJr7MpgJ12W78Qa3G0C+XCGJ+m7leVBp7rB
	Sn8SZjKaFjCfU6+Kofg/uhb/sLvrBgZXRXeYZUgyZ0ELNertz1TlPPOlwssxBxgMThdKgaARczN
	8f2Y+6t6hiI4fer8ALw1IobBQeJyCCuSybKt1pYMowh9+vmI5MxUmCxFDW5LTF8bwfW8CHuaCUD
	ovEIA1KoZsvURy04tRPCYpvUCc8CuLIfEJxImreVIEd0lDF2rb95XPKYHz3OC7FaULgnTdFxY7L
	pJeuMqnwfwGRb9fr89wm+BwiOqaRFh3vMsyAPmvGuslBpakJog057OE+uqQR/FgeWR3DgjW55O5
	9SpInUrS6wrXX15SNnm8832+jnWfabSrnpYZbs3GVbDIaIaR1xuai
X-Received: by 2002:a05:622a:228f:b0:4b5:f5ef:5fe8 with SMTP id d75a77b69052e-4c07104b016mr131682511cf.32.1758534351194;
        Mon, 22 Sep 2025 02:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVWjR+4vgOsePjn/CB9WZu/Pei26UIPflbd0gu92L/o+rhj5rmsKA6/RW+80WDu80POfqZfA==
X-Received: by 2002:a05:622a:228f:b0:4b5:f5ef:5fe8 with SMTP id d75a77b69052e-4c07104b016mr131682201cf.32.1758534350531;
        Mon, 22 Sep 2025 02:45:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44771sm3214997e87.20.2025.09.22.02.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:45:49 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:45:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d11ad0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DpVyi1o0YMp1h5EDp2YA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: rek8NEo35purs5VvZeBWOZbDz_Ut4_lb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX6sYDipapCya3
 lk0QaiuR2gmlil57W32VvkTWl5wO+DrZInNS3I4nHNw/Ktv5CmNwF/CWHU6f+eub9hOV/b3hwL+
 +Suq1b5HiGNK73zzsK35AWyiTGGIgApWMe+RPv90EO6WZXx4NT2jxl01lWnEOuHhhdM84d2V3i7
 Md0ojxcllrCclDMbwjAUXuPKzeVX1g9qVINod6Ge+M68JLsMhWT8tiQ9qWYWVKGP/wtNLPduGza
 w5v5ShVmjq6gRSpnGbywFUKIu9fQdP6oTTpMQ5fWREd9j7s9Vj9m/8Ic0Qbsrfue7Xo5k6jPUh6
 xeBiLIWkqZtmpe4rrurnLnhHGnRD+FMKwO03JJ4E8cKVusOZUuFrQzZ0U89cRTZmwPRFlxkoEDI
 r+aWOVFd
X-Proofpoint-GUID: rek8NEo35purs5VvZeBWOZbDz_Ut4_lb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> >> Add QCS615-specific configuration for USB/DP PHY, including DP init
> >> routines, voltage swing tables, and platform data. Add compatible
> >> "qcs615-qmp-usb3-dp-phy".
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
> >>  1 file changed, 395 insertions(+)
> >>
> >> +
> >> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> >> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> > Are you sure that these don't need to be adjusted based on
> > qmp->orientation or selected lanes count?
> >
> > In fact... I don't see orientation handling for DP at all. Don't we need
> > it?
> 
> 
> Thanks for the review.
> 
> I agree with your reasoning and compared talos 14nm HPG with hana/kona
> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
> registers you pointed to are programmed with constant values regardless
> of orientation or lane count. This has been confirmed from both the HPG
> and the downstream reference driver.

Thanks for the confirmation.

> 
> For orientation, from reference the only difference is DP_PHY_MODE, which
> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
> SW_PORTSELECT-related register, but due to talos lane mapping from the
> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
> orientation platform (not DP-over-TypeC), so there is no validated hardware
> path for orientation flip on this platform.

Wait... I thought that the the non-standard lane order is handled by the
DP driver, then we should be able to handle the orientation inside PHY
driver as usual.

Anyway, please add a FIXME comment into the source file and a note to
the commit message that SW_PORTSELECT should be handled, but it's not a
part of this patch for the stated reasons.

> 
> 
> >
> >> +
> >> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> >> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> >> +
> >> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> >> +			       status,
> >> +			       ((status & BIT(1)) > 0),
> >> +			       500,
> >> +			       10000)){
> >> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> >> +		return -ETIMEDOUT;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +

-- 
With best wishes
Dmitry


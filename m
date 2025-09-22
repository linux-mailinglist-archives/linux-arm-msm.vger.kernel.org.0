Return-Path: <linux-arm-msm+bounces-74480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD0B939C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EF821689C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 23:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AED42DEA6F;
	Mon, 22 Sep 2025 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyxQCKkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE92E03FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758584342; cv=none; b=QNzqedvZ31mUTYkqQu+zoxv+N/4oMPSoER5tX15GsNsefzcPSF22oty6XWcQZqgUuG8L6FQuSSBGnj1IwLS9e3wsEBh3yCUm6ZHkLxZySQmJdVu2sOTBKnGEP0UnC0xHh9zjPtPT8M9MoMDpq3kedw4WLIArdQ9+vYK8T65UVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758584342; c=relaxed/simple;
	bh=F+pkjbV7ocCBV3BFK0NMSTsA051pGpKjyZu+2+drdMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgkxgPyyAVhHHgoe86mOyS7zI0xKbWa8BGNzP1BQiseYr7uAOy0sNTN3nh4xlO2/fHeIxjo/6N23DFAGI+DALmjE80cC134ip7F4AigSRgCU6QQjFDRM7Wbx6X7Af+kjLIs+si6Z/TFB27U9s8GDcRDZYiKjGhBMMOeAxD7WPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyxQCKkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGOCRF012996
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e5TvOCaHalM32QUUJdndPnHbjMULpv/tXt4BpcYo4Xw=; b=RyxQCKkW5kWPhVUt
	3GGAY8PcspEk4oILlwudowluIi8Z+6u5eKYlLEEOiSyDdqlvsabyObnFBMoYp+jL
	BJ8AAQT8WKgG9Uzm96aqnEXEYTYa3u239R27+K8kwxscKc9zu3RgSH4HoFLDqax3
	Q/LQ9lp3tVXTQBlra5ArxzWujzbmK/+JTQ3DjamvAon3Mjc0NNTGD4GwAC4wZmHP
	0SNNkIA+al9Ygp4mObCquxSfIE8E09jYVPbnW1BDiV88K/+B02ArWbkPp7C5CnlG
	/ClpR6MGV2fyjJTKtxZgtiaxubK3uzdgkuYQUdF+XVMFdHRJKXKiyl3HZOToD23s
	1HfR6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg36ftr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:38:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e30eaca8eso41118066d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 16:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758584338; x=1759189138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5TvOCaHalM32QUUJdndPnHbjMULpv/tXt4BpcYo4Xw=;
        b=T4a5nk38hi3PzOfEZZCx7i1CcrbKMMtbuPT8supaCC0DPm6hTM34fhuU4XyelxgcY3
         eMzT1YbkI9ri5wFSKzH/C+Gd6+4ZoeWusEQlfnWQ9bYwjezEVleMgT5u0aMWc4DZ87rQ
         wX4z4amX50aDTGaolpWHIUv8uyA/lGUcXFIxz3hiBSzi6kvNSHT9oieFv42mg7LnbYMS
         RpbOlFp6SmsitqmXZtqgar+7rfnXVBjFST5Ns0xP7S+q0FayOv5O3xUW5p+u58VZx8Dn
         NyILKPicALSHNcyDBAH9WJc7m9gL2Sm3xfq+Y5lRVWUaF29PFi5bVbSbKYXxRcPVDnnc
         b6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW12geY3i+xbclPmnEchxD6ad8ww0nzLXK+dFn8X6B1u65aZQPgjV8XVf5v4F+8T6kb7gfmHIhULrgWWXGU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1k5IC0nA4XzSAOKCbGMAFUgfwDoR7EObX9ySGJVf8cMi3ZOdE
	Dc85d2pPEcAXuD59Xm5EN4ZwNxv0FlKnoYtxpqePTRYvpq0yBeL3kp5/9NArXcmGRebs2ecB6Co
	cF4PT5JfqBYNHUibQYsXYAZ4V1RKz9EKAexuWYN1w6OTVTuuhq/IQaEUNDOD2wwuXDBMg
X-Gm-Gg: ASbGncsJUsk/iFR4ySocwyXxTtrVzNOGW9Rn8viAQa2drPaLbUiDqDey1lt3Ez85s9i
	traBX45ksrThdkZVnXGl0l2+WV6T0M5OihOfgYMie2KmjMTZJZVYx7itq5CN6MS8NRW9unYUwI8
	dbvrss9Ai0UvWiZEbO2wGfhn9SWfG28FX7yqESok3W0b2K8+EGqZPPB8x90YVjIPDM3ZWaUQQ9a
	GjagFFZxM6c3om4w5nj577F8pCGpLZK9pbr5PdLX0fPo3hOW+/HT0Wg0yYVWDUS7ncQTeN7A0Pi
	+ai3NCzhjh2tdQ68U8x3830e0FJMTR6CyI0mBm1nv94jauihSfLDVCEbUaZX4yyNTGT3ept6Zaj
	VcAkqPwzXyvzJpgOAgfulK7MXDcJS40+/y/iq8VaTQDiJiZesPpv8
X-Received: by 2002:ad4:4eed:0:b0:79c:f4b0:6813 with SMTP id 6a1803df08f44-7e70381f0aemr8294936d6.21.1758584338156;
        Mon, 22 Sep 2025 16:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUSFjg5iWYzh+WxjwkEqcZf3xV54AJeAPRjTMWZAiNEPSIO65hMhienoOLDZE1fB+/IhMYg==
X-Received: by 2002:ad4:4eed:0:b0:79c:f4b0:6813 with SMTP id 6a1803df08f44-7e70381f0aemr8294756d6.21.1758584337686;
        Mon, 22 Sep 2025 16:38:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b7e33b78bsm2117111e87.45.2025.09.22.16.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:38:56 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:38:55 +0300
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
Message-ID: <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
 <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
 <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfXwGjUdoikJNUS
 Qd0R8V/4EKgE2q8S8k1IbKdh5t8aske64ClgiW2PlLG6gx5qEv5qs7oV0ou0EYA5apNrbP0t3bM
 KA2ZnMkSzGv1fwH6xBjgkTDS61OPbN8SYJ0tV3ls9gixskCbJn31lfJePglKrj34V8W6+XER9hX
 Oejk8+QIpJ1C+AdfVorrmOK/bFuiwI4v3cJiOE8Q60GQWR64IVW56gLSofD1cfn4qWrrdh0Zqfz
 GfT+JFsCN+HfXe2KQk1Vu2Bf4r3pFPEzLDOSl7BcD/4ku1Propu1PQNxnjFKaW4RAi4nez/6Rwl
 /O+jn39WTR6IBWC72yKsnc9Mjuo8FjAXzwEKwU4/HON8Mjptn+WUC3h/a6foIN7RNucSJvhlJsI
 h/hyCU9M
X-Proofpoint-GUID: d3eb5rRXjTVoXPGHHUdD-FQR5Rl2X2hZ
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1de13 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W0oVTkMUdJ9i6-1frqUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: d3eb5rRXjTVoXPGHHUdD-FQR5Rl2X2hZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

On Mon, Sep 22, 2025 at 07:28:17PM +0800, Xiangxu Yin wrote:
> 
> On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
> >> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> >>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
> >>>> routines, voltage swing tables, and platform data. Add compatible
> >>>> "qcs615-qmp-usb3-dp-phy".
> >>>>
> >>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
> >>>>  1 file changed, 395 insertions(+)
> >>>>
> >>>> +
> >>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> >>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> >>> Are you sure that these don't need to be adjusted based on
> >>> qmp->orientation or selected lanes count?
> >>>
> >>> In fact... I don't see orientation handling for DP at all. Don't we need
> >>> it?
> >>
> >> Thanks for the review.
> >>
> >> I agree with your reasoning and compared talos 14nm HPG with hana/kona
> >> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
> >> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
> >> registers you pointed to are programmed with constant values regardless
> >> of orientation or lane count. This has been confirmed from both the HPG
> >> and the downstream reference driver.
> > Thanks for the confirmation.
> >
> >> For orientation, from reference the only difference is DP_PHY_MODE, which
> >> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
> >> SW_PORTSELECT-related register, but due to talos lane mapping from the
> >> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
> >> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
> >> orientation platform (not DP-over-TypeC), so there is no validated hardware
> >> path for orientation flip on this platform.
> > Wait... I thought that the the non-standard lane order is handled by the
> > DP driver, then we should be able to handle the orientation inside PHY
> > driver as usual.
> 
> 
> Yes, I have confirmed this with our verification team.
> 
> For the non-standard lane order, handling flip requires swapping mapped 
> lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
> This is a hardware limitation, and with the current PHY driver we cannot
> propagate orientation status to dp_ctrl for processing.

This might mean that we might need to make DP host receive mux
messages...

> 
> 
> > Anyway, please add a FIXME comment into the source file and a note to
> > the commit message that SW_PORTSELECT should be handled, but it's not a
> > part of this patch for the stated reasons.
> 
> 
> OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
> related commit message.

Thanks!

-- 
With best wishes
Dmitry


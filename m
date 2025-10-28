Return-Path: <linux-arm-msm+bounces-79286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298DC16E2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574521C612ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76142DCF58;
	Tue, 28 Oct 2025 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1YOl+J8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZlL7Yqq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5BC2DC78B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685841; cv=none; b=pYT5afDFcxmY9uVmii/8rT5OlUFDnOS1Izf3otvsAUAfFpgUHas4oFXbaqKz/VAM1kFda+4gvjZ1f2yaCt7n0evFQT8ALjHLZF5TUjY4zTtOq63i+imCZmtZHxdJOO4AdnXVu81H52JFWTMeAhPazYqATlVhWPGsD4QfuFpEbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685841; c=relaxed/simple;
	bh=wWEIQUfpt8AnGuz1LBxRlSzMsYQgoN8G+nu7WqAfPYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3Nvw1BIXXt4aQj0HDIe5X1rYrAKmajtiSpiUVQddDGo3xoYbI84pA5WOUMPx+rqXK6ejIwiLXKmiYgaL7spWii0dq1MJj4p34CbCJ8miVP1T/UHoI135rGcA30dSNRKIHqEwmmrS8yuln6b0D3F5oGC/AhjP7dnVf8H+n9gJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1YOl+J8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZlL7Yqq6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJr0PD2511405
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mqr6jI8kEn36wwEAP0spn6W0+YbPiO/jF1iak5N/mWc=; b=d1YOl+J8vzWcYr6h
	0ZvgeWSN8INT/4QS9WRMOceyOz5L+QrE9RJ73/vXnHn3DPt7mmhImS8D3uNdSzZU
	iqQw/UgznYLn7Pa0RRYAAjNGZ/52WkyrexkJUkjg4ydw2JEG2YxAbqZBS/N7bSdH
	xv6rcRXXn7HxZNTTZR6IwVxFuk1AhWAEoJq1DmIfzQHmhgijdh0gzGF8S/If5b5d
	3vgHLiemWTUDQjZnh1BpbMuW2VEb7s6giEeBcQknO1ZrJQFuDviU69rSRYKh/gof
	rIIGIjZSRTZWkcQVNgpOKi6Ulm0SpiNfk9BUcn8xFRR/eAZ6/EexyIXBjHOojJH9
	5Pc08g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd85um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:10:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8bb155690so85891021cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685837; x=1762290637; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mqr6jI8kEn36wwEAP0spn6W0+YbPiO/jF1iak5N/mWc=;
        b=ZlL7Yqq6Pi7gpNlZiEqN7EooaYgJxn2dlZUVBppZjtystyD+2HEHMJr9sO4jGgHqJy
         lG1RYMH5UeAqzVSxqy9esqRR5GM2+EDNGg5USrP3z/FRL6+7Dc8JzOHe7WuVQLX3FPme
         wcMy3hwMMsIMUemnLNDbjr3eV3I5tgtBBUwr4X6Mq7WUhjOGAnHvnZPaSwKEJiGVwa2i
         WX5K8Szfhr3DPRx0iNk+MXrila2eULa74igCvGxB5QtB858L1STgd7gPBDmvT251IA++
         RCnH2O/f7anZJDSLLqP8imdo3/nczjBF8E4EZHIvwMQfr1XwLOPDZc8Edy0Kb+Ffz2VN
         heBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685837; x=1762290637;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqr6jI8kEn36wwEAP0spn6W0+YbPiO/jF1iak5N/mWc=;
        b=rk6vQgmVkn7d6TSVx2Ol4BwF5QjN17whWRrgf/A4S2wNA9/5Nvpzp/k4eLQtaT2gwq
         Owu5v0/34r0rd9pL1+rOY9aI4veL/qYkznTDvevtYJ+W0obRhrW/MRrtfQQ+1Tg5f49p
         GiG5u59OWk+ephKfMYVch/1on3JyXJg+wSuuKK4f9zOQz8SZ/in0DGMbCKXvLEnakaf0
         0EC4w+3Wl3ldc2gco23Ytjaf7BC0imzhhAnn5yiLCXw6gVTZLdCiwZZdQXcQerwugou9
         rh7MpVEKsvpzU/xq09nFDjdT4sCt6w7M0yJCXBUFgfwGC1UqUh0XOP5Ny9VgsszhQc89
         V+mA==
X-Forwarded-Encrypted: i=1; AJvYcCXZaA/B6CL9mRohkcth28XJQDwJE1e/oc7aM/GlNRHTlC2ZM8S3MgN6RoQLbNo4qBnUKOvVbAfvc2kgoZIt@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrFiVBNb5mTKer1Sm8dFZdsAIHu5drJkErRtziiaaTGC0MW9v
	XO2MswrpJBVbksmHY64u+6BC+1MN9xTmG0Q5Q6nw1B8iKdhwXfkvPL2rwyFT2wyd9GK3B75OPTh
	WBwmOv/XiK+qrE9gttXktB8SP4U4BVWMh69HoXomAPO8Edb+M/bqqcufUlc7N/Hg4ypLfFZjcSp
	7o
X-Gm-Gg: ASbGncvPjdpoegSluOUeYYx1CHtUDbxzebmfqyrnJHa6vLxm0w/jDEx8dod1wrQ/DR3
	TxbzPlCdhd9FgMCwZeG03zXWzNFiL99Rx0R0myJiCJvJfMbAC6YGz/iCa0apdspJVCoxp+QUeEU
	7YP/m/WOmBwqJxUBaubDElXEzMn5fgXCDs/wW93Dt8R2Gqh1PL7Lw8p6cFyhHUl3CP//eAWAX/r
	lZD/rgjalVs5gkvnPI/UBgBzIIoX8trZT+5OEVcbaup0pxJb/T91SF7CkiAYHHRBme0zR3ombeC
	phSQQ5bLwP3nfj4uQP2pDE6qW7e/g9OPDfBLpkS8FYMSdRpI53Z4VNMsS2N5n/SWAH0nMxTWfCD
	9JD4/q1djfQvtbbSGgekftiR0vTUun7CcTB1tBf1MDZ9ljf/pbgykn723qEJZpnEjJTFmYKjVQ/
	rk96NiYgtix1lx
X-Received: by 2002:a05:622a:a13:b0:4e5:8352:9db2 with SMTP id d75a77b69052e-4ed15c53a38mr9670971cf.74.1761685835460;
        Tue, 28 Oct 2025 14:10:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4tjibJm7dG8AJyDHRzmtH6DpuGiCZjw97dxYBt3mz9bXp88WMGifM0FnhLxqp+1uYKy6www==
X-Received: by 2002:a05:622a:a13:b0:4e5:8352:9db2 with SMTP id d75a77b69052e-4ed15c53a38mr9670501cf.74.1761685834897;
        Tue, 28 Oct 2025 14:10:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5d9fbsm3281999e87.56.2025.10.28.14.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:10:33 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:10:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, krzk+dt@kernel.org, conor+dt@kernel.org,
        konrad.dybcio@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <7pc3m2pzp3hzogg5ygorsmv2dy5vw2xiebppcbx7tzp4jnhuom@epgtkjpniyrs>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-8-wesley.cheng@oss.qualcomm.com>
 <zaotrz6upmpwv2w65633rlflubmykzn5dqiydl66y7rdalld4l@bo4oto5iynor>
 <9d3dd1cf-4969-3dcb-18dc-59cfb68033f7@oss.qualcomm.com>
 <39732bf6-dd6f-b808-7c10-b3faa4d46489@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39732bf6-dd6f-b808-7c10-b3faa4d46489@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OLHgfN0ZLDw1j_KroJNS4_WHpSqNUg1B
X-Proofpoint-GUID: OLHgfN0ZLDw1j_KroJNS4_WHpSqNUg1B
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=6901314e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_2V7C_1fM0J6bjkbbwIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3OCBTYWx0ZWRfX1MWYKQMgmeZk
 RcUINwvWanVM4nmfpO4A3zdsV7MiQYGa2q/jm8rnI0TQ44d3u+x/wAJPghnScTxCztrk1kTO+8b
 jyIDfqYdvcgpeO5bKTNZ5DDqZjufZrQR6DB5wBxKztP8yIhuta3gzGRjG1Iay/gVSid1rktnwd/
 2hhD62Gd4Gyd4ndTOsfBAMicGUnmxq37/eJOPF698TBqQ2VIRUPlArmnhboaT33Amk601zEdOFD
 EZm7wmFDndzkNH4Ey1PjQrKe9rMk9/vhoDQ0I4yzBVrvQwVs311DlvGFHcpRMt3FVColnwNzx6r
 q/uhCGeoBNdPm3aR6zpVY/EdVsrZLHedshgStvcRaxVCY98Zpr+8ggOb0CRNCBdMbCCuqFkZ4XR
 KTFbZVItllOmtiAcUQrIlq0ZBymz6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280178

On Fri, Oct 24, 2025 at 05:41:18PM -0700, Wesley Cheng wrote:
> 
> 
> On 10/24/2025 5:02 PM, Wesley Cheng wrote:
> > 
> > 
> > On 10/24/2025 3:04 AM, Abel Vesa wrote:
> > > On 25-10-06 15:19:59, Wesley Cheng wrote:
> > > > For SuperSpeed USB to work properly, there is a set of HW settings that
> > > > need to be programmed into the USB blocks within the QMP PHY. 
> > > > Ensure that
> > > > these settings follow the latest settings mentioned in the HW
> > > > programming
> > > > guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will
> > > > have some
> > > > new ways to define certain registers, such as the replacement of TXA/RXA
> > > > and TXB/RXB register sets.  This was replaced with the LALB
> > > > register set.
> > > > 
> > > > There are also some PHY init updates to modify the PCS MISC
> > > > register space.
> > > > Without these, the QMP PHY PLL locking fails.
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > > ---
> > > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 314 ++++++++-
> > > >   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
> > > >   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
> > > >   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
> > > >   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
> > > >   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
> > > >   drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
> > > >   7 files changed, 1240 insertions(+), 1 deletion(-)
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
> > > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
> > > >   create mode 100644
> > > > drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> > > > 
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > > b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > > index 1caa1fb6a8c7..8216820e388f 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > 
> > > [...]
> > > 
> > > > +static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
> > > > +    .offsets        = &qmp_combo_usb43dp_offsets_v8,
> > > > +
> > > > +    .serdes_tbl        = glymur_usb43dp_serdes_tbl,
> > > > +    .serdes_tbl_num        = ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
> > > > +    .tx_tbl            = glymur_usb43dp_lalb_tbl,
> > > > +    .tx_tbl_num        = ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
> > > > +    .pcs_tbl        = glymur_usb43dp_pcs_tbl,
> > > > +    .pcs_tbl_num        = ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
> > > > +    .pcs_usb_tbl        = glymur_usb43dp_pcs_usb_tbl,
> > > > +    .pcs_usb_tbl_num    = ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
> > > > +    .pcs_misc_tbl        = glymur_usb43dp_pcs_misc_tbl,
> > > > +    .pcs_misc_tbl_num    = ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
> > > > +
> > > > +    .dp_serdes_tbl        = qmp_v6_n4_dp_serdes_tbl,
> > > > +    .dp_serdes_tbl_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl),
> > > > +    .dp_tx_tbl        = qmp_v6_n4_dp_tx_tbl,
> > > > +    .dp_tx_tbl_num        = ARRAY_SIZE(qmp_v6_n4_dp_tx_tbl),
> > > > +
> > > > +    .serdes_tbl_rbr        = qmp_v6_n4_dp_serdes_tbl_rbr,
> > > > +    .serdes_tbl_rbr_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_rbr),
> > > > +    .serdes_tbl_hbr        = qmp_v6_n4_dp_serdes_tbl_hbr,
> > > > +    .serdes_tbl_hbr_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr),
> > > > +    .serdes_tbl_hbr2    = qmp_v6_n4_dp_serdes_tbl_hbr2,
> > > > +    .serdes_tbl_hbr2_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr2),
> > > > +    .serdes_tbl_hbr3    = qmp_v6_n4_dp_serdes_tbl_hbr3,
> > > > +    .serdes_tbl_hbr3_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr3),
> > > > +
> > > > +    .swing_hbr_rbr        = &qmp_dp_v6_voltage_swing_hbr_rbr,
> > > > +    .pre_emphasis_hbr_rbr    = &qmp_dp_v6_pre_emphasis_hbr_rbr,
> > > > +    .swing_hbr3_hbr2    = &qmp_dp_v5_voltage_swing_hbr3_hbr2,
> > > > +    .pre_emphasis_hbr3_hbr2    = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
> > > > +
> > > > +    .dp_aux_init        = qmp_v4_dp_aux_init,
> > > > +    .configure_dp_tx    = qmp_v4_configure_dp_tx,
> > > > +    .configure_dp_phy    = qmp_v4_configure_dp_phy,
> > > > +    .calibrate_dp_phy    = qmp_v4_calibrate_dp_phy,
> > > 
> > > So I see you are adding the DP related config here as well, but it is
> > > definitely not compatible with v6 N4. I'm assyuming you picked v6 N4
> > > as a default
> > > just to allow the USB part work for now, right ?
> > > 
> > > I don't suppose we can drop the DP related config from this patch and
> > > still have the USB part working, right?
> > > 
> > > Otherwise, we need to mention the fact that even though the DP part
> > > is also being added, it is broken.
> > 
> > Hi Abel,
> > 
> > That is correct.  Without these defined, the USB path won't work, and
> > we'll need to supplement this if we wanted to add DP support.  Hence,
> > why I didn't add any mention of DP altmode in the commit text.  I can
> > clarify that we added DP placeholders if that makes it more clear in the
> > commit text.
> > 
> 
> Hi Abel,
> 
> I take that back...I went back and reviewed the QMP combo driver again, and
> gave it a try w/o any of the DP init tables.  SS USB is working fine.  I
> will update the patch to remove the DP entries.  Thanks for catching this.

Please provide a proper programming for DP part instead. I don't see a
reason to provide only partial support for the device.

-- 
With best wishes
Dmitry


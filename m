Return-Path: <linux-arm-msm+bounces-71884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA2B42325
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4EF3A7253
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B39C30E829;
	Wed,  3 Sep 2025 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwncmWqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC530274B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908582; cv=none; b=tv9Y60o7zKpMaX/impvsd3U6OhJYetHrwnxcrxS2irS512ZYSod16JJSllnQgr7P20BkzTpYCVTQhZnxOPheCNChh4YWkS95Z0yYKZ9SpzEESb20Ghicg5t/VBNftLrlYnbNn9lMjByoEbRf3kupexu2cfrDRr/A1cSrHsfmOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908582; c=relaxed/simple;
	bh=TvnSEky+I/hcCDfjzKx/iJPx3TmGanCVAOkD79HsY14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obLyNntKg0J6uqTn+exQpO0vB4zoxkKzao2pwin9FA/1v+kyVe2RVYOiWorh0k8xSTCCBvAei0fKLtlD1jPW/4tCkJH8DSLWkJIK1xyAVZPUajroqyWXAR91C4AYTB4ekYcw2qbmzPzhVBIT7LsfIsJFGjB6HbanZvMGxzMU+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwncmWqY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwx9P007619
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 14:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CMWxv5xRO7vQNpmuNbCUfyRE
	hvMOz75QP9nDPESq41M=; b=bwncmWqYNQsU6rkPu7jyksrByM4wFj7kl/eOW5y9
	jljBgfv9NvGc7ttpZ3VPkOv4HGgyG4uw6kN3KNnysY1RihGlBnIbxhLj98YLjJcW
	S0T8l5UDgsG4rbenyYaVVTyRaEvbdnedIFqhNmK33WSOSuo2f3AubjSBH0M297iJ
	CmYIhPY0yTeIYcroFY9BELHFDLqQsQJw2tG0M0emh7ZY2jKq6T1Mgp3O9x9OVoqk
	PCAKRvYbDezFsaayReRfkMgQp3iVT2lQ9jVq0oOP1TWVA+WBr3tsgFnanR+l5ipU
	FPp1uGZOrq66oPtcG7t+YjAgVnuhGeX7+eDf9XAcyZPP8Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv42g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 14:09:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77260b29516so5453935b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908578; x=1757513378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMWxv5xRO7vQNpmuNbCUfyREhvMOz75QP9nDPESq41M=;
        b=dQWqH9yuCu/17C1vJbnnkuvPdd73FCGBFQy0osxZL9626EkF6NRZHVpbC2fE/rbyzl
         YqEHGYtJrurwuR5hLaRCfCWL58NmJk1ofz5GStFnxpcU8GWMQGodIlNUsMdatp9enrKS
         CHDiGqzLg+4FKoYVzuJD0H+CkfDEzW8Ri+LytD5e3nCAB7i1PMa0jNgPBC1WiaEljaH4
         dFPue1dlsRrTLj+/+U3w7SUJR9wb18Wa2HK4D3lBdlheLx0iU1QldN5MxNMAEcCss+v0
         oyYYjveIRF3jhHd+Aaa0Peawl6Px/Z9SaHRyHqcG8Mn7uFtC3c1CWdCJY0pDxOPH7zKo
         FXeA==
X-Forwarded-Encrypted: i=1; AJvYcCW3C7d24Kd5xVOg//xwRxTR5z99TDgQEUFIBWrfvmS7skgqdJK/n+db9bj4wUXn1ab/+cGzTqKNhFGew5TQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7YoFiJreYPfs2F4NYlOGA0ArRFqhxAkagKCnZ+daOTwtvFmy
	EvGijthuuqgwJHKsvCqFhTw6vRsg9r72o3kPzpk7nHqCT+DFXBiOK+c8GrY8im6H7pnP59wXDPH
	1hVZ5J4GBbDBx+ZR2qcdSqtk4mVsKMag9fcQBXiiOfWJebJ04YMosT6u2aS897J1IOqkM
X-Gm-Gg: ASbGncsuoNIE/rKVIsobM6bBjESBz3BAZ2kC2t/muJSJCvUU/WkthRxNvoQFj7IiMQa
	sj3EDWDQrpaHZMFemugKxGYfcR2ybjwas5R6qhZVKCSUCruGgKoCDrFzUt95NA7nU5MHJqYB+s4
	lD6zc+JWUeN//qhACqQGdh27116de3vdbIq3JxooU8Olp/UsMYGmu6D5SXcyYW8tG+LlGhDJLNg
	bfwjRRSRNAmitZ3MuV2JplGh+WsSnQUhyQRarfC0qEuoFbruDOshWNum0Xyx6DhYsMLhDa8DK8Q
	vlrgfSeEGinkhoCDyTUivwNkPXI+cFnP/L4JHMkifSAM9evJLOiNIAV2MA2yqsrozzyt
X-Received: by 2002:a05:6a20:394b:b0:243:15b9:765b with SMTP id adf61e73a8af0-243d6f88224mr20614969637.53.1756908578230;
        Wed, 03 Sep 2025 07:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnCp+vvKKkuvuED7wTrQo1zor2bNpm9NFlssvs7m5xnjpf+qEF4sVjkIPphK8md3x/czILLg==
X-Received: by 2002:a05:6a20:394b:b0:243:15b9:765b with SMTP id adf61e73a8af0-243d6f88224mr20614902637.53.1756908577686;
        Wed, 03 Sep 2025 07:09:37 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd2ea3a04sm14652518a12.38.2025.09.03.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:09:37 -0700 (PDT)
Date: Wed, 3 Sep 2025 19:39:30 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/13] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <aLhMGqYGzabIoyjS@hu-wasimn-hyd.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-5-bfa381bf8ba2@oss.qualcomm.com>
 <olv66qntttvpj7iinsug7accikhexxrjgtqvd5eijhxouokxgy@un3q7mkzs7yj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <olv66qntttvpj7iinsug7accikhexxrjgtqvd5eijhxouokxgy@un3q7mkzs7yj>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXzcz3Myr3l6ny
 JtGM9hKoaLF1U1I/+7T3JZdaMg344sjKOT341DKKHDCgz6O08B/3TcJ0fbfW3IJMFg0h1LgMn+V
 grXyGoH5quQplOLo9qo2mhShtCDDNOyhS0ZxhIEK1vLISbW9tDTjHcKTDiYLb+G3gw43gTzlzVa
 DccJea6jKK3toZqeYv/B/g57c522GK6O32omGbjPdDHxrGW0hc4ZHsHKvrobS3bp/vThA4AqiGE
 e/Go1TCRiFudRVAQFuwvKWz77N+QbZx0Cu8+xvhPqGiDuwPCnBZx2qWO+U+NNQaX8OGmkPcubaP
 aYc0RiuiRqAh5NRT8umpl/V7y26Gi+FFv64qU4xXdgggeG2z6lJmqG+/mXDdOfYRDs/bNR2FK5s
 b1ylZdhr
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b84c23 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=s9hxLQQvB0vJ1QCIATsA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NmXJmYr45x80ctGEwhvO2Dqypa0Pyl0W
X-Proofpoint-GUID: NmXJmYr45x80ctGEwhvO2Dqypa0Pyl0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On Wed, Sep 03, 2025 at 03:16:55PM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 05:17:06PM +0530, Wasim Nazir wrote:
> > From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > 
> > Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> > interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> > DMA and peripheral communication on the Lemans EVK platform.
> > 
> > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index c60629c3369e..196c5ee0dd34 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -277,6 +277,18 @@ vreg_l8e: ldo8 {
> >  	};
> >  };
> >  
> > +&gpi_dma0 {
> > +	status = "okay";
> > +};
> > +
> > +&gpi_dma1 {
> > +	status = "okay";
> > +};
> > +
> > +&gpi_dma2 {
> > +	status = "okay";
> > +};
> > +
> >  &i2c18 {
> >  	status = "okay";
> >  
> > @@ -367,10 +379,18 @@ &mdss0_dp1_phy {
> >  	status = "okay";
> >  };
> >  
> > +&qupv3_id_0 {
> > +	status = "okay";
> > +};
> > +
> >  &qupv3_id_1 {
> >  	status = "okay";
> >  };
> >  
> > +&qupv3_id_2 {
> > +	status = "okay";
> > +};
> 
> You've added i2c18 device in patch 1, but it could not be enabled before
> this one because it's a part of QUP2.

Thanks for pointing this, I will update it in next series.

> 
> > +
> >  &sleep_clk {
> >  	clock-frequency = <32768>;
> >  };
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
Regards,
Wasim


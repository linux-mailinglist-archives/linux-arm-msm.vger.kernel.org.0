Return-Path: <linux-arm-msm+bounces-71888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD65B4234F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2DA3B5E51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51323074A1;
	Wed,  3 Sep 2025 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9Pe4LlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4350D200127
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908940; cv=none; b=l1wArP/aAFsz6IODdVuknZUqzVY7XIm3+Xg1ZKWFgU0r0E4LEBx/aDpjSsBoovwNSReD2p7BGG00CWnmXSPFJ4HhOoL9jUGUKqqnEzF29xd551fuVoyxlpCUP+YAs2lJ5YHWo8Sq57FU8zkvFWHAzwwU5VzpiBWCnNMlPtao9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908940; c=relaxed/simple;
	bh=HQXjdiIWY6GV0ST39+EojeXyRY7MXzjWNNCvjujQ6Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwF7dlOYLP/NQeirYzcXKfbpDpvkOJSCdT3Z4w/Z207agGg9cfoA5j0RC+nmYPQ2HZi/8jYr3Wh8jFY3G5/Q+eyc4Hwi6sXutdnrsu7I1/h7LZ85em1defEa9lgJQ69Wnq6E5nKqI9YyJOCgKsR1P3At6taUgPl8QupWNc3uEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9Pe4LlO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqpU003473
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 14:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VzNlel62yPa+SyyPLg/se3d
	IslRaGTpf2G+ejZAHH8=; b=l9Pe4LlOnoJ7lcxOaTdXD1cd047A5yETSUzBKRe1
	FVMxnYUuITdqVMGblNqGWiVr4Tgc7G5P0EmYS/AfBI+vGnosTAPDZ8m3Gfx3YnMi
	lK3cRRh0UaUtcBgz+r+UO2qmoe4CBC6htGghMVkfFe3lt6Y0kNINsSk7LKUbGAiT
	BFyc1nnSZz4JVJfFd61GndKLbYtJKFY9uoLZ20Yyz/XSDVfVzfF9/Kq/RfII3tvH
	6oJUHOTxo1lJhi8j3cBYC2q2N2zVhiw/6Uqn8lIP2/FWWcn0uA9acvBGfXF6wgoT
	Aps9MBcN+Xn9vHhEMTL6Z6vC/++J8x0UHT19QIHYC28tPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8uvvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 14:15:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32815c1ddc7so4023797a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908937; x=1757513737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VzNlel62yPa+SyyPLg/se3dIslRaGTpf2G+ejZAHH8=;
        b=ZffjopB1SOAWPr0OTIyK3VVNYjU4XRVNW0Y2M+iG/eXC7588ywdqgXTOEI73ts23Sp
         UA1lMKG4/sZWvotXm7cC5oEckbw+NgMfzsYz36zf1Cp1EwUhCoMS9ecK7v1AI/X+hoXT
         rPwRDFAQ9JL/kOjbAZePC8DKeWr7tEMp/N0OxRGtEM9EAxbBopxCmRlu1iM/7sLgEfxe
         DJ1Zdh8+yM+FHJa5WkZ64/yL81xCxCYC8YhQTABydMbR1ChQ+ldU8weU2jESOO2mdOSp
         l44puzbEBN8GVon9atZHiO0ARk4AKijwDb1rIGUclHNHnmQTkEEvfvirbj3oW+zSzjvN
         Nqzg==
X-Forwarded-Encrypted: i=1; AJvYcCV/aLXHWYu5z3DqVvcluhHyhshsO3YMa702+WqKZWKB2bRrTaxYJECqOuormMAmnwPGc2Y5rpK4JX/rPDvj@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGrM41wZne61YIvFp3AOH17Tk471PHgAGyowcK57YKtqqt9kq
	qUBiLR22cWRklgJs1QIdoXMWLikmY1eMrUzLmDYw0CE+gQyRVs4pCvg3gusMfJVG+tJdCrBSiym
	7djyE84fNznIEPydm3hiyInAh13NBIkOGIf/l5bhrFVsHMeTkqDYxH4uHF3rxaMggMijn
X-Gm-Gg: ASbGnctb62ZGizmuXU9zFxkTf3P18bE2UzMVfa6m2MWUmcyGIfQSuSBwScWKWtLxaf6
	QJQNsgYG/YW3CQYWUbGMizu77pWv3sSlKmmo92iTqm9DgD6vAlmjQucgsqAJomafdgP1IkVDXDb
	mwCBHMS3ecOj+5Gt2lgQM9yl5j0QHvL3UHOLPdjvvTqPtVxW+AR2eqKO+8axQ+YmbpMJa6dKbd/
	l3ypCBbc5MRzU/5cK8947GW2mfZQYqjX3TN66IsWHdLeVoF33xYjrrl/Frd59GkKajTlLX1ux67
	uHkLc/zeqLtLVQMsab+gAJkREI/+Vd4ADT0vGmVaD+/xvAaB9MofU1T+kScfYdAkkbZt
X-Received: by 2002:a17:90b:570d:b0:329:f535:6e3c with SMTP id 98e67ed59e1d1-329f5356ef7mr6857488a91.35.1756908936225;
        Wed, 03 Sep 2025 07:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyr3tjnshT//538kzr5X5b0VHSeB28iN4p9ecCqREiYD9oSxtfYFdYbnWB2PiVBs2MwLu25w==
X-Received: by 2002:a17:90b:570d:b0:329:f535:6e3c with SMTP id 98e67ed59e1d1-329f5356ef7mr6857406a91.35.1756908935730;
        Wed, 03 Sep 2025 07:15:35 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329f633749bsm4435336a91.27.2025.09.03.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:15:35 -0700 (PDT)
Date: Wed, 3 Sep 2025 19:45:29 +0530
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
Message-ID: <aLhNgQJtimNmiN31@hu-wasimn-hyd.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-5-bfa381bf8ba2@oss.qualcomm.com>
 <olv66qntttvpj7iinsug7accikhexxrjgtqvd5eijhxouokxgy@un3q7mkzs7yj>
 <aLhMGqYGzabIoyjS@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhMGqYGzabIoyjS@hu-wasimn-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: yXOyjcJAvl62H8u5MLC5Ny99FKPuWCkR
X-Proofpoint-GUID: yXOyjcJAvl62H8u5MLC5Ny99FKPuWCkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXwaYmHOASeZv5
 eqK8wtnP7OPtawhXDjE/b8peitT3Pfm7RscoobZvx8KS5zt/EildMM/Hu50ncG2M2A8yek5oCQh
 +bCPbEN24/TcvVY6tENwhPblptXV5bXqmrUo834kVYE+vHofxM7Dg4VOHzVuotIIgjMJEXKoOsU
 sksDqjbYlXShtuVRXBSVReHcnsHPOA9MpA3mF63+ZkozwniV802UoEK3IR8UDdgNEP2ccQtd81e
 bjKro7zCMgMGO5cyOlkNM+ENyK21elJuYv+VjhzPOj6uLgeE9pJPvINpUYGaH3KjGmwNfLWjvZY
 IXa8VQ2U8fxYq3jFPnMgZ3cRXzKLP3lCs6CyzLcqgjoQr2IxeY+ir01JPQss37oguorT5aqM5MG
 egj/yKkk
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b84d8a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M4mhlKS_8liedgrrcqYA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Wed, Sep 03, 2025 at 07:39:30PM +0530, Wasim Nazir wrote:
> On Wed, Sep 03, 2025 at 03:16:55PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 05:17:06PM +0530, Wasim Nazir wrote:
> > > From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > 
> > > Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> > > interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> > > DMA and peripheral communication on the Lemans EVK platform.
> > > 
> > > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > index c60629c3369e..196c5ee0dd34 100644
> > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > @@ -277,6 +277,18 @@ vreg_l8e: ldo8 {
> > >  	};
> > >  };
> > >  
> > > +&gpi_dma0 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&gpi_dma1 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&gpi_dma2 {
> > > +	status = "okay";
> > > +};
> > > +
> > >  &i2c18 {
> > >  	status = "okay";
> > >  
> > > @@ -367,10 +379,18 @@ &mdss0_dp1_phy {
> > >  	status = "okay";
> > >  };
> > >  
> > > +&qupv3_id_0 {
> > > +	status = "okay";
> > > +};
> > > +
> > >  &qupv3_id_1 {
> > >  	status = "okay";
> > >  };
> > >  
> > > +&qupv3_id_2 {
> > > +	status = "okay";
> > > +};
> > 
> > You've added i2c18 device in patch 1, but it could not be enabled before
> > this one because it's a part of QUP2.
> 
> Thanks for pointing this, I will update it in next series.
> 

Also I will try to update the clients in commit message too.

> > 
> > > +
> > >  &sleep_clk {
> > >  	clock-frequency = <32768>;
> > >  };
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> Regards,
> Wasim

-- 
Regards,
Wasim


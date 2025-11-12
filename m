Return-Path: <linux-arm-msm+bounces-81493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857DC5464E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 21:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED655343390
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 20:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BCA28506B;
	Wed, 12 Nov 2025 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihVriTSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9BsP4Qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F84202C48
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978594; cv=none; b=P4q2OwMMtpvRqz+54qaWHhMAmWvNUvPPgVCm2YJa8HfdsWYMKpKXGo4aM5Qd1nFeo45iFx59qZnGd8PsxmbBkyVa4pnw5EfbCCz4BFMFAE5tD5eHXn+afosm338/WZ9X+UiORW39f6SfkiXJDCLGgbRMevvQt7lvOgNqTy7hKeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978594; c=relaxed/simple;
	bh=NJls4GyFWCvk7Kv2DJYPUreZYvie+xSOehSfPD+ZPa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIEpKCne8ZT/rEXp78VCw8Mwkj/xEUWzum3miU2E3XrqgoMNFqBc1KzTod2Oe9M3pmDDqlBJPvBaYgOVN/AWr6Okh6Nc0yr3xMX9W2yNrh2QAKH/G56Le+0ba2ZLayMuXWgMJ1osc4qIF7Sn+ZEJKGuKRNOOeOV3VycPDAveH70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihVriTSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9BsP4Qe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACHMSQv907942
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SEIsm1QuXuVAqb/gdqCKCH2F
	djtpCPc2G+DMhs9vNSo=; b=ihVriTSaRSwwCPDbC/zk2ud7F8z2n4NFTFqaLpJb
	GL1AjYV7Bq630v7UKgS/KBtqoAlkyMPNDOtI2kSHmy4c37mG68+4d41dze/O792K
	mRQ5VRqHW2gTQpqztXbPfFg7v7jOe5guYoNIuZPwsaT+tIRaZPfeFOnTc8N4jpaw
	jsJziZl+o0l/dRs4L1qqJtJEfCrty0qvIMxOafGVD9dN1NEpFnVB2IIRmZfds746
	6ZsUWEhZx4YzPaQ5R8klkeJBsLsn6c3ODsRAEeuBMX33ljZwewUSksRw9HWDIiDh
	D9NKGceX4gnUvQNCC/IHptzEXz87zeLQ4sAsy42ayZcxyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur9wut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:16:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74e6c468so408721cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762978590; x=1763583390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SEIsm1QuXuVAqb/gdqCKCH2FdjtpCPc2G+DMhs9vNSo=;
        b=f9BsP4Qez1Xx0cplJV+yp/NenOADLE5X5Itg27/ZdUlHQE6fvvqub8G5gP6ni5YyYX
         k9YVjBlf5/V5usIBBBKQahO8wVWDkkSuwaPmtK0vaLNLcHPeXv4D/tS/AkiNRS+HCkH1
         3mP01QYyWAYiaE8jd4rew9eiPuQSsedlO2zd1O7fnucV5rdG11yavw20hnKkRbfdroKw
         7Z+izJM+EtTDoHEvFfWI/GVbI0qbNdYAwPSFOYJkp8TVm6QvrFyHamrlpvzcfG5ks94C
         leKjM9cKQXdYvW/QKGSlb67Ojg6jzXoeZCnuqy1J7qYglrEwBCT+aDHlYaLtSOo9SdzL
         KHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978590; x=1763583390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEIsm1QuXuVAqb/gdqCKCH2FdjtpCPc2G+DMhs9vNSo=;
        b=HlMmHRludU5id8wAaeZFmwrOgPW4/mdPMF/wyMN4uJVPycBBxyWczNxr4lZA21mABH
         aNizs1wcU7UTsVJAxbOYZcabw3jbOXu12bkyBAaWZIDr9yx5ocxpb4p8Wu2hcQJxzWGe
         3VuW2zs1GZM4OV8UbPUZTGttqyzx0piAuSfJxT9qtpYExTHnU3jJnkHmtxeeZ0OCN460
         k7hp+TNspY3C8/V5mhcHEaFf/0BdRaIcesl/Xyg/KMgMOwroU7VzJ+rkF6euuci3fKRz
         KvGpc0Oc9eR7rck+pRMjFmAiVagbegcEgbVxhZxyGg1eI90c/LYi13CA7WE/VLNkDTrj
         qpOg==
X-Forwarded-Encrypted: i=1; AJvYcCUXXZWeqRWTn/i6tSFPGecgBBYojtLfs6y+VMzy8fEDUOcnjGZiuZsa8UNWI62Y3TUKSGwHKnKS0csxWeZu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5kzA4kwwcdmX8TbnHbpttl7GA3s9PreEEt/xRTPraOBWYkcPR
	0UMMoR/3IjD5SMEN138mPG1hrbgRQX+xepoGAc7Z3G0kMilYNj5ryZCeNd4nZlIPKgFuRxKzgec
	App33qb/NOLaFCI3iAjvUHrrlOKlOsNd8/buNsXy0fitqflfF2ktSpGqIp/NxRXmoTzRX
X-Gm-Gg: ASbGncvsXgLQgE0az3sNitiVqy24xkcITrsXvayezjbcNQouV9dT79bNN9wRjYW1TE5
	cJdG41lOBz578hG5EWRpnuBpVJPd8BUD3on6BVca3lOOMgd9Yvg9w6xyJUR8eIsGcBt9+lJ2Ctt
	qfo8Y6f/skfK2k+R+J+boxdo17Jce546EX6wk1mIUF2iYNSIDoIpZfQVG+omPEqKiRi0YtQSA1N
	P956HZhSZv2hOLhAHdmCLanseScB/H65jn0aF4ESx1b+gTILqiC+33xqcD3BI1nTeLV/jJ291jO
	w1j1A0YO09SUukSGOkGVS9QFeGhd319DmV7A9IpLZcap74uz+Dtbclmca6ZLEniRHm+UMt19J8b
	0p9BU9fJoPSTCMjzzpH/q5xsQtKRzlPBZ8MPrjmPgvqydDJxthuvrXOSek5e30enY7UCeHUp9wr
	tpS06s+MDOpRFu
X-Received: by 2002:ac8:58c1:0:b0:4ed:b1fa:ae22 with SMTP id d75a77b69052e-4eddbdda755mr50502481cf.72.1762978590123;
        Wed, 12 Nov 2025 12:16:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFsLk33Oy565qDfTn4b0pivb1XviqK+/o97w/mSbFKDBRqbgTJYqrGARQYDUzrgSVuBOWUfA==
X-Received: by 2002:ac8:58c1:0:b0:4ed:b1fa:ae22 with SMTP id d75a77b69052e-4eddbdda755mr50501881cf.72.1762978589575;
        Wed, 12 Nov 2025 12:16:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0318cdsm6141910e87.44.2025.11.12.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:16:28 -0800 (PST)
Date: Wed, 12 Nov 2025 22:16:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 rb3gen2 industrial mezzanine
Message-ID: <vz7u2jsb677imufu6aillcqnnaybed3occniyx3fgniwtxzij5@uplpfhhyjk5k>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
 <kosvayxmpbngn56v7t734f4qqrc2rptkjdd7q5q23brg22dvov@cxs7kzzuapim>
 <qps5fkbgdqqvoqa3m5l4naksyc4aoq4xqnciyrpkrbs5qcno7c@aa6ync6sk4ju>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qps5fkbgdqqvoqa3m5l4naksyc4aoq4xqnciyrpkrbs5qcno7c@aa6ync6sk4ju>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE2NCBTYWx0ZWRfX3qU1GV+a7L3T
 mxXY197TjV9RPqN6JVOXqWIu+ExJONOhw89enG7WqOC8Zg/yb6ssaxM+tI22OvchPtoHSAK6WvB
 EWU5liHgJZRyQgOjSHL+w78rDl+VG+0f0srY+XFfp+yrOn6hniQVWsPrOTMOjN6ki8BSWQ5KcZH
 rUFTwYO4BmvjfzICn69CHtTMVJu25ECEio6dqe+DifTfK5iGiPzU36Oc3FaDJ4gD/zrBkJvUkqW
 EUhOnACoK6SKUHgYBDAd0sVfKqSmPwRbh/uGFp6u3Qvu7m7BnuNr5ZTIJncZKJmotnPsekWq9QH
 Gep3X5SpKi+PoDe48rSw/ZEzGPEE7dTdqaMHHJ7T3v2ywr4hMaMD2+tgeNi00+1yWV5Ah3y0/P2
 3Mw6IWeAoTfctkdS+poGUibS2lGwyA==
X-Proofpoint-GUID: qimkajVPxO-5XsYyLQbN_jlUGQ13jdxL
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=6914eb1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EjFe0Bf2cYtm2qUX5RUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qimkajVPxO-5XsYyLQbN_jlUGQ13jdxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120164

On Wed, Nov 12, 2025 at 10:53:36AM -0600, Bjorn Andersson wrote:
> On Wed, Nov 12, 2025 at 05:02:20PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Nov 12, 2025 at 08:18:11PM +0530, Gopi Botlagunta wrote:
> > > Below is the routing diagram of dsi lanes from qcs6490 soc to
> > > mezzanine.
> > > 
> > > DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
> > >                  |
> > >                   --> SW2700.1 --> dsi connector
> > >                               |
> > >                                --> LT9211c --> LVDS connector
> > > 
> > > Disable hdmi connector for industrial mezzanine and enable
> > > LT9211c bridge and lvds panel node.
> > > LT9211c is powered by default with reset gpio connected to 117.
> > > 
> > > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > > ---
> > >  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
> > >  1 file changed, 106 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > index 619a42b5ef48..cc8ee1643167 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > @@ -8,6 +8,112 @@
> > >  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> > >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > >  
> > > +/ {
> > > +
> > > +	hdmi-connector {
> > > +		status = "disabled";
> > > +	};
> > > +
> > > +	panel_lvds: panel-lvds@0 {
> > > +		compatible = "panel-lvds";
> > 
> > Please describe the actual panel using compatible, etc. It's not that
> > this is some generic uknown LVDS panel.
> > 
> 
> I presume the mezzanine doesn't have a panel, so how do we provide the
> description of the mezzanine such that a developer can quickly get up to
> speed with their specific panel connected to it?
> 
> Do we leave this node disabled, just for reference, or do we specify a
> specific panel and then have the developer copy and adopt this to their
> panel?
> 
> The benefit of doing it like that is that we provide a complete example
> and something we can test. But at the same time, If I presume we might
> have users of the mezzanine without an attached LVDS panel?
> 
> > > +		data-mapping = "vesa-24";
> > > +		width-mm = <476>;
> > > +		height-mm = <268>;
> 
> The way this patch is written we certainly have some specific panel in
> mind...

It's even mentioned in the subject: BOE DV215FHM-R01. Having a proper
panel compatible is demanded by the panel-lvds bindings.


-- 
With best wishes
Dmitry


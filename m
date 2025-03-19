Return-Path: <linux-arm-msm+bounces-51942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71618A68B49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 116473AAD4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68ED25743C;
	Wed, 19 Mar 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZniLK5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB68257422
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382434; cv=none; b=fr7LjXysANw6W79Bq/9A1R5S11r824fCW1RyFjobjUq3qYwAxlNOQbqOjKvnS7FkIWpqO81itx5r2n/JAC7WHZFpuzo5ktC9a8plYOUd7rTCt3jlaF75ulcTuJq86l1h4IcqaV7sk1odpLTvmMEu5Zd7bP6DSNMxlnhpt8xW5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382434; c=relaxed/simple;
	bh=eRtnfq5G7aZdIB6cxpkvIozQYT4hqFMByiFRG+lqLIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+jLKtRgytwl5sCPYrIY3JqhjC+zOB7WGq2vp6UF4QkaOAqjnUjn/7S8Fussn6qYoJSXdQibIdapdAgLlD9aSxswZ7XmEvNywshRzySYsbp85/TW1iv5G0SafrvBacqRzQLbm1pYkhh3lWmk6Exz6axMLJ0HezAddkeeK7wcIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZniLK5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4m0bv019847
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WkINzj//g4AQWdN5I6oKqNP0
	5nghNa/+qfEoInV2+gI=; b=eZniLK5SeHPdTvju6T3aKB2c0c6Syu4fMPc6Dihp
	8/cJYZetO3r43AHF0amnNeTPKbL3lfmbkYsgikWs+ZykfoB30G6Fz8pr8ROku2rd
	hEMPZSJ+CMB6zdwj5RiaxX7OCnVX2iPduLtdBOwpeTQHrPPFFNy0WpLCRweAUcgi
	iWyUX8ZmgRS6cg3oJ9aCxHiRPSWIZ3pA4FZ3nV+mLhNKuABQBeTlWIa/RUPWLPeW
	xRTXtqF5lDsm4WTOcLBS3vQI8JmKcZzCm49UDaDSOaRjHGfNlgc1AetqqCflMC9u
	g1nKyZodPkNI/b69c2pnkT3kqrq5BPNKS/eWUFrGTbTzLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu3bep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:07:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso926277685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 04:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742382431; x=1742987231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkINzj//g4AQWdN5I6oKqNP05nghNa/+qfEoInV2+gI=;
        b=bu8MqFXVLVMV/wdeBM94OXyCGkoFeZmKdqb6Owz2v4aDVHBUaRqT4vxnWtIaSS5lPZ
         nycBTcFZCJfpj3AYfBWi43AFLgcY6besx35NDip3DJb9M+5FhJCduNAP86Eqli6fncy6
         P4eiW395BP0V7cC6O9jkxb7HU2f71IiPw/w5lal2l4mProLSgFwop2QyRT0MOjXpXrO9
         ndldch6yx2lYlPD8zshaI/n2CoKEx34KxKPADgdmMMe5+8lswZ90IeGm5m1/NIQttejv
         ClcvM6hh4kpHle5GyfH8pOwezSrUtWKVL2a55n0qk30lukh/IJK3RwqKflMgQHfKIdEA
         WEEg==
X-Forwarded-Encrypted: i=1; AJvYcCWErrYBqUAmLJuQ+3QirgCBTo+8tFieGtJTSSL2DEjuy6Pj9HXAy6Vohw5IKQCaxFgnNGcC/E4w8dF+G0Ty@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aAO5yIm84tpK4OBby4fcHlFru1W5LyP2YnnB1iZQdYOHLhnF
	5lFQVOLQEzGLpLzH5/AKShANmRDGHONJT1X8IumqRkSVjh6FXpieFRZ2HNzprCX0bh7P4j+m7p5
	LPJyQ3dOY0/p58nkLkUQA3scQFffeRf5iYWFiIBGQ9NtcWw8B6BNKtIBYrn9jqXZ3
X-Gm-Gg: ASbGnct2Cx156QgCQ0+k7pWkOix/ou4fHOeKx0jCAAU8OolYUYwjSQqB12+TquB+o0x
	fkZeBzJPynAVBgYiVCiwAQPkH6Grf5Ajf66ToHrp2KaaZ67uCDZ+MQOJRzXdY/yFUkn5sgcVIhF
	/AL7n8yFhG+HiR6JhsbvisrssD848Fgp2PwBCUeIKCF7y0uEkg0V8Oe81NGKOO4X7C+n/lQzKZ+
	kA7L4JOC38bpvn99QlJ75u9nJ2eOO2xpZn7fE8R++IsaY4bQfE7NBRyAkJeMNxrxenMOwKw1wSL
	n0NovP3BV0Ka/QdEzM94CgUGJemy46Szoc/7XdU4lSpVCr1KONVhMaXXxW/q3xkBqXMY6yLvfV/
	xirw=
X-Received: by 2002:a05:620a:198b:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c5a8391431mr236548185a.22.1742382430964;
        Wed, 19 Mar 2025 04:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsG7eg8axClVP5k4HD+jCjL+jQM+Gse5YAXQd3q6Rvpx7WSfCpRzKGGy/Ceh+qmk8FKSjMxA==
X-Received: by 2002:a05:620a:198b:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c5a8391431mr236544085a.22.1742382430628;
        Wed, 19 Mar 2025 04:07:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea756sm22581321fa.35.2025.03.19.04.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:07:09 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:07:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        bjorn.andersson@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom: phy-qcom-snps-eusb2: Make repeater
 optional
Message-ID: <tbmte6hnuhafextazzyplec5xjuv3q365hqtvwcozhugb2loij@dtwfpyotnew4>
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
 <20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com>
 <6yykvszzbhonc3dkwhva55arsdvp4hv4p2fo2vv6ftwr46httm@wnofgs4jaqaa>
 <Z9qd1GJ1418CbaOt@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9qd1GJ1418CbaOt@linaro.org>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67daa55f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=opzT4eU6cpc3XRIv2nIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _6j9l97d1QdmBEQX8dmGXKjnmr5CJic6
X-Proofpoint-ORIG-GUID: _6j9l97d1QdmBEQX8dmGXKjnmr5CJic6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=696
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190077

On Wed, Mar 19, 2025 at 11:35:00AM +0100, Stephan Gerhold wrote:
> On Wed, Mar 19, 2025 at 12:20:07PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 18, 2025 at 10:22:56PM -0500, Bjorn Andersson via B4 Relay wrote:
> > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > 
> > > In a multiport configuration based on the SNPS eUSB2 PHY it's not
> > > necessary that all ports are connected to something.
> > > 
> > > While this is allowed by the Devicetree binding, the implementation
> > > current fails probing for such PHYs, which also prevents the multiport
> > > controller from probing.
> > > 
> > > The lack of repeater does not alter the fact that the PHY is there and
> > > attempts at describing only the used PHYs in Devicetree results in
> > > failures to initialize the USB controller.
> > > 
> > > Make the repeater optional, to allow the these PHYs to be described in
> > > the DeviceTree and for the associated multiport controller to operate
> > > the other ports.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> > > index 1484691a41d59a7eaf257ef44300827c668bf7e0..8897d2072ccfcaa5b4a510c17761dcdeed5bad0f 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> > > @@ -401,9 +401,13 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
> > >  				     "failed to get regulator supplies\n");
> > >  
> > >  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> > > -	if (IS_ERR(phy->repeater))
> > > -		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> > > -				     "failed to get repeater\n");
> > > +	if (IS_ERR(phy->repeater)) {
> > > +		if (PTR_ERR(phy->repeater) == -ENODEV)
> > > +			phy->repeater = NULL;
> > > +		else
> > > +			return dev_err_probe(dev, PTR_ERR(phy->repeater),
> > > +					     "failed to get repeater\n");
> > 
> > Can you use devm_of_phy_optional_get() or devm_phy_optional_get()
> > instead?
> > 
> 
> There is such a patch from Ivaylo already [1].

I will respond there.

> 
> @Ivaylo: Are you planning to re-spin that patch set? Might be even worth
> putting that patch first / sending it separately, since Neil pointed out
> there that the bindings already have the repeater as non-required.
> 
> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com/

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-81507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71220C55947
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293FF3B0735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 03:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396D1286410;
	Thu, 13 Nov 2025 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PC5I63t/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHsG2QT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076525557
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763005551; cv=none; b=k0/AMTjmOb5kBbA+almWYZ+6YUybuA06MlxWNBgsmkoR1VBD04Cj6AxE713ndlqLJR3y0FqBhfxY3abHuYUkmxKzWFWOESdnMu94nVvMWFuoIA1YxqEoFr+73MyVCnjskIpDDn1vvETZHtRQZBeGAzoQwi0KDPv/cPZzDoH9srQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763005551; c=relaxed/simple;
	bh=N9CaWEfbANmdrL6dYElHTPVpdO0+9wkV8lseVfQBj0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFSYRZzV+kY0FLni1TcxZ4COhFkFUejSoUMT3vl1RcxluPJWO07Xw/xH+jocytwOQKeKguoChrPvMRO3xfCYHodNcuFRRdyOV28qiK8HP9digJBKHcvcwxnrw4GP4jqmuVEhmfyNhUboRKo+DqIJoCWP6XVd0og0TGTdIIq7AzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PC5I63t/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHsG2QT8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11KmH3117982
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DjNE3w4kVhSIjBmk7rVKZLVn
	fKrOG9zqju24H6h9P2E=; b=PC5I63t/roh00hzp54fPZDB2I1gAZTo0xgMPuYfU
	rc6IIW9/wBjhwlkFzBzF247ucg4bN/AOGsp46QRouhKtY1C0oNE0oLcmMYA+3Ksa
	OImZAj6FFnJ9kXZfsrd5+fFATQBl8BY+VAmRTwH1P7Ko+VCBT3o+0LRwJqcj7OkU
	xBTW2XHg+7dUPAA5DEjW4sXmx4d1b94Bu0FSUR++xi+OY8lcjNgthuqWzF5VJlZ1
	va0CA55yM58wxT4rtSFBOdkJgOWyZHBK71UYgbpzWJGjUgylxo1WoMqA+3kKFZr9
	k42deGrwz123emBIEh6v9HD83VyDwkEAfi4b/NeeIAvH3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuhg2av1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:45:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882381f2092so18420786d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 19:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763005547; x=1763610347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjNE3w4kVhSIjBmk7rVKZLVnfKrOG9zqju24H6h9P2E=;
        b=AHsG2QT8tUGDxlQhg6Ux28prS9RW3jY++z0MY4InkfRM2omYrrwQ1avV6TjV3oShS7
         P752DjS4SmuKuvTLFxpGts7lmnLQhlYggBf7hoXPo0TB+tzsWWN5FPqfKwp2QpVd+qCC
         JreB5jRQ9Bo545LjdVuQX3BUXulrVoeb5nX7P3TC7L4iiA/sPWkDTgUu65sHwrhg/HE+
         Sv3n8RP6gycbizt3WnthH+uQZJ+z73R3bJrcY+6jtzFD8vLymJxJfKHF9mwazleoO3jd
         sxgAgRKRDfLqEq2qVRGC0jaqAOU95vX/umzIB1yM7PFzjeietR8JzWLockx/hGLi7O92
         mQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763005547; x=1763610347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjNE3w4kVhSIjBmk7rVKZLVnfKrOG9zqju24H6h9P2E=;
        b=dXiQTHKSJURq6+fzvmzBst/sOD/jg3Tcm6XQosW9OJ3ztKQE0lLaCI3yxMmqeqRupg
         fdgo3U9Xf1HbhwTn+t9DvH9KfggXtD0X3WYuOmz4+nIikhH3UpKAmYyEDOfuukUga08x
         UB6L0uOyJC/ShtfVdm5WRHjIg5ii8rhwjITemw2FOwhcF/7YSwEaUqW8Z/1AInXNfyQ4
         xHqkd3pGGQpXf9wI6AbgKQOFSvgOb/o9Ps4PxFPlSgIRM8TJ7QHvfS5emFywCgIQX7cb
         y43Wj53k0bwhaOU6voIrNxLbwS4Gy8E8E1sP9I6MQRXWmaEuf0WIfct9ag/X4T5ZW9zF
         7htQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGm/SuNPU77oEwRQdTTx/NppM7AJKZMgBoW64PMowB4CfuXWq8fI+9jmVHV+ZIsvyVOMsVEmgdJFrG4dRA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wxiAo/kpS4uL/s1KuhCUwude8t3lFuGg2ozvNqsu/yM7nwEa
	4jm4dQGpv1rghJMpNXZNQvrD4jrxfau9OOZfuuaOcz3SEEs8QLiKM4GnK6/lKEaLPmmr65CK7i3
	oC+0/8Ptszbx0WM/0ZgXcAdU7VJTyNpkp2QL3kQBW2rqiQK5mpwijGnZW8k4EcL/8r9mg
X-Gm-Gg: ASbGncv+fLdn+sZd+kUpIptvXzoQftDpYZfjFRRDDSjuagDFfbPy58FooWJu0kIBb24
	0Cm1XMQ9X+yN62B0+V2AV2j8F/jxW5qb6wJF5T4yhlo0iJicL6wekXox7RrvFGGOO/WIqxB1OM8
	UI8BDbtNh9H1KWICkBMFdvi1m8+lhGUCdwYxCNS4M7kSBlmK3JjST7AV130yLeSc8ckNeOYLjNd
	NIgmHXgWREx0rMwT80AmA36DMpmx+aGnldo8vIPzrqxe92IAJY5ksUhXr3MaMIQMX4Eo47dCIQJ
	a1aZEQ+IGMZEXRacA3g5y6+qFSm2wOHu02upPOYlUzJScOjV1JChb6SFBeekvRZIrpSpCIqEoA2
	BgE+d6HKngj9Ro3GqmWuBb5/3iW+29qwvsXpUEm/FqyK6+vuJWb2wDBXCFTOqqdcHzz+8B6FKIh
	6/pJAhaZxELCco
X-Received: by 2002:ad4:4ee1:0:b0:880:49f2:38b2 with SMTP id 6a1803df08f44-882718e5117mr76134646d6.14.1763005547572;
        Wed, 12 Nov 2025 19:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfmlsjI3oV0xrxh7FK7VclqjjkV8mhqUSwthmEzk71QsnD+agyh4M4pfdF9zcwVKb610vCNQ==
X-Received: by 2002:ad4:4ee1:0:b0:880:49f2:38b2 with SMTP id 6a1803df08f44-882718e5117mr76134416d6.14.1763005547114;
        Wed, 12 Nov 2025 19:45:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003d8sm125814e87.70.2025.11.12.19.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 19:45:45 -0800 (PST)
Date: Thu, 13 Nov 2025 05:45:42 +0200
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
Message-ID: <72ffjdik46dpespj2i2bakju6zcbu5eu7atuqrl4i4ri437nrj@aigb6akxb266>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
 <kosvayxmpbngn56v7t734f4qqrc2rptkjdd7q5q23brg22dvov@cxs7kzzuapim>
 <qps5fkbgdqqvoqa3m5l4naksyc4aoq4xqnciyrpkrbs5qcno7c@aa6ync6sk4ju>
 <vz7u2jsb677imufu6aillcqnnaybed3occniyx3fgniwtxzij5@uplpfhhyjk5k>
 <5lkcoekfn3d6gwk4ra6u65lu6mtgzn2iucyvswvn4lhwuw3pxv@jcrp22msbaip>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5lkcoekfn3d6gwk4ra6u65lu6mtgzn2iucyvswvn4lhwuw3pxv@jcrp22msbaip>
X-Authority-Analysis: v=2.4 cv=NbnrFmD4 c=1 sm=1 tr=0 ts=6915546c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1ZUH7Qa5Occ65oSuLKkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Hbjm54LSt2jplXfW3lm5Sn7tDjWXRvQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMyBTYWx0ZWRfX+SjDClffRjoj
 Bc90hDcfnFkoIe+AsiAMlCfu+9GtXxYjDXn0jcYTtPpYBZxM08CAuzEbcJUzySkHp4XhFj2gjkS
 A+Gip6wfsOwkTaTI+69T5KxqOgJTrwqd1TBVrmYm3C5UeBWm4dvQ/iDiuAbwH/xqmMq8NXvTcow
 +OHLEtIOLX96ZhbeUHiHxCrbhFiybAfbRmkIhlzX3Af9ov6K1cPPb79QNfup6grIiGYoNMwMIFf
 wFhvVIE+aDDICXEOHgB0q+IU3EoLvPPG6LImNVwZ40XdqqWDFLFrj7xwTNhoELuJ7Q3Ja9OeeIa
 WzX+UtM+LQ3s69c/uvxjGbeBUPKR/5qvGuL+/mkU6rHCcOIRoqhDz6bbriDuYVJc6L242MAQL2L
 Q2iCRUEpi2RsRDESZ0wGDZiVL++0CQ==
X-Proofpoint-ORIG-GUID: Hbjm54LSt2jplXfW3lm5Sn7tDjWXRvQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130023

On Wed, Nov 12, 2025 at 04:07:27PM -0600, Bjorn Andersson wrote:
> On Wed, Nov 12, 2025 at 10:16:27PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Nov 12, 2025 at 10:53:36AM -0600, Bjorn Andersson wrote:
> > > On Wed, Nov 12, 2025 at 05:02:20PM +0200, Dmitry Baryshkov wrote:
> > > > On Wed, Nov 12, 2025 at 08:18:11PM +0530, Gopi Botlagunta wrote:
> > > > > Below is the routing diagram of dsi lanes from qcs6490 soc to
> > > > > mezzanine.
> > > > > 
> > > > > DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
> > > > >                  |
> > > > >                   --> SW2700.1 --> dsi connector
> > > > >                               |
> > > > >                                --> LT9211c --> LVDS connector
> > > > > 
> > > > > Disable hdmi connector for industrial mezzanine and enable
> > > > > LT9211c bridge and lvds panel node.
> > > > > LT9211c is powered by default with reset gpio connected to 117.
> > > > > 
> > > > > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > > > > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > > > > ---
> > > > >  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
> > > > >  1 file changed, 106 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > > > index 619a42b5ef48..cc8ee1643167 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > > > > @@ -8,6 +8,112 @@
> > > > >  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> > > > >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > > >  
> > > > > +/ {
> > > > > +
> > > > > +	hdmi-connector {
> > > > > +		status = "disabled";
> > > > > +	};
> > > > > +
> > > > > +	panel_lvds: panel-lvds@0 {
> > > > > +		compatible = "panel-lvds";
> > > > 
> > > > Please describe the actual panel using compatible, etc. It's not that
> > > > this is some generic uknown LVDS panel.
> > > > 
> > > 
> > > I presume the mezzanine doesn't have a panel, so how do we provide the
> > > description of the mezzanine such that a developer can quickly get up to
> > > speed with their specific panel connected to it?
> > > 
> > > Do we leave this node disabled, just for reference, or do we specify a
> > > specific panel and then have the developer copy and adopt this to their
> > > panel?
> > > 
> > > The benefit of doing it like that is that we provide a complete example
> > > and something we can test. But at the same time, If I presume we might
> > > have users of the mezzanine without an attached LVDS panel?
> > > 
> > > > > +		data-mapping = "vesa-24";
> > > > > +		width-mm = <476>;
> > > > > +		height-mm = <268>;
> > > 
> > > The way this patch is written we certainly have some specific panel in
> > > mind...
> > 
> > It's even mentioned in the subject: BOE DV215FHM-R01. Having a proper
> > panel compatible is demanded by the panel-lvds bindings.
> > 
> 
> I missed that mention. But that implies then that this isn't "the
> industrial mezzanine", but "the industrial mezznine with a boe
> DV215FHM-R01 connected".
> 
> Are you saying that this is the way you'd prefer that we handle the
> mezzanines with capabilities for extension?

Some time ago, around APQ8064 boards there was a discussion of using
EDID to identify LVDS panels (in a manner similar to panel-edp).

Does industrial mezzanine provide EDID support for the panel?

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-74896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C3CB9D42F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57B573263F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E612E62AF;
	Thu, 25 Sep 2025 02:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecY1Uw/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7E2E11CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769145; cv=none; b=rCFc6/y8pN9eTTbQvac84lA5J3BpwgFT0zBuaWDzBodnU2j/u0qdicaRiRAQon3RHiVlwp9qN7IxRmS/d9Mp/vIH/J4UL2XeT7+uUDeI/u/ibGGBR7JsZfovl7/a8TbQOZ+oYRDBCmWs88mGc2U4nzG5v9FKjaXoP2YomIDxbSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769145; c=relaxed/simple;
	bh=rMdx9u4+CPZdlaDXxIrAkulEp2MNorpZN4qQed5m6F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1/l1XeQHJu6k7RGULar9Y8jwyaPkmWqJVAve1ssgGt8KqR4k2T+rA4DOGv3S6RQGCKJ1kC4ua+yngJmUzgqjT8IBaBrx77JEEiaR0ZsPBxQmnhQ+OURblA6TmiWzH6eUOMGkkMwTO17Kw9hTQuLZj4r5IhmI/txZx80Gjhqv08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecY1Uw/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Ka0v017453
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YVhIbwN6AspjG/ncbcs2oWej
	SClutNyLdf6oqsabWes=; b=ecY1Uw/tmpiKZ43veGA4miv+hG7rVv5z2SRAJt/F
	EQqTuFKj/yjj2QfelvNwiNA6Xks+kSz4+BaNM+VoqZ3EkPbiUXhkFIo0gdlIR1J6
	hu1rOiFbl1DjPTxo7FLgTdVOlR1WUuk0e1Osl9XL7qwjXSavTlTCYSWn6Dm+UpKY
	vAoAxheZQ7swzYArZYtpvs/bv2ZahmV25s+sMY5SAgbRQU/JvG8RRXmdOn1MD/aW
	nSj70Vg0RRX5k1zQefbDqTigNuTmbqAXJcKetlf6yHxal43YCDyZJIEITb6nJ1PG
	HW13iuaKoCsstPGToliG9G4BikT+U22WU/tLP9BuYK/Xyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyujg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:59:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a41b5b66so12457931cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769142; x=1759373942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVhIbwN6AspjG/ncbcs2oWejSClutNyLdf6oqsabWes=;
        b=GfGKT2HirH5wVHqJi/VBbTwZX9JfIkP8aW0UecnfDzasGc5rr+oPdQP9cFmZsericA
         I71gFtx6ZkjFtC8fgIWhGkob5xV0jNNBCSNPPz+AhM+Hl/q9VX4024m5mxTp7o5Ye20+
         QLO+ERvMP+GrXRYPnmW9Z4GBGRPCgqOm9fUXD/bsJFep1B7TvjuTwVN+6Pw4UhU/N9C/
         2JBifXg2gwol7J0y4Or0SHUel5twDAU2Xnz2WQjVi/uwV830kXd/fhcapP0NmiVnZUJO
         2KFWiSr4my6lWRWi3ZXPr7euJgJUcs+wmWiLQ3NkIyxWwnlcUQwTIubcjY3x7X0FewGZ
         kxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7qPWfSrcvqaw9xnPL3NJTAgtfUZOvXECHd0cldUYOeDYCvnWmNBtkvdYk9gpuUIsP00iBIMsZBsFcGy9i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5Avv088sAb3gaVUJw2bpBg8PFgsPXFUBh/qVxbWV6xLFodmc
	eM+wz6GI+HnYs/9kBEQp4mPlhlRV8nQeqI4OlpBtb9iJQjvRn14XwSw+nB/fSuDg8zJkSZGODra
	Q5dX7XI/yi7RJW3yIz2RRddy//V9dnQkuSWikPl7b9Iu+tqKtVqgwsZsLDXEVXR9dQEg5
X-Gm-Gg: ASbGncvfVxzehUYYL9PKkHP8ABcVWsRKze6difBhQsJAlUrpTSDWDb8jRv7/Kc5OZrg
	h3G1yoRrU4MIE6KNUAzyhEDkpj5ToZXyzpgcKXhrc9MJjjtCDUmnayxen5+6ivuNaYdBvX8W7Os
	MyUZOQPBAF19bNX/g+whWIF9JZFG6elSIZVvQydJBOs8zFpRpZ7STk7hhg5/ayDe79ruUBYDX2v
	fnk9FuHhRfL73LB1Vj0WMWgn3DraKP0b1irkMPx3Zk0rY7DlRuopZGDvs4jrgC+eY0RYKqYo0vS
	9c9SR2jME7F7sWMAxkQeLi2qk6VzCDrAEFMUsrzgxFZskWH5wAxjeMNHWLUDvxKmiemfNVXmC5T
	t1qK54NS5V+oOlCdpaf5kbzJKMkqehrgdVh50oWCs6H9LZDy6IEss
X-Received: by 2002:ac8:590b:0:b0:4b7:b2c5:c61a with SMTP id d75a77b69052e-4da4d21edc4mr25364011cf.83.1758769142386;
        Wed, 24 Sep 2025 19:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1XnTbfMNHcgRcbCrb+1DBR8eHmzim3EHHlWAZftE/lw4akJE2YkN9j6quohmLlN7TXR0gww==
X-Received: by 2002:ac8:590b:0:b0:4b7:b2c5:c61a with SMTP id d75a77b69052e-4da4d21edc4mr25363851cf.83.1758769141924;
        Wed, 24 Sep 2025 19:59:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656989sm267325e87.90.2025.09.24.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:59:01 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:58:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Message-ID: <p2deqsamovmrcijqhmcss2766owsxfyz7v2uk3mxd5du6e6tse@uo5q2iqwjxj2>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
 <5mwqf4djs2jee4x6edplwmd5ugucoi4wazrzjoiw2p5ndiv6h2@6xqnnavp2a4i>
 <efa5ed28-674c-6a30-eff3-eadc650ed6ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa5ed28-674c-6a30-eff3-eadc650ed6ea@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gmXqy4Ydw2to-PCcwVmsRM6S7xlkQtBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX9yshfSPMccJQ
 rywBVO1W7SQMMslU7G+Ed5uTDMp85YPXMD331Fn8lNCcKm4CRb38wnCB9ps5yMzPlq8oIieYJla
 vtCyzh3bS1WsXNnC61H5mJ+clOxbI5ndBei+L5L8r/KewGU7xTR0A/bs+Hj1wABLdAyIkujQiIf
 LT171H2L477sW1W94xIyLyyp8hEAqFLYJAWsgmfnlJArZKlHERscxy8JBCq2ahscZ5C4QbO5QvC
 GkW2MtSQ119h7p3BS+lZD3cJrnfADDbVua0mBevnb0w2ruZHDcoIdZ0iqjOawH858aLi2j3clQx
 bF60eX2EOB9+wwNTOogcyAqm/LTnz4uMYWShHOp8e2JAoajbuMgo2GPF0R+Dn3UI8kYcXHLpJs/
 DWx5nPL/
X-Proofpoint-GUID: gmXqy4Ydw2to-PCcwVmsRM6S7xlkQtBe
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4aff7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6Hf86mc1Aoj0dGmY1zEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 07:12:36PM -0700, Wesley Cheng wrote:
> 
> 
> On 9/24/2025 6:12 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 05:52:20PM -0700, Wesley Cheng wrote:
> > > The Glymur USB subsystem contains a multiport controller, which utilizes
> > > two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > ---
> > >   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
> > >   1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > > index a1b55168e050..b0ce803d2b49 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > > @@ -16,6 +16,7 @@ description:
> > >   properties:
> > >     compatible:
> > >       enum:
> > > +      - qcom,glymur-qmp-usb3-uni-phy
> > >         - qcom,ipq5424-qmp-usb3-phy
> > >         - qcom,ipq6018-qmp-usb3-phy
> > >         - qcom,ipq8074-qmp-usb3-phy
> > > @@ -62,6 +63,8 @@ properties:
> > >     vdda-pll-supply: true
> > > +  refgen-supply: true
> > 
> > Which device is going to provide this supply?
> > 
> 
> This is just a pmic regulator.

Ack, thanks.

> 
> Thanks
> Wesley Cheng
> 
> > > +
> > >     "#clock-cells":
> > >       const: 0
> > 

-- 
With best wishes
Dmitry


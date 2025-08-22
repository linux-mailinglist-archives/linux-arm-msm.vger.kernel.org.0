Return-Path: <linux-arm-msm+bounces-70390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD93B3167A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 822217BDE8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346622F8BF3;
	Fri, 22 Aug 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fefZzZ0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838162C029E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862794; cv=none; b=YNSiSWydExycqjx1D53XtixoKoZ0izvalkpABv6Q+exMGDutsSxm4BKmKl2twEY4kuOP2bmUgEFiIV2isJ7WmW+LFQo8EwL+s+GiHbQCc6N+8K34evuzRSdppTuqhOuCRQQmP9FaaPHlgpIhoHVSrm402offWRu4n/uaWkalRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862794; c=relaxed/simple;
	bh=f1sfJBo9o9dJwhSGCcqMGBl3Mfx9Jh4l5ycFIjel2jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMy8J2+8zHal8hBos7+q7+FUUj1+Bacoy/oFNaDVLGlYT/i1aFSgjIDrCjwGe28LnaMTzCJyO+F3qUejccITix/wxbXSA6bCl1nY6sq5gLH03ivyT8ffd03inOz1Oxj6hGJMOSpLuohBzvOIjA2NKKDJazZhVxDeSM9RM59fX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fefZzZ0s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UTJ3020970
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFLMQVHg9cUjUEhLaX2Ovvk3
	EYltYMYiOOM3208zwIA=; b=fefZzZ0srzoPiQhmmzfGpi1DyaX9SAVzKXnhgT/d
	bV65ZO1PHEya7vwAm9CF/psxiTiQfLRHpeGZl0SbBuTCQZWo35ysFq+IYBuojt38
	bUK0n8xt7tTXm8bOl4BAqTeDbq95f3URJiFP/2zR1GZDLhSGzjBWhZQYvw5zrkLp
	0iCtOmSnuRh+DMrOFpakiwuTX0QV0IEoDZx6VfW4mMf9dU+LFnxbJV0lgHwOn2hL
	Hok9bVosGimlmduYCY3RJcAlNCJp/ZgMQQmf8ojs+TZEI45VFLiNf8k+GgtUItDb
	V+Sl0jGBcZPaRB7r8TO+9w5QCaSdSxPj142NH7NkyAn8iA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52912tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:39:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d9f5bded7so5827096d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862791; x=1756467591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFLMQVHg9cUjUEhLaX2Ovvk3EYltYMYiOOM3208zwIA=;
        b=krnmxJJT9QdD92gk9XkgwBPSiyqkX33Q7l0Ib1vEJyM/FXrXCS0tRvWR8kjNTvFFdx
         S1HZyaJ+ciKj/dqmmwB0kXDXqVXZcNXv7BvhfYz+aCKbC/4yUUbS683Rwtw6wCWspwQt
         qOyU6HuDXSXe6MCt/cuM8PxWROBbUCWs8vtC8p9z97uAMu53bBntDZUDsu11EtpIjstn
         wZsZfNJMh6JD4+Sxh5DSVeYGuarw19AfGrscBl9kBEQBFL5NpKAitd5OISepM4XWPpVD
         IGRjBbDCHEqEM4UHIHZY14uXvzY2Hop+dBVMGEBP5f2uubD1B8sY0JLlSMoHN2PS4sQ+
         bisg==
X-Forwarded-Encrypted: i=1; AJvYcCVBq09/gRcy4UQbsgXYB1pvxH2WgM1Qa6S6Y/OVpbzZDuQtZjGiKIIqAJpvuyISzUUe8j4lIwxPZcWmV58D@vger.kernel.org
X-Gm-Message-State: AOJu0Yypu9nRnOIAZc4oThc4wjjD4tkHE1rWu9GX3abU/nxoIbjTRjIV
	UiaWJItd467oC8dMoekQBcY+DZJmvs8lolKrpN8NQfMRPkTyGXXyT/UludTBGoEmRZbN0C5EsOO
	woPjgNHFswAn3bPebo7wNDzWbLbli/ljjYuvKc2qXFmuETWjGmMz36Z3dT07AWMg8lIvE
X-Gm-Gg: ASbGncuvoofv8k/MFAavdsT+zJDHXvHehLI67nyEH/MDw740+y0+7gwynklSOaLm+AH
	SKt2EvUxUPIV8w6+dX9HkIBKjBldZJDKqAvKsUlI/DaWMf22Nx2PQ16YRwzYIclV79ex3Hw0s57
	aVYGORnMl08f6CNOnQoyFqNbAqXwpECgd9Vjh1z5RAXQedL423rVGQZkkuhyktSoZOe9zpVvZmI
	yYc9fAKz40koTawHx64bwz+UpLw7wuf5fwEM2ExLntgCNcxT0Ct+LEkfgyLnQcR7kAQAgCO0Mjd
	8fLJMvBoyJl5DnaiQ8Rm8FoSD5C10fLU571gWKDaRqI7MjVnO3bUPFuErgnXHG9lKMCw3b7BJ3z
	Ko/7CyGcjwOA51Sx43jYfRKhqiFlyWzVirQe8+vJJGdeKNC9UKtGc
X-Received: by 2002:a05:6214:d43:b0:70d:82f7:180e with SMTP id 6a1803df08f44-70d971ed40bmr37216956d6.50.1755862790482;
        Fri, 22 Aug 2025 04:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkbMfEBfr5OYFm9+slBBWnRivUg5jHHYuYw9w+zfkzG2JGT2dc4mFkYoJUMqOd72SEqiVvCw==
X-Received: by 2002:a05:6214:d43:b0:70d:82f7:180e with SMTP id 6a1803df08f44-70d971ed40bmr37216476d6.50.1755862789959;
        Fri, 22 Aug 2025 04:39:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3363b33a986sm4244671fa.48.2025.08.22.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:39:49 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:39:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document default phy mode
Message-ID: <kxevo35c7tsbjeu4b7ep3f4eld5t4ohy35x4igaki6n7uvteev@ifotwczstsn3>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-1-f14ad9430e88@linaro.org>
 <yc7ceoq3bn3lkxdwkrk64ecubej64vblpwlwzyj5cuep2wmjui@nln2t2yicu7o>
 <018751b8-8b9c-4966-94e2-f3ec8625f87d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <018751b8-8b9c-4966-94e2-f3ec8625f87d@linaro.org>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a85707 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=shYPb7jLr3MzxgU6IIEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Wo16Tyw5p1YblI-PnMKwl9txy-qTzepV
X-Proofpoint-ORIG-GUID: Wo16Tyw5p1YblI-PnMKwl9txy-qTzepV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7Ttu9Ee13o8k
 SirtCQ5SrAjs2AEpdYGnzvDfEFKJUWFbVpznCdaccbK0Yo2wnEBJJkChoP7kR/gJRlsE9ECfcYy
 bjWUiVNWu7ea24B/y/0cnsGWT+r9txsR2QUR1CNN6X0Gnfz8z75/HT2NZLO0Vb+3qNqhHm9IktK
 /ebn6AONAraJWhob1PXvySPL3Px6cxzFtAlOWE9l2OgGGotOY9u+iU6UUpzDLq5ABKeBsAs19ao
 srUMw4KvfLFMqAo0xsIye//+KEyzn4DTsoUHG9NhJmFrw8y0A+Yd55bMnmXrKWrOGlUpPfV8hsK
 4Kxodd8MjOxTGpKFmVXyY/AtEBNaLWzHPnY+dYsvezdApY48RBQEc6llGjqBQrqMIZ1+prdvvyd
 d6fPJWTyVXDgSEqhp+hlp8KXCtOdMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 01:02:21PM +0200, Neil Armstrong wrote:
> On 22/08/2025 12:57, Dmitry Baryshkov wrote:
> > On Thu, Aug 21, 2025 at 03:53:26PM +0200, Neil Armstrong wrote:
> > > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > > of a combo glue to route either lanes to the 4 shared physical lanes.
> > > 
> > > The routing of the lanes can be:
> > > - 2 DP + 2 USB3
> > > - 4 DP
> > > - 2 USB3
> > > 
> > > And the layout of the lanes can be swpped depending of an
> > > eventual USB-C connector orientation.
> > > 
> > > Nevertheless those QMP Comby PHY can be statically used to
> > > drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector...
> > > 
> > > But if a 4lanes DP->HDMI bridge is directly connected to the
> > > QMP Comby PHY lanes, in the default routing 2 or the 4 lanes would
> > > probbaly be USB3, making the DP->HDMI bridge non functional.
> > > 
> > > Add a property to hint in which layout mode the QMP Comby PHY
> > > should be as startup.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > index c8bc512df08b5694c8599f475de78679a4438449..129475a1d9527733e43ded5a38aad766f9810fe7 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > @@ -76,6 +76,19 @@ properties:
> > >     mode-switch: true
> > >     orientation-switch: true
> > > +  qcom,combo-initial-mode:
> > > +    description:
> > > +      Describe the initial mode of the Combo PHY configuration.
> > > +      The Combo PHY is a wrapper on top of a DP PHY and an USB3 PHY,
> > > +      sharing the same SuperSpeed lanes with either DisplayPort over
> > > +      the 4 lanes (dp), USB3 on a pair of lanes (usb3) or both
> > > +      technologies in a 2+2 configuration (usb3+dp) as default.
> > 
> > SPecifying this as an initial mode means that it can be switched later.
> > Should we generalize this and desribe it as bus-type (from
> > video-interfaces.yaml) and allow it to be present only if there is no
> > mode-switch property?
> 
> I was not sure about that, and yes we should do that instead but I'm not
> sure about how.
> 
> bus-type sounds great, but the numbering doesn't match so I was thinking instead
> something like phy-type with a string or use the numbers from include/dt-bindings/phy/phy.h

Well... we can add more entries there and map them in the driver.

> 
> The thing is, do we want to keep the dual dp+usb3 as static ? I think it's very possible
> a board would connect the combo phy to an USB3 A connector and a 2lanes DisplayPort connector.

I'm not sure I follow the question. Could you please explain what you've
meant here?


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-74531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7D3B9684C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 17:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A76446648
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EDE257842;
	Tue, 23 Sep 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCGXMV/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D7242D6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640497; cv=none; b=YLxfsSzW5Vl+KpChLammo6LlXNl0dlXyBrUSJkutv61eHQAHCsTBiUoVwurZEAgJbfEDlA4yBsnfa30ZkjYty3qnR3gnJsZGjYvg9rZJAmJhHtk9hj8bzjMcZMgC+7lb4pg6rQP+kOzco7t0i128+m3CUzq2y7GbKFeQiW/EoA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640497; c=relaxed/simple;
	bh=cqUUhv2/wL8tm/MEQ+ovV57tBKY7kHNqEw2EAVP8oWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqs8Ap3vC8Du9CNtIgQYpxk3UKDDgJTB1QWLcJ9zephAEwdk2CC7RkK1TLZVUK3xNvZvrdxBXlxpU/USjaD8O4y9IA6X2tGY+WBUU0p67esspiuQ3h7Z+fEJ5MJ+/JrzCaqkscXWIEvW6SXOOPYjrjJAgsaZZgChuain18nuUXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCGXMV/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H8op001645
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bcu0cSegjeYGWWYkyIKpmjx0
	8iqAqBOpzkcQPjidusI=; b=oCGXMV/DH1DCZ2tFGFwtQVmB3We0jEUO4DCksFo2
	ZPLDIPKWYoirHo3SiVnmT4obC0s9XMxmAqArn4bc0O6RJXDGz7BWMQLiWW9U5mOg
	cipwRNIwhD4muET2ccoUyHebdmlkr7aC/67GmjjKVQksf/Rq+5v0b0yY9ydtYSOH
	GzqqsUE42mXinvS2EpKoI8AwHy2R9RzgcLW/qf8WRhLfZONxBaP5piCRkIN27roT
	Vk/KBB8Mwm0l0OKMsHKUFJfQAJrDJLEkTBMBDp8TjZstoRIXQQiGVjR8qouBvTXH
	1Pa2CemCC+3tnvT+h433I1HeNrjfhmreXDBDVzyTr1BLPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fgy5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:14:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e5b6f1296so109564716d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640490; x=1759245290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bcu0cSegjeYGWWYkyIKpmjx08iqAqBOpzkcQPjidusI=;
        b=tT8thdRzIQmO1IOzyfgTJtApbRXwiTgJXVwqtc7R0wWLvxSW/fMTJK80hlkoqKxR/1
         x/ICBBB3AQDdpWWxk0+umOTFlUh3x4KTymoDXgsw2P0Y0KO+pPsAspSsqyWJawibiNF9
         j4vUYFr1YDc4gOkWd31Fr0Nzh8ocaQQWHZvAsS6VSNI3WlavXw7K2x/qdklzcxL+d0zE
         PVe6VV3CwXysAjBAxMzL07GepzX8O3y6AgA5TxERA7ySOKCqPy1xfrN27wHbYHntBOf3
         BaHlLV3kbVUg1dML44jbNDnv71iWjDkguIgdN/VTZqDG77uVCnLZTxYyUZ14mLnLlzPJ
         KM0w==
X-Forwarded-Encrypted: i=1; AJvYcCWseLcVPM9UUjQb07wCmfv0FTtPbwYUBeG25Ld/RQ5S3ov1q0G+lGO7d5yR+xi3o1DUJZwA2RMDZF2TaqDC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywna4F5EgCauw4/vxG0RIW4NdMJl58FBje4enzCLjIf9U03W/OE
	zHzasBcxXb/yZkled3VSZi2uFPIC+O3CppNQmd6+WJ426Xh3F+Dbb9rphKv6RZt7oy9gG5KHBG7
	gGINzn8DZC2gYWtXN/op9g4SPk2gzjby8TqYAfqqMnq37OkRu6muNkkUf8ayF0nQdGRMX
X-Gm-Gg: ASbGncsbQD1C47ZcqPOokfk25g74Y9VnXSDOWnmdH5p0F19NaGpFaVrshJdb/S4GDUQ
	295aVT6Z/nGCt6yop53CiNaOlIA3z8uzlGMwaof8JSHE67BR8eVYEWtNqlyih6PzYciMvMDJO3o
	SIDKeMaU4olmbmObhGhqsvrNFqLaOlSBwnSNk/xqMTGTRe1HvgMAiQQVoLiaBGYb9rohHGF1iHw
	hhagXK+gFqd/LArTqMUm5L7tAIxDkmCSZ52Wj637xh5Q7YoKpawBRoMQ5kNs/BnjYXyc1RpspFT
	a1b89KkyqPl0eyW1vbLr9YaUm3DBNYDCw8faoTO8MjIuiBfANbajVm64ioAcW61iwlPIvJehgpP
	vfrqKhA9Csb49mts4VxZPPftnMVQDHpGKZJWMxcoeVafSCRihjf7E
X-Received: by 2002:a05:6214:495:b0:78e:c8a6:e891 with SMTP id 6a1803df08f44-7e70372875emr27552066d6.24.1758640490293;
        Tue, 23 Sep 2025 08:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtPKm9FBKjU71bzOcabqJzjkJFUNtMGIjoAr5LjR7CttWL9p5iBVAiTOs2U1UGVvuJBs8rSw==
X-Received: by 2002:a05:6214:495:b0:78e:c8a6:e891 with SMTP id 6a1803df08f44-7e70372875emr27551656d6.24.1758640489666;
        Tue, 23 Sep 2025 08:14:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f45364sm4282644e87.15.2025.09.23.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:14:46 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:14:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: rename x1e80100 to hamoa
Message-ID: <f5kgh4hivkrxcfkinberpdxdnyybw552zqup66cmobtgqag477@qldaejueyyr3>
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
 <20250923-rename-dts-v1-2-21888b68c781@oss.qualcomm.com>
 <aNKAjIXT3ll3L0qT@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNKAjIXT3ll3L0qT@linaro.org>
X-Proofpoint-ORIG-GUID: k15vyA0iABHKyO4Hx4XL9u_bM2lFR7WI
X-Proofpoint-GUID: k15vyA0iABHKyO4Hx4XL9u_bM2lFR7WI
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d2b96c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qHWDp1yotbHPGaiNsJcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX1KNEoV1LiSHa
 piZMP0sGlx7aSi93etHIVXqavigvswjvnQlQHrPQJYyU3mhvPdCj7FvpA8la6yb+k/lCRCcITkE
 WpFRRlXTNmCwOb2Y/HQPp0Y1ChbNrHPzCDNoR28sqgCl3BUh/EZ/IDf+ThY9qQRnTYfPqhivXvd
 XtVJLdy7N2MPUoVUlaCTIC4tMG9ef1h5EkjxALSa+PkMm2PLX1bD5BLhG+OoxvWnNqAHJxcaemp
 s/jvFl6yM9d+BvqIhdg2YUtCPFbvbOakgK65qXYXgQPM0nzANkM8Jx3pW8Dg5Ht9LiMFkBw2Xjv
 0GRSTo5TwZ2czS+mr+lo2ict/0Es+XrkUstYCvrgt0IrtuHNBN0fPv7LQLUMbaXcp3cpKxbAgn6
 DfRWfRP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Tue, Sep 23, 2025 at 01:12:12PM +0200, Stephan Gerhold wrote:
> On Tue, Sep 23, 2025 at 02:01:55PM +0300, Dmitry Baryshkov wrote:
> > The X1E80100 and several other similar names (X1E78100, X1E001DE) all
> > belong to the platform now known as 'hamoa'. Follow the example of
> > 'lemans' and rename the x1e80100.dtsi to hamoa.dtsi and
> > x1e80100-pmics.dtsi to hamoa-pmics.dtsi.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi                        | 4 ++--
> >  arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} | 0
> >  arch/arm64/boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi}             | 0
> >  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi                  | 2 +-
> >  arch/arm64/boot/dts/qcom/x1-crd.dtsi                               | 2 +-
> >  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                        | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                       | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi        | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts            | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts             | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                          | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts   | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts           | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts              | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts              | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts           | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi           | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                          | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts              | 2 +-
> >  arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts          | 2 +-
> >  arch/arm64/boot/dts/qcom/x1p42100.dtsi                             | 4 ++--
> >  21 files changed, 29 insertions(+), 29 deletions(-)
> > 
> > [...]
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > index 10d26958d3c66a5a4faf2ca6065e7b661f967b4e..2cecd2dd0de8c39f0702d6983bead2bc2adccf9b 100644
> > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > @@ -3,8 +3,8 @@
> >   * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> >   */
> >  
> > -/* X1P42100 is heavily based on X1E80100, with some meaningful differences */
> > -#include "x1e80100.dtsi"
> > +/* X1P42100 is heavily based on hamoa, with some meaningful differences */
> > +#include "hamoa.dtsi"
> >  
> 
> If you're renaming X1E, please also rename X1P42100 ("X1(P) with 8
> cores"(?)) for consistency. That one also covers multiple SoCs.

I haven't checked if we have clearence for that name.

-- 
With best wishes
Dmitry


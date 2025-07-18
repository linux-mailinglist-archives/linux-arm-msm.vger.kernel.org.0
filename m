Return-Path: <linux-arm-msm+bounces-65675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155FB0A7B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805A75C47F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC122DCF46;
	Fri, 18 Jul 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yk5do/aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601162DCF77
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852681; cv=none; b=DkSdpGnpwex+Zz3XSd4APzk0FMgsyCa3L5CyITtSuBzmea4NJ7Zvz1+WC95gC0Q/6vnDEkvl95OxO8zqwazeFefcMQL/Sf0NfKJ/1u9dO97wjiUrGm9OErcFdZlJHO0j/VRaSYTZqRKJSiRVYuAMz7GKuKf6p9RIXqf/lZVdhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852681; c=relaxed/simple;
	bh=Yexg01c8qAXHR9qOdv5Ggo+N164p2TucG1gvimWownQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF7p3e/2aNeglhxCRwDgT3hJK3BHXwSwaoGIsGnWnbUrwT2lndh/CqR6fDxdN0ulTIPGGiamNnwHnIrcu+/Kw3ERBsR+c4oK2E5GAvAcEMddOvq1FIxRsdw4K2c/Fj/w5ZSv0/oNk959o4OqZFkG1Ta+EDOJUMFGd8WVlBLygdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yk5do/aa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7rhgf032398
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P6+RrV5N6b5UIHIYz7u63iYh
	pmaqRZCMbsPgsoyq814=; b=Yk5do/aaXxXgyXWXtPTqhw369JOW3lM33wSsfvUo
	mMwHda4cGAn5H7/UxU1XA4Ncl4p+Rc4nBrnuyu2dB5Dj/GPO/nMWBw01WD4WBWcH
	DCsD+XXKpz98DvH8NM+Wid7DCjNZjzfXovw1D8mKyLNvTllwvmKhqFdM8pmDqipQ
	iPjGSiWgWkptRpd3RCK53bMlZIe/UF/pBlcblPMSC2q6azx+UG1oT86eVok7Q1D8
	JXld/ddNMaDDfSkY9xzPhrn2Q3TafgRKnzgDeu4LJINBQnciediVkDsv++bqm7/g
	LIFxmeybDQJENMTGiIplv9GfW9croPQjEOGssQIbTNlXeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38c8sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:31:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so628703685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852678; x=1753457478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6+RrV5N6b5UIHIYz7u63iYhpmaqRZCMbsPgsoyq814=;
        b=lgm+ZLJKRqV0Z2sdyOtu9POG6ysN7D2uYZLdKpodr+C3LAAaQIYJoQf5EQooXQ92Jt
         TkadC5LXzCDCsEPC0BSd75q37xlSaxpWv0dfUlcbUkOPoPYT0+9cJTcDVQR0CB8nt2mT
         AZrmUkMb3Bk5o3+q93q7hQKZZ5PVDCBGcPsMlIn2VzZ1wFk1KOJBKbnp5/pvqbJFIpdK
         MWTmPPZ/1NkVRF0vo++FdprS6FGXEuruIJEjS1wv6uSWRG2ed7s20r/NZZjP3x9GEJR3
         FnbJaj2HkS2/5xghs8ZCjvquudno9XAoZKJnTGw88LL7Ca6v0n3li6BNks90rwF5+sli
         Kmuw==
X-Forwarded-Encrypted: i=1; AJvYcCVOfz9Nth404OguJnlJcetwHFc4SfdI/LNkjwmzrjcGWKX0io2XVRaPslq2gK1CN8maAShKOyfhCth4V390@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4iSxXskpAMncNJmaXZBDDI1imSRqM8CH5NpxUNEOfcO6ghcAO
	uU5EJoeAR9EYNVOgoIinlgRSmb3Wba0GtlIHCCpij8PFcSrFkNW16Y9Zcm0En0xsoDenmxlrV9R
	i9lConUSyZUDO4Toycv2sKPWW5KOsS3V0sr8rKgfp2C9DEfYeveXBSXjWb7lFmF8wsBmEpOtwYx
	IR
X-Gm-Gg: ASbGncsxceZ18/Ay03nxA+KTu5QMhF8VNSOOHqrrUbdYxt+EaEML0yl9wg6s8/3fos0
	JtMO+gdFAGB7YJX0PodmNFdTs3JpjAEl+sjUsSvo49bgKG1tIDi14tPo5OtsieoPXin56XtpiZ9
	zZGVZrKcPw9Rr4QSMtbSafEFJ8Eh5zcfX6S+dde7WfQgErm3HOq/HA0mTQDKUkdMStIfxHBHVFR
	ZELXVegAiUAd4PnKpCWQgk9oA2l8Goc0VHmSdwU8yzfJ+/oZuIbIP2LjSDuXbYJGNMyRUouNKld
	jceftpPpne3DQVmxiTpBAYZq3WeLAGBDB/IIwRKKqr+N6SOG58zuqw8mkEm2+lehRBFmnYtr4bO
	JUA+n4VaE1AzqlTEjIOnR4T/CkkcCaWHQs77JWfVfcyB90hzvpAyH
X-Received: by 2002:a05:620a:1a8d:b0:7d4:6123:fae0 with SMTP id af79cd13be357-7e356b058a6mr449432885a.44.1752852672948;
        Fri, 18 Jul 2025 08:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhdFZv0OG6o7Eg5mDKIE8QQIGFm51wq0J8H1lXv/eB6mvbVUlAvHR8+/JMoHeLGeFKXURm+Q==
X-Received: by 2002:a05:6102:ccb:b0:4dd:b82d:e0de with SMTP id ada2fe7eead31-4f9ab36d3d8mr1698721137.17.1752852259972;
        Fri, 18 Jul 2025 08:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a90d5925sm2572821fa.1.2025.07.18.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:24:19 -0700 (PDT)
Date: Fri, 18 Jul 2025 18:24:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8150: use correct PD for
 DisplayPort controller
Message-ID: <jdzmyxotemxufamyemcotx5tgkuotn5ywez2mbt42v3thajbum@idgrarw542ic>
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
 <20250717-fix-rpmhpd-abi-v1-2-4c82e25e3280@oss.qualcomm.com>
 <2ed06cfb-2b06-41ae-ace6-b404878a97dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ed06cfb-2b06-41ae-ace6-b404878a97dc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfXyBfAyVz03ro0
 bw9nmnO8rEzxXaDHIzuOhX8ifBfDqcFaZDf13nlGzhFp7oNc/UWh8yvr3B8nfxzKUA26YFdgcjf
 HQPQuprLDC3QF7NJM0VPRlqZ+jwE9CgvfrZeX6BIS3Pdc5N57rKCDVgActp0pnFrmA+QQnbP89b
 4hTbpBCRVt/vknVnwDimn6PWzYg2vGB0zVDreroQRAlzgjG4ShferJJzv4fqVPgDbFBhPECk7PA
 ddIVoynrUaWcgiuB5UaFiwE8OAt3lpcRoY5aIs1JA6TU24IniXViqvcJ1Ppucpvd0JZ1ld0hTJh
 AmST12IVjc/AxmAqI7thhw03uhVkApKLo7kK06XF7oN8VcGUFFpXqyROGCvl/OX/geJTyKgRz0W
 00XulxvKs1EKDnK8ag4qK+4y4nqkVqiViq0b6Cy1e38k1F1bhAtEAE/gWIyIWh3D9ByxNpfd
X-Proofpoint-GUID: TM5XbdhofcRuXLGHb2rxrg-ve9AgBsNQ
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a68c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=gOKfhFuQloHwmF_bC4QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TM5XbdhofcRuXLGHb2rxrg-ve9AgBsNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=747 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180119

On Thu, Jul 17, 2025 at 04:27:33PM +0200, Konrad Dybcio wrote:
> On 7/17/25 2:48 PM, Dmitry Baryshkov wrote:
> > Commit 5dd110c90a50 ("arm64: dts: qcom: sm8150: add DisplayPort
> > controller") specified SM8250_MMCX for the DisplayPort power domain,
> > however on SM8160 this indices maps to SM8150_MX_AO. Use correct indice
> 
> 81*6*0 typo

Ack

> 
> > instead (SM8150_MMCX).
> include/dt-bindings/power/qcom-rpmpd.h
> 90:#define SM8150_MMCX  9
> 91:#define SM8150_MMCX_AO       10
> 109:#define SM8250_MMCX 6
> 110:#define SM8250_MMCX_AO      7
> 
> (i.e. the commit message is misleading)

#define SM8250_MMCX     6
#define SM8150_MX_AO    6
#define SM8150_MMCX     9

I will try to make it more obvious.

> 
> 
> Konrad

-- 
With best wishes
Dmitry


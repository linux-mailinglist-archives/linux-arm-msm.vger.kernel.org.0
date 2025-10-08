Return-Path: <linux-arm-msm+bounces-76482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9738BC65DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7446B3AFE11
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646BF2C0F62;
	Wed,  8 Oct 2025 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PosQepT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC4229AB00
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949716; cv=none; b=Skfy3zS4XlG0niZbMxOjbRXjKKBrU75No/OqQXQtADKhZxCY9hXwcCuDhjBF+7cgY/J9/JYoY5BMYf6Y84c8s1rKDVbB+3QK/8P9L9TsMX7vm8V7VKGD8oxuBXP7LUJk5XdTquWSB7yl0/izdZttdRXg6DOiIMq6r/Vi3DK9LbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949716; c=relaxed/simple;
	bh=ZxrlyTdwXDKR/t7OEC5AFlsR5I/rwKK3nNq0HeWo8vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L81nxTwqryXDWePBT4531VyvxE8o/N4/R2q2pzv7GPbgT6+tMmAxLcqrPscyYS5u9qXvFi6rJJe9JjQ5MeMP3MHi3TcrYmfO1YYZUooHAbUVPzhDKunupQdITg2SyGBMHZbPmYWlevrYfDLXJbmV+3F8bbjaIVk9XID77+N8ctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PosQepT/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IQe027653
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mxyhPRUmhe/CrZF5HttE0O7N
	aGBvDw13y3Fi6fBQnc4=; b=PosQepT/S5rU4yfEhPtpH1p53u69S6YbcJf7bauA
	9Gvp7DrWHjg4DYqj7CXedXg2wv0af9G8bvpzIs+AC9xoSpO4lMNdGYIpIVllFv9R
	jfWHcclwfdYEHmGrrXW+to+r1oxPlbfJ0qbQ25Yvan+0d+EwvxJNkYUryL4F3RMn
	zI5juMVuIiUTfjKPntYzkZXXZ8NQ8mWJPReh2dC0c4O1UiDd0JDDsdUDVRu6z5wL
	yvSJtbi0S95nk1H/HSmP5LqI5MOqFulhMIuPRmU6mKKH2kwLoqaBapi6HMiBg2J1
	CbuntreYl1m8erGOIcK43bvguN+A5AnYcKvshFWSBLX68Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nr9qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:55:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7a758650abdso10882756d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949713; x=1760554513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxyhPRUmhe/CrZF5HttE0O7NaGBvDw13y3Fi6fBQnc4=;
        b=JPaEjvgiT3DakdgNAkzKjRvevw6rsszox/7AD6XvHeuo6wRgeeIfWA1tpAbPZL0CkK
         s7H/iNhbY6RSb3UzARNlMrwJAwZCs0nQTV5C3+lmII6Ii/FJIJMENBW63iBwJLIReXjk
         ckO+lwdE+pPLLttbNoQBL+Y/0nSU/GVFsB9mtaNnRUBmzkDAT13FcIkU20nCmiGjn67+
         N3zCNEv/RO4hJGvV3aeSRb8E+UMYTroUaW+R35YSe6JAxGCkdeFULAQ8YN2Stznmt+HJ
         osf/aTuzdyok4/XT2zAaXm+axfAfYNoDvLvrR62nNSHWXtVO99OAyPzBanyOLV8m4tPf
         wVHw==
X-Forwarded-Encrypted: i=1; AJvYcCV6nwCt97ogkAPFeQoE5OOh4aB1RRzyRxjzX7felRCXq8rPCJ9Mr8Yogywgy3xOuPnWK4Z8S58FrJ35PsUz@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpFI1FROT+9rwNCuwwGhoRKfEjsUzt7P6opVMdR82CP2xObNf
	gkeg6YILZ/5GVCxvBTUQLPosjXUo0x/hCcnd8x+yHk1rR5WZz8HyelX2J6JIiK4XLimb9wCTuv0
	dA7n4vqkfpQWRfw6uE6TrK1nXF3Iwz9Bb+1/w1CQa9PoQN2yrDITtsMbEyC36lIXYMU3C
X-Gm-Gg: ASbGncuCHH9VutV9G3AH8CzifTgREqTeilRoAzP3NbAyQjnqM9kRrZWQokVbN+gFpbi
	rLYhWKxwfQC256Gc26cVPlYgw6Erp9qosZWLMMC4H7/N9ca/exNCB7Ppa57q+t8iAdvvz3A8v7a
	LFBUgbgCnqU2PuQ15oalIW4KLm5Vw9o19xV/TeD/Ox0dr56fhx/E5O/Mb2F27KbjCa/Kr/C24Mw
	04AplCYo4Viu8qcujC3VjfoTKE33AIOaqw89MuKhGt/2l5LS8UC4UbaDqTgEg+L+wL6oIr26MTo
	05VdPH9RZ8RA3pRZ5R6ChQXbOEabwAK8/DPSrJYKDtRV7cvEoSANcpmxz6qE1x+Aa5D5CfOG7sJ
	XZ1mvwLUW4k+nI22YzG9ObRJyM6Md1DWt6mVIcLH4Zycdy/mU8izLZUKi0w==
X-Received: by 2002:a05:622a:554:b0:4df:d1e5:47ac with SMTP id d75a77b69052e-4e6ead07cadmr64588711cf.22.1759949712578;
        Wed, 08 Oct 2025 11:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9LU9w3HFmxqx8RGYdyppa1AO62f614MGbbNlcjJhmzBLRZN9Y8nGtrhlv25Odt++2usG2IQ==
X-Received: by 2002:a05:622a:554:b0:4df:d1e5:47ac with SMTP id d75a77b69052e-4e6ead07cadmr64588301cf.22.1759949712079;
        Wed, 08 Oct 2025 11:55:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ad9e03csm252110e87.83.2025.10.08.11.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:55:10 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:55:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: sdm845-oneplus-fajita: Use the
 freshly introduced driver
Message-ID: <pdiqqujrhzvkvv2gx3nhvh2y5jddulcfmhdv3sthlnmn4gsl7p@mj4omp3qxusd>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
 <visvxwdwh2mcympwre6kx7xesvsysdjw6j33kewwibzfbgrbsi@dkcilnw7gk7c>
 <17b5977b-d0e6-4027-98f9-171b9e18b1bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b5977b-d0e6-4027-98f9-171b9e18b1bc@ixit.cz>
X-Proofpoint-ORIG-GUID: 5RRKUXHQ6fSz7mZrSjeBYcHf-L8EbYKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/D2JLhYtI4lK
 NJdSDntMj7uhCQ1OT/czfdOBxyZ/stjMQx8wQJvcIbtpaDqjcgbr6tgaH8LY5B1HfKSWrYXip+X
 ekcPuthYK9pQBjwB2DWxnDhDbfr9bZJ3pu1g/aDm3dYnsJ+BQy/IKIoMUc++aurDiWh9U5d+cqj
 phpZotKnNMtjqIN/eGW4MMS66lSR9VQfRGC4W8z8K4TV5xMcc4Hrh7akDyyKflO2c5e+XjzMeYb
 c+Yv56wE8xcxF+b2ck4oA6com/04xmt3UXQyhikh4Im8XXcTxWktBdu3MnGoDH6vHWeC4eLWCvG
 9/19vQFgJc0VA+Um+UOOW484Bzr7ya6EOksqsm74EqIftAvSGzX/wIdy1fi9lo+/m1uvzl26Jud
 x6CXyoU6BUlF3Vq5SD9WNhu2PeXjiw==
X-Proofpoint-GUID: 5RRKUXHQ6fSz7mZrSjeBYcHf-L8EbYKQ
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e6b391 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VQwtuX0fJDwWnf3U-QAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 06:09:19PM +0200, David Heidelberg wrote:
> On 08/10/2025 17:54, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 04:05:30PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Switch from older effort to support different panels within one driver
> > > (which already dropped support for the HW) to the freshly written one.
> > 
> > Please disconnect the driver and the DT description. DT can be used by
> > other instances (U-Boot, OpenBSD, etc.).
> 
> Just to note, there are no users (anywhere) for this compatible.
> 
> Would be the change of the commit wording enough in this case?
> 
> If not, I would then propose to use for OnePlus 6T just an extension as
> 
> compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";

I like this approach

-- 
With best wishes
Dmitry


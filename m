Return-Path: <linux-arm-msm+bounces-77472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9953BE096D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2AC19A379C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327E630C628;
	Wed, 15 Oct 2025 20:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5EfwfB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BF230B530
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760559089; cv=none; b=EMZ21QRNFNDf6gmohLINNn/vukkG5/j8VkfSCI4r12Oz+8OkSrD24m0Yd5yWiBrUy8IvglCKp/4lkwG3GxcGV8WoUmw3ZIql+DlIvXjxafpl3rWTpFtVYDvxV5jomgg7PaMN+R3XEIqaw6PfHABukIPeoYqoj7XKqOEhQTrh9Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760559089; c=relaxed/simple;
	bh=tlQYqfr+lRcDlNEbr07FlHSH5FhhsNlr3tj/6Ax+bv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyCjgRiCr5++0pp0fRVtM42+fRS4sym8h1G7EtmGO+4MKA4YnPKXIvWTh5mfav/+m7oLpXRKBf30phyJwi1kuEW14w89oIhGW6Flw3a4d2FirTMq1c3Ty8gHrfPBF9qmUdpNJf3AoYjdccLsgJMgv1OJ1sViBGGMLuSDbc4PbcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5EfwfB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJ0XHP004000
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LVldk4RaYwVtWNntXmtqcnQ4
	tRICAXA4ItTRgBL4U/k=; b=h5EfwfB16OChAMhW0bSF4lcrtvuj74YxIA2+zh9I
	Um1+XfQuBgID6kcKU/RXriVZRNJC/EOJPCF/WPGlBGjus3UPXnE+uHIxlCll9Rfk
	x4MUwoXHW1gkZxWGGbl3EIX4othAMFy74lw3rndNSLe+NTAbYf2iBgyKqno7VlKr
	rBvw/rzHNrUM/ruU1LIT1lOASrj8/aDs1z84zCIfX45uxu/3nBllYIaTQJ4kFlqA
	If9XNSQZDEdgv2WtXSbJsj5UY7GuLYXTPHCYO3Yfx88Z0UImW7L0ZtKaub+c6Uk4
	MipaVg0Xb8rjaUgjKhyETf5eBl1SgBhktN1g0pr14TzFRA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwr3cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-818c83e607bso428916d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760559085; x=1761163885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVldk4RaYwVtWNntXmtqcnQ4tRICAXA4ItTRgBL4U/k=;
        b=q1ywH2BSDYugvbTSNNa5grL4QDkVbFWtCQnAzegyqSR89AwvPC6ECd0jmF41JkY+tB
         6lCNcKbCtcbxiFvOppNDPcqMX01BHH034rfOOahzkLjxasWMx1n4dV2RsnDnRDZa7H2o
         2G5Fozk3r8VBHf3zW4aWQToMhcDP6hfgwm6KcmoIIA7WdV0lUKD4jxWTdrloHbNiwbHn
         Jgoys9UXVcuOqETdWLIFATDbyNHuN7Sj3kUGTcqgpxUnRT/jYZgVWPFntyKDfnoGPcv4
         32UOdCUPDVrZwV1srP7oMaUEeOBYd0MPub8XumfDgnaTF2BlOes0IYSCXa49/8bOMl38
         JqFA==
X-Forwarded-Encrypted: i=1; AJvYcCWAZ0R6OhZJG9Yd+XlSG3Mar4vJaXGX0FAJ2wSTi4nCyze6QhV5rPvFmNa08avHTnG2wHqQhlV154C6AJRx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/6SAEoTf+Mkod1jpegXXuYvSkC2TeS6aiSLvP3gEWmzMRTeq
	2mFnK6aAJpkvAYvkdEJYBoNpxJjd89vXqJD8vDSTPROURofD5EztXAaTReNXyg6OCfz9qYuuHP5
	LI+BNTvNvm2TmP/B9qJ+yxXERpTGhzq8/CdSwHB6If+IMo54WUNpZJM81nbR3KvnwWpHM
X-Gm-Gg: ASbGncvkc8Br8o8hlUppxnv0XvcTwsljkcPBnatQfP4RxfGRhdgM7EZBCI4Qz8TolpU
	XO6Tp4Id2SAZbkfWD3CTuaT8JGx5mvpk+2gABJiOwnGjUfHsomTcP7Rp/S23xaEkZF2K8CdpxJ3
	+FRzF3PLwQSi5rfx6vrd1cQYvmuSg7OJ+fNc4iC7Iz1lGVST0/eD79AqtM84Qsj2HjY3J/fsm2C
	sWI924BGRTLYK0Buh30g4wP+6RMWhrYU7Wdd0JjFOPU7WIQPDL04PUfxDCB5DUvi3Z19F20q0C+
	oTmoAZp9SxrLEjYzJbxT00qfZMgAjkxUsWmsEzin9h1epO98gf2ZxGtG83sQE9XgByLQ4lz1QKQ
	BpieFkhhLjXxbencOjM/BBJHlYJpgfWD5Qr1lpDZuyllkyQS12r3H+c5u9ImCT4XX3pXFsLZJJI
	WSV3+Ts2z+iSo=
X-Received: by 2002:a05:622a:30a:b0:4cd:601e:9d29 with SMTP id d75a77b69052e-4e6eaccc282mr395056551cf.11.1760559084777;
        Wed, 15 Oct 2025 13:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs/8x4/fTZv//0wDdUVKmlKtMYrWW/DNTSd9Z59w5HhH6mfvuS0MkwZLiRmy45Bts6zp0Mvw==
X-Received: by 2002:a05:622a:30a:b0:4cd:601e:9d29 with SMTP id d75a77b69052e-4e6eaccc282mr395056121cf.11.1760559084146;
        Wed, 15 Oct 2025 13:11:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088579de8sm6500434e87.115.2025.10.15.13.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 13:11:23 -0700 (PDT)
Date: Wed, 15 Oct 2025 23:11:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-starqltechn: Remove stray
 #address/size-cells
Message-ID: <37x5l2wmtzcvhz7ui3plpke5irnj4lpf3fpsi6kmuv4d5tiis2@cdxx5nserdnd>
References: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
 <20251015-topic-starltechn_i2c_gpio-v1-2-6d303184ee87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-topic-starltechn_i2c_gpio-v1-2-6d303184ee87@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXw/ZtwGSuJfg5
 1N2c6FsspwsG8PZth7j/dyUrSxBcvJpj089XOh9KZup85APfmxL65SbvMhsiumIzGZZM/17jT3P
 +7DYWXDLyjLIMsnfGy/RcWO/x/xtNLlj1G4B7MyJ9I/FBCiaN5V9gDPBgiMB3oF5LprUtT3T+Ob
 mON7XJZQeB+PxEIu6i/umU/LxCGDFmm27R32hsY+LqP+1yfbM0CQI+0Bd3zLJhjnN//RDWHjiBx
 Q9LQoDUvCsU3fmAyzbTekQFigo+qQoRsAc05LqU7quI3oXvUUR1URV8PwczHR3BWO7/Sj9w9aGB
 xqVUmA3d3ITKMfv+IT4iklvxgkKm4+39C0juTQwgvxM6KDUijXB3NHG8R9G5jPzRwVQ56mLWK8A
 QdqOra8YjebYDkHegFx+DIxo05pUDQ==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68efffee cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uQEY_WcXetCi4OVW4CEA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: yQL72Z4byKiMOH7Xe6RQJ85O8wBTArU_
X-Proofpoint-ORIG-GUID: yQL72Z4byKiMOH7Xe6RQJ85O8wBTArU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Wed, Oct 15, 2025 at 06:32:17PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> maxim,max77705 does not have any children with a 'reg' property, hence
> solve the following warning:
> 
> '#address-cells', '#size-cells' do not match any of the regexes:
> '^pinctrl-[0-9]+$'
> 
> by simply removing the disallowed properties.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-73096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0FEB52E23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A8316CE2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 10:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F0A3112C1;
	Thu, 11 Sep 2025 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAM12sLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF913101B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585763; cv=none; b=kxunR1idiZVXJDmaOyY9ajGnsFKwe0YTyRYH+/d2PM4EFrU5gspD4MfbpXvaM4Dw42znw8sDUOq8sVFxJNNd5iFHLpztsw31Lt27tyPmlYO3k0aPLHhlBWSyK2+hkWJJ+aUQv4DKnmqLJykI7PlquMu5p5B78G/IjWsgBckKc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585763; c=relaxed/simple;
	bh=ca2ySU4dyYlyOWJGaxHKU1ZLVW/b67pBynQ6HDMkqQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icjZyV1e1/PFYJXzVwulGoGPmD4qPToNWD90IL8PuNOSGeb/nPfSFa6KhdlJv1uaHWAIWHJqH5RGepndB0gmkgO8O4IyVTXRA0BN2cHtv5TyhMqCJB0Gf5Q4F8EZ0t5khVa+2J4AdzU3LTGdikLiObYLRMXbt1YWFT99m7J4HPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAM12sLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Igkm002482
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oph/BqXdzMBPwBrMip4MvFuk
	jtsewo8GJDCyXuPq3cc=; b=eAM12sLKRw7iHA4nK7P0RsTQpfsV6QY9XETeZn3G
	UVIE2cPKj7JMqzAzfTrqecqCZw8BRXTrfl0dv7VkVDpH2gdQwye0xgVxCfwxn3vg
	e8IXG0wo/pnmkmPYNxf1kgY8PeBawUXunhzz5IkfZFWwd3h+qYudDviRl8VIIzeo
	fKk2qDnJrPGMt5JeBWs7B7tMV30KtgxXNw1yWd0iHH14snWTAhF2dbKy0JDp8A0p
	8BAyy12bbX/BBo5O4pK1oyM6j/o1EVr6O3H5jKZlyIshw7yTR7s8sFAeKwKbbQ9G
	mu/gGN3eK6Kj6NLxqc6l5nbM5WevE352xJjwO4goTBplNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsfc5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:16:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b633847b94so13913071cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757585758; x=1758190558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oph/BqXdzMBPwBrMip4MvFukjtsewo8GJDCyXuPq3cc=;
        b=lq3k9LSAi6AcViR86R/utSv/MI9e9GP4jOVqYTBevRSSLIfhLvXH+6tb6MTj0jGKf7
         mavvUAncNzJkJHUdRM/SJyxynvWij1Km4wc+xuXB0iAMe3NaAScZpAqYE8IJkfrGWejT
         EP9vhhTdUYzn7jvraD2lQEuxIew/U6es2VCwpFjBl+ABqtrngL6y96OUH7nkI/Rd6DgZ
         SZlHtJF2SjdBFDA+nZSZXfnmJbT28WKzUbLHaGKAf6ZNpdpKPHfcGh6/Ag+TAe41VfFm
         aq28zHkvrin5ijshLBKmncxj1XBSYBdKPNcnvNsMTSGf4KLQ/fH/2QuKqDgM3nurbUOO
         bDlA==
X-Forwarded-Encrypted: i=1; AJvYcCWLDFuPSoiolVCe4TxcLXgMwGqu4O8pWwmc5RsPwgaXOKzV2L3DqPs/3bIhTZHlF01ico7curVZ5w5oYrf6@vger.kernel.org
X-Gm-Message-State: AOJu0YybPD5jVyfePQQ1NYs0Rn4EmbXidXpXtuf9/SBPqeFlQ+PmlGs4
	w5WdLSMCV0mvkRzcmm9r10nDq3NhvAIdw+m8vGJJbFZm+6gjaTDQSmQEiGfsGc71M8Wkt1IVwiW
	BP09uUO8Ff//z+biz3NCZTC/itiYK0Zpjqgyq8uqtET26Bnd8/1WZ4bggRG2M5pxmoA9wu28EcD
	WK
X-Gm-Gg: ASbGnctwJf/8E/vob7yCiAEhwfEX+5elwYGSF6SPtD922UJex8m7kOzJBqpw1ibANhs
	/wbFxSSiMCTnFKgrn+hqsnDX1FXxgulxkJQpkHK5U4swwUl0hEqzSPC2Kraz4RojZBP2lGf0Td/
	WKDfm9IzcQaPWOggIWGNjHbgYWkYDzAc/XJsvhBBuvSslIFSGjJyM8twmwq8zEQ0Rv++2sssEur
	f8M2s5ikXbXpF6ios2/88U+TvGYkmoXojngxXo/nuxYlOxT8J8KSPFlrD0YORRaAqPUepv9nYP8
	msKbEEJrSP5QuBtHm82jtPjo+UYvd6XABSMfFGHw3gYDw0jNlQlCFPAXaTYb3e7EQenalkmNmVn
	phMYH1ALo/kTAFWfWLZafKLFghFrpSX6ehEqJyccQcCvwmssCLcJ9
X-Received: by 2002:a05:622a:a953:10b0:4b0:8890:105e with SMTP id d75a77b69052e-4b621507117mr87845111cf.2.1757585758242;
        Thu, 11 Sep 2025 03:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+FP/EvbksufoGB7yZt87mFGo9Mn7VdVzO2soInO78NzAyreFx9DhQ6rNkNHS/PzrUOKTl/g==
X-Received: by 2002:a05:622a:a953:10b0:4b0:8890:105e with SMTP id d75a77b69052e-4b621507117mr87844921cf.2.1757585757776;
        Thu, 11 Sep 2025 03:15:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65d11926sm321542e87.140.2025.09.11.03.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 03:15:56 -0700 (PDT)
Date: Thu, 11 Sep 2025 13:15:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, todor.too@gmail.com,
        bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
Message-ID: <srawt2oh3hcevopcrvpnmbocw4wknaytyvxt6yjmnet3yujupr@ub3t36ffbrcx>
References: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
 <20250910-camss_rb8-v4-3-28f44e1880b8@oss.qualcomm.com>
 <u437qomhok4yg6pef4xttd3a6zibuybzaeys33gxu5frbyp2kp@mgmym6c5dr72>
 <8b194a19-182f-4f49-9427-c0044a9b4dfe@qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b194a19-182f-4f49-9427-c0044a9b4dfe@qualcomm.com>
X-Proofpoint-ORIG-GUID: kdI0OZ0K9MyA0ReJETNVh8lKZeBA5iUH
X-Proofpoint-GUID: kdI0OZ0K9MyA0ReJETNVh8lKZeBA5iUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/AhkoGkXCxmm
 DE4PX9AHN+tWvZbDfSXpt1WZmUuHu9QlhP5NBIIDRnIdzYtE+H338KIKfoEFaEEzdBcTQwZy9C9
 eeTar78sXbRrBrYldnW7zgoZ5MroOxu/Rs4sfVGjjZp8nmW9S72Kgkr3uHAX+HdtptTyHfxfjV6
 gD/uqCzPwdf7u5VSF25Nvko39uk/tbmKZRSMIssIdcGRatfn3PEbXPxwKiwd1kWJ4SZSvcA6Lni
 sMFnuNj8fF9P/iFrkjMlA1VhCmSgz57o888eScTvnjclgxpwomOieCzvr9pruLQunU8opORtDb0
 6fClz4RB2trJgwL6YnNPas9+eJ+JZzctT+IF75z+5svrtKxgZREU4amdVvOhLIifQ8P/YiIV1Ms
 aF6CZStd
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2a160 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=lHPSLNiHg4AawE14pKwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Thu, Sep 11, 2025 at 01:45:59PM +0800, Wenmeng Liu wrote:
> 
> 
> On 9/10/2025 11:23 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 10, 2025 at 07:06:23PM +0800, Wenmeng Liu wrote:
> > > Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> > 
> > Is it a part of the Core Kit? Is it a part of some kind of mezzanine
> > board? Why is it being enabled as an overlay instead of being a part of
> > lemans-evk.dts?
> > 
> Since the sensor is not part of the default hardware configuration on the
> core kit, we adopt a device tree overlay solution to enable its integration
> dynamically.

This is less helpful than a similar response to the similar monaco-evk
question.

Is it the only configuration that we are going to support? If not, then
the overlay should be named accordingly.

These details should be described in the commit message.

-- 
With best wishes
Dmitry


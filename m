Return-Path: <linux-arm-msm+bounces-63763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196DAF994F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AD7B58511D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630C51E5B82;
	Fri,  4 Jul 2025 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nbus9nel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30001E5201
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647811; cv=none; b=UPpf9ocXfYulGJy4ba9eLDAQhYtY1Coc6vJIPq2GPcGLfR9roduxS8CW9hivdznPnEp9acPfmhvHk/xc0A6HGVoZqlWm4OepBWkOG+O4MVutdgQH8Clm7yA9167hCQVFphoNZgu/3Darqrw9kfR23NeHiruccOd6aQNKhuA+KS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647811; c=relaxed/simple;
	bh=csbEb0KENiAbOhaEZqVV0SELhvMQVqF7Txk57mtfHe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv5ImHl7/HQfquUaui5aYgslA+8BlvfImUoxsFLwLEwiETMY3Ce8lOWXUVZ6yQvzq0PU2q8UF/M1Kdvth1+98LETnDWOhi/qf1tGJ8HenKOLzVhyPC7AuSvKlBq0535vxNUqggkrjReqz5HLK86hhkG8RQdBTUnxnTGiEWMybt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nbus9nel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564FCSXr005469
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEM4j1XOLi6BZwo1cLv2zjvJBeM0ee0P0ue89+lcOSQ=; b=Nbus9nelbqg4FSna
	93HfDfdeto7B2/ugkW/4Ws0fH/pDoriS1o95UxOs6u6ShkE4zj1iE4iKMLCwrn4A
	clUM2W6i6yGumd3cyWy6koyrmQViLHoDDYM/gKqn0/NA0+1+0+nwT6mmr1Nhqv4z
	9zDVDsCE3eJIG8K2MPNG7PK4BcJkCcHnQotoE3GNnCL0XGbhDf2vetMfObCnRZfs
	u+Uor4qXhiq5WEZarpZblNzsR9bF7NlVJVqDwhpSS36FiHXutebS0HiSriSb5tR2
	XxKc+4/ZAIBdNWyOxEuDW2GWaOC1NAsEwogfaq0ubdX6Bj3IZ32jO8WCcpsCUBdg
	Hj1v6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmmbnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:50:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3cbf784acso285062985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647808; x=1752252608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEM4j1XOLi6BZwo1cLv2zjvJBeM0ee0P0ue89+lcOSQ=;
        b=rX03083aLeaaGVA5DYnNw4W/Sg0scnV4X5Uh4G9zrs/LR1mITdEAgPKbLL5x37IILl
         rNBNZbvcPrSyTGXc2kcjm2c612V2lP612Lt5u9gdIO7ofuZ57UZT50+KVfcG61oe5/bp
         XfOJTd1MmT9Ges/jP1nviH4dIgq6BAoUdbsNEVp8ev6J4dipiMS0Tjl2CsKyn6JeeNRA
         RGcvq5kluqizX+JZ3ivQsZxO6FE1l5LwkqA/SYVLmaQDBdBsc2DBdmaNOT2C0puNF2k0
         oRd2iLfo/at7p0aA8HBVO5zI2368liWYTqWVIDMH8TgdTzF2z46apVarHrqia/zQivlq
         s1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCX47sCACJlaoG0t1HVfZdLlLpmPFsabZD/yvC5Wj8ZEDn+xqBGwBFxcA9XIYqzzC5IGaoavHFZJWegxLh05@vger.kernel.org
X-Gm-Message-State: AOJu0YwgG+hEJmbjRMMvHQzs355dU3R4FQcHSRvgXWB/CRADqXVa/pYm
	6ISUqrK+/I/Y3UzxTbQueszbASKusatTV4mux4JcAjXw18IP6D9EfRY7Og3C6ZYlTH7eFedXHm5
	X3K3AqhLsTi3Ukcc+VxpKn3zENciupsvS8tJ0sxAARDDFBj7AkC6y99BRNhzuRy+xnFRE
X-Gm-Gg: ASbGnctEavin0x4YI4Qewj6OkTqbw627ldsSNQ1vpNCKzbUiwFbAiqXgg3SfbNCYp5R
	AcAptZt8SHQOHQVZE7BNWyqplsRLAl9d8xejoZYsrIdk6nuMrhibN7uRYLdUpnfYDyHCshVNrKP
	FynR99BNZS8JeknEKPOwRR1TUKHuCM9ydNyl6jz0e9poX4qU9ou5DBsPVSOSndEwodk1Zeq9fzN
	plLU2MtA3L/D8vfDLjsqL1Q3JgeO7cFG4mmu+EKrrQO+//jTMGcfyv3sVj1HrtmhenTWpWT2CDt
	wxjWETcIz8ddgiAF2n6LM7LyfOy7/T0Jv2JNq1P9V1FUarcL+W16HAVLvhq5MqjrLYaReEaKZCa
	70n8Keb7k1OS6ZSP6/Kdm3XBd/jurk1H65fM=
X-Received: by 2002:a05:620a:261b:b0:7d4:63a0:e0c2 with SMTP id af79cd13be357-7d5ddae41camr392081885a.15.1751647807795;
        Fri, 04 Jul 2025 09:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPoGPvTmGMkFyX/qytnycN+mM326tGMOLxBZbe002Y3SgEer69CCflWTfw/Q2aA0VrRAuyyw==
X-Received: by 2002:a05:620a:261b:b0:7d4:63a0:e0c2 with SMTP id af79cd13be357-7d5ddae41camr392079285a.15.1751647807416;
        Fri, 04 Jul 2025 09:50:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baf0asm304624e87.7.2025.07.04.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:50:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:50:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Message-ID: <efods2cmjrhbjvpffswvsubm52u2hvkd6rry7gjwm3k5c7ezo3@b7wc6p6ieiof>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
 <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
 <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68680640 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Xwy0tvpjcyFCf_kMTfYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GMT4nup6KD7hTq2Y34HtEgz4gI6ibHxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfX4i4+ObsdoAOe
 /YqeKSPeNiiwiCtkeSda8aCsYssh4S701vcPa9Jbx4WD+T7BDXtzO8NUxEeJ5dNih3ZdetDwHzx
 YjRNB9DAZ4Jm2Ws8lfzcBSPtE/fqC/l2dV3N6ooNK1pI/mXMYwWcSqojNmnvG2VnRK0NmPymhKd
 /lmxGOvy4dgVE4cH2XqHppeGCQh9LWoY032FnHfkEphw4OUAKDbqtwZWrlf7r7tMKA3mCK6BL9D
 bLdzCW7g+3FC/AMI13F3ugtLMzGk9LN1+21zjC/HBg0qZ95UQMk2hGNNe3Kwb4QO9WneRTjo6aH
 DXEnb9pk55LcYnc/Zwio7ZV3VA3eJkd+O6xarizDlpS1FWCGE7KtbQLZkoxJPBNRJlhkQ/5TxxV
 CPRWfIfFVmlXSCzV9daivxeolLHbS17kaFTSLpDr5FpFi6Mx1Ffk4pIsqs8sTWTWLMNuBU0b
X-Proofpoint-GUID: GMT4nup6KD7hTq2Y34HtEgz4gI6ibHxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=831
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040127

On Thu, Jul 03, 2025 at 10:17:43AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 3, 2025 at 12:50 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Jul 02, 2025 at 10:45:33AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> > > pinmux_ops say the controller should be strict.
> >
> > This is a strange commit message, shouldn't "gpio" function behave
> > exactly like that - mark the pin as a GPIO?
> >
> 
> They should but they don't. I should maybe rework the commit message
> to say: "muxed to the function called `gpio`...". The "gpio" here is
> just a name, it could as well be saying "dmitry" or "123456", the
> pinctrl core doesn't interpret it in any special way. What I'm doing
> here, is marking the associated struct pinfunction object as one that
> should allow pinmux core to export this pin as a GPIOLIB GPIO.

Ack

-- 
With best wishes
Dmitry


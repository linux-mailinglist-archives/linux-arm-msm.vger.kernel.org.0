Return-Path: <linux-arm-msm+bounces-75536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18354BAB7F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4192E7A801E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07822185E4A;
	Tue, 30 Sep 2025 05:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwPDo/Qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A5275111
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759210265; cv=none; b=VnuPgAKknWAmoZ2YKgXdVswUC0PeMjd+Il5lEQnTQ6tr5f+2TFqz4I3dgtryaPef1FgKsbtEVCKSG90QeMQo+6ZMiyRJpI5e8yoZ5dXl3B/iK7bzj9bHOQHgT9A0eZir9uyeWdarIWo5e0c/QVkpQxLLK4KwFun7by/L8Ai3wOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759210265; c=relaxed/simple;
	bh=c1hbJ4QVN2QKwWUt8BZGiGMhen8o5hisfOGAZ6GjsQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLBA5ax/mK2h4Uvmr6Ej4Mnx0B081BlRt/uMMsFvlyYPpSE/DsI1Sqryy0qO7buA1g8YsnutM7569KR4m6tUlBxPDFNPeCz5oKR6ao5B2quCBAR2prRjbLCFgNcuJQgVzjGY+vEewNHhY6QAeBZCtKyZbx3qfaA9d3Y2sGUCBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwPDo/Qi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hgnt027330
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CfujRjeYJD9l5CaOihtpw+qu
	0BjNQ059im0pH4ag+9U=; b=gwPDo/Qi/DlDHS3hRvA8jQYXxQFoQkFa4EPle6w7
	UcFtFsvnBfjDoh2X3eTDjfH94Cn03lrWpMA+duDFrQYEEdwbsCr/W1alndVHX7br
	g2PxNeyR1m+glgwm+yrG2HOK26y75Yy6aRPtIqSRtub1NHr8ApANtW271A1pQBwF
	HYtWeG8uiFm0FRgD+lNiukHFgGHisXr4ppZXR/1PwtYd38xFstacb+dw0QisEwGx
	hzLrDk7WLIPvcWBCupJdnpMN+WwJF5hBToIikhQP2FCIA1+7EwMd1Q3d9McVT2Xs
	TJVGvTRoq13suATOxl2T2UjYX11Nue0nnOpch+SHgBADUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1ak6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:31:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de5fe839aeso95852221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759210262; x=1759815062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfujRjeYJD9l5CaOihtpw+qu0BjNQ059im0pH4ag+9U=;
        b=ToXYEwJUWfiX+yDytDw8soJEvXxFbYIjGmEatk/0ytU5ADY+bPDrwWUEobWYh9B8hC
         w4CC9it/r+hp+daL+YstAC1Tk1qw3Tiv+wIN6CMtz7ULT//6gUqluEjTY6z5dUq3bBaA
         i98eciUlEz8t2Hka2lRDtILjFyrMERfseXXHhT0/p1mj8NPV7/n+sDfx9rW0Kkdm0tCt
         WvL+nIs9viDT0ipDR4hOwre3WvG2mIw5aNxy/q2/9pbqI8MHXCWHlGjcCH2TiLu+BR8F
         BUKrOMEu5/bQRmCxb6k6ZXudC19AFmES5Xp/WYsM+QNrOffxfPT/o+OhmD4r3pM+7BK1
         +kBQ==
X-Gm-Message-State: AOJu0YzjJ0dwll8pk+E4S6HuLHzzdrL44bGEpPDj6YTW6STUC/iy2Jbc
	BKvKk31duszg8X3meW/KOa/ULwB/NjZXTtNnit8up5whEPYs7HQI8R5pctsQxmOHxq4ExJ+xU5J
	8ELTNwllLGvRbHiT6pph/cGj6XKnGTbJdJ6o9Kp+RdgNnqV4EQCrpJ7cyu3/9VAYXAsUm
X-Gm-Gg: ASbGncsFHGC9eVbN3xCnuWBTlh4S90Wfv8/z97rRUeRmEMqwpuA/qhgA2phw769I6TG
	0NRSdJcvv4Np8cazcq6tWd15UkuWIc32UIyaAROllxzbejNgvToHjTA/0yT233OOlM9aHMfMFR3
	RTzeMLZUPbJN43RnQ+AOx9H4BgNOnTTLyqDopla5TVak927BjWkjbZMcJnnYdWeivhfjcc0TjkD
	Nw23UPmxQpmkODRn/AkKinfzkOsnmg1OScblBt2IFQGICtu19mQSBmNl/qCKHChtSSVRMUtrOda
	ApWvjP23XsvYeeNvfWZ8YidcX8BPzGLovF3lGDNx7dV5Zxk8TLR8Yxdh/uJ2fvew1nAxqU/svc/
	b5n0KEHe9fqyC7tCNLve2tkV3KusRVi6jFBhdwfVgJ81Jmg8GElDVVFMJAg==
X-Received: by 2002:a05:622a:446:b0:4d8:466a:3dd9 with SMTP id d75a77b69052e-4da4782a225mr238702001cf.6.1759210261860;
        Mon, 29 Sep 2025 22:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE59wBYXRRhM+8cRo2gz+RvbUxxJXwLq6isD46Oga3fUjhQJJ47+DGRs8cQZMH5c0vQQAp1ow==
X-Received: by 2002:a05:622a:446:b0:4d8:466a:3dd9 with SMTP id d75a77b69052e-4da4782a225mr238701761cf.6.1759210261335;
        Mon, 29 Sep 2025 22:31:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586048c815asm2453433e87.25.2025.09.29.22.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:31:00 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:30:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-arm-msm@vger.kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, loic.minier@oss.qualcomm.com,
        andersson@kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: arm: qcom: rubikpi3: document
 rubikpi3 board binding
Message-ID: <kui5hmtslrbtvrtdbwvuhjoytmrvwwemn5cuqclflk5nxbcd4a@ajr7iqljnv2f>
References: <20250930043258.249641-1-hongyang.zhao@thundersoft.com>
 <20250930043258.249641-3-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930043258.249641-3-hongyang.zhao@thundersoft.com>
X-Proofpoint-ORIG-GUID: RLxwzE8Xk-klDmJh4WDfLkkAZj9RhCAi
X-Proofpoint-GUID: RLxwzE8Xk-klDmJh4WDfLkkAZj9RhCAi
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db6b16 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Wdb1h0LgAAAA:8 a=XIHZwau9hgzlameAwyUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX+OEyKo5JXJeV
 SClpn5cU4CCf8Kswq3dF9zrCeTkp+JJa9hz/coH7CS/Fj8XhRL5ynDI8R/LoWISbLsek7D9VPNR
 Ptqj4NP555A3LgrGvMIGmr8qUFNKxybInjku8eIqxM5XxDl8wRFADtUpFc0+dQAUb2H/Ra29zA0
 CP5I8yz/M57eij9JXtp3vCoti5q+TX6Khwao4XAhbylNmT91GyoMoizimQoqkWZOLQJmAO3kfkK
 aLT5n6Jep3RZ9E3Z7luzQNyc6oE/m51V/sn2dnkffGatq5Dh/Uu1Xl6WRmHqfyJTg1uw4N5NXk8
 gvl5oZtgFJbeXqa+AQ51iyK+uVjEytfD8DlrtjWVkqwdhdclA1263vUTMkWxpBzosMVF2iwK7jj
 y7SRlcC9sosA/puysLT8P7l4mOCHGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Tue, Sep 30, 2025 at 12:32:52PM +0800, Hongyang Zhao wrote:
> Add binding for the Thundercomm RUBIK Pi 3 board,
> which is based on the Qualcomm Dragonwing QCS6490 SoC.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 18b5ed044f9f..763fa2ad2425 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -340,6 +340,7 @@ properties:
>                - particle,tachyon
>                - qcom,qcm6490-idp
>                - qcom,qcs6490-rb3gen2
> +              - thundercomm,rubikpi3
>                - shift,otter

'shift' < 'thundercomm'

>            - const: qcom,qcm6490
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry


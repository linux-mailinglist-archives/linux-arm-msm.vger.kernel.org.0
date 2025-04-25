Return-Path: <linux-arm-msm+bounces-55579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA5A9C319
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA6F16C9BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F0A21D5B1;
	Fri, 25 Apr 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muQgx57P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4022A800
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572668; cv=none; b=LLrE+BOeGdew/daUOxmScKWINuoxLqsVj/GgzTbHkIxLG9ilgbtA309wbW5eClR4no4lGsGMSUPdwXVkDtBNdpD/jwEt1GcektDGDsvBvOK8BKue4Q4X4McejLFws0GLwTkFlTRiJDgtHFH2zSktd+WHuVBEcf0PHfE3dscgEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572668; c=relaxed/simple;
	bh=Cgy/ew99CTAyh8TT8GWMGcHdWQLx7SIMZeGyXxuUhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+9Baok5phpIm1FtrevmhwausRENuppWcoujKuQYJ9ucDHeyM7w1OIvtGDdfZ3igJArY9KC2DaKEu4p/8Le+5nHSolt9Jq+OWB0cZoobr1xRZehT84O4VwDXfdf7Rq9DnAneVTrDlRuqVD36dULajRpT2Vp8nibryLQCiAB9hjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muQgx57P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T91E023852
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WXe0NlKxDZrPju6112EiKpqV
	yTfdsUulvcoDoYo4cFQ=; b=muQgx57P4ZWorYmED8WgvUdhFZUiUPW3sy+uF3p3
	OGxNlsoyze28sRkhibP53thoMwaQZQaQCERfHqLKYWPdBxy5/M7lXAHBmvChA3II
	mZMQuFQhIBWMsSDWRhs7lwAPUfy/9rwZtp7ImX1bLt+JQsZ9etmMoVsDHPuaJCdu
	7vczfLWkRXhRPc303ABefG7k0w8mj7TMxDhumG+JmQDkOtbZpHVZIVYczdNfe8J9
	xN6+cOkvpKOfHBv3v+Noo1QC8mKihj7XCpMu/rpEzERng9IqyBJFyqmEBHnPApYs
	PZ8ZvpRuFKZDjGFeQvwpKt7HeAhRPWvdSCC9IKTEmWXMng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1rf7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:17:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso357748885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572664; x=1746177464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXe0NlKxDZrPju6112EiKpqVyTfdsUulvcoDoYo4cFQ=;
        b=itpp6gfsftvhftrfhK85K5LDKM9LLLc7mKPmamOwkzVUPk50ipX5gbdV8jcnmZI0Ll
         5wksfFmg1hLVYDoOmt7kDVzesP58bAn2DeMqDqxiupY15pgt0tBZcBSxl6CMVR8ofdfj
         helZ2ErnXI5vP/2w7rZs9kxHBjtuvP9DuhsgJReO2NyADlWqY4J0KAhzsghsNNCl0jRO
         Cfizn43C5jPr6zP6Tji5wV2jo29vQ0p5eebmB7QLUSfa3fyOpOgV/Lkt0QcXRiZ1z4Vo
         alQsfc3f3xsCACchXq8WYLEg5Ozdody8tFqSopWa0R7o5dmfaeTMdQ0yUnFPwGaHs2CN
         +8mg==
X-Forwarded-Encrypted: i=1; AJvYcCVk1NrwDbS7GmUthfxVVnZ7GCXlfFx7474PMBk46g7n/DiNVnofvXkGirWe9BANcJ4OArzYdhNZGpVQSTGf@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnieNgny6r/m2qDwHBm82KdxAYh3Te4aumUeeAdn1b6rX6R2F
	+/C11p2no3+lA7yLXB2IoRIyuw064fsYAxKsp4Zl7OE84LIWReQ2J0640cACocdIhRdNyTrrWvO
	v2AOWHEbspcfjf3wfx9FCsTHYiSpiZiHZPo+BY/+NDsFVWShdEYdgRUTXnd6jdD5Z
X-Gm-Gg: ASbGnctLnCAtlXgk7FfG1TXblFtbPD8pVVDszDNWHxm0kG7AhAcBRlrDTfLKQMO4mN7
	Ebn7S1VIr8ReJn7nkkhuC1YYhCd7ZOQWeqKS982Xw568/R9bcsg7sVGhtAijbJLsicdkJcPHboi
	167d1RS7wFzrB5xS7Psjpl+1z5EuOSpN91wVBioevsucbNavPk4U9LKYvfy4I4O1YeQVeYlqeRV
	XmlmPWEx5PhmpZxfG3T5YOHwQaqPoexeDRgiITFG9FINjrl0ZLpHI0K++Va6zRHQG1tC5FYY7hg
	BopfHA0d0me890D0COIakGU3ZLa/y5GVSFsIBCFN3tmWztL5CMDQThAMP84mqsTTUKiKw8gV3qQ
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c9607880c8mr280226985a.42.1745572664419;
        Fri, 25 Apr 2025 02:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZA3Q0DX1qcrcU6Q5IKBtyc3e5N50tRXbXJz2+iHVhL5w7s0njAeQLwBISLkAKAlk5TRfUGA==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c9607880c8mr280223985a.42.1745572664115;
        Fri, 25 Apr 2025 02:17:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d45sm6437751fa.94.2025.04.25.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:17:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:17:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Message-ID: <dfjrssqxny7wwcrhybbgx7fqvibvwxvkuba4sj7ufkadpfoqme@nwvcjyjrn4ze>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
 <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
X-Proofpoint-GUID: smobYNnF-dLfiKjDJ9dQtDCor_SqxSfh
X-Proofpoint-ORIG-GUID: smobYNnF-dLfiKjDJ9dQtDCor_SqxSfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NyBTYWx0ZWRfX+U6974dOXq0v H7eJ71xoLKqJDB54cKS1z7CobBHXdV+a6SLJwX4ukl3DIqpZPi7sSqXymE4a42Q/Zfnck1L9n4N oSjlo9mKaSDnVkLp9l/6F2szWzo6Z/8nkA6cXS2j/zK2kD9MHt7S+bceH8nhezbHa/iDjluxNdR
 bDajDiqKmdPUErshp00mzJsdO/tz4qfQVe3uWPIDupkO5AVGtN33nAtkPzx6mjPAdjinutFMXls zFEPWrsJI6gr0OVlBgNajzPYuMEN7Q++v4foyFOs3sgDq7aFbQv2b7p5GczB1I7Tzg4pf1E0Ejz UfMDDZa0tcZcPPs5//3UsLfh7kzeqwd7ZjgXYRFthVg9jbwZNVKZu07uohDRgGuBBNSQDNiECRJ
 i7om0gcBBjPXJG0laodxfkRvz1yC6BSlJENZg2N9+14k+GkI3Karq9JcOY9RDBiq/kClt8iP
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b5339 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Df21-P5Y2jz7HsL4rSgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=492 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250067

On Fri, Apr 25, 2025 at 09:08:15AM +0200, Luca Weiss wrote:
> Extend the USB graph to connect the OCP96011 switch, the PTN36502
> redriver, the USB controllers and the MDSS, so that DisplayPort over
> USB-C is working.
> 
> Connect some parts of the graph directly in the SoC dtsi since those
> parts are wired up like this in the SoC directly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++-
>  2 files changed, 57 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


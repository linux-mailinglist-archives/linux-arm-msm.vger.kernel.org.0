Return-Path: <linux-arm-msm+bounces-63818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04942AFA01B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6419B1C2527D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76643231855;
	Sat,  5 Jul 2025 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3Y2loii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAC524169B
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751719737; cv=none; b=kW0SUUSfE5fxo5fy/l1WNibjL/Ss/YGuYbDzudNzzmQrJV3049kAUkFuGYHZEVPqJK7/oCrdVwzrKga0BWDok4p0Jtngp25wawxEqPGOrWZ0+PRVOVpyTxnskm9/L+0HajgZB/Whcu24L2/7OsD/o2vELo7/BEzavVy6yc8QAtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751719737; c=relaxed/simple;
	bh=Y7EyKfBSRHZBGtZ/i3dfI9vmr6KzOWNs+C1/vDsS1Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdY0/aSgcwbXOr/MBzO9IUbVXK1svRwlwjuCqSJHVKPSgm2op3mH8OTWkBGrSoJR8O+0JU/ivsaTrgW28ML0rTQ5cysPls1QxTRjREPdcIkM2y1igwjFgOmajJ+jznc0P9/oBmH0uXakLxkQXK+0Z4BXVQlmQGt0vkMlntplvVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3Y2loii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BPPeC028164
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 12:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YYDzRNjF8uzCuPQhYFWB+epM
	qZuTDXCAaPhzLQARRfg=; b=n3Y2loiin6Un8fcsD0XwJIWxNXhBQyw1JE0XY+gY
	Ztn5ZZJLN7HW4sd9l0mna4lKJICezcJ3iMpmLSCobObu8WDefTSkv57MqqxQ76V0
	YHYVqCfk5qmTwy81G4K5YhDu1Q6tRuuftieENYs3PMISX+o+TwpeFi0D/JzomM5i
	qRuesyNvY6nV04gRG9V1YZIJi8ba8YI0GZkJYQzgw9aMtB/oZiwfkX4dVq+jFkzU
	Vql2/t/g+nmiNleILD90zpBIhhcy2jBeAfyUs0+VF7V9nUeG6HBlagcqQvNahXsB
	INU4kEns7LyxwQivGv03o/vuIpEOsVUqlLL7iHScOAqkdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0vn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 12:48:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d460764849so464883185a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 05:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751719734; x=1752324534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYDzRNjF8uzCuPQhYFWB+epMqZuTDXCAaPhzLQARRfg=;
        b=Qr0qat3WrP9tbNmCHl9Hn53+DS4ikwmzLOIiX9c3Ky6xVv7tSKyZq2RLc+1XfrYXNq
         axRi7jQ8oKvCLnfVR0WrPIGnYT6QCLngtNIx26YI+JY9SdAx9iDUXwDOivm9SAnTWy41
         EDqUhIJF3cxeXkGlYqD4HWq/0meeLwgEalTohVabiZ8pwhUObPVyU75dvhslzS8QGOCK
         Ks+95EeQ2fZ1faIgFv+vzil28iziOiuAgy8bYci1uRLA2pYFd9/io09OyMVTdstGGT+y
         qi3PFz8keTa9LC6GnlLBKqVCh11foJ6b+Iw7oE6nL6rh/w9lcgaz87/siTej7pRO/GK5
         WrSg==
X-Gm-Message-State: AOJu0YxsRDAuAHYfsFQCbCt1LVDUCUJnfZrnmYDVI7agIifhYr8MSRg3
	4koeu+tA8rIjpgU361YXLWP9tzFblK+gcIFnWjDyonhHZJhkJrK65ez0HAKK91V9JknseDCFWFi
	KHedVMZf0XE6aKoQMlVHOTdZ+HR+Tz1icx1VnpNfe0iwwjl6TGxPUYSKXog5dJH0OCvQ4
X-Gm-Gg: ASbGnct7KLD/Nu8rFRDk0KYs+C5jIqs27GKWwJVlP0nEIqaHZ0/rjmCPW7kynwG8W91
	3pokvZC/F+n8yRTuUyTY2QK2wYXfHuqqU26XWYi3LCrUnj2xdI4w2s3YR7AvxxdL+p6T5ohKcct
	pz/fdjkybiDTky3DO4RriqlnBKNBQ/mTsHE8FXw5h5lpRABdrOV6l1rCEqykwsq0YAXJhCU46/M
	zZhWZCnrAHhSa3pCUJIvC7S2Ssu0mjVRODxwEaGhtpL/cpPagIf+5XmhPVuYt/SWSg/ysaSfNnZ
	2sCkSs/NrkpiDf/Gv3deVyfWLGrrZx7+SMvxtkh/yblxNYewzxgRY2l+S4wBCPxK5PTqbfhbIBT
	7tsiA+whuPgpxucg/fLgPsqf7zHG5cn28Qm8=
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id af79cd13be357-7d5dc6e3826mr945634085a.25.1751719733884;
        Sat, 05 Jul 2025 05:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqI2WTqV2q9AvlSY7pRoYe9Ej8J4VjWV6DQGumpelvXT3KIeELxZRKjxBRnBJEZsbY0Yv7Pg==
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id af79cd13be357-7d5dc6e3826mr945631285a.25.1751719733416;
        Sat, 05 Jul 2025 05:48:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b143065sm5248601fa.83.2025.07.05.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:48:52 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:48:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: Make the IPQ5018 bootloader reserved memory
 area modifiable
Message-ID: <nfza7lngsavbyrmtkcitabed63qxeazgfvro5anx3vwpfqpfbx@wolk4pgb35m7>
References: <20250705114134.1615729-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705114134.1615729-1-coiaprant@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4MyBTYWx0ZWRfX5lWfd7/onVZz
 7aHxhQL0anCspWhWvUQkD3OEw4G/ke2xuWQLkUYRpCtr/3xaj/X3sfpwFRr5FsJDnC1TBD4BvyV
 DXdnFqlcpxeTAUAOaeTXIHpxvTyV88DsA0RqoLsyNjMZUJxc+K6lXPf7tKpdXKsXZ+Z6eaOHAg6
 znmoGIGxol2fouR5EHqIL020bOiZMfsh7Ea+eS0xNtGPLNQBiQekDXgb98emAz9KD8fT3XoCltV
 a8J1MEHjjPL4aGK4eUef0hRFCn8xNa13NfXALDdKFB2LFmYyPVdBOdIKvUA8hDM0NbQXi66PMPk
 C4KWsJghzV290YYtDfKgiXuvHsLVWAPuO0I+WIk4qWtaHllLFKMyS/QS2g52flQCZK8PJqg+2jz
 i0fQtQiU75s+sS3HJP3YWOwGwBWMjqFjWbObqWEg0/vElamogOBgoHzECsYtyjKlptsqNozh
X-Proofpoint-GUID: Uohzl--ffK9odDJCxwAi6GNQYTpjtfUY
X-Proofpoint-ORIG-GUID: Uohzl--ffK9odDJCxwAi6GNQYTpjtfUY
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68691f37 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=94YVpTIb0c1q_pdRO-IA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=624 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050083

On Sat, Jul 05, 2025 at 07:41:34PM +0800, Coia Prant wrote:
> The reserved memory area size of Bootloader and TZ of IPQ5018 SoC is not fixed
> 
> TZ and Bootloader reserved memory can be 2M or 4M
> 
> Make it externally overridable for some out-of-tree devices (e.g. routers)

We usually don't add unused labels. Please add corresponding users.

> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 130360014..479982728 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -105,7 +105,7 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		bootloader@4a800000 {
> +		bootloader_region: bootloader@4a800000 {
>  			reg = <0x0 0x4a800000 0x0 0x200000>;
>  			no-map;
>  		};
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry


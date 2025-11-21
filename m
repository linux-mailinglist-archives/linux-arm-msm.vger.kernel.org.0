Return-Path: <linux-arm-msm+bounces-82833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8098C78EDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 8B0B529038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B34345CBE;
	Fri, 21 Nov 2025 12:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVcZqVi0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMf2ZZRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1580033A6FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726612; cv=none; b=rchduHFMkNrpJC0c/gIrcz3O0fdpCL+SLvi3kKTY4XWazBMYg6LfjLE5C6du0fHr2j5tohHGcc9tNUHuPIkWdBhe6yWI8BRLCpTZkGEEqxNFxhAUYUMrCQ9KmwdMwwXWZgOtWx6s2WKzwmEWI0cVQ9J9VEF9ZkYzH8QcSSme1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726612; c=relaxed/simple;
	bh=72bq+FzO3LP/XrnJUP4JMWSAfe1U8ypKlvs3Vb7AN6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d15ROMvAAEk/DI4wjiPH2LDm5zujiiwvNH83bqXK6YeXvOwFrRruoRy1J5ceLo5EKK1xlNpzNeC3owMNCQdy0Ooi90a5kxQQYJiXRhWh3NzzusQOxpsRMjewuS3MmZLx43A5xYY9TmgXtZHxnpZvV25veFhDRPg7QQg+qWPWuKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVcZqVi0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMf2ZZRx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53tMt2841258
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KYuICS40D0H5Ed0tW6mYn0VWmVRLGxZb6gCDc23Bg8=; b=pVcZqVi0nZxYzwLN
	9l2CvJNeiDlkFGjLFhynqk4D51I98j5N6UBzDEJwDk+9KHle9X4MAjOtD6zGUB1r
	4q+jwVthrX3JHVfhMZkRD5HLc+lZTdomOP7csDAGTEEdol8KjIkZePzA4APVOHEt
	hGs+NycMxo5WWFVWRv/9mH1yibhOdK1fFSdeM2Qg5AiGrrjVg1/kRyhnk5Fa/TvB
	ztLN1inXahOuszEgQSnf6hoGvYzBBQ3S9zwXThjp5nyDnY7scTeprcSncem1DNgL
	K54sUDS1M9jZY7XZo7o9oGvQ9vJkQ3xBi+VSMBRuIWuo5gMFnoLsWpHoCkCAP4FG
	NJo51g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvhbh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:03:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55b099d692dso1196792e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763726609; x=1764331409; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6KYuICS40D0H5Ed0tW6mYn0VWmVRLGxZb6gCDc23Bg8=;
        b=bMf2ZZRx39/crMePlD11zj0VdvbzI4qBSa3GaBoobvyHVFBowkhIP+aUwX5Q9JPWTG
         Il1hiGywru0qzhke9aa8gFcTxWqvqIxuQ5NwVuervG76ddfYqIeU/WBf6g3RUaD2hh6+
         xIkwfpwbvD2Slr/2qG3SE9AaMzyAB73Atv/vqInPttjaZ7rHVca6SC1R1AfXlV8M5GqK
         H7yuVRq5loXkzvwhA+SA8wmFPiBC8a0YpmZdjIquhuwyNuRjksYgqDLMQRYooqGuIeLI
         SkQPRvuendhMcONGQnUYT3d+pMjbM/D+DxODq/5KuzGqFOe7hFaFj9XGr7uKI54yOKFW
         cCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763726609; x=1764331409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KYuICS40D0H5Ed0tW6mYn0VWmVRLGxZb6gCDc23Bg8=;
        b=TTeJv+wM//7zgNtp5A907G9gjTAZvS7Nvrps5FTZ1kfpKLv6aUVuiwMMcCsPPSuYPZ
         wOKefK6kWX6wTXxTqg+ad3mCkaYFMHr6KG15jPx8sJcsNcA/8A2BMHEULWxsuHrct0Lz
         gaclfEosyu2OnR7vzI5b07oMbO323jOD/GVeflKgoPRWrhybbQ61qGIQbpHzuKqGq5NY
         97uYuJkHARz/I2gU3EZLZzplNyCV1V13UCTmK3ksmuOG2b5XtstcsesDT7anQF7G6D/s
         IqXMhZiZuEY5BZmoQ/97EubmzgHO0W35WbONHrPkjV9vsnJR7ug8ZSs9hkCgW/afHRA/
         2bKg==
X-Forwarded-Encrypted: i=1; AJvYcCVb/SZNjvB5Wn9Zfe5zXaXQR/464D+0jEYsej7InbBfNpnr925QlIV66vJ1BySRXzCvCJYwIwmrCaxKRtrK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyp4f99hCAS0l9SW9H/QS92xlvN5vxcRRdKiMHRKlmFLUlSpPW
	jePyt/wfJD2Y5GSyQ61iNph2D3Pr4f5gX0+57pNb6/fq5OwqcohlfFhvi+Ha5uaG1poIVxzgTYh
	sdYUbDJLab/FKyFt2ou0Kk85RHgRD8Gy0NIrPfZ/OQEmm3rlpwQSd2zLkmCTLWXO3xpF4Lhtkts
	xq
X-Gm-Gg: ASbGncuf8TE3CYbZtsI61BITgSkQEhL8yDVihES7pXX1dpTZvwPh5sPNwPuq5NAs0UJ
	8PXSiVcjLo60iDykL0dsrRIYk7EF+drf0WY29w2UFhMFAHvOkinCIflxxMDb1LZJEfQleThGFqI
	MHNRj6egQqIAFBvj/WmmRpX3adXgqKtvUJrAjKQcHq3wZ1UsGbiNDEiQgw3ZkohLuK2Vr/p983X
	bSa6tUQNwQyocYLUgDvxqoKeT5HwESbqOoi7aNWKBiMNpTZnKCOzyW+UyZR4KBa7MwZj+Crr7YZ
	bq+ECUB38GxIbSXSx5WVlYYccbpYFW9Zub1vHC5jMmuHjLtDjXphoD48L5EVPHEMmEGeiGJPpsH
	L3xDxeBrv74Nn10zaEV/AOGiy5GZl51baP8UgY4IbteAw7tYfe5ois1JPIbI7tTwMifuj3uq5uW
	00UEtWdrSC6AOzDbbMo1z/gJ8=
X-Received: by 2002:a05:6122:3542:b0:55b:305b:488c with SMTP id 71dfb90a1353d-55b8f048c9dmr327388e0c.18.1763726608872;
        Fri, 21 Nov 2025 04:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjVLj9YvXGW4vLHulKxBrUDryaEUvf7oTsMnzZ5+4MLrCMtMKyjLbl9CgkclJ0nV6mBaECeQ==
X-Received: by 2002:a05:6122:3542:b0:55b:305b:488c with SMTP id 71dfb90a1353d-55b8f048c9dmr327342e0c.18.1763726608436;
        Fri, 21 Nov 2025 04:03:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5b2bsm1570074e87.67.2025.11.21.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:03:27 -0800 (PST)
Date: Fri, 21 Nov 2025 14:03:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@linaro.org, mukesh.savaliya@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP
 OPP table
Message-ID: <nm4hiy6vd5b3t65dagjx5m5qjfjdcnehz2s5w4lyu44eaqnwkc@hnmyhokxufz5>
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
 <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
 <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
X-Proofpoint-GUID: MhZbKq9z614Ry7kKR58makzoXG_dHVkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MCBTYWx0ZWRfX6Cs8e3YiXFhl
 5LW1G/UTwC68xKAlPaUTA10SsfBs4+leCJITygPbxiKhR7M9y8DNxjFd7Zpe8z52J5WbkSYu4Af
 aIbKx/P4/1urwPi+Z/TFVUcYl5sfArMXmq0O7tg+oakno0YAd/RgVIHUJxDTLyellyQ9Ir4ZI4X
 pImzXV5sAML8QS2t3IP+5XCZviegyOecz/VFQRa3JAarbq/AlGWhdbLZCDi88Kl6OhjZvcCK8uc
 BNzp6CoeJst6Bb+op6YDz+thC7o9MSxLS7P3w7BkyCDEjzHV40jHGo40hbWMMLzDSYRTw598LtR
 Qi/b9kFoSRyNup1bUpHS8UB5A2XJvQh5wQehmhR8/4YlKlIDR4BAuKKXJaKwfIkZxJF1KIIU/bV
 IYKKTpHGdkzzHpjzqC5tD5r3aqnU5A==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69205511 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WYp5QD1H7Cx377nK_-MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: MhZbKq9z614Ry7kKR58makzoXG_dHVkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210090

On Fri, Nov 21, 2025 at 03:37:21PM +0530, Viken Dadhaniya wrote:
> 
> 
> On 11/12/2025 1:25 AM, Bjorn Andersson wrote:
> > On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
> >> QUP devices are currently marked with opp-shared in their OPP table,
> >> causing the kernel to treat them as part of a shared OPP domain. This
> >> leads to the qcom_geni_serial driver failing to probe with error
> >> -EBUSY (-16).
> >>
> >> Remove the opp-shared property to ensure the OPP framework treats the
> >> QUP OPP table as device-specific, allowing the serial driver to probe
> >> successfully
> >>
> >> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
> > 
> > This was merged 11 months ago, and Yu Zhang added bluetooth support 3
> > months ago. What changed to break the QUP users? I think it's reasonable
> > to use this "Fixes", but we should document - at least on the mailing
> > list, where the regression happened.
> > 
> > Regards,
> > Bjorn
> 
> I’ve checked the older Linux versions and found that this issue started occurring after the following change:
> https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/

Hmm, but it's your patch. How was it tested?

> 
> > 
> >> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> >> index eb6f69be4a82..ed89d2d509d5 100644
> >> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> >> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
> >>  
> >>  	qup_opp_table: opp-table-qup {
> >>  		compatible = "operating-points-v2";
> >> -		opp-shared;
> >>  
> >>  		opp-75000000 {
> >>  			opp-hz = /bits/ 64 <75000000>;
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-86727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE5CE51FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 16:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD760300B2A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20822D0C9F;
	Sun, 28 Dec 2025 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEZDoLCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzSYq9i5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C42D061B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766936626; cv=none; b=q5HoqDlI2Ei91RqulM7/Np6eEg4iScBkBDjdlHyl8hrrrXQD2NWl062TapYnRy6dbfV3Tlqzf0E4/6enzWTYOg74DELyZpjlvak1ARCUKFyFhU+y24xlbgzvdtDibY5m7AVEfeJ1dFITLGZtx5S058Pbt9IfnnSymj9L7hOKICo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766936626; c=relaxed/simple;
	bh=HdNRxVeFyLxYHLxRF3Ls9nByKYBs4M0TP3G05yjm21M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSJsBmhXNt8EKqMjT1dhwnVQtx/jhG+vEXXTpVpnupVAc6X07zCXf7GIZJpI2TTDq2a6eJfpst36XRXLMOSqUKT63DyafDLqy1HyFgProCGsm9/up71Xa1+6TRGcbsNUPPExWeT/c2bDxz89HY8bCYXF0J0MP51nH0Iz09h+nV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEZDoLCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzSYq9i5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSAJ1NY1768242
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B9cEtP5oOmPa51VG3+YWKEx9
	H5Pcp3/wsuSeIdsxj1c=; b=bEZDoLCZpXV5i5HC/FZXIWgKYkYRFqOr6GsdlF2J
	IHiX2qyDiJs7UlE+GaqyiulZz0rCjI3qTZYNziz6hK8t/0FI8UU/EqUbcHR3qioz
	3oDCqGpMS7Uz3YykFAvVrrgDj2NwG+1WQzjQ8DujCEKHKVboSbbZnD40gVLY4ls3
	wQ4Gc3UAKx/4Epnjg6QX75bWLXGAJZuqhuX4LeFPIMMnq08V8f06VqU2qoruQ80k
	4Jt3z3XqZeEP3MvwqlyeDNQZaSSyMjTX0srFhSJHhwVWsXmA/TQGWfd1BkrK2M/n
	aYCkenF01veFuYBBdvF62K/qOF3xnz4uAQ0M4RmJbL2I4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6a9md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:43:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d7ac8339so309454921cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766936623; x=1767541423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9cEtP5oOmPa51VG3+YWKEx9H5Pcp3/wsuSeIdsxj1c=;
        b=bzSYq9i5pFiOmVI3mSq/ZqJh1zqYDTnLQ1Low54rW0DmHe8f5IQbNvyW+4ffE/2BNV
         7QCtusMsBzVXvrMz69mcsPGQmDTi6aOP0jYq7d1t5gW77qMYdhR6L78/hcoDXKHljCNL
         y34Kg1ijjHcKgbm2x4sqZZ23dvtCYOihCjVhTaaDD+v0KSYz0u59GEOBBWNiOiyXpspk
         GTrzfVS/Jg3pyOEsScUAUVfDWNTbPC2a3/GaWNOp7cGDgn70+ody1qq2BAR81epSsGnX
         4E2qJu7/FIe9fSHHAsUb5VwzTAi2SIGprSMs8OaJsRKB5qzmC3RW+/QB3sqOq9kLXm1b
         Kwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766936623; x=1767541423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9cEtP5oOmPa51VG3+YWKEx9H5Pcp3/wsuSeIdsxj1c=;
        b=fon7EdBo05EM4vedqIv/OnGihUkFYkR/Z5aiW/aw6eswwbXsViaMGa9NBykoyeGyhn
         VdtN0SWZeA8tQzzz//NlW3m4EnkzicmifTOBYtnvDxHDmQ49FPzUMeBPA9qWoC1DBgoa
         yNHtQ10ztMvh4EEQUyNfZHjuL9htY1GnH+Aerw0DdU+au13hT6cSvkEYj2zFKX43weeO
         NOcc3tLCBPXNciRTwimfKoSoI4RSJdegdwkMCrB/8MruFVk3a04+Q0nBiO0zSLv+kWn/
         Q9FRyiX32J0XUAiqCt78o79XAsQUV1+/BUX6Nl2aSElMcMTDBSMKQDieDSqIxJCjAvXC
         z3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1IpwaNKvVQbyvXNKCtNMmrivN4GyQvLU53it/MsJcDOilqZKvf12wt+Kxg/00izUayOpy78oOpIY3hMhm@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVHIgY3ubUs2obh54nsRtSTJwYmz9u5C63itDamsoL54kOyFd
	ybJgA/KristMBGFHjuDMWgDFsa2txDFicwkbgZALBCXo6Yju+AIx3pqFAf4uDuF3wNuNvYVRShs
	YlS4NDtuQAe3CH3gyX6PiLywe49nddrGAsj/M+Tssg6Pqyu9RQmlb3fOUpkCgHSf/kgzg
X-Gm-Gg: AY/fxX4gr2VTun0LdQoGpDgV0lpNFjtl4Fhs45oWIDnkZGVp5b51zBprr0Nu8rUj6/u
	R4Xd/lFYjp4bSiWlTo3eJxBMulPOTkJblDS2Jd4EKFrWlhyLSHDykOEGRSGD+a3EOZh6BJIrh2f
	ACGQrLjBctueCT5ESa80Az1JCrJYPJdY7vD5u7JJmt6qmrMpCOurou/oyU9FsITmFN2LWh5J0J6
	y6j2aM6+VgQ7L+XlSYefp05ZUkT8LFoj7otPbkNyu8oZyoTCu6xmuwggRyRjxbilQ9hDdHnzKrZ
	DUetOiHCN2rnjWKvXJ10cAwICadJBZ1itF8kiV2lgwZGdtpzrYj49NWSFNTEsBL55JY/xbpTBrI
	ZLd0x6X31oLQ0wwVvLyadungHWah3YEa/guptU/TmHNPmIDQhmyimztuomLoT+A9wrF6VZmYOWG
	tchGSHY+WmHUFyhKSzGQ01qDY=
X-Received: by 2002:a05:622a:5513:b0:4ec:e1aa:ba4a with SMTP id d75a77b69052e-4f4abcb5d8fmr414836651cf.1.1766936623463;
        Sun, 28 Dec 2025 07:43:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVZ5VQt286PXMgX0lEUrYwem4inmaK5zbVzwaXUNxtSMXNZNnKcu0Ua2Z/ye6HTmsIi6M+vw==
X-Received: by 2002:a05:622a:5513:b0:4ec:e1aa:ba4a with SMTP id d75a77b69052e-4f4abcb5d8fmr414836401cf.1.1766936623075;
        Sun, 28 Dec 2025 07:43:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd7d3sm8101964e87.27.2025.12.28.07.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:43:41 -0800 (PST)
Date: Sun, 28 Dec 2025 17:43:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Enable lt8713sx bridge with displayport for
 monaco-evk
Message-ID: <bz2vfahgqmkcw5d7eaeipq5nrtjpodfjup7frepbzazv5o2a6d@d6ysttt264rt>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69515030 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNfohRsh_S1gWZ89RWQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 0gu0b8hdW87bU2JSqwUn9c0lJ-Ba0msA
X-Proofpoint-GUID: 0gu0b8hdW87bU2JSqwUn9c0lJ-Ba0msA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE0MyBTYWx0ZWRfX++eYGn16Ri6w
 dV6lknX274aEP0UWmsOuv5Xb+wBS9ptG6XXwVBcm98BpKJ9gEkHRioqRco+VwUy/TBEvWrySSJf
 raaciOeQuCknpNrOSgVs81X+syYyNTpZYxpAZ/g+PWpCgbeHv9VFcktFHJWs9j4pErOfu5sgHqe
 i1ehQtob2yD68PaE3BEsi97jujeVhJ7erlPaluYIvKNEjSrJtffd/sVTfCAl3FQOQe6TG6q3ZmB
 CeoI/PrAmsOk758MSUdnc+uWg/3DtbrMs8qclpLbtIJJwKRZnieSgFt5NwWQxCtx0LQ1RBYcDHe
 d5r6xEUAYQ1CzK7iLrfmWzNsOVF4TWhjtn/49iiZ31M86ngrl24qByDPvAbc7uy8G6JC3M75pZC
 WFPHyTnMIwNrEGKrLz82UMM1xb6SYKqWk46Q3F8J/hNAgbbRb7Ds7VsfmvUYAQEGJs1f5skdroD
 ERHOHcduQNRV5aUU5ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280143

On Sun, Dec 28, 2025 at 07:10:37PM +0530, Vishnu Saini wrote:
> This series enables lt8713sx bridge and displayport on Qualcomm
> monaco-evk platform.

It can not be merged, the lt8713sx series isn't in yet (and you failed
to mention it here and include it into the b4 deps).

> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
> Changes in v3:
> - Used  existing qup_i2c0_data_clk as default i2c0 pinctrl and provided it's drive-strength, bias-pull-up.
> - Link to v2: https://lore.kernel.org/r/20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com
> 
> Changes in v2:
> - Configure DP PHY supplies and DP pinctrl
> - Configure in/out ports and connectors for lt8713sx bridge
> - Use correct base commit and fixed build issues 
> - Link to v1: https://lore.kernel.org/r/20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com
> 
> ---
> Vishnu Saini (2):
>       arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
>       arm64: defconfig: Enable Lontium LT8713sx driver
> 
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
>  arch/arm64/configs/defconfig            |  1 +
>  3 files changed, 96 insertions(+)
> ---
> base-commit: c2469dc74020684c2aed314701d999cc37c95717
> change-id: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
> 
> Best regards,
> -- 
> Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry


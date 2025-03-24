Return-Path: <linux-arm-msm+bounces-52306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77352A6D8B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 11:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6351166BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 10:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19F225DD02;
	Mon, 24 Mar 2025 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxAL2vnt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB325DAE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813808; cv=none; b=P0TGsVUUibMQ0KPMSm+zVwTFbmxP3gIIAxjkImV6TSgyrBgZjO0FEEfrbyVNBBbx364+oO7OZp5Xl597kXnuc3py+EaSB0mNFKL4R1zJwBSbze0FI8ovx5eG6gaqabRK0YqMRihf1nRpEjpcxl3rjgCwk+SRh7oWpqeIdzzKfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813808; c=relaxed/simple;
	bh=kPYx8cgyNK+kHSQtkC7ctNP4NXMxSAtiBwiPNiHZre4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkOg5ub+qRGFkbhczuKeEAP1uOdE4NYqIH1eb5FC6W4x1VjPhtpEApMQwXKlpBEVT9Cic/gUM/M2e4ust+wGyoTcqTxQgHtPB1rEJWn/VCjvVEgLkzq+TcRlY30/j40+hRYOG4PMO5siV1imGAVkLsHBabol5bCLQiA89U8znwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxAL2vnt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PMQq025925
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 10:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XDqyeQYxCMC6oQIBhg40FWZB
	5CKH/Iz5ri1KriEvBUk=; b=pxAL2vntZ2ENa/lRMqDeJIm5Ivg5QAmnxGSio22r
	5sOGbVMTzcqXFdhF512KImGQx03mXpemZRkiF+80QRdW1IEcRGhpBosjhyNbSOz6
	noIV2sKbm5pFbdJ8p4KeWXupsbn0LF7n8DZiTvJQzVybinFlL8RvrWsTH/8WhCNO
	tVXvQlyZTutDGpgwPhN9x08XHjWoUDI0PkyH4ghZGyNtTpBgu64VKw2cKnuQYC7Y
	Tchli7YC3VzAmZfTCyF3mFUHGWn2TX018/Y/EAVCDzSJBppZf7BUm83DrNfLtjxG
	3CGSzw1FwB39OZxiqKV2b1R8QpuRdbQrdoJmIbbENRpkyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnmaad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 10:56:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a3ff7e81so801715885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813804; x=1743418604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDqyeQYxCMC6oQIBhg40FWZB5CKH/Iz5ri1KriEvBUk=;
        b=n5fBF1xau3kQrnKIEpTlHhHFF2s1orHHhpJs4/Ak7FVNcw8RL+4Z/xznC8UH8TwOSb
         yc/4X1CU3BjPyZbChgCFg1U4luUSigiVAnV9T3DDI6PgZGu2BKOHtjIq2ddsOiwtujNU
         VoLu6zHGJxM6oxzS7txPW8v6n6OhAl6ZAyKvx4ma+N9x/Qo0NjUtHCqSYPDtvJW1vBau
         cZbrElsqsueZPfa13wbppo5mx/z8Urz2WZJ06bCYWHLrUdVb9ZViY9ZBcPkBQ9JeSrbM
         9rpXMSAftk5tHJCyQ5VVrLZSLRL1TrWrKq55Nlnm4JBbZ61ub3k+qYqdeSat+G8VVHsS
         OL2A==
X-Forwarded-Encrypted: i=1; AJvYcCUm8R6QBUgdOWHrlZ9Z9snoCr5TFe0CUwjqkXcWCD0v0TC2gRARnGlfdP3yBB6z5UWkAneh0H45EPVb3wpx@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWS21sbYJnGdK7t1w3rntHyhUVCXie3NCGw/RDJXAQg8cSLpx
	kl+bvmYJkZpL0bTByZ/RPbPLB4NFbaeQeDdnmj3YtVPnNtt7xK1l/1BNIgkFbDdQi+FCFBk9wrS
	MhXEIsDDjLEOP8VT12ZF83mHU3VOL/1+hdu8XKmq5FhME/gPGUJPgFkMP1Pbj+Mf2
X-Gm-Gg: ASbGnct1xVK20bPPgtQuZGAP6Oz6FrSiCVjqWWvVogKfd838iWk1CrAkpof517KXPA5
	CXuyKuxFr2OQjwsyGuZbVtolJ6SIIQji83ZlxWbZVc3xBfSRDFpQcgMsqbU4cBXTkj4P9Av4o0t
	Q/5D7a4oGJroVWpbrMF9pU7yrRN/O3tUA7Nfn+pupAGCp99HsPO0cTnE3LW2M8XqMeTf8LWtIHS
	5lachQzNKiHxY82x3aZh8H2BP5xNkyTwZ7oNOAIAf/RTslfHolEhKMhFL0pKCT5qnKz/ydmaJ3P
	3wf9YiDEKDfTspaLqsPLy9hYi4K2jvzj5cF3WxrYT3HGAzLA0JcsNAZh0bJXQ5nuxHOIric12ly
	NQL0=
X-Received: by 2002:a05:620a:269a:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7c5ba14428dmr1425654785a.14.1742813804458;
        Mon, 24 Mar 2025 03:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr0zZwwEN0C3pwdFAW2oW4ST3woWsczcIVhfpohhK/s4eaR0iSzFfgzBbIorwxbfn/58dsFA==
X-Received: by 2002:a05:620a:269a:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7c5ba14428dmr1425651885a.14.1742813804016;
        Mon, 24 Mar 2025 03:56:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad651243bsm1078937e87.249.2025.03.24.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:56:41 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:56:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
Message-ID: <2dt3oescrflodyud7mnnji5enj66slgte3cynrqp5bbmnie2vl@sjb2fv73xbnv>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e13a6d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1crZ-aHStTAuZ86CvOAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: dEqLq73cyzVcND6uEQ4Ng-ltmes20qL9
X-Proofpoint-GUID: dEqLq73cyzVcND6uEQ4Ng-ltmes20qL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=907 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240079

On Mon, Mar 24, 2025 at 09:41:04AM +0100, Luca Weiss wrote:
> Add a node for the videocc found on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-87558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B251CF5CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 23:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDDD7306F8ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 22:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337E02E7165;
	Mon,  5 Jan 2026 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBlxLcr1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8n4vSvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CBE1E885A
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767651532; cv=none; b=Zxl2mspXJIg5Mz1E9uQoZsRsIPYTeLf/0b9ebFBOivKc1lyL471PirhgHC5wMiI64pvZKiTchfmb0Z5OORHjO7yLgtrKKlNhy3VHzCny7sBSYAsw1yHcU6l0T3kpmaIQDlWg9V44YvvlScewucuLAZUxMMfq8qp83TA/iu01Rxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767651532; c=relaxed/simple;
	bh=bEZ9cI5llNSzNN28zJ2MfzuV8jvfc2OUCZHJd0CpY9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TR+kcwo/ON+P7qUjZswK8SYRQy32FAa7WevR8pXv8gaIIr1sAtLxqhyS7oq9YpBB+9DbDT6veCQkHcW68xGaMYzYqWQ/CUKYaToE/3/3EepKnj4wiNjBspaCFMDW6a+ko4gkAkcVityCzKalJhhDGBoWvHTZphQALR7jGiSgoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBlxLcr1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8n4vSvz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605H7hSl594030
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 22:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XN4TwQaswLLYsMuOTZ6APZhe
	pgd/dgKYvyTICrC6T2g=; b=TBlxLcr1/qB8q9u6+03RebdjPh6WFdsWq5I+fR3Z
	Na5vhkB8LIXJjZtA4CU7ILt7j+tHUleO/wNi/xJCwm5fdJY7OgdrGhat4syF4iAC
	MkygNJlHODSkEh8pvfagzKgZS+b7gux3EQblChvgUfQAwW1DWzcTZ+HE7uzZ3LT5
	/LyzE6KlM+reXrbRd0ZQouYjpZ3EiyQuPgv1BXRfFbqmRx8shsn51xDhPkV5zgTJ
	yp7l4SuTlOuG1aiG4CvYLe2scIdCAq2bAjLSxVetZEEqqSiBREbbQijw5eK9vJPq
	6knQRapTkz6COrdQmxysrO3s/EzxuaebQ9Zvhom8fv9WwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pj56t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 22:18:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso5658401cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767651529; x=1768256329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XN4TwQaswLLYsMuOTZ6APZhepgd/dgKYvyTICrC6T2g=;
        b=h8n4vSvzGAPOUQySQtIh4Y3O12dlbJyRnSWdR7oY6XKvlWCVrMnU56jlpMtdErgiAv
         KIjBhq0ygN1uPoS2+twkJ40GxTI06ToN11xgJQ6kQyIjXGg/YKz2wzESYAeZO8UdjfyU
         hPFJ5r4dLdUox7m4gqQGkphaySQBm/g/UI4DOt7hP32SRAPbYJ3WKzSKCVgGMAzR5tku
         AeW/b2OkSCVhZKR+bqs6+tgSQzN+wYQnXNWIoOF4uOW/uNHd9cb/hsYW2MOaO8/UvsHj
         iZUu1YNGhsiW0syf9n4GL+nlfJ0J2S/4F3CCTsa211V3HW5L8soiJqe1GdegYeCcLVKT
         vI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767651529; x=1768256329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN4TwQaswLLYsMuOTZ6APZhepgd/dgKYvyTICrC6T2g=;
        b=J0FMU7YIIs2TwfWXtZglNLAEsZ4F9dgSdeK9uXrGcjQgjq8cfSFnPPTbG1ZkmNUJDy
         qmpodEgYx0HqCqWhgYsYxh2Wk0x7Ry1+lvjFZpumfrIdEv3Mv9IKdSt20s5w5hB0vGBe
         0tQLbKAsjkeqJRQKhEd7DEIJvdiZJDWx6Hl/aCd+wMWkPS8kaUEIQfkzddc78o50OCdB
         UbPHFTh/dWOmv7pw2vELoczmbB17b6fcQbZmSyVhAguYDDGCS27NhmWytx+FxvsaheRO
         DT6N6G7w4qv4eaLhFBuTRZ0ArECvlvQX5Baa7YkoQ1hWxSZOZfxepGxTcbDm+h6qjaX4
         pckQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpDy4T9b1pKlZ35EMUQW8Vo9HOI3/MeAgvgGJ6ZU4y/MVVUGkSvCe4+CPM4OOzFtqDreIsK3RajW4wg3M2@vger.kernel.org
X-Gm-Message-State: AOJu0YxsS8DQdTSmBh7IT2nBCdlG7Sgur5+TB7tOYX73nsamCQEoUV27
	5FexW5EN7n3xyT9Ud0Ykeouhla2D0AzK+SpkMzeT/KQ8dk4i/6jXg235OHnEWQrttngNltyP8lA
	A0IUPmpMnw3/973nkhpVMMzHuKXDD3+wwQBYk2ZzNdHW77/0tousZM1tC/piK2SUQolp0
X-Gm-Gg: AY/fxX6cSqERlYZb8G0rBFyX389mM/x44n6k8Z4iumyveiLEcsC3GtSWA3GtZ03CKEs
	l2BzoPiIRAvsGbdxqe4TpdNjOia/tSRT5xmLlqr30LR9o+bXkZClXO+7G1RpHDLfzGfhx/gQBZh
	RdbAvEuf6sa2WBMK6yyYPjuQnP+WgJowtWDRP1HaLH3ye+4YO1FVG7jD8YRvJXAuDsTBB79bL6c
	2rukhL7Eu3fyCu7r+XptTISzoFeRTdxIOnHkoiKYgIFw3nYtdB/vn6Xf/9hBmCrRojSQRrNEex8
	FwkBuoqauN9WM6KrayWeqnjyIrHYcY5MQaAGAH301Q3L/Vp0gwZx567XDUgSU8sWFE/6tEYCRtW
	ouQ0TGf/SHlCNRYfQUdR5Wd/iCAv4ngXa7AuuhGo9CJTCD7mhN3XRV1qOd1ziK3KaSx+yrij9P9
	YNU2F4MQzbmoFE77jvGUihTdk=
X-Received: by 2002:ac8:5851:0:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4ffa76c9bddmr15046981cf.24.1767651528853;
        Mon, 05 Jan 2026 14:18:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcT+wUC+rIDoz6E2aqVqPDqbPn5zQVR9A915PiAIRuAbSOVCNgljAKSuMxZS39/mSpPo1/3Q==
X-Received: by 2002:ac8:5851:0:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4ffa76c9bddmr15046571cf.24.1767651528370;
        Mon, 05 Jan 2026 14:18:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea516sm109662e87.21.2026.01.05.14.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 14:18:46 -0800 (PST)
Date: Tue, 6 Jan 2026 00:18:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: Add TSENS and QUPv3
 serial engines
Message-ID: <ulu7nxd7t2p23yjvif7zs5kxo65ixozz53fcus4lnpd6aasbxu@jbgiz55ouuov>
References: <20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com>
 <20251225-knp-dts-misc-v2-2-a8a8a31fd528@oss.qualcomm.com>
 <fc67634b-d47e-452b-bbad-35884b75d0b7@oss.qualcomm.com>
 <175e9c72-bde2-4351-a429-7d88d255100c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175e9c72-bde2-4351-a429-7d88d255100c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE5NCBTYWx0ZWRfXyL/5P7sPzvkA
 AL4GVaRlRacMZt/l72HgjG98NZcV4utXL7tEA/7xH/wxM+UJyC/Zl83icuMOWD2XFT5mEZDXija
 W5sqmy5jnzMt783cZZtejHJJmMz5wot5gJCCLikWc0G3JQE/qQZHsOLc0r5Rb7eW6MsaYb426DB
 4n27v8mxLfFVlV16/jHukYbK3s9iVaVOwmLWsbbYQIG8TnsXIsDZ+1CcDWxgCWg2Pff1SFESndd
 v5FO0urFc0KWBPyWFD1Yy+ntiPlWbyB340lvs/tnyagFcQa71Lv8XDQAom8VmXcHTTocIjL7gDr
 Qx5KBamxqSCrgWyP+qbxQLceon1X0rlIvGSyMberhxi62luhQ4lknAetmI+aoBDSB8sDuKuW/IZ
 JvVLvlgjAFbnU6yu5sXx/oMqsChC2HLcd8GvpJMfl6Xc5LQkIToB9UiHE/3ugGgmISeR5CKNCNM
 HHpDf0SZNd8KoxH+udg==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695c38c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Nq1IhiKLlo-wdsJ7Eh0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: B7KJjf_YSq8As5wx98Lwvn6ZIGvdWMie
X-Proofpoint-GUID: B7KJjf_YSq8As5wx98Lwvn6ZIGvdWMie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050194

On Mon, Jan 05, 2026 at 04:24:19PM +0800, Aiqun(Maria) Yu wrote:
> On 12/29/2025 9:12 PM, Konrad Dybcio wrote:
> > On 12/26/25 4:06 AM, Jingyi Wang wrote:
> >> Add new features on the Kaanapali Platform including:
> >>
> >> - Temperature Sensor (TSENS) and thermal zones
> >> - QUPv3 serial engine protocols with 5 I2C hubs and 24 QUP serial engines
> >>   across 4 QUP wrappers, each with support of GPI DMA engines.
> >>
> >> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> > 
> > Since the base DT is now merged, all subsequent patches are
> > supposed to be patch-sized, i.e. usually scoped for one feature that
> > makes sense. This one happens to be an arbitrary concatenation of two
> > separate ones. Were they separate, the original authors would benefit
> > from the full attribution and they would be easier for us to review
> 
> Hi Konrad,
> 
> Are you suggesting to split this patch into 3 function independent
> patches here?

The main question is, why were three independent patches merged
together? Note, this differs from the initial submittion where there is
_one_ big change "add new platform / new device"

> The current dt series is to ease the maintainers' effort to have an
> organized patch in one series in below manner:
> 1. And the series of the dt change will only have all dependency cleared
> functionality in this series.
> 2. dt maintainer won't have any conflict when apply.
> 3. we will suggest developers can do it's own upload when basic
> dependencies like mm-clock and pmic dependencies are all applied.
> 
> Are you suggesting splitting this patch into three independent
> functional patches here?

No need to repeat the same twice.

-- 
With best wishes
Dmitry


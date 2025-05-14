Return-Path: <linux-arm-msm+bounces-58002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F89AB77C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E30D34A806D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DED8296174;
	Wed, 14 May 2025 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx5izDoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6229375D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257631; cv=none; b=aa6cMzcoWbAT5DyJ+VyXSPfRaeqHmvdCKAQHOMEf7a7sYqoUV9s631RMSzxHzCau3OOZBtbAYGAhTcnPCjzaTsbHZBHk2g1hMaL/qvP1eEHgi1wtvBmle2nJICVEPJYHkFWvUH/2RU5GDmMinNSGU3vmgdBTIT0TWgoo2p69Jas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257631; c=relaxed/simple;
	bh=dKXXkyeDnyVFW4grSfvrYpjBsDjCE6AcHIzvzvZQQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR+5xvl3nVCMbdzrXaX5XHL+FqBhvyS1ADY1wIwByJSGhJE5thTXSEoOtEuvTN4/c9NeNOuhzAQTUmcGsdPO3uSAlxUHNb3p+HklZzMfjHYP/Ot90OtkOEbQtk5ZUG9MUjMGAHqfld/EIVooHfQmiyLFZcDJVT8QiRxchNy+XzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx5izDoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKZVn4020250
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2GCgOGdrnZt0SFcUDKGI7c0L
	8gkL0wloGd+Wl/mh66E=; b=Vx5izDoF4V3qD8sPR1lVadXnS1mchmLGU8f32SnG
	F1tmTs/7Ka8nBbPLZ6//WKOeSXfGHkv8CofdC4zhwyRdLiBrXFX+TfkS0TPvbBtH
	TnV9U4/tkdV/cBeX3k/F2deSiK05S0YUgVb4zm/r4gcYutJEhYvYVkoTRA5zkdt3
	mLHcjJH9YwCUDE2N3GwJVzzQlGx4RGjFvzMeD+P4ARJbAllBChUCVadEj9bvGPVi
	Nz1OSRzvgkXCg4h2FxJhjPJHb1NYzG/+oY3x44v1ie6/kO0MOahIPRLvJ97yAYM1
	im8CkP39vj8hC+Rv/Kuy6wl0asyCyjgTNSdzN/saTvEFBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnm3sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:20:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a527so65608585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257627; x=1747862427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GCgOGdrnZt0SFcUDKGI7c0L8gkL0wloGd+Wl/mh66E=;
        b=PtDEpCXBy4qw1Pe+A+hxQUHQHJpc8hypRGOEJZAmPSjcrlbbP/4InOTmwJoWEaP3hn
         FOVcmtwNBQcrfAht8UFbMUgOexFp/f2dnqC9WD5taLA9TzUj5bwK9oOuexwF2V2mvt3i
         zdRawB/FKXKo2Ht6WTci08oK/ilvhAhOBzRspDkv8shL0d9JJWu0KjydUi/tuC4VdgLm
         Zf6T2tFz8TAYC8qAXxyT8b/v5UKGl+OSayv19BoIcY9OLnFRBdUBoNKynvEj9GoTb4ub
         IqelmP91qG4YsIqda0ZRjFIpL038Ku9GIjUQBSZxvHwoiTQnjWuSVaNCL30GEA3zw9hB
         9LaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0DoIdHuw6hR/DvHY1jGcQyxvJV3k8G9ryQDinLTEG0KmEGaklOOhXfWIxkxgUAc5i3x0Z6sqsMOI9YN00@vger.kernel.org
X-Gm-Message-State: AOJu0YwGj52Wu3y2jYbZF++vShWGDj83hxaw016x/626TSeWBvENel9n
	WRwx/7W9ldiQZGHuFivKm/zrZ9fKua6YNIRD+W68fdioWh+S6aVet2PNDXjsGq1QoDe8dhxBfk8
	UPHyq5jVx1biuJxokhj8b8pwIW1LjfOt4DlhLX5h9YLdrISgji5KTCt3Jq5PoSNcs
X-Gm-Gg: ASbGncuhTYKHDCzVKs49B67XszyFNl7h48GtT329+ltza+nmUYCmx7hPuOe65CwCXb1
	zO5HQW5nv1Elbs5GW8NjjJVCHm2i5aSsNJEdHEiEzJ87ulzIr8E1nCFZqHx/xL2XzAJjnE3hO0o
	JHIzAeELWIuMPiw8XWyAqqKKwTOpaop4b5rMEWqf16fEoghYM0jHOzcZ8z6Zi26s1dWAox0C+7D
	DWTdsjU9hWcvlK0rSIkymFdrNQIyA+6bkwYia+PqGdHfriPT2oVbV4HWSUdl5w+ijkbVXoeLOct
	ZISHVX58yA+1lpefFCY1IF9y55/Mff2cb025egJQdskkjtyWGOkQqXfHzN4AZjcZJE19WlpqRfg
	=
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr636197185a.10.1747257627404;
        Wed, 14 May 2025 14:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3q4xP/KFiqPpFuTzMa6gUHpPuBPwILvvqRM11pnp2aen1rdHKlrCCS3ZIbWjmOhuvvWpyUA==
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr636192585a.10.1747257626942;
        Wed, 14 May 2025 14:20:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c321f2d7sm21110781fa.0.2025.05.14.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:20:26 -0700 (PDT)
Date: Thu, 15 May 2025 00:20:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 04/18] clk: qcom: clk-alpha-pll: Add support for
 common PLL configuration function
Message-ID: <s7ekugpsfdzxvz4wm7axshrvjudpsjgh7dlceyqtqtts5kmwba@q2rgggezzf4l>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: 9xEfmbjwQ6S-ODYfqclnKzLZWKk3CXnk
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6825091c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mbcL5m-RS8wsDEqdrk8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9xEfmbjwQ6S-ODYfqclnKzLZWKk3CXnk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NyBTYWx0ZWRfX7wkJ6vUpzjDX
 KMTPSYpVK6PvbDTPFsIq9PK1xI4JHvJe64MYevUnvHqhln+4oakNZSSAUKY+aKy27IQCBfwGkFh
 vognUV8F+WeufAWYMHnJe2qBveo0un7D1l8jTaghFrYol4s+fm7I3ny/0SiJ9AFHZMM/Xjx84l1
 uO6oV9iE4K0cqVG6ScDP0hsg10jWlXVYUiFFkD1nd7b1oo8ga/DLvWNn7QHBUxqgXCZ5qAvPPpL
 rauaglMFIe+IB7IoUIxFDOefbYpVYcJfFSsXfQO8u77vHbhf1zXTTWqITDy607KGsEFGDbSJnrQ
 Rtnt8qRqbr+DyT+1SyG1mrrJBI8rHFg6dPM+QdQ8usimYL3+sDxX2fLYDaCTH3DRH81+kbHXbox
 /PVatEeI0S6cBmP9cqiVdxgNJDShVCvP16TB4GeBhdJNUuA9kk5kcvAVMgrCZJxZA8Yk1Jgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140197

On Thu, May 15, 2025 at 12:38:49AM +0530, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> To properly configure the PLLs on recent chipsets, it often requires more
> than one power domain to be kept ON. The support to enable multiple power
> domains is being added in qcom_cc_really_probe() and PLLs should be
> configured post all the required power domains are enabled.
> 
> Hence integrate PLL configuration into clk_alpha_pll structure and add
> support for qcom_clk_alpha_pll_configure() function which can be called
> from qcom_cc_really_probe() to configure the clock controller PLLs after
> all required power domains are enabled.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-87159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE2CED482
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 19:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09647300095E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 18:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A1E2ED853;
	Thu,  1 Jan 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+cTZFiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7wwRpGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709442E542A
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293952; cv=none; b=FVLsC3rMx2WLH9MhDrY7/uLJF/ADpB2j0b42a1KaDhqjIOjZg4KcMNeRBU2YA/Yk7O5H6F4l1yIYVC7L285gMIhRPuB8hhVCBYuK72GUWzBlpHDcPHweWA955PmwInl8MGTO16B3UM2LHrRn9mM7speEGFKIzAY8fk6t8gLL/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293952; c=relaxed/simple;
	bh=SY1mfUzR0kljOI4AnzSXIwwOJodmSB+8pf9K4FEZRbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVPV4LVNq93RSgZGJ2NxuykakPkYK/N1uOnYKZLOACPc9EP5FJiMaQtOkcM/HenKPNfF+btEATBC/CmIOrezo6c6lavM8pRNQtjlUtY7R6IawmYuOM9SzS6S3TqjJas17lMz0mSfy7L4/ZDz7ueceWhDJztD8fnTObD5OB2c86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+cTZFiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7wwRpGZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6017jO141960516
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JkglM1+aOC2hqCIcySYqY8Wi
	aGjCaJ47xGM883ImLcc=; b=G+cTZFiuin4orzyYsozWq4Zfz1RMh/g6OUtpO+T+
	AouAjBtYvOyz7ClwMxqnYxhQNLTgUDUuj+dW+QWU0y/+sZ/byy9xhwXlSgE9MthG
	DtG577SxXMyCHJ1RN4MOPatfLmEsfpGO1Lm+Z+/SK2Nwd3NCcsRD0vDzqnWyOTJv
	xBaMRS82MCrS+lwjraP9UdKw4gmX844qGICaMCBTfAwFYUyrTSUYlxpfEIWIUn+3
	65AcgcBNwVowyyXaL5fkjqCclVUj74qByLU4jM8w7hrZWhCBJ2zyFiroy+XG+5or
	mz3y+SdocXdY6D+Nyfr2vKxmoeHiE4AuQb6l/9xf5InDzA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8531u7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 18:59:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88883a2cabbso434150166d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293949; x=1767898749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkglM1+aOC2hqCIcySYqY8WiaGjCaJ47xGM883ImLcc=;
        b=A7wwRpGZgmc9O6odA4TWHPiBz20baAdKoEEdehiPuSu9iwsfJbQJ5oc8L3CllfGYE9
         5SmF1msIuQEaWDUxUokoTRSl1MAxMD68dpodDUWIeGc0KSSlkc+7fZ9OkpMLLWzaHoCH
         ER45dp6svs7RhzSzD0RXPhWdHg09QfYQ+u71i7awPMhbsMEWo5oaIbgQS3JfJCqXZD+6
         vI6NA2qgWm58GrEcK2JVy6C6sm5fbDc6NuFxrBYAG4cheZAuCDHJR1kDnZiuZIZEaK4t
         EojhMM4Vr7dqhG86K5f//ACgs7FrBfGnYyEv//xl9pnfyOHxnGZz5eEVfHni7qhiLsZz
         A1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293949; x=1767898749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkglM1+aOC2hqCIcySYqY8WiaGjCaJ47xGM883ImLcc=;
        b=KHyKoQN9GX8/xFgOF3FUXe2qeAWBwn+hxUNCvBWDEmoySHnShqNvdRiZLdPK5941jp
         6XFnOA4LPEUMzuXTin/y0yWXHwzaOPk2y3AjlSDQM2FOX4V1W8PJipXsNJtKSPfquqWv
         z5Xy+tX/sqyspuJx0+1jq9dII0kN20lHdIamwnxyUyXS+zl2QkPFLoeHeAabVZAs8Cnz
         TVM0tjRypU2sTst0LpSWgahktMlJZ84LrNSJdFHEpCvT6ZVdE/95ekMI5j6/nH0rYdH+
         gC5O4ov9OYXvsvJgu9V01aXf/8cDHG6hcoYdoC8yqDD2DrN0yOdHhxVOTOPIHSKxXraA
         aGDw==
X-Forwarded-Encrypted: i=1; AJvYcCW97ro735T1eoI3/EO6ln2Q9Ne3mwcBRZR3mxXvGjjUw6JZQG9RGR2axx/AhTynM84sG6qpR3hHWGzZf7fu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPtelC5S7v/wQHecmdr1uVPV8eXh93+9v2vWZr7Gt78KNyPYP
	QSXfB6zOueeWeDJzcgdROx1oUPb/n3hAH2yyyOXIdOZ7Sn2mS3URFiTyqnkz7ML0gwDbf4RVavm
	W8GwNLPUZIt0u2JhBMss4mfgORcBUH6DRjGuzmHRcmTUhA9/6xCPFHXT1ohcv0WFT6WEQ
X-Gm-Gg: AY/fxX5M0afQl1S3VPMbXJU7JKnFi6NXQwhaSk5fFPcLRhr9lOTGB1M2L9Nchdk2A24
	BziVPK9VHGrPpNmXuuhzrpP4e6nFCZa1H+G3YIYPutilJ1tIGme0mb5RBt66PXxWyUWzYoJ01rY
	2KQZ5g4zKa64uAmU2ZsrXhjF0E/VINFcMtSIkkUD1zXxkWtEO3Ir/NY3eo41s4Oh/ucc6+cJuLH
	8h9erehC3mMdavVvQvn+AmBJd5HJiktU1U5FH/TfJtOViV7oNusf0PHEhBUzynXRde6h3DK2VMS
	MKdvEdH3hUc7Kr+PoTAVtajubDYy2aAqwwP+UBwBCOH4tWx1x0XD6gAWPe0gVGlGZbucwSNe1mu
	MDott2x2u/V6Dq5Sf0zf1
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr659645421cf.53.1767293949633;
        Thu, 01 Jan 2026 10:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE20WFgF6uiFUXY205JRdsUZUbKjo+NyqH9+Jcy+puXiXLb/gwLgViiHqrINvWZdNeL1A1ivQ==
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr659645081cf.53.1767293949084;
        Thu, 01 Jan 2026 10:59:09 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f7bsm4245998066b.18.2026.01.01.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:59:08 -0800 (PST)
Date: Thu, 1 Jan 2026 20:59:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
Message-ID: <eauy24wd6kyd4rm3b3gjngbkwksvqjmaxg2tufqagvulkvbqgo@x3x5osjcezly>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: z3VozMkUkEiLfJuQlAEz2wCZWyFLzkXY
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6956c3fe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: z3VozMkUkEiLfJuQlAEz2wCZWyFLzkXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX3j4enx3BHGKT
 yJ65PoXgXwR6xFymuI7lxzOb0OV+8pX2VeIr8INwzQTTN49g4f8Ne+I3ne9I/bwNtpgV+ktDjvW
 w/ragg3f3bU7cwZjcV7YhhxwCX1DUTWaBBRToYpab5t43gSU7juj487mJ3/sJPn8XUiCHgoG8nN
 2JuON64OoqbrzlgSJQpi5ntg2pqVJVK3M+ThVmH0YtecqzBveyVRh1iw/KgPfbeZbZwVS0gvGrk
 ouwLUdtxTkJucV4wQXnD3AAX3KARiuQaPPvxPcpaZ8zJqvxAtN1RfZu/5oetnR5eVAptRbCxn41
 2YSRiglwZbua1wpPynnt3+Yu8od+xeIgRKXdE4RDHLCEfRpYZhNtC1e43pEuWV+7WJAcsEEWKTr
 LHELVDd13nfndkIPIp5ZXO9y1Cevq3u8Dq1kMR0jI1vD4OahGjiilGA/y5WzqPz3LTr4tbURxB9
 8DBfd//SkJheY14MYhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010172

On 25-12-24 12:22:59, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


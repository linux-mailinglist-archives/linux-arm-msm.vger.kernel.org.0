Return-Path: <linux-arm-msm+bounces-87158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7F4CED479
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 19:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63AEC300423F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 18:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED812ED853;
	Thu,  1 Jan 2026 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5zFDOko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFyCQPJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA03224891
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293904; cv=none; b=AAXRspHb5aL8lWhHH+lXRpG2SqvPAzr5vA3KIiZZmRtECIJrHUIAK1EIMgkJr/OCvlCgdjGyfLtiatW5tqQQMIyLfkK0R33B/iyQbx8edzBqussSMELXfmO8YKLM/NxKnTqipGaLwAICfDSKKm+7QK1RZIkxBm1r9tmMWMzvC/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293904; c=relaxed/simple;
	bh=xGYY8pAd1/La7BQ0Al/8JnTwDy9NU7Pu8FhVHSk2N5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv6+JEX0IfG0JPwohUDbV3L9a6bX9RfxrmvDAY93JoaZ6SeViHibuDGGa9LHXO7rWHEOSK6ADH4/SLJnqxdE3fgy9sBYYsCuPIWGkh2hyceq8vzPgXQmkFVUeXaufNWqNdecoSHrFEjQfLG8/o9q7Acn1r45MyNojgP43EaJobU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5zFDOko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFyCQPJ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6015GKfJ1672765
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 18:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+kTzgKoY0Dwz7vj+LASxcFM
	fom6Hwg6dqD1vHeEEMc=; b=A5zFDOkoToOFvysK92La4leHoU4+v8uKymJdwNzA
	Py1Lw+snnHL712MYeCkhCZG6UE3QIbCd4UO0VJh9KLDd3U+7YbLso1Jkvtf+JA9g
	pllWTVyEnHk5jeuXt9AFJUHmeOK6poMUq6MyZtIehwjRTQn9Nz8ThnqEZqJ5wN26
	eG3UzzSSiCBI97wUDSjWPboKe17lzLDmwJuxwlAOewMTt5rFDy65XT16DvQwoeQS
	qIse5gJtHN6hkoDifISLnwJC7tBZkyv9uiDyhAWG4S22Rcb6GwBptKt2j2FyoZGe
	5xzDX0WpXmTLMJ5lJdEANWUvtkKAOr2zR1cAjQ7I5vO9ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8531u6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 18:58:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso455319751cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 10:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293902; x=1767898702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+kTzgKoY0Dwz7vj+LASxcFMfom6Hwg6dqD1vHeEEMc=;
        b=AFyCQPJ4g3oFSAAQHllNW20BEMffvHJw60S7G2tTPgQicfoDrfSaXwMjTAa032XUw9
         p52jE8bKzwsQ4mKpe/CfxvplzAVBmw3iJOnXc3aKCDFaPZN7rol06EqkNfQwatlt0NUb
         qp7BHss5gKVXn2frScs5TQIWWlPfmNU73f9HqNaSo/YlxjWlG9WT87wSZ7Ryr59ytC81
         qzYWrWaH8qZkKxFp3WOhZPFPwPxjiggF3KMrXkajjItPk9VKyaQTsw3BNuCLFEYEAWFE
         EqzGg9qJfCm/ilLTy1E03VU0WZyS+5ox4e/GqbB+/g/rpX76iK3VlWABWDdwy6OwGzqo
         JDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293902; x=1767898702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+kTzgKoY0Dwz7vj+LASxcFMfom6Hwg6dqD1vHeEEMc=;
        b=LwBGthIkPMff6hLzEsHIEhTH3VFOmhPvt7bCVevMc2/zez3KyeQ7nH0eZLdHagVVyf
         ioQ21XrXsG1pLqqfw8kPUV+nos3q660k2nP6xbOQn/GnHJtKiyP6dKnhy4qca5k5HC4Y
         j3R+GIYBDH8JGBr8USm91pHiGklr8DEgmFl15Q3InJa+atI3Vsx46/sNB2bcPYKnToYs
         aU9GgtMX8llsBCagWj3pUEIGTCWnyq6zbiS0NvmEuMq89N8a5sjs5F4i+N1O3Fuv9v+g
         WMcAMjvABRcMiJfBxrodOwmIvtROjbqV+FrIeV0RDfpjTJnUwkvdUUkHi1xvDhrucF2e
         Ip1w==
X-Forwarded-Encrypted: i=1; AJvYcCXYjhNUO2rftTjYjanM4p3OX0l8Ac6jEg+CuOoO1PB4guIIplaaSs/mukAXDOnKkeVy39OAJg6PATRQZoSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb9wdmf8RWGySx+/5XFDwCtO//jzO0ZmgZUWCO0CZGH7Qu8HuL
	ryrzLK4DQKrBtjxXsirb2aztHTcvepR9G+nu7WYCmy3sVoJLb+aTT8fOEsoQ+8sRr/4WV0oPIzV
	GzWgrbbjF2Ecx9iWc7D7V26Es9yMjulSnc0MGBC+Jw0DyhnTrtMyy0wHwVFDZS6j9bcfD
X-Gm-Gg: AY/fxX7uA9zXa60AHfpbuEVJ5OeaGQ7gsHHUiStlh4EMv+XBSPvlcReUNde9NmPd09c
	1Loz8YYQXJc68Z05PsMUkxhY5rIDLWDyuGt0iguXD54EVfmsLt4ffs+atYMIsgGT5BUKMHDq0JV
	c/T7+9KOv3G/bEfn1ebpCzdCQDNEcjZiJdk32klshcS/oKoEXhVB0OFSKpo/WQrRzntcdgE8WKR
	iKTpIAq/HkZllKLlOvy+7/csaLpSUuxWCQiIJ+8WJmYFMRpFGbKHeebD4sGyNWjQWI+SN8SsBxO
	gvZUu5by4PWYvdtxdcektR5gUuSRYwGg+Rvjq6IT0Z//M9BOoSejhHosM+lnsHKmcZi3zzdzm1S
	0cxdlHtXMyvULtrtchcS+
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr592306891cf.36.1767293901699;
        Thu, 01 Jan 2026 10:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlz/3vyvIYgIOkkFPFLj7xzq2/9y9854ildt7H76Yqx9WzlGppgjuV1tmNsy8jExhZ7JrgVw==
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr592306511cf.36.1767293901243;
        Thu, 01 Jan 2026 10:58:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327791d2f3sm47967829f8f.11.2026.01.01.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:58:20 -0800 (PST)
Date: Thu, 1 Jan 2026 20:58:17 +0200
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
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <z3auxq6sv4vks5ecchmgajatr3gclghvozl4wxrty27zihmpyx@kjl4bi7oyla4>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: x7fNpsIxKwWDEcdtZveaZYMS3p7JveQ4
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6956c3ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: x7fNpsIxKwWDEcdtZveaZYMS3p7JveQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX/pbsSQDgRN1T
 RnthVsYrw19iIhrARHuNK3kDUAkKtA3vx508FsvZRQztEdwhwdAMjk4hKXfeDFrcQdZoIh+Whv9
 KLshcV9u6RUm3deKz3ZF921o0uQby5p7aHAaY6EHjdEOI9JvRqsFiAq0NQwvFwvR4C+w2oiYqv7
 /47xpccn/8eBY9Vn8/LzobV776YFZ2yWH6Zwd3qdlGDzoV1suQCMVC4gW+mbfMasm7Ymgs3kevt
 7Mszur/gxzc5s6nIidOtPye8Uj7J1j4dhQ1FWYgFAFNUTNFi+1ZxWBDMkP9ghsEq+X+M/uSXrGp
 CmKfewpAHjBjFBstABqwldDwdaAVa8pBykbthQKbP+wPFJJhFMqBIh4+xeAtTtzB+VmRHHfP+eC
 52N/ybs9bvet9MMn869fZMC2dDJeLkFAAPKHZK7DL2mo2e6zj/sLHcCzdtdYuik6vgDaIQmivKS
 adKmSIEdQ+QZPLJYbMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010172

On 25-12-24 12:22:58, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


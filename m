Return-Path: <linux-arm-msm+bounces-82259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953FC68EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9B68365CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368FF3191C2;
	Tue, 18 Nov 2025 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n85jVYcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vc6l+VrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29BB2EACEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463199; cv=none; b=dmiuv8SsQ/2DRakXl7vN460qXmTDXZp9Cvh9hQnApDaGaNl5t7bncG55k1V0Wy1iTSo0PCFKJ550uqYMb2v/qmytsZnoFX/mcXZR1HXs3XNFGiURUCgBvBeYdumH5YR39FISeUxE4YoyxxpOW31luyZqIP1q0HdQyyBuLOzCqCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463199; c=relaxed/simple;
	bh=Je+uFR/gKcyEuTvfBH3qS0r6UZEWmtchEn4qD6chTo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2RePbBdzsyvL7HjlYkvQ4EQELfOpr9jknXpjz4wp48Ftl5LZmq2c0CimEK48hoD+Ptpj/iwBHSnyO86v7ZLOSO0I/bJjKfkNnCK3d+RGzlRKlp4L0T55v3wcQcQUizPh+t0c8fu7ghwpOY3rPBnrMelebA7tsSU19j3yvaI11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n85jVYcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vc6l+VrE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6dCWW384945
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOEpZdLwr23M5PcSgMSAlSqAB08Ao7RTKoVOZt6jIUw=; b=n85jVYcWd3bjuvGN
	+yUTyiO/HBV5tP3sXXa4QKWGsuuB9fDNEiH0fPpG5r8fFwPY+2CdwklNLw2wGb9k
	NFwMrSb8ypmv5ABE96j2XocHFtfadhiTLIjhRDsujTFw1UB7g5dknCvrP60aIFAb
	tKqgOOo84t0J6KwLGOLV2FXJr/HukPfIdr8FOOocAAJ+EjrywD7gctRi7zuYuCUf
	ul1hFSyKRuBqMW+4pV9kGvnaeSsfiqrEyoIYFdv6lqt6GsNthFn4g3XheT29Wvkw
	CkNKUx4pG94TGI9o0Mrlj/56nOTLT5X/ry8ep51yWpGeiGiwvPK+twrWBqpPwhfY
	yYzsEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8j6nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:53:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982b47ce35so62045085ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463196; x=1764067996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOEpZdLwr23M5PcSgMSAlSqAB08Ao7RTKoVOZt6jIUw=;
        b=Vc6l+VrEfHfTmXZNRrsxVmp4BlAJNfYsvRrDu508KcHa4GD6u8Zo/LezH2DUUMGhay
         w/dI+PKm2I5ZKOG9vvDicE61nUOEPciT5e3VSCs1aMIpcZafUFC9wr5+rGUsV5IoOkdf
         FOFVhAONMEusm+Ibac5CNw3f8una02t9J4eZD5RAWLmsi0q9yVJ2nwxiOzYv8+0wRUyB
         QdaycsNe6wu6M5mxArWV3LYufNJt5W9zPNi6clSvOkl1SFwwNyufeKy485gihH/HE9CC
         NoNM8t+aylL+eiC3YWIenCf/p8xoe7RyQPPsNM6U5+ZMlm4Vs9/woioDxwg0geUMbL8W
         697w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463196; x=1764067996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOEpZdLwr23M5PcSgMSAlSqAB08Ao7RTKoVOZt6jIUw=;
        b=ZRSlURGU/S1NjTHTf/BS8NeM37USBfqq5ER8HvdgakTVEOVj4NyoHDEaiYo2pT/m2b
         LChUvSeq75zQMD7wNseXQ/X83yfRwY8RYpkRL1u0PzqbkeR/Hx4yaSXXau7YRbL1y2Wb
         fTq6zbFjniYPIvcKb+8xDxaWqVsPeFjqDM6lDcMQssetXN9J7ID2d1kpxKK1EvYgA2Yw
         HBYhPxNDmulMnXcCGzSiNvL2O/aYq4b9jdgwdmH7plTRqQ1vsqGrDQ9yXRjD3mbmFPi8
         b/D3KubX2dmU+GbxNh16UCa40qVJF7T5QYT6a3IQKXppZ6ub+/aaMXQEfU+3trdDpEQ2
         ps3g==
X-Gm-Message-State: AOJu0YxilBpLvBULAQy/Y6MqHMth5Nrd+ByblO/95qW00RjWEARKUyZK
	32hGLAnwBYtqo1aoxjh4CU7/PoN6I3k+pLBHO1E4IcyApoKj8rRLO/jUGPCpEI1kJc2fTqI7cSZ
	sp0J+IJ9Xv6parocp/7qkbjB0udARICKvHvxPnL5rTga14WkNTFnHQR6PuC0WNeKmlW6s
X-Gm-Gg: ASbGncuq5VpZjFGNO7tJ2BZOlAjND3Izm4b5LZmvUEO1JnYuAtaRop2nId0oMnG6rPL
	VF2tGRu/tqHdCoE9j1BB7yMYJ0ze4REx8kF8UqIoXxmT8GS+Jclrm1h4lzpBAiHe06fKrQWh5x/
	wKXbJMWtkE9idl5e1XYX5g2xfDrgi6F46jIPpI5PgxP7t+/5O0+jP7iPealts7EHrIGtNlxLi/3
	8skKdLp6p7FQFXD1Lnq+CijAapDeh6GLYNHQvdF6PrlOYHEE2kqIAVX3ULzUH9Ptpbv+kezMixK
	Zy1cS0B/lAyr78cBTbHdlMj72IYqQG9CxAOaHFIolaXeBGkJJ17eUiXCtCec09gKmLO/AIIXRj/
	tdzs9JeCpzj4skDrXfZCSTff0tA==
X-Received: by 2002:a17:903:2350:b0:298:616b:b2d with SMTP id d9443c01a7336-2986a75275fmr169692185ad.51.1763463196421;
        Tue, 18 Nov 2025 02:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcvWmssKapPjaiv/k1PWZMgAUITJJJRwptMhWR/dTJczZEwt0nlVri40LH/mEvb1TLwTCuFg==
X-Received: by 2002:a17:903:2350:b0:298:616b:b2d with SMTP id d9443c01a7336-2986a75275fmr169691865ad.51.1763463195961;
        Tue, 18 Nov 2025 02:53:15 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d91sm171022975ad.63.2025.11.18.02.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:53:15 -0800 (PST)
Message-ID: <430d8ec2-9dc0-4bca-9f8b-294d273af302@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:23:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XGT1H-Kd3iVvcPrvjoA9kR-OcHVzqVYh
X-Proofpoint-ORIG-GUID: XGT1H-Kd3iVvcPrvjoA9kR-OcHVzqVYh
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c501d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NiBTYWx0ZWRfX1kGlr5Aeb95k
 jAHTflVsUyyAIpbXhxuN62SU5oeh5RbiewsT3d609jdNxU1+aSXqiUOwOCBFzd7HgLGzSNlpVQh
 xNr48YCLGTTFkbuWGijf0hcoQN+MSrpCdXia0SWRdLbwuzC/p7ClQ2FkfkfF6DC1Gt8vkHlgsNK
 ldbOzJJV13gYFZEfFONgB1x2O6/ZGZ6/E5gCJJooWt8glYNExTVFCRdrpGmI7b6OMcra0WvBBnK
 gbGApYu1iCtJ8PiEPsppJ343heI/MgfW7yow8PKO/PQAKFU0pTkEDyZAF8tnz/3aoWsCQTsAJDp
 TvgjvRqpaLv2L0uqStwjbWhn+e3bfhwR5qygsmzNUMm6r7SGfFgDJVVCCekEmbIqWME1pP8jwBl
 wjhGiwcqGzU0bzSkse3hjsuB6XzM2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180086



On 11/18/2025 12:47 PM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on SM8750 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |  11 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sm8750.c | 463 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 475 insertions(+)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran


Return-Path: <linux-arm-msm+bounces-78398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E102BFD909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3841899C78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19DD28EA72;
	Wed, 22 Oct 2025 17:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtNdCy5Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E928CF4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153970; cv=none; b=eXmjjRC7PW5Lp6EQ4jf7vJ0zpY63xWx3P28dZedbsJZ+PfW5z0LcPT38RuOBcWbsddx3QSqMZ2ou8oNvxvCsO76l2QIw13CYxluI8KOm5AVPzj+T50roOcQ5mKw/wBgaw+dRSUh2hVhvtm5ZymGi55dTwDc+/J2sybwIdrbQrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153970; c=relaxed/simple;
	bh=USW+PUWWPpnrRXcF74DhE4ODa37KlmuAIX8ScNeYsds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mD/OtQHYqOqhau3iPTyt2fihrp848sAuZ3SnEbP1sBeqAToGJGvJ7yaAdnXcoAr3X8viH5S75EmKhwbA9cz+bffidjmTflAtlmrUXmwoobcveVuUXdt0jWowKCzhmZw7Zs+4d8e8TVmXc5kiuH1H4yBcqyNoP51C2SoqMQBxltE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtNdCy5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAJ5iL004435
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NesJS3g8+KTZBTXGgRuCmgbeZX+rTJmB87NGF5qGsA0=; b=PtNdCy5YyxueVtiU
	g19o95P5Ze7mU5ASc30ap85Mn3fYxQ6VY3TJYb//4GcxAHI3g2PaRjfHCCAV2wnp
	qJJdz1XHO9jk31zl7+LQdy1QlCdzDV2kN2I3MUIFIyMIqfTo29QzgmYyjGwbdB+P
	vJHc7XU/9Ramnc4gsJDGuvaBi2+tE4XznWPo0p5QoG9KqItm1+s3TzdjVudcBSyj
	61/uS+DwPV3TOK5KWc8AYujvORdYaV5A9xWkWvFqbvCc5Bd8+DzJNjmtfgbNSc/t
	bV/RaLXMTSRyfuMWUZLMEuxQjqSLpUu7Jd0cpb9E0ALS9BTvcHPokepcU9g4IXN8
	cLrCRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfngfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:26:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8aab76050so5085851cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153967; x=1761758767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NesJS3g8+KTZBTXGgRuCmgbeZX+rTJmB87NGF5qGsA0=;
        b=Cq4VkIMGhhHaw+mT5UrfDTtb5E5iQEd59jIi2MyiFwzruGnHcolK99gVXkU11TkXFB
         E9Vsm1/i4tHOz2tdGVB83GXrjBZy7Z/NURmCZheS+znpjDUCIgCNEGtGzHJiq3zplhJq
         GfI4nj5Kt6FEOqSHOtyM4v7B+uoOC55Q21qL238UvaihmXmtskwawJSU9JIQ7mbJPWzr
         09Bjt3JtF1w+qHAFWjv5Owc0Gj+9HyrIHmzDR6vsJoc4BnqNDPp2G20V80HnDV/VaBXO
         dhdfcKBrbKmjTZdMxKUVSIwuggqqZax3soq0Bz5fZ7BlJ8Y9H5h5zd679+gxo/5XUoVF
         000A==
X-Gm-Message-State: AOJu0YzDDp44AdTVdgxszieAMoQMdMprtG+4eorDAWD8z8UaCuZnV84e
	aige1e02A++oWnfuvMqhV32HyoPVIG5dvzHPb3KFg5gXuQaQDMOVP2f//n3Fgi9bsCOK+/vnrSS
	8GrDsT6PC5ddJ+knVUs+gRAIt32X66Vcj8nKnYUC7lGPEmyTTubKdPafCPf0AFYmCdmdH
X-Gm-Gg: ASbGnctW3UbkzPhWwVoYQ7ChYQzeskt8/m3+u9pL4Fyn/D8DDGXRIWHUO/pJZiHciWl
	27uvo7z6mcVoq157mxRoE1Bvd1eSzN8tjw4q9KDtAmjRrozdswnUe5tC+Iyp7060vcpgzfF/suk
	auxhe3LzWFJAJZm/0Hhn9RVAoEZnDMU3+vxlzUfNHp2e7j1Kh/WQyNJ9gRPLEJypSB+Dx+Qp1o7
	RhFrVGKBsiZTcXcsunSD8kXHwHf42QqvQBOk8w3eUF9uc02VO36jyrtVbIqH28wpsvqkk9Y2vRX
	50H9xoYPTORpGkp/J0quLW/lRGw8CZb/oFbAuCRFZ6QGo0wEeSnMKJEo3FeFjJ9aErmJnKuw2aU
	xL0Kdr8A0SqckZc0cfZSFJpOGO5yt4VB3hSZHUhmWMkGOA5zER+r5iVUt
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr66574421cf.4.1761153966923;
        Wed, 22 Oct 2025 10:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWoCkyY3maLQwitXsvWuOEnhkY5EIFfN6+Mfenw5bYCU9mWOjKc4pp1kd5IZv8Mh44tk6mWw==
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr66574071cf.4.1761153966339;
        Wed, 22 Oct 2025 10:26:06 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da1a55sm1415503866b.8.2025.10.22.10.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:26:05 -0700 (PDT)
Message-ID: <9145c0f7-c82c-4b33-b421-a0af24accb39@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:26:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1oP_k9UhBZu6K7eSSaJE2BpbCzraTv38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXzyZlw3QEPVhN
 7sU3FwzWgeIgG3bsoXj8H+Jo2i/gbJSYfSQO5TQrzc20s7OZqRGji9vY66uK1b9vvrsB/ph1rnI
 GDXLQUD785vOEreW8mtgN4DVUy77qf7jMGsyX5BJnpuHsiWquYURog/Bk26ouOm0vntQhpb7gdr
 Q+1styCKuftwMpLGulskypAC5AQc1qCgIh8nSA69mTvBUCxot63lIr3GUMd/u2LEGL8huIa8VlD
 A0VU0LnwJp+fnQOIMW0qFFyFoPC4aueSir7VS6XYO4IDNOsOX51WvVZtiXr9GBVqTt2d+eIo2hh
 BVuvrueLpT/6JFDplx7/yH5maqvMZhLoqETYkzGzAybgw18mEpiyFfOYBuRcvF821RPq2aTDCIb
 M69hiE0mjPbxxLG3sRRdz+ytaMjBcw==
X-Proofpoint-GUID: 1oP_k9UhBZu6K7eSSaJE2BpbCzraTv38
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f913b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CPx4A68E0eaEKLl928sA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/17/25 4:16 PM, Vikash Garodia wrote:
> Qualcomm kaanapali platform have a newer generation of video IP, iris4 
> or vpu4. The hardware have evolved mostly w.r.t higher number of power 
> domains as well as multiple clock sources. It has support for new 
> codec(apv), when compared to prior generation.
> 
> The series describes the binding interfaces of the hardware, buffer 
> calculation and power sequence for vpu4, and add the platform data at 
> the end.
> 
> Please review and share your comments.
> 
> Following are the compliance and functional validation reports
> 
> v4l2-compliance report, for decoder followed by encoder, including 
> streaming tests:

[...]

> Changes in v2:
> - Dropped dependencies from binding (Dmitry).
> - Dropped optional items from binding (Dmitry, Krzysztof, Konrad).
> - Updated binding in sorted order and proper alignment (Krzysztof).
> - Fixed order of newly introduced kaanapali struct (Dmitry, Bryan)
> - Improved readability of buffer size calculation (Bryan)
> - Optimized fuse register read (Konrad).

You're still reading it at every power_on/off, which I generally
believe is superflouous.. Unless the hardware has some unusual
properties, a *fuse* value does not change at runtime and doing it
once should be perfectly sufficient
 
That said, this is not a hill to die on..

Konrad


Return-Path: <linux-arm-msm+bounces-65914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87850B0C6E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A59927A1C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E87928C03B;
	Mon, 21 Jul 2025 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InnDm18Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FEC22EF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109502; cv=none; b=s6FPdCTMwhL68thUhk46vtC8uE5N8VEDPdXhOE0/hreNqs9cGl4OLPo87xZPpp32vtFBVj97ECkbwi6V2U9FE1lGSFlz0IY0UDh67TAkEjl0U5tToZO6QxMtV65PEGh6o1zp1uojvNLnZYGPQLtlQir/kcgWw7RpT2lxo5U9j1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109502; c=relaxed/simple;
	bh=2pvWMH07iqrBXEk2OWRv81HLnHYw7YmDApBoBqzjtKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsCHI+XDAw43Hr6YvR3YqqERuMwQOP0BEJNvcv6Nf5mdqy69H5+Wh6HwFWtWHk6kSAPW7AghYweabVEhvgQ9A0ZZQyEumUXpQ1NIUQUEOgKYF69o618XNrqQJMehQ2Uah5MtW9N3ofAIJ3mnYAMQDxsddU8ov5lxoJO4i1+s49g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InnDm18Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LACvrx001178
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMgkULWhFnNfv8reCcAzyxz1uD+6zucjoyW4qz2tQPU=; b=InnDm18QKyUuvqHl
	Jdk1ho/XBnLd4JMnlT4ifi3Zo+uNU29WAVqEvZTjgY2sfqNPG1vb8Yvl30w9SkJk
	6G4k8qy6ZJTMRPW7B33vmbJqh/GMelvuRlQNNO9ItELvZGB85WXP5vO1cCGG54Ji
	dfGEmJ0t6RNIyd3TyMt7HJ8dyQSnxgE5ENng0mlvr9knV5Er+Fbla4GuuDapmTvy
	S523aTo4lJ/44NS9XZY3uXU2NzMGiQqrAs3Uv4EVFH4C2WJczyMDN2akB2MEFGMi
	n9ScBSouhPqeXb7WnLgxppDaIbsLBQn3u9ldA9GjT0uzlVgLtpaqiG0EPIkDLW2L
	+F3m/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044ddmy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:51:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e344f333beso31842185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 07:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109498; x=1753714298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMgkULWhFnNfv8reCcAzyxz1uD+6zucjoyW4qz2tQPU=;
        b=qdB5hiMv7+Dmbs1H1unwQXpp3fe7OezRfxmKMxgX7YpQuwYegDTGeZREJ7mP/r48DP
         9OPzpSKx/uJnnpegplz0+ogT9sdkU+jf6LelpDMemOmp3yM9ZUsnC3dbR8a66No82Ttt
         VJaGFjzK11LcN8e1bga6OaDPktrBhUz3yTOiSZVaOfNAZsa7wnDqguuukzyVirBMUHUb
         j7QOZTfTv/6kussHXtK/JwDEF1XVpp2pj5JEicu6m4hMOiAlq1jUMMbxrrwyz11cPRB/
         Vxgtgixuvg1ssuqy66jPVjAGThweMJK1MX+PWaVDE828fUw27kCUwNcCsnW7pz0AmcAM
         BCFQ==
X-Gm-Message-State: AOJu0YySu17S/MY0HqyrD82E/wzjYbi3O09ZYVLxHwaFJOCR6axW7Mgb
	+PddcSck76RSQD/FMpjtc4R4wjvgmLz3cz/aNOwPYMe6gnMKHOKdr9ngHUswgktMFpsXVZfJJVX
	cvfSbnN45KE55aRqeLWivxV2CRLFYhHs5we6hEpBYqCEP/v4g4YdtR02GNDyCOYQqyrxv7BwhXw
	hB
X-Gm-Gg: ASbGncseXHeBQDaaA+TMKtljyA6nubvLslmj2uUvKunVkWrbi4af0HiULZDbrLZPtzY
	U0gPZOKFMk6ph257dH5cfwA9Qv6mcoXHg1gxzzXjV1cMxoYeiGB/q+ddKZe1rlo5klNwN2fD1aa
	jTfTjggUgRtdfyQfYMiX6z6trsQxLkV5Pw896pg23Hl+IUB543J+3ci+lafqPgU0iF1KaZ/Somd
	LSZcZY0nSUDDWysjs9Kj062vbdxQKsxrziKosAsG82DI8WaTbdFjZOiRedKweQsaL3JHhHviSjJ
	gIRsxZjYI5mYscbona8S1h/8F7o0oHGDS7sGduv1/0uC9WX2R0StfS8tZ+jzAbbGlcJ+UeijC5P
	oVK8OlIAypwu7YeFuYvWV
X-Received: by 2002:a05:620a:4014:b0:7e3:39d4:4286 with SMTP id af79cd13be357-7e342a8e398mr1151687385a.1.1753109497892;
        Mon, 21 Jul 2025 07:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSt5/RDO783Jsf0Dpjg6Xj5kzj9H3igzttfEVO974rPIh65MJIGlIMPiuiECbGupg7YZMCMg==
X-Received: by 2002:a05:620a:4014:b0:7e3:39d4:4286 with SMTP id af79cd13be357-7e342a8e398mr1151685785a.1.1753109497420;
        Mon, 21 Jul 2025 07:51:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca315d5sm693468166b.98.2025.07.21.07.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:51:36 -0700 (PDT)
Message-ID: <21c75060-eb8b-45f8-bddb-816fce787240@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 16:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
 <20250721143037.20983-3-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250721143037.20983-3-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e53fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=PtIsU_pUeB5Sheknjl0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OIPgn2iDc5FBGCfCDzRldHjr1pe4UGKv
X-Proofpoint-ORIG-GUID: OIPgn2iDc5FBGCfCDzRldHjr1pe4UGKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzMSBTYWx0ZWRfX/lucYVdt3Uhe
 s2fntBKdGDCX6XbadpitwhknJdf7pJsKPfQiPDJltakpyzTZpi8eoSNuWDL06LuoOcbhBjHfVDE
 sw+v1OaZjiuN6hNpMBN84mJMinKeovXo9FDrmSXk2J36TH0vhWL1R4VrS5mHsDxViYOXoD0ikTC
 8qmRPRLplVG/0dNJS25im5AE+G+LIkzGcimOQMIbTmB+mLoNMS1mrwZ3ArabNDnmVbNbDeiNwdO
 X185MumQTSjXONd8uDyr0dPxYUDQ5twN0KvDjhjAvFy7OoT2cmBItx88ft0dA6vBCtWPSar4gfD
 5rGXz22mrYLluhZzlwRBhFiFed6dAADAUrDHkZBOldidZZHW4aqI0V87XblW/s+MjM9v/yXKfCv
 eLLFxxI4Jb1XqiuBgoNfg825i1Px7S06B/vymYCH0q4GkRhmpb/l9YGu+WCVKKjp5jQBn580
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210131

On 7/21/25 4:30 PM, Pankaj Patil wrote:
> Add TLMM pinctrl driver to support pin configuration with pinctrl
> framework for Glymur SoC.
> ---
> Changes in v2:
> UFS_RESET macro updated
> Removed obsolete comment for msm_pingroup glymur_groups
> Update gpio count in glymur_tlmm struct via .ngpio
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

As Krzysztof pointed out, your s-o-b is not part of the commit message
(include blurbs under the --- line, which Git will ignore)

[...]

> +static const struct of_device_id glymur_tlmm_of_match[] = {
> +	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
> +	{},

Nit: "{ }"

(no comma, as this is the sentinel and we most definitely don't want
the list to grow beyond it)

Konrad


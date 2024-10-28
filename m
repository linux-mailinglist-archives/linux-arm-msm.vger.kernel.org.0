Return-Path: <linux-arm-msm+bounces-36169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4469B3160
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7FF28285D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 13:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D631DB548;
	Mon, 28 Oct 2024 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0FY/O/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D39EDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121061; cv=none; b=RegUddlKkH5pzlp+l1ThMhN1Nyk8TQPOQh1NiAL80k9SMGv4jma7vZw+lVFF+qoiDmK8UEct6cRjoHgRpCHiHf6cpWub+K5xlYrzJfPy9dBkQfBKVApqzjanPvYC9S2cVwITR9bWHXYvBbXS5op8dreTixACpiFxXNcwjhKEa/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121061; c=relaxed/simple;
	bh=e9/G2XYYF8CwOvtty/jbQJENgNEJnBUmgvIogS/mCVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuh9ZN94HQVwNx9h11B9/BiONVJrML4hfiBazb2N/0gV4cbYUeTPkSjRWn8ldJ0Zx5vZbO61ZWc4RTwns8aCtq4rPyAST0B/e5J4we6s0iKaj/uSsKizMNisqGUpl4adn0lmJiXW4YU7N8a84lrzMs61M4GBrO05XMa/KgYbcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0FY/O/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAps7t027417
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+/Vw05jKsCpvo+LzX33OBe8/nvt7U4c4yVqDeCabWg=; b=O0FY/O/dVowOE8F3
	VV9ZUz+GsgRMhcyBLJJdhH1ot3T3b7Q2Vf8zSMVsJ9H23WfrACHHtR5psn3GHVm/
	rluLJqeCEvLSP3hOTD1rQ/4Tf5E7J2C2FbptH1qgmd8Qh095Vq12dfmDWi0gbz5c
	pNjzdOhv+Xop85LReGXFsMYlDrvTmwZL3bT1tVDWFgWfnxJTlSlufiziDIEjbojC
	lPrFSiiCDUrqB17noqgIlDiWkdMGpJnOzfwyHd7bAGZ1W+JKeAk+VTD30zL4JIyd
	oScRufDed9KUUds3W6G1aoWYJzBborHLYpQO74PFtoHdBhBYWwcAOFAuOg8GTpBL
	ugzXQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4w1hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:10:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf4770c18so15235116d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 06:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730121058; x=1730725858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+/Vw05jKsCpvo+LzX33OBe8/nvt7U4c4yVqDeCabWg=;
        b=W1WYpF/u61XgolK6JgIEjPuQ0QPXHS0Y9YCeWF+Log4Ftb17VB75qUL7LqTyOdBoKN
         EZjigxrYoINsK/aMJxDUKarrq+Pl5AFShVCNNLDC/iLjiQYjblZ9FW+snQPoUVqGaG0m
         InHfDzbEgKFrNZuYcmwqY7JFyI3e2BDnLNJn7/0dtvmSYNiSnmIATKTFQOv8X0GISTJq
         iMk9xxKO3W+nf+7TUiM1GziV1d7tilAMa93jlf7Q9BNy8fkttfSOnJrUNR6+jBpXkWbs
         HAhfqLf2p2iLG/IJTOaV2BbOJTpTbRIoZ3x0y9aiS0tJwqd+TGXodDrkj/kigkECzgDC
         y25A==
X-Forwarded-Encrypted: i=1; AJvYcCWo+AeMVAvQrjY4mOUaBNg+5Cq2MS9YQx7dGHddHC4QQxKxWSemxGb+qTRw1h8vR0VT1RGeqqND3IfSEutU@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMGuNB4A/9tBWsYKYnAHKysdm2qSFeh8x9DYwl6R84nDFXKZp
	EX53KSfyHPPN+qBWHXg0rIbHQOS/9vgNsYu4GpemVLBG0yUy/18qDZIxl568h5wxVIFeRPGq3MY
	d3j2GcF162r14wBKbrCGgaZN96BFVzjHTu//DHbG+RpRNvJmQ7pMo8p6m4HOiYIqk
X-Received: by 2002:a05:6214:d45:b0:6cb:c6da:5fe3 with SMTP id 6a1803df08f44-6d18567a31cmr64568286d6.1.1730121057569;
        Mon, 28 Oct 2024 06:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq3HPWRKMYJD2jxgNWRBKn4gWDVDCn7ik3MY50U15z0QzhZx2GE41JYtE6eIwfAbDmYHRPSQ==
X-Received: by 2002:a05:6214:d45:b0:6cb:c6da:5fe3 with SMTP id 6a1803df08f44-6d18567a31cmr64568066d6.1.1730121057254;
        Mon, 28 Oct 2024 06:10:57 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1ef322ecsm375399966b.49.2024.10.28.06.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 06:10:56 -0700 (PDT)
Message-ID: <327507d8-2dc7-4645-ac3d-d68ff31a84dd@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 14:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100: Describe TLMM pins for
 SDC2
To: Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
 <20241022-x1e80100-qcp-sdhc-v3-2-46c401e32cbf@linaro.org>
 <a282021f-5e61-480c-84c4-272049e28244@oss.qualcomm.com>
 <Zx9P+HQMOkJsJGcj@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Zx9P+HQMOkJsJGcj@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gn3QPaBrWWl7SGg6EqiFvhYWKS66ZwJT
X-Proofpoint-ORIG-GUID: gn3QPaBrWWl7SGg6EqiFvhYWKS66ZwJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=882
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280106

On 28.10.2024 9:48 AM, Abel Vesa wrote:
> On 24-10-25 20:34:19, Konrad Dybcio wrote:
>> On 22.10.2024 12:46 PM, Abel Vesa wrote:
>>> Describe the SDC2 default and sleep state pins configuration
>>> in TLMM. Do this in SoC dtsi file since they will be shared
>>> across multiple boards.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>
>> Not very useful on its own but okay..
> 
> Fair enough. For some reason, I'm not able to get sdc4 pinconf
> to work.

Any chance you tried to define 'sdc4_cmd' etc.? This one seems to have
sdc4 pins on gpio127..=132

Konrad


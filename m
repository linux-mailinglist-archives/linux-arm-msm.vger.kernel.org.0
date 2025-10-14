Return-Path: <linux-arm-msm+bounces-77192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4ABD9578
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 949CF4EC784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BE1228C9D;
	Tue, 14 Oct 2025 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJ17PiJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7284C85
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445079; cv=none; b=N8qX4GGTLf1hmMiy9ILhCYXwBSIRmBZVzQQQQRza5MxoPmqxX1SvKywDqN0eoYq/ONNOVnWuPg/4EdNRLK7TQq0VH/j0Da05Mg83GYcCnF2sc9RN31fNsG3/+Ldh5E5JoRp693sIgsqM3zXOmLv3ejsMV1HyNq5jEI0W2q+kWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445079; c=relaxed/simple;
	bh=TKC6A17tydWDC94IwMFkA9hnSrTjZmAGq8YUv4bHuWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeXEaQDhZfV4FYY0K7nPUR7WsJOQb++yxNNZnIGkByxDxU3NYeC3SuTmVcx5ndfGfJkDVx0M9Chg7K3HAaRYlIirvA3l0Ds7dJ6v9+fqAID1uDNGCft0yPqu2B3lOz2wXvulo+enInM4rDaTs2dgIt1lQydRyAFL2zhcyv1OnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJ17PiJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Ho6005378
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ID2HJsJjmIngtB20ldfJiYb99xBQYJlyyVG2gHKSJJI=; b=jJ17PiJSuBQ8dVQl
	xg4qUWAegEIlqeWHWI6uogEggRvOYUOL98bF2Q2wmf5ZpymZieWrhvzG2KyE1fCe
	ZoRdaQd79T4kB9h2Wxe7LOfhq8upL/azQIBBt01p+7dr1bCwzfk8pju0VV3O/lnm
	d4F9TV9/ybycVMCTt6P4tvBLtIwVwIe3Nuwg5zk0AlCVeSBStPfRXW/WlBzAwftX
	crCZWDEfbJqHyGbvzyuapEIPIuUiDhIK7SgYZoE5ohuz7aBupRR3vVKn4FtSEOS5
	aztb7LfZceVoCPjkohlZ6M1dAgxYA2fF3Srl2b1yEymwKqXW/Wk/djC0cu9cW8uI
	j2vKYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj0f8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:31:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-826b30ed087so24738146d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445075; x=1761049875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ID2HJsJjmIngtB20ldfJiYb99xBQYJlyyVG2gHKSJJI=;
        b=fyhnNbDQEESht4omwVkakBLYprWGUKMUeKKcrWjfWPt5TfarjHjwoaAQe3DBMLDQaM
         eaCqkDseDFCds+W91LL1xB+2dvExrY579NHz1X4LQhK7Knj6k/ES3fJbECIMzhBApNQG
         F6YtWrUWFGjvgjvRAq4B9OwcHatFHqkIWiyTiGk2I4iHklyEdQeJSFU3+XOEUo8Se2ET
         zeP3UJUykjJrJuBKzRCF19zeLPPqopuPCb6ak7FO7o5kKNZZ6pnItPC2oPt0XeOrIgu3
         inmhLCXkvxgufYKAczpQtpbgHm4VPw/msjlHoPRlD3isC3J//rqofha70VNAN0fzRo6M
         XUkw==
X-Forwarded-Encrypted: i=1; AJvYcCXI2E8mjAOJzRxiqcbMpKXwE74zejcunYLDrzFfYSI1hZ1z0+fi9u4X2oWwhiFumYbs+x++5yjAT2SdyIS8@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAm9MepB3rua37/KOSy3ObxLQ99PMLdtiRu4kcT3FaCol2o8D
	1gld7cJDuxttJHTbWGwwlt1xYunds0KxoR/pXTgxSQeVOapyjCAITVZnhfjTLhpT/c2WI20mgdB
	NANcLNRHFvgssOQlJl1IOMLEpoNjctBQaky0slnRjbSkh359Dms9eRtSyo5HcOt4z5+sm
X-Gm-Gg: ASbGncvU8GzVY4AP6A1FN6Lv0DZMXxfxNz9RiPI2Txzc7+id4m/03Gg3Ts7gz5YjcBf
	G0+a3uWwIURQNchN/MDZOkbXd3CNJvxQyR4DetkEmlSp/Z/Q+GLcXYe0ZuhNPJXNN07+3yORbEZ
	tSCHj0++P/m8A8Vuh/EdOuYCzNvkrFR3rUfhZi94iDqSaeWMmxhoPNf7rIWRX3Z/jdC+objCmQy
	MqlIigLsNhAjvqjVhz2HUb6BWu/831pQiq5f1GM/PH3ZLnTd+AFz20KEEGxeyWX9nfAw+mKB86w
	etrPXWhlomBNIo+EI1hXzomP+lE2b24awe79X5lLEiT67f74Lmgdfh37+8dE4Yj+9QbUpuATrsu
	0vJ5ko3PpGLOg8TUE9QB9Fg==
X-Received: by 2002:a05:622a:8f0f:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e6eaff3f88mr165143591cf.4.1760445075094;
        Tue, 14 Oct 2025 05:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+j4D2FNO9vuOjT1YgWIBgUGvxk/FKtuOcXceOGc4py6Qj9TBJaMty1wCNCO5mmpGa1FyaIQ==
X-Received: by 2002:a05:622a:8f0f:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e6eaff3f88mr165143241cf.4.1760445074624;
        Tue, 14 Oct 2025 05:31:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm1135306266b.38.2025.10.14.05.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 05:31:13 -0700 (PDT)
Message-ID: <87af3cf9-7eb1-44f8-853c-d6bf973040c1@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 14:31:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable configs for Fairphone 3, 4, 5
 smartphones
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+7bkvpY34oIX
 uyKZguzKr1fgpuYk3RWBz0+fxraN506MaaIEVABnqzlrGU+ncYYQ4dJq7BArrBK1dr4/63xJEbt
 iolkAis2QEvkh8tC33y5XTvXTplRe3lfjzlm+pxntBjeO58jQ1OyNVFwbxsWdQEn2YTZQPocFJQ
 t6nH2RoDQXLlAU5gKQAEy83e9/OFzGXfNPpFYnzghsGc77U9BCr2UiblCizo224fh7B9nDwgt/U
 Zc73HpfRpKrQk8Q6w9IkkxOHkEbz+gr2IcNt+SC29D6TrNuks+rXly/C7A2y2iji1V5u9H9EK5K
 s3jgMvqHq8cRnZcOm+etdXfMduq03exkYecZaYxJj3D6GhBMhdK91igysOe+6HdUWyCc2RvCN/7
 dUC52M5T9RPWdudYdUXzBnHSNs/zQQ==
X-Proofpoint-ORIG-GUID: _o7Ll5j00S0NooiIUZLjC1ABB0gA7x-B
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee4294 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AqWm8137HdW1rLVHM9EA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: _o7Ll5j00S0NooiIUZLjC1ABB0gA7x-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/14/25 2:11 PM, Luca Weiss wrote:
> Enable base options for MSM8953 and SM6350 SoCs and device-specific
> options which are used on the Fairphone 3, Fairphone 4 and Fairphone 5.
> 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


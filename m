Return-Path: <linux-arm-msm+bounces-58934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0219ABF7EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3981D7A6DB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DCB1D619D;
	Wed, 21 May 2025 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRnr9oWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F923A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838038; cv=none; b=ANG1MBtD0KnKNMlvmJsswReA4s2iknglVruOyn6cp8RuCP9B3fkSePBtR/te76MYg6UA4QXYojRleA3ZDgelO5Qv/r5ipWe/9RdLuRPwsZ2NuBA18ZzWdeJgk0MXh1EnaXbrO2nd2GvuLzYjCTgkTGJ0Nq8WgyH15MJWxXjHB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838038; c=relaxed/simple;
	bh=QXOptH9UISrpzVy4cekX7Ltl76t6VFh+ehjc5O5k7cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwEAjf+B2spCiB/S/kSLBHDlcdLtsxlFwXxaY103WfHEO2xrEAijI3SQXWXhATR9dNjEm4SDvZGmnCyINk38JdCDZjBQiUxLuYjJeW6eC2ealT3NmIj0T+Y/mv/Q+3vCTTG97pBJ3FP4gQfUCbLztr505WIozj8/j++yZNwj3j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRnr9oWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XQiR006647
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUiFy+nLG1ZM48+pPyGzOV6fpUXlY63P3XaohGVWgNo=; b=fRnr9oWeIsRBMM+m
	X5nP7aPpXwcMHjSTl3AH0qN47YCywocDnRH/wejw7pTc5xVy8QV7m8yED9QrbDbq
	hleTJHTnI9dHt7bqsncKtyfHJSLsssAegnCkxIpsJ+Si60Bb6OaMnixxLQblvqrM
	tgMZLHH9DpH/y/JNCdeqS/TpTvrx8eN0+hspvHtLWfSZGSLbbLvjSBnQ/rsNybU+
	nVGskHQiHogiD2PQ4rOfBYEiKqx3GrkAN266DrlWdp3+9tijAs5iORq4FYoN3dme
	HRezCJeB5YyrPPikGe9L+p0s2QpwjGARaRXZnlGo5kCRAx10wDiWUf3tGDUQIRz0
	0K8zSw==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0k9te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:33:56 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc870a4ff5so5311325ab.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838035; x=1748442835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUiFy+nLG1ZM48+pPyGzOV6fpUXlY63P3XaohGVWgNo=;
        b=Sy7sNlZmkLJ01Jr/vrl5agWVFsbuQhneS3ii6h5+xQxWvKygzGvUZ07kMT6sAUzT20
         YILlipls8G7LCSD8Ztfq8fL+SjhSQWmwCEvcABkL3XtfL19rUo4trmiEUeIgwScdVSJf
         ZTTRa7GNNpSb/JQ4mfrZw5LXyZTQ35zg1v/O1y/nj+PhqXVAGVHfjJJbgSpBOfLgGN93
         6oega9xjrpmWRTdHWwbnxcVEzmQQb5Lwf7uSmhHoBudWx8KsvvOYYn/MoojIdTu+kUbi
         yRtTiuxa3y0rrgQgwhAGokrkSCQVh1ElmgDdnlWVo2pNj8fwF/o86pusdKW01P43/2bJ
         eV5Q==
X-Gm-Message-State: AOJu0YzvjQnZID7LY54zKB8aclSok33vdKInapROnJDq+g71x4mBhikk
	BbxxUCrw6ksQAFTgi6vJrUS5dfZlDCl86mBBi4UwcBdn/VQNMqDxwgiNPaVrGbMrErH1eMZsvdA
	1gDVbfXxg98rSv5l1YkoifeY6nLCT3XBAKh/AOH3IaqrzYAG3tL19pNdnhNhDuu62egNAUWiK3M
	iu
X-Gm-Gg: ASbGncvtk1oa+WccXP6DtlDnLuNEbYisxNx19k318hbbsRq7K+ElvvJvOhQG5d3+9xS
	KMAlCbSNka32yBa1DL7vfCMFqClTUibIFM+So8sGQE66zvv3wE0EJ8uiLYVeJ1atJMAkGm+Sgz+
	3cOOWQW9vq/kwLNxTDKopLIMuAtx++h3JBSzGRnPUHURX/qlcZhgeX7BOc+Y29KTKp2GI+LES7f
	op7Et2SIP2iPR20FELQIL3EEPVNgyBUlpD5UQdBp1yR9rmmWw8jyWMJqBRa/b6iuAhoxLk08qnU
	uJw9HdoUxXyxg74TYqzS7A6VqxI4gwpIZ2jbLm1UbdcJGIT986YFhD5SLGaOztsvVoqc8PgSvC6
	HQoI76A6XmmQxL51kHpO5dz1BVY9Yd7Nnn6mMnPsOleOOph2g4rcQiqUqG+yXQywp
X-Received: by 2002:a05:6e02:160b:b0:3dc:79fa:ed5b with SMTP id e9e14a558f8ab-3dc79faf12fmr72495805ab.11.1747838035065;
        Wed, 21 May 2025 07:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENjzKcO/YaBHBvHOlpxJ9X3Vbs4m/bWka9bn8wMR7PBaN5TG3kpnsx5SHud0+v5nhdvewHBw==
X-Received: by 2002:a05:6e02:160b:b0:3dc:79fa:ed5b with SMTP id e9e14a558f8ab-3dc79faf12fmr72495475ab.11.1747838034711;
        Wed, 21 May 2025 07:33:54 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:69ba:b852:d3f4:8957:5a1e? (2001-14bb-c7-69ba-b852-d3f4-8957-5a1e.rev.dnainternet.fi. [2001:14bb:c7:69ba:b852:d3f4:8957:5a1e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fb37e9b9sm997757e87.135.2025.05.21.07.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:33:53 -0700 (PDT)
Message-ID: <e34a9a27-de57-4cd8-892f-6a3fcd447b9f@oss.qualcomm.com>
Date: Wed, 21 May 2025 17:33:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add UFS support for qcs9075
 IQ-9075-EVK
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Sayali Lokhande <quic_sayalil@quicinc.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-7-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250521140807.3837019-7-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gcV9hLvZ4jktfhDsZJmq1IznaISN5T3W
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682de454 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=oWHj3RyY54zUyjr8eeQA:9 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gcV9hLvZ4jktfhDsZJmq1IznaISN5T3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0MiBTYWx0ZWRfX8Z3buB4QxQOT
 p62l7O01NMpypuiNWF0BZnjdxvP2YsOVkoWZobV7Ob6uqemxbh/R3ehZbHlX5z9G7BILml2zsUv
 X76gOlWtFsRUXlH9WuPPCT/9IO0/JuIVnqGbWLTGB1X00GK9tddebTLbgHA6py4ObSIxFfoKUXd
 rTYXcE2nLb47IBC3nk61ZezWxBkAZCkNta/anNXmAOSNr2I74zDF7jESDYQbBIQoqzpwRnAHj/k
 S+ZeBKhWHtn9VABmxhylZ2x5FkuxFndOwVSF0PmdrlxLGgy+801uwzv8NrQFv27kThzyMa/mgng
 qfT7L6Kt0+mDrbtJ6e/DeyPlq+AZENFnPMujx2ovz4bn9Ox9GNvIROdFm7xUjzQyVYX8Pubd5rq
 PZ0LMlfTOfmYilojcn3tiDhX+eOesIAg3NqzHFGBdpGuGjwGOfvSqSh6PTKPsZYX2Xmf185e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=891 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210142

On 21/05/2025 17:08, Wasim Nazir wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Add UFS support for qcs9075 IQ-9075-EVK board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>

Squash two last patches into the previous one. Use Co-developed-by+SoB 
to denote all contributors.

-- 
With best wishes
Dmitry


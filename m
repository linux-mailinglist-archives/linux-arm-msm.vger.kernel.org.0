Return-Path: <linux-arm-msm+bounces-65700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA6AB0A94C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094101C26839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B8E2E716D;
	Fri, 18 Jul 2025 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ8MecaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74135239591
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859295; cv=none; b=BmsHSWLkmOY6lUJLkXm0vRHjDR7RDCaC8NabLo/LjnfxvgaOQtVY9C2ca0vU3fwfz6eHvKQ282e3GgpKpA2M0PdTSXOW6cQVe5MSfDti7ifsgZicJMr5CCGEm0IRkGkcpSLWlB0bkWydhoSlwXqFyqAAG6mKSkeiyjbBQyz3RLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859295; c=relaxed/simple;
	bh=Iw5grXdfExOBq5dniqWhDt/znX4b7nSrmolECaBxpeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7e/koRbWQ5sIi6B/+FsMvMGxVWewo1h4F04f8CzPCqp1JG7gFnGa1vAo+98hjdgrNYu1i26BEzkGmHmh6DpHAiXbUJapdRgKZhpYKg3ZmLRLfjbOxzMOtrjHOZwxIMF6KGrSqVRTTdlfRmQ0k4zMkPLSc0JxE+WRPqqJAEaMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ8MecaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I94nsp032390
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06hO/weMed7fQm79ThGdUddmr6lCUcgv7otkkBDExXA=; b=FJ8MecaE0Y5zWt8X
	iuI0TJRtb8i9imFz5W0YZSMuxetvadmBH4VL/oXt4Y1Wv7NIZP/mIlkJhAGx+qe6
	JZxkyy2KuvYiBmSFLiefJKXxBsYskfZ4yiIiGM3zn6StR+A0JQGlwwSRVs94vZf6
	S0gSmemesLXJnYbcKRl9Lk61yoWts3fLlk1uX9hyHjFbY2nRxiFAs03YRih+nfth
	ZFA0vC4c5gSbPPS2vHu7pkN40VEV3GyTYwXevPZ23BMm3KKXg+CgsuzyxcSNFm8Q
	hmQk2DzOwYsgvs+aVl+80s+1TCWvvPSjzKtuw4hK9+PKpcIsZAP2if7sd+OgyEw4
	kql3AQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38cjp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:21:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a9bcdc73c0so6654401cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859292; x=1753464092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06hO/weMed7fQm79ThGdUddmr6lCUcgv7otkkBDExXA=;
        b=JYp5GADSu9Hi+4r7SUoTK8gd+FeHwlUxUUQSz3xFtTWPIi9S4eYZqgH7bDMORoyojv
         6ZMa5s21boK77BTfUA30ubvbtg9aRxQzcDUnEPgANwk7d/MSyrbyEA2QsVNjSEyd4KZ9
         MNpVDfJxKGC47arMfRY6dbKHE7jJOR06MMtYqlC89V+vxYFTwvkMBQid2LoBIxOg3Skm
         ijlig3KRLhkxGzUjVV3kHMdzTzbLTzml73ND6OIP/QxdRkaQKyAM4I/TBea6Ak0+aYLA
         C5pKqU4HeTmkSPyYCzCCfesW+KiRmPbi8gt3TBJFSjnDSwBmf///H74JY5ql6iuhkava
         M7sQ==
X-Gm-Message-State: AOJu0YxUuOPkoGDv2aX9ewLCifEWVSj2ly/qLP5we4mBW7cLwyLF41TC
	QJO8fBULZ0wXYw8iXYmeaAkVxg636x5U8wvMRADHVYWRfb3NQESgwe7r4gj9vpM7phvBhFdtA2A
	uMTHmsUvKrAIAVxkKLgVLgpOCypl5W0gdxOwcGfE05pGzE+tl/Gzrsa1Ro6Vb+R6+qtJy
X-Gm-Gg: ASbGncuE4y7T3vH29y8pRWRzycSxWb/wggKGSjdkFGaN6SzNqRUcrzyNJb/dQWreTko
	Fy3VRXNfpQ6WnubSaV0lSlpHCQkyZS5z5lGyy/WD3PYNC0PQ5y2zkZ1gGvujZRZa7rhkXHLcq1k
	l1nFX3bq9L8bQ8sSEvKGOUBkDkuNCliaG9ckaYmO7sZ0KrGpDu4AW3ogG61AXUJWpwdPgsyDlrG
	D95wfLv+ZPIeGaBV2wSngwUdFqPclYy8XYbRUb9Tc/wy1bY8u83junlj1aS/dzTIuKkrJJCJ+9M
	RXoTOGSK1HgjriGRXh9wmuVNQZovokLqFZUFPs+CUtBX3DaQ9QFqw0k42v5PRyaYRdzOO9NzBqc
	JpfuWMJfR8KzxzyQR3d71
X-Received: by 2002:a05:622a:1b1f:b0:4ab:609f:d7d2 with SMTP id d75a77b69052e-4ab90c8cf06mr71803181cf.12.1752859291272;
        Fri, 18 Jul 2025 10:21:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPssClCCUe/Z8bo8MgUBvYHGyuUUl0g0+QJt9SpC2YT2VaORgZHpAgbDhXA+B6Btw9D6W3ZA==
X-Received: by 2002:a05:622a:1b1f:b0:4ab:609f:d7d2 with SMTP id d75a77b69052e-4ab90c8cf06mr71802891cf.12.1752859290758;
        Fri, 18 Jul 2025 10:21:30 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c90a9098sm1287395a12.65.2025.07.18.10.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:21:30 -0700 (PDT)
Message-ID: <eaab7061-a02c-43fd-9a02-6ff9625401a8@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:21:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: power: qcom-rpmpd: split RPMh domains
 definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
 <20250718-rework-rpmhpd-rpmpd-v1-1-eedca108e540@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250718-rework-rpmhpd-rpmpd-v1-1-eedca108e540@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNyBTYWx0ZWRfX5l8WNdTDGSYe
 nIM5Gg9ykCqgQVWp3kWo20aZ67SC4SHFAkpb0QUbq+R9JoqvwKXMDgLAPoAKX7OUO1/m2FX8U1w
 XEb3TMmNhVJEywv0nItcaV2t+uFCq+B5Zd8mKYIW7XCnuQv3ab8T5Qllo+AfsCKTDCKTxSM9tDF
 FaXap41Rcxl5NBtpxYHEKdS9GkPAlTy2qF4R0xiFWUmKLZYQf2WXmCacL9mpoTZRX18w+jpwTCn
 HwYjEAX4/5uIO78bN9xhgc6bvxuF98NdHyY+bzmHpQSv7DHSVJYc0xqmpoKwFGQTJHx/7hxY+rf
 q1OtWyzQxDt5CSf3tSbtTGNBbxIDOXBd1aIff99BOlo0N0XJbeft5xW5KhhJjeqizHdRzpVxvNz
 j61ZG3cBrY105A6fr6AOIbflj49XPcDmjN3DCJuIPjRoRGJshlPX8krqwrhS7FKc7bNSdVdK
X-Proofpoint-GUID: tgfRvcRfvp3L5X7O-p02Pa2slNQ_MlkG
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a829d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0q-T4vpNF8mo4nd_0X4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tgfRvcRfvp3L5X7O-p02Pa2slNQ_MlkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=647 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180137

On 7/18/25 6:13 PM, Dmitry Baryshkov wrote:
> Historically both RPM and RPMh domain definitions were a part of the
> same, qcom-rpmpd.h header. Now as we have a separate header for RPMh
> definitions, qcom,rpmhpd.h, move all RPMh power domain definitions to
> that header.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -/* SC8280XP Power Domain Indexes */
> -#define SC8280XP_CX		0
> -#define SC8280XP_CX_AO		1
> -#define SC8280XP_DDR		2
> -#define SC8280XP_EBI		3
> -#define SC8280XP_GFX		4
> -#define SC8280XP_LCX		5
> -#define SC8280XP_LMX		6
> -#define SC8280XP_MMCX		7
> -#define SC8280XP_MMCX_AO	8
> -#define SC8280XP_MSS		9
> -#define SC8280XP_MX		10
> -#define SC8280XP_MXC		12
> -#define SC8280XP_MX_AO		11
> -#define SC8280XP_NSP		13
> -#define SC8280XP_QPHY		14
> -#define SC8280XP_XO		15
> -
> -/* SDM845 Power Domain performance levels */

I was never a fan of these comments but whatever, it's an include

if the dt folks don't object, this is good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


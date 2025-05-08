Return-Path: <linux-arm-msm+bounces-57270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAA1AAFD15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6E49E18BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB40253345;
	Thu,  8 May 2025 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djN4lqYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1426E15A
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714600; cv=none; b=WBc3uzs2zMauCUGny41hmZbqGeIxpf9LrA4sBO/24dy0vmhoFI5IbW7ST5d2cC87mzoJ7aC3JRa+wz+kjOY7kv6bI1ViwPHZDKr7OaPV27F06AUsN/Bzd5xlVMgYVID3ib1fzRgpDHZ1r83KjW64yPv/lc9PP6zWfzAWM1shBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714600; c=relaxed/simple;
	bh=pifsycc66KzqpKaUgTJMqgSi5C71iSmELI/zL5LoQMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBECN/BJBd/c1Kqg8cS72Pe5kLNcZmpLzRxN4J7peIvNhZjoz0WaXfa9CQWWO9Y45BoTMTXOXYP/Q6mFufAEE6TcW7Rxo9ulssSlhQv147V+FVLDpJwqsPIAcbPtYV3tVsMkAN33oLD647TOfv0btTqtPRi15XG9/HpvjvNNo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djN4lqYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CsCuS008649
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=; b=djN4lqYb4H0wJPQb
	K4O5bAJWtsSJsQCa4f6s4FobiXgYyW5Hg+NLhQwSa1OaNpB9wJemiy+SiP+tUhpY
	WKQp2BkM8Xv1WuUZwd/e11HMvOdT9VFL1AorrRfl7W9TxDDxvM8T2TobbhGEv+qk
	dA7fIi5jp1xOo+v3eNpYndMyrRNA5285CnsYMJfKIKQCXQ+eGpkH9PnH/wCiSX62
	iUvhPOPRwZDtvgEuUBqXLOvOTVrgS+6sLvi1ajrdsvnIAsjEF+iJbUfM4noUE3wP
	DF/VY/7/VTlVFaX6NAVT33pyl37kG+c2uCStfuY7E7FSQIV0kpzWH5guSmeUY4mT
	gUHmlw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59kyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:29:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae9ed8511so2240751cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714597; x=1747319397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=;
        b=pSmHKwVCxuWEDV7XtPy6+/V5DBcGGEnOu5zKdq22bLNayJkkqrYdkItw7h34u4L4Be
         utRUHuh6rQjsH8ICbIrl2jhAbPndFby7nLHbUuR7lYeTto8Vd0rt9xoAaHz0b8nsYfc3
         a7bvc1+2O53QYqjWc8XafaF4L0Zv32p8jFzfTCbQxzAluo1PpuW5OaO1Msh32ZTnfH4g
         F7+aNDfcccLPCsfXOftB0jagNHmKrie3nlkaTWWXhh9S3Fg2IXlC4I8QJAfCjqlyRcxB
         ozNI2kd9b4S6Ugr+EULccq8our3UHmysKYkPIvy+wvTZSbqChA5Zo9oqOwJSZ+pAfiGW
         LWfA==
X-Gm-Message-State: AOJu0YxS9OPTvfpDHuIR75X9wXHJQzT/GmHK5d3tgea33CEIaaGJqtuy
	jL40d4xvktzYTIFk5dy5+Ddm0N5S3Ra401Ogb5Y8p93qSXfu7Y9Z4HiTiKzM8yNG1MN7/5GH8yw
	0yMbFR4jhP3w4mOTDxgjyCPMIjbqU+6TaKcpaOCLQt1iwYcHAnHdw5cK8FbUDmQiE
X-Gm-Gg: ASbGncutyDfbLvongC7flumw/gldv9w/f7SJIWSBM7vnCULMpb4MaqOv4CgEm6nRdd1
	t/dY4+4PDaOhAmtZdc4H0AZOC+VtW34/Q6XcVhqNrAo0wCKrVlz+trrEUxqlOVBVPpgG4W5FTn6
	EPpydvPKxDAoNn8mMuynahTknLHaI+MaXyJxkZ61NE0LOWgz+J9zIkl577C8iNa3Vb+zmR7Ouz4
	eS4HDg5AJujKIAilPhgaMP0KNcFVmUcjcLls/GrHsEGHWBRWr3OmjI6ucVEJlKPf2ONYLiDVCap
	ir8N+43cEqOQAWUz6GWx6tE0ZBS8t7fhxTonjHwYCmsSguv28HBZXHrJTIoXl5DjP0E=
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434991185a.14.1746714596761;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfaVl8OObnjHQhd/SJGAsLqOH3DFL4CG4ytZ/Pzo30OjRSwoRvlTataNc/c/g5GA7RSzbphQ==
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434989785a.14.1746714596360;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781cffdsm11366152a12.46.2025.05.08.07.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:55 -0700 (PDT)
Message-ID: <7123afc3-ab67-43f7-b346-bdc336481992@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks,
 power-domain to simpleFB
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cbfe5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uq1pj42CD5qt1GRQKNoA:9 a=QEXdDO2ut3YA:10 a=8aNmnrDM0H8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: rUfaul3BPRGKjO8j7dHt4gKvD5UxRNbF
X-Proofpoint-ORIG-GUID: rUfaul3BPRGKjO8j7dHt4gKvD5UxRNbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfXysuBVh0Hawid
 dCPdQm/Xp9Pf1N3kFQg6J4k6e4+/DF7Zprj32Dd1GQXEl8K5Abu3iqeUAW0CE3SEKeENobhfN0F
 z8OJ6jIxYAB2TQmwZ4w+tCg02FIuZJWRhpO3BnOL5n78+QZR4A8SSLlgSnAAD5rvuUQ5jxepPoH
 OgbT/sMMHBQTpWFwIReeThBBRPZTRUrDTY9gTvt4/RTbPrHr5eXf3fON85SmzEtd87Nbu8aqppc
 jCu/CjvQpDs9+ogK1530g0JoBbbCDPOx+1HN3Kor+jTCs7PE3bCsCyB/aipCYGftzep2MDVNMPI
 1G0cMD/Ar98aDx3+/KzmCS/VL0dn8M3EoSB/WE4jRtKuCXZmBuoVPWiffCvoYC1faRk/FyrNAh+
 wqb25iE5AJiGXt3IYaRaBHWxqmeFvnPFEAhft1avwNuga42Wma5YYeC8mlehJ9qxHTFuR4te
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=660
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080124

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> Makes the display work without clk_ignore_unused and pd_ignore_unused.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


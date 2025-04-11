Return-Path: <linux-arm-msm+bounces-54062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41CA86618
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 21:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 432A07B4D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A679C27BF8D;
	Fri, 11 Apr 2025 19:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olZiSMTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414291EDA05
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399181; cv=none; b=LbJmPd7XUrlU+iWItCpxGKIbJ/vaR0vLxElOAEFVDhWXLCw+BxfHifimw0/AwavRyVZAHLExvR39pwyWRB3meDeVsGxW6NrnZGc9Uf2y+Wlbk2Nxoezf4zYbcoouRjeQp8Y1HwAVFPB0bnu98+pPqcZBXkekuGONydUPbZzS8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399181; c=relaxed/simple;
	bh=gPvEK8xbGtbsGJI5JrYM/W5LfB9Uq597mHZ/DTGW4w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyYM63pWQw7OV2IBE8Uz2bdT3s24iz5Q+FXm2KFoq8owIHD6Y6tIdlWrrvgkTgDy30g0NPQ2/sR5vM7uIjxYg0XyHr4z/rpxsG2tCoan2EuV5bGq6REvmN8DBPqRUS2ZrReOJ2GFqwhlA4vS0DKVvdRNO1yuANtp+rjkozjIU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olZiSMTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFfSVG030709
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kxx7MOJy6K27Jw+iBYK9PLZCI4w0geAVFknwKXfOHyk=; b=olZiSMTtkwYI5/3c
	CSa10uNf+00+u0lk3xmoL5e57kvrJF/GqItF8pwNp9EPx9cmbTBmrN8BIHldtW7/
	Ii/6uv7wkslH3mNHYWWZlb/cdhTGCwLaFVo16gsLH10FFi4oMiGo4Mz7nEj4A7tv
	9xICJUOtRfRs2P9eR1DCkZ2seHTv68JQ+wKs1GCuQpbYhY0Y/ee4wIwLmiA4ukJy
	6DvIu4XCukxr6lvoRlpOTiT7zFAGwKtbnQPq+mpkC9852IbY5n0uLH78anmicwCv
	WBYhTlwO7FObrJEw+W2KXfIy6nljm4laY/C77DKZ2nDMj/RZBJXsfQPZAp01rWB0
	7aitNg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftu830-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:19:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so4462966d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744399178; x=1745003978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxx7MOJy6K27Jw+iBYK9PLZCI4w0geAVFknwKXfOHyk=;
        b=kh7+PLyIYdTnUomFTj6ssm3CUXX8ShX/HZGRKpK7DZj5/cciua5KU/IBVT+73xYecY
         JBzLbXG8lqVQpErXm3TyrhzOY3JLQww4eYL/WKWD+KhsOwuvTamCOcUR/cL8QnymroMt
         HHaIFt18LRdKQz6PLePwGivhxjJXtE7ixunc2k8mnAwW0/e0Vj38lxye34sXKYrC51r7
         9FlUJiDqUWmAjHgcuSNEgY8pBUqLqu1ZbuAriU0jvMlWNmtj3CzarLEAr5O1X3xhw9QO
         i0YU/vYLqWlB1BC4r2E+Q3/rhh5HZKkBa43JW0Utlu7QnUGdrJ5qsfVbZqRd7hk5SkfY
         yZhg==
X-Gm-Message-State: AOJu0Yzsw75jMTgOSS5MqJfNePgH3pfM+U1cDGCrAfIFD383/m0bn8Rn
	eQimi7omG6RZXhQqgwJ7FHaZb3kD8wbZxEnPXDgwiQexJCS6g+/3eqRrV+3pwFtUOLeGDb7AW/j
	AjHCDHvc8I/vFgOJWmeu+a9BJXRvzgBUx4GWX7sSZ0PUgOpGbZyV70wl0WdLniNj4
X-Gm-Gg: ASbGncsKGJSLa9NON68lp3y8s5mvH5OjbrZKpqj38LPQKVXRjxnLek0+RHkMIH0r46l
	SA8Up6bVBlEcXybHnhGj52dsybGiUfcajSDJu6WRACZlMEX8UHUr0Rj9C5kVjlCZP2yjEOR3MSR
	DlQQpqcnHMVnSrKGnatcC3Z8TU/DFWfLqO20q5twqSdhwzrK+SeiQKe1H25j7zTOT59lS3zp8Mf
	gSRRxAmcJ81scBjaTRnLbH+mmQs2Avo7iHk9rif/t1bZAWJVHv4u2ggGMLPsm5YZhaY2AUyxbOH
	W3M/njHO8kMN4NcDerccFOnBZDkFyuh+7uKM3nmjroJKtr9sIPdy3DZlgDnDpyq8gw==
X-Received: by 2002:a05:622a:44a:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4797756280bmr22631401cf.8.1744399178044;
        Fri, 11 Apr 2025 12:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1yQN8h4mg0s3FRgdn1nqenU2AlIRQvoi0Ohbf2iXKwAU3L6tgLpfZVGtHi+4IpHe+ZFIDYw==
X-Received: by 2002:a05:622a:44a:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4797756280bmr22631221cf.8.1744399177688;
        Fri, 11 Apr 2025 12:19:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef56ec5sm1412167a12.22.2025.04.11.12.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:19:36 -0700 (PDT)
Message-ID: <09a2b79d-d4f5-4ac5-8e8d-c79212b716fa@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm2290: Add CCI node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
 <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f96b4b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ITMKirlGn96PwlD3C4LnVN1rzLsM5ghC
X-Proofpoint-ORIG-GUID: ITMKirlGn96PwlD3C4LnVN1rzLsM5ghC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=786
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110122

On 4/3/25 12:22 PM, Loic Poulain wrote:
> Add Camera Control Interface (CCI), supporting two I2C masters.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


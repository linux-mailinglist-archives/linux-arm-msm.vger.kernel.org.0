Return-Path: <linux-arm-msm+bounces-62906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263CAEC788
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DCB53A421B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 14:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D8B24888E;
	Sat, 28 Jun 2025 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1+cmURx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4A24728C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751119353; cv=none; b=ArOCEEUnobb8xhO9VU5rKBNhfPVvqo2o8NG6FmWiupptNYQRjnBx922zvykNGZGcMvdEh4XH2OsOqMIFk3fvUCO0HKEBLm4c5VDgfdI+vZY5GX0ehXXWIv9V6/L82/pWJkIyMJYmrAiR5D2YRTKL6fKlGDLCo9krqZNENQNsKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751119353; c=relaxed/simple;
	bh=76cTA5dhjIgLc0kQ61Km1dduokY52iB0ODeYTMZIjfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqj6/t6ZcBWb8bmDlxOqty0gkBDcRsZ9/CmQdSOEdL58JEjsbn/4IqsU0W5Ciac1RlXJK9/RXCxdj3aZwAhuS/M21tgw8t+zGVtColP+BNZ9OieqyJyqrrvqXR1WnzuPz18MtvTh69pfHeBJmKeRRcmpUOEFn0PTDXwoCC4Q12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1+cmURx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SAnees006530
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=; b=f1+cmURxwE7I3hZo
	XnCzpKbvRVGZOaw/EjpkGt11sm1MaA0EmbfPcbg704HmTDv3wIXLOEvsrdZYk8Ei
	ixrkP2Gp0Fdbj75GTOjYTWuViSDGtDncv9iphEwBkgmBJHuK4GynMBHuG/6FAgYQ
	LCDVuxuOKKewe73j6xCDEV5SvatZgecZHf6h63IEHKzqvaf0qHtvWX8tQuPgzXGw
	eMkaEkFO1QfS+PGGlINbngjnNkvtOKg9jPc0CmOOYq0/0Sjg8uXu8737S0kfbe5a
	Jji04dJGjc3mPqxLt/BPAUMLdAe0AdaQRWIasTWQoyIeBKpoGuNqa5gxsPhfZDpl
	gAPDiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9rspr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:02:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso64134585a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 07:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751119350; x=1751724150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=;
        b=k2ZfLbB4avZDVrxY78J0eEhJctAKL68so2TYwv80jbncCFBDhPTT3DXJ1hzROKKsMV
         7Md2agm40Juh/sbd2ep7MHskbbFT9iv03Mh0RJ0ySn+U8e3XiI8GLuRnXHLtFPzw92GB
         y2Z0/XYPpZwVVa0hJC+yDyUZUTZrFF1ZGA8yCDLlwbi5UMciJmWMdN/ZoO9IJ2JzRWJX
         FkR9UlMwyeEtQLse9E5O0hZBSj9PE9ZZEfhZ2O0b9bEVLqtCpjkTjqlY7sHz3Apx/0Mj
         ool+8Hb9SrThY9vWZqgXxoZ2ZEfpfLe7NXXX0X3s2QmhDhwaccQ3oEw6EMeKm6DtcsuY
         5n7A==
X-Gm-Message-State: AOJu0Yxl+jlZufOCEdnuyyA/HK1eu+0+ptYtNSTihIIKh9yIn280/AnH
	cjVmQI0mPJZTFxTjJeME9R73MJ+5bRD+Hb1u9CuRPsI6gABEzYRoIRYiP+eLzBAf+kqB9wibepd
	MKiV7VHjmE8aNt4ePxVK9sOL01+HdKdN6E6N5ml+aAsxKpGUilQZrWoJE5xdGHE0p+qSH
X-Gm-Gg: ASbGncsmvqzn2bkUv4Nn15gkRs1FEQEFYWG9Yj4OYTTan7Ufdcj2v/vCXLDcjX4lp+o
	cRVa0/6zoAOkyOYb5Zeu3cKYUFI3XOdkN5fZ0buHL3gtprbdYU+oyQCJidP9xWSJ0QYESiLW0NR
	G4SCUX8GJrK20zfcL2ITdCgKRHRVfBeyUhOmFHx4hmKlTMliLQxAcyHhsRYPs8WHgZrnQRQJCNn
	UaC34PH7wpDYifQ0+FeSuEVTV1btehwfxG7DjDlq7rAHfkuZDAVuxvKKXNl23mWmSRfJADES7+k
	icpFqnRVzrlG3M6ioyc3axJJPpFcCfIKJ/rD0UnFyD/GuBV+8nCa8yrpKFWRlaFk2mQa51piFkF
	neoU=
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr159329785a.9.1751119347055;
        Sat, 28 Jun 2025 07:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wuqAnLzb6/uFSg6oL9C//BE7uB/PxoedUfxOubcNg8iAM3IahQGLP9T9ZqdE0mT6FVoRNA==
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr159328085a.9.1751119346578;
        Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca0fdasm319419366b.147.2025.06.28.07.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Message-ID: <7b7c970f-f94c-4b38-9693-65f969b992b5@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:02:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfX7D+0e5j0RCTU
 LZsViSMTzF3rQpYJOq09N48aRm/9h9EqxNf7nwvZtiRwYZHJ/mWTst3TjXM1SezMWwCX4F2OP5k
 cpwwtL+6scXXOLrFIouza3h2jFTERWD6d8vyQas/BZLjSqf2vJaNT+rua6ig94NujDlb50kDgBb
 xq9+mms+sEWwWcFJtylZ7dw3gvpxEdGRuw9vnIZGO4IbE3ECoL85gg7y3DN4r8AvdnHmKt0Q758
 Dq6iGSPrfWAjzs9RF+T1FSRwUBZMSi/uAngXs8bEid/Qu2VJn4WWMDzNghLi5IcK+Ar72TYSk/6
 2R1QEQVcIXTOFPHEpnEUEDIkvqaPSNoMVi7puPZ3RbsnZzczgb1noBtTpQIYcHrYhiN7EuklIzI
 POo7fYLvi1G96k3PzqSXMA070aycJOmVBp2Y/p9PR2KoLjV3lyswBgukxOILF5Julpv5eMEv
X-Proofpoint-GUID: VOZJXQnghvUKaKeopmJfzC9iksVZJN6c
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=685ff5f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=fA9TbEmd_Wx33vs1QK8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VOZJXQnghvUKaKeopmJfzC9iksVZJN6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=745 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280117

On 6/28/25 5:02 AM, Dmitry Baryshkov wrote:
> Handle two cases for Adreno 7xx:
> - Adreno 702 follows A610 and A619 example and has clocks in the GPU
>   node.
> - Newer 7xx GPUs use a different pattern for the compatibles and did not
>   match currently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


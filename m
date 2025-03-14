Return-Path: <linux-arm-msm+bounces-51513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27073A61FDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60ED53AC815
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 22:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAE61C84C9;
	Fri, 14 Mar 2025 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv7Sh3+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68C1C245C
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741990117; cv=none; b=u1plHGeCBzMZ/ZbdinslVAIfD4K3mttGXjDAh5GO4nafna82buX2g9Pmwdiabng2uKo80q9hMCI5uVEmQRnZdJfZKuon7+ICmdx+aXQenCam42QmNXCR3xrLegQ5IBo2lWKS88ehOog/ES+fujq/H1N5Ur6KP81oyFDyg/hWDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741990117; c=relaxed/simple;
	bh=gwxABmgYRskBGGcXdPSEOoUwGSoADu5LQaEr7bCwsdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTdLnSWGBD/TiHO8RrYJfFx+9HMmNp6aDwNPOmoFUHpIe2Rio6g9ymEUWz9/PShb5PNlVw5v4OADHC5/M+QIWDMK9/ND4Zw2KTrD+zHPA8cYfEOHbZCN2OU8+9d4PBwt8wTEXT98KsnnChHuvk7mGNMNVcxq6Gpgjqri4D3yLZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv7Sh3+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EI3E5F026495
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuwgRurmVtMBmvvOLj3w9vZf+M7qrxQwJlt3f7s0ts8=; b=mv7Sh3+cP3okyvFF
	6jGVPI7t3fs3ihrZ4Zod6d19m30uBz0rySJGK7+DRnGUVhUOtlVPdI62NvDCKWNS
	KyB+AdnSpAH52PJZB4BGThuUB5vIAAjK+9hiM+TCadJXgpcvOa2qULDqeU5OF/Yx
	AuY+OXq7R6c0rjb7w7UvbOBV3mmUE1RYAxvQj5tiVBULMk0V492jKjrs/wDuhENi
	LWwzR1ISWEeqHZPAiLjiWph1WXXTnBOKepfktdf8kUyHvnagypu6ppH63tIYJYLJ
	V36vyGqmQq4JYTHqfBMDazfxjrVafjGUMDl3vGTBoxmcZVyJ3oALbzDN5uXyKZgz
	MPzKfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cgcda8re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:08:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e4546f8c47so8052876d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 15:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741990113; x=1742594913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuwgRurmVtMBmvvOLj3w9vZf+M7qrxQwJlt3f7s0ts8=;
        b=aLprKVoWABzVt+6PNuErxOohiAgifCL7jD8vu4EEd5LYQh7gQUBhInX1DGWKfZ+JOk
         /BpDFemx+uOPfNYLcErThMlnF5HJZMUOXzGhXvHybg1qXBRx9ZGjDTKIfIZZyvZQBxrp
         k1sThEQgbzRFPCcunRTQJYlT7LtzISBUvm1LHkRLSiUXqLiIhnHtitZBPmIK6sdldyxK
         j+ziZmMNklKa9BTrimeqoZmhCLGoFPdsXc0JnM0cCD0829XIgd3KW/qFrhxK2miDLCwj
         yAPWqcw1zyYqGuONKc5mNcNWRViuRa8G+TWtYfqLUQ7AaqQvorGNvWuJB3IwcLk7W98T
         AGUw==
X-Forwarded-Encrypted: i=1; AJvYcCXgHZi4FQF90dk+IGpD6YTQlx+h2JOSjAlhtWaf8Iu+S/a7d0G4BO9KawX5jp0oi75TsT2N4brKtqSijuVV@vger.kernel.org
X-Gm-Message-State: AOJu0YzIz0eiyW48aurVpi+OfL+LpSloTZvHvzOOVbNLRpegn6yZ57W/
	XTZ+m1yvIQgZayU0BJOJgwb9KDvW0tpB5eaMdqBYffgebYYjvL9o4t56aT/JkaPjeYtbHEXYpYt
	uvBkriA3T+SYe+b+ftBcZ1/Gl+8FGssqsskayrPrrWTIbvRiqQhbUObDxJ8gKbCyv
X-Gm-Gg: ASbGncsChln0yHtoE6sUE12csxmkw4qisLGJxsV4f2mdqwD8SZ6idnDgEMRhaBL7o7b
	Q5qWQd7htO88hsjKl+GEHg6S9jdOF7mE8t3B9xBSYaIKQ/Divc1WgjJvoCs3D3wByX71NfznGPc
	gDcqAmhUvHgSdiK5El+C2S0qWgk+tV4pm7iARAUXmKJtObLZd2bvFsii9n06cYcVSOsZQmT5Dl+
	WOvr3zeWLS08O6EdyhP/qamLAry1LxPuTAtCBPM/dhCjpsaZZxUOzM7G7fG+qiyLILL/3aA9akm
	6BODDqi6KiRbjf7hp5yzuo7bxjuVr/o5HUxwoxpO0HtnyHl6EZODu+Q95q7Sta0K1U5KLg==
X-Received: by 2002:a05:6214:e8d:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6eaeaaa0ca1mr20751986d6.6.1741990113598;
        Fri, 14 Mar 2025 15:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTYLhW3z7EdnBjx1RVyRwxYNeiYQoV/z78yiw1kmfY/RA7Dx/0r1LzHNoKRCiQmy1kGLpZUw==
X-Received: by 2002:a05:6214:e8d:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6eaeaaa0ca1mr20751746d6.6.1741990113232;
        Fri, 14 Mar 2025 15:08:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea4csm279191066b.33.2025.03.14.15.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:08:32 -0700 (PDT)
Message-ID: <3fe50417-67b3-40e2-9f64-cb3b9d5363f8@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:08:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add interconnect support to
 UFS
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UJjdHDfy c=1 sm=1 tr=0 ts=67d4a8e2 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 9qcj9OpScwno5JW45nojIZWsg-H5gI50
X-Proofpoint-GUID: 9qcj9OpScwno5JW45nojIZWsg-H5gI50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=691 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140171

On 3/14/25 10:17 AM, Luca Weiss wrote:
> Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


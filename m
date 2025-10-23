Return-Path: <linux-arm-msm+bounces-78451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F25BFF334
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AEA619C6E77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEA8261B64;
	Thu, 23 Oct 2025 04:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ+U1uLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA12580CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195561; cv=none; b=hRKYytoZOorMLBYT+vHmAMfYnI6farvR+rm/45RCJAZOIpG+MPbVj9TG/nebpbFjGo/jMQdNoHtTMGedlJoyyoEiVqELNaxoOJejP4nlt+m2EXGNlPMFx1jWWA2SKfBOqL7bgZo/D8oC/PaxJKVxVISG+nIXRk258WIN95oIv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195561; c=relaxed/simple;
	bh=SM9h3kuaENDN0+ivfV00f10xi80DzahDlkVNF7DAdBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/WDO5cYLbuGAdy0fOQJ/1tWStVn5a5TLYMrdsD4Uq5+H8CWXr2v1mGT7ghu6WpwyWp502kKBMuhQlst7qyC+fJuqR/HG0qDUDssT8AHobiLkNorYr5TizWj0jM0/9uHobGCvDOaMa8Dd9ujgOyu6g5kTPo86iQm1BMES1X94Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ+U1uLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIem0S007459
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQsBupsL/ZgYfSlapLK2m++RVhSfbnhRHhab9RRBi8E=; b=iQ+U1uLqYOp4Bu3s
	lJccRpzeSSbEFGG6YjQMr+6EpMj1ndegmHpI0LwFtUrfekBMj67QnC2Cxrx6Sf5P
	Zwcdh3t9u0VSQOtJ4m2X3uaRSJNTnUdITfFio2yrsFmgwpuIIxHzpaAED/sb33+V
	ehSlkH/g5RYfprMSNWkz9ay2vH4j5TjY52+2AISQgpZMeYrl1hP8HBgXcwNVKTuc
	yycoCkoYUJrYy78SBFaif0NsAfEJlcDE4XiqXugLxcigqX9iuD74uGbZauoW6GfY
	zVzQ3hDCWx7Pm1RFQxS+PfycskCOtZViHPHI/b915dJVrWtY9mJ9FyR/sIFtIZ/a
	Ry5Qbg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v34474bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:59:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2813879844cso1067955ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761195557; x=1761800357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQsBupsL/ZgYfSlapLK2m++RVhSfbnhRHhab9RRBi8E=;
        b=WOEFc8KXm0NuhRb8wxmUhgr3TQvxe//cROfcmZxQEaIcVZ6Sxo0lxC71mabZyMJ6H1
         AoOyDG5Tzft5aMvi+fOgn9Al9WyOOzz1GvmX5gKx3yfL3X4unstN5AVBy88Juok316cs
         Wd68va3FWX3Ygahvk24A9aGpXNgB2KDWyAATKVz3ZlgIUKGAyIXxx+z+xoMf9OsFa8hW
         HrS0FWfQfQJ2EIj5B23mBfgaWkEe6cc4LZxXrk5s0XBltLjEMZEacwkLQvdN4qcGNnxm
         z1yhajV45a7XRX+JP1Ou2oXdgQakiEZaHtHXHkCe4laUymq5fx3l7n4n1hd97wzfhhcr
         io2Q==
X-Gm-Message-State: AOJu0YweorrfY1+KGwcAUdaiyDl8c/5zS2lbjnfKM9VYMkdkKbbYxJmX
	RmaVyc2yhT+2rhv0XQUhYdlHR7bWKcgQ75JOzZTm+nZfYcCrXLgY23AP7uD/BMUbe8sGbmJLmKl
	zUYMj+W3Fjspeb9NshKlAT43fAw6gHUK8fzpf3QSiS9ypuqbYT7Cm7USLhCFZFj9khlMk
X-Gm-Gg: ASbGnct8XFK4R6P+1wJoTNHlH04STiNpFS0/4jQtHEFw5rdZRt2xE9hg6FFtmsYDYi4
	Zib/zWCU0KYO7TSFlq7fXQFGR7W3Y2aYx/j9srPIksSYA2a0i1RsCE25CiXCrNddjTXFwA27r4N
	iMDrxK67Nt40WdxrRekjllUKjxipcJnTaX25Sbw9vlZqNpG6z432z3sYYHzSweUKaYCFfZbjoen
	mH4e3X/IsQqkGLgY8Jib5yF+GFfR58dmZ+mnJ4n1vQfjUw91ui5/0Iw6gGCw7vH27iMW0FE42Rr
	0u5XyTjpoQDKcC3W86eaUFUcUUm95Ov1vhd7fS/ukunxi6XGv2mk2fhXEkGObycgBewpr8MSzhd
	eEULhG0HtONI+a4HICGWKflixiNotFgkbq+kQ5v5PdyCqwDgXZY2mqfz0CxpePQd4YfF9eQ==
X-Received: by 2002:a17:903:907:b0:26c:3c15:f780 with SMTP id d9443c01a7336-292d3fcc93amr66496665ad.8.1761195556921;
        Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUEUehRXXgzmp6ooEZeaoA5HTI7QxvGAGO0q2zfheB5V5ozk+j8iZVJGdKIenvQrC3QbtL8w==
X-Received: by 2002:a17:903:907:b0:26c:3c15:f780 with SMTP id d9443c01a7336-292d3fcc93amr66496355ad.8.1761195556486;
        Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f4283sm9389085ad.85.2025.10.22.21.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
Message-ID: <3050390c-3407-457f-b62c-7adee759a61f@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:59:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
 <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EW_6RHajG27oTYE8hsD8LtWT2hGQc-2g
X-Proofpoint-ORIG-GUID: EW_6RHajG27oTYE8hsD8LtWT2hGQc-2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX3N/E58pmNVOq
 cBPo/XQp8Qxxq9PRYlnZCRv8b5G76T+cpxt8clcvmIwoJvV37JbBlDwE7YKqS1DtmWzTLuR4Fdz
 3GwwyBqjr0DxesCmgPsSMPIIylgSqoG7FuikLJ1CuE2ookh8lvjaBq0sXh5AYJHDco/FXXImJdO
 s9XXU4oOKqAdMKVUVOrM8kkHO8pBWD6bFE9HZ9Drj9emaNrq68WC5+bl9I9uRUj+cFVM6cXi+lY
 /0zjQWoqELvc91CSnDPmEhJ+Z2mVqPYdM9xIjKCfc/3E5on6iQjHXpB0BmI7UFjT5fk6J34LLbM
 h/GE7aZ2ScmXWbbhex/jsPzxAK3l21jqxJTYdchVwpET0YTbVWJKS6Ox7E1STfA0aTJkChi8Y4I
 Jpb7wZ9dl21EFwkMeV77mhpuhmvT2w==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9b625 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y0hPKdM277UiO7HlCU4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023


On 10/22/2025 10:53 PM, Konrad Dybcio wrote:
> On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
> [...]
>
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dp0_out: endpoint {
> Ideally there should be a \n between the last property and
> the following subnode


Ok, will update.


> other than that
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


Return-Path: <linux-arm-msm+bounces-65693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAAAB0A89E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33B35A65FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7761C863B;
	Fri, 18 Jul 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkaTDaC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4B2E62DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856741; cv=none; b=kzIpdJUy9dxHiQlQxpl2AuGVoLMCuy5ohcRtdETJ1selvRHvYXFg0/7kZYKqrJhi5mA4ibfMpo4Rcw7fWF0+WIwAg8uxNjX8mZ0sxBB2HlnIuNO4uK3bg8w48ChsgLf7wNyYjrG6CHgCUeSky4cXx6TjO3jz9/jWGDPVibRJUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856741; c=relaxed/simple;
	bh=PKzM2OX2ycXMBs8dy8jvpWc4ZUaZPB/LY/5aZpqt0jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUxF4gy2b+04fMUIQOjl20fnTSGnLITTSAsFvGjsMQUURgy3szfNdPcnAUsYAU4DHqZG80pvVUbJpnt9lMuDzPJKPuPVQfNFEkbQcv7jpf2JX5QZT+RJBBMDd2McPuDr30hwpNRrt60M9BYaYzXAvf5RzmTj1N9MsuxoS1o7SOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkaTDaC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEFWTp032206
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaUEOpwnu6NxdO/qUIkj5n83QZNRBaNn9dV7MFSL2zs=; b=HkaTDaC6s/J/40P7
	90dDaK0citrZ2sFZ8Dh0gUceH91jRj3u85aOcQW8/9fKKsQaJtJC5LpKt4p+GjwN
	CfNshQ5eVawT7etZrQMv5r4NSqy4I6yR5YJMz7fxppoSXQmgoUoILqeHyLIlLOqC
	wr8plijnScugHjHSisURYR8D3cey3Fb15zgURWipnhdmuQiTG6txC4mJ86E/X72e
	XQXibIQFHJpXhQbg0zzwlydumlKFVg3GGnjrjEX9Bx9Zi+FJtJFOCSAjxZ7qGed2
	ELPeGtIZG0iLMhnunHLkUCUFKomYtlg243qNdheSxo61fs87Q/ywYb9NyXoaLKAK
	h/d30g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38cf15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:38:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1683660a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856738; x=1753461538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XaUEOpwnu6NxdO/qUIkj5n83QZNRBaNn9dV7MFSL2zs=;
        b=xTJcb5mA3B/3ha3VSdmf/VXPKc8Ir0EY1br904fKa10NYjmMKgwB9Cf7/rXp290A7K
         cJJujKD6U8mE5WbTZTdYLx3dyEo7CGXchayoaeYuc8oUXQ3Z9wU45DABXODoxCC5XYah
         6UvM+ftG0C1bmglpkcH2cN69za+m/9ZywG8oPQDe70S/T60DZnpPRf42WmxW8mwg9hzO
         6Ef7Szp37xWk2pj91k+aPiA6JCFVP8471gslPIdVgN1GN4PGYBDpXQLga+vv7+YKY8SF
         ccu6dzzJg/5hBfgtFmz2p6DPwM1r7Dqaya6tn9QMUo5bTdxrNnEQwhwa3W5P09H/0Kx3
         FlSw==
X-Forwarded-Encrypted: i=1; AJvYcCXDDGpPM08XGPmoh4zTR3TuV8cWexDYQ5s8DWDLdyHPGjt5/0Nu/Iux2enxuePz5YR2U346DDvkwNqbFoe/@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyEd/1+n4TwosAa7lLGf5a2BcPkJZP0I0BNDMmOXWjB3bQ/SE
	t+CUJqRVqi3pKGmvnHxHbxf+C9HMPSiCmli33NecjKsjrJB6njiGGQiAMBWnDXJbBCc+YNjtrLF
	+eZ7lMUA/IJxyxMeSNTkT8VsCzH7jtzkjOMxqPK87e7rvHe/XLDeIwwF+aumKg088Xawf
X-Gm-Gg: ASbGnctPfFyfvn0Sf5IOpgkeoihwuBIWv8wRQ41Md75go5lymePlLonh78nEUrsQaFG
	nfuf9qyOFrOptEZAcsJf4GcAjNZVOwxfyGxYcdFNkGFAl2ZZOG5CYnNdnrju+eY9qOvmm35lTP0
	IuHOcWh1kv7M4YNXvHza97gs26bk5mL21q2Nz8DH/MR065qZwZTLBBlk0Np6IW4WThW1bU87DbB
	ScjrJljQHtu+i3T0/xy5OYVY1tj2vpJOKF38dPwQVTIQY7POJB6Od8E7Mwf0MIYj9oVV/rTEhYt
	WA4qmHQSX77OW1DFE6oKPLReWRoQ0H0XTCHqHir1F9u1dcdNsrwDmsFifwoCUvnBp16B0RG0WAj
	WvPgDeWtxnNoXogY28c+S0Q==
X-Received: by 2002:a17:90b:3c09:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-31c9e6f7349mr16793137a91.11.1752856738030;
        Fri, 18 Jul 2025 09:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/f3rHzk4HPCgwLaXFm4dfM3m4MOQeIgsDbrovnS/sFrTTPhvP8QSgCYuhbvY+4m4y3AewIw==
X-Received: by 2002:a17:90b:3c09:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-31c9e6f7349mr16793103a91.11.1752856737571;
        Fri, 18 Jul 2025 09:38:57 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46ffdsm1573045a91.40.2025.07.18.09.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:38:57 -0700 (PDT)
Message-ID: <5bc7cf1e-edb6-4bf4-803c-f84d51fb1534@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:38:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <b8d6edef-6809-4166-b936-fd000513df90@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <b8d6edef-6809-4166-b936-fd000513df90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfX2QWnc9v0kgZ8
 abm8xNrrpK4d9Dq3W0OkqHwx54foD4Qax5jyn1E8GSG920aoppfs1af6tx1ak/Rmt0iKG/h2tYP
 vsQJvapIEH9Lg9WFnWxewI4MvbUilSGZktLmok4yBraFQ8bueIW/T02b7f5uSiCrzqz/HxMnaoB
 zsNUeQt+hXSpB3wxzBjAkWMDMSA9Z4TW+bpVLvZjHvDFQH2B8ypdOoVngIUgpQzmo6LsqyMeSO9
 X8wRXGfdEq76IbbMkHg1AMm8l/snKRAjWh1cnB65RP9HCZOggu/uikADZ8s7IqOqOAvIrGcDXMK
 CjN9QHmCKROtdRsL6XAgtZLwmf+jLDc89g9/iRr8CVKcyAWTEkc065kBmlEnWxfZ6YnGrCe7qlC
 0dAKVRACkpUEDaSDLr4kXZbDgdeahDETs3t4yRfFm2Yc6SYO+Ivcxy5EFvwvx+rGVkxd+QWg
X-Proofpoint-GUID: xcT73Grd7qHTNbh_cDeS2PNMw_1jAcxV
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a78a3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=bF9fvQb-GeUcl4pYUR4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xcT73Grd7qHTNbh_cDeS2PNMw_1jAcxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=759 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180130



On 7/17/2025 11:16 PM, Krzysztof Kozlowski wrote:
> On 18/07/2025 01:28, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add x1e80100 to the dp-controller bindings, fix the
>> displayport-controller reg bindings, and drop
>> assigned-clock-parents/assigned-clocks
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> 
> 
> That's not a correct tag really - drop the quotes. If this was added by
> b4, I think you might be using an older version.

Hi Krzysztof,

Thanks for the catch -- I'll upgrade b4.

BR,

Jessica Zhang

> 
> 
> Best regards,
> Krzysztof



Return-Path: <linux-arm-msm+bounces-66026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9EB0D59C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ACD61882C38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759052CCC1;
	Tue, 22 Jul 2025 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfCiDfZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82522DAFB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175775; cv=none; b=JN7Xgo+ztbHbi04OfD7rTO+wDbuH8Jm2j7reUDTlNcHgxr5pz9I5t09nuoBdklxOWDgM0oW8U09hYSH5xBFUeIm5fgPPQH8q6drbUKYe+BaXJdzSTsKW2OuHUMrB5I9Ba8Zp3kTAWs9OUf0I4wLUG5WEvBtp/iVCvhuCegBvetw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175775; c=relaxed/simple;
	bh=icZJvLbc5Y3gtDNnOnUYdJG68B28ldIEFPqTU/u9Rgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHN7+OFNoNh5LVnzQQnPC6h1ip1oOMocdC1Ke+oMWLwwrd8CEiYW+AOvDDAYvn2pdXC2zturiYIUruioGPP/pnzzk78oVcgqvSjRL1498/0XGkqsE76KDUFAXgZbgT7TajtLQAz1qGkE/tvAb52KmBzvhKYz3CSxumaAe9rubbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfCiDfZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M90BPE025565
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 09:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vj2qVmbFMaIyCB4fFcjZkvN3Nf3AmYPVWBGkIQJ88BQ=; b=hfCiDfZvIX5K1oa8
	ZKGwkG+iLpv25X/t+UGqea2KZQr1b1s+QNuuYavYNmOzcUWtA0ldyS+kVEo+JzVC
	uODsV03E18gS7vRZV2+Dl1QFWP8S8czhRHiyattAwdYqpDvFIgtIjdPaW2tSOso3
	ZVoDUNOTvWvRxIFC31Koif+uPiwSgBGVfa2b1aYY71OVnxEBa21lygIS2xH2n3R+
	xIrkwmTUh+Rneaae0QBuP49qwsEAKXUQ3QMCYBIzeD0SW5dlJ1dYVhl8xN7Jhl/j
	my6GdB3BuL5q/Xkjiw5bC9c4S01ykE6k2LPajI8P3xM/V/jCaQuYx5jIi91On/r5
	BWTC4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dgs2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 09:16:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33af599bcso828523885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753175772; x=1753780572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vj2qVmbFMaIyCB4fFcjZkvN3Nf3AmYPVWBGkIQJ88BQ=;
        b=tGqcMdzZsPDWfq0zI1/49hnxbu71QKzDNIHeLGof1syn1z3M8srdYohbo5Hr6WPRxb
         psdLOnuLoeNKa+8qGB3I3IVbBOzDLM1jFQGk+Gs8W1t2piOT3MXCXweLQ9OlI7JSz6Rc
         Le5P8U8TdL78Qo2Sr++5gqlBmcD0c3B59EpgHLEVYPwWl3AVEbpXyK2hqhNUDZrg2Zah
         9XUoQH50vmbexyCnHNCRRu5I/82XEptnd+WY8I6zj2TMBPdpGXIpuCsOAYySbjd1zPYj
         3xebLd92U1NP8i6x5ZVyL7Np3Yf2ARjjqH8lMwq+WgoF6Jj35WjYcdAJNqj6+5uyaBcZ
         8F/w==
X-Gm-Message-State: AOJu0Yy85pQTAVKZEaxapr/5TAWfK+crTl+4uwG1l2qAccvVMLp9o2s/
	ScWEcMyuRirFxGXBPIsJWoYYCgls24730oGOUtl9sta9L0UGta/gnsi7X6/94VgHvjb/TJEWTfy
	7rRYo8YjCiRa6M9c/EP7OtjTJ0YJv83lYKxNsQxe9puMHEfa+xegO2/4zz+8D78VTxPh0
X-Gm-Gg: ASbGncs9DkLbwS/8tIIc3modptWCyjf7HJF/2AguJCk92uSXipY/iO/WAzgVulrJYuC
	EQRpvVeucW3UkVoCd7ZssNNcJI7ruD3qHTfmkRJ+1qZxLkLvUMtE6yZSR1QhUKQektSuqImTs4s
	2UVQFRwimeOxdnSX1sHWLaJ+3BLlvhh6ESEaH/JgDJIbTGVwKRQfWNgzoz1hCYu3LFrfepz2I00
	1IYg8vsUotRjzkxacTxrg9Le1fPrt6+NfCmvoqU2zn+Lf7OJwSxRPIVyyQW3/Cm+7hwepqVEAgQ
	c3/2ggx2wk9z9YY9DAtrXXind8hSTTgQacBpRYOMRJGNx1lgeSk84mFY2c0n0D57nG0orLSQg9D
	u4MpN8i7pLeaXHl1wL/Rf/x0din2A7lQriMOS4+6nHNE=
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id af79cd13be357-7e34d8bfd12mr2927131285a.3.1753175771802;
        Tue, 22 Jul 2025 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSkMXJjSdY+QbXyPowudZre6Wg+1jtRGLZBt4d77vKPTpJ93H01at3Dm6Ol/RmdyOnjJl5Ew==
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id af79cd13be357-7e34d8bfd12mr2927127885a.3.1753175771347;
        Tue, 22 Jul 2025 02:16:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f? (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d91034sm1867648e87.144.2025.07.22.02.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 02:16:10 -0700 (PDT)
Message-ID: <5ec480ac-ee60-473d-83e6-c2f25d3d30d8@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 12:16:09 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
        quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-1-42b4037171f8@oss.qualcomm.com>
 <e15df8ba-f058-4eb2-919c-bc327290e66a@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e15df8ba-f058-4eb2-919c-bc327290e66a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f56dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=730OvTMgWo7gkawVqJEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cMKri1eZJ5SfGSg5cHixvB31N5zPM_qq
X-Proofpoint-ORIG-GUID: cMKri1eZJ5SfGSg5cHixvB31N5zPM_qq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3NiBTYWx0ZWRfX+Yz/p9mBrrOL
 1d/sRVGwG/ZheWjSz92w7BUa2gqtsFIm2yjqq1fzR1/wwu6xkiVZW3U+9SfwdgykkZEWOvxKaL8
 3gsLDElxelxq7aRG0EdtffSZUulthrYEjh2YdCh5YIX9f8CyWYB+mymKUNhuakXoIgEMUYktuR/
 EjEMc+7YxYa1BTgtcZFTCQzyGFo4cdfiTyjXC2fvvWVA1/EyXGPxl3MGJQSybe56CZXITz20SFY
 9y64xZg9zpFt4NmV9OkLcgMti49/siFonJ7RBEFKl8hL2ANqd/ARDhxFocb7wLlNovv7Vljcw/t
 YRFouWA9WN4o3IrzfV8WibUJe0BSM15reS6bLMUWvPFnlxbySW1TS5I29LNL316mJ0YJJWiiE4r
 PepzyxLkASteFFOfy8BmC/WvXC1HpVhMDzkx1HCDSw9/chEO2KZ5Pp5O1Mxzb9jgqrA9g+kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=969 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220076

On 22/07/2025 12:13, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
>> shared with SM6150, the compatible string qcom,sm6150-dp is used to
>> represent the DP controller on QCS615.
> 
> 
> No, you cannot use other SoC compatible for different one. Look at
> qcs615.dtsi and board DTS - there is nothing saying that this is the
> same die.

Please take another look, we even have renamed qcs615.dtsi to sm6150.dtsi

-- 
With best wishes
Dmitry


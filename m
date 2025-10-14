Return-Path: <linux-arm-msm+bounces-77103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C03BBD8032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E18A3BFEED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A1B30E85D;
	Tue, 14 Oct 2025 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYHdlgjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CF30E0DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428323; cv=none; b=glAgy9eg2Li5NiN1BzW+DfMiLE5126pWK0f1QGjw1XwGIv0dLrgxMNOnk35R6ZP6gKHs1UdCIx4h/TminGvckA3LIjXQdFu1Yx24eHskBC/MwxWQbXJOOIYC3SPqHCw0+mjfcsH1UTuKhe5bL0xqnVhZzI35/qW91sNzlOetfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428323; c=relaxed/simple;
	bh=qOlGTnjWC7S//4ct9mMhcN7fRfRzafEbye9A+w41OjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6QtPIYSndW7/DdUvVFnZFnuP6ORBN/xYTpNXQBzaiH9Fo8QvxFwg6zRDJg9VbeYimEndiXhZGb7RdzHgOHbxwoBL1cAkxAZKfF4fd8q/MQKffzo7lqA1wCt7rz52ES4RtQXFaO+EdflDowHWCVp/LxIYXR4O31OVxZSInmt/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYHdlgjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6WkHe012122
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0qtfAcbRRGVp6DETyBKrSN8epuMBuJtgVuS3PjeKqI=; b=lYHdlgjgVr3qv8Sr
	r9abvsgc3pQ4XkE88OpfoSkvoSxnwgnq3EQCFOEcict/bDXTXPhPhy/F7eBZAX4T
	MOJtDnXSS2rpptGgc7JVR+g78VVF6GlP9HJ/r9vuICrmV1t4TVgik8K9LEDa31YO
	D9710R0JAzZtGR6M3Dh/Fo43smDEkIzxezLPfyU88ZDZ7Egra4CuQbBwdb3Q/3gV
	IQb77YbMcpZHtAFiA/ToVXsPYzmLZMoDSadXFIVdgDwxo3EwxKMjT0h6zerz28Ah
	2Z4feieEebgzHTZRYwnvSyOViqF41zyByI0J8uwyiCHdHEU8JdrWZ9+eP53+Home
	wdgeEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5fnhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:51:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85696c12803so371900585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 00:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760428318; x=1761033118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0qtfAcbRRGVp6DETyBKrSN8epuMBuJtgVuS3PjeKqI=;
        b=roF+/H8HzMlxPWC93MN9x1swYzC1p7Jl5OJYAO0tkxa3anJVjeZYdKVC4h0Y/Wmuxo
         xTnHHyM/Y7e0RHeEYllRE/U9jT8RlAy6Gg2rpwUUAbmBWYGn9/hsR4toGHA6bclrEQDi
         UZ2Sin31lLC5bJSLWaZsEN0tOaxPm0BswoVCGt9sM+OX2H9rjFQR1L6c/knTgDo8mc5z
         ADFFkk8yU4nEfGUuFLg52V/LTKvcFin+lgNbrOQNcJ8jzYTKBcH8BHuS1doGQcy4Yao7
         nPcfaNEroRlXIXouBdHW5e/x1TBQU2KxsYM14yOPJOD4BH62f6E+1L+x6JXFjua2UOPv
         cLDg==
X-Forwarded-Encrypted: i=1; AJvYcCXwxHxR8ZERgq/lk3/y1PgstbfN5nIQAjlCbyEqTZV3WxFaKAMjPj/CxhMmqoPH4qYwlyXciBXR/HXcMA6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7//fM5rtghX2hsyAYzzovTpR9hs13HL57Jx+G+H3vBl5h11E
	P7YhD34iVwLdaNYLjo4spVBxRLo0DcXrasM/FecCe3YO4f0Mx55HAC6E987SZ1ANMrmuyPe5EVi
	kIKAkDytQwBGe/bHO7dl154bneTPIkg9AnG6RiPGsAaJf9CX9M9cdGAcVZY+MfiVvHY0V
X-Gm-Gg: ASbGncu5fUQ3SR5mLltQqo5pqiraoIsMQFxj2JitfsftPCY46iC31ohKsSbcnxzXBB9
	EmmE69mH82TJnC2KmkA0Sv8GYVSO34zpPcfpLBE3+9KwXVX4G+Dv2fSoz+ZuOnDbXYDZs960Rl+
	41Xc75km22obto2lm4lfNHLfYPHioEqlYj7iRVvoV8JW2oepbJYD/pXl4TBo4Gs7DaL69QhM5vB
	QWmQYR7CSZMjXytXkLgozW3O7q/1C5owV7L0qU4RD511qCjjhZ3GPesV6yzjZKL3vcEQkL6r8Y3
	5Np7nO3sMT1MBCqPxICMnkor36TlJGistPTxn4vVA5HYeZ9wpDnoeuoVeyKiPN+ckOY0M1Hn+Qb
	rM/YAOSvc/pbn69yQLpgZgA==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr2177175885a.8.1760428318106;
        Tue, 14 Oct 2025 00:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7dAVG2/lTAN89xViTE07+yt5E2ydVjSGhDeAoedXXt8eICGnDvQLJoPAGhJh54cblZhK0ow==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr2177173985a.8.1760428317632;
        Tue, 14 Oct 2025 00:51:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124b3sm1123874466b.55.2025.10.14.00.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 00:51:57 -0700 (PDT)
Message-ID: <98b2bd9a-19e2-44f5-bdf2-fdd8e6c31815@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, sudeep.holla@arm.com,
        cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.tipton@oss.qualcomm.com
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 920hZqOCjP_m4L5uDpHzJwukpHUJqXNs
X-Proofpoint-ORIG-GUID: 920hZqOCjP_m4L5uDpHzJwukpHUJqXNs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX8imvh8jjPksA
 Z2QDPHIh+Aj8yaeXTfCXQF1RNcGAU3eqlpJ1aFKZ0mDTm5gzRseafon1yKix/w+wws8DMoK2mNv
 oADc9Wp+Mh/Vvbej20Nh4vhf8CtmftSk+RN6Vs2jjQaad6UNuH6q/1icDLFJ5UK4duHJYJrbZLL
 fBXCB8ci44u6h8SnyW8zNqK0TezjsZxv3eCBn9J2O1JA07H0N+f/aeml2DRMmSAZ5dUMJQhuzJj
 M+QAAksxxfcdIMD3UrbaWkPPs7G33XQAaqdSRl7P320+0dYJhsndvgtiOfyqampePnNMlUOWuzR
 XcA3FEbiltESCSwA9+720MpFrwv7gCayv4L0TAvy52oE74zsQW/CcVu/JCfoqF5SSyKiJKM1H+U
 yHq60gDSgd0DAhQDpsERyoBdcbvqPA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee011f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yHBzqE6aYKRmK_OBsYIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On 10/14/25 9:34 AM, Vivek Aknurwar wrote:
> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> (next power of 2) to support these configurations.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <linux-arm-msm+bounces-62209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91570AE6592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D38E3A25B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3BC298CDD;
	Tue, 24 Jun 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJIz/amU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460C2980A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769618; cv=none; b=hUA8OGakoCMbXPWYobPodGWd6NueyxdUd56iibOtFRLOZ23vKblzX51vTZjB+ECsEkwazYhmxcFjk/vWHChgARLBXV6p2Gt3pbtZ4v/+2bNgH6BFPR+Z+ESp2c0GzfquPNK1Mcyn7rOcxnxT94ngm1jDMjslXSpURc0C+1XVwoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769618; c=relaxed/simple;
	bh=goi+JYdc8hX2nZ6r6/E6w6bG2TAS+Qvi9wp+yVs7mTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIVOr1ZmafCx5G/lVlKw4SLJ30i25W68jm47jpumZHCP7Hni37tqueFveaNdyqYR07F6GmhP4/6kjC0TAMUP1iZgT2b5Qmp/XTRE6IWwX/BEooWE4tcAo8qcjZCLiueCmdEnys5vFLOs763BBaPqmIwnA7S/rzlAXS+G4m8zX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJIz/amU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O84jWd021236
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/+Oz0dkYo1zBsxJyrMPTZE3tsWtgvUVNjRDnaW0KIE=; b=lJIz/amUFjS0TrRZ
	u3wiXr/pgY3UIxwtl7dqdkpeJJXL7mhZDFER4ufNRcQJBBsTZX0VXPOw13oxpK+D
	nxv0D0mz9QRPK0i7yAiQyJQY6vqgahLn7VyMRqkXcLOxfg9bh72aTkO1Z5QTSfhY
	eoaR1djt54VUPH2DruITojk5OhBOzlM+bckYLZQedGeDjOMzwQfcoFsZmauXin6D
	jFikalM7TdlD0Wyj8SeuV/YAaxCyK5FeUd+BwgCR5Ej1WRtxmokhvmA+Q/Lgn+hI
	FuS8CRscW+FOJutcWi8d2E8YtDMf987zzwf90oMAVBh+0vHrKArlCUCDhSt3+cNO
	saTQPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmnt43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:53:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a517ff0ebdso16078451cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 05:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769615; x=1751374415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/+Oz0dkYo1zBsxJyrMPTZE3tsWtgvUVNjRDnaW0KIE=;
        b=rU/Z+RHt8IZXJ0R8jAT6/cp+UEWe0RVVzOQs0ITgtEUgheVi29q4UMuSboreNCeXwL
         +FWkj8ptybKXr/hQs1Dv/iwpVyT6wpAIPGrMDmkg7dqtya9efsI1KKhFbfgDP7wrDAKD
         9avIeuI4KfQ0T0mIn0tNsc/VYG0y12ldxmh7LixsoEosRTl1UMeuL6yG3yqjvab0wlhR
         C4qQWoSJFoh0iIBPI8wwnIM6JC1ITxu6ZFwoYqNJXn6L3uIFtRQNivvP6HTEfI0g/Yjm
         GJD3MBn/YnX7BDEsy6pHLC9DFTwvjzzcC1iV+xRZkfNBS7W5ld86TjhulYL9SKqSjPTX
         CQmw==
X-Forwarded-Encrypted: i=1; AJvYcCXGppRjkc3nax8IkZmIE/+x2LqCmVrQFIJuMOQl1lyN5YHSl3gBs6YhQEkLEEAQRukXPhtxt94fMGQGKsm3@vger.kernel.org
X-Gm-Message-State: AOJu0YymZQxnxXSJTKsRbDhNcHA/F07W72RMowa0IqzX+P5zuVsqUW/R
	0LyYPrtTcPHIEqBiCHCZySGSyRn1+Ev0927WTMBU/du30shKpap/8Z61jqCyvxgQcg+kui5oFN4
	Hcjc+mckNz+71RfvFctk7LwEdEG5/edREbzFT4rDZlHexWMOjIUQWIN3gedJHbnTk4DFb
X-Gm-Gg: ASbGncuHADy7+B4297WGBiAAoXY3PljQVFPnFJF81cMxwyt8R6RJLbqLtb14naY3t3F
	Z69kWZr/0X5Dwbsc83ADuMlEABC15wCwCyHamo0KvIf/YhjkIMkzNY+l4SupjMSoQL6k14kHF/A
	EJRUw2erhvZbSWZoKMfPd81JZSwsWoxaUtssmlxneZHFumBkBdbvondH4+0ryMo0xpGQr6BtVNC
	D6U3t76yu7qO3cwJujoDeD54M7rOHUB1EfSIKOIXKVlkVFMZIimOvd4Fj+1lvXUc0OFcLFN7QOu
	HxLEYyrUonQrBL0leKJkjvihMI6J4cWP9a+8aVCpmvXc68JtnQA53uO7c7DinCgEu0i4Z2CYlFZ
	k6Ro=
X-Received: by 2002:a05:622a:6182:b0:4a6:fbd6:a191 with SMTP id d75a77b69052e-4a77a1ae861mr87818241cf.1.1750769615265;
        Tue, 24 Jun 2025 05:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsD3QcWc6S0AZNrpNBd+uIEeZjeiiG6NGMmKXQHsPOX3VXCP45konCfmawthc2DRqsam1pw==
X-Received: by 2002:a05:622a:6182:b0:4a6:fbd6:a191 with SMTP id d75a77b69052e-4a77a1ae861mr87817891cf.1.1750769614739;
        Tue, 24 Jun 2025 05:53:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a67a80a5sm151041266b.26.2025.06.24.05.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:34 -0700 (PDT)
Message-ID: <a9c012e4-40ab-49f4-a0b0-b4ebc4272153@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:53:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] firmware: qcom: scm: allow specifying quirks for
 QSEECOM implementations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
 <20250624-more-qseecom-v3-2-95205cd88cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-2-95205cd88cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ImfLuu8sioIGB44cF-lZFvNWodGmMD6B
X-Proofpoint-ORIG-GUID: ImfLuu8sioIGB44cF-lZFvNWodGmMD6B
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685a9fd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Xl6Gf3kKTQkptmOWZCMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwOCBTYWx0ZWRfX5JmBRcGKyO2T
 tkDNT0JRqyQTstuiCwA/y4q+pdyScP5DGl92C/mHb/dMqDu/OKZCN568Y0/H54cETWZPsJL0SXE
 XCHBGyyBA5jrCOl6/OQ/pLdCX8uGptPqsyvStKAtOp9UwjUiC42Ci7nO+MQG/5nvodQ9MH8Fv9K
 nlqTz8u0xvp4vNAlP7SVPNBg/X11rQy8suyz3b7vOob/y0qbuIQiobYPLGayJ+A5yLSh2cjjYGJ
 RZ8oa+ufsOzelpu0yX5teMhDd9pZzi6zOg/Wf0x3RyxycBQXEcPjRPJ8J96VblkvLmt8rsyN4Qj
 NDTfQYkSByqkVrY/hYYGfOyE9bol/GwFC3Bb3lrosvHnmVD4Rs4/SIbvjzLEPGeh9cM9DXv6cyx
 guzMTnjiAIDznh8RVHNmIV36v3Q+ohpfwdjp9iqsFcZiPPwfVFJcbxXiSmODwpaHd3hr0BYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=753 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240108

On 6/24/25 4:13 AM, Dmitry Baryshkov wrote:
> Some of QSEECOM implementations might need additional quirks (e.g. some
> of the platforms don't (yet) support read-write UEFI variables access).
> Pass the quirks to the QSEECOM driver and down to individual app
> drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


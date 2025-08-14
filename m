Return-Path: <linux-arm-msm+bounces-69184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0477CB260FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 242B04E5198
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D9C2E92C9;
	Thu, 14 Aug 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXNjPbtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191A2EAB91
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163762; cv=none; b=EEfSoevSt9bGRdMoUOCGw8Ke12y/ZFmsKNRLj8wqQ23aetkeU6b/3SomtbUjYUcdwdJau6M4q/uDa7sGyd2zs718M7wMvdF2M399J4HVTeKAEfMMnWtRoNjvhv2kLgWaBHV9t9OSrbm/X3YnxocZrifx3Pxa3rluknIogstxJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163762; c=relaxed/simple;
	bh=hmfMkqS6ana0u+EpKErIDoMyw51bTZi24YBu1Ydi3bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeoDtKxJbdkhrkxCRelyDJhZodl6qpb9s3/LCzVwVpC/4TgHkKn0sUs879pgX0uaCYA54Tv0mneRfH7lfRQf1bSRGiDVEnVR16bYKKo3UTSrYm1Mgn+PT1QBaYrnOGycHg9WoX1uXbHWOUiYUDAZ9kzPPVPBIQ0ti3Hwi2pX1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXNjPbtC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8uqKW012985
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fk8nJ1U4NK4Cq47g1680MH6eNs+TxYDcB6S39IrWtnQ=; b=PXNjPbtC0+ZaKsqf
	iqfflzYteWLXdyvnk16p25vqLncF302dXFfw0euC8CdGmGKWclLanuyT+Hsg+r8e
	mT2e0paHcOAh0zG7yVKnKiy3W5pQqHDbGiFZtC/eJD0a44vS7FIKppP8JoQQ8RIq
	JWHGLYP7LqaMdgBIpO3YC4+e1IZ+ybSqO0jHbyrX+kT/BYnywIaXNlf7Hj36UkHk
	PdyaU5VYaPo1DbIek+etbkkWuhFNrpL2fiUwy2VTPgIM9W3gaAGsmBbhdfZX6Z4u
	fOH1Uy+xn58uaTtKZV+CFUVDjQiUcXAGPenp2XnHViJUEABKxFFRrMH2cuY/fxPY
	v2oGog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6u0ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:29:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10991e9c3so1711391cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163759; x=1755768559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fk8nJ1U4NK4Cq47g1680MH6eNs+TxYDcB6S39IrWtnQ=;
        b=PDfS3FwPpT+DLFNQSY8icp2pb9zn2G0XrWLT8UqHo0339HND3UlppgkTQRE5ZfSa7R
         JMrE2Fo6VwOtJSPvfNOl0/AXFBGbnbUtAiTqnOC3572ZJjHksvfwiLfSQL7UOVi6EvMR
         qasdgCWIRVC+8wHAAYXgks2Ruq7zsaqfgJuDf/iDby8V88USui45GTTHCWe12b0Iv6Wh
         A66ede8jtmDo8hvQpr7vuB5iTZOlSplG8XJwWG5CYm7jd3m6hgaM17dO2V+bQML9l7md
         pxJaUJSCuWOafIAec+DY9MbDAIuBawShDk7tifYbPgs8a04sW+PhChbghot8GjGDGzZK
         z7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVcHMF1MwWtIgH8FI/1qCYKlySTAA5O9sXxu9ghDqs6K6m8UtTqTCybY2gOspmFcL1oC5J3oUgtIKPj7yXM@vger.kernel.org
X-Gm-Message-State: AOJu0YwoijvB0lENyfjhkH+D4RJrDg212mUVBTM2YOiJgsrIqzpEg+Wd
	t+PwSy6/hxR9e3xghHjtFgQ0T3h9pzF3LNou/zWuI3aRxTfLTb81WfN+JR8Zc31FlpBI9EMyoLN
	gTMOCG5oBy4hG1AX37rdfPkjULg3X5NJBo8YB40Ur7kC8nKxrSmclLBQtUP4aV0ETS6tUHsZ9oj
	2L
X-Gm-Gg: ASbGncu4bLsopgY/IIVAfDgnAJcZeYgKbpZTSRlYBcETt0pWC9zyEWprw+uMDJRV/7m
	sCOBvzUPh4hiXwWWOwkjWNFx8wN4swOUMAlTeKcKh68xtSSRauj0hjivqcfcwY+nSuxuwAWIeBj
	fhzXOWQtQkfdz5kn8rnHezmVtVZqLOT0E/2uCt0R6f3itbx1U+gTusvyXBhvcaY2oYrf25aQ+Po
	ivVDO/LRXBYMu64tNYznvFUJvKT8cdZQ4rDlKaI6w+L/T8E+YbD5fMg+ZeiKbfwRkAZrVh3TLK6
	HASI5XAwqzT0DJ2m/mlKzGmg/vNDecmIC1W7QigWhK0Tr8IboZroO7NcGy4+2pdEbF7911NSo0J
	QMXmN2W7fATPOPzpTDw==
X-Received: by 2002:ac8:7f44:0:b0:4ae:f8d8:b0fb with SMTP id d75a77b69052e-4b10aa20816mr14365031cf.5.1755163759403;
        Thu, 14 Aug 2025 02:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoUkspxZxE88fQ6qSXjIdAljwmvy0iwKdluYs2HX9M4nASHP+BgW5vGIwCkTyXEfvxEYXJoQ==
X-Received: by 2002:ac8:7f44:0:b0:4ae:f8d8:b0fb with SMTP id d75a77b69052e-4b10aa20816mr14364911cf.5.1755163758949;
        Thu, 14 Aug 2025 02:29:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3cecsm2549508666b.53.2025.08.14.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:29:18 -0700 (PDT)
Message-ID: <e67ec1b9-6e70-4270-8f19-1a29713a124c@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:29:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] soc: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-19-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813161517.4746-19-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX9XkIrCHPhzrh
 FxgRdAFce2VWmjb+O2VUwh+VjZAB7S9sxweKTfIlIeDkZCifT8aSTV+ZmN9OpEWOPKd6KXIrVcL
 DazGAisorM+8J8/qkLeyqSsaibWEK2IjajzINOn1RTCPEbmluu5KvgDPhJAo0KYNKMXJ3SVTGov
 6vgYRjjmgND1cr1kt2vKpn5zI4o+ki0PHq9TaYXFqnh5bWWJYFimvXoSwc7Yu//jrZL1s8oOItm
 BZYPmK+04IzfztLV7JRqau1mxkwoZDtwMfYZqcXc1JcMkJ8J3nukNj5h8QzJiXzeVNDGx2r9E+D
 MQ/JRXqSDZqHFQxRmRWIFX0UleJcjoOr0FTbDF9iPRyl+w142QcjYgMCa8jDL+WEFBRQssgN/J8
 7tIwdIuR
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689dac71 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8
 a=XH_MJYJbSeHrvvoHTBwA:9 a=QEXdDO2ut3YA:10 a=xtd0hNyKXt8A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: UZHVj27MdrDay4_Q2uC4O7pIG_GjVYlI
X-Proofpoint-ORIG-GUID: UZHVj27MdrDay4_Q2uC4O7pIG_GjVYlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On 8/13/25 6:15 PM, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


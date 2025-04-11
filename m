Return-Path: <linux-arm-msm+bounces-53971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34ACA8585F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A4B8C2A44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA5A28FFFB;
	Fri, 11 Apr 2025 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moQeEa2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF28E1E5B72
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364943; cv=none; b=AxNBvZQpCJmqGgv+o1WoA4PXnc04Patc3TncvkncRWOmAIrbZwwXSl8vB2W79ygZAzYA/WlY2hhbMIxJY5v5Eqr/6Io6Sufq2RSZuK/egjXe7vhnoAJ4ohg8UQzo0bKeDVChwXhVQD0Qu4On2myjfKW0H5n8fthHXMdIhAM6hYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364943; c=relaxed/simple;
	bh=1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkAkXWFaFFlEoZXd2nyCeiZ9nH4QH4+5Kwe1TNIoIFysuMtm8whjMkciu6WO9WVx/FLXH2DZGEcGeXqefqkiKcBDh0iV04MihNIQon2wGEdXW53EsdFwuoyBTI1El0Er0J3St90V633csgwHkNhbA2seWxLZOr4/zVkWeE52k/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moQeEa2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B21LKl007233
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=; b=moQeEa2ISOojle/w
	/JoZ35u9aMiF2+p6HCZg34oGywaDgM3UO6AYsquLopCnm2ii7ww9VjjFFP+6ILWf
	1yWC6q24vXnxgxjQ1HdvUSFoWoMniTAKXLQenjw3n+7B179Zujl5ABxIQyNZBvHb
	FKsuGrlN+HAxQlaw9WhDATIC8yFlE1WrvzrFhOIxeJPBFk1+N7b/Hh0Tx7XroHrt
	SzmGACtbeVq9MutycP4bCOvwBrAn6juwgncxGlsrsd8v1kw8I9zFRB1wfSPpFPXM
	vnrVnTPxtVCU7Y2iXQ2nubr2mOfGdAswvuYdVe6buWL2r7RW3LegenEu7yxad+sW
	5DrE+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3jyhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:49:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54734292aso46256585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 02:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364939; x=1744969739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=;
        b=g1+SrgH3rJLcPgWohtKzuu2zb8Bzkkno5NL0gKPPA+B7/UtwCF9h5KEniVtbXgBMAi
         APfZRjYWKbATd/bpNSfqT4qzpM/CDwR0cWrQoH7T7bJij02Ew+RZZh0sIIsj1YYLWKGH
         1n4g/tssEGQ8iMa71z/90XUtXHQwLNWaGEJO98+HnDjKEvud6t6/21EwB0kRJJQ6xy+m
         qYF2K5kKZqNRAdTR9Z61YZffpalqo7FeYgMS+HRaxEWtjizEIsA74gStHKW0IBRegOgf
         x3xbaxRyUWSr4AOR2k7XRFnmZKbob7cKfO2gkXhyx1HRpjzaHgNAuDrE04gLiPpgVm/5
         0cjg==
X-Forwarded-Encrypted: i=1; AJvYcCUqqWBqbWmO5l+2lYaEdfHsH6t5E3PDiD7pUwC28YNoFC/Lrb44nZCo4KJmcASR0IriRH2pTXXK9htIrWka@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2zehT6MgN9Rd6OcXBrwZzGyalUiA9C3ILLTxZK0J0Hq9Mo4T
	kJOf+i00Ekj9LXjNU2uKbAVpLk56OcxyV/GItFnrP9q1gAfagQGGLnzrZu1S34CvC9R3U2a4iAl
	bqrthUq4wO815eRezlqy8hoe2u3Ik38xWonkHsWKuKPXxJMJlVcKPm96MK1gpn09c
X-Gm-Gg: ASbGncsc1uRk6Wxx5Nz1kzz8/yrDWKmuzgu3qv/rDnYOLmttY/PZie49lBQXewVxfey
	3vQ6eIJw7/Kmearq9OEfkbFITbxk7jx3ColJFcNdiP9aTOOtf1rFsBZ5vIMvXzZxmRx9BCfZzVK
	rB5Z9w5OwCspd3BzGK4p0FQkDgPtHmoQjqinL51QaIxPC0EuaKxpHVZrtFFUM8Be4MRN2Cykk3W
	9DoUNAThWlUfRr+t2SA/yKLF39vLqM6Qv67OVKzZKEezkxAB4UVNn8xlmvLAO3W9GyFlnHuyrZu
	EkfzetaiBFL/jdW0cHVVSuyg0w5TlgQvzaaznJh51n0jFzdgf/jNTJqy4mkPjtlm/Q==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c7af04c112mr120741685a.0.1744364939615;
        Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9uldhSMjj77tDXI8Od9HS0eE+YcyHVF3EP8I1eSD53hf5eI36oThMUSZZTFoT4LlFjZitIQ==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c7af04c112mr120739985a.0.1744364939225;
        Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4204sm415022866b.116.2025.04.11.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:48:58 -0700 (PDT)
Message-ID: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8e58c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ur0lq8UJKF3ET7YIcuwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7kj0pStzrziYXxJBAmNNBXI3k-JDRcCk
X-Proofpoint-ORIG-GUID: 7kj0pStzrziYXxJBAmNNBXI3k-JDRcCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=805 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110060

On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>> SMEM allows the OS to retrieve information about the DDR memory.
>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>
>>> This series introduces an API to retrieve that value, uses it in the
>>> aforementioned programming sequences and exposes available DDR
>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>> information can be exposed in the future, as needed.
>>
>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>
>> - SM6115, SM6350, SM6375 (13 vs 14)

SM6350 has INFO_V3
SM6375 has INFO_V3_WITH_14_FREQS

>> - SC8180X (15 vs 16)

So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
the HBB value.. Need to add some more sanity checks there.

Maybe I can think up some fallback logic based on the DDR type reported.

>> - QCM2290 (14 vs 15)

I don't have one on hand, could you please give it a go on your RB1?
I would assume both it and SM6115 also provide v3 though..

Konrad


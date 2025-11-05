Return-Path: <linux-arm-msm+bounces-80432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 526CDC34FFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 11:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1AB0460BAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5A0309EF3;
	Wed,  5 Nov 2025 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVM+/AcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEESVtnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591FF2E7197
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336696; cv=none; b=dDbfrg0CG21NUKJnxWvopH2A/yyRwQiGDuty3LWqkv2ZQr6NVG4xZnSYWnznFkzJbATFZ88N/IaaYUjDilnCRUTbV4/mPP9+iNjMO3CtDL5mfAYXWtLlQsTEo1/kpM3suNQu2smVN6tdKYaJEY/Ab01h+aVb7nJciM/NJCoa31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336696; c=relaxed/simple;
	bh=l65yTJy8J6XfbbvB0kxV5KeXip9+LRJ3AO3oR1KV/ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPUebiLLqqx/NsqhUzzEuwk9y0W0mcXv5NOd1YClBj2/drQ9NxsWlUsWAd7k0etGZjENtXR+mxSyBmoPJKv0fLeWe7gNAhkusd2Nds6D6leytYR9QNSfF0Pf4ialh4xRLkThN4NmDK3jbPUg2eqm9+R43GJs3PIqZafpz1v7Dhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVM+/AcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEESVtnx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57xTC33165840
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUOMVZZcOe+DXfQDl4qHtAFVJnxyacvakGsOH8ELEYQ=; b=HVM+/AcQr/yq7/zr
	rJ9o5dO4fsw53NoPDeGvmPRP3zqPaillRwiMiIuufws6/ibYXGfEBuYcJua9XwJG
	lSrZg/V8NvxkcjJARQmYmXAQ52tElp6wbjwgcLdrC5F1BHtxlD7VM8VNemR5YO6c
	DdFrmBDyTDALHPNeApv3DJfgiJVDoWecL9EdqjxnE0ABws6Yf/nkA4ta13P+9+Va
	4Vy2g1Ku5ppXvjLAkpbbXRQ5clGzGVkL+YiAwYtevjhcbxuM1HpTidbko1AgFR+Y
	umxPlem7kIzOBaeKyrhzQf62cyq1BROtegBQHXBrMz9Vqjl2ID27G11AsWpFr+Cy
	rdHw9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ketk61p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:58:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295ac7012acso11946505ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762336693; x=1762941493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUOMVZZcOe+DXfQDl4qHtAFVJnxyacvakGsOH8ELEYQ=;
        b=ZEESVtnxAh6GyQNdWFqRGgkI4rAF2yf4IDwKnTDFPOSQNd8iIvj7n6ESWllTbW8Gmb
         0StTmPPciBiHbz4Xtqci4Q+BtTm43iGqNy4hxgFXbIUozhL1KTW1M5yk5pcOhYT5yaFa
         O/C1SDIPWcbOW4ZLxMtBwv0uj4hCioapqggtovTaZcNBxCIXG9sVZHVYO4kkeG+xTwrW
         B5iG5YnF9SMliSrKW8yixQA8AQKwzHTl2Pt0VkyfGRHlXSiHHyiU/Kr/n/bYWmyUkJ/b
         SvrA7JPUzcOr4iTS1wx4Js6ct7lEjSEzzdzsy3C4gKVh/ld2IeW3faDWbVnnfST+nc2c
         i8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336693; x=1762941493;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUOMVZZcOe+DXfQDl4qHtAFVJnxyacvakGsOH8ELEYQ=;
        b=guTgucuo2OwaFGJU3f8MCEbGqwYUgzXobcH48CP5kIQjll6CBsE67QdQkrFaOMkatm
         Fp0vplOg7uql6bzB6PXWZSagDHNJM2yz5O+SjfsJUXDFsWyFV4kHh0k+HTcWCfGyCOUh
         PK08telkFDMBIkPiPe0mCfzCD4Kxqy5fvOno/IUckQUNDjaws3aeCdnvii0BoElKoEID
         C0kiO9P036kSFhdkFi8zkZDeuooo0D1hO6ShEVjyNJ1BWgPpJ06Q8z6+PwHQo4iLY2Sd
         tAwBSiuW1RweGHJYtViliGmu5Bwr5koZ5g0v3DJ4KXtW/vF6MhamDacLsR4dRWJO+sAW
         AVCQ==
X-Gm-Message-State: AOJu0YzpuI7cPJhnYoo0ZtRKFH9heXtsc/FTZpphACORe3PbJKxdC0na
	qkISlNJGbFxqVjoR1wsgdVaSN6Y+6mA+umg9MiRtKFYdJoTYf7kaTouk6remj2kRbGjj/Pnj45W
	v4eHqY1V3Foqd2mrJsaJx17oO6VoKVaLuiCsZv6N2IgTM6HogvfchvkQ2iGfK8f7+MJj2
X-Gm-Gg: ASbGncu7B/DyIVbbS50vVz6ijFfFju9Ixr/Fn48MS6a0IUHXymsKsIKl1kYXaz2E4je
	q3hPn9lluybTvg+c7E7maMPPbcP5CBepWy8ojl7aZPV3Xz90pWEhZHqwPAG6AoVUH17i2YWVqc5
	MGfqTmNnVljDUyKBWhMUTKMINCbuUTXKFS7VOdBuj83imnrE21AlvnJkC6DYuuoMLX9u9oQh1SM
	se6rXquhAJM/dgAtMEuTgoXBKSo92l4tOjWfmKgFYx3V8OMTPoewc4QR4bRg0Lz2gmnTz34QQF1
	cTRiCezC/bSzz2PvG+9QgrpCu3cPO0TXd8Dx4VwHEeqtH2Zw4AA2zOFAOeRKAwX89VKROj95Ehy
	tYgSJg6dyd4i44hI+eFSNY7ehLpEWw6iWbvBRiywzqRxH+BiCusOFQjSr+KKHYU+QLg==
X-Received: by 2002:a17:902:ec8b:b0:290:ccf2:9371 with SMTP id d9443c01a7336-2962accebb9mr23577875ad.0.1762336693241;
        Wed, 05 Nov 2025 01:58:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY7SGw7vKFDRZ8wK5dt7kmgnjUfTG7p6WLL+8hbX98V746oxdTtiwFEDeGrwEoFrtfUnLy5A==
X-Received: by 2002:a17:902:ec8b:b0:290:ccf2:9371 with SMTP id d9443c01a7336-2962accebb9mr23577645ad.0.1762336692648;
        Wed, 05 Nov 2025 01:58:12 -0800 (PST)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a3a2edsm54677395ad.67.2025.11.05.01.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:58:11 -0800 (PST)
Message-ID: <664b05a6-2f03-41a5-b6d0-e7b5e0b23b9b@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 17:58:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: dma: qcom-bam: Document crypto v6 BAM
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
References: <20250924-knp-bam-v1-0-c991273ddf63@oss.qualcomm.com>
 <20250924-knp-bam-v1-1-c991273ddf63@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250924-knp-bam-v1-1-c991273ddf63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3MyBTYWx0ZWRfX2ytGoBAQ8oIH
 hj4FIVoa/BCXY5YvD+hXtxvPeQMySocJZrVC2rBQC2DOZ1tzfVY7Lf1eL3wi3jQEUKScQb8MUMh
 Wh09sL1IGEGPIAKtVSUSYBdi5Q2Vx26s5+orUrHOyTwfMdRz/NivgUkhzLincan6gLfbaVTti3E
 l/VqCJxFBufIO2Ry0Ee/mwgpMqkY8k3Jpj6mCtGo1/iB5+CDAHR66VOU/P0/ynckLlVLv1qAzPa
 r3roCIa0VZ+phq6iMmEnP2O2+43i/K5l42V94SStqEgI59BjCCLs+R13876kKDZQ9rrNWHwxgSq
 un1YB5PTAX22O0IsrTma6ty7////g3xQoKVPhL4M+o6tfgLf7mdgX0hXdb5DdtSfV10UnNvyZEA
 6+lou1in+Qlk81G7FF2N9B4ONO3R/A==
X-Proofpoint-GUID: mMKTMUNFwUqQ9ygPd03UyNmp6E9vEn6f
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690b1fb6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=x43bjszu3we8RisWIrMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: mMKTMUNFwUqQ9ygPd03UyNmp6E9vEn6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050073

On 9/25/2025 7:39 AM, Jingyi Wang wrote:
> From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> 
> Document the new BAM compatible which is used by
> QCE (Qualcomm Crypto Engine) versions 6 and above.
> 
> Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> index 6493a6968bb4..4e5b6675af7c 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> @@ -17,6 +17,8 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          # Kaanapali
> +          - qcom,bam-crypto-v6

Is there a specific reason for changing the name format to include
“crypto” here?
It seems the previous format was something like qcom,bam-v6.0.0.
If we ever need to update to something like qcom,bam-v6.x.0, we wouldn’t
require a special renaming format just for bam-v6.

>            # APQ8064, IPQ8064 and MSM8960
>            - qcom,bam-v1.3.0
>            # MSM8974, APQ8074 and APQ8084
> 


-- 
Thx and BRs,
Aiqun(Maria) Yu


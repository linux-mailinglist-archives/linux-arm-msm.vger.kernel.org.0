Return-Path: <linux-arm-msm+bounces-53977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D585AA858D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E5A1898148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933B92BE7C4;
	Fri, 11 Apr 2025 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhrN2Tf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D062BE7A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365715; cv=none; b=E74NPGSTyHWddlmu8ZKK/ENDUlvt7ca8xRpfFlm0XmLG2mE6lSOd8vhusp/sQUCG72cZ0rPqN7tHrHzzGqtZ+vF+kgdLBQ6aP9QgVAzFrcxVVgF6+8IWeHNAcs/pPnGzXboZ03LvQZyVeDos5ZgTEr+Z6182abtkbc5jffLByq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365715; c=relaxed/simple;
	bh=wgUljy19hnRNr8ZDImG9+dtUI37oYH5FJgi3lFZ7DlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpasIZwRBazPuH+o4fV9H4XarBO9JMDggT1nu5GoE00/0p7J3GPp10MRHkUsFag8sEH/+tNa/QcdamxDqbwyA2rwLdvOwqRRgwbfcy+96B4a+kKvh/5FwDL+CY4seoiq6wZbgwx345eCgdDG5n/symqwfEBM3vGB0wDTf7gW+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhrN2Tf7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5X48o019634
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSoTVp2S/VYJN3XymStKcEZsPCfLWwow1kwx9gRcxUI=; b=hhrN2Tf7aScDk6ps
	pMvAl4oBoWH40jHKjqP1ChoRZQ3uViR15N66SuRrXL3Ts/26Lc8MMa64laVcr+ta
	gSHUzTvh7Asr1TT7VnmTTV/oJF902IzkWZUnrZWvBLnR1lClBD1VSSqypQ7xhG88
	os30YWY+5YRu0MmfAqG7ZORUxQh1oMgZvIU43txwW+XpNzGKiuamegOdLm3xZgMH
	SJYcRRR/OrUYAfTFcL5ltBcCdU1xq938VvPjgxVkOUN3ZINX5Vo8vxfxk8EdRnYv
	M9RshCqoMqf0DjZ9AzqJbIisjYAnGmI2z2weXHts6qmsAzgYdla0I1bfAQNjj3aO
	k+pdvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrt5dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:01:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so38980385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365711; x=1744970511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSoTVp2S/VYJN3XymStKcEZsPCfLWwow1kwx9gRcxUI=;
        b=xM80kfA0sQvif4kUVGQee1Kt70/BGBfGobfUfEgLCe4o+ikg6lp+picCBY50vTtLD4
         5cSkxcBzZY8rgyvJHLCNwFI4sF7LvJH22gX7l6GDhy0LbClZjNlzyXLClm5OPHfBJL1P
         odPbV0Gcs8xWmPZpLLF7GNSof/QTpUkJFmsiX9WQh3N8IRf4bQgijsqW45pS/pEEtWj9
         anTq2PQ5WYhmauzDsxqJe4IQrh4AuFNJyBnWn8cnWWx6Jw+AJSTGFMU06VFm2oEPqFSP
         LkY49C/jzHi1dKqEaweLEYYzL0tp1Bgto8hJgw5ZxEJU8Zn9u9lwHPJ6e5bCb5dVdZZQ
         /0JQ==
X-Gm-Message-State: AOJu0Yzz1yuY5kvD5Vsu2Wym0IwCgQBMys0z9W8mE5negg5xNTQP/qzx
	UBMRnUqzQgMuAXu2zU10s0nFevmOtqVWeQaLz1nGOrBNg/IvMrR1Mjp+6hCNbdmesEumZ9oewz4
	CEJ84DdmrsFuI52z/pkBhfS+HFhzfAOZDe9dyfy0WWzL6677Xh3okz13fNR8ZMckb
X-Gm-Gg: ASbGnctFAJJwQ9NBvOMJ4aSIDvbkSifnLCnSqPGeLTX2bUO4JnGT9r9KYFCYIaetEqY
	CY9qRdvNT7Fips+BSJkJr+0v/Ue4Ts70Y6+0lj+lyN1eiTH8nCyr1QNus+pcVBl/mLF0FsULKOt
	A06vbSKqTMpwVbsy2IKjCgx7DcMxRJz7fMmwf9O9K3TCYdhRdQ7esR/4zrcCCUsXWRZnjdfbnOc
	PwjQDNce3jdh2B68EDWU0hvLkHxQiySd/lVGQHqwICEO0laaSQHlp9ncpyiyH3U0ABmFcbXRxYr
	CQuHVYDLSdnlDVjo/99HjU2nNUAxmE7FVi3QaqSt6wha7hVu9utWwrhq3a/FaiTqig==
X-Received: by 2002:a05:620a:2806:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c7af1ccb80mr103665585a.12.1744365711396;
        Fri, 11 Apr 2025 03:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGofGcepn/RGsMZLKQQY5oS/V52iksVU2RCQiBQQZDbCSNXMEaGLEUkxdxGG5ZVFaRTxXOV8w==
X-Received: by 2002:a05:620a:2806:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c7af1ccb80mr103663685a.12.1744365710984;
        Fri, 11 Apr 2025 03:01:50 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be8eebsm409211766b.40.2025.04.11.03.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:01:50 -0700 (PDT)
Message-ID: <a730e112-b3c8-46a1-a9d7-186d22a2479f@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add support for new fields in
 revision 22
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
 <20250411095025.4067964-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250411095025.4067964-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gqRTJ17PkIbBYjI0-H5-HOFjbokgB9Tc
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8e890 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pPKmUzXJjBbFbCUHgUMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gqRTJ17PkIbBYjI0-H5-HOFjbokgB9Tc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110062

On 4/11/25 11:50 AM, Mukesh Ojha wrote:
> Add the ncluster_cores_array_offset field with socinfo structure
> revision 22 which specifies no of cores present in each cluster.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

So with all three of your patches, you neither introduce a user for them,
nor even expose them in debugfs.

Please definitely add the latter, and let's talk about the former.

What's 'subpart feture'?
How should we interpret the value added in patch 1? Does it expose the
higher temperature threshold in degrees, or do we need to add some hardcoded
variants for each platform separately?

Konrad


Return-Path: <linux-arm-msm+bounces-48522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F3A3C264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C43791703F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72031F2B88;
	Wed, 19 Feb 2025 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRjEBzTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A361EB195
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976166; cv=none; b=tiJQYX2i7tPj7z4phJU/Bu11f1N8YuslC5RdgwPd71+xQtjLrifUvTB4I5sOtu7Fkh8s6JbapilTQck9BSJcBsfK7VBkJx4glw3Cy/TucMVsJzoAmRLasKI1Omgz/Cd02nOzXDQ0KUpnjyOj1cnt3uFBx0EicDB/4RVRaX8i+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976166; c=relaxed/simple;
	bh=2/cg0CLMQpDd2SRP2VcBmhFX4ih79DdQEz7YxZKjcJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rV6gRT4r/cBgOKf8f12JBlNag/Z2K8yINqcnvnIEIS/g3eWSM7LDlqbhv+ezVpkb6nW1CNhOLvx47/yHkuOYPOJoOXbqzCaYdOcexJWLDzeOhnpV1rNJDFqldxWRkIeqA04xENnO9zsQXZooFSdKy9zuCoqfWfWTxH4WBlwz7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRjEBzTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8SlFX015969
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 14:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbthUQGiUHpb4rkYFXNHNn9fqm2ZNwMaGsqaUP4qiQY=; b=CRjEBzTrz5k8SYYq
	0xOYDKKjueZkThTzSi3YeUbnytbBserM5tfB9qCNLpBplVrctkkaSwq0r2yEdK3U
	SgEtv6vrcuq3BR9KQ998F8irEV3+UB0rnf+KioptzeUfZ4bSh0G4zLQgCsbD94Xz
	71fHAqQM/s32iwqFzK27wDZGCLVU8yzjGHZDJrU6rnFZIJz1mxy+I6H5eBJfa/k0
	Tu1for1IDNaTnGS0fxcg5QkFA4VzcCngBhRV8vZ75NTmuWxfWIS80r5oG6OWGV/X
	bb1G2cNK2uPymKBKIk/oSTwJlFyY5ql3lYFymVQIXLZ/gC5vWvzaAdqCMDFojlLT
	nSBN5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4b0c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 14:42:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e65862f4e0so8351956d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 06:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976148; x=1740580948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbthUQGiUHpb4rkYFXNHNn9fqm2ZNwMaGsqaUP4qiQY=;
        b=hhS+LSV/vvGO9lywVUtR9ceh9nzWklZan9IlVWlH8WuucMgt5JsNRlptXqDRvWpDQ1
         2LCFqTiSEZ9kfsQ/BPQ+kwPK+pr3BjPdptZ1+mcoDZVBIdunXIbrc1xHo1knKvVXxEwM
         7gNh9I4N5t3HdGk0GtPE68nnfg8sfgKoOVDACS9gReyxFpsSKYjM7FVa/nhbQFOl5Xrs
         aAuvTyEnR5++d5LlxmRWpPC65c2I2EIVUi0pli9KY65+TnyQlb7O1Wk9RTUxzZ1BdfCE
         XX9qT1dpUzd+BLj58G6YktDriroeO82B4iw39Cy6822iPMlwDfGcQ2T9nAidEwiWVYAP
         ltQw==
X-Gm-Message-State: AOJu0YziSqWFTRq9QI+oZx3EKttLz3R4550HZRa7FyogUZY54alFQ7A7
	zFWFfaBvE+GBf0cfUWO9dGcsoB4Cn2eegJycW83iKErG2ZoAh9dVnXjk9xHsCXEi7Uz3Z/4YZ39
	eyjyYCtc31cA2tuwavBDtp0+WeZFYkZ2CrZocVPk9zCY8idOBGa59mgpfv5rfap3M
X-Gm-Gg: ASbGncvsgcsV9VQFDbr/g/AoR4a5MISq9SX7bYpae/uN1QFbcVLvTZ1ZDPoZUaucX8K
	/LcRosuXSZa5DqohVhMmUmexEQ/K84E3ZtKR7XxoKobD6m61N/xbaMcXpjb4nTj2kpY85WuPe7w
	5b5vi2bEMakEGyNOW9s+V54wtjRNoWFLNNXrE7ykigit3bTOH96t5EaWBs6Vo3HLF88ryrNPXyI
	RU+wig3Q0Xho225PsJHf8C2CNH/gwJCMaB//8/6Uu4wf2s4V17Vy/cmUuFozryBfAzPS+kQPfrn
	c1/pcYAJm6srZr8SyDm752xEzhFEPC4756SpRUj11JhHy5rnodWuNR/EULE=
X-Received: by 2002:ad4:5766:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e66ccc47d9mr88788076d6.4.1739976148120;
        Wed, 19 Feb 2025 06:42:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpAj+Xqw9qSXsdwXUvLSdDHBpi+ry1U1ggEwkzdRQ/MVC50YQowsUTy3N3zJnQoanhNQNYfw==
X-Received: by 2002:ad4:5766:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e66ccc47d9mr88787916d6.4.1739976147828;
        Wed, 19 Feb 2025 06:42:27 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm652600366b.135.2025.02.19.06.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 06:42:27 -0800 (PST)
Message-ID: <27a0f921-437d-4744-ae99-d1f5020fd55d@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 15:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Drop `tx-sched-sp` property
To: Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ep91fzjhv2rbwKOPzd3P45grZ7TeY8ww
X-Proofpoint-ORIG-GUID: ep91fzjhv2rbwKOPzd3P45grZ7TeY8ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_06,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190117

On 18.02.2025 1:51 PM, Lad Prabhakar wrote:
> The `tx-sched-sp` property was removed in commit aed6864035b1 ("net:
> stmmac: platform: Delete a redundant condition branch").
> 
> Therefore, it can be safely removed from the device tree.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


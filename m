Return-Path: <linux-arm-msm+bounces-82416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD28C6CC4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 05:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BDD872CCA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 04:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE1B30C37D;
	Wed, 19 Nov 2025 04:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xjp2yPrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4rcw+gc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290730BF64
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 04:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763527753; cv=none; b=V/Ru2dPmcjmmamKG+7Jsiu6gsSNJ38Pw3npotx8PHxKSAuHijqr81OXNRlHSA6JTDCg6GX0pLRFXW+qz3DIPqjQ/TTeoGLz568z7FX4XmmYAB9WqZCC0qe8jEZmYg1GvuwGTKXD/JKCn/RH/wEphsT9E14VC7HxbLg2iNLGMNA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763527753; c=relaxed/simple;
	bh=x+EtDfjkrUB13PELZRJL377YyzVKJ+zwQy+uMzfVcGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDIxtkAoaAAK0K7YaU20Csud004M9NnFJTO9VK63P5hYyWovn/q8vGiFLM8EBxaArdoMONdbFP2aMlpX2jAhP3wu88D4x0dsdimJINR6lPbe3mqvAdPjnz0HzWYPO1eE9EJv2+cgpLJXKlbNrEre3YGtpeuw+Ej/grpKSEJrbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjp2yPrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4rcw+gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ2R5oG3165030
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 04:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFG5Mqe7GlywUNGuL0mBhZFPMuuMhJqAl3FsJ7xmmik=; b=Xjp2yPrxqTLLWQhL
	5AdlJWo/5AgORRgJbjhRZx5EmLaPOyhOLe5hTmt5Wbg5jiH/QIIzryEbMATnM+5s
	bozDp/OnjlW+XWO7iRfVVOifV4DNnd+SpUDVZ1X7/WhmVvwP6ACPUPfpnZ4Uge3p
	riz1QsMWnIcdeRFsPONpx4uP4qOdkmtwyyNzVcznYA2fhv7C++RIHI9GQQYSJdRV
	8Pn/1KOSUCAhDercnuCo5OosoLoosPxj4n98de/K9UDbm1ptlhfPBYYHn5vZK8nP
	zK1gLngXtGVUFdEJ4luSI7y5B/ra/2XaCBjUgpedNa/9JeylFprucy+4wSysiIcs
	BcG9sA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgsswp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 04:49:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34377900dbcso12419115a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 20:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763527748; x=1764132548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFG5Mqe7GlywUNGuL0mBhZFPMuuMhJqAl3FsJ7xmmik=;
        b=V4rcw+gc5cFccjBNk32VGY//xkloCvwwVbci7mTpVnwkE+iQYX520d99kHqMgzYTNL
         rxLEeW6KrrVjK+bZ8uVpjUORnvn+03DzySecD4cjNDQccsXTynDOeCLTuOZGZjWkY8cc
         oK0YA6WPynwrGkbckmaVpNqCtG0M10ysh/i74NIUrkhQ1qx5JAXTpguHcNAaHS4YlYgh
         LeoPTtRsNb/ETyBCGHIPI+xWju5N239Hy2MH1awR7tTnqH/teIXD+FtEC5GEMRFRNvIr
         fGzl2pRL54P6O+n+3fm3zhwkkCXrFYyHCTrgsha8HpUEATGAw/wRzDzY5E2Ft8tqtPuY
         Kd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763527748; x=1764132548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFG5Mqe7GlywUNGuL0mBhZFPMuuMhJqAl3FsJ7xmmik=;
        b=uzgJpZS8kxyb5WuXYqkgZjbX2sQsPl/0r4PVyn2zdzcj24+pLfAqwdQb9ANOfp0rHP
         4zdaMLdOniXxzcfspdHVinoXJTV0ZMO8y6/Qtmw+lsk8JPIkW029P52BKEwmFN9PcE4C
         b4fP9xm1EiS3SIvmFaxEW0zAyPj+MctIWq7hLCsOTMzXbWlfGrVKebRtvaRm5zI1eEiT
         sd18MbBEs5tTuhdJFk6e2bw3xNFMtlNtQv3/f4KVAjWjScFaF9iRqUrrRE5pFg3nUxYB
         DwxlCs/o7PvG3+VTbFjY64JpcRGMkdCy3BDG9cK7e+Wr1EHg2HiJnX/4BBZKB/uYLVYn
         YzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn8M4QghT3zvGX/syfK2X8VXzinvL4nd2QD3qb4sEWqm0bYKTBwGt9XIRhqJQJXzpjTEX80Zs6/YrFTLnu@vger.kernel.org
X-Gm-Message-State: AOJu0YxR3j8XjRm+ZxTe3pMq3HcLJQnW+ZowvHpmTk24bWRJBPA2c+PG
	UBkJkqSrjeHTsBb5dluMcgPNcuxlA6txAZgy1f4Z5huvf/KF7d1pCwrOjaq84nsGMNW73Hjk1NY
	mjZ+WiN6g/qWFF8Klbj5ae+N/hM9sZhv6KpTifH5029kRQ903s8iZWkmVASCMeiA3zK/U
X-Gm-Gg: ASbGnctyG+jz56BYbssg7NJkxkwoVJ8jaRzmzVKntoXpNW+cSjQuPxMV1JVnHEBixUl
	gD1SojrfKVJ+ardiDa1GFsBrMxE3DgWn2ytgsSRe6mLd43E7ZYrPNrSZUw8ZHcYaMBzW7fxnmiK
	PKgHGZEPxQ/eDrzofHa4lBNLV0BLGO5DQyZSK1vshaEUWrmZGw4tqIWWazLZuTuy77vRcWWn/5b
	eBrMwtrTEVmSuNLk+m4GisVrNmg8L+TaQawmBfQpZg4sog7p6OjvhvvhaEGW4I4G3sYynVs171J
	RiGaRlRYS+MH0CNAfZZWqeEP7LKUJ9I/V9kQhYHqfAiYqFraoHj3WlrpZviXYzO0ABsUpaZ/BwK
	6J7XOhYukWIQ7TJ/JIpCWkbhjZIvucj6J
X-Received: by 2002:a05:7022:ff42:b0:11b:c1ab:bdd0 with SMTP id a92af1059eb24-11bc1abbed3mr4995412c88.35.1763527748449;
        Tue, 18 Nov 2025 20:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLvJ3BtCW1AoI0h7qv8WBIu7dRN5NL2oEjk4AbsU1vWLecZW7FVCQPnhl5gsZf7titMWSCkw==
X-Received: by 2002:a05:7022:ff42:b0:11b:c1ab:bdd0 with SMTP id a92af1059eb24-11bc1abbed3mr4995399c88.35.1763527747895;
        Tue, 18 Nov 2025 20:49:07 -0800 (PST)
Received: from [192.168.0.13] ([76.176.54.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885f9sm59870695c88.4.2025.11.18.20.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:49:07 -0800 (PST)
Message-ID: <5c30421e-108a-41de-81c7-c0c5e5290cc1@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 20:49:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Arduino name
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, m.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20251114121853.16472-1-r.mereu@arduino.cc>
 <20251114121853.16472-2-r.mereu@arduino.cc>
Content-Language: en-US
From: Trilok Soni <trilok.soni@oss.qualcomm.com>
In-Reply-To: <20251114121853.16472-2-r.mereu@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PFGYMoZ1Tj5H5bDQEUilt_8bvLqqciX4
X-Proofpoint-GUID: PFGYMoZ1Tj5H5bDQEUilt_8bvLqqciX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAzNCBTYWx0ZWRfX5mCKGLiJKWiT
 ZKc0/leGeG9/fiFogqLqg3dUreD5SWwWKzJ+7MDR047Ip/xDyrmqYIsOLai+KMQJpBYXG3zlDcJ
 UroxrQZo4guWN2LH1BZAHSfhtP+8tJqgHbea+Dc3dWmUzpEfrPf/tr3nQNQr7YVkI25wtDUS0bx
 9aPvbwSM9LUJoGCpjQglo43A79ZjGa9w6TB4DfgGjc2bpW2ZKwxcBWykclqA2BtuCJ68cSPkFy7
 7FJswes0qwDrQIAEvWYnvmxY9ilQBbZ0aAOaPGkoTGONuAXa+rec3bBj+4b0ZNg56N7wavI6/ov
 8bk9+xHGFdXgZTmyJg3M0d7JHPHIexsI14QMtuNGB2mllsXV3bYHFyT2KKVF0mUHSNvoRgBSjwX
 ZvdZtqLEEpe3WTc7ND7XAq5ajv3siA==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691d4c45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=4DQS9OR3UOqOMXWGYgShMA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ar_5JxPjAAAA:8 a=5jHDBBYAGbftYkXlaRIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190034

On 11/14/2025 4:18 AM, Riccardo Mereu wrote:
> Add entry for Arduino Srl (https://arduino.cc)

Is Srl or SRL = Inc or LLC? 

> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 42d2bc0ce027..07a285c9387e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -158,6 +158,8 @@ patternProperties:
>      description: Arctic Sand
>    "^arcx,.*":
>      description: arcx Inc. / Archronix Inc.
> +  "^arduino,.*":
> +    description: Arduino SRL
>    "^argon40,.*":
>      description: Argon 40 Technologies Limited
>    "^ariaboard,.*":



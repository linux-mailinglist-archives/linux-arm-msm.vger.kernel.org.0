Return-Path: <linux-arm-msm+bounces-52972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F32A77EB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 17:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55FFA7A215C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A735E20ADF9;
	Tue,  1 Apr 2025 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aC42HmgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362D2209F31
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520603; cv=none; b=kE6qekHgx+VON8QpadtaKImau4w6FTmPjRMGaIEORigXnw3K3Cz7EVCpy/pAvWd2+Ltf1arzEUI519d7K65q4gri6E1oo53qy6ygMIVj34okejkHnA1JOsulFxI7W+h2O2EyfK3OmBvypPIgth065n5ADpNSsBfhKTqdQbZkmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520603; c=relaxed/simple;
	bh=atpotmIpxJ4PlCifDaLz1QG5Zt/cJjipBuKt826e26Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxXgftUfJJIISppm5W+ftu56SlWbdChkJQDoLrbTIk+ELZpYXcL1LmMfeIgrwTTkLOswKTsnsIh4+q0JY6GRhmrruYOgzxCsmAGRMQJuSB4n+u4lbUnHzUArX1H3HwsU8vCoVQsZAft11zW5IneacDlHZ1jQMOtepvKcP5VQoLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aC42HmgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531AQ2Bc031196
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 15:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDq9Quo5sUxjvk/E7cLnbsS9IyoWsKmgHCK55eQ++5Q=; b=aC42HmgN5jOLb5bu
	KeAMWuAPHco6stGDTxVlAhqa6Idau/6UiXIWPeYw620qCEjz7okiWYxsxU4p8yFn
	3VqZG+fbknenQCI7r7BHc8HpyyH/8bORLbbzpmSo200/+OGEU3Sx2UbaAaxIxBUJ
	eBm4Y1YeY+KTcWZt7SlNzjYRrQi3IiVf4KL37nBDuETyDrrP9gUlg2UzMC6vnz2R
	kRp57uN2BMd5Vjcm80Y64aGnknOdr+LFsM5AkdKJUJK7OTo+8MD4ziCKUEZ/Gzux
	4OvwjrSQmmk8Zfwur8zhq703PxWr4UZFWkZlmBH5vRo6n8//S2zTeTkng3XOMTOx
	RBRlFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45recpgs4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 15:16:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso147719585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 08:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520600; x=1744125400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDq9Quo5sUxjvk/E7cLnbsS9IyoWsKmgHCK55eQ++5Q=;
        b=aAzpHGSjo76zlagvfL9L3jTmo0XN8wgY/0wNHVDoe6yv8ftId7dh+F1sXkNt/B55zb
         U8IxCapWhxJDtvuLkhqloQYWcGbTzSBQTs1YQfZQTYflkyw/fWB+ZoTbZ+dsy6uCDUix
         5kAdQzMKUnGnQo2ZS1FjzfEwcSL4OjbAPB8emI1xbYtWD+vApYGC8XDtzYc9g0+35frW
         qrV8lTYg1xWlb3U7p8yrv2Doh68crYi+fwq3KmSkNr6PKGHOU+VNSPHnIDHJqp0hawYu
         saFg/ff2VvNfLMBtfXvDTj2+H82ZJwQBqGZYeKOyrBPxH1SaDXe45c9V174IQVlxWsqE
         3BOA==
X-Forwarded-Encrypted: i=1; AJvYcCXT110m+f7qOl3mHWOvmTEBLGSLYwBFV/htpr7zQoz1fuJSD+GmPOHdcHrHcZviNpM4jQLRJWGy9HN6alJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+sIEH3GkXk73SGbYR3AeFS4HMSZ55UO13dzBJ1tutGqh9NaY
	KLWEjP6tltRinXRym8vb8oxNjMzB1nSeuhCOjb1OK6Q0wy9JEpJl5UCjpYfgbLdIbmmlUyxv3Vq
	e0o1MpxYMoyiVd6OmB6q4qpmxAAJFD0XKw5/9ugXijo8A1v6qenPS7gYJI0dqSa+G
X-Gm-Gg: ASbGncsbTgS6kChmsVIyWd9E2fPPtuWNqy/amrNs8BCeYPa9pv6iLIXquwCMFQv9t6b
	sS7PcpANfi9qkrr1jktwxctIlZUtoAlFnBaN3sCcMnlvrDOTulcekkbP4Hit0lDnhHP4btqUOpb
	L3peJTDia2rjRmvDpTmtTmSBh8MSj8qzksZQkWbJUhRT2gUFQA/4AUeXYZNS3guVC8ZKtWp9DaM
	9tldqKudZBiM1u9EWrHfUcT4WvNWDNZAC2oPacRHnV2oiibi3bFB24J6DMA5X2w/Kvms41saSGw
	E8YoA48vBKEPVhXq4EbRhcr12bBTj6wTzQiQtt7EAxWObNzPr3hu6HBVOQBQ6k4vmAvPzA==
X-Received: by 2002:a05:620a:408c:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7c690725305mr705613285a.2.1743520599892;
        Tue, 01 Apr 2025 08:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfF2wwaKHEPlAiu8lDrYWKJ+febc0strBl/Aji3TXrZn/2jWGkghHEZRI3MWZVz4er40AdJQ==
X-Received: by 2002:a05:620a:408c:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7c690725305mr705611685a.2.1743520599420;
        Tue, 01 Apr 2025 08:16:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac78bdd54a7sm84415466b.22.2025.04.01.08.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:16:38 -0700 (PDT)
Message-ID: <cff6ab27-da1c-4925-9f2d-f12a2671e7ec@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 17:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcm2290: Add crypto engine
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250331123641.1590573-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250331123641.1590573-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VOZ1ZGpOCNOnZLXiCDGhRaaBZu9srywx
X-Proofpoint-ORIG-GUID: VOZ1ZGpOCNOnZLXiCDGhRaaBZu9srywx
X-Authority-Analysis: v=2.4 cv=J4Sq7BnS c=1 sm=1 tr=0 ts=67ec0359 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pxQL0frbaL4a0zJdC2sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=792 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010095

On 3/31/25 2:36 PM, Loic Poulain wrote:
> Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


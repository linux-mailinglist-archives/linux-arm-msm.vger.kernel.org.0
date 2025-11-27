Return-Path: <linux-arm-msm+bounces-83571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6581C8DCDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F5933A21FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B7A2E0418;
	Thu, 27 Nov 2025 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4XWowcm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4MjiQ15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029A31815D
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239842; cv=none; b=WRVnlSxckcxIc4gsir66tYBCyzZUf+1AYXHP5ZXVKMkju1yxibW3641fN+95EV9T+u2QEkdVXVFA88KYuwSVjLZYydgWuW7SMABgH3UgePs23FZwXMzTDhgIljU4qvnFGbG2frvQ+UMyO4vkqEVC/7y9EaDVoIYCv9xVCm1aeIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239842; c=relaxed/simple;
	bh=1y7iw0ob2e14nP2XASuQ/K/LoS5tKm3KA9jdEeMU+gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJEv1vpXRlQf3NeeV63MUnBKS1GhjnP+499Kt6h0OCEVqWcwyKkFrD/rk/X7lJFIPOiUJwP9SUc1pKrWyIxzadYBAT/DzdWXML9OzIARLFlUxGjEAozJ4bkM/H+PBK1MLyqXEm+eInaN22zyi5JI+PChDllTYFKjeBWDdixtQy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4XWowcm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4MjiQ15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9evq73332706
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1y7iw0ob2e14nP2XASuQ/K/LoS5tKm3KA9jdEeMU+gQ=; b=d4XWowcmeUdWzZVN
	ehsy2UcFDx3u/9Cj5tmh34YikcCK0ZtJCUTpWQNfjz2hywJkrdsw1HK1S7a3B4Pb
	Yx1AMaP2RfPhgC7IFmS5uSC9shugPQ0Y25VLWnSz3ZMuVmcdWIbfTIKiAd0CezpF
	x88rC27Lc3np9HCEEPWCjVYnjRZB+KMwWAuKgsbayR+AQiQb6cilxV0SsvmFsAdk
	cFL/1ka/RX+UqnlXn6DgWGAcUtY37agabvJ+8g0c8wX7cTUdh7FyBO5OAdAB/NCy
	8t9uBWxhGBOuMcfFL678W1mq62jtgHPOFPyuPv1ieWWwZuaPcYYP3Zxiz/qQbCaV
	CzfTfw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apavs1q0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:37:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso747840a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764239839; x=1764844639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1y7iw0ob2e14nP2XASuQ/K/LoS5tKm3KA9jdEeMU+gQ=;
        b=P4MjiQ15ambMSKamfr8tVsBV6qpnxgg94uy6vZJrEZ/qkIPKj8PkSTHCrQ8DpahCej
         s7IJCVZ/e0woY1LI1k9FOG995y7o6r20Bs6YjOpOaFBSxm37YzVYbcPBY6fwG8LQ0Lza
         nv3/wI7fayYjdw1KZgC5qbJt6oBl7YsbKChZYxUH451B/vIUbKG4mkOtn4ggzXjCXq5F
         W8/yWUVYPId8uyh7I8XiWJKLF8VKKfGf3dyejNIs/AZKKZEIItf5tQpHr2+xWVLjtPzl
         cnAeP1MmrVE6DIyRNGjOIpkZU3TE0EUM8pXPoMYwQQVHJKbiP8Wm5+krmLgCpL2aay8M
         mReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764239839; x=1764844639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y7iw0ob2e14nP2XASuQ/K/LoS5tKm3KA9jdEeMU+gQ=;
        b=JNQr+mfDjc4KCp7yb1CPlAueO7mpePXbfDvdfDk8XT3PwsXBgAsjB4nIIyQzyF4rVW
         edeX7kTSZNp2kYxjuoxWr91zwsrQqUa/wWl24z3B2mxHJAjcKUGoR5enbcL/bbTjOd7+
         LMZwizaz+YUkqgywtpbYrwa1qv0EN4VAh92plyTj2SNK4hx61nLmgXO3ngX40s9vrYMB
         /mSz3LK10+MO4djOicnEau2CRkfi3R2R8dGtCIlwZxu+Fp3DeHZkvq/UXGRVfWNg2hsC
         xwLEncEWnHdfLiP3krT+RMwHq6xq3jYKL9/zzlB+rwPEs/JzM6fZ7YziPTCC2UWm9AUT
         yVyA==
X-Gm-Message-State: AOJu0Yyagv3wP36CX4UUOhHBO8CqIFEe1chox+r3N9VQVQS5mi7TNkuG
	aZQN4gx4PBQc14KlBajjMKkE6kLCPjZ5kerT/9Lule8XzylOInjx0nBD30lnTYZqoqPhHxGHgtC
	bNlTZfSqzRpTUiUTcF7a1cnHPZHPbaP9O8/ykgA/9fEQ2FPuyK42GpQH2xus+hWyPXclY
X-Gm-Gg: ASbGnctZIImOSL4wDGHceFIq3S4jkjmM1O9WOClLA9d3hWmYTFkULWwB/aRE9heCLQV
	7oSXWSqNU0+trub6JYPsNWTuc8sJhv5k+txwWLWF0oj28/Cn+ISUuplbtNOFgGebnXicIXHdJTd
	0TWxIVWZr9gx+s0u7gxl2NHHa0GQq+pHQficfzcrujcDbG+E5P/AEvKWiVGr0+4GTxuKCdfNgY8
	Qsw1v4iCq2E/HKBOZdtaaCX8+FU8h9cpiXNca143TdiF4hG9INUb6107hzoCZpZEMnuY03mLS3W
	drepnOTyehJRkJaTQRbmXE++N1yTY5Y98nn12vpPwxHxhjfIM6OS3pH+GJGqO/uBYJnCFWWTLQV
	/Cf7FQ4JZ7VZ4i2ga8CTtnIZyeMer12fLpkpnXpoPy1mjz+/f424N4ne5CPbQoxg9cBdPLuKHLL
	iofv0eN1cLTUTX8wBBYQV1bB9tVOal
X-Received: by 2002:a17:90b:2543:b0:340:9cf1:54d0 with SMTP id 98e67ed59e1d1-34733e4ccf1mr19718157a91.1.1764239839299;
        Thu, 27 Nov 2025 02:37:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnmdipQGlMWE4OwwHLbdcFRyy5E2ppt8YoS89aQix+KF6nHnCZS6tf6pM5xyCJxE3838KHDA==
X-Received: by 2002:a17:90b:2543:b0:340:9cf1:54d0 with SMTP id 98e67ed59e1d1-34733e4ccf1mr19718132a91.1.1764239838830;
        Thu, 27 Nov 2025 02:37:18 -0800 (PST)
Received: from [10.190.200.209] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b74b8f1sm1472835a91.14.2025.11.27.02.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:37:18 -0800 (PST)
Message-ID: <19ebab89-e0f2-425a-a95d-01637f324170@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:07:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: qcom: llcc-qcom: Add support for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-3-75a10be51d74@oss.qualcomm.com>
 <80c26f33-aaee-44f2-ab7f-767467423396@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <80c26f33-aaee-44f2-ab7f-767467423396@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U0C86uKdk_7jwdcalci8aBCtGw1dQt-Y
X-Authority-Analysis: v=2.4 cv=PYPyRyhd c=1 sm=1 tr=0 ts=692829e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XIfWN14xvu2QelebLYUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NyBTYWx0ZWRfX7mvZ6NF5UTXc
 UVn+wXtOzuurFoo2Pie2DvklVau0+BmA27K/W91OaA3Lb4wtHMKAWCw1PI2bK7qHzZSwDJmzvsv
 r2IuZONiZPTAJzUVAehE0TvRcVi7/ueBqspWwgdP1VHBN6AXR+Qri5otv30hPOUsbC5R55xqgWU
 uSEED4nr7HutRGtBq26OlX0yEVagkiLasoTFvXmd7YdoZR/aPu5LTVzNrKHXCjECelzP0zzEJY5
 Bu3K8lpxmAUCGcIU6Uw/fu/NQocfkGQqFo7qGonEY29Hqf6wz8xnlnt25K5ZGXuA2NClNnoCVA8
 w1FL8sCPffHzAaLIopHBvEiys1SqD9Hutj1CRXfHKsUsqsZ2OFhZm06saAZisbcxn7YW1h8Or6O
 SvTEkJtkYJ6BhOCHAzv+fi1ACn/Kuw==
X-Proofpoint-GUID: U0C86uKdk_7jwdcalci8aBCtGw1dQt-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270077

On 11/27/2025 3:52 PM, Konrad Dybcio wrote:
> On 11/25/25 10:16 AM, Pankaj Patil wrote:
>> Add system cache table(SCT) and configs for Glymur SoC
>> Updated the list of usecase id's to enable additional clients for Glymur
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> What happened to my tag? :(
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
The commit was updated since I squashed the patch for enabling additional
usecase id's.
That makes the tag obsolete?


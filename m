Return-Path: <linux-arm-msm+bounces-76547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A212BC7945
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B4C235203B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D9E2D0619;
	Thu,  9 Oct 2025 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIlmvhS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949B2C327E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992532; cv=none; b=axUA+gHEyDgh+krc4jYoRaN/TlFTOdEvnf10mmsvhpYf02aFQaXLjNupVi4xVXxZb2PpOPYl3sBuhA05EyodLGwVYt3ml72n8PLverA0uLMYyiP1AUDhorPlRQj+rTzy871voKl1lls8KvqlyOQ2wisUHLMBapqPVxbHBMT963k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992532; c=relaxed/simple;
	bh=ic9Vss68dPabO721ajneWZTeeiSQLVPNFuFb7lBW75s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhKlMkiP2k/PEA1tgbbHb8hUMK/JF8GkofHF3KYg8/Og875KEp8MxAjmqUWeavfl79K4UvH3fAHPzh+gXlKpzSS/U39flI2cKe8gLARG/+0VqGxWqykkS01SDjSDUfJkXJAqbYbiwbFZWOxffjXWjpnuKGmzBWGmcPggkHh/L6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIlmvhS3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Edgs011813
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/X5Uvfbr+U+5LWnL/Jb57ftS3SWraOPoE3A5ZWOA9g=; b=HIlmvhS3G9ASO9yM
	N332g2WzSLEnbtLyo5rAE52mRB+Fznl8t25+LOdG9nOB47ZOKfrnpXdEzX7U5aXT
	SwXEucqkblsE/56rdz0a/RavSvqUvQB1UO3o/oqL+AoJuP3PzvEfElI1qaOI6XHG
	Oktmyq6Hfk8LQabbaF1Z2sYgzl4C4BjTmGcntFlDPt39asRiCask6hOJp39kCLP6
	HuB8eWUE0L6+fYYReLtmMyCiMcgNjWE4XtzbZY7MQOD+QSv+rCFkkyOCANtuqwSq
	xJLbCCRWsSYiMYsrLyqOZsGR2dNe07j1+lazAlBHD97OIE3tkVi/jTCaFpabMQ1l
	6IPulw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a9rrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:48:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7810af03a63so1993141b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759992529; x=1760597329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/X5Uvfbr+U+5LWnL/Jb57ftS3SWraOPoE3A5ZWOA9g=;
        b=v7pW2oevxkLwndfH2QL49wumOgilYuZjvObfCxnsv8aXU4ZzN7XVmbTnU/I1mbRfim
         FuoZwPz2qL22aaCWi4vj57BdsZtruswOqQH1wGhOx5sCRsZm7WN683VYAN1RVDAjNuvr
         FFOfKjPlLHZJb0X4G9z4qfk8wQ7hhYb2JxtiyPIIeKvPyEw7IJvpR94vggN0aNLj8zee
         vKbse5fbhqLTdKo3a4AKHywkqlhLWsE/j/DCqWmdfSE3rHgqX+sDInwpkcdHSLsJHyDu
         FLYDMKs++GCsUMcinfo/+Onq9Lj85PGryNvrfvAZVg+glCbsDez7kJeOHn8DNKL/FiC6
         hXQA==
X-Forwarded-Encrypted: i=1; AJvYcCXG9E+eL+QZmTkWsaSnZRITdP1yyJ+w4r4xRGwGb734zv6n9eE3cv1k1RsAkB3AjXXJEdalX56txkeuV3Es@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPJf0fzAc8Ac2gpfXAuS2ju9LfGp9isnndbs5Kkp67/rcGxYD
	vvre3J90rgG/U31j3tecwkhPc+Xlju/ME3SuDRbxnTwY97SYjSuH3mKAWtO0Zt0HsPnA0i0j7E0
	SHiW1p6B2C5UwZG0/IvS2aUAfARloQpGqF2YmGRNmw2pZaP8O5utvkXMQMiqxk+BQqEPj
X-Gm-Gg: ASbGncvUADbHxlficVuydhOA0DfWS1rM43SG3CVQKJrf9P79/ccWUoYboLDL58yg+ZW
	UxU19vGLZBRpP9OldTkKQpvp3mTQSHTWr/o4hkaap9lKAJ/ZvLv2zkJkUPz9Gqic7f58jpdQyRK
	WaiyNg20E11KtgFpat+7Cyg2HTDMvXPZ0o5uoVS25FrCiYYd72dHRTPdFPtDouXSW/ZcH6uSbDP
	auozKRdTpzc0rrhjM0GS6yRhpe+oh4RzNYGQ4p1nXoPz7gDCX1az0X5Zf1aUkAsl3+k5pkKXcPR
	UHy8DwojI/PeJ/oQb7TvGGDvljXXV2GTHw8TDIJZ9jduOaCUtPmk5LgamyPkT5lRbmkWsOK6gEF
	KOnjzs0xAZaPB94W3Gu5uIx193ZsfFE6UM0UDu+g=
X-Received: by 2002:a05:6a00:23d4:b0:77f:3ceb:92bb with SMTP id d2e1a72fcca58-793858fb3b6mr7616195b3a.8.1759992528729;
        Wed, 08 Oct 2025 23:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj8Rv9uj1kQjcjGsQYqLP1M7EZTs7RFClhYrctbezz0OUijiztZ7vcfVQque68PbIFbDQhdg==
X-Received: by 2002:a05:6a00:23d4:b0:77f:3ceb:92bb with SMTP id d2e1a72fcca58-793858fb3b6mr7616185b3a.8.1759992528318;
        Wed, 08 Oct 2025 23:48:48 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e22ab4ffsm1796190b3a.70.2025.10.08.23.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 23:48:47 -0700 (PDT)
Message-ID: <fdca746b-e1b0-4610-ada1-6d9fd156c7c7@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:48:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add bindings for
 physical client ids
To: Rob Herring <robh@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com>
 <20251002003432.GA2714683-robh@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251002003432.GA2714683-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX3gG09s9k9SgX
 /CTwmcPv5wIR8Dkzgzbn6F9mdO8RuYMHRREKlF77GZMEC5zYMNO4bEUj0F2J8ly7GZqxNC1uTRy
 xAKR56EyDxnFuBzFp5RgCgaMIgoSQbzog9InE+5UcXY3wGEHeDE//2uD01cyZw3ymmM2aOfvFF8
 ktHu+kNLGbGZvgGorxhqud7ifcOYaWX+mHy4cMoKFYFt00pKq1JmYjcuL5omTZE1nLvvkFyq0TD
 WOjsw+FRbZXzTF5Twa9ww7NQ9SkaATd6SSPnMygzutHUAvoK6B1YVoCsgYbFzO/4g3UiufSjvNV
 i7rqgxdI1S2/oz0arvxtZYstxOd55EjdXOVhM/j7nQBZAELpeb07U1cKIsbUwHQFkWO/l8wElC5
 M6kuky5iYjiUDkGpXLAK1+9OEn+5Ew==
X-Proofpoint-GUID: lFxFp3iuIvZHm4SxocVEFAK4x4J1JkgP
X-Proofpoint-ORIG-GUID: lFxFp3iuIvZHm4SxocVEFAK4x4J1JkgP
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e75ad2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lwdf39Mp2klsYuJi8zAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122



On 10/2/2025 8:34 AM, Rob Herring wrote:
> On Mon, Sep 22, 2025 at 08:34:20PM -0700, Jingyi Wang wrote:
>> Physical client IDs instead of virtual client IDs are used for qcom new
>> platforms in the Inter Process Communication Controller (IPCC) driver
>> as virtual physical mapping logic is removed in HW. Add the bindings.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/mailbox/qcom-ipcc.h | 48 +++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
> 
> This looks incomplete. Where's the binding additions for the new h/w 
> that uses these ids. This series looks more complete:
> 
> https://lore.kernel.org/all/20250924183726.509202-3-sibi.sankar@oss.qualcomm.com
> 
> Can QCom please coordinate your work so we're not getting the same thing 
> a day apart.
> 
> Rob

Hi Rob,

Sorry we thought all the platform use the same phy id at first, as different platform
has different IDs, maybe it is better to maintain it in different header files
like qcom-ipcc-kaanapali.h? Please let me know if you have disagreement for this.

Thanks,
Jingyi


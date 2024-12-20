Return-Path: <linux-arm-msm+bounces-42989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403C9F933C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 14:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B31189A29A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06B3215786;
	Fri, 20 Dec 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKW0EyTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AAD2156E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701178; cv=none; b=Jl7vyUJH0bht7p7axVnjTBoSZ41eUaMq72kbkWTtgN8vCXSSvxMSRKGR3Q+JysWOK1RvIPLLJ7UWPpdeEm/JoLEww1ylXxCSf/UmiXGf/xtupytHxPLceZ9xYcuq2HQYKnjHrSw7sUUYuAhMyIpT5Af2QkTaXhqJEmMUvyquHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701178; c=relaxed/simple;
	bh=n4pdjIE8wk6+RrT25j2XZ+MN5qzobRKdoai9EioUYbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ga4C34BptQRDIIyaGoqsPKtJKTw2gwiJs6IyYWagkq2N6Dk4iOMEgFXNKEnXosn9Usyw77Ic6I227QCEKt9DttM2jratemIvLV/PYGnWqiu9MT34ZNk8laRI86xUbkLmPKXKQy7zeTClTNWNgdL4SYpRx/lRzxypxK5FZnEYEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKW0EyTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBd62e026228
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1i0DA82kkn8WuMBOuii7HiTKNDRCyKMaAec5At2Bx5g=; b=pKW0EyTri/sXirk8
	DqTpbTjast0OqJWtHVOIjLeWwU0zch1+6n8TCbafhNcaARUr1tW3SV3a0WCdVkte
	mAjpydCR0lnLDoX9amtfSYmtP0twAEp1ddHWC+yu7J9U5BKCuRKnRRdUla7upPYj
	BnlQnQFOz24VZORjj3i8402+5xnUSe2ReCgZU8YbfzncfeIib5VpreAUiirppin/
	rBvnS4X+5D4N1iXPIH7kKIHAFaKQdr8RD9a1DBA10k7X2OB1Rjg+A2MKYl6mI06i
	wpAGuarPOa6Jh96o1ysoaohtqsxlhFDW9hBxYEwWrzTX+b1C2bMAkMkhYXiLT5bJ
	uWacAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n7vg082n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:26:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e7016630so4392586d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734701161; x=1735305961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1i0DA82kkn8WuMBOuii7HiTKNDRCyKMaAec5At2Bx5g=;
        b=thfxNVMhpmNAuVLcRRPiP4WBjF8cy5kxscCiZgkRmlb3BOcQJUyezlZPYfZFncK/UG
         LvcX7UHKuyIxg6RPCtgtlPR2QBrv3AsykKa9tHN61erPmTvl0UkOGUCrPr+sFRXeWYRp
         xbCLK5kEhRIOdeRnEiVLFP5IJTisHZcYISNggprnTajOxZR2T9ifsD5jMjdsPeQpTpAG
         pfWXy4/xmTQxZ04cQKW+q2hRFnB5keNZjH32H9UKOzr2hrBnjhNt3+CTc4M6eiUv8gD/
         Wbmwj5+ci9GdXncsjxO8UycCMvG6Z76AUyp3FZIMbenmlLj7V/DQU2PiGQmoc9Ky/921
         Bq8w==
X-Gm-Message-State: AOJu0YzYr9YKcTDp3BON2IMZRW3oNInXvpwar9KFxLZOJ5wNCqc1r1ki
	kzKJ2Y69afvGCOWD2e9mKt6dXh6SM9fl0ETT5nbwD+vELrarND5d2BiyuH7UpONyT/OezVkdzFT
	xi3n+KhAw0BDcwQbtQvGE9QBCRKHpUENi5uCCayj7v4KoYz4WmTd6eVeuRk54wXil
X-Gm-Gg: ASbGncs5jpRg85X7jtsEvAxjwlv4lw5n/bTGsAPwpuvj9fnO1UfDFcwJVlA4NDGa1LP
	BqH+W1eOF0f1zwWL/LHMuxhvHLt+mVHz4yZXBzRjEM1A7wqeqq2vxnlm0lXazi2+zXAiUVKVn1U
	1THLOwR3hpnBYx2FM0oI+75jY+YatsslzT33FpfXb/E7f+4IuznsFhknz8YA86LjNRcH56bws68
	UOyKpoIJBwSBmsMPrZ7B9iU83UpbIr+5T8Sgp6JTw+zKJxle4GpchxqRQfC+3n8kdyPv+RKc1l6
	HKLxbZ0Yh0t0nkzIGqwImnsm/AOPbH0bom8=
X-Received: by 2002:a05:6214:5504:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6dd2332ec62mr16425146d6.4.1734701161315;
        Fri, 20 Dec 2024 05:26:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkq09EQ0ae97mVq22oeA9jfGWGDmW+Y+xZX/h1a5jnx6pnSBVt7BZ44l6VTdHgTK4Dtqih8Q==
X-Received: by 2002:a05:6214:5504:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6dd2332ec62mr16424876d6.4.1734701160960;
        Fri, 20 Dec 2024 05:26:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015270sm175995166b.162.2024.12.20.05.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:26:00 -0800 (PST)
Message-ID: <7d33eed7-92ba-4cbb-89b0-9b7e894f1c94@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 14:25:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: Wojciech Slenska <wojciech.slenska@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220073540.37631-2-wojciech.slenska@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eyDSK2zRNA3wPJAzrQoNUqcD-li8PJtA
X-Proofpoint-ORIG-GUID: eyDSK2zRNA3wPJAzrQoNUqcD-li8PJtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=976 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200111

On 20.12.2024 8:35 AM, Wojciech Slenska wrote:
> Document that ipa on qcm2290 uses version 4.2, the same
> as sc7180.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---

FWIW this needs some more work on the Linux side, the IPA driver
currently hardcodes a reference to IMEM, which has a different
base between these two SoCs.

The IMEM region doesn't seem to be used as of current, but things
will explode the second it is.

A long overdue update would be to make the IPA driver consume
a syscon/memory-region-like property pointing to IMEM (or a slice
of it, maybe Alex knows what it was supposed to be used for).

Konrad


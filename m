Return-Path: <linux-arm-msm+bounces-59507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB48AC4C5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5490189CDD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2703E255F26;
	Tue, 27 May 2025 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXpRh3/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F1253F23
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342481; cv=none; b=doWrWvldhkczYlGbs2E1IHFpvVR49Nh+KDKfN1JZfLSMtJeNqq8c9P/xxtIDfmFZyaLWmIkEZtf5Sqlz72ZxqV7fdF0MZ5ABZI7CGkmdJikyIAVRS9nQZE3cTioVk1Q2xR1mMlboSX/VRwwZVKJvTRuJON9GgRXkqv2Dqnefb50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342481; c=relaxed/simple;
	bh=KnXhIRyJ/2uqiCfiU+IePoK2w+gLCO+RzIIb2h23UaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZWAS3cmaHIpPNshi0cKXSCTnJ3MUMOzXMLluy9+WtqWTArorBQxMwZvO5ds5NWiU5S4B8579GHW5hs5OS8qha8jexUBQUWIvLXKQJ08ysKmdQyx4/m3FqWR1ANJPAA7mgF14g1+hvCoInaW4zFgEiw+Ri63P0iXHJBW/pHga54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXpRh3/4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAV6vG006838
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbMfH1NRfto0PmBDvRua48GNHdAcU7IFtOBh4J0uTQU=; b=AXpRh3/4HbZS2A9T
	a5HCKQ8rwcxHtjz5OqC2Ym/+l7bsC2HoSv7FWivR6URK86PVbu3B81T7eCC87TNx
	Y0O2igJGr7TTW/iTsMEL8ZZ2S+ikC2iMnWlP969SbfBIT76hbFDLoBTyo3I5xild
	X41Sc1D9cFw78tgaVfH4bQzYk+/mOyGTIHRNgctvT1gLbai/JOekKtec77MfLEbv
	0GLbkrLGrqp45tdvqmF4MbdUOm4ItxG8155P9XwlLZS5dlXTlf5ukeDCmsX9W9Yr
	hdImQIj66wXHgy+mcaFNA1J7qHLfljRgCzPx6q51ggV9RIcdO59bMV6jBff77O9N
	2P7VrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p6hk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:41:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so43833585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342477; x=1748947277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbMfH1NRfto0PmBDvRua48GNHdAcU7IFtOBh4J0uTQU=;
        b=I/JVAS81ipN0xxbZLZFAxDAJyucVG/70v4yg8KLadyzHgJ0KpVhiYfN+WI7mQBgTXG
         s72DIiwtSitk5fzpS8CrvG9aaPZzdi1BYM/Wo/aDf6ItTA/bsKS9LHedbrEKf0P/zmR/
         xbo78fshjitXXzxP9SX1MPIit4CMT+T+xeZ61Y7fhHs+szJ2tuifNPgo6w0k72qXh692
         Ek5OUgrAlPnmoLZ54UIc9L/HY+IKmU45ijrLvZF7dzp5Bd1pRrR5RoQ7osVZLY4jZySd
         c8lnHPGmiFS9x8QDX/PDBtBasuw1Q5VsxzBhlQkxWxcOkhoz9DLuEtNjZWjmPTkUHIbh
         +RrA==
X-Forwarded-Encrypted: i=1; AJvYcCU7JKlIfuIIgxfzbtP6qQci3rSYFP9loq7pItGB0KYbRH4mpST0IZ7U0NrdQUl2VRXvEyvocbOaSdAmjZ+6@vger.kernel.org
X-Gm-Message-State: AOJu0YythuOrf29/yyooP/v51SEScHkkOIWRX7+h5QN1ylK8BUpQppfX
	tB5X8F1fRl2R6iCCyWKhO7aV/gchgM35PmRGYrgfK1ELFRz9ZkyJkPzzNpry1xlKmRnf0ssFaQM
	+wrhYrSoLbo1YImZd4uQP3aTlXX2wamb2wFY3Pqp0YiZnK53v5hFZN+94c1eScw2JJDcVIBcOGI
	VG
X-Gm-Gg: ASbGncsx8N2J7UEagcDLJCw3BEtmcA8Q28LCdWdOPLdxOZSS5MMw4PYRUREUVp7+UxT
	esXca2iGePVURx1O/Xd2pvfY4eE4hiHn7I+h7MsKz4UxbjS4JFwNQtJgbxUYdBoB8hZtUDW+yW7
	6f8j+RqxDTxtvmdVCmwp330jIjpRU1LPMCKjWOMXts4srC3gVFUXtqQsA+CYwGtNA2tr0iEbYTT
	eY47hCmhmX/FmuvKvKEzrcSwLckicJUZ2XV7NTHjRVFI//E3ASFw7Pzd64HG7SVeaGXenPiMgT3
	RF+/LMEq6Et6709RMFPw0uzOA8Id9r2CR7SMHnaV+dRMiKhIu9jhMvop8rNQ2d+1dw==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr1902656d6.10.1748342477274;
        Tue, 27 May 2025 03:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUyu7qIzk1cV+C4eIOT70R61sE1Mb2oEqRCMc7Lanra/6DIQ72qJaNM4f6++9e/iPl8v+geA==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr1902496d6.10.1748342476910;
        Tue, 27 May 2025 03:41:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af1esm1813993666b.20.2025.05.27.03.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:41:16 -0700 (PDT)
Message-ID: <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yjyokfSfkvcf0faeH3c30tprzci_Cd3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NyBTYWx0ZWRfXwJJNQ4ZfKgbk
 xBqQyaEnBTeih/09WvGr0B8WDcgbU+NiNxVjjiKGRCVSG1THTXuO3mA+uKlNkSl18agHhDdQ79l
 JPJZrh+tDMzLJGmuJOyBm4wLZC/S96hKVLNRFqsHCKKQS7VNmUxzjg9mI0NrderfiAEYwDRUs8F
 e8NmlZJEfSVQg93IUD88RO8oLEkrfaYe/7yEPu8TPsEP/RETecn6ck24DVLSRF2XcD8Tv61fQTZ
 O2JiqxzUPgzCRqathZ5qfNZghu2aaUVfNsCsjDuLSU31ls8v4NoB0hKsSx9N8kEGZ2+acyEDoC9
 qk0ID+mY7GLGcdzf+k51RAIiXAdYNYo1S/XSjOtZ728ProSRuHm8AhNWYFTB3CFqyOG01CHgACm
 xV2ysVv6Z6ZdiQPlyx5ZYaPsIXSSNq8p6Dv+ZyYkBdUXeh6JG3QZFSyF5vLnZfsMhlDm1ALG
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=683596ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=shqGv10mcsBHR8c22w8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: yjyokfSfkvcf0faeH3c30tprzci_Cd3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=746 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270087

On 5/27/25 12:32 PM, Jie Gan wrote:
> 
> 
> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>> during AMBA bus device matching.
>>>
>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>> through a mailbox. However, the camera block resides outside the AP domain,
>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>
>> Which clock drives it then?
> 
> It's qcom,aoss-qmp.
> 
> clk_prepare->qmp_qdss_clk_prepare
> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280

I'm confused about this part:

> However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.

Do we need to poke the QMP of another DRV?

Konrad


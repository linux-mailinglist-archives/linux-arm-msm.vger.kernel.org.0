Return-Path: <linux-arm-msm+bounces-67100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE5B15D19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 915C95643B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE364277CA8;
	Wed, 30 Jul 2025 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iCatHVm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2C226D17;
	Wed, 30 Jul 2025 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869023; cv=none; b=n3rBC7YeE0J6z3pyXgtPIaB6aca/AswDNA+Cq2LflVIqBadMOufLHQaJ1EbfQEGm+bVlPA2jHaIBGDOFrhagVj1KAOFXQFZS68ZGOI49YSdFKGwj6RgaHU0hXU+7SuJbXzN+d0TZXFQhjN58SrtUjXwb1x7aFja3nuCCu410Vf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869023; c=relaxed/simple;
	bh=XdwRXF1vwU95vFtelt2CoD4K8pASq9TpnVnN3vKvdlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KMBrrjcYTqUcAr1p84Tsrju8yDYPL2medEmUL2BJxpIOCznSoA88Qpqud+2gY15cL5yIahF2Ekcd58/ZvPky0Z8jIFOdmvjsefk0pjREg/as21BE2/uhqtEfPgETJMl/84GC9tr1+EkzP9pehHqkuAd+ub13+rsE7l5eevF7vgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iCatHVm/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7aMgi030134;
	Wed, 30 Jul 2025 09:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HN3QFsKMHcbfc05jXceUzFbzV63I1NDAaWCRofmaxfw=; b=iCatHVm/fFT2BCiM
	7oL1RI8ytI3NvkiivMJ5vX5w1/iCSrMM7KZzpBhoY/+smGWvoq4gR2z6a3h8TKXB
	UPHk4xFSCE6JUlLsNvn8TdqLtfVM/464q44wavIRjZA2RmZHh4M7lxKUX+UgDk+t
	BJ8xZmTnjwuCR3+oLvlX07Fn2yGd30eGJlb8yNtoFg86xSD6WGpREnnltUUvuMqa
	ulNYTA0W2FvUCLaXv05Qlsyyxj7rowGdXD9UMz2HXiN3Sb5SHiOx3i0AAXOZEeaX
	SOlYNsvtqYKasugBDPg/reZ5HCx51uVGdWOsIEzPYBazM1ViAbj5EsK6PJHKbsJp
	Mph+Cw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm357t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:50:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9oGCB023010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:50:16 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 02:50:10 -0700
Message-ID: <0a6baf09-b1b8-4573-b53d-574838efd9ec@quicinc.com>
Date: Wed, 30 Jul 2025 15:20:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/18] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <8e56e1a8-7b26-44df-ad57-e2092cb5c9ab@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <8e56e1a8-7b26-44df-ad57-e2092cb5c9ab@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889ead9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=jnxDy751yvgSPKbTsG4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2OCBTYWx0ZWRfX7CShTMhBrB6M
 GGQK00dpo73ItEVCj2y3UrzBn3CX00Gnvn8D7jLwcfKpq8BcHeFOJsHrZDorCIeS/JYheYJj4lG
 eT43xbGnU4iS6r4xn25zR842d6e7YwXjyknplJ358yhh2VochV0Kg1+hs2VA6ZLYPw2vDJRXP55
 PI85ZOfo7+X10+e4YpluRzlp9lciJQWQCsjrjKxoyqw4/nUqIxRHDadw/kSe8teADiQO8gTuCVj
 b1olYUe7CZMkyxnPczpu+S7WSxOM48GkQzzZrbEtlU4bw14AvnMJJkKeyetnz2+93nTzfX5fXsU
 P6N3ynnMdEr5syclCyxPikVqheZACs42ZQIZUfBUmovIvwqs3kE2lneXj2BIPveDBZ3rOBV1vnC
 VR8MRmb4La7/s0GRBl+t64kpeaPVJj01Fj7IT5AZ0s5VwxeZcNUxU8h6tmIm0+qomv/BQ9VN
X-Proofpoint-ORIG-GUID: hDajRQOfgDclSVB4mzJABSjYdyXqo_zy
X-Proofpoint-GUID: hDajRQOfgDclSVB4mzJABSjYdyXqo_zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300068



On 7/29/2025 8:19 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 30/05/2025 15:20, Jagadeesh Kona wrote:
>> In recent QCOM chipsets, PLLs require more than one power domain to be
>> kept ON to configure the PLL. But the current code doesn't enable all
>> the required power domains while configuring the PLLs, this leads to
>> functional issues due to suboptimal settings of PLLs.
>>
>> To address this, add support for handling runtime power management,
>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>> The clock controller can specify PLLs, critical clocks, and runtime PM
>> requirements using the descriptor data. The code in qcom_cc_really_probe()
>> ensures all necessary power domains are enabled before configuring PLLs
>> or critical clocks.
>>
>> This series fixes the below warning reported in SM8550 venus testing due
>> to video_cc_pll0 not properly getting configured during videocc probe
>>
>> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>>
>> The patch adding support to configure the PLLs from common code is
>> picked from below series and updated it.
>> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/
>>
>> This series is dependent on bindings patch in below Vladimir's series, hence
>> included the Vladimir's series patches also in this series and updated them.
>> https://lore.kernel.org/all/20250303225521.1780611-1-vladimir.zapolskiy@linaro.org/
> 
> 
> Could you re-spin patches 13 to 18 to fix the bindings checks ?
> 

I tried applying the patches 13-18 on latest linux-next tip and I see they are applied properly without any conflicts.

Bjorn, can you please help to pick the patches 13-18 to fix the bindings checks[1]. Please let me know if anything needed from me.

[1]: https://lore.kernel.org/oe-kbuild-all/453bd020-8124-4a7d-8d0f-8180d38f1ebc@quicinc.com/#t

Thanks,
Jagadeesh


> Thanks,
> Neil
> 
> <snip>
> 



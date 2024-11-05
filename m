Return-Path: <linux-arm-msm+bounces-36995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DA9BC464
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 05:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A671C212FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 04:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C1618E02B;
	Tue,  5 Nov 2024 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SqdWNhUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C118EAD;
	Tue,  5 Nov 2024 04:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730781723; cv=none; b=UwtGYkF7yX/fxwUk4F+3LdYINxaWIhP9EHR7fxtvDNQnDwz/NDhH+r/qLI+mOJr/gWPY553XKpkQ4pDaqKH9pu+YGrlK/vN0e49owH3ciPTfm9WFEmMgg9gQDBK29iicrb7y7QCHY+ZJ3yXz+pNQZzDGkMRGpGQ8N+kI/U2+3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730781723; c=relaxed/simple;
	bh=GERzyHXG1j7vDe7Sv3QECeL9y4wkacoKyJifFZB5SCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GzsFiCinvSaW8kwqgLNDxZTu0UNH1MCmTjeUiqK19aWxqYA51Enua7/jcK6B2UAzEkaRIBsC3fZp+RcjrO3rxiLKT1PVnbtVeBh6H02RenpY3pkgGu59HjPzD1zdowz03b4skI+Er/iRVUdUomdumt72pXUSVjPl/XhhDXYO3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SqdWNhUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LJNlO001852;
	Tue, 5 Nov 2024 04:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/A196zbFjuy+n7rnSJl+Mcogsu5xntqgmxXdF4fZTc=; b=SqdWNhUvqOV68GuA
	M+B3Yx6C0xtwx8oCoeH8lA7w43IFzUQr1Ori1HeLfRrTUbEkc+xIDnDL1gHRtpuP
	C06rfqfx4rxevl6r7v7WzmHkTozmC/kjCixl1bH9a+McYbbgvkWH3AO9xfEggOWk
	gOhtviKBNgJXw+GuucF5rbcay3VK9rMWrFkdlua5EOaZdctE/YaZvz9XV9HRZ2mm
	PYR0Hz1fKqp9pfdJ7cwQ1kSwaQWjo4aUwg6XEV1+mX7Eie/0o7izztbRInFbbnlu
	NDa3Q9aL6KOMOqqXvoVovF/Imhn8r0Hr6V9FKMgav2hwe1ahk1jirXANPG7WYpmG
	Yk+0Qg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s6bj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 04:41:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A54ftuD010042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 04:41:55 GMT
Received: from [10.216.1.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 20:41:50 -0800
Message-ID: <59562d2d-936e-4a96-b9de-d152a503e552@quicinc.com>
Date: Tue, 5 Nov 2024 10:11:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
 <f5d24079-58e4-4ca2-a910-4e4b3feb04f7@linaro.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <f5d24079-58e4-4ca2-a910-4e4b3feb04f7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GAP70G87Svtfkkwp3wIctEdBRA--Hh2W
X-Proofpoint-GUID: GAP70G87Svtfkkwp3wIctEdBRA--Hh2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=962 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411050031



On 10/30/2024 4:29 PM, Vladimir Zapolskiy wrote:
> On 10/26/24 15:20, Krzysztof Kozlowski wrote:
>> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
>>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
>>> QCS8300 has few additional clocks and minor differences. Hence, reuse
>>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
>>
>> IIUC, these clocks are not valid for SA8775p. How do we deal with such
>> cases for other Qualcomm SoCs?
>>
> 
> It always possible to add a new platform specific header file and
> include the old one.
> 
> For reference see commit a6a61b9701d1 ("dt-bindings: clock: qcom: Add
> SM8650 video clock controller"), I believe that's the preferred way
> of adding new platform clocks whenever technically possible.
> 

Sure, I will follow the same approach as the commit a6a61b9701d1 and 
post next series.

Thanks,
Imran

> -- 
> Best wishes,
> Vladimir



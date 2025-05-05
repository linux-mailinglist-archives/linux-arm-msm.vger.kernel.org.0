Return-Path: <linux-arm-msm+bounces-56736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E20AA8B28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 04:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6424F1718D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E1B17AE11;
	Mon,  5 May 2025 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CCiQxh00"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6259A926;
	Mon,  5 May 2025 02:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746413765; cv=none; b=iU6Psbh361lDcSLRII8+G7rVIYxJ66CE89aqx9ruzucvI4U+8Q1IGsmxdSBbgTNWl3VQTnwQm/OKxxi3eW1m8YgrTkIZ2eRNWOKPNGNVgX44/9eMtq2yNjlHBY2q0btk5+gYoNFWpWs5JebA/oY983mFrDJgN1yZD23DN9G5SaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746413765; c=relaxed/simple;
	bh=UlQTcS7rlFN6lhT4jiWiQ22qFEDMk+oKrR7MyccS7Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ubQwx5egEEs7wT8qTmgxqauydjlbPH3mKpV8u/QON+QTkxhd2DS8RoBazfRLFgOmIITfvJSeWvvetm2N9Pcx0psisjEOgB6WW32WbYtoR7MaM6gTfb9ILtyzutummWRDEXODLU/xoiIb2Zj7dsyAlsEXKWN11rQwhmUGpO+6LSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CCiQxh00; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5450qGd2003887;
	Mon, 5 May 2025 02:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aoYCbuFP3GvV9BVv4ncUjwwl5fh3wSnTSOds+VVBpkA=; b=CCiQxh004jTYXAi8
	GGS6ed7XeV6S0MR4TjnSi7fVd+iPfZE8VNi2YYc9qmKPhawWgaTmUt1q57ZIPHW+
	jZc/Rr9GBc3un7SlD8XUZBfbJy7Yv03sULaUQ3eMU/Y45WP3nQCKSAAqBZHC9ySV
	RrVhNtpYhpVt69kqHYeHqFK0DCN8bBieV7DwU//TXxCCs048qUVuK0yQnIk21fy/
	5cY7YX63EmCQrIQSAo1Pb4L/6/W5Kg0BLAimMlhF6f+52j6Tr0f8I06+OOIIoH+q
	b2L6QNkZVyyuCVCSg5tERU587yaEK9Ay/n22gLMjaXipmdIyaFBaLbeEdzx0EiT5
	S+9KVw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xssb21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 02:55:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5452tvME022835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 02:55:57 GMT
Received: from [10.253.35.117] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 May 2025
 19:55:53 -0700
Message-ID: <180f39e6-63d6-4ab0-b49e-b1b4865ef1af@quicinc.com>
Date: Mon, 5 May 2025 10:55:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
To: George Moussalem <george.moussalem@outlook.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
 <8f11c588-aba8-4550-9066-c6bdda0416d1@quicinc.com>
 <DS7PR19MB888331536B4AD7BA18EA106C9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <DS7PR19MB888331536B4AD7BA18EA106C9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H6opwA0wrF_nDO05IfwAicC2UzgZ3AF0
X-Proofpoint-ORIG-GUID: H6opwA0wrF_nDO05IfwAicC2UzgZ3AF0
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=681828be cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=u3U2UH9Ptk7rdtJn0EcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAyNyBTYWx0ZWRfX9LfIRXtvoOMx
 mu4uU9qu1KzCKhd+zzYG02lMexAOxAt6iCHt23bgGXIaGk00L7an3t9Xrp6mUyTF6BhgpHeul0O
 tb7WQCXU7t7myQwyIBhYrFw3N3LJ07CcMhzGDGit6U9Febyoq4iVV1dZrsb0BQ7Q6p3zAoZBhUc
 gioJc/Upk+vSsVE65D3+WS9d61PV0lSFqd2VHON/Q+zUmZOWLqNkJlJe/XVm7KrxCtqwH7iMDDJ
 1woLSbT3lf6fhXsfIjDo4nVuOdUXk/NHVUgw163cJw0kwlyCIll8AyKp80Q8x88v2YPUcho4OHT
 +RmTAq7Z81V3ySECTaLRwUzW1OVstOzqH7qtgkX7Pwdji4tO0A9zG/lZSwR6464ux4ty785qPEA
 JcHjCtkPYaxy4uhPVbBbr5EkgKYlbM6eG1+egEGwkLbyoRJxeugvwKjwkKx/bq+4pk7ewhyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=652 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050027



On 5/4/2025 3:03 PM, George Moussalem wrote:
>>> +  qcom,cmn-pll-eth-enable:
>>> +    description: Register in TCSR to enable CMN PLL to ethernet
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    items:
>>> +        - description: phandle of TCSR syscon
>>> +        - description: offset of TCSR register to enable CMN PLL to 
>>> ethernet
>>> +
>>
>> This TCSR should not be a part of CMN PLL, it is the LDO controller for
>> the internal GEPHY in IPQ5018 SoC, which can be moved to a part of GEPHY
>> device.
> 
> I'm preparing a patch for the ipq5018 GE PHY too so can move it there. 
> Can you confirm the uniphy isn't dependent on this too? There are boards 
> out there which don't use the GE PHY at all, so if the uniphy depends on 
> it for SGMII/SGMII+, this approach wouldn't work.

This TCSR only impacts the GEPHY, has no effect on UNIPHY (PCS).



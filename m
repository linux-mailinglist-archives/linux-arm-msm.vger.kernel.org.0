Return-Path: <linux-arm-msm+bounces-39508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E99DBE98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E553282487
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65BC339A0;
	Fri, 29 Nov 2024 02:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fz7NSojs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2518E2A;
	Fri, 29 Nov 2024 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732846542; cv=none; b=bFCjWeCzmJ9REtGpL0MjMyBJVs8Hc7cgakNaEOf3ZIJtBKAsmIyVwcgWL5aZRfsfpSup08I9mJs8q+a7tjCFB8u3X7uXikKU3BschynvgfKO+Y1266UVItCIGxWhIZgH+a3eB/FAtMdlEcH8wAios0J56ZkLiPLUMh7fuu5SFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732846542; c=relaxed/simple;
	bh=JDgAx56/PKz6HW9Ytaf/JMC+Y+5LU/TMJAo/YX4XWDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dxtazQDNV14DYsUWdRl0W1U4wgXmNK3DlP/mZklHt8oA3ZNfYND7POjjEckI+3cG1TWHO73/G7GtR/jB9bJ9kwnTFuEn+vF0FAjWzZFWqF9IAZXU5mT+zTGCStNbyNcF2ndEHbIo4XuDQMaPxq9h4C4Hqir9SIev34cGAXHepfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fz7NSojs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT0JKEw002596;
	Fri, 29 Nov 2024 02:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnCXYh9EBUtACJ3QFcG10ixeCHdMahTFQ6gWDEyhfaE=; b=fz7NSojsdH4dcKtw
	7ngUcFsrhkqpq9CbJIq4ML2F6mnTtOG7M86ZjBjlb1MJTT3cKHFH4BX/7f3uObYr
	/aOJpRR/hjfnafOUjjmtC52k9Vt8SffGYfFAbNb/JGnMX34TYHyniX5Jo+gSmz61
	xantghcHcN2rxEYdyKY4v73P3pTf7x47oLIbo48hkC/EOuPNqfA445pak2UWiCiK
	mXje4zyLdQo7PqAMTeqPe2v5BMhvOpMooCNFtkF8kz/v1Xip/Loo6V8pdhS7ZeCa
	xk0A5TRfkknXs9FbB/rtLbGIFPhXr5aE9+surTYMvfnhsPOPHK6bduukXL1XlieY
	XKtsuA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y0430a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:15:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2FYHK022859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:15:34 GMT
Received: from [10.239.28.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:15:30 -0800
Message-ID: <ec9b28b2-9fe3-403b-b77f-95696f4e2d3d@quicinc.com>
Date: Fri, 29 Nov 2024 10:15:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: net: Add QCA6698 Bluetooth
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-3-quic_chejiang@quicinc.com>
 <bd4cb046-f0c1-4044-897c-00f30c6e84d2@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <bd4cb046-f0c1-4044-897c-00f30c6e84d2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eqQgkk268lP-cOJTd_kMpMF3za12GESk
X-Proofpoint-GUID: eqQgkk268lP-cOJTd_kMpMF3za12GESk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290016

Hi Krzysztof,

On 11/28/2024 10:41 PM, Krzysztof Kozlowski wrote:
> On 28/11/2024 13:09, Cheng Jiang wrote:
>> Add the compatible for the Bluetooth part of the Qualcomm QCA6698 chipset.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.
> </form letter>
> 
> Respond to the comment and then implement it.
> 
> Also, version your patches correct and provide changelog. This is v2,
> not v1.
> 
Thank you for the guidance. 

> Best regards,
> Krzysztof



Return-Path: <linux-arm-msm+bounces-52738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C54A745B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B987189CAD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F39211A21;
	Fri, 28 Mar 2025 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XMmvzhZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC21CAA9E;
	Fri, 28 Mar 2025 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151923; cv=none; b=PaSwQLBJOjqzCJKcFldHfcL0oCevWsnbPTcSi393NO64+mFGEThL0t8bnufyYgZ/2q474Uea7Z13ea3wWQVyXwUU2DCkRy+0jVkzuuNoQH5Cgaf6hF1+TaQttuPQ5P0+zpnkpFAjDKvu9Z7B7uhpteRdBTph/mpkjVdQ70MJXbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151923; c=relaxed/simple;
	bh=FlC+37ZiGcWL51fch9yxH6KM9+9dpWQkrmsOyOZA0kY=;
	h=Message-ID:Date:MIME-Version:To:CC:References:Subject:From:
	 In-Reply-To:Content-Type; b=gCXIkTdtljcewicd55pgkacqNd86yHxRYWgabROBvSN6yhjBXDwi47wmwPeyNZAwWratxcFugk5pMppyEPLFmSDzob+mPNuE8sX4VRxwwY1bkDhQadu/VwoWlOZM7gWdNL+E9hJ/ZqnEgbfEvrcJBQqsBfyZ66GkWadvym/uSZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XMmvzhZb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S1UGE6016879;
	Fri, 28 Mar 2025 08:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyG8JFZiRbUg5Gq8GBkPclQ3vKTpi36PdswEVszV1z0=; b=XMmvzhZbeXD3MyNe
	brL+4A9MaV8ToH6/FjdJEXyYUL0ebW2XfzpIZWklfx9+pRxF5iaCIcannoBjNVDl
	HYH05NzKm/2KaqUzsoTrWxGOgGPWJAKiTePuRu0+w3mMH9FIiMwJ8Y6aAWYrSABR
	tArGj5P2pF82ttIsiznQVXOX47HE8cfu8GldNoMSXz9mljKdNEUg+eMPDMv5c5UA
	GbsnuJ8guRb9Pap+DCu8EX5GvpaXO8M7mcsJu5Zp6Ffdpqzp+JFOXQpMPau424gH
	l8YrHeeFuEBqtZc2A3GHt8nNr+IcnC2yu9LfYQd/cO6hkS4b6VRtNLeOv860kp89
	XhcLGA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nj5q94fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 08:51:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52S8pu5M008063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 08:51:56 GMT
Received: from [10.218.5.175] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 01:51:53 -0700
Message-ID: <79504e6d-5ccb-4909-a88e-307280c5d359@quicinc.com>
Date: Fri, 28 Mar 2025 14:21:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <konrad.dybcio@oss.qualcomm.com>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lumag@kernel.org>,
        <quic_pbrahma@quicinc.com>, <robh@kernel.org>
References: <c5ead68a-f108-4e73-aea0-d6cb562092ac@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <c5ead68a-f108-4e73-aea0-d6cb562092ac@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QkuncVBr8qHMhrdsP0y3Q50KOBIa1QBh
X-Proofpoint-ORIG-GUID: QkuncVBr8qHMhrdsP0y3Q50KOBIa1QBh
X-Authority-Analysis: v=2.4 cv=Gr9C+l1C c=1 sm=1 tr=0 ts=67e6632e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=7tu3_stWU1f-8F5rTL4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 mlxlogscore=635 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280060

Hi Konrad

Can you please share any updates from your internal investigation?
Do you still have concerns or can this be merged?

-- 
Thanks and Regards
Pratyush Brahma



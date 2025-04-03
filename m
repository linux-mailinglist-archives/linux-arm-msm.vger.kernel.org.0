Return-Path: <linux-arm-msm+bounces-53129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA061A7A9AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 20:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 913611759CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 18:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A561A23A1;
	Thu,  3 Apr 2025 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h238Tgn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F0C8E0;
	Thu,  3 Apr 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706032; cv=none; b=A2IN5/RzJ8LfaBlm3MCzjArVeVcbdBZHbcbLMTZ/RMHhQmImgxYbLBVYwWiS4RQ2tMkIqSbFczagIvO3vudRXblLVubrr6OoiLEA4jjGasYvnVMQBzG1yhYVZICiim0OMv1454RDgbgSIE9ocXfnVIRoDsWOsm9wTJDyl59BRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706032; c=relaxed/simple;
	bh=S8lX3+2jjlV9EDSpRH8ptbR8hdsbyeTq5/HGywWkDqE=;
	h=Message-ID:Date:MIME-Version:To:CC:References:Subject:From:
	 In-Reply-To:Content-Type; b=pEpnOIlOBhIw+tntO0sgx7N4/Tz9C3DYam5g7nBzIeK3QC3kie1VF2+cPJXyh1IqfuNWosmyKFIPGulSz8bY3u1NOdz2Pv7HJOJfj2D77feLjQb0z9Ptj6SiN8m7HFox+2KRTU8FLLfqxpurUSp8oshmdXYIgYsHNY0c7Umx0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h238Tgn9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533IVSPY001346;
	Thu, 3 Apr 2025 18:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1+5DE93SgzZCZ3haePFVy5C9q7r4YPsE5IK6TRqgwI=; b=h238Tgn9QeivoGYN
	EL8S19fi059mR9qMzXxXMh9998ZXWAZBTKUpTlzM36DuoaWpaEAStXZwTmY1BRn7
	Gr039q3TcbusntFbU25WUtPvRhqjRcsI4v6vgXI/J+RL7mQqX7e/FcYn2rRLcWf5
	W8cyRjZx1GOlZVKptqZxmOBtDYmo8fKPmrUy9lKw0cNzWVpn42igCSwqFO04tNDA
	mj26IIPHXlUrSvXkZDHEVPu7MD5/VJiacNltMjuBL2gndgVtTPyZ763Jy9WTyg6n
	NLcp3/DaWgoXiFE9gIuR6Nk2CMwcgBA/c62KcAc8ek40Uzo7tLN1A48IyGJP7l7s
	n0WHsg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45se4g2rjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 18:47:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 533Il7aC010710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 18:47:07 GMT
Received: from [10.216.27.125] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Apr 2025
 11:47:03 -0700
Message-ID: <88c96fb0-0546-4642-a968-900ac3233909@quicinc.com>
Date: Fri, 4 Apr 2025 00:16:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <andersson@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <konrad.dybcio@oss.qualcomm.com>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lumag@kernel.org>, <robh@kernel.org>
References: <79504e6d-5ccb-4909-a88e-307280c5d359@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <79504e6d-5ccb-4909-a88e-307280c5d359@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H9QvqqFbBQJXz2wDq-e6AgrmwFPRvO_z
X-Authority-Analysis: v=2.4 cv=a8Iw9VSF c=1 sm=1 tr=0 ts=67eed7ab cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=iUS7yFBv8MyuA1rBbmIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: H9QvqqFbBQJXz2wDq-e6AgrmwFPRvO_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_08,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=577 malwarescore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030097

Hi Bjorn

Can this be considered for merge given that no concerns have been raised
in the past few weeks?

-- 
Thanks and Regards
Pratyush Brahma



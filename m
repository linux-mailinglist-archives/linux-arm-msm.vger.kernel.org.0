Return-Path: <linux-arm-msm+bounces-30277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687E966740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 18:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E13F1F25B1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 16:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9CB1B6524;
	Fri, 30 Aug 2024 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pOMb1304"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1C1B5313;
	Fri, 30 Aug 2024 16:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725036296; cv=none; b=Cznkj3KwN0osqlPhjz4lpkI89/9lq68MFPYTDFOYawKpoU6z/w5b9J3ZFw+oJuJmP+B0P513WTobUsUW6c8sQ2pPBJ99WBXBdnUDibMvW93AfhUMlI84CQAW48B3uBfIJH6NW/snxNOkrweKH779pj1ArZ3IypSj6MY3fZCJFpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725036296; c=relaxed/simple;
	bh=cAx/CkSWaWBsOEdX3c4Sy30s5GhSkh62nw8fBxVHlBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Da4MMt9Ch3XDPpndtH3DHb3ePwxwCHsI5Dn4EshuBc0GxUvhk2Aaj1MoNFV8FsrL407y5/+26bCpOiBlWsS5EE6bPQKuaU3f3RCYN/LpcyRB7ThK7uW06bZxW42+rlHS43kY/kVog+eek71+4Xnr7m085GoV09YUkGezptYnT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pOMb1304; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFI2jI028797;
	Fri, 30 Aug 2024 16:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTXvTkGDdGSjOfgJlvddv1N2iFsBozj7rOvj7GAdUJQ=; b=pOMb1304Cbvlf3TN
	8p83Z/mIQfgAaovKh4Z/wSAJ1KQcsjCsBu3n7jfTST58JbXbRMRtwh1ZaPUl6H55
	aN2+BxJ2a57zT3D/pjUa/RTZ+gt5RONggAGfdkwCbp4tCvGZz7MgPjaCXLYOHXXU
	9mvA14URxvZS5JrNbpqAkPxkGXKIDhYPDNDYSARJvu1ar1CPb8sWbXQVzGOEx2iZ
	30hV3X1pAz2v4gFNcMgYYglQSLFC7zP0yGC7nyVjqJ0JtPvxQ2z5IJhPITYtR/vA
	HCpdCP0+EABsyu2hTzZbThYRbgL9bGF0DfsAcx4oYNxZD501CM6CtirbKk7D1cET
	G5y2ag==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ax4mk8x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 16:44:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UGifL2032621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 16:44:41 GMT
Received: from [10.110.126.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 09:44:40 -0700
Message-ID: <9b495b92-5b6f-4a8f-8877-fef111b7259c@quicinc.com>
Date: Fri, 30 Aug 2024 09:44:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
To: Krzysztof Kozlowski <krzk@kernel.org>,
        songchai
	<quic_songchai@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        "Mike
 Leach" <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
 <20240830092311.14400-2-quic_songchai@quicinc.com>
 <0a79b9df-4ca4-4dc8-9930-3fa1dc7d3174@kernel.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <0a79b9df-4ca4-4dc8-9930-3fa1dc7d3174@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NwKB0PFUnUcS7bfCt6_Q1lyvobbJ-T_m
X-Proofpoint-ORIG-GUID: NwKB0PFUnUcS7bfCt6_Q1lyvobbJ-T_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=788
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300128

On 8/30/2024 3:11 AM, Krzysztof Kozlowski wrote:
>> Add a new coresight-tgu.yaml file to describe the bindings required to
>> define the TGU in the device trees.
>>
>> Signed-off-by: songchai <quic_songchai@quicinc.com>
> It feels like you are using login name as real name. Please investigate
> this and confirm whether latin transcription/transliteration of your
> name is like above.

It should be "Signed-off-by: Sam Chai <quic_songchai@quicinc.com>" ? 


-- 
---Trilok Soni



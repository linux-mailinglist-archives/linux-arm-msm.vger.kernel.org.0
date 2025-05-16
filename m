Return-Path: <linux-arm-msm+bounces-58197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5168AB9AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C68817DACC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360CB238D54;
	Fri, 16 May 2025 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N8yXsf+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF52376E1;
	Fri, 16 May 2025 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393194; cv=none; b=mMeCWskXm+L+RKjiVKDeT0BYDIeBJ+YcctEkx3go19V4ORuP4pI5eGjE3lDXKuyjbBaSF9MAoxtchq22oKiJLpQDuRACJ5ipS0PtvmkvE/w5hbHdkPGLGIgkaeIJ0oh/EmomJQOK+DjiiXp6VLbdPi4e+3y7LkgMe8InIojq5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393194; c=relaxed/simple;
	bh=ceUyDP/AgA4ZYlbwY1o6qyfuzkXQjy3vPbxZDljfKSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oA4cqxrd6OduWpnyOQKB1D/SOuBTtrLZChmW1Ir5oufR+fD3iRffAHgq//9dqo11+8n5N4ymr5BdXt3etVWr5F4CkH2rgjg41EMX3eIYwxzmmlmutZDdjIS+i7oDXWZQfTgHDjmaYLTMG+ekobk0ZSwYWnsMJnjQUs1Um0xhh6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N8yXsf+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G40WwO001795;
	Fri, 16 May 2025 10:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhaje0yiLVs8KTTuPDwpOOOKiFeWxe8la47MOEnCjPY=; b=N8yXsf+xUqA9EoaK
	6EjIH2jJmh0YJV9bc/ogXPhMMXeWhKt0gqo2ne7TveBjXd5cthxLh3iU1SC83aFM
	VlNOQDFOq5/Yk/qmMG7WhVDDbezuQt8BBTC7aaPxZXPrZxLyMrYhxzRIBI4LcFps
	Optdn1xjHwvzkcfOHs5xQxzfQ5y7Taqxiud0ZqSJwfINricfN/WqddCxbEch+R+Z
	zUQ+PhNNQ9EV1eppZoh4tCSfBrrszfAUnT8pjusjyRwI3gEloxplso9kVRZkrXYc
	qFnwOmoD8rsE1CoGL4I1Wfv3x0rbNm1H4aGC71Yj71kAsYPkZbdat/yp0603CfEF
	KyWr/w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrhht8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:59:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GAxYV7007898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:59:34 GMT
Received: from [10.253.77.60] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 03:59:28 -0700
Message-ID: <1b209aa2-6399-40d5-9fa9-70a712a57aa2@quicinc.com>
Date: Fri, 16 May 2025 18:59:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
 <20250514195821.56df5c60@kernel.org>
 <27cf4b47-2ded-4a37-9717-1ede521d8639@quicinc.com>
 <20250515072457.55902bfd@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250515072457.55902bfd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pfhM-R8RXIFjm-mBw1jDByh1m__v2JJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNCBTYWx0ZWRfX8NcUXlfSgtIq
 BsgRb/eajTwvEIyApnmNql3ET2SJJy+asmjXa+Rv2Hvz6xEfeBDF5URip8FI8aIBEIjs02xbj0o
 7LmKKQFAFoJq8EPy7ToHLE/+quoMWEPs/BuBL0OgHY8ZZBBH/genym4AVieq37OodVUgmRr6RHK
 adADn0NCitY6bIFzYHAnKczZ5kejOoZkk867L8PND2nkkTlxqe5Q9zz7e4OhA/rXQqrCj63RoMN
 Enpd2ULUasfP7qXiw1zIxK12TjRwdJhlBOhTLxQenRiiucmm8pTr7tFwGzMoj+w0uYLZTe+8K0k
 CiJ5Jy1DlcEILE8R16yiQYLWLnFdD7s20cVqDt6JMcCVCGDTBxSCJ+oG+wyvYfca/ly9EIsesB9
 MmQWt6IVKNNbcNypJokSAg/gkjW9NiMaURe2I5nRo62ELazwV/GrQkPsmlH9wcSSfj7+vFYR
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68271a97 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=Ht6I3Yxflf12Oa7PA1sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pfhM-R8RXIFjm-mBw1jDByh1m__v2JJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=906 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160104



On 5/15/2025 10:24 PM, Jakub Kicinski wrote:
> On Thu, 15 May 2025 22:19:11 +0800 Luo Jie wrote:
>> However, from the patchwork result as below, it seems the dependent
>> patch series (for FIELD_MODIFY() macro) did not get picked to validate
>> the PPE driver patch series together. This dependency is mentioned in
>> the cover letter. Could you advise what could be wrong here, which is
>> preventing the dependent patch to be picked up? Thanks.
> 
> Please try to read more about kernel development process.
> These patches are not in Linus's tree or the networking tree.
> If you want to use them you have to wait with your submission
> until after the next merge window.

OK, understand now. I will push the new version after the next
merge window. Thanks for the information.


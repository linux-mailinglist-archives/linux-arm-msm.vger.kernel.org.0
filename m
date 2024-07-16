Return-Path: <linux-arm-msm+bounces-26273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC18B9320D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 861FF2849CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 07:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10A61F5F5;
	Tue, 16 Jul 2024 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HPETwiBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B9196;
	Tue, 16 Jul 2024 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721113248; cv=none; b=k9lwVlnHyZJwq5KQzNheHheJZ7DodA2CuPZvHdcNMNUToZyj4/cyryQyMDG+33AuWdSfzXWu4yfQNe+nIrcVSt522XQo6X1C/D6Pcndcr+jfHMkxb4ttLqFEFgSxfAsVBvd2oA65OrgMR5/2g6w2TCtSwtlRms98Y8WA5K8CcRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721113248; c=relaxed/simple;
	bh=Lb5BfWwfXD1W2vdI6TG7Vn7ilEe0ebcG3kNqQ5aOXYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QnLw/OPE5hStdGi2/kko7NvlwOsosdmo/aYaTpbGtSUoK/mfY+63qUiVr4jSy8gcwIM8q+4H8g1NWbyHuXTRwogFBw+iPf1lOjWEMcaIrPZhgkLfc2/R+Oa8w4MuQr5ucK+Ts/BNptgxeZ6p83rCuRJV23OYKzOJEZagZVyYkio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HPETwiBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G4XUu1016917;
	Tue, 16 Jul 2024 07:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITeBy0oov4fGUP+gZYoNcS9Gm/5LHpylTb5XUEZUGL8=; b=HPETwiBUDhi9XEFh
	h8Yaei+X0aJezWhsgdh0M2/mnIE5ny/hvebcRq8uLj7WZepzH9DNj4b63dumhUTP
	FYbDP6PjTkfZYznUCReQnOSDb7TS3/6k/Dl9qfDG23SjlC2v2G5IYuxeCQ2YesrQ
	bwh3RrBA75nXLadc7H7AUi+W9I4VyKVamlice/6vt28wme9Lq359Rwws68OwFS8b
	4em3TLX6pFxzk4RumjtC+KTLK8y8hRnjqzyOxiksuf0ngUVC6tsGXpF93okF+70Y
	QyAwzq7FrPwR/XJ6jgRLF6CYvWVzi5pLo7vcVoDz7elPjirgQeGGL/QapIjQ9fsq
	Ywh5mg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bgk6p9f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 07:00:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46G70dC7031482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 07:00:39 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 00:00:37 -0700
Message-ID: <8fd5abb2-caea-4e72-a07b-5a1d0cecc1d1@quicinc.com>
Date: Tue, 16 Jul 2024 15:00:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Mark APPS and PCIE SMMUs as
 DMA coherent
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Andrew Halaney <ahalaney@redhat.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240715071649.25738-1-quic_qqzhou@quicinc.com>
 <nulprwjd52j2iq7cpx5nq733cbi6ccdpemq6a7ocglv4ep5jmh@jvs6zof5u535>
 <c8b0c7ce-f02a-4d38-8473-4c20287ddbcc@quicinc.com>
 <20240716060536.GH3446@thinkpad>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <20240716060536.GH3446@thinkpad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HtSc5oV-vQlbxLQHPp_pFZqWPwzbIglL
X-Proofpoint-ORIG-GUID: HtSc5oV-vQlbxLQHPp_pFZqWPwzbIglL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=881 suspectscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160052

Hi Mani,
Thanks for reviewing, do you mean to post a new patch which adds "Fixes:" tags and "cc: stable@vger.kernel.org"?

在 7/16/2024 2:05 PM, Manivannan Sadhasivam 写道:
> On Tue, Jul 16, 2024 at 02:00:15PM +0800, Qingqing Zhou wrote:
>>
>>
>> 在 7/16/2024 2:14 AM, Andrew Halaney 写道:
>>> On Mon, Jul 15, 2024 at 12:46:49PM GMT, Qingqing Zhou wrote:
>>>> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
>>>> mark the APPS and PCIE ones as well.
>>>>
>>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>>
>>> I think this deserves a Fixes tag as well, not treating it as
>>> dma-coherent is a bug and can lead to difficult to debug errors based on
>>> a quick search through lkml.
>>>
>>> Thanks,
>>> Andrew
>>>
>>
>> Andrew, thanks for your review comments, do you mean to add below two lines?
>> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
>> Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")
>>
> 
> Yes, looks to be it. With the tags added,
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> And CC stable if the offending commits went into any stable kernels.
> 
> - Mani
> 


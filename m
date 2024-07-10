Return-Path: <linux-arm-msm+bounces-25753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05692C835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 04:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5918E1C21F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 02:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE208BE7;
	Wed, 10 Jul 2024 02:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BcpIw3ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A47D8494;
	Wed, 10 Jul 2024 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720576905; cv=none; b=P9ARYc3hbVSdcYSGd/oY19m5iv6sPKGncBYPwWDAweeoOh4PZwIQlpDkXOr3oaBDW6/WX9yuOCVLq/uyeUUWdWWsscN53p3eJeErirNSB7HXtSUmIlGFphRJNZAMl7Dss1bJhsJuqKTQwQkckw5noCVSaIyDX43O4UQtEemK2Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720576905; c=relaxed/simple;
	bh=ag9G3uTLzPw3Q/85l+cb8KvIQMNOv3I9sUC3DfHC0Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tZeRxaBNkmGvfSDV+BSbB6vQJR9V/K4BlZWv8utGkbAw9IUb5kaQYAeGfEJKibMALi9mRToMr4C2xAXo9KUqaJu0/W97wNKvZRaogmECpDu7B/CoYF93SuchZjvg9UJjQt4M0GRCTn5kYaeDuivGhO/RxRm1ziRtr+pDwAHVmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BcpIw3ea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A0Cmi7003666;
	Wed, 10 Jul 2024 02:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95OMNfa2bp8hyoNxG6N/Ew6YeWI3rkWHyKTmpUTTtP0=; b=BcpIw3eaURYjnBfI
	Q7TjdGnggC0xHTR7FhmfD60kSuyq2o4hzHMx0ESzDWUftHewEg8ECSxKTurI9G0l
	yUu6Qc+nZwfypEF7xNI5LjSUDNkhLj9vo27Ib2XZvCIt35EmWsOVOWvtX82kqqJJ
	zSRKS119TBFJrzRBiN3Dqap4IHShzMYAD55vaGfvQNehzBTOSQ838q/mr35+yodd
	NXZIDEFOROkCSNUDAe9M0rSX9r0Fc5rIJtmcPm5QggJPC/HTrHzu6kYx3P4vhMaf
	H5dBZZ0PxtCFxSqBOEhD5/S5T0/1xDFZV7WblTolER/9J988SubjASEa8YRqc2m8
	L0QEDQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwqynj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 02:01:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46A21F86030913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 02:01:15 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 19:01:07 -0700
Message-ID: <0f571c5f-db8d-4951-9e4f-cc1246ed4167@quicinc.com>
Date: Wed, 10 Jul 2024 10:01:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos: add support for
 emac4 on qcs9100 platforms
To: Andrew Halaney <ahalaney@redhat.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <kernel@quicinc.com>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
 <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mg8id_SMcxa-Q12v0K26zxL_kL-xh26U
X-Proofpoint-ORIG-GUID: mg8id_SMcxa-Q12v0K26zxL_kL-xh26U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_12,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100014



On 7/9/2024 10:40 PM, Andrew Halaney wrote:
> These patches are for netdev, so you need to follow the netdev
> rules, i.e. the subject should be have [PATCH net-next] in it, etc as
> documented over here:
> 
>     https://docs.kernel.org/process/maintainer-netdev.html#tl-dr
> 

Thx very much for the detailed information.

> On Tue, Jul 09, 2024 at 10:13:18PM GMT, Tengfei Fan wrote:
>> QCS9100 uses EMAC version 4, add the relevant defines, rename the
>> has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
>> and add the new compatible.
> 
> This blurb isn't capturing what's done in this change, please make it
> reflect the patch.

There is a similar comments on [1] on another patch. Similar comments
should be taken care of next time.
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-30-quic_tengfan@quicinc.com/
> 
> Thanks,
> Andrew
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu


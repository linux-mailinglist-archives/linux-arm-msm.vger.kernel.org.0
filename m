Return-Path: <linux-arm-msm+bounces-23904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC899146E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A921F20DD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F28D134414;
	Mon, 24 Jun 2024 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="izvhq6VU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7483A8C0;
	Mon, 24 Jun 2024 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223211; cv=none; b=fGvOmbyDoCsYE4vi0eW+cTakmR1NQP18lsSR6CfwB6xmQ8taaX21Ar4Yl23Fdvv9abA5Tvy6jvcEh9UX7kDn8c65QSnZOyjZF3MMWfEP01bLrqDed4Ba1H+fTXMnJK35Dkn5Bhqq+I3SRJ7x6oay2bXayP6vINI+6fCkVOI6sII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223211; c=relaxed/simple;
	bh=Z6XtZSYtyE44Zfz1dL1xvU5SvUFzCQOKmwl7QK6bZGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BiBTvYrC/8HwNwTjO5gLLOz4MCH3GQkEtPY86jdeE9urmg3Um8slYP6NUIu8e52LT9pDqNKxwB16CEo/amAHq2BAvrnVsBmU4dpZXIyImtabX561JBiMPiXsjsXzcUQb02NNvm1doek9drZEORyBiiCcytbaw/Rpfe72GgoSgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=izvhq6VU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8YdCr007810;
	Mon, 24 Jun 2024 10:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFES5/fqOKWLUxSlyT+KvRcG52YTUWZsrEOHgjHgUnM=; b=izvhq6VUXFLJ5kyb
	+wIirxWmNHs71/rfkofspQsa2leJeDo9lVnSqz5ta6lelZvCJX3NfnMr8Jpw1aOp
	X5NQvTclaDAZeR4UXadPCfqCtfclVwpVaioAPQ+0Aa6g/leFekOK9xiE5DGeIGGL
	X80ClAmcx7reONicViy9xJSkIjBL7uhpL8/ghIdSjGEjTVbVppXQCVMzfVn6gJsS
	Gf/6ceIz4BI7Hn9Z2z68QysaZHYcznsa8oNRzyscgmox+wm8rGJ3aXB+TQ2DYp0N
	lPnHIl9H3z/4GUBs6Wx0WZNPtwCgQ4xJZR2lPbzx9Ub4PuZe3v30V1F8MFOjSbe6
	0hquZw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrucp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 10:00:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OA05eU007730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 10:00:05 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 03:00:00 -0700
Message-ID: <7cc374b8-ebf2-0dde-2733-bb188e6591de@quicinc.com>
Date: Mon, 24 Jun 2024 15:29:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2] arm64: dts: qcom: x1e80100: Add fastrpc nodes
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>
References: <20240618145601.239101-1-quic_sibis@quicinc.com>
 <2fb391fe-84ab-4c15-9d8f-4119bff0572c@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <2fb391fe-84ab-4c15-9d8f-4119bff0572c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TOq2EUeZaDQOI3FZn-dZS8XHbFaQr4Jj
X-Proofpoint-ORIG-GUID: TOq2EUeZaDQOI3FZn-dZS8XHbFaQr4Jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=901
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240080



On 6/19/24 00:45, Konrad Dybcio wrote:
> 
> 
> On 6/18/24 16:56, Sibi Sankar wrote:
>> Add fastrpc nodes for ADSP and CDSP on X1E80100 SoC.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Hey Konrad,
Thanks for taking time to review the series :)

>> ---
> 
> [...]
> 
>> +
>> +                    compute-cb@1 {
>> +                        compatible = "qcom,fastrpc-compute-cb";
>> +                        reg = <1>;
>> +                        iommus = <&apps_smmu 0x0c01 0x20>,
>> +                             <&apps_smmu 0x0c21 0x20>;
> 
> (0x0c01 & ~0x20) == (0x0c21 & ~0x20), is this repetition required by
> the firmware, or would it work with the latter entry dropped? (and
> all others in this cdsp fastrpc list)

Yes the latter can/should be dropped. Thanks for catching this. Will
fix this in the next re-spin.

-Sibi

> 
> Konrad


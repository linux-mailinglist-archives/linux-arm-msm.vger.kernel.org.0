Return-Path: <linux-arm-msm+bounces-4205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2780C701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 11:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F72D1C20C10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AA92574E;
	Mon, 11 Dec 2023 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ljksot2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD95DB;
	Mon, 11 Dec 2023 02:46:46 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB7fvGB010334;
	Mon, 11 Dec 2023 10:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gfsSO4gaUDWuNNtV5zD/nWi9pPLJa4RDXsEvWGPH95Q=; b=Lj
	ksot2AZXgDE8AcjG27iwae/k75nf2d+jb7Yu9Uacfv+BRxIfawJtAK2V8YwK0+0f
	a1YiuCIQD9SnW9SZmdjPX7OUiwdGgKqYOQXlwPAjWX2lZqjX/zbpz0aWdNzR+kLm
	8rg2xPZhWABOK4XprxsygeWt5KIEgPDMqLq/UasSGSbmutIazCwarQTO7k4IrIe2
	NrNOPOty8a6UXNf37jtYv7bJ/RxA2WtfknykYnsYT+6dpq8HoN5czd3mf99a74qu
	2dED8odd035wlzzIXY6Cvg8kI7BZr3U6mJ4mgmdP2HSO9U2dedKRoDjm501fKFsO
	5mmTiQvo1bE4gdzDJheA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnhdu0bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:46:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBAkgjM005987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:46:42 GMT
Received: from [10.216.63.6] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 02:46:38 -0800
Message-ID: <02b16773-9592-8ecc-5243-fbaa5bc762b1@quicinc.com>
Date: Mon, 11 Dec 2023 16:16:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: mfd: qcom,tcsr: Add
 compatible for sm8250/sm8350
Content-Language: en-US
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com>
 <170200426910.2871025.1931459275540622967.b4-ty@kernel.org>
 <f521df97-dfd7-b56d-3799-0a72c22edf83@quicinc.com>
In-Reply-To: <f521df97-dfd7-b56d-3799-0a72c22edf83@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nHuOMQzWWl3KUhJJX2KqpwhvHB5K_E7M
X-Proofpoint-ORIG-GUID: nHuOMQzWWl3KUhJJX2KqpwhvHB5K_E7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=610
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110086



On 12/11/2023 1:36 PM, Mukesh Ojha wrote:
> Hi Bjorn,
> 
> I have said in one of the thread here,
> 
> https://lore.kernel.org/lkml/57eed7c3-e884-a28b-a1ff-e5aecbb11137@quicinc.com/
> 
> There is a wrong register offset given for sm8550 in 4/4.
> Since, you applied the changes in your tree, shall i send
> the separate patch for it, or would you mind fixing it ?

Please ignore my mail, I saw you made the correction.
Thanks.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=44b1f64cad5703c87918cc9ffbf9b79bb959418d

-Mukesh

> 
> -Mukesh
> 
> On 12/8/2023 8:27 AM, Bjorn Andersson wrote:
>>
>> On Wed, 25 Oct 2023 22:36:38 +0530, Mukesh Ojha wrote:
>>> Document the compatible for both sm8250 and sm8350 SoCs.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [2/4] arm64: dts: qcom: sm8250: Add TCSR halt register space
>>        commit: d59653233e8779e3fe082eb5635b9785f2095af6
>> [3/4] arm64: dts: qcom: sm8350: Add TCSR halt register space
>>        commit: 1accc6031d925c6045c4776d5f3646996b0b242a
>> [4/4] arm64: dts: qcom: sm8550: Enable download mode register write
>>        commit: 44b1f64cad5703c87918cc9ffbf9b79bb959418d
>>
>> Best regards,


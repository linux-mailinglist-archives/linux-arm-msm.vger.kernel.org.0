Return-Path: <linux-arm-msm+bounces-2288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9E7FBF02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D55E3B20DF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 16:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F6237D1F;
	Tue, 28 Nov 2023 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H9Bn+40s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06C5DA;
	Tue, 28 Nov 2023 08:11:20 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASBliTK019059;
	Tue, 28 Nov 2023 16:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iqbAdlkzfpJ3QRXcSlzFEiRtZrwRPJqcPLYmnFK9te4=;
 b=H9Bn+40scZaA7X7DxIujXYibiSOUDsAMQErDQ2lE7xZ9WQdn30fiajQGldjhRBHGJwN3
 N216pFNn0Z7YBUfWmLk1a7tS1oWUYUdQZRwr9xSVu1fUH4SUNw/Ln+Oa7dDLpTH9Aktb
 Fzp85jTQ3Nd9VFliUO/8oScKD5u2pIp0pH0FHtQ1E9KGGkavvvOtryun3AaFHUcVwmjX
 10Fg4bx4L/8VBCIzaVjhVGPo/86OVLC7zJXi1qf/JQ8vH1umzOZaQa3R8lxCr+O3XPPn
 9WGu+ql+IGJ9pmNxN/WIvpPCU5Iyd16hRC/skT4aBS0nyiG0zfKNSyhp5vJDlqu/mseJ Mw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unfn4rv2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:11:16 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASGBF1g003718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:11:15 GMT
Received: from [10.216.35.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 08:11:10 -0800
Message-ID: <26b69814-201b-8d07-d844-27e804aa3016@quicinc.com>
Date: Tue, 28 Nov 2023 21:41:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V2 0/4] Add runtime PM support for videocc on SM8150
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
 <47925f9e-32aa-4762-a4ec-aa559e18ff12@kernel.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <47925f9e-32aa-4762-a4ec-aa559e18ff12@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: st3HThTTRbxcV2U3hW0UrJWTCjJP1TlH
X-Proofpoint-GUID: st3HThTTRbxcV2U3hW0UrJWTCjJP1TlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_18,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=983 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280129


On 11/20/2023 5:18 PM, Konrad Dybcio wrote:
> On 18.11.2023 13:39, Satya Priya Kakitapalli wrote:
>> Add runtime support for videocc on SM8150 and update the resets
>> and video_pll0_config configuration.
>>
>> Satya Priya Kakitapalli (4):
>>    dt-bindings: clock: Update the videocc resets for sm8150
>>    clk: qcom: videocc-sm8150: Update the videocc resets
>>    clk: qcom: videocc-sm8150: Add missing PLL config properties
>>    clk: qcom: videocc-sm8150: Add runtime PM support
> Hi, it's good practive to include a link to the previous revision
> and a summary of changes.
>
> The b4 tool [1] does that for you, please consider using it.


Hi, I have installed b4 and followed all the steps, but it doesn't 
populate my cover letter with change log and previous series link, do i 
need to use some option for that?


> Konrad
>
> [1] https://b4.docs.kernel.org/en/latest/index.html


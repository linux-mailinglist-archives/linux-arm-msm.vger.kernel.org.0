Return-Path: <linux-arm-msm+bounces-848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B37EEC61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 07:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 238ADB20A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 06:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E810AD283;
	Fri, 17 Nov 2023 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WkcgXa9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7F4B7;
	Thu, 16 Nov 2023 22:49:41 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH5xMr5014589;
	Fri, 17 Nov 2023 06:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kTC0tcok5Ie8ReVC/YEjhAjeA9fVfyXmg09Uiea/CsM=;
 b=WkcgXa9JXgPHm7XqvlstZ3tQTATF16uyVoW0VMPmvU4DxI1n2DGs/qWfmVk23JWcat+y
 v9AlTeN+xTT3R1DaBszBn1ePPTu3rmvlPGpQhRA7wSHgPzVvyvxLmspDNedue3crhE29
 1FcW6Ip2nXa0IBRcWaZo5iHPT5w+pIdSDXXkOvxr1Yy4KJGH73wTDM9D7pgG7XwDR2AT
 eBIzuDx8puKtoVfGUGfyGmnPTmvDTAX3V0ZXQ3Mf3z6zRlP9OpR2dcNKbDFAEX8E3e5O
 Xf1HX0px5WyLdLFmEuZxFndBQRHUPF2Z0Nqg3ekW7VIpJslIR5aXhDkPK+iqLt8fmmd1 SA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udpqq1kay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 06:49:36 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH6nZGR017718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 06:49:35 GMT
Received: from [10.216.18.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 Nov
 2023 22:49:30 -0800
Message-ID: <2bc0e34e-fd4e-0b43-90f9-0ce38eab57b7@quicinc.com>
Date: Fri, 17 Nov 2023 12:19:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V3 3/4] clk: qcom: Add ECPRICC driver support for QDU1000
 and QRU1000
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Andy Gross <agross@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231106103027.3988871-1-quic_imrashai@quicinc.com>
 <20231106103027.3988871-4-quic_imrashai@quicinc.com>
 <CAA8EJpoGLCfrWQ5r8cOcqyWmF2ZTTqPxFy_HVzPC-A-dCiV48A@mail.gmail.com>
 <8a1ce949-204a-1c22-c554-67b31379eb7c@quicinc.com>
 <e8dc01a1-f3fd-4c23-9607-62a199b6a2bb@linaro.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <e8dc01a1-f3fd-4c23-9607-62a199b6a2bb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p0gNXc9UnoId_L4FWapz0T36LOWSAzAp
X-Proofpoint-ORIG-GUID: p0gNXc9UnoId_L4FWapz0T36LOWSAzAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_03,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=644 impostorscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170047



On 11/16/2023 8:31 PM, Konrad Dybcio wrote:
> 
> 
> On 11/10/23 09:34, Imran Shaik wrote:
>>
>>
>> On 11/6/2023 6:34 PM, Dmitry Baryshkov wrote:
>>> On Mon, 6 Nov 2023 at 12:32, Imran Shaik <quic_imrashai@quicinc.com> 
>>> wrote:
>>>>
>>>> Add ECPRI Clock Controller (ECPRICC) support for QDU1000 and QRU1000 
>>>> SoCs.
>>>
>>> After reading this series I have one main question. What is ECPRI?
>>> You've never expanded this acronym.
>>>
>>
>> This is a clock controller for eCPRI Specification V2.0 Common Public 
>> Radio Interface.
> This should be under description: in bindings
> 
> Konrad

Sure, will update the bindings description and post the next series.

Thanks,
Imran


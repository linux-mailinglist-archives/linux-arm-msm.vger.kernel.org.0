Return-Path: <linux-arm-msm+bounces-175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F367E5383
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 11:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83F611C20A6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 10:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18287D29E;
	Wed,  8 Nov 2023 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hnlSDDqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD13D526;
	Wed,  8 Nov 2023 10:41:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBAE1723;
	Wed,  8 Nov 2023 02:41:13 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A89qjdj024523;
	Wed, 8 Nov 2023 10:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OeUsSoLKavclQgNda6VqukwhXJOhP3aMnXxDNooxqQ0=;
 b=hnlSDDqDaNO6FfZSdaCgW3V0v9VRzfTKzAkIRm8gDWi12rSnyaaN+m1fUfgaR4pM4Tqd
 mg+bdbVM9C213uTts7xbHm6ggb9JyCiD9dkhH8HaR0oQ7zVzIVFKvcNW8uijz7tyVUB7
 YOJ9VGIdEDI74/G9LCa6MbKB0XePxUE9R9bUaX7RPhSmXNcdA0LJw5f4hDUhDuhW3KJ+
 nd54M7cOl4Ak4l0lunuzYx6CHLtJhD9FkJSC3gzM48bAmWUcnOqUJ9cVGnvJPGazQEV1
 OmwrH/X+iO6fZ6N/QJqkvKK2gjKAmpyZg0YST3poVcZIBTaGQs1Mzaj1Jd6qAX5SPj24 SA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u7w7r9b83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 10:41:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A8Af73i004439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Nov 2023 10:41:08 GMT
Received: from [10.201.206.238] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 8 Nov
 2023 02:41:00 -0800
Message-ID: <969a2789-ef46-c6ac-dec2-51ef0a362a1e@quicinc.com>
Date: Wed, 8 Nov 2023 16:10:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 09/11] remoteproc: qcom: Add Hexagon based multipd
 rproc driver
Content-Language: en-US
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_eberman@quicinc.com>, <quic_gurus@quicinc.com>,
        <kvalo@kernel.org>, <loic.poulain@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20230802140606.2041889-1-quic_mmanikan@quicinc.com>
 <20230802140606.2041889-10-quic_mmanikan@quicinc.com>
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <20230802140606.2041889-10-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XjpLpwTSaL1Vm-AYHlATKhOYIUBbuNhk
X-Proofpoint-ORIG-GUID: XjpLpwTSaL1Vm-AYHlATKhOYIUBbuNhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=688 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311080089



On 8/2/2023 7:36 PM, Manikanta Mylavarapu wrote:
> It adds support to bring up remoteproc's on multipd model.
> Pd means protection domain. It's similar to process in Linux.
> Here QDSP6 processor runs each wifi radio functionality on a
> separate process. One process can't access other process
> resources, so this is termed as PD i.e protection domain.
> 
> Here we have two pd's called root and user pd. We can correlate
> Root pd as root and user pd as user in linux. Root pd has more
> privileges than user pd. Root will provide services to user pd.
> 
>  From remoteproc driver perspective, root pd corresponds to QDSP6
> processor bring up and user pd corresponds to Wifi radio (WCSS)
> bring up.
> 
> Here WCSS(user) PD is dependent on Q6(root) PD, so first
> q6 pd should be up before wcss pd. After wcss pd goes down,
> q6 pd should be turned off.
> 

Thanks Krzysztof, Kalle, Rob, Bjorn for all your reviews.
I have addressed them in this series.
Can you please suggest and help me to take this forward ?

Thanks & Regards,
Manikanta.


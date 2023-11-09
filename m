Return-Path: <linux-arm-msm+bounces-238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E227E66D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04632810EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5EE12B6A;
	Thu,  9 Nov 2023 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JYrzbt93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661413AC0;
	Thu,  9 Nov 2023 09:32:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F80F26B1;
	Thu,  9 Nov 2023 01:32:27 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A96P0WG020094;
	Thu, 9 Nov 2023 09:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MSo0Vd/69lNAkS5dSr1C0Fck1TJ8I+/LEIYMTgmoCzE=;
 b=JYrzbt93maSKFhnVd+VaV9VBcQoaVHJRep8WTGN1AzlGsR1+lWHk4P7bzy8S23pXfCPU
 ctjX+YD4np4DTE1cr+cdxP0E8FHoEuQN/r7pTBfzj6CjL5RxA4UPQCWZMOTcLJUdaqdu
 wF64Jm+nahfxlHXNHZ7myajDI4Vb8sCW11lJGP5FzZaDQjIwCOTxhKEmCkrUjbd3KXhh
 KcjOzTp/RAfZ8LlKt9bOLsrPpkI77wQ+TTkCIQJrA79WnmWaSb6Xn7a+rMHgB1ebD9HS
 9UNsTwmb17FQuuD6RPPpgURcohh5OvBD59R39Y83398ibAktduWGe4RW6maKgeiRKB0E vg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8s088tq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 09:32:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A99WApj002213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Nov 2023 09:32:10 GMT
Received: from [10.217.219.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 01:32:05 -0800
Message-ID: <65d2bba9-b04c-f91b-100a-ffb07e9b615a@quicinc.com>
Date: Thu, 9 Nov 2023 15:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 0/3] phy: qcom-qmp-pcie: Add support to keep refclk
 always on
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_vpernami@quicinc.com>, <quic_parass@quicinc.com>
References: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com>
 <8a12ccba-908d-405a-8fcb-411d50a66ebe@linaro.org>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <8a12ccba-908d-405a-8fcb-411d50a66ebe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8cMpDyCswSDpKModc_41BgKMsQz2H4aa
X-Proofpoint-ORIG-GUID: 8cMpDyCswSDpKModc_41BgKMsQz2H4aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_08,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=760 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090075


On 11/8/2023 3:27 AM, Konrad Dybcio wrote:
>
>
> On 11/7/23 13:26, Krishna chaitanya chundru wrote:
>> This series adds support to provide refclk to endpoint even in low
>> power states.
>>
>> Due to some platform specific issues with CLKREQ signal, it is not being
>> propagated to the host and as host doesn't know the clkreq signal 
>> host is
>> not sending refclk. Due to this endpoint is seeing linkdown and going
>> to bad state.
>> To avoid those ref clk should be provided always to the endpoint. The
>> issue is coming only when ep intiates the L1.1 or L1.2 exit and clkreq
>> is not being propagated properly to the host.
> I'm gonna sound like a broken record, but:
>
> How much power does this consume? Would it matter if we kept this
> clock always-on for all platforms with this version of the phy?
>
> Konrad

We see about 22mw extra power consumption with refclk always on.

We can't keep this property always on as there is impact on power 
consumption.

- Krishna Chaitanya




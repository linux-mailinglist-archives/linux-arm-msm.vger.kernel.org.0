Return-Path: <linux-arm-msm+bounces-23494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FB911951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73669B21C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 04:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BACD12BF3A;
	Fri, 21 Jun 2024 04:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UDb3M3Ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD51E535;
	Fri, 21 Jun 2024 04:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718943936; cv=none; b=gPQj+I668YzgOwzhkkpU8qJxv7U8d7Lq0T2NoG4vMjIZEIRkBwEwZ4svW0vzncWnFj1fguTo7hS6AYTR4JQ0S2kcJFUWXA6h51zXWJ/BjwuBXYlqmBN3F2PupuHGA3W0sG54PKp7uS0Nk2ps5gFXKF/BE5pHDVu0qP4IdINEk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718943936; c=relaxed/simple;
	bh=2cTZ604Ar95swiOr3iQOQyFMx2TXtPaf8GtYJqAZFwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cMKg340+WrmipOlEkBUBhElu81Oo+QF/WoOmvAftUyIbCmX5OVTJmBiByWABzpkTBGMakX62Kb8h5DfoafFI/0vFV8Ut1pvnGbNSMSVn/zbH+qimQcIy1gFm1FxaUCbhnfe1fvB5II/oDyZ5TTLMhDck/taDJUlgVXb+cn+WEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UDb3M3Ah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHFxLw013496;
	Fri, 21 Jun 2024 04:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sV/by03nprfCagOxCGFMtDuem6G+JpmzOCIiwNrt9CI=; b=UDb3M3Ah2YWK9Oxw
	qh/3vRVlvVorL53bkcXVErTjqIU6toUv+DPXmr33jb0zXHpZdKdG0B1W3bzOpxse
	U86yVK5LF5fNK2t0NVev9hR9L0pSP72BklDCcEgyLENPYpmytiO8RhyXSk0zKJIB
	1GEAQ8y0b+0UVSN6PpI21GFMq6ioYw0AO6fvOjd+MxWKueMN8Hi/yLh/ywNVtSQF
	TLiU/WDPCgbYZKGf+0PXiZ+0ozE0QEqnHR+0XEH5twkAWAJ4R/kGqQRVhQ6hNjS0
	4vLFnaLEF1h+9lsTKHEk4w57J7NCsjc03f35Qq3/YYRW70BR5zRsqwNVXV1S8zKu
	mIYyQA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrnyhbw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 04:25:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45L4PEqI029596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 04:25:14 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 21:25:08 -0700
Message-ID: <ac8781fe-e8f1-4ba7-8f7d-ebfcbaadbcee@quicinc.com>
Date: Fri, 21 Jun 2024 09:54:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add SA8775P video clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
 <20240612-sa8775p-mm-clock-controllers-v1-1-db295a846ee7@quicinc.com>
 <e1424d12-4dd8-4a8a-a8b5-ac94476fa3d3@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <e1424d12-4dd8-4a8a-a8b5-ac94476fa3d3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O5ggWtnhqmUe8sBytdKaDIBBNI5oHEd0
X-Proofpoint-ORIG-GUID: O5ggWtnhqmUe8sBytdKaDIBBNI5oHEd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406210030



On 6/13/2024 12:58 PM, Krzysztof Kozlowski wrote:
> On 12/06/2024 12:47, Taniya Das wrote:
>> Add device tree bindings for the video clock controller on Qualcomm
>> SA8775P platform.
> 
> You claim it is a v1, but I saw it and already commented on this. No
> changelog, no versioning, so my comments were ignored?
> 
> Please go back to previous comments, implement then, respond and then
> send v3 with all comments addressed.
> 

Krzysztof, I mentioned the below in the cover letter of this series. Did 
I still miss something?

Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P
platform.

These multimedia clock controller and device tree patches are split
from the below series.
https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/

Changes in this series compared to above series:
  [PATCH 1/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 3/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 5/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 7/8]: Split updating sleep_clk frequency to separate patch
  [PATCH 8/8]: Newly added to update sleep_clk frequency to 32000

> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.


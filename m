Return-Path: <linux-arm-msm+bounces-32060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFA897D432
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 12:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0EF1C216E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869504C62B;
	Fri, 20 Sep 2024 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kE1Os6Gl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1051BC46;
	Fri, 20 Sep 2024 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828335; cv=none; b=ptoT+7snyAwgZp07aT677yg9iQXKlqhscNO92d5YP9DvvC7ePZbyoMkm9PP+T+WnlKycFwkMWggfjGNWqpR8/gG3uCID14bknISLSAL1on+cJR2QNtMMFHj4DQAsLeIiZDLPrNH3vKeSNVe/IpdTKJnSOKYANniR7makkLxfF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828335; c=relaxed/simple;
	bh=QFzruwUB5mDp1IbVvvLIMHWezj5sHK08Q71q6P+wdjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BDAwdPGCg3smQQo4ig3tlKEl6XFocwEqipDH1YmaEpYlYiZmchYGofeXs8oF0qx14V3WmNRL49+lD1KG/TpJhD/Ut+kWw6XmA6UI2AGShBWfX1Dhr5ViGZYkyHSSrsu0VY8sQbvHByFeJZ5lJkiFEdqvdiqb/6kwqnltqMCRQZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kE1Os6Gl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K84Yjq005788;
	Fri, 20 Sep 2024 10:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWR+Ld9pcV0LdcC1SWmp8s/9godB2fW5sczBXNzXy9k=; b=kE1Os6Gl4F21v2hr
	e29w7PmN4JAI7PK9y9flHO9vFN9VQxAAzjIEJRY31QMy+2tdpHNO5YvbusyPWPwP
	hLUP4aRD+UVr23SbHnk1n4xSRkAB+0df+IEIrBFok6hf+9IygUm5p/wD0gVjsJR3
	ICLciloeZqM82no2j3wEGAwtYHrFN6rEcR6/1aj26oFZBPQouQxOEVvZDxY3s2Gi
	epww0Pmq95tRggC1k/S8vjNe3V/HUSFQVp2Xc7Qwth89Mn4w1mhjHF3xUCVgdcw8
	FjteJMBNu7aNDzEzVpdZ2CEdgaqhATIB4ItHxkyaarYX7V9fiSdfGKAtF6YZqK0K
	/YElOQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jj0t61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:32:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KAW8w9025479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:32:08 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 03:32:04 -0700
Message-ID: <0515c7c9-6eb9-4b2d-9b63-6e7f935f1a6a@quicinc.com>
Date: Fri, 20 Sep 2024 16:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings
 for QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com>
 <20240919-qcs615-clock-driver-v1-1-51c0cc92e3a2@quicinc.com>
 <96e54706-3e49-4d78-8edc-fa3a66215a1c@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <96e54706-3e49-4d78-8edc-fa3a66215a1c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Wuh2_7G_lvQW5wERe4tlLyr6Pp7s8suS
X-Proofpoint-GUID: Wuh2_7G_lvQW5wERe4tlLyr6Pp7s8suS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=675 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200075



On 9/19/2024 5:49 PM, Krzysztof Kozlowski wrote:
>>         - qcom,qdu1000-rpmh-clk
>> +      - qcom,qcs615-rpmh-clk
> This goes before qdu, keep alphabetical order please.

Yes, definitely my bad to miss in both the files.

-- 
Thanks & Regards,
Taniya Das.


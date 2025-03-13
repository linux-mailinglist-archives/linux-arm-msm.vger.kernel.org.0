Return-Path: <linux-arm-msm+bounces-51216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2569A5EADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6115D7A9F72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8920C141987;
	Thu, 13 Mar 2025 05:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gV24+jqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8507139D1B;
	Thu, 13 Mar 2025 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741842537; cv=none; b=DcWazzif03UuwKF0dFjmhu7Hy0xZdQ+Scc4Hhqaj/Xi8VzlN7QW7MrC56mU875FniJyQBEW6h8/Xca0D6gaIddGVmYY7/3Y08phKeUZGy4aiJSNoz+llEcysGogk/eUKT+msODq0lwomRxnFOnkMkl1R/0N/oHPp9OVQG1MbVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741842537; c=relaxed/simple;
	bh=b+gB/bj/u2w9hJBB+Brii29ugRs3+xLuZWKCiJWE724=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jgnQLGxvN2K9ai3Yl3bXj0Z8mWhJkH2p6nZDEl82FnIsJjk2DZzdNUFS4adCz4IlH10TZp1DGWb5Bujbp5xIJbF5BeVCgv4fNiw8OJ0wZ1gqs/Xufe79Zcoofd2EXpNhY3FqDh0A6szvFMVVLHWL/t06w5oE/YWAXmXn6d/IElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gV24+jqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CKLU0B013654;
	Thu, 13 Mar 2025 05:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAZgkWjij/bqtx9GgE9Wpe4QoKRhLY1S0Jub+7/TYRk=; b=gV24+jqmk5Mc1Jkn
	S1t87cethNT7FZedzmRe41bngTfoyOL8DbDt3nerkiwL6XYulplw8U2rGREEpyvg
	DgOkaDvOf4EHLG/xWDqJb+pAXwLcbhe+m5Begc54esXtQ74IO/jwLvZbmirjwiME
	3cfogy1c2h2pbH4TgLj1uBZfmNjgILYRoMeq0f9c9d8ScAUllhqlvNB9Z3asI6cX
	Bxw2a661E7wYlJabzDjXYyyTJ+Ci2sZuJeleeD2XMnYSqKULVtZhFStI5U5LJLRf
	YqTzh4WHmI1aQAfwKZVEy+TQTHQtV9NYUlcqF1S5Q25MgzUo389U0qXHZ9ktkyxP
	w4k3SA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nmmrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:08:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D58f4s018711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:08:41 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 22:08:36 -0700
Message-ID: <b2265099-cf95-47b0-add4-5b0f89e61ba3@quicinc.com>
Date: Thu, 13 Mar 2025 10:38:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
 <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=67d2685a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=vGHd0kDLeNPC5odisEEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -3tWWf_R1xeqdOO2JC1PlrDonj_Xg9DC
X-Proofpoint-GUID: -3tWWf_R1xeqdOO2JC1PlrDonj_Xg9DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130038



On 2/21/2025 7:41 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 21, 2025 at 02:50:13PM +0530, Taniya Das wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Just noticed. I've never replied with this tag. I've provided a comment
> to the v3 of the series, then in v4 this somehow appeared. Could you
> please comment, what has happened?
> 

I am still confused how the tags were added, as I used only b4 to pull
the patches, only there was one patch from patch series#3 to patch
series#4 was to drop one patch as it was already picked up by Bjorn.

This patch has tag only from Krzysztof.

https://patchwork.kernel.org/project/linux-clk/patch/20241101-qcs615-mm-clockcontroller-v2-3-d1a4870a4aed@quicinc.com/


I will check all the series and correct the tags.


>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  54 ++++++++++
>>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>>  2 files changed, 164 insertions(+)
> 



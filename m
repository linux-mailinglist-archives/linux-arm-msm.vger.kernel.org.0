Return-Path: <linux-arm-msm+bounces-39011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1E9D7A4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 04:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E05281A16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 03:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D61417BA9;
	Mon, 25 Nov 2024 03:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MCJ/ZkuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ECB2500CE;
	Mon, 25 Nov 2024 03:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732504938; cv=none; b=liZZVuENJuGSO0O6hMtXfgX1meEcWpfkEBXEipD2i3deSgF2NrUvn4e7IuO5q0HgLim5159eUi/72yFwwTyOIrSveXi0ItQ9jZhy/OklU6FdiepaD8/d3NwvCc59Gq7J1A8ctJ5nsOgAajoHasPNfFNiht3y0KX6ep2C6mSSvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732504938; c=relaxed/simple;
	bh=Mp9AjKn2HYbZnlIY8RW/zJoovSYeQ+NF+kMs5TwLers=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RlrZduhky5Yk2yOW6Ipuo3YGCqV4mHo4sp3mUy2lp9QqZD5v+Vd6IVvtNbjwWRg2wQuWaeAAWrHv/G2eLVd22Z5zoKNVQ+Z2s7Cpwpw9yUOtqbzEFAOXnggSRM5nFCccsf2wW0w6VCoI2k1gLBxzfZInJCq0vgXwnmP7ikGWMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MCJ/ZkuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMrWfX012575;
	Mon, 25 Nov 2024 03:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNBWXEC7+0ri8hN3xVC6JJZbLxPsSBF1ILLFblF3CvA=; b=MCJ/ZkuGaiC1QLDY
	W59yJni2pnNmDVwTWZ6seyLyUUCxX33krYernExCmFSMSjsMIqEVo7nsDDLagn6g
	oFzfUTLwAaFQBjr824+P4+8H5qLogJjwZ6Qi/mB0mQbT2MlosCJsVLq68poQvEdD
	ibM72qO05FPEkF/PjuN76Weo1nnIqbRy7+ca9yYRuRyg5jVkMdnG4dqPEis5wP9I
	WA8UTSXxn8LpK6Z+SUuOhR0UUz555vvUHGlssqrSeMFHhTp5GQheLGEnk5EEHLR+
	rYqnN5JQ9Ewcp82k60mPgAwtj4K01vA/LZycAL1pSCZR3bbupQiXu+YL69uQSBTt
	MWvkeQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmufph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:22:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP3MAuf001389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:22:10 GMT
Received: from [10.253.38.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 19:22:06 -0800
Message-ID: <34ff9c8a-f288-4f76-be22-a1c784c24d2f@quicinc.com>
Date: Mon, 25 Nov 2024 11:22:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add the first 2.5G
 ethernet
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
 <20241123-dts_qcs8300-v4-1-b10b8ac634a9@quicinc.com>
 <355ff08c-d0a8-49e7-8afc-2e4adddf2c9e@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <355ff08c-d0a8-49e7-8afc-2e4adddf2c9e@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TTcvx6yjmz1Zg6OGHlL2EH7Xvn4wwEiD
X-Proofpoint-ORIG-GUID: TTcvx6yjmz1Zg6OGHlL2EH7Xvn4wwEiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=804 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250027



On 2024-11-24 03:36, Andrew Lunn wrote:
>> +		ethernet0: ethernet@23040000 {
>> +			compatible = "qcom,qcs8300-ethqos", "qcom,sa8775p-ethqos";
>> +			reg = <0x0 0x23040000 0x0 0x10000>,
>> +			      <0x0 0x23056000 0x0 0x100>;
>> +			reg-names = "stmmaceth", "rgmii";
> 
> Dumb question which should not stop this getting merged.
> 
> Since this is now a MAC using a SERDES, do you still need the rmgii
> registers? Can the silicon actually do RGMII?

Indeed, the RGMII configuration area is necessary for managing clock 
settings, even when SERDES is utilized. For instance, the 
RGMII_CONFIG2_RGMII_CLK_SEL_CFG bit within RGMII_IO_MACRO_CONFIG2 is set 
in ethqos_configure_sgmii.

> 
> 	Andrew

-- 
Best Regards,
Yijie



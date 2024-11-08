Return-Path: <linux-arm-msm+bounces-37311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB69C150B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C931C243C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 04:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112A8126BE1;
	Fri,  8 Nov 2024 04:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nGeNOhLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83F23AD;
	Fri,  8 Nov 2024 04:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731038451; cv=none; b=jxR0bPmet2LwgnfPNBs6x2y7PRw9qX4n7cGBAaKmlOI7pKpFhrxqbES2FD7tTd3cyncrMq4E+sViRM3kbksoW3yaaxfy+H3fo2oRdj8VTRba6O+P9bd6xp4905xX9dzJZuyxxzwZjgf1hJMSVFWTKH1Mew+XjzwXQWUE5b8duOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731038451; c=relaxed/simple;
	bh=/0W1b+ZJEjv9f9XWOfmkghdU8OqsG4b4j3HrlBlvc1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DyzZYwYd5xv6knSmZ2cgaaLKalLO8v/p49WRVanI043beE3jluPwezypm9QgcZ6bwy+npI5Vh+Avd/EoLE/Wath+0CGZu4XVpwFXW5V419yomkJKrdAFuYHCIKg/djVDFSOD1H79IRFr09tfvXzSF9+uCq8qZ2a7tfNEcOBVyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nGeNOhLT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mam3D030538;
	Fri, 8 Nov 2024 04:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpYfHpat2FxRifMRu2pBkOIkBVRPnVxltBZdPg4v8UE=; b=nGeNOhLTcy+SGieM
	5W5gqeSzTx23aEUhUWfazGn1BI/ZXCEef7a6EC9FnuCI6MwJ5MKggdzE0ixIQDOs
	U3SQsKX0WxJdXBqq9vGnxU1tzQv51l7R8VTuuZFgtJqZgE50J3pLAqKdlr9QAAfo
	rQhfqb2vrIlS/kGhbAhS+FQ5jx8+XKv1YemNEub4mdPwH0h8GRjf8TLdgpGpHyoe
	zpAV7NEeNdGVa8foNfvK8YP5i9458iD9sKgCucU4x6CrFelHEqCyWZeri8aR3HKI
	S/5cPRBFjAZ54YnlLStV4X4/Bnz+Bnn+Vikf6tkJz57lOZZIu3uXDLFDzEI274Qc
	sCieIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gdrk2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 04:00:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A840CQR032019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 04:00:12 GMT
Received: from [10.216.24.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 20:00:06 -0800
Message-ID: <90323c59-acca-488a-b957-f36634787858@quicinc.com>
Date: Fri, 8 Nov 2024 09:30:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-4-d1a4870a4aed@quicinc.com>
 <7be231c6-a5b6-41ec-b43d-cbba07e7c448@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <7be231c6-a5b6-41ec-b43d-cbba07e7c448@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 817rQhPLlNRdG_GCEig1bwpWLQoKLAbT
X-Proofpoint-ORIG-GUID: 817rQhPLlNRdG_GCEig1bwpWLQoKLAbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080032



On 11/1/2024 5:59 PM, Bryan O'Donoghue wrote:
> On 01/11/2024 10:38, Taniya Das wrote:
>> +    .vco_val = 0x2 << 20,
> 
> vco_val = BIT(21)
> 

Will fix it in the next patch.

>> +    .vco_mask = 0x3 << 20,
> 
> Instead of bit shifting couldn't we just use GENMASK ?
> 
> Aside from anything else shifting a hex value by a decimal value isn't 
> the clearest code in the world.
> 
> vco_mask = GENMASK(21, 20)
> 
> Much cleaner.
> 
> drivers/clk/qcom/gcc-sm6115.c
> 
> Same comment for all of the bit-shifts in the series, I appreciate the 
> shifts are what the downstream code does but BIT/GENMASK does this job 
> better.
> 
I agree, will fix it in the next patch.

> Once fixed you can add my
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> to this file


-- 
Thanks & Regards,
Taniya Das.


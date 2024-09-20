Return-Path: <linux-arm-msm+bounces-32061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB91097D437
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 12:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9CB4B22E28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A3E13BC2F;
	Fri, 20 Sep 2024 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E11dRghD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90241BC46;
	Fri, 20 Sep 2024 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828374; cv=none; b=FtF8cU0NX02N3cAn6oQhhDCaOqoDRb1BXLBUUhF2LX/FGeVMW9y40Nwq+QqauOBahT06VRCFL2DSBDbDZp3CGHkfevjjTet+TRxNY9mBOYdgIrNkoqcp2Uqj2ls0oW1LeftuWt9N8wfaMNtqdB2rSueTqrIR7IFPbLuw8MeJU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828374; c=relaxed/simple;
	bh=cBLuyFpH/dcAIp/0/OqNmX8hTtZlQgT0HqLVM0cqNPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V4kVXQ4+eG5xb+xqloUniduL7WJ+GwmLB+nIUbI2YW6S/nFDRWaMRTatifYY18ry7mbtDsmdJzrkkJI1NfCMvtJY5oPz/2CUF+brQ3k3gOuAdEJuuzJ9VHEwlhKJO18AzVuJCBo1n0f6PUa4bXi2QF+dCK0fovRVv5UtqH1sBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E11dRghD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KAJNwH014285;
	Fri, 20 Sep 2024 10:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooCYiQ10d5bNcPUrIwOee54qm/wcLRnE0YEoPL2Rp98=; b=E11dRghDFx22KX6k
	c9W4WUuf9XcMD0AsqJ0Cw1vb5cWjaw6o61oW29caxBCvpvNT3GkqHyMWsfz5W1yf
	dCkquGYmiaXlLKZEc5x1K8JgScHrSjmwBtBzWFfUHAeq/aoWBVy+Cg/y4BQTDQP1
	2AeMeQhWUox3FqBLvb4jtebSQX0f+Dgt3zaICniuQoN7hqOFloYO9DtPekevg5AY
	Ydi3FBJzupaDwmJSvN62WuNR2peqzeEiKBYdtqQOGNhTYDua9DmZmMuOlZg1hQVy
	LoT5SevzaR60m1GiemT0EYXaD+rtY7DLqcNQ7fGwhVYo6JrHDCI/MZvJcDu2O1gj
	pyGOhg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4je0r80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KAWl7o026451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:32:47 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 03:32:39 -0700
Message-ID: <7a440c29-0c01-4dd3-b101-86e0c3ec7d2a@quicinc.com>
Date: Fri, 20 Sep 2024 16:02:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom: Add QCS615 GCC clocks
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
 <20240919-qcs615-clock-driver-v1-3-51c0cc92e3a2@quicinc.com>
 <d9c82785-d78a-4e3e-8b32-e5fd616fef5a@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d9c82785-d78a-4e3e-8b32-e5fd616fef5a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9Q5fe6X9WrcTMb-QvEYa3he4KnPLGc0B
X-Proofpoint-GUID: 9Q5fe6X9WrcTMb-QvEYa3he4KnPLGc0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=861 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200075



On 9/19/2024 5:51 PM, Krzysztof Kozlowski wrote:
>> +  See also:: include/dt-bindings/clock/qcom,qcs615-gcc.h
> Since  I expect resend of patchset (other comments), please also switch
> from :: to single :.
> 
> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

Will fix in the next patch set.
-- 
Thanks & Regards,
Taniya Das.


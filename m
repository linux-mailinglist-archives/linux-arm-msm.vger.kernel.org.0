Return-Path: <linux-arm-msm+bounces-44793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF6A0A3FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 14:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB4697A3745
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 13:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29BB1A238D;
	Sat, 11 Jan 2025 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dClmYMmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5824B22D;
	Sat, 11 Jan 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736603213; cv=none; b=oRgQnQOWmQ4CVv5558Xa2ukxtwake95SKBtoEntag0jhapyopZgFoXMiAAS1fAv6RRRUtLEgL4etz6o/C9faRBgJwcT5r8M0dADHQWpqW7DAZUKOJXZ7FqKQ4q2vW5RgLIkIQVZLMql5VOBaJTKjE0zPmqwxSRRAscR9ZXm8LyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736603213; c=relaxed/simple;
	bh=aZ9cCWH80fN3OFBlDFqtOmWrQ0UWv2va4uTjI1Wcr7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cJONpQ3Q1AnSbWSRD0hzvm47M2wPTNtQnPX8E2zG7OJdtxE3/U1lBK7erlrwlKb3RwUyPNxdV7PyNW/FWt673WrWKiey2NS9cRIhJsC7Ke+JlNNufi1SRNLBZ1m+YcmSpFMg03cLtNKPkA/SZWFWEj2BITbxDK2S0QG9MuC+tOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dClmYMmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50BDHoOv018777;
	Sat, 11 Jan 2025 13:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTbzQpVjL5rC6V/zXb0+3+9DIPoFYNAYfkzCCrwbWMg=; b=dClmYMmI/XB+k7Z3
	BjyL8+IETeWLZ4M+cgjawpg/lr0kFL52+2ziCvv9th1IVj9MG6E2NNTta1KTU+sS
	29d17aKUQGuUFfFNBhB0Q5Soiy7jFyvTtSDqp0nNH8V4cSEqQJNrmtkpULPgBHP0
	B8ihWEUg3Q76qSelUy9iEZaX5kjrpE6RycHn0IYiEa17h9zvOjVFCYv+PdwXPj1i
	JxiNeUhKFKg3aQuX4jJXOF4IPSe3fahiA8tKlw4r45k4+DaNK4m+hlZChVSnD2IW
	OtNnQEq4Cx9OkkFCTwDhQ7dX/+Fe/u9SjjL6epODb9egXFcMUNH78osr7AUmx0HL
	mqok0g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hmy8ktu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 13:46:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50BDke3a021841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 13:46:40 GMT
Received: from [10.216.14.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 Jan
 2025 05:46:34 -0800
Message-ID: <8468e80f-ecf9-4c35-8078-6afa0fe25594@quicinc.com>
Date: Sat, 11 Jan 2025 19:16:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/8] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>,
        "konradybcio@kernel.org"
	<konradybcio@kernel.org>,
        "Manikanta Mylavarapu (QUIC)"
	<quic_mmanikan@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>,
        "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>,
        "Vignesh Viswanathan (QUIC)"
	<quic_viswanat@quicinc.com>,
        "Sricharan Ramabadhran (QUIC)"
	<quic_srichara@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-5-quic_gokulsri@quicinc.com>
 <ligcw5ndzuu4kgegxb6f3ttzpmw6iglyzq5kt4l45xyeemsfsr@f2735qq7frhk>
 <a169904a-1a1c-4bfb-9000-15a504f17522@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <a169904a-1a1c-4bfb-9000-15a504f17522@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DY8j1VjLdljw0l0fjBuf3ajh-ZlooKGa
X-Proofpoint-GUID: DY8j1VjLdljw0l0fjBuf3ajh-ZlooKGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=939 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501110118



>>> +static int wcss_sec_start(struct rproc *rproc)
>>> +{
>>> +	struct wcss_sec *wcss = rproc->priv;
>>> +	struct device *dev = wcss->dev;
>>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
>>
>> Please avoid "parsing" DT in runtime.
> 
> I didn't underatand this.
> 

IIUC, you should handle this in probe (one time) rather than for every 
wcss_sec_start() call. In probe, you are already fetching this data. So 
you can re-use the wcss->desc instead of parsing it again.


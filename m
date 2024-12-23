Return-Path: <linux-arm-msm+bounces-43105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976559FABE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13296165428
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3896518FDAE;
	Mon, 23 Dec 2024 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ro/X5Hy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B07EEB5;
	Mon, 23 Dec 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945687; cv=none; b=HbAcAGug6N+n8uixC/nhD3TtKYbWOljSHVwDzMroOQXj8ifNWCsss3hzNG3uMyq7KCij9n58ARXZVOR8VB9dRKRT27ex9Kx1OPHNikQKgvVskkveJGZIWoIBlyslfbgiHPCxZoXgZLUF5tVhAUaBrrq6aCzTuin1it/AZaPqpBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945687; c=relaxed/simple;
	bh=doCWJOC/CoG9/QccIgUGFSj0lW31gC0SlA/2kgpfxlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i7jbEnpqSN55XnQ+T2KORCbUJ1SfICtOxiG7zS00jGSMlFhgY7NYeKev082ljQuH2/SLnuopz2ljMPdRVsBrlTsrk/kcnAaw4seF5tj1KHSXo0OUyuJQ8E7+JghxT+LtdZcJ0TdHT7MNzOw6biZ1bzAsuIqOa/SNTesBwBdEa24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ro/X5Hy0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN6Biu2020871;
	Mon, 23 Dec 2024 09:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXrbQ1W3pofZXCWlD/rXdIcY5F9H5Y1JMc5Jry2VdC0=; b=Ro/X5Hy0QTZZPniJ
	FaW8QhB06rxTXAeH6GJImohEuHrWUtTM0hf3l+MyLtihu97wmtaMrQQ44oR3MNsJ
	FCler0fJop1V0471hDFlFxqN+z1ZuAj60CW9zzevvr9Hz+d/I/cJHKF7vdOratWS
	5C+cRDcs70IwR1ZZ7CEOa4s0N8LczZOTYfiAr9K6rfxu1MoOEzMOIyiDt6p3ic8f
	E5JSCHxZUh9pYmhdrZs2eNux6fm+6SRlXMaZrde6wnqrS017/yY/k5Ro54torQg4
	S93JDXj0acb1bHM4JT4Rdft6CPsuRwsvF0h2V5HBkQ7dNOGrGiXkccIda0yH6Fzl
	eW07cQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q2cm0r3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:21:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN9L8Tu030499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:21:08 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 01:21:05 -0800
Message-ID: <94a6b2ba-fa52-42d0-a60d-9dc31e37057c@quicinc.com>
Date: Mon, 23 Dec 2024 17:21:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/23] arm64: dts: qcom: Fix remoteproc memory base and
 length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>,
        "Luca
 Weiss" <luca.weiss@fairphone.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8z61j_k-TvtsfNGw8Pj3YfqDPyZ4-08V
X-Proofpoint-ORIG-GUID: 8z61j_k-TvtsfNGw8Pj3YfqDPyZ4-08V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxlogscore=864 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230084

On 12/13/2024 10:53 PM, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Add Rb tags
> - Add four new patches (at the end) for sdx75 and sm6115
> - Link to v2: https://lore.kernel.org/r/20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org
> 
> Changes in v2:
> - arm64: dts: qcom: x1e80100: Fix ADSP...:
>   Commit msg corrections, second paragraph (Johan)
> - Add tags
> - Link to v1: https://lore.kernel.org/r/20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org
> 
> Konrad pointed out during SM8750 review, that numbers are odd, so I
> looked at datasheets and downstream DTS for all previous platforms.
> 
> Most numbers are odd.
> 
> Older platforms like SM8150, SM8250, SC7280, SC8180X seem fine. I could
> not check few like SDX75 or SM6115, due to lack of access to datasheets.
> 
> SM8350, SM8450, SM8550 tested on hardware. Others not, but I don't
> expect any failures because PAS drivers do not use the address space.
> Which also explains why odd numbers did not result in any failures.

In my opinion, the "QCOM_Q6V5_PAS" based Peripheral Authentication
platforms may have the register information completely removed.

There are two types of Peripheral Authentication supported:
  "QCOM_Q6V5_MSS" (self-authenticating)
  "QCOM_Q6V5_PAS" (trust-zone based Authentication)
For "QCOM_Q6V5_PAS" based Peripheral Authentication platforms, use SCM
calls instead of the register-based mechanism. So it is no need to
expose the PUB reg addresses for those platforms.

-- 
Thx and BRs,
Aiqun(Maria) Yu


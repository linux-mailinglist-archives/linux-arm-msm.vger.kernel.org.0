Return-Path: <linux-arm-msm+bounces-73176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88BB53C11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7673B43F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 19:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98B5242927;
	Thu, 11 Sep 2025 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UeFzjKXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE132DC77C;
	Thu, 11 Sep 2025 19:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757617381; cv=none; b=V4aQ+WPGhgy1uPPGWVYzGdCajbwSuF3B3gnA/sj9Y0RQHDb/cZb1uXqUwoXA4O5mgM3vaFJOqigLUZcM8KyDIkzgX56QDaadigR/6apbYjOzNdc2M+ioPb4yXwwZaIMVxNa5w2Zedf8W71y0FaV4KYQPtr87IKEmL7PbpD0rWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757617381; c=relaxed/simple;
	bh=pkxJEvD9oHck9UgN12PpVFUBvVOlUSiUpDQ2JqkUolw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I8oBy+kDZDtKrMXfs29JFomX6dvr0TB8eN1V0N3lxOfuwS4ax1EjRppan5S/8Kh7S65SUgCYYkNthVt+Z4OX9mGk41C/K7NTksVrfdskw0+st69VkqNx3qFCA0eSp203ybsv3h5Z2yAkD1URq+eZC0SY1Dc/SPBZG/Fiif0Eb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UeFzjKXa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB8wCC006691;
	Thu, 11 Sep 2025 19:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBMq/kQPD507cJcIsE32kLWWx91RqZvJnUcZVgxldy0=; b=UeFzjKXaXxMHTu+R
	/dDkqKcyfzDP2fDFuRajFy+1jnHiTj4aDDvOSERrufeJ7BNMirJxvJg0AXHOewIG
	hgSzos46ekSIWx+R+SJDsfZqmNbPnmFMlupGEZAG7LB4v3TR30gkJNeMCFTCJVno
	ttbfIv6+ud4F0Lmapk+e9FWzrPQkDmxJHOlj1iDIT+wtAUCK3bGZK3V2LagKsihN
	ErAaN2ShhprwoS321xaKDZswLXPkOkBBy2g60pHY07WjG5+IO4LRTq8PFe4OsUIG
	0zkzJjKG10qq/QzlsNHKTAV+b29E4tnwsE8lbOrqcpKM6mJeCyh+3C3dzCBmUGKk
	W4vYSA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ah0d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 19:02:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BJ2tdS023791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 19:02:55 GMT
Received: from [10.110.119.34] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 12:02:54 -0700
Message-ID: <6a7bc6b1-7eb6-40a4-82bf-c547b4c07b51@quicinc.com>
Date: Thu, 11 Sep 2025 12:02:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia
	<vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c31ce0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=wr40s-WhVdFOp0t4KT0A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xC-FY3M2P3zEvi9nImD0SjHfT6BvorZk
X-Proofpoint-ORIG-GUID: xC-FY3M2P3zEvi9nImD0SjHfT6BvorZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX7XL/cs737wu/
 keer3JJPlXFSl71M7OR94zcZRqThjL/0/6+BfNTSr8p2WCuxVNZ/ipqFT3XNJTOR7nFR8m5hGz4
 7tmI3RqkApGWRoYK3qW5BI1BFfprl3Zq8sTPmlWlYAWSQiQs4GlLtHtqfC0cxASt3Wmsfp9vIFk
 eiBfaFjeuF+78ZPg2zb7ZwHMvdlvtcSSOqxuYy/1mQDD0nbhi41t6KvYj2Ve8LZ1eme7M9KGaL0
 gZrEVuhQ1frknA+ZX5AamNike9+pfTxKwCVKXVfaa6nBidOzjXO3QOxTbZtGzqeNPV+lKDeqDx5
 JJxNmwQwYiDJPMkRmKqKiWcDvUO9LfdqqtGsYIlhnIOPann5DizVJEnGJuXfwM82oZWZMaoObsv
 Ycfayg0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/11/2025 11:38 AM, Stephan Gerhold wrote:
> Add the necessary definitions to enable the IRIS video codec for
> accelerated video decoding on the X1E CRD and Lenovo ThinkPad T14s. The
> additions are largely copied as-is from sm8550.dtsi with some minor changes
> necessary for X1E.
> 
> The PAS interface used to boot the IRIS firmware is not functional in EL2.

Just to confirm my understanding of above statement. The patches below
works w/ the Gunyah and Linux running at NS-EL1 and "not functional in
EL2" means Video working w/ the KVM Hypervisor on X1E right? 

> The code to start it without using PAS exists already in the Venus driver,
> but was not ported over to IRIS yet. Discussions how to model the
> video-firmware IOMMU are still ongoing, so disable IRIS in x1-el2.dtso for
> now to avoid regressions when running in EL2.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (4):
>       arm64: dts: qcom: x1e80100: Add IRIS video codec
>       arm64: dts: qcom: x1-el2: Disable IRIS for now
>       arm64: dts: qcom: x1e80100-crd: Enable IRIS video codec
>       arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable IRIS
> 
>  arch/arm64/boot/dts/qcom/x1-el2.dtso               |  5 ++
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  5 ++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  4 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 87 ++++++++++++++++++++++
>  4 files changed, 101 insertions(+)
> ---
> base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> change-id: 20250909-x1e-iris-dt-eb0494a130ca
> 
> Best regards,


-- 
---Trilok Soni


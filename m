Return-Path: <linux-arm-msm+bounces-43596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C39FE2C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 07:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719083A1C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 06:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F916185B6D;
	Mon, 30 Dec 2024 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q9l7w5nW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DC152E02;
	Mon, 30 Dec 2024 06:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735538562; cv=none; b=sgZhe8wNvhJsIKKzwJyB5VZhxR1srAH12iamX0yXMu5mXxIyeNAxmcgNjxNc0qoUeBDCg8ORDR4EZMq+ajqIGqxYp+linVLXU4CjKjk6CDGKQaJlMqGOGiNY0ez26Vx/KM+XGDIVic+3Tv26hW7UvdeIc9BW7MibaqeeY48foKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735538562; c=relaxed/simple;
	bh=qg1jo1T/E9cXNYXMJJ/cYMsqyo692cqmzLOxXtJMQsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JnurgQLfA+echCF0xea6h1WErNO4EBTTlSxrSDqkj/AKyGimu4ZzhEijwtUvA7C0fYqrPCUgf+SjMaozr4+YrP3GnU7Td/ofLeyJ1PTY4Mhso7hUF8xmmfEJVh2RIdzv34Ztd7j7O33YGGk93FUmEJwtwj9z5/m6DpBY1HzOVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q9l7w5nW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTMd2s9014531;
	Mon, 30 Dec 2024 06:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ja8BPXdYS2XEVAISm/mtsi1aMgwTsGq/mFmxgASsp9U=; b=Q9l7w5nWzIvqn+Qg
	OnoTajwrJRS7Ue0ABd7fmQ5mUv+6ab0i+1NUYt/6pLhHQW1EtfGZyf6gDTcCNAZg
	bwVsf79rJ72YknIxOnl5/W4I7dENPgBgy3iNJLJ5d09lVpmf9CXsiinLQb12EtEt
	jFJpEc5yPlfcJrAXX4HQZ+aSHAUsJwN6XSEpPsfILYxQptlrfFTL+56gKeF73hoz
	PAdrg0BzZevmg8aD4n+mw542CGcUXo6qqF7YsukOqChpIc6Dxpio2Mizp5JY5YYq
	d1aleyrwD5JozOfH8yZVgu8yzq5REhXDgi+VNbb4ItictNSYybJa2qUdCmZ/eH24
	xpA6eQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43u9tm8yfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 06:02:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU62aYg031501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 06:02:36 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 22:02:31 -0800
Message-ID: <5bf68ae5-c658-4e85-94a8-bccb31ab0692@quicinc.com>
Date: Mon, 30 Dec 2024 14:02:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        "Manaf Meethalavalappu
 Pallikunhi" <quic_manafm@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241229152332.3068172-7-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6qAu2auzqZ-JzOHp24VjgMfaYaDEuyTJ
X-Proofpoint-ORIG-GUID: 6qAu2auzqZ-JzOHp24VjgMfaYaDEuyTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412300049

On 12/29/2024 11:23 PM, Wasim Nazir wrote:
> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> 
> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
[...]
> Add cpu frequency cooling devices that will be used by userspace
> thermal governor to mitigate skin thermal management.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>

Also need to add SOB from the patch handler(Wasim).

Doc can reference [1].
snippets:
 - Signed-off-by: ``Patch handler <handler@mail>``

   SOBs after the author SOB are from people handling and transporting
   the patch, but were not involved in development. SOB chains should
   reflect the **real** route a patch took as it was propagated to us,
   with the first SOB entry signalling primary authorship of a single
   author.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-tip.rst
[1]

> ---
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |   1 +
[...]
> 
>  #include "sa8775p-ride.dtsi"
> +#include "qcs9075-thermal.dtsi"

Thermal nodes are usually added by soc.dtsi chips like sa8775p.dtsi.
From the description, it seems that having thermal information is a
common feature for SOC qcs9075.

Would it be better to have below dts structure instead?:

1) Add a qcs9075.dtsi that includes sa8775p.dtsi and qcs9075-thermal.dtsi.
2) Have a qcs9075-ride.dtsi that includes sa8776p.dtsi and
qcs9075-thermal.dtsi.
3) Ensure all qcs9075 board dts include qcs9075-ride.dtsi

> 
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> new file mode 100644
> index 000000000000..40544c8582c4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/thermal/thermal.h>
> +
> +&cpu0 {
> +	#cooling-cells = <2>;

Why is cpu0 treated specially when it doesn't include
cpu0_idle/thermal-idle nodes? Could you provide the information to the
commit message?

By the way, if there is no cpu0_idle, does that mean the #cooling-cell
is also not needed?

> +};
> +
> +&cpu1 {
[...]
> +
> +/ {
> +	thermal-zones {

The first /thermal-zones is located in sa8775p.dtsi. Should it have an
alias instead of referencing the whole node with the path? Using an
alias can help the reviewer check the previous node's information and
imply that it is an override rather than a newly added node.

> +		cpu-0-1-0-thermal {
> +			trips {
> +				cpu_0_1_0_passive: trip-point1 {

It seems like a common attribute for cpu1-cpu7. Can it be a common trips
node that can be referenced by different cpu-*-*-*-thermal nodes?


-- 
Thx and BRs,
Aiqun(Maria) Yu


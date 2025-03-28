Return-Path: <linux-arm-msm+bounces-52744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F520A7468E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1192C3B3B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BAB2144A0;
	Fri, 28 Mar 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hC2HIV3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5546A214213;
	Fri, 28 Mar 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743155066; cv=none; b=qDDHmXJHlMOb3rN99OeB87LQsxDDNT7SSJiv4MkAC/P/z5l8bGSaNDM3P+beQU0RBvLoYGKp27YXt3eFAl9HsbRA3+42MFYwihK8ooNB276i2UT/PQpG6G+wSthdOsx8b3vS3Y94qGZF/R7dyLiPQpIlIVv8GZJNfmQb2EpkWog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743155066; c=relaxed/simple;
	bh=lCH6JJxjNaQa3teANM2/ZsrcH0FwzDmtw0XPeQUYyrg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=DFsFg0iPkCNIzJeoVEQGhFhWiHbfZNRtJfngY/gF9M9ilN044H+scF9725XGQ3LrruLNz9zkS53STd1u3mdHsqogbawnOziNC9k7Un4cyTHk/SMWsSvoLlcM6MiVhaMTRjw7grmyk/K15miNpdLl3ntVeoY0HV2g2nqGNbEKHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hC2HIV3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S0Pfh1006996;
	Fri, 28 Mar 2025 09:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6szw+ntz9VDczTlnbIDkDQ5IY9zguQ76RZzJB69Xis=; b=hC2HIV3yU8oM7wWx
	2+h8sQKqaWJxMK3RAgdmL+FYQz5iTHee6JXB6vEMRq5zKTRUs2LG7uHtTltpm5VV
	MuACHJl6AqNCapeQg/uXP9YGOuscMbJ7kl3LSR6GwzmF94VEMJ8veVzZ771tPUBr
	HlFcJB6F5Z+2fKaPjcaQPbKaqjIwqsF+G86xmUls/t9YGdf21+EfusALwOwnRxyF
	z6sooYa6DO6tJ2te1xMMOStNT5geuTisDHFOVdrosXutz7owmmapHtEfSBZF9k1M
	oEo2Y1K+nlPiSeedd9C+vPatAIwkIdWdYmd1739LQDQSYDRLf0r5orfkRRApq1Ag
	5n7xrw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj8123-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 09:44:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52S9i81S006558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 09:44:08 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 02:44:00 -0700
Message-ID: <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
Date: Fri, 28 Mar 2025 15:13:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
Content-Language: en-US
In-Reply-To: <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: crYXy3p45ra23Jg3L43TFwAy1c04P9hK
X-Proofpoint-ORIG-GUID: crYXy3p45ra23Jg3L43TFwAy1c04P9hK
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e66f69 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Bf3lAFkBa5TPtOYeXToA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=990
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280065

> These both above commented from Dmitry I have addressed in the version 2 of patch 7 of the series.
> I have squash patch 8 into patch 7 of version 1 into patch 7 of version 2 of the series.
> 
> 
> Thanks,
> Ayushi

Hi Krzysztof,

I hope this message finds you well. I wanted to follow up on the reply I sent. Your feedback is invaluable to us, and we would greatly appreciate any further insights or comments you might have.

Thanks,
Ayushi



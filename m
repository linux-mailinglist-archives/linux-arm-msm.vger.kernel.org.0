Return-Path: <linux-arm-msm+bounces-29729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37EA9620CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A42A1F25B25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC621598F4;
	Wed, 28 Aug 2024 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QnkD8Hnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5A158D7B;
	Wed, 28 Aug 2024 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829630; cv=none; b=bi/0V65Ww1ICFuPdzrw9BWwKhkoYSwqBX+qLGUKcaRf2gAWP9J1HmzqUrXa5lrQyQ3qkBRwqbFUQSwv7hWsFcfOgOGmlQMzNnJaqegqPwMCAUMP+SiOh6U51E2QnVJ1Rn8gbMe5fRo9VeoW7610PFdrUu6sr9EmiZsh8NYmgm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829630; c=relaxed/simple;
	bh=sNvwrh4SbruHdthg7qp0/oik5512x5fPM7kw+xvOQAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rKYkg1dYOpSjRtbRktyyVNC/4cDsv5bZMx1SQuRqHRC85Tv3fHMebftbUSoCyHURru6csorRmlamvOH86/+wMIHtEI7H9SEYiSqzpc5FcgwAfAR4OMEwCe5wgL6GwGogCZxLenkbbEJFvjNPAPZ3NFl1WV+RGPN/qqsI8RfVa/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QnkD8Hnr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLb6Hw006249;
	Wed, 28 Aug 2024 07:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gufPfIODp9UT0eLlMbvDBX2gkAfHbF5bjVuaCK0nfQ=; b=QnkD8Hnrd1YgxGrJ
	mJR62dGb3E4YBGO1NhA3LsUy1Qt56HZvyDvpKQYzfhxYNyhVhkGaiMCleYTqO/CF
	KaVc9Hdf91lKihTtbbJp35l35alR4RFvoDllLhZjYxF5ylBzCuLVB1rQuhZ/9aZy
	C7Ow6KejrkQP97AsIgyqVe+NHkvm6MoInHgyGgRYRPzRgIX9Y+S1SUDtteqCKtoA
	tjxsVlvn5de2ymUfIQiKVepaUmiJpD6GuBP06mqt5ilu3TS2eJgnInNXAZjzrcMc
	FgBBqQqfbP93MrvTBfEbKf7WMlJiV/zTHvNwNHG16Rv/gwL7v8t8C8J4Fp6oCghk
	McLVwg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv2gytb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:20:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S7KM9g015197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:20:22 GMT
Received: from [10.218.5.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 00:20:17 -0700
Message-ID: <b7328079-3599-473b-92cc-b8704bf1fa75@quicinc.com>
Date: Wed, 28 Aug 2024 12:50:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] clk: qcom: Add support for Video clock controller
 on SA8775P
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-2-77d53c3c0cef@quicinc.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20240816-sa8775p-mm-v3-v1-2-77d53c3c0cef@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uYg7evHYXZRSx8ZDCQrLFy86trAUOoHP
X-Proofpoint-ORIG-GUID: uYg7evHYXZRSx8ZDCQrLFy86trAUOoHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=967 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408280051



On 8/16/2024 12:01 PM, Taniya Das wrote:
> Add support for Video Clock Controller for SA8775P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig           |  11 +
>   drivers/clk/qcom/Makefile          |   1 +
>   drivers/clk/qcom/videocc-sa8775p.c | 576 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 588 insertions(+)

Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Thanks,
Jagadeesh



Return-Path: <linux-arm-msm+bounces-22409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E9905072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85408286660
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9716F16E86E;
	Wed, 12 Jun 2024 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fqm5mmwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C737BB19;
	Wed, 12 Jun 2024 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718188408; cv=none; b=SRzIs8alI+FiKVMaddjfyzCmv47BX35P0bq7kPxrOR6ICPIJuNwkK6HMa7zOZgpIr2UelwPF0N6cqWbFf5PTY4akrU1Ugsa2nxSsl2HO7UWGII5pT221eYkEVnfHA1sEK0sGPgIg7QKJ+Mwz2+rWNrVrZ2qGPcCXTQGmJKPT9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718188408; c=relaxed/simple;
	bh=ASdXSqRcFDtv4s/QXkOD0rx2u5bMuGLH7Iy5d2Q8dhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u+PHtbFMCaAgP0rI6ogToolkC1UNbEGNaWMQS2D/xxJFvS+A6ctoNALNObXisA1WLYmSw0Rt0PRuPYhZ1nmmmhw0bZqNZIfYMlNq4w2VGEkCz2vAbhC9bsxcWFl3dXvcOMhD8v3DDKGqMv7JX3NhQYD6O3MUjr9ZtEGJjkxnt7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fqm5mmwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CA57nA032587;
	Wed, 12 Jun 2024 10:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPXLtaBZREkBKSHgG7dppp2FZNOxxWlO6RPqI9GKYmg=; b=Fqm5mmwAXPdhJuAw
	lYl5YdZHLyNvbGoxB/1wH+seJIvitLAPwknn2pjJs1CUDkVo4aCUUoTDGJUgni3K
	l6ST/gQpRYlFpXF6e6JEO0uXIabmJY57vFRNXF6vra/liX24lUHtcyRXL3dwhJmH
	nteGWl8g4tnR4aX8arOlYWpKnggo/C+RgBE1m3xjHFes2QcaxY9VQ2qjgI7Ve5Gb
	R2TtMJPqozmkgOaUTqxtIYQQStVLyi/3zJeviLTTpLAXoW0y0ZZ6rZP3aqWwo7ZJ
	KhlC3ewzjBHf5D4W689eHFuCVSj9qseGkQNF0L0qefv88ajx094I0CYhjrWI27R8
	d5GlPw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypp87twuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:33:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CAXLwR020724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:33:21 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 03:33:17 -0700
Message-ID: <fc2c7682-a091-4605-8c4c-a4f68a079b08@quicinc.com>
Date: Wed, 12 Jun 2024 16:03:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add support for SA8775P Multimedia clock
 controllers
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240612-lemans-v2-split-mm-series-12-6-v2-0-056e828b0001@quicinc.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240612-lemans-v2-split-mm-series-12-6-v2-0-056e828b0001@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EdAq0xX-2gRdKdohlGJKtm01YdH29Nw3
X-Proofpoint-ORIG-GUID: EdAq0xX-2gRdKdohlGJKtm01YdH29Nw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120076


Please ignore this series, something got messed up in my b4.

On 6/12/2024 3:36 PM, Taniya Das wrote:
> Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P
> platform.
> 
> These multimedia clock controller and device tree patches are split
> from the below series.
> https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/
> 
> Changes in this series compared to above series:
>   [PATCH 1/8]: Updated bindings to reference qcom,gcc.yaml
>   [PATCH 3/8]: Updated bindings to reference qcom,gcc.yaml
>   [PATCH 5/8]: Updated bindings to reference qcom,gcc.yaml
>   [PATCH 7/8]: Split updating sleep_clk frequency to separate patch
>   [PATCH 8/8]: Newly added to update sleep_clk frequency to 32000
> 
> Taniya Das (8):
>    dt-bindings: clock: qcom: Add SA8775P video clock controller
>    clk: qcom: Add support for Video clock controller on SA8775P
>    dt-bindings: clock: qcom: Add SA8775P camera clock controller
>    clk: qcom: Add support for Camera Clock Controller on SA8775P
>    dt-bindings: clock: qcom: Add SA8775P display clock controllers
>    clk: qcom: Add support for Display clock Controllers on SA8775P
>    arm64: dts: qcom: Add support for multimedia clock controllers
>    arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P
> 
>   .../bindings/clock/qcom,sa8775p-camcc.yaml    |   62 +
>   .../bindings/clock/qcom,sa8775p-dispcc.yaml   |   79 +
>   .../bindings/clock/qcom,sa8775p-videocc.yaml  |   62 +
>   arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   59 +
>   drivers/clk/qcom/Kconfig                      |   31 +
>   drivers/clk/qcom/Makefile                     |    3 +
>   drivers/clk/qcom/camcc-sa8775p.c              | 1849 +++++++++++++++++
>   drivers/clk/qcom/dispcc0-sa8775p.c            | 1481 +++++++++++++
>   drivers/clk/qcom/dispcc1-sa8775p.c            | 1481 +++++++++++++
>   drivers/clk/qcom/videocc-sa8775p.c            |  576 +++++
>   .../dt-bindings/clock/qcom,sa8775p-camcc.h    |  107 +
>   .../dt-bindings/clock/qcom,sa8775p-dispcc.h   |   87 +
>   .../dt-bindings/clock/qcom,sa8775p-videocc.h  |   47 +
>   14 files changed, 5925 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>   create mode 100644 drivers/clk/qcom/camcc-sa8775p.c
>   create mode 100644 drivers/clk/qcom/dispcc0-sa8775p.c
>   create mode 100644 drivers/clk/qcom/dispcc1-sa8775p.c
>   create mode 100644 drivers/clk/qcom/videocc-sa8775p.c
>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h
> 
> --
> 2.43.0
> 
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20240612-lemans-v2-split-mm-series-12-6-v1-0-178429d989fe@quicinc.com
> 
> ---
> Taniya Das (8):
>        dt-bindings: clock: qcom: Add SA8775P video clock controller
>        clk: qcom: Add support for Video clock controller on SA8775P
>        dt-bindings: clock: qcom: Add SA8775P camera clock controller
>        clk: qcom: Add support for Camera Clock Controller on SA8775P
>        dt-bindings: clock: qcom: Add SA8775P display clock controllers
>        clk: qcom: Add support for Display clock Controllers on SA8775P
>        arm64: dts: qcom: Add support for multimedia clock controllers
>        arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P
> 
>   .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
>   .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 +
>   .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
>   arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |    2 +-
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   59 +
>   drivers/clk/qcom/Kconfig                           |   31 +
>   drivers/clk/qcom/Makefile                          |    3 +
>   drivers/clk/qcom/camcc-sa8775p.c                   | 1849 ++++++++++++++++++++
>   drivers/clk/qcom/dispcc0-sa8775p.c                 | 1481 ++++++++++++++++
>   drivers/clk/qcom/dispcc1-sa8775p.c                 | 1481 ++++++++++++++++
>   drivers/clk/qcom/videocc-sa8775p.c                 |  576 ++++++
>   include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  107 ++
>   include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 +
>   include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
>   14 files changed, 5925 insertions(+), 1 deletion(-)
> ---
> base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
> change-id: 20240612-lemans-v2-split-mm-series-12-6-42a28e9fcafe
> 
> Best regards,

-- 
Thanks & Regards,
Taniya Das.

